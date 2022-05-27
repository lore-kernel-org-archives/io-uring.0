Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C9FC433EF
	for <io-uring@archiver.kernel.org>; Fri, 27 May 2022 16:53:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235309AbiE0Qxm (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Fri, 27 May 2022 12:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232531AbiE0Qxj (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Fri, 27 May 2022 12:53:39 -0400
Received: from out199-3.us.a.mail.aliyun.com (out199-3.us.a.mail.aliyun.com [47.90.199.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9C81ED70D
        for <io-uring@vger.kernel.org>; Fri, 27 May 2022 09:53:37 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R461e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=alimailimapcm10staff010182156082;MF=xiaoguang.wang@linux.alibaba.com;NM=1;PH=DS;RN=3;SR=0;TI=SMTPD_---0VEXwEnq_1653670413;
Received: from localhost(mailfrom:xiaoguang.wang@linux.alibaba.com fp:SMTPD_---0VEXwEnq_1653670413)
          by smtp.aliyun-inc.com(127.0.0.1);
          Sat, 28 May 2022 00:53:33 +0800
From:   Xiaoguang Wang <xiaoguang.wang@linux.alibaba.com>
To:     io-uring@vger.kernel.org
Cc:     axboe@kernel.dk, asml.silence@gmail.com
Subject: [PATCH 0/2] two bug fixes about direct fd install
Date:   Sat, 28 May 2022 00:53:31 +0800
Message-Id: <20220527165333.55212-1-xiaoguang.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.14.4.44.g2045bb6
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

Both two patches have passed liburing test.

Xiaoguang Wang (2):
  io_uring: fix file leaks around io_fixed_fd_install()
  io_uring: defer alloc_hint update to io_file_bitmap_set()

 fs/io_uring.c | 100 ++++++++++++++++++++++++++--------------------------------
 1 file changed, 45 insertions(+), 55 deletions(-)

-- 
2.14.4.44.g2045bb6

