Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3433AC43334
	for <io-uring@archiver.kernel.org>; Wed, 29 Jun 2022 17:59:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232198AbiF2R75 (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Wed, 29 Jun 2022 13:59:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232191AbiF2R7z (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Wed, 29 Jun 2022 13:59:55 -0400
Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1491DB1
        for <io-uring@vger.kernel.org>; Wed, 29 Jun 2022 10:59:54 -0700 (PDT)
Received: from integral2.. (unknown [180.245.197.13])
        by gnuweeb.org (Postfix) with ESMTPSA id EEC10800D8;
        Wed, 29 Jun 2022 17:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
        s=default; t=1656525594;
        bh=xth/MUDvJ+GnBq5UPBliavkj3h6/xeBFoQ2W83La9IM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BrEnnUBkliDqpBCa575pGGqjSMlmqLqSquZCHz/G6MHfOkLBJGtPTPCSBhcMNPiaW
         Ca9WLX0axiR6JxpsHKo7PFGTE2hWIdVJSXW9LqspqsJsq1mmsScCSzb/6Rwtp2wMeU
         8UrBu9UH/yO6hgmGCS+2SLXmv9Rq1E0sd2ALtI6tAyIM+6M51jFOOOzVl99qZiVhzf
         tXSxSVejWq0EKVaaCCOjh1OSQCooPSfvfNyshrvPx2y/RZ3OpAjkmI6NaLj8CRRk4D
         6W3rCgpp9Tb0SG7asDVt0UwsmuUej+YJsjZ5SpnAEj+dtc9fl+voND0jpZSjEZXBOG
         WMo86gINYTvkQ==
From:   Ammar Faizi <ammarfaizi2@gnuweeb.org>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Ammar Faizi <ammarfaizi2@gnuweeb.org>,
        Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>,
        Fernanda Ma'rouf <fernandafmr12@gnuweeb.org>,
        Pavel Begunkov <asml.silence@gmail.com>,
        Hao Xu <howeyxu@tencent.com>,
        io-uring Mailing List <io-uring@vger.kernel.org>,
        GNU/Weeb Mailing List <gwml@gnuweeb.org>
Subject: [PATCH liburing v2 7/8] .github: Enable aarch64 nolibc build for GitHub bot
Date:   Thu, 30 Jun 2022 00:58:29 +0700
Message-Id: <20220629175255.1377052-8-ammar.faizi@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220629175255.1377052-1-ammar.faizi@intel.com>
References: <20220629175255.1377052-1-ammar.faizi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

From: Ammar Faizi <ammarfaizi2@gnuweeb.org>

Signed-off-by: Ammar Faizi <ammarfaizi2@gnuweeb.org>
---
 .github/workflows/build.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.github/workflows/build.yml b/.github/workflows/build.yml
index 88192ff..fc119cb 100644
--- a/.github/workflows/build.yml
+++ b/.github/workflows/build.yml
@@ -114,7 +114,7 @@ jobs:
 
     - name: Build nolibc
       run: |
-        if [[ "${{matrix.arch}}" == "x86_64" || "${{matrix.arch}}" == "i686" ]]; then \
+        if [[ "${{matrix.arch}}" == "x86_64" || "${{matrix.arch}}" == "i686" || "${{matrix.arch}}" == "aarch64" ]]; then \
             make clean; \
             ./configure --cc=${{matrix.cc}} --cxx=${{matrix.cxx}} --nolibc; \
             make -j$(nproc) V=1 CPPFLAGS="-Werror" CFLAGS="$FLAGS" CXXFLAGS="$FLAGS"; \
-- 
Ammar Faizi

