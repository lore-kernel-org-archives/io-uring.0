Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D801ACCA480
	for <io-uring@archiver.kernel.org>; Tue, 14 Jun 2022 16:52:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349778AbiFNQwb (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Tue, 14 Jun 2022 12:52:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348588AbiFNQwR (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Tue, 14 Jun 2022 12:52:17 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE25145509
        for <io-uring@vger.kernel.org>; Tue, 14 Jun 2022 09:51:55 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id c130-20020a1c3588000000b0039c6fd897b4so3524614wma.4
        for <io-uring@vger.kernel.org>; Tue, 14 Jun 2022 09:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6Sdy9W1dqpA8hBtiizeFNtMvJps3otHcP3u3saZQJiQ=;
        b=caYp88TJqH6K3y6uqREhVbzqymFvwQriURoXXk4/+Ne16HqA+gdVfD0AaIOPYNLKRf
         foVfuEfoGaXnmx69YsXl432DZnt1xVS7UmJc/FWx6CQRnbT8xUeKTvM1T5oPBwuNGiPw
         5mTlm2zn36Q/BQhKl8PRhpoW2nTIvS6swW5f2/pahDUFpxe8ExKQdMhnX57PZJbU95xw
         P8MDu+cQjYgY3wt4I+Px/Q9LUkVk4iT8pWWVCJznuQ6uwdYIeanbcdm/cH9s9b6mfYne
         Hu5Xll4ExTDrkq68vAIe4kqBou5ltWBdjc4t3HC1KLlbxct1NNK+Cm7isMHf+xhbNMer
         kNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6Sdy9W1dqpA8hBtiizeFNtMvJps3otHcP3u3saZQJiQ=;
        b=6dDhXN70SvgDTf0yGqfVMNWfSkF/4aKBlWyRJwMdltney2w3fIftgVJHvQmat1JVzs
         Zd7M5cedBerne0sTprZfqXfe8/5IAbmpCU2mH4UUDmihHOp6KG107RQrun5gJdT6BxOD
         VYgn2GsyUnMf2uFJoqka4v3sytBXA/k/AAiJYnM5arDLT2dML85XYFIs9MRwwb8OGc39
         QsILQabpYTLterAQO6h48GuDuC1Y8j8/vBapI315MhwjZMoJUXcuCTotThcYu6ptGTFJ
         hoHdrAduyD0P/ANY75IMsU6MOfYJOMPz7xyQt2b+zWKwwShgtiWljs6uf83NGBXAKXJm
         bxPg==
X-Gm-Message-State: AOAM533bnisORn0HVdbJPoomZJpK9YhOgwPC/tbsQgnVGy61/RPcmyvc
        JrraMOyymx4K4DIc8BMmKVD5XYDKQ80qCA==
X-Google-Smtp-Source: ABdhPJyMfTgPp4EadIGsSU3zeR/ljcSe5xjL/ixHceF8NClfhN4FJirt3Me1umrU/rRT6S1uGeLFlw==
X-Received: by 2002:a05:600c:3d8e:b0:39c:573b:3079 with SMTP id bi14-20020a05600c3d8e00b0039c573b3079mr5276062wmb.131.1655225514239;
        Tue, 14 Jun 2022 09:51:54 -0700 (PDT)
Received: from 127.0.0.1localhost (188.28.125.106.threembb.co.uk. [188.28.125.106])
        by smtp.gmail.com with ESMTPSA id z16-20020adfec90000000b0020cff559b1dsm12648966wrn.47.2022.06.14.09.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 09:51:53 -0700 (PDT)
From:   Pavel Begunkov <asml.silence@gmail.com>
To:     io-uring@vger.kernel.org
Cc:     Jens Axboe <axboe@kernel.dk>, asml.silence@gmail.com
Subject: [PATCH 5.19 2/3] Revert "io_uring: add buffer selection support to IORING_OP_NOP"
Date:   Tue, 14 Jun 2022 17:51:17 +0100
Message-Id: <c5012098ca6b51dfbdcb190f8c4e3c0bf1c965dc.1655224415.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1655224415.git.asml.silence@gmail.com>
References: <cover.1655224415.git.asml.silence@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

This reverts commit 3d200242a6c968af321913b635fc4014b238cba4.

Buffer selection with nops was used for debugging and benchmarking but
is useless in real life. Let's revert it before it's released.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 fs/io_uring.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/fs/io_uring.c b/fs/io_uring.c
index bf556f77d4ab..1b95c6750a81 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -1114,7 +1114,6 @@ static const struct io_op_def io_op_defs[] = {
 	[IORING_OP_NOP] = {
 		.audit_skip		= 1,
 		.iopoll			= 1,
-		.buffer_select		= 1,
 	},
 	[IORING_OP_READV] = {
 		.needs_file		= 1,
@@ -5269,19 +5268,7 @@ static int io_nop_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
  */
 static int io_nop(struct io_kiocb *req, unsigned int issue_flags)
 {
-	unsigned int cflags;
-	void __user *buf;
-
-	if (req->flags & REQ_F_BUFFER_SELECT) {
-		size_t len = 1;
-
-		buf = io_buffer_select(req, &len, issue_flags);
-		if (!buf)
-			return -ENOBUFS;
-	}
-
-	cflags = io_put_kbuf(req, issue_flags);
-	__io_req_complete(req, issue_flags, 0, cflags);
+	__io_req_complete(req, issue_flags, 0, 0);
 	return 0;
 }
 
-- 
2.36.1

