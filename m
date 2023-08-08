Return-Path: <io-uring-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1EE0C04A6A
	for <io-uring@archiver.kernel.org>; Tue,  8 Aug 2023 16:24:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbjHHQYM (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Tue, 8 Aug 2023 12:24:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbjHHQWt (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Tue, 8 Aug 2023 12:22:49 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40C3CA25F;
        Tue,  8 Aug 2023 08:49:31 -0700 (PDT)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RKxPl1T8JztRbL;
        Tue,  8 Aug 2023 23:07:39 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 8 Aug
 2023 23:11:07 +0800
From:   Yue Haibing <yuehaibing@huawei.com>
To:     <axboe@kernel.dk>, <asml.silence@gmail.com>
CC:     <io-uring@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <yuehaibing@huawei.com>
Subject: [PATCH -next] io_uring/rsrc: Remove unused declaration io_rsrc_put_tw()
Date:   Tue, 8 Aug 2023 23:10:58 +0800
Message-ID: <20230808151058.4572-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

Commit 36b9818a5a84 ("io_uring/rsrc: don't offload node free")
removed the implementation but leave declaration.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 io_uring/rsrc.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/io_uring/rsrc.h b/io_uring/rsrc.h
index 0a8a95e9b99e..8afa9ec66a55 100644
--- a/io_uring/rsrc.h
+++ b/io_uring/rsrc.h
@@ -57,7 +57,6 @@ struct io_mapped_ubuf {
 	struct bio_vec	bvec[];
 };
 
-void io_rsrc_put_tw(struct callback_head *cb);
 void io_rsrc_node_ref_zero(struct io_rsrc_node *node);
 void io_rsrc_node_destroy(struct io_ring_ctx *ctx, struct io_rsrc_node *ref_node);
 struct io_rsrc_node *io_rsrc_node_alloc(struct io_ring_ctx *ctx);
-- 
2.34.1

