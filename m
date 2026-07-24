Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3BC38837F
	for <io-uring@vger.kernel.org>; Fri, 24 Jul 2026 22:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784933968; cv=none; b=C/wXnR+9HdWvRlcz91+oP0tLb7Q6+yXvPn3OqfWgbTvHvAMtdC+uu4vzaUpjknKkWVqv6dz3YdzXr6BlRcQVBxXGIqp6D6vol3EbHv4HXK+NHLeIwiD85wAdK+vpf5eQyBUh5uO3/Ln/3lf+0aTmxptmvEO+GktKSU84y9/qC/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784933968; c=relaxed/simple;
	bh=YKlAkK/OnMrbRWOiZFLaVT/hhsuvCqnU0oCJDphA8Gs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RY00pbOyYrqVYcFEskM2XJXKD6rEIUcroYHwMq2a2l2FwicELpbfTnHUfMFJ6yqj7rRT0P6+W2Dk1r4YPfxEAZSkmJqotNNilXchggJhJc9E7UlmDgB4/2wwJPjBH3+E2+X/8V3eA3zgZ1Xq2HwlBeYXDD6ieqjLHSIDEH76I9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com; spf=pass smtp.mailfrom=openresty.com; dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b=SFU3SXH3; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openresty.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b="SFU3SXH3"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so671796a12.2
        for <io-uring@vger.kernel.org>; Fri, 24 Jul 2026 15:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openresty.com; s=google; t=1784933963; x=1785538763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kdGA8DMMrNPcdGtcWSLCA4TCQthv6pFnBdGZOfGwAUM=;
        b=SFU3SXH3lWE5eH7WiT243vt3H7SYsXanTr4FE1uMYilovxr4dCSqz6qZjMUme4NxqO
         fmLEkCHLvi1ZtXwVpsVLv6nKiArZgQIC8rwqgOYomHdj5xV/uhIDJ3iDyyFqc4jY2Thi
         Un8lNwNwodysYB1QZp8J4828v8tQFL+ex2SPuzjW5OxVMaTbEzTGaAUxPHyreIR1esCb
         xz6G+Ikf4kBPRQZktMJDNcFekvAQsQAXNz0NFvbL+VwdofguHNx24QVYbpUCZ76PtFGz
         uY9kU1U4gEih88Ict745sCUDqCvJN/WDVG29Pn/xQMNbwHrjmE6NGdqEIuzjcyA6/HEz
         ApkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784933963; x=1785538763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kdGA8DMMrNPcdGtcWSLCA4TCQthv6pFnBdGZOfGwAUM=;
        b=iG11/iOKhYdIU3l7rFCz0tQYUrfM/uthjwNvX9EZm0S92H/Ec+ME7yx2EHDHrbzG8N
         mUhy/P1yK9pBEjfMw0FuR977L49se+YD7e7hFoNHsCniBQMpgb357DPFKncaBMCa7cpL
         cd71U8/Q4zEtq+rZkZqkKOs3l8ubY6etS2X4DaK9yM4CsA14jUNCZTQ5aLpP1TzvaJS/
         Ez+noKzVSxVMAo2T2bZfTYCELyTvSluAbKOMruGhwOifGK8xAokCpS3NL5WSchPH8tFw
         yDFrrSQy5eUNOHru8AbAyQb7y5VBL9wYrI7U7tWQsfbcdLhm4hN7ymaKmEMiVex8rRBt
         JmWA==
X-Forwarded-Encrypted: i=1; AHgh+Rr3muzkhMvQpLRFOD/3c6+Jg2NKtuO0Rvk+656nxp+YObM6AOrRt1QFGXk4DTE2ZWmKqBTk1IrBKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzowLK/EBGtM3aBBOjL4RQzscb3pjq5WIzUMZr4XIl9hEMjlAIP
	KSpNhSsi7Ufiei4jN6jDu4crSBL5OZ6K0vuQfm/GBOW4TP5zaUUWTsD08C3twR2tbXI=
X-Gm-Gg: AR+sD10+W3IC52SikKMiRD7X5MmBONs3tFmsWmqD8NEPaZS7fIlFuIQagA7+2fcwMsV
	eg3XTm4Glm1bYa2/SScMAmUhlnj8vsFlrF3GO5dyWkJowBd5xvOzPoHmLRMUlGfMzzFVNbXnXab
	xKJJe1HjauYBM9ibcNIGaDJBP5rmgGwz7m1wzq0qroTdZtQKJiDu23qI0GtJWYQaCr8emT5WkPy
	MVMbyxoxtZJETcRQTU/D5w+8sRMLYfS8m7JQXNvk8Z8UJCWznVxkaS4z7lTMuxKpfzepNELDpwo
	fwafP0li56hKLi56Hbd5T9Io+5Cu7Q/JQzK8mq2kBgH9nOWOipA6oMoS/eG3xBDIuUZhi4UP+Mm
	cgYiRBD2WS326iKwQQekQxo8z+Dn/rlwP7aXPL0VgWtyejTnAszJsnznkRnYcY+dleFOO9hnPQW
	giBIc7QzbKZGZF+A==
X-Received: by 2002:a05:6a20:7346:b0:3c0:9c18:d5ad with SMTP id adf61e73a8af0-3c67e083397mr240808637.74.1784933963113;
        Fri, 24 Jul 2026 15:59:23 -0700 (PDT)
Received: from integral2.. ([2402:8780:1329:2779:beb7:3f70:1f02:3159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc584433sm2910930eec.23.2026.07.24.15.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 15:59:22 -0700 (PDT)
From: Ammar Faizi <ammarfaizi2@openresty.com>
To: Jens Axboe <axboe@kernel.dk>,
	io-uring Mailing List <io-uring@vger.kernel.org>
Cc: Ammar Faizi <ammarfaizi2@openresty.com>,
	Yichun Zhang <yichun@openresty.com>,
	Christian Mazakas <christian.mazakas@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Guillem Jover <guillem@hadrons.org>,
	Changcheng Liu <changcheng.liu@aliyun.com>
Subject: [PATCH liburing 4/4] liburing{{,-ffi}.pc.in,.spec}: Replace dead git tree links with the new one
Date: Sat, 25 Jul 2026 05:59:05 +0700
Message-Id: <20260724225905.747718-5-ammarfaizi2@openresty.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260724225905.747718-1-ammarfaizi2@openresty.com>
References: <20260724225905.747718-1-ammarfaizi2@openresty.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The old git tree link:

  https://git.kernel.dk/cgit/liburing/

is dead. Replace it with the new kernel.org git tree:

  https://git.kernel.org/pub/scm/linux/kernel/git/axboe/liburing.git/

Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Guillem Jover <guillem@hadrons.org>
Cc: Changcheng Liu <changcheng.liu@aliyun.com>
Signed-off-by: Ammar Faizi <ammarfaizi2@openresty.com>
---
 debian/control     | 6 +++---
 debian/copyright   | 2 +-
 liburing-ffi.pc.in | 2 +-
 liburing.pc.in     | 2 +-
 liburing.spec      | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/debian/control b/debian/control
index e79ff11cd187..14ca43b4e399 100644
--- a/debian/control
+++ b/debian/control
@@ -5,9 +5,9 @@ Maintainer: Liu Changcheng <changcheng.liu@intel.com>
 Build-Depends:
   debhelper-compat (= 13)
 Standards-Version: 4.1.4
-Homepage: https://git.kernel.dk/cgit/liburing/tree/README
-Vcs-Git: https://git.kernel.dk/liburing
-Vcs-Browser: https://git.kernel.dk/cgit/liburing/
+Homepage: https://git.kernel.org/pub/scm/linux/kernel/git/axboe/liburing.git/tree/README
+Vcs-Git: https://git.kernel.org/pub/scm/linux/kernel/git/axboe/liburing.git
+Vcs-Browser: https://git.kernel.org/pub/scm/linux/kernel/git/axboe/liburing.git
 
 Package: liburing2
 Architecture: linux-any
diff --git a/debian/copyright b/debian/copyright
index 0b3f3eb04db4..25d39e79b9ec 100644
--- a/debian/copyright
+++ b/debian/copyright
@@ -1,6 +1,6 @@
 Format: https://www.debian.org/doc/packaging-manuals/copyright-format/1.0/
 Upstream-Name: liburing
-Source: https://git.kernel.dk/cgit/liburing/
+Source: https://git.kernel.org/pub/scm/linux/kernel/git/axboe/liburing.git/
 
 Files: *
 Copyright: 2019 Jens Axboe <axboe@kernel.dk>
diff --git a/liburing-ffi.pc.in b/liburing-ffi.pc.in
index 71943acca14a..400d43fa783b 100644
--- a/liburing-ffi.pc.in
+++ b/liburing-ffi.pc.in
@@ -6,7 +6,7 @@ includedir=@includedir@
 Name: @NAME@
 Version: @VERSION@
 Description: io_uring FFI library
-URL: https://git.kernel.dk/cgit/liburing/
+URL: https://git.kernel.org/pub/scm/linux/kernel/git/axboe/liburing.git/
 
 Libs: -L${libdir} -luring-ffi
 Cflags: -I${includedir}
diff --git a/liburing.pc.in b/liburing.pc.in
index 2c879b2cdc90..7ada05167f35 100644
--- a/liburing.pc.in
+++ b/liburing.pc.in
@@ -6,7 +6,7 @@ includedir=@includedir@
 Name: @NAME@
 Version: @VERSION@
 Description: io_uring library
-URL: https://git.kernel.dk/cgit/liburing/
+URL: https://git.kernel.org/pub/scm/linux/kernel/git/axboe/liburing.git/
 
 Libs: -L${libdir} -luring
 Cflags: -I${includedir}
diff --git a/liburing.spec b/liburing.spec
index 1d0a72fbd31e..2c396813d434 100644
--- a/liburing.spec
+++ b/liburing.spec
@@ -5,7 +5,7 @@ Summary: Linux-native io_uring I/O access library
 License: (GPLv2 with exceptions and LGPLv2+) or MIT
 Source0: https://brick.kernel.dk/snaps/%{name}-%{version}.tar.gz
 Source1: https://brick.kernel.dk/snaps/%{name}-%{version}.tar.gz.asc
-URL: https://git.kernel.dk/cgit/liburing/
+URL: https://git.kernel.org/pub/scm/linux/kernel/git/axboe/liburing.git/
 BuildRequires: gcc
 BuildRequires: make
 
-- 
Ammar Faizi

