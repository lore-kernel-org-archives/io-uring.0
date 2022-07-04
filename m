Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 930C1C43334
	for <io-uring@archiver.kernel.org>; Mon,  4 Jul 2022 17:55:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbiGDRza (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Mon, 4 Jul 2022 13:55:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230259AbiGDRza (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Mon, 4 Jul 2022 13:55:30 -0400
Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BCD6646B
        for <io-uring@vger.kernel.org>; Mon,  4 Jul 2022 10:55:29 -0700 (PDT)
Received: from integral2.. (unknown [36.81.65.188])
        by gnuweeb.org (Postfix) with ESMTPSA id F332E8024B;
        Mon,  4 Jul 2022 17:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
        s=default; t=1656957329;
        bh=xth/MUDvJ+GnBq5UPBliavkj3h6/xeBFoQ2W83La9IM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KCJkZ0LPDotG1ynfJHmhQkb/6z/q/WWBjL6RkfjXYwDmqajO2E3DM1iNYw8Q+MTZm
         RWgALTqNRmf1Piq4rIDUOlzOYTNJW2oAHexFRoYcfrMYIg1KQuyDFSgx0zNUKirwT+
         IY5km2syPoyKJVOYvxxKHkc/pcjSxPHDcx40W6hYYoCJr5Mv14rcCJe8+YGH4bHdQx
         GkgqrD85vCib4EWupiGRH55NkGQ8FP6EyFyI+qDwZxnWam1rCgF/4e1UvAhNJXhG2x
         6VcS/5+OpfRV1WgMqx42lm1M/wBa7vw108N4EYP5LLfQwzm2bZLe16eDqI1ShzGbsa
         WOAWsluA9+P9A==
From:   Ammar Faizi <ammarfaizi2@gnuweeb.org>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Ammar Faizi <ammarfaizi2@gnuweeb.org>,
        Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>,
        Fernanda Ma'rouf <fernandafmr12@gnuweeb.org>,
        Hao Xu <howeyxu@tencent.com>,
        Pavel Begunkov <asml.silence@gmail.com>,
        io-uring Mailing List <io-uring@vger.kernel.org>,
        GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [PATCH liburing v3 09/10] .github: Enable aarch64 nolibc build for GitHub bot
Date:   Tue,  5 Jul 2022 00:54:35 +0700
Message-Id: <20220704174858.329326-10-ammar.faizi@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220704174858.329326-1-ammar.faizi@intel.com>
References: <20220704174858.329326-1-ammar.faizi@intel.com>
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

