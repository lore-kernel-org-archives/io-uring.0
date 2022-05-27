Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC0AC433F5
	for <io-uring@archiver.kernel.org>; Fri, 27 May 2022 02:54:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231913AbiE0CyF (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Thu, 26 May 2022 22:54:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231145AbiE0CyF (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Thu, 26 May 2022 22:54:05 -0400
Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6B5CE64F2
        for <io-uring@vger.kernel.org>; Thu, 26 May 2022 19:54:03 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=xiaoguang.wang@linux.alibaba.com;NM=1;PH=DS;RN=3;SR=0;TI=SMTPD_---0VEV9cRL_1653620040;
Received: from localhost(mailfrom:xiaoguang.wang@linux.alibaba.com fp:SMTPD_---0VEV9cRL_1653620040)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 27 May 2022 10:54:01 +0800
From:   Xiaoguang Wang <xiaoguang.wang@linux.alibaba.com>
To:     io-uring@vger.kernel.org
Cc:     axboe@kernel.dk, asml.silence@gmail.com
Subject: [PATCH] io_uring: ensure fput() called correspondingly when direct install fails
Date:   Fri, 27 May 2022 10:54:00 +0800
Message-Id: <20220527025400.51048-1-xiaoguang.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.14.4.44.g2045bb6
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

io_fixed_fd_install() may fail for short of free fixed file bitmap,
in this case, need to call fput() correspondingly.

Signed-off-by: Xiaoguang Wang <xiaoguang.wang@linux.alibaba.com>
---
 fs/io_uring.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/io_uring.c b/fs/io_uring.c
index d50bbf8de4fb..0190947fb1bf 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -5438,6 +5438,10 @@ static int io_file_bitmap_get(struct io_ring_ctx *ctx)
 	return -ENFILE;
 }
 
+/*
+ * Note when io_fixed_fd_install() returns error value, it will ensure
+ * fput() is called correspondingly.
+ */
 static int io_fixed_fd_install(struct io_kiocb *req, unsigned int issue_flags,
 			       struct file *file, unsigned int file_slot)
 {
@@ -5450,6 +5454,7 @@ static int io_fixed_fd_install(struct io_kiocb *req, unsigned int issue_flags,
 		ret = io_file_bitmap_get(ctx);
 		if (unlikely(ret < 0)) {
 			io_ring_submit_unlock(ctx, issue_flags);
+			fput(file);
 			return ret;
 		}
 
-- 
2.14.4.44.g2045bb6

