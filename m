Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5FB3BC696
	for <io-uring@vger.kernel.org>; Mon, 20 Jul 2026 07:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784532169; cv=none; b=Ev9eM0HMBhHXoXkqJ6PTEcokMaLZgCdhbvK57+At0CJ1oS0lCJvGkQdszloKUw0VPa/ZSzmTerrJMQNtDFz4LU/uiozF05HdbeCldUwy2QJGS1aC5bZpKFHzA0AuQCF1LOtUWSdLC2cRxIhwJVpHZX1BOZ4FXHK6+ou6E4PYTzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784532169; c=relaxed/simple;
	bh=OOTKP4pnSAz8xHGhbXtlqxKf0IRGK3PLKQEbgiMxO9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nEHhadxV98nYjvVQMu9/7un7Ot+M/zgdpln2zSzUUod9j+tNhMhsgrsrtFU6jQ1LbYoXmPq9l0Bd+8fDwYiVbD5fy9KqywqXrHzpfbWDKldcMGc7GItGT/tvy4uwV0RFbvcYL7WOeM+FKViQev2oq/Qt5yTUVWP0hbEKc06oqZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dTk5rB2g; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTk5rB2g"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cacb8416a1so62816615ad.1
        for <io-uring@vger.kernel.org>; Mon, 20 Jul 2026 00:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532165; x=1785136965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IL4Hj7AEoE4Tzg2meurW+8WK6UP5mdpnN7tRwvqUA8A=;
        b=dTk5rB2gD/Ih8l1aEpFtjkX3Yf9iXQddBOAQhMIAWQJxL2clVGgdK4zLS0T0wDyhdB
         kvLLLSEisXudEj32hhAit6t8s1manzzLNozKKcvjaBiwtzsZWg8dq4YGrxt5A4Mj6MeL
         3D9Do65nOPHk9glI+am9sgytgP7J0Os/KztQvXS/UhFigZXvwMpeY/EQa30e0Q1TyOzY
         ZbRJnA8hzbNT3HFMY0XCRptAmixIi6TdEXiuFCPJIGjXstuTDzaNOfNTkZIItXFxpRMR
         SdriiTjLJtHeU0eOfEV2HXvZKlXgDmmb9m9qM2U8T4HZmVE2L6QHev3ZsZB4M59evpBX
         Elrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532165; x=1785136965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IL4Hj7AEoE4Tzg2meurW+8WK6UP5mdpnN7tRwvqUA8A=;
        b=SWLoQYTjODItSKT9Kx5S6m0YemZYomZG1XQ+QtaH+j6hFyiELJZcT9G9oo7y3akI2x
         KvK2Ws9psz/JhSjGjXI+YY2WvVLxpoRGnmEcDTyOM4/R2xHan5v7ZhzqV9CwwZ+PILdI
         fl7MAc8WQMhjyrVuFV/KmOHaoxb+eFHsfStDmbODaKRM8ruToeMQHMElCZfhJTc2Ehyx
         ksc2mhbYDOA3ubXOtOUkAXApj6sZhgWuDNqYD0pgZ0KM3KR+P2LlrfjpzpWZUgHQXF4f
         KMoQEfD9zUmDoZHLFbd99Bq3fT2pCuPEVWGmp5qToRQq+OWydBg0ACs5tA1VXXemIJcF
         d+zg==
X-Forwarded-Encrypted: i=1; AHgh+RpUQnFye3gcr+p+pXgc8ddWP0Hu3SqU15QSuGkRgF8inpAlDiVV78wuYjcBJaPr0Y/UN5+EVTFHpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgP7pHCEAj7PWA866T/Pwq17ZkzhdpDd7UM5rPsCFY9xig8CId
	o6AbzVbhP3/Xlbht7Inln822LRBSrryoP3jA9RssZhKYqcqQvM2aro/s
X-Gm-Gg: AfdE7cm2PnCTij1nfi+5qIv8Tqh+2CzMcUEEQSzejezv0infGm2KQmPlvp8iE/piZiX
	ZcMhDKxdevwOsN/ybxLwKOnenmh0Y8iv1S0fIw+1wg9//62b6DG3Be6IjvVYFkULKWCKRN2tfvE
	4/I6wnhFosHu1KMj1NpEqASEd+uVgqLmVs2D+k8x72xcZCKTec9NnM4KjakSWWqvC9C/zg45k0e
	45DJyCdUE062vJCV32zvM22VVCXxOQ7033Z0OUNhIXhDcmzA2aNns2IWFqGN2tuhzXumfhiP97y
	iTbkKHmRnsDHOI4r3Xz9imEbiWKgV5fuSGhOk5FJ0aCOJEzH/SCVZV5ykctsMXJ97uhMI42Iy0N
	bRSDK7eOBeB6qZtpH3f0FMH4H72/DpBSPo0PLyi4blpduBKztWU+suLRTH5l1htvg9unhYYxhDj
	Fgc4eJa8mdg1SfNVbzy9peBfSt/8GlLFiBpJWFnzG57BhoSPJ8VLw0cGJY1/jIZdLslhauOkzkm
	lKkri+rQfjZEhYpoSao3VYCwzt/X6qIEajpvg6VXyskF6TmsSuxP5KNIzBzqFu8hPUddu6shV1U
	pPzYKVPhoY6rWK8=
X-Received: by 2002:a05:6a21:a8b:b0:3bf:6ac8:8d29 with SMTP id adf61e73a8af0-3c3ad7a8ed5mr14170724637.21.1784532164879;
        Mon, 20 Jul 2026 00:22:44 -0700 (PDT)
Received: from cs-1047136853211-default.asia-southeast1-b.c.z168d0f9edf9bc766-tp.internal (43.173.126.34.bc.googleusercontent.com. [34.126.173.43])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb519de26a5sm4064176a12.22.2026.07.20.00.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:22:44 -0700 (PDT)
From: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Jan Kara <jack@suse.cz>,
	io-uring@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
Subject: [PATCH 1/2] fs: make listxattr and removexattr helpers non-static
Date: Mon, 20 Jul 2026 07:22:12 +0000
Message-ID: <20260720072213.2719-2-aditya.ansh182@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720072213.2719-1-aditya.ansh182@gmail.com>
References: <20260720072213.2719-1-aditya.ansh182@gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for adding IORING_OP_REMOVEXATTR, FREMOVEXATTR,
LISTXATTR, and FLISTXATTR support in io_uring, we need to invoke
the respective VFS-layer list/remove helpers from within io_uring.

Make the following four helpers non-static and declare them in
fs/internal.h:
- file_listxattr()
- filename_listxattr()
- file_removexattr()
- filename_removexattr()

No functional change is introduced.

Signed-off-by: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
---
 fs/internal.h | 7 +++++++
 fs/xattr.c    | 8 +++-----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/fs/internal.h b/fs/internal.h
index 355d93f92208..1294424431f3 100644
--- a/fs/internal.h
+++ b/fs/internal.h
@@ -297,6 +297,13 @@ int filename_setxattr(int dfd, struct filename *filename,
 		      unsigned int lookup_flags, struct kernel_xattr_ctx *ctx);
 int setxattr_copy(const char __user *name, struct kernel_xattr_ctx *ctx);
 int import_xattr_name(struct xattr_name *kname, const char __user *name);
+ssize_t file_listxattr(struct file *f, char __user *list, size_t size);
+ssize_t filename_listxattr(int dfd, struct filename *filename,
+			   unsigned int lookup_flags,
+			   char __user *list, size_t size);
+int file_removexattr(struct file *f, struct xattr_name *kname);
+int filename_removexattr(int dfd, struct filename *filename,
+			 unsigned int lookup_flags, struct xattr_name *kname);
 
 int may_write_xattr(struct mnt_idmap *idmap, struct inode *inode);
 
diff --git a/fs/xattr.c b/fs/xattr.c
index d58979115200..1004b1d22cc4 100644
--- a/fs/xattr.c
+++ b/fs/xattr.c
@@ -953,14 +953,12 @@ listxattr(struct dentry *d, char __user *list, size_t size)
 	return error;
 }
 
-static
 ssize_t file_listxattr(struct file *f, char __user *list, size_t size)
 {
 	audit_file(f);
 	return listxattr(f->f_path.dentry, list, size);
 }
 
-static
 ssize_t filename_listxattr(int dfd, struct filename *filename,
 			   unsigned int lookup_flags,
 			   char __user *list, size_t size)
@@ -1036,7 +1034,7 @@ removexattr(struct mnt_idmap *idmap, struct dentry *d, const char *name)
 	return vfs_removexattr(idmap, d, name);
 }
 
-static int file_removexattr(struct file *f, struct xattr_name *kname)
+int file_removexattr(struct file *f, struct xattr_name *kname)
 {
 	int error = mnt_want_write_file(f);
 
@@ -1049,8 +1047,8 @@ static int file_removexattr(struct file *f, struct xattr_name *kname)
 	return error;
 }
 
-static int filename_removexattr(int dfd, struct filename *filename,
-				unsigned int lookup_flags, struct xattr_name *kname)
+int filename_removexattr(int dfd, struct filename *filename,
+			 unsigned int lookup_flags, struct xattr_name *kname)
 {
 	struct path path;
 	int error;
-- 
2.47.3

