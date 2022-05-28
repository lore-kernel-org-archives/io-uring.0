Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02438C433F5
	for <io-uring@archiver.kernel.org>; Sat, 28 May 2022 01:51:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235475AbiE1BvP (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Fri, 27 May 2022 21:51:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231386AbiE1BvP (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Fri, 27 May 2022 21:51:15 -0400
Received: from out30-57.freemail.mail.aliyun.com (out30-57.freemail.mail.aliyun.com [115.124.30.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C2A339830
        for <io-uring@vger.kernel.org>; Fri, 27 May 2022 18:51:12 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R391e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04395;MF=xiaoguang.wang@linux.alibaba.com;NM=1;PH=DS;RN=3;SR=0;TI=SMTPD_---0VEZnDx9_1653702669;
Received: from localhost(mailfrom:xiaoguang.wang@linux.alibaba.com fp:SMTPD_---0VEZnDx9_1653702669)
          by smtp.aliyun-inc.com(127.0.0.1);
          Sat, 28 May 2022 09:51:10 +0800
From:   Xiaoguang Wang <xiaoguang.wang@linux.alibaba.com>
To:     io-uring@vger.kernel.org
Cc:     axboe@kernel.dk, asml.silence@gmail.com
Subject: [PATCH v3] io_uring: defer alloc_hint update to io_file_bitmap_set()
Date:   Sat, 28 May 2022 09:51:09 +0800
Message-Id: <20220528015109.48039-1-xiaoguang.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.14.4.44.g2045bb6
In-Reply-To: <587a9737-9979-302e-4484-dfdbebe29d78@kernel.dk>
References: <587a9737-9979-302e-4484-dfdbebe29d78@kernel.dk>
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

io_file_bitmap_get() returns a free bitmap slot, but if it isn't
used later, such as io_queue_rsrc_removal() returns error, in this
case, we should not update alloc_hint at all, which still should
be considered as a valid candidate for next io_file_bitmap_get()
calls.

To fix this issue, only update alloc_hint in io_file_bitmap_set().

Signed-off-by: Xiaoguang Wang <xiaoguang.wang@linux.alibaba.com>
---
v3:
  Revert io_file_bitmap_set() type changes.
V2:
  Delete unnecessary check against to alloc_hint.
---
 fs/io_uring.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/fs/io_uring.c b/fs/io_uring.c
index ff50e5f1753d..8f476e8760bf 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -5419,15 +5419,11 @@ static int io_file_bitmap_get(struct io_ring_ctx *ctx)
 	unsigned long nr = ctx->nr_user_files;
 	int ret;
 
-	if (table->alloc_hint >= nr)
-		table->alloc_hint = 0;
-
 	do {
 		ret = find_next_zero_bit(table->bitmap, nr, table->alloc_hint);
-		if (ret != nr) {
-			table->alloc_hint = ret + 1;
+		if (ret != nr)
 			return ret;
-		}
+
 		if (!table->alloc_hint)
 			break;
 
@@ -9654,8 +9650,7 @@ static inline void io_file_bitmap_set(struct io_file_table *table, int bit)
 {
 	WARN_ON_ONCE(test_bit(bit, table->bitmap));
 	__set_bit(bit, table->bitmap);
-	if (bit == table->alloc_hint)
-		table->alloc_hint++;
+	table->alloc_hint = bit + 1;
 }
 
 static inline void io_file_bitmap_clear(struct io_file_table *table, int bit)
-- 
2.14.4.44.g2045bb6

