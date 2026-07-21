Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89905480974
	for <io-uring@vger.kernel.org>; Tue, 21 Jul 2026 10:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784630147; cv=none; b=DH2pDj5Cg3fogW6ULI3CczbJ4egMtaO/tzBxIk1rrhALJKVOgjYMvQ0xzWuQaE4GPA0hT2Brsgcvx76jsdRjgY6cBLXABUmMRihzMgvAuaXQ9LGVsMxYjRTYQ4Ka5D0+p7nEruJG8uBolyaMYm8ik0gkAsROuxLz8wCps8fh9eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784630147; c=relaxed/simple;
	bh=ghPQ9mcgrKz3+U+ilyhGAv/Y8JcFyKgalrPrJ8yyfC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kk1shZSEMofVuo/xJujrKknaQPUyNpd8ME2V8rlt50deC9J7GIZ+xyh+GXYgrFlHAByfDCGyz68108aEN6B0z3R75paHCzMWIAfsaoj5hKQB5r4R1Bl38fwQvDfIcQk2fuf9pI82HlDE+bkAbdzO5RnxZx51YwtpWbu3DkzPVHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nkB8WQmw; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nkB8WQmw"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cc97653887so121307065ad.1
        for <io-uring@vger.kernel.org>; Tue, 21 Jul 2026 03:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784630146; x=1785234946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BIMbIeZnuWoiMNHS5JGYvMjDla9rmj1HSMh7d1MFhPo=;
        b=nkB8WQmwI4NdEtLik4DRFTOX639DTcsfCrMxqS6DRymg+EzjpYK7YN+psev6IMJ3Xm
         /KKktnscpcsZXRORDXxIVreMsBQug+Xq/x/SVCEf34M3tJ70ahzBJuvITQPGMt6R83VL
         N8hxr9uBybcdfbddgjicaIfu9dTJjSNCJyyIapNsJe4YawRSdiXvOVTKtxp1Q9QQyFA6
         ewvRNTmMCbT7fiQSrVKA7p8qUI+EtQyynI66IjCekpOk+V4VyGvn6qsGyDtKFYS+wnUt
         vx6cgSpxr1az8wGgwi6CGxJIdzvaWxu2zNg0PKwh5J621dHrfNmt66dDjDOT9TWj/spS
         kwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784630146; x=1785234946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BIMbIeZnuWoiMNHS5JGYvMjDla9rmj1HSMh7d1MFhPo=;
        b=kPibK6F8cxNgjUBx5Ehkc+b1GSavXtC2ErQGNa67+cAVxW8apLknHtRrBKakKUdsZQ
         1324PnP3nYZNoB5TM2NEsQWLrHoMDE4Y4GHpxBJqbCkMtj8uwZtLrR87se+nRR3Qiocx
         zsjFCLP8L2cSzRkFyyOlTl0zC1rdVvQSo7eQCdzKGQE6fsk6q4725Vu5CSBh6Au0pj/I
         TMZnviIEa2XDkxG3wUnKgDZ/jjl2/0fakXj+rzlmwHTGXSKpUCyxEnXog4DO8wQ9n3Og
         hV5APrEw6hAEhIehJa8TM+rzHfHj7R1QFKd6xi9ix1s1F0GE2Rt99+Rg4d2CSXZCrj4P
         4uyQ==
X-Forwarded-Encrypted: i=1; AHgh+RqalFzr+A9GMCbF4w5u6MuDhVpZZg3mHCg8QNqd7UXnrlYXtmZ62/VtoY71FTvWpFt4AlO5uXvIRg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/1h8ZxZ+PfDM9jNWVSwRnV3uTk0rgomyLyR1EGqdNFIx96i4Y
	+ghWKvtg2JiHMP7J9ixpFrf5ODyfNaU+7bNsYQpa4IP+RQUuLW8cvqRa
X-Gm-Gg: AfdE7cnyyRo2CY/LjTlLQ54nOnHt6oFIvX7ZoJLLkVsNBx/66+4mtmeut3ZTjsS+ZW8
	xtmUDxekf3lTZv7j1G24xAIA8lzqpKDSFldbBmFHkNhyLH7KKQgXGahxNsSiwIwiQCBC+NJ+BZ5
	reR2sx7CGAsQXMq91+vrjKQdf7jVq8IMvOtspdZ25Hk6rvpKsCUp9yFbZBgDEFFlEwFaXJN6Ziz
	FIpjpIFqaWqNsT2lq1llEPHe4z7rOZD3wt1hnNIBf5tCG/0oyOzKKSjUQz3cMuaxwMqziYqs48a
	9v7FMbSFchKI63F/cljkdD7eWLzYJxeULAIrDeJ/l/45489o5wgkT43/BKH9cCb87kjvdKTDdct
	Cw4vwNMX3zwX6GsdYmr+oQYq+uJvjoV+EahnV+EQfU0Kt2QfTeR60f5VuYuM8f0bzatyOXkUKN3
	Gg8Bq8QUGjUrB8+esue5eBzF5w2dM4R834E0/2j9LcO3KfL3jHJr5Qt5imxshNMnfhnjGlYHkf8
	sMYx1y6btHeEANskek9isk4RMfGBBhVRWLuIF+rYMbVy2+5cqU2XXqe/zqC1pqmuHX9dKwJkHPX
	mXeWzocCEtx9jMs=
X-Received: by 2002:a05:6a20:a10a:b0:3c3:88a5:83db with SMTP id adf61e73a8af0-3c3ad6036b0mr19195489637.5.1784630145838;
        Tue, 21 Jul 2026 03:35:45 -0700 (PDT)
Received: from cs-1047136853211-default.asia-southeast1-a.c.z168d0f9edf9bc766-tp.internal (114.107.87.34.bc.googleusercontent.com. [34.87.107.114])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20c158sm49922929eec.29.2026.07.21.03.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:35:45 -0700 (PDT)
From: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Jan Kara <jack@suse.cz>,
	io-uring@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
Subject: [PATCH v3 1/2] fs: make file_listxattr and file_removexattr helpers non-static
Date: Tue, 21 Jul 2026 10:35:13 +0000
Message-ID: <20260721103514.2716-2-aditya.ansh182@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721103514.2716-1-aditya.ansh182@gmail.com>
References: <20260721103514.2716-1-aditya.ansh182@gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for adding IORING_OP_FREMOVEXATTR and
IORING_OP_FLISTXATTR support in io_uring, we need to invoke the VFS-layer
helpers from within io_uring.

Make the following helpers non-static and declare them in fs/internal.h:
- file_listxattr()
- file_removexattr()

No functional change is introduced.

Signed-off-by: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
---
 fs/internal.h | 2 ++
 fs/xattr.c    | 3 +--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/internal.h b/fs/internal.h
index 355d93f92208..ee86b24db79a 100644
--- a/fs/internal.h
+++ b/fs/internal.h
@@ -297,6 +297,8 @@ int filename_setxattr(int dfd, struct filename *filename,
 		      unsigned int lookup_flags, struct kernel_xattr_ctx *ctx);
 int setxattr_copy(const char __user *name, struct kernel_xattr_ctx *ctx);
 int import_xattr_name(struct xattr_name *kname, const char __user *name);
+ssize_t file_listxattr(struct file *f, char __user *list, size_t size);
+int file_removexattr(struct file *f, struct xattr_name *kname);
 
 int may_write_xattr(struct mnt_idmap *idmap, struct inode *inode);
 
diff --git a/fs/xattr.c b/fs/xattr.c
index d58979115200..31b8a5eeec1e 100644
--- a/fs/xattr.c
+++ b/fs/xattr.c
@@ -953,7 +953,6 @@ listxattr(struct dentry *d, char __user *list, size_t size)
 	return error;
 }
 
-static
 ssize_t file_listxattr(struct file *f, char __user *list, size_t size)
 {
 	audit_file(f);
@@ -1036,7 +1035,7 @@ removexattr(struct mnt_idmap *idmap, struct dentry *d, const char *name)
 	return vfs_removexattr(idmap, d, name);
 }
 
-static int file_removexattr(struct file *f, struct xattr_name *kname)
+int file_removexattr(struct file *f, struct xattr_name *kname)
 {
 	int error = mnt_want_write_file(f);
 
-- 
2.47.3

