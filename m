Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E2AC433EF
	for <io-uring@archiver.kernel.org>; Fri, 25 Feb 2022 01:15:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236275AbiBYBPc (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Thu, 24 Feb 2022 20:15:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236274AbiBYBPb (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Thu, 24 Feb 2022 20:15:31 -0500
Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C04DD2036D9
        for <io-uring@vger.kernel.org>; Thu, 24 Feb 2022 17:15:00 -0800 (PST)
Received: from integral2.. (unknown [36.78.50.60])
        by gnuweeb.org (Postfix) with ESMTPSA id 1E7807E29A;
        Fri, 25 Feb 2022 01:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
        s=default; t=1645751700;
        bh=SoJAQqDlT9s+Pwoi6TbWuRWizBH29NglvKhi5X2YaIE=;
        h=From:To:Cc:Subject:Date:From;
        b=WfDKTYx65A17LwyVbUTRQydghtgW0HJegaf+KNoh7tWQ1qCPP3KIkEHKYuImxrqzq
         s8qvqTR/B1fULYioG5kyEsjXiL2oCEJf2ntgN4b2TKayLWUSLPR1pnZh78zjHuKYRd
         UkvTdlUQDFCj7RmtKlJ9HNkP4it6d+xnZdOKm0g43/+6iKRvbNff+lJFK02xsbSpSn
         uv4rT5UD4By1MaxSU0+mOwYvy6flByU1jSEmjV9ydSfd14JiccyjgkJCtKHaOGO/oP
         Nhl/qIGFzmkE22t2ujqm+HpsJSK6+tgjCSCLD8JhVruCbJsLqGHAVnJvcoEEn8Mqfo
         Oi+CiHscact6w==
From:   Ammar Faizi <ammarfaizi2@gnuweeb.org>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Nugra <richiisei@gmail.com>,
        Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>,
        GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
        Tea Inside Mailing List <timl@vger.teainside.org>,
        io-uring Mailing List <io-uring@vger.kernel.org>,
        Ammar Faizi <ammarfaizi2@gnuweeb.org>
Subject: [PATCH liburing v1] .gitignore: Add `/test/fpos` to .gitignore
Date:   Fri, 25 Feb 2022 08:14:36 +0700
Message-Id: <20220225011436.147898-1-ammarfaizi2@gnuweeb.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=514; h=from:subject; bh=SoJAQqDlT9s+Pwoi6TbWuRWizBH29NglvKhi5X2YaIE=; b=owEBbQGS/pANAwAKATZPujT/FwpLAcsmYgBiGC1qs2L8ZXbGesfNr3vgE82kRhHDBG0//JroPXSB drBkiC2JATMEAAEKAB0WIQTok3JtyOTA3juiAQc2T7o0/xcKSwUCYhgtagAKCRA2T7o0/xcKS2rgB/ 4+mLFmTAmTsd2SfRQsTX+pmQDZc72LPfz6dGaPFyonb9srrRaKWbkj2OO8eaSUVzRgMVYqoDX3DNWX ZeeZzBiXjv5uUMb0TOs5uZG9tKXAn3jA9Ssj2iOAN6CXEisGRwwa2rFo+lbD9A4ANw64JL5v6dwtrp LzVnzFTbOcCyqx3dEXpW4cn5L2X46VMRoZiCpWe8avBM5v9knTKmMfZTSHbRfLEy10hSf6D+c8ji+J rh7EJabLvswE5Epoz1m+zom2DKZ0Vc8yOTssB3JoY4WCpK9OfqTyL9bSgwiHb932VDSe3XY21DeAiU cYaeMixyURAZx+OceBnTK/5GfjjPE4
X-Developer-Key: i=ammarfaizi2@gnuweeb.org; a=openpgp; fpr=E893726DC8E4C0DE3BA20107364FBA34FF170A4B
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

Dylan forgot to add it to .gitignore when creating this test.

Signed-off-by: Ammar Faizi <ammarfaizi2@gnuweeb.org>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 15559ab..c9dc77f 100644
--- a/.gitignore
+++ b/.gitignore
@@ -60,6 +60,7 @@
 /test/files-exit-hang-poll
 /test/files-exit-hang-timeout
 /test/fixed-link
+/test/fpos
 /test/fsync
 /test/hardlink
 /test/io-cancel

base-commit: 896a1d3ab14a8777a45db6e7b67cf557a44923fb
-- 
2.32.0

