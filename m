Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B3A0C433F5
	for <io-uring@archiver.kernel.org>; Tue, 22 Feb 2022 09:36:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbiBVJhS (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Tue, 22 Feb 2022 04:37:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbiBVJhS (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Tue, 22 Feb 2022 04:37:18 -0500
Received: from out30-44.freemail.mail.aliyun.com (out30-44.freemail.mail.aliyun.com [115.124.30.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99CF2A6502
        for <io-uring@vger.kernel.org>; Tue, 22 Feb 2022 01:36:51 -0800 (PST)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R711e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04426;MF=haoxu@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0V5CZHtJ_1645522599;
Received: from hao-A29R.hz.ali.com(mailfrom:haoxu@linux.alibaba.com fp:SMTPD_---0V5CZHtJ_1645522599)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 22 Feb 2022 17:36:49 +0800
From:   Hao Xu <haoxu@linux.alibaba.com>
To:     io-uring@vger.kernel.org
Cc:     Jens Axboe <axboe@kernel.dk>,
        Pavel Begunkov <asml.silence@gmail.com>,
        Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH] io_uring: remove definite false if expression
Date:   Tue, 22 Feb 2022 17:36:39 +0800
Message-Id: <20220222093639.363651-1-haoxu@linux.alibaba.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

if file->f_flags has O_NONBLOCK, io_file_supports_nowait() returns true
which means the if condition in this patch isn't necessary.

Signed-off-by: Hao Xu <haoxu@linux.alibaba.com>
---
 fs/io_uring.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/fs/io_uring.c b/fs/io_uring.c
index a7412f6862fc..b4dacb5eeecb 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -3034,12 +3034,10 @@ static int io_prep_rw(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 		return ret;
 
 	/*
-	 * If the file is marked O_NONBLOCK, still allow retry for it if it
-	 * supports async. Otherwise it's impossible to use O_NONBLOCK files
-	 * reliably. If not, or it IOCB_NOWAIT is set, don't retry.
+	 * If the file is marked O_NONBLOCK, still allow retry for it.
+	 * If IOCB_NOWAIT is set, don't retry.
 	 */
-	if ((kiocb->ki_flags & IOCB_NOWAIT) ||
-	    ((file->f_flags & O_NONBLOCK) && !io_file_supports_nowait(req)))
+	if (kiocb->ki_flags & IOCB_NOWAIT)
 		req->flags |= REQ_F_NOWAIT;
 
 	if (ctx->flags & IORING_SETUP_IOPOLL) {

base-commit: 9e9d83faa9f59266aa772148e32c265c8ad194d3
-- 
2.25.1

