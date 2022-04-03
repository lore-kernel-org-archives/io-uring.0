Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA32C433F5
	for <io-uring@archiver.kernel.org>; Sun,  3 Apr 2022 09:56:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235931AbiDCJ6S (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Sun, 3 Apr 2022 05:58:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234350AbiDCJ6R (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Sun, 3 Apr 2022 05:58:17 -0400
Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83E1935253
        for <io-uring@vger.kernel.org>; Sun,  3 Apr 2022 02:56:24 -0700 (PDT)
Received: from integral2.. (unknown [182.2.43.220])
        by gnuweeb.org (Postfix) with ESMTPSA id 52F057E312;
        Sun,  3 Apr 2022 09:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
        s=default; t=1648979783;
        bh=+spcHRhw095G0Xd9JHiY7neT5jCemfrQdfB/bV/GTXA=;
        h=From:To:Cc:Subject:Date:From;
        b=Q4fupqjdrHa8znVkDWDCoQfZVPbbUWrB0Woyfwaxd1wCeY9ZCWp+ksDxRqEkwkaeo
         qI3GpzOrAfxk27qBlNXV/c/5aewHSJxArO2UhmNffWfKgGCnTCEV7dUuEH2hN/405J
         CjJO/oxLp62FLapO2rDhRSQdF1Zf/27Ymac5xAM6Qe9eceuOv3XS8HpaZGYk8iXeRo
         OTTZMjc9RZxC+F9me0y2AAoWyjN6FGpdmIsHSkKCJw/lBpGtjNkvhB9clsPM6QE1ok
         DMkRP/SG/KDSfxMc/myiTPq5eZjc9efI2FxaZFGOspcc5y/P3fCB07CK1rTT5PE5BT
         abunWl89jkyLA==
From:   Ammar Faizi <ammarfaizi2@gnuweeb.org>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Ammar Faizi <ammarfaizi2@gnuweeb.org>,
        io-uring Mailing List <io-uring@vger.kernel.org>,
        GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [PATCH liburing v1 0/2] SPDX fix and .gitignore improvement
Date:   Sun,  3 Apr 2022 16:56:00 +0700
Message-Id: <20220403095602.133862-1-ammarfaizi2@gnuweeb.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

Hi Jens,

Two patches in this series. The first patch is SPDX-License-Identifier
fix. The second patch is a small improvement for .gitignore w.r.t. test.

When adding a new test, we often forget to add the new test binary to
`.gitignore`. Append `.test` to the test binary filename, this way we
can use a wildcard matching "test/*.test" in `.gitignore` to ignore all
test binary files.

Goals:
  - Make the .gitignore simpler.
  - Avoid the burden of adding a new test to .gitignore.

Signed-off-by: Ammar Faizi <ammarfaizi2@gnuweeb.org>
---
Ammar Faizi (2):
  src/int_flags.h: Add missing SPDX-License-Identifier
  test/Makefile: Append `.test` to the test binary filename

 .gitignore      | 132 +-----------------------------------------------
 src/int_flags.h |   1 +
 test/Makefile   |   8 +--
 3 files changed, 7 insertions(+), 134 deletions(-)


base-commit: 314dd7ba2aa9d0ba5bb9a6ab28b7204dd319e386
-- 
Ammar Faizi

