Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E76AEC433EF
	for <io-uring@archiver.kernel.org>; Sat, 11 Jun 2022 12:22:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231831AbiFKMWr (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Sat, 11 Jun 2022 08:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231897AbiFKMWq (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Sat, 11 Jun 2022 08:22:46 -0400
Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 363DC23149
        for <io-uring@vger.kernel.org>; Sat, 11 Jun 2022 05:22:46 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1654950164;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=L1wIvv3zLWMR31Nd8s1DbvuiWn532QeRZmT5/FrvJdE=;
        b=HLzR7dAf2nMidWb+ESDtsv1+ReSj2HWXZNl773sIvuBScjH6ajiCBIGoPjHkIfGzu0jpW3
        VMipxDXTwEZTndxZOo5CQgN5I3OZzUYRaGzzIkhtbMfkUFSr85aBUqItobyfD/hcDoIlw7
        9eFAMIE5cQfqNpS7hQTc05yWx4ICHjE=
From:   Hao Xu <hao.xu@linux.dev>
To:     io-uring@vger.kernel.org
Cc:     Jens Axboe <axboe@kernel.dk>,
        Pavel Begunkov <asml.silence@gmail.com>
Subject: [PATCH 5.19 3/6] io_uring: openclose: fix bug of unexpected return value in IORING_CLOSE_FD_AND_FILE_SLOT mode
Date:   Sat, 11 Jun 2022 20:22:21 +0800
Message-Id: <20220611122224.941800-3-hao.xu@linux.dev>
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

In IORING_CLOSE_FD_AND_FILE_SLOT mode, if we successfully close fixed
file but fails in close->fd >= fdt->max_fds check, cqe-res = 0 is
returned, which should be -EBADF.

Fixes: a7c41b4687f5 ("io_uring: let IORING_OP_FILES_UPDATE support choosing fixed file slots")
Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 io_uring/openclose.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/io_uring/openclose.c b/io_uring/openclose.c
index b35bf5f66dd9..4eb1f23e028a 100644
--- a/io_uring/openclose.c
+++ b/io_uring/openclose.c
@@ -248,7 +248,7 @@ int io_close(struct io_kiocb *req, unsigned int issue_flags)
 	struct io_close *close = io_kiocb_to_cmd(req);
 	struct fdtable *fdt;
 	struct file *file;
-	int ret = -EBADF;
+	int ret;
 
 	if (close->file_slot) {
 		ret = io_close_fixed(req, issue_flags);
@@ -256,6 +256,7 @@ int io_close(struct io_kiocb *req, unsigned int issue_flags)
 			goto err;
 	}
 
+	ret = -EBADF;
 	spin_lock(&files->file_lock);
 	fdt = files_fdtable(files);
 	if (close->fd >= fdt->max_fds) {
-- 
2.25.1

