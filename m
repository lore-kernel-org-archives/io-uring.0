Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A4ECC43334
	for <io-uring@archiver.kernel.org>; Wed, 29 Jun 2022 00:28:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbiF2A2S (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Tue, 28 Jun 2022 20:28:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbiF2A2R (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Tue, 28 Jun 2022 20:28:17 -0400
Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0773D21837
        for <io-uring@vger.kernel.org>; Tue, 28 Jun 2022 17:28:17 -0700 (PDT)
Received: from integral2.. (unknown [180.245.197.13])
        by gnuweeb.org (Postfix) with ESMTPSA id 9331B7FCFD;
        Wed, 29 Jun 2022 00:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
        s=default; t=1656462496;
        bh=2+vkFY/cAwJcxO/eliCRmSw5WdJfTavO74HpsygISOY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sws9gNH+vemL5kijEiq7Or0vzGghSf1jpu/SdzVP7V8YvO+LbqJPIaPDTcobR3tV2
         l20Yx6ndOwe/dmpxUAp6H4wwIa/diGbUV746BSMHkL4JcSivWn76NUvWbOrAx3BzvB
         HwYWI5FX1bvWFjBDHxqaeSsBn5FPvlilFjGFmareQavToXu7eGxVMeaJ8ivuWsfCdv
         Rda9rgKTor8Pg3cE1pPte+SJSbEFsrr65eyAVbUrRa9DpdMKt5zWEJRbdurv32jxpZ
         zNY+C0Ojh0N5VVmyAMI2S4yVhtabz/dwnId8QUzo1/QrNnyTZxD1pCOcCFb1XFAbcn
         Ujv6fa8NW4tug==
From:   Ammar Faizi <ammarfaizi2@gnuweeb.org>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Ammar Faizi <ammarfaizi2@gnuweeb.org>,
        Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>,
        Fernanda Ma'rouf <fernandafmr12@gnuweeb.org>,
        Pavel Begunkov <asml.silence@gmail.com>,
        Hao Xu <howeyxu@tencent.com>,
        io-uring Mailing List <io-uring@vger.kernel.org>,
        GNU/Weeb Mailing List <gwml@gnuweeb.org>
Subject: [PATCH liburing v1 1/9] CHANGELOG: Fixup missing space
Date:   Wed, 29 Jun 2022 07:27:45 +0700
Message-Id: <20220629002028.1232579-2-ammar.faizi@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220629002028.1232579-1-ammar.faizi@intel.com>
References: <20220629002028.1232579-1-ammar.faizi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

From: Ammar Faizi <ammarfaizi2@gnuweeb.org>

  s/reducingthe/reducing the/

Signed-off-by: Ammar Faizi <ammarfaizi2@gnuweeb.org>
---
 CHANGELOG | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CHANGELOG b/CHANGELOG
index 01cb677..efb3ff3 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -6,7 +6,7 @@ liburing-2.2 release
 - Add support for multishot accept.
 - io_uring_register_files() will set RLIMIT_NOFILE if necessary.
 - Add support for registered ring fds, io_uring_register_ring_fd(),
-  reducingthe overhead of an io_uring_enter() system call.
+  reducing the overhead of an io_uring_enter() system call.
 - Add support for the message ring opcode.
 - Add support for newer request cancelation features.
 - Add support for IORING_SETUP_COOP_TASKRUN, which can help reduce the
-- 
Ammar Faizi

