Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7431C19F2D
	for <io-uring@archiver.kernel.org>; Wed, 10 Aug 2022 00:32:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbiHJAct (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Tue, 9 Aug 2022 20:32:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbiHJAcr (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Tue, 9 Aug 2022 20:32:47 -0400
Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6349785BC
        for <io-uring@vger.kernel.org>; Tue,  9 Aug 2022 17:32:45 -0700 (PDT)
Received: from integral2.. (unknown [180.246.144.41])
        by gnuweeb.org (Postfix) with ESMTPSA id 6921080866;
        Wed, 10 Aug 2022 00:32:43 +0000 (UTC)
X-GW-Data: lPqxHiMPbJw1wb7CM9QUryAGzr0yq5atzVDdxTR0iA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
        s=default; t=1660091565;
        bh=9+f0W4QhjkUwt9EAApmWkBE2818gTJuXJJcM0bJIwnQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qgGRDR79iVlhg+BTq2gFol/6E3bAMskVnN0n6yWufbMPTysIjNtFOkx+EGxknUxN9
         0rYpfxN/LXEU2VUDgvR9HU2enFlk8R8T1AuEngHmw/N2wE4zDa90rQl0A+tgacm1LD
         ut9OjW4Ogjl3+DgPFzsHJaOm5VcVIv9dxwr4BbBTRx3+C3HKqsj4gGM08k9yITUSZM
         ihApcrZprquDiZkeyh0iijjY36ETl01RVkhjadYBVZYzjNj1BJ8VoXXh/WpwnY8Ccl
         AJ+kvS71IJF0pJf1jMV6joZ7PCDwi2n29CuOIgXbgS32efyo+7KMGhYkvQUFtGv2gI
         RivG4VTTa6dsQ==
From:   Ammar Faizi <ammarfaizi2@gnuweeb.org>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Ammar Faizi <ammarfaizi2@gnuweeb.org>,
        Vitaly Chikunov <vt@altlinux.org>,
        Fernanda Ma'rouf <fernandafmr12@gnuweeb.org>,
        Kanna Scarlet <knscarlet@gnuweeb.org>,
        io-uring Mailing List <io-uring@vger.kernel.org>,
        GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [PATCH liburing v1 07/10] test/submit-link-fail: Initialize the buffer before `write()`
Date:   Wed, 10 Aug 2022 07:31:56 +0700
Message-Id: <20220810002735.2260172-8-ammar.faizi@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220810002735.2260172-1-ammar.faizi@intel.com>
References: <20220810002735.2260172-1-ammar.faizi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

From: Ammar Faizi <ammarfaizi2@gnuweeb.org>

... to avoid valgrind's complaint:

  ==2254978== Syscall param write(buf) points to uninitialised byte(s)
  ==2254978==    at 0x498EA37: write (write.c:26)
  ==2254978==    by 0x109F17: test_underprep_fail (submit-link-fail.c:82)
  ==2254978==    by 0x109F17: main (submit-link-fail.c:141)
  ==2254978==  Address 0x1ffefffb07 is on thread 1's stack
  ==2254978==  in frame #1, created by main (submit-link-fail.c:123)

Link: https://github.com/axboe/liburing/issues/640
Reported-by: Vitaly Chikunov <vt@altlinux.org>
Signed-off-by: Ammar Faizi <ammarfaizi2@gnuweeb.org>
---
 test/submit-link-fail.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/test/submit-link-fail.c b/test/submit-link-fail.c
index 45f6976..e62f793 100644
--- a/test/submit-link-fail.c
+++ b/test/submit-link-fail.c
@@ -23,7 +23,7 @@ static int test_underprep_fail(bool hardlink, bool drain, bool link_last,
 	struct io_uring ring;
 	struct io_uring_sqe *sqe;
 	struct io_uring_cqe *cqe;
-	char buffer[1];
+	char buffer[1] = { };
 	int i, ret, fds[2];
 
 	if (drain)
-- 
Ammar Faizi

