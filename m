Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A4FCCA487
	for <io-uring@archiver.kernel.org>; Mon, 13 Jun 2022 13:20:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359469AbiFMNUx (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Mon, 13 Jun 2022 09:20:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377402AbiFMNUV (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Mon, 13 Jun 2022 09:20:21 -0400
Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAE896AA74
        for <io-uring@vger.kernel.org>; Mon, 13 Jun 2022 04:23:34 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1655119371;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=hoVV5CsPX9QFfOzGFZaQhE3Q39rRY8P4kWYP0uUhRtM=;
        b=qTRh9PheBlcKodSV8okQmTDEVISS+xGod81C15FFSY2tcx1LxjrF4kVXtkIAzyu7yAXbcE
        JGGfdgtTYGlOMh44N2fRj+Ky32oByCS4grl1mMA8/b07l4gkinD2wjl85I8Qw4v32Fuy75
        WXN/hsWMxnjKpCIQ/ZYT6c7aaTGofWA=
From:   Hao Xu <hao.xu@linux.dev>
To:     io-uring@vger.kernel.org
Cc:     Jens Axboe <axboe@kernel.dk>,
        Pavel Begunkov <asml.silence@gmail.com>
Subject: [PATCH] io_uring: remove duplicate cqe skip check
Date:   Mon, 13 Jun 2022 19:22:31 +0800
Message-Id: <20220613112231.998738-1-hao.xu@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

From: Hao Xu <howeyxu@tencent.com>

Remove duplicate cqe skip check in __io_fill_cqe32_req()

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 io_uring/io_uring.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 1572ebe3cff1..6a94d1682aaf 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -1194,8 +1194,6 @@ static inline void __io_fill_cqe32_req(struct io_kiocb *req, u64 extra1,
 
 	if (WARN_ON_ONCE(!(ctx->flags & IORING_SETUP_CQE32)))
 		return;
-	if (req->flags & REQ_F_CQE_SKIP)
-		return;
 
 	trace_io_uring_complete(ctx, req, req->cqe.user_data, req->cqe.res,
 				req->cqe.flags, extra1, extra2);

base-commit: d8271bf021438f468dab3cd84fe5279b5bbcead8
-- 
2.25.1

