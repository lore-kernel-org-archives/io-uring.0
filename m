Return-Path: <io-uring-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C63C6FD1F
	for <io-uring@archiver.kernel.org>; Wed, 15 Mar 2023 01:41:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbjCOBls (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Tue, 14 Mar 2023 21:41:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjCOBls (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Tue, 14 Mar 2023 21:41:48 -0400
Received: from mail.nfschina.com (unknown [42.101.60.237])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AF2C37B7C;
        Tue, 14 Mar 2023 18:41:47 -0700 (PDT)
Received: from localhost (unknown [127.0.0.1])
        by mail.nfschina.com (Postfix) with ESMTP id E44761A00A95;
        Wed, 15 Mar 2023 09:41:45 +0800 (CST)
X-Virus-Scanned: amavisd-new at nfschina.com
Received: from mail.nfschina.com ([127.0.0.1])
        by localhost (localhost.localdomain [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id cWTD41PXQbL2; Wed, 15 Mar 2023 09:41:44 +0800 (CST)
Received: from localhost.localdomain (unknown [219.141.250.2])
        (Authenticated sender: zeming@nfschina.com)
        by mail.nfschina.com (Postfix) with ESMTPA id 4E30C1A0091B;
        Wed, 15 Mar 2023 09:41:44 +0800 (CST)
From:   Li zeming <zeming@nfschina.com>
To:     axboe@kernel.dk, asml.silence@gmail.com
Cc:     io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
        Li zeming <zeming@nfschina.com>
Subject: [PATCH] io_uring: rsrc: Optimize return value variable 'ret'
Date:   Fri, 17 Mar 2023 02:13:03 +0800
Message-Id: <20230316181303.6583-1-zeming@nfschina.com>
X-Mailer: git-send-email 2.18.2
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

The function returns here and returns ret directly. It may look better.

Signed-off-by: Li zeming <zeming@nfschina.com>
---
 io_uring/rsrc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 056f40946ff6..55dc2c505f8a 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -415,11 +415,11 @@ __cold static int io_rsrc_data_alloc(struct io_ring_ctx *ctx,
 
 	data = kzalloc(sizeof(*data), GFP_KERNEL);
 	if (!data)
-		return -ENOMEM;
+		return ret;
 	data->tags = (u64 **)io_alloc_page_table(nr * sizeof(data->tags[0][0]));
 	if (!data->tags) {
 		kfree(data);
-		return -ENOMEM;
+		return ret;
 	}
 
 	data->nr = nr;
-- 
2.18.2

