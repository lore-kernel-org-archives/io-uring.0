Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C8EC6FA82
	for <io-uring@archiver.kernel.org>; Sun,  4 Sep 2022 07:35:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230525AbiIDHfS (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Sun, 4 Sep 2022 03:35:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbiIDHfR (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Sun, 4 Sep 2022 03:35:17 -0400
Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB17F1E3E2
        for <io-uring@vger.kernel.org>; Sun,  4 Sep 2022 00:35:15 -0700 (PDT)
Received: from localhost.localdomain (unknown [182.2.71.200])
        by gnuweeb.org (Postfix) with ESMTPSA id 3F1D1804FD;
        Sun,  4 Sep 2022 07:35:11 +0000 (UTC)
X-GW-Data: lPqxHiMPbJw1wb7CM9QUryAGzr0yq5atzVDdxTR0iA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
        s=default; t=1662276915;
        bh=N0TUVrL5rmpXfPSDjBfANV04n+eYIXjF0A0URZuie7I=;
        h=From:To:Cc:Subject:Date:From;
        b=K4EvI8+TA5V9hOp++DVCkq+nnjs1OHKXuKS7ANeEkuJ5S7KZWgKE6bAd7C5a8fEcQ
         f18zqK6Lp04d07DMtZFe3ysevNjVLJtSl2jGkxiiCHett6l9yyzxQIVBDHNRdGxjjN
         io4eZt1ZcIuKMmWx8Pv1/SPGTyOqf9/CzTLBECqAfeapF30G7GDbPlz24cAn03PJq8
         1fW/g3dLz4/TobsrFlfoSsagImv3fORe+JIfAXv1TNmaSIzG8/jztsVF89XoXN/u4Z
         /EGEYFsrDhub5Oc5QRxT6Tz6F+hNxFUCfIH8G93jWXC8xxe0vvh7SaxMpowHHsFjkF
         c46gLuVgL0rLA==
From:   Ammar Faizi <ammarfaizi2@gnuweeb.org>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Ammar Faizi <ammarfaizi2@gnuweeb.org>,
        Pavel Begunkov <asml.silence@gmail.com>,
        io-uring Mailing List <io-uring@vger.kernel.org>,
        GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
        Kanna Scarlet <knscarlet@gnuweeb.org>,
        Muhammad Rizki <kiizuha@gnuweeb.org>
Subject: [PATCH liburing v1] liburing: Export `__NR_io_uring_{setup,enter,register}` to user
Date:   Sun,  4 Sep 2022 14:35:01 +0700
Message-Id: <20220904073143.1942015-1-ammar.faizi@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

These macros are not defined in a old <sys/syscall.h> file. Allow
liburing users to get io_uring syscall numbers by including
<liburing.h>.

Signed-off-by: Ammar Faizi <ammarfaizi2@gnuweeb.org>
---
 src/include/liburing.h | 38 ++++++++++++++++++++++++++++++++++++++
 src/syscall.h          | 37 -------------------------------------
 2 files changed, 38 insertions(+), 37 deletions(-)

diff --git a/src/include/liburing.h b/src/include/liburing.h
index 6040a06..cceab6b 100644
--- a/src/include/liburing.h
+++ b/src/include/liburing.h
@@ -33,6 +33,44 @@
 #define uring_likely(cond)	__builtin_expect(!!(cond), 1)
 #endif
 
+
+#ifdef __alpha__
+/*
+ * alpha and mips are exception, other architectures have
+ * common numbers for new system calls.
+ */
+#ifndef __NR_io_uring_setup
+#define __NR_io_uring_setup		535
+#endif
+#ifndef __NR_io_uring_enter
+#define __NR_io_uring_enter		536
+#endif
+#ifndef __NR_io_uring_register
+#define __NR_io_uring_register		537
+#endif
+#elif defined __mips__
+#ifndef __NR_io_uring_setup
+#define __NR_io_uring_setup		(__NR_Linux + 425)
+#endif
+#ifndef __NR_io_uring_enter
+#define __NR_io_uring_enter		(__NR_Linux + 426)
+#endif
+#ifndef __NR_io_uring_register
+#define __NR_io_uring_register		(__NR_Linux + 427)
+#endif
+#else /* !__alpha__ and !__mips__ */
+#ifndef __NR_io_uring_setup
+#define __NR_io_uring_setup		425
+#endif
+#ifndef __NR_io_uring_enter
+#define __NR_io_uring_enter		426
+#endif
+#ifndef __NR_io_uring_register
+#define __NR_io_uring_register		427
+#endif
+#endif
+
+
 #ifdef __cplusplus
 extern "C" {
 #endif
diff --git a/src/syscall.h b/src/syscall.h
index ba008ea..f750782 100644
--- a/src/syscall.h
+++ b/src/syscall.h
@@ -10,45 +10,8 @@
 #include <sys/mman.h>
 #include <sys/syscall.h>
 #include <sys/resource.h>
-
 #include <liburing.h>
 
-#ifdef __alpha__
-/*
- * alpha and mips are exception, other architectures have
- * common numbers for new system calls.
- */
-#ifndef __NR_io_uring_setup
-#define __NR_io_uring_setup		535
-#endif
-#ifndef __NR_io_uring_enter
-#define __NR_io_uring_enter		536
-#endif
-#ifndef __NR_io_uring_register
-#define __NR_io_uring_register	537
-#endif
-#elif defined __mips__
-#ifndef __NR_io_uring_setup
-#define __NR_io_uring_setup		(__NR_Linux + 425)
-#endif
-#ifndef __NR_io_uring_enter
-#define __NR_io_uring_enter		(__NR_Linux + 426)
-#endif
-#ifndef __NR_io_uring_register
-#define __NR_io_uring_register	(__NR_Linux + 427)
-#endif
-#else /* !__alpha__ and !__mips__ */
-#ifndef __NR_io_uring_setup
-#define __NR_io_uring_setup		425
-#endif
-#ifndef __NR_io_uring_enter
-#define __NR_io_uring_enter		426
-#endif
-#ifndef __NR_io_uring_register
-#define __NR_io_uring_register		427
-#endif
-#endif
-
 /*
  * Don't put this below the #include "arch/$arch/syscall.h", that
  * file may need it.

base-commit: 42ee2bdb76022fc11d7a0ad8ec5cca6de73501e9
-- 
Ammar Faizi

