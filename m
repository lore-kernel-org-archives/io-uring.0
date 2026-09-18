Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF8B4BA1D6
	for <io-uring@vger.kernel.org>; Fri, 18 Sep 2026 09:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789722078; cv=none; b=MlHfzYFJkZv3nboJXOXLUIbVENMmBueax9wBubqPYJgJHe0rdP/I5asiYdpVgpWyogQ4WJ+KNz/yDdR3be8+b1Bfq0FmVOIakc+gItVHiI8wqHRNcW9MK5ohNTFlMuMRxpIRgGMZrrQhCbOIdfla6SJ8NdnnJVJWKiEJqItH3HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789722078; c=relaxed/simple;
	bh=+o0snggj/m/2d8D7ycD9G9GtJCC4yhk0g3zHdR/kbaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FBeCX5OwRK4G83/i/rhBlgE2VaRmxFleYwElJiUT1n/+5K5pEjtyzOMGKuEW07UclRfup41RWu+/CtRusGvBSOhz5xROSlIeM5WIowWKt/cGhHaFKdOvc8cNUCdaQWsde4v/ZdPB07J8iX9vF+2kawxs7YNfFAvaZ+S81pKDjKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGJ32yGV; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGJ32yGV"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8693af0d7c4so638663b3a.3
        for <io-uring@vger.kernel.org>; Fri, 18 Sep 2026 02:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789722076; x=1790326876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x6YgE1Yw7lkJk47zy1LDh67BaPudxiOFGn/bxCkqDz4=;
        b=HGJ32yGVw5hv2acG/U4+3uAFcH3GM9iSovhV15zxNAlLBvTvfcE7uBoMw4ly0Ib6Yp
         LWwpgO5Aw7dME6SP/rJt8A/wPZLlJmQtcU/dMjN7VVQFFSw7Ma/LXsk2wyiQcu8uhnlF
         +OUnzHdWOFUiUdaOXY4JymNt6rqVUU19dJATWnMRBHeoa5uWrTu6ySWwRB8ELf1Mo3+O
         13MrcI9JfwncRDTLMirQixJM+oveeIh0q1QGdZun33R108wlvzpiuSoQlmmQBlLWbuvA
         XgOQ2lqYNOdvAQFu7B6yJqvX2ZK/97rBlRlPsognqPRy9kEq8qDdkAvmhJS0KUxMmwRZ
         D3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789722076; x=1790326876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x6YgE1Yw7lkJk47zy1LDh67BaPudxiOFGn/bxCkqDz4=;
        b=ASQHrWbMgoh59UyWv3MPSxOFFRcNx2+l6t3pat5P19uizc2KIkLeCN6Ro4OdN09bYB
         Hh2LrSn0gp3CuFOLcUkLzqdv1hF+VeceCgA4OGxUkOUz6Nb5ErJzMWadFbVKIS9TFRq8
         U+SlOw9nAqVKjpdbKEbJYbYwQoioIJP4rgt6dsA4tAf3Zv9JsaVzT8nauoJa8BHrnRlt
         42xERIavatO8poHPxhJ+bb2O3qgmPLOs9KjW9mRCcixX3srqAEo+P8wkUSUO92NZouYW
         OB47SSuINJ0QvMYyv6kqZq1t0mMx8nVxq/8MS+RA9W7A8I9KmTW3Vu0ASZbDvAYvnz1I
         MPOw==
X-Forwarded-Encrypted: i=1; AKwUvBwaZMKsQQHQqaH8IaB0hEVTHUPFy7QLgLmV4cIBi0bNP4BTYSyIAVejTCZwk1HuPT0ieA11w1/HwQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mlBVOSp59/5OrLZp7vP8FEKJbXq5mfl97nlhvsgC25duEPThAH
	llUH5ed3IxgigHfKNLnZS29QHk+59o0eU5TR3o/cw7LRQ/NNfR/ho38fWOxHVO1EaBmFyg==
X-Gm-Gg: AYBFou3zqzDkGIpFCh3prb6501uWmJ3mrQ1/yVTOS49ARj+J+kuUXZPHr6d9xia4qNo
	gconLayYYeNvlvcarTJ5PMZt/9T0SEvMYg2ILj85cHu1GKhR6zhPyNt9hMvOOMkI6SSU2hLMev8
	HczpK48p+8yUtukXXJMQ5duB2xlHrWWkS13+UWaphzdhOq4L+VeDE1h6V0v48RoV70wc5Hdqfsk
	lRRzLH60415sdmMIN+KB6DOAztizo0JSQf6wDElL9/nyvkxDXEJydL9TCncB/M+igFy2UKoMury
	7D6KqvjyHXr+R1a2oa81Tb9aGOE7WS0GdQ9nT4CxXnESJ6AAtUJObfBbAqEoLMw/CM5n6sZZhhm
	J3mF5iBUhRDvY7rOrKQbmdumMeAKdWNdhM+X+TkEI4vZ2l77gvVt/ZPZAxxIvBperzQDL2s79xM
	AxPEu4hfGqDiKRU8t5Egr7Sxy8sZ6qT3W5DCT6KeceBQt2+8C+3RrkfYhQg44WL9v84cXcUHGKC
	QhX/N15kb7/qjdP26rY8sIL5Regpd4L6OaEzjP5xlliFA5gHW4bnS7T/ft8BKF+kxiUNg5d64GE
	tCed0HHsntfZ+RrzOwogdbZHoPjG4DAkmIq7CrO5ti+8vh/EpeWUqtLGzVmCWqL09QUJAcvSsar
	/I5Y3nA==
X-Received: by 2002:a05:6a00:13a7:b0:855:74f7:40c2 with SMTP id d2e1a72fcca58-874dc7e5dd3mr3205309b3a.14.1789722075508;
        Fri, 18 Sep 2026 02:01:15 -0700 (PDT)
Received: from cs-1047136853211-default.asia-southeast1-a.c.t54fbfa9bf0658dcb-tp.internal (96.177.21.34.bc.googleusercontent.com. [34.21.177.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-875dc8fa40fsm504491b3a.15.2026.09.18.02.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:01:15 -0700 (PDT)
From: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Christian Brauner <brauner@kernel.org>,
	Gabriel Krisman Bertazi <krisman@suse.de>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	io-uring@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
Subject: [PATCH v4 2/3] fs: make file_listxattr and file_removexattr helpers non-static
Date: Fri, 18 Sep 2026 09:00:09 +0000
Message-ID: <20260918090010.1688-3-aditya.ansh182@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918090010.1688-1-aditya.ansh182@gmail.com>
References: <20260918090010.1688-1-aditya.ansh182@gmail.com>
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

Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
---
 fs/internal.h | 2 ++
 fs/xattr.c    | 3 +--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/internal.h b/fs/internal.h
index c658c8a5ebd5..ff7344ac8cef 100644
--- a/fs/internal.h
+++ b/fs/internal.h
@@ -298,6 +298,8 @@ int filename_setxattr(int dfd, struct filename *filename,
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

