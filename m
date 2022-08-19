Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35446C32771
	for <io-uring@archiver.kernel.org>; Fri, 19 Aug 2022 15:30:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349346AbiHSPaK (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Fri, 19 Aug 2022 11:30:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349193AbiHSPaJ (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Fri, 19 Aug 2022 11:30:09 -0400
Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DF91A1BF
        for <io-uring@vger.kernel.org>; Fri, 19 Aug 2022 08:30:08 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1660923007;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tnOpeS2ajJ798g1WuvV3vR2mYcvGc8pJKjoqStH2WY0=;
        b=oNLfQZptiqvgxXNCEHgQxBtAXxHOEBgYrynISCWFW4/J4oJlyW1mmghGA2V8tfJ2TBQqhs
        rsdGGMWIYj/ss0DKPXi6tEHPGJwB2sumb788oXLMhBtzcMMHd5QKk2xS3CXgAolr/Dbwgf
        5S2uRCugwHgPKTZe/t55oZxoJgGVifE=
From:   Hao Xu <hao.xu@linux.dev>
To:     io-uring@vger.kernel.org
Cc:     Jens Axboe <axboe@kernel.dk>,
        Pavel Begunkov <asml.silence@gmail.com>,
        Ingo Molnar <mingo@kernel.org>,
        Wanpeng Li <wanpengli@tencent.com>
Subject: [PATCH 14/19] io_uring: modify issue_flags for uringlet mode
Date:   Fri, 19 Aug 2022 23:27:33 +0800
Message-Id: <20220819152738.1111255-15-hao.xu@linux.dev>
In-Reply-To: <20220819152738.1111255-1-hao.xu@linux.dev>
References: <20220819152738.1111255-1-hao.xu@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

From: Hao Xu <howeyxu@tencent.com>

We don't need IO_URING_F_NONBLOCK in uringlet mode.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 io_uring/io_uring.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 67d02dc16ea5..0c14b90b8b47 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -1751,8 +1751,12 @@ static inline void io_queue_sqe(struct io_kiocb *req)
 	__must_hold(&req->ctx->uring_lock)
 {
 	int ret;
+	unsigned int issue_flags = IO_URING_F_COMPLETE_DEFER;
 
-	ret = io_issue_sqe(req, IO_URING_F_NONBLOCK|IO_URING_F_COMPLETE_DEFER);
+	if (!(req->ctx->flags & IORING_SETUP_URINGLET))
+		issue_flags |= IO_URING_F_NONBLOCK;
+
+	ret = io_issue_sqe(req, issue_flags);
 
 	/*
 	 * We async punt it if the file wasn't marked NOWAIT, or if the file
-- 
2.25.1

