Return-Path: <io-uring-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3132C001DF
	for <io-uring@archiver.kernel.org>; Tue,  1 Aug 2023 01:04:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbjHABEt (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Mon, 31 Jul 2023 21:04:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjHABEt (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Mon, 31 Jul 2023 21:04:49 -0400
Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7296E67
        for <io-uring@vger.kernel.org>; Mon, 31 Jul 2023 18:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
        s=default; t=1690851887;
        bh=DJOFR/W2vUtwN1FyNmr5emYWIZUeAKREwpIlt2PzIQc=;
        h=From:To:Cc:Subject:Date;
        b=MLubvnh+HxYzivZqPW7F6pjCie+nAd8PKHBnH1kqtvOTUbDPgWWxl4Mj6OhNgii6m
         7DrsQ8kzeco4kO6CAX9gKnFXGKPZYnKZQsO+IsITM0mtAYuqpIQIriNlX/0oDStcbY
         Yyp2J49G3CwLl0E0HOjKNd5XeOAESnV8r97h0wH59wYnmJDrlHQMrASBgK7Qzuv/CL
         4i8QIaxH8/sL2C2y7+Y4qHZGn6AkuzVUP/PGqMNKoBJTpLEMOTk6Ajy0Cc+O0LlZzc
         NRdey/HWO/XGs7l9h62L1gU+LfB6XTFFz1KHyfP9SdcBlsgwXFmHDGqJIWfuNuYjV3
         hwhqESQqpjryQ==
Received: from localhost.localdomain (unknown [182.253.126.208])
        by gnuweeb.org (Postfix) with ESMTPSA id E44C924B0CA;
        Tue,  1 Aug 2023 08:04:44 +0700 (WIB)
From:   Ammar Faizi <ammarfaizi2@gnuweeb.org>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Ammar Faizi <ammarfaizi2@gnuweeb.org>,
        Nicholas Rosenberg <inori@vnlx.org>,
        io-uring Mailing List <io-uring@vger.kernel.org>,
        GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [PATCH liburing] github: Fix LLVM packages conflict
Date:   Tue,  1 Aug 2023 08:04:34 +0700
Message-Id: <20230801010434.2697794-1-ammarfaizi2@gnuweeb.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

Recently, the CI hits the following error:

  The following packages have unmet dependencies:
  python3-lldb-14 : Conflicts: python3-lldb-x.y
  python3-lldb-17 : Conflicts: python3-lldb-x.y
  E: Error, pkgProblemResolver::Resolve generated breaks, this may be caused by held packages.

Fix this by removing preinstalled llvm 14 before installing llvm 17.

Link: https://github.com/llvm/llvm-project/issues/64182#issuecomment-1658085767
Signed-off-by: Ammar Faizi <ammarfaizi2@gnuweeb.org>
---
 .github/workflows/build.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.github/workflows/build.yml b/.github/workflows/build.yml
index 8dd22dfd125692de..895599f160e80304 100644
--- a/.github/workflows/build.yml
+++ b/.github/workflows/build.yml
@@ -106,6 +106,7 @@ jobs:
       run: |
         if [[ "${{matrix.cc_pkg}}" == "clang" ]]; then \
             wget https://apt.llvm.org/llvm.sh -O /tmp/llvm.sh; \
+            sudo apt-get purge --auto-remove llvm python3-lldb-14 llvm-14 -y; \
             sudo bash /tmp/llvm.sh 17; \
             sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-17 400; \
             sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-17 400; \

base-commit: 12e697608d841dc33c360beb4753c5509187ef6f
-- 
Ammar Faizi

