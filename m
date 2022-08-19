Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E71C32773
	for <io-uring@archiver.kernel.org>; Fri, 19 Aug 2022 15:30:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348983AbiHSPan (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Fri, 19 Aug 2022 11:30:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349752AbiHSPaa (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Fri, 19 Aug 2022 11:30:30 -0400
Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEF0610097A
        for <io-uring@vger.kernel.org>; Fri, 19 Aug 2022 08:30:28 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1660923027;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=564pKdunX04HqFVimIx2VcnHHMvL0ZSIADakfvP38+s=;
        b=GHrLN/s0I/+FMnAb2CAuCkp/Cr+xTV35REnonJVn4sOBMnihguZ+Kk+U2O/eRVXJZwD+Ot
        1QIyd0s3oWRYc/ZcJ8e8wiNYfQ7gi8U5Y4jDttrDroy3jwlgRl9UoCUItxKBDSRfu0tWyA
        +i9MN7cccNlTd6T95un4k0xdDRh4xtU=
From:   Hao Xu <hao.xu@linux.dev>
To:     io-uring@vger.kernel.org
Cc:     Jens Axboe <axboe@kernel.dk>,
        Pavel Begunkov <asml.silence@gmail.com>,
        Ingo Molnar <mingo@kernel.org>,
        Wanpeng Li <wanpengli@tencent.com>
Subject: [PATCH 19/19] io_uring: wire up uringlet
Date:   Fri, 19 Aug 2022 23:27:38 +0800
Message-Id: <20220819152738.1111255-20-hao.xu@linux.dev>
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

Enable the uringlet mode.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 io_uring/io_uring.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 7ebc83b3a33f..72474b512063 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -3313,8 +3313,6 @@ static __cold int io_uring_create(unsigned entries, struct io_uring_params *p,
 	struct file *file;
 	int ret;
 
-	if (p->flags & IORING_SETUP_URINGLET)
-		return -EINVAL;
 	if (!entries)
 		return -EINVAL;
 	if (entries > IORING_MAX_ENTRIES) {
-- 
2.25.1

