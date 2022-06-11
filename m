Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F1BC43334
	for <io-uring@archiver.kernel.org>; Sat, 11 Jun 2022 12:30:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbiFKMaI (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Sat, 11 Jun 2022 08:30:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbiFKMaH (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Sat, 11 Jun 2022 08:30:07 -0400
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4267C60FB
        for <io-uring@vger.kernel.org>; Sat, 11 Jun 2022 05:30:06 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1654950604;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=faVsmm7SshsrJAyY/i6h9TMbvPwTJcP4C9gciMxrHYQ=;
        b=EgW/8CukXBr17W2HUep3qaXQyBUiYIrfZDF+zbrjQFKt46e0fySXo7YvnT/I9UIja3J9vH
        +9JEbsJin4fkI59T6TX1oQzftYnHt2sdYYRPifJo0UBfiayzuH1kiKuF70wzpmF7zVWffi
        SE++mZBIljG8RTpzlueV57ArDADVfWw=
From:   Hao Xu <hao.xu@linux.dev>
To:     io-uring@vger.kernel.org
Cc:     Jens Axboe <axboe@kernel.dk>,
        Pavel Begunkov <asml.silence@gmail.com>
Subject: [PATCH 5.19 6/6] io_uring: kbuf: fix bug of not consuming ring buffer in partial io case
Date:   Sat, 11 Jun 2022 20:29:52 +0800
Message-Id: <20220611122952.942096-1-hao.xu@linux.dev>
In-Reply-To: <20220611122224.941800-1-hao.xu@linux.dev>
References: <20220611122224.941800-1-hao.xu@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

From: Hao Xu <howeyxu@tencent.com>

When we use ring-mapped provided buffer, we should consume it before
arm poll if partial io has been done. Otherwise the buffer may be used
by other requests and thus we lost the data.

Fixes: c7fb19428d67 ("io_uring: add support for ring mapped supplied buffers")
Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 io_uring/kbuf.c |  9 +++++++--
 io_uring/kbuf.h | 10 ++++++++--
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/io_uring/kbuf.c b/io_uring/kbuf.c
index d2b2b4728381..0680b63af1d2 100644
--- a/io_uring/kbuf.c
+++ b/io_uring/kbuf.c
@@ -49,8 +49,13 @@ void __io_kbuf_recycle(struct io_kiocb *req, unsigned issue_flags)
 	 */
 	if (req->flags & REQ_F_BUFFER_RING) {
 		if (req->buf_list) {
-			req->buf_index = req->buf_list->bgid;
-			req->flags &= ~REQ_F_BUFFER_RING;
+			if (req->flags & REQ_F_PARTIAL_IO) {
+				req->buf_list->head++;
+				req->buf_list = NULL;
+			} else {
+				req->buf_index = req->buf_list->bgid;
+				req->flags &= ~REQ_F_BUFFER_RING;
+			}
 		}
 		return;
 	}
diff --git a/io_uring/kbuf.h b/io_uring/kbuf.h
index b58d9d20c97e..9ecb175e60a9 100644
--- a/io_uring/kbuf.h
+++ b/io_uring/kbuf.h
@@ -58,8 +58,14 @@ static inline void io_kbuf_recycle(struct io_kiocb *req, unsigned issue_flags)
 {
 	if (!(req->flags & (REQ_F_BUFFER_SELECTED|REQ_F_BUFFER_RING)))
 		return;
-	/* don't recycle if we already did IO to this buffer */
-	if (req->flags & REQ_F_PARTIAL_IO)
+	/*
+	 * For legacy provided buffer mode, don't recycle if we already did
+	 * IO to this buffer. For ring-mapped provided buffer mode, we should
+	 * increment ring->head to explicitly monopolize the buffer to avoid
+	 * multiple use.
+	 */
+	if ((req->flags & REQ_F_BUFFER_SELECTED) &&
+	    (req->flags & REQ_F_PARTIAL_IO))
 		return;
 	__io_kbuf_recycle(req, issue_flags);
 }
-- 
2.25.1

