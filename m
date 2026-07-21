Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC02A3C0A12
	for <io-uring@vger.kernel.org>; Tue, 21 Jul 2026 08:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784624139; cv=none; b=ptJVlBElsyAz04zvryI8+K3RdOz09ZduSYWKrLpGeizSp7jxQyhFGJO6n7C5+I0jHv3Cg+3JekoXNZTWNq4iEDM7lMxE29fRju6FhU3W0ki2YF6Mh9POaaFA1E2wyu+fq3mFxf1q7iEoIAzhpWoPPgBzokue7jbD6HeJprQD9A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784624139; c=relaxed/simple;
	bh=AHoE8B0vKzWqpdJAHDaftEMLzrqBA9eXmvJ0WGKiDF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KB8CgieqBnNsABj/ceBSNd+Hzv9Mw3MAaZnzDHhdo1pq8q0ch+/zkbShtpzv65fwneCTeFg/TNSgBWnRKz9xn7L+UeCAEFUVGD0o2U87RYy6wfF1FVsiEjrDmAnodW4Fprc6AWuvRLXdwqwa5/BxesmbBVbfSiTDAUre2EiCw10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QP+40urf; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QP+40urf"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cae1a3a744so83380475ad.3
        for <io-uring@vger.kernel.org>; Tue, 21 Jul 2026 01:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784624137; x=1785228937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HrK5Y+cUu3sn93vpsDCo0Tjc6K/8b9DvciXsUp54rDw=;
        b=QP+40urfPdUY49NZGf6Kuf2Xe+QAVOviffBp3Ddmf0NunylXdkKyzHKUmYR1MOQidd
         9E70IzMVuQo2bOWRzFXJK3Ykc3JvAMY+wQ4xHwBFEpHAtkXkNHV6O8GNNvnzXaKhmKSw
         xRMB96KNPwkvP6m0obKkbtuIiGh3XL9C4IaKKVpQFq6Cz9GrJYdFd+LflpiBMaPp/YyZ
         0bfmDYftTULDlgrcLXQIl5Us1Ei2MTIFycahbQ+4m4knzGxMLrz/5ese11GElNKN8gcJ
         ZuIA3ybK1v5PgE310J9qPB00KkWO3kU6gn/0MqZLVqiZ12Jtgm35akSWi51viuTE6GS2
         O1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784624137; x=1785228937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HrK5Y+cUu3sn93vpsDCo0Tjc6K/8b9DvciXsUp54rDw=;
        b=BaYMdoSCrmM4rlES+kec8uGLPR2Hus+qpi65twYlW7mNW5pdynj6GGHukaMVqCdus0
         7HtNVedjMzMGi/+jSNqMhNEJJJwCpoZ0CCxt/6TI5ncF0Mqf6pQPzw1xiUs6aKFa0Gg1
         cNXI78ueQzb9lJrv3DGaISzKoZ+Sh4futbuVsbEIdjBtsCORvlb/xObYu6EKf2jQGqhD
         Bon38nt2g2poAEARFAT1rVJGbEK7Ad+Gp+CT/CRiBlSN/q1CrxLcyu++lxXyDPAuHBPa
         8iqR1FBKqCivsJaixIvlT6fdGdEQ49phq2N6khFuDgoHr4bvuabc1UCQYcq6uakpndI9
         PiVA==
X-Forwarded-Encrypted: i=1; AHgh+RpRqwIeZb8VUxSpvDcOGmhpiV9rLpJiYSIx71VKaA9dH6eXjWSwEQXtL9VrQM5kax8E+fAO/dztOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh4vdB5UPE85mod0iju4rOJ2p/9N+kEexEST/MIPwur3GzCWr+
	Ea4brZjL4d/zVC/KXoNGnLk/37tXY52Lpzz1HzvdQbJfdNJBu+KbeqR6
X-Gm-Gg: AfdE7clC7AJEU5chq2l+IjukYCUEVKGKHemDio9qMBGXe/NHkoljE6geNStfLuCXxIb
	Aw1lda5f6IaxjnlS9jEoseJ66xJ4IoI+gYgR1MCY/cvmBLJ317i7Z6Jb8Cl4fovbgYDexMq3fbc
	Y3NQUEqgWJX1xUI5L7guCfjGMaCgOXBfUSd7jghYU/qd709mNQliLpdu8w2KhmCtMuIoKrYXwGM
	K6M7JLb04/y2yzX7KH0kWdk5zIr0XMF7W+jK+tFAXgEbW7meiwqYUxq6FJv370RT7t/iuzfwAaO
	KwCLo23IU7Uxl5N8j89nY+anu4OKUwUuiCY1xvA/b+pRr2AfLHJvjpdKj0zoXD2qZA/i/STkMWu
	6BKefAvYSR4d4HSF/7suGhUhUc3dXld4G6ttweqg/wGMOYFa6f76NFia8KKMKAzyUcxLLEaFEKK
	VL7z5WZXg+P1e9sSSEGvCCGgJYfU9eDipcEc2Iz3Kkrt4AAmnxO2o7qIQokTsoeT8fh8zkO9hmo
	W66PD1CqxAUZnlD7CNYZLN/JnnI7ZyRvN9aRuvPeuGgTJyUmFTWdTBHAPl4E4yMHL/Q3y2ZGJtQ
	IHTdo2c8n+ZvmC1E1j0z
X-Received: by 2002:a05:6a21:6b83:b0:3c3:8222:b8c9 with SMTP id adf61e73a8af0-3c3ada39a49mr19476672637.67.1784624136841;
        Tue, 21 Jul 2026 01:55:36 -0700 (PDT)
Received: from cs-1047136853211-default.asia-southeast1-b.c.z168d0f9edf9bc766-tp.internal (8.99.126.34.bc.googleusercontent.com. [34.126.99.8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429cf22b3sm45463137eec.0.2026.07.21.01.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 01:55:36 -0700 (PDT)
From: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Jan Kara <jack@suse.cz>,
	io-uring@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
Subject: [PATCH v2 2/2] io_uring: add fremovexattr and flistxattr support
Date: Tue, 21 Jul 2026 08:54:58 +0000
Message-ID: <20260721085458.2716-3-aditya.ansh182@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721085458.2716-1-aditya.ansh182@gmail.com>
References: <20260721085458.2716-1-aditya.ansh182@gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for IORING_OP_FREMOVEXATTR and IORING_OP_FLISTXATTR. This
enables xattr listing and removal operations to be executed in an
asynchronous fashion.

Signed-off-by: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
---
 include/uapi/linux/io_uring.h       |  2 +
 io_uring/opdef.c                    | 18 +++++++
 io_uring/xattr.c                    | 74 +++++++++++++++++++++++++++++
 io_uring/xattr.h                    |  6 +++
 tools/include/uapi/linux/io_uring.h | 13 +++++
 5 files changed, 113 insertions(+)

diff --git a/include/uapi/linux/io_uring.h b/include/uapi/linux/io_uring.h
index 909fb7aea638..805f1e31f492 100644
--- a/include/uapi/linux/io_uring.h
+++ b/include/uapi/linux/io_uring.h
@@ -318,6 +318,8 @@ enum io_uring_op {
 	IORING_OP_PIPE,
 	IORING_OP_NOP128,
 	IORING_OP_URING_CMD128,
+	IORING_OP_FREMOVEXATTR,
+	IORING_OP_FLISTXATTR,
 
 	/* this goes last, obviously */
 	IORING_OP_LAST,
diff --git a/io_uring/opdef.c b/io_uring/opdef.c
index 4e58eb1344ea..25d9229d8fc0 100644
--- a/io_uring/opdef.c
+++ b/io_uring/opdef.c
@@ -591,6 +591,16 @@ const struct io_issue_def io_issue_defs[] = {
 		.prep			= io_uring_cmd_prep,
 		.issue			= io_uring_cmd,
 	},
+	[IORING_OP_FREMOVEXATTR] = {
+		.needs_file		= 1,
+		.prep			= io_fremovexattr_prep,
+		.issue			= io_fremovexattr,
+	},
+	[IORING_OP_FLISTXATTR] = {
+		.needs_file		= 1,
+		.prep			= io_flistxattr_prep,
+		.issue			= io_flistxattr,
+	},
 };
 
 const struct io_cold_def io_cold_defs[] = {
@@ -849,6 +859,14 @@ const struct io_cold_def io_cold_defs[] = {
 		.sqe_copy		= io_uring_cmd_sqe_copy,
 		.cleanup		= io_uring_cmd_cleanup,
 	},
+	[IORING_OP_FREMOVEXATTR] = {
+		.name			= "FREMOVEXATTR",
+		.cleanup		= io_xattr_cleanup,
+	},
+	[IORING_OP_FLISTXATTR] = {
+		.name			= "FLISTXATTR",
+		.cleanup		= io_xattr_cleanup,
+	},
 };
 
 const char *io_uring_get_opcode(u8 opcode)
diff --git a/io_uring/xattr.c b/io_uring/xattr.c
index 5303df3f247f..9b410f91ef43 100644
--- a/io_uring/xattr.c
+++ b/io_uring/xattr.c
@@ -195,3 +195,77 @@ int io_setxattr(struct io_kiocb *req, unsigned int issue_flags)
 	io_xattr_finish(req, ret);
 	return IOU_COMPLETE;
 }
+
+int io_fremovexattr_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
+{
+	struct io_xattr *ix = io_kiocb_to_cmd(req, struct io_xattr);
+	const char __user *name;
+	int ret;
+
+	INIT_DELAYED_FILENAME(&ix->filename);
+	name = u64_to_user_ptr(READ_ONCE(sqe->addr));
+
+	if (READ_ONCE(sqe->addr2) || READ_ONCE(sqe->len) || READ_ONCE(sqe->xattr_flags))
+		return -EINVAL;
+
+	ix->ctx.kname = kmalloc_obj(*ix->ctx.kname);
+	if (!ix->ctx.kname)
+		return -ENOMEM;
+
+	ret = import_xattr_name(ix->ctx.kname, name);
+	if (ret) {
+		kfree(ix->ctx.kname);
+		return ret;
+	}
+
+	req->flags |= REQ_F_NEED_CLEANUP;
+	req->flags |= REQ_F_FORCE_ASYNC;
+	return 0;
+}
+
+int io_fremovexattr(struct io_kiocb *req, unsigned int issue_flags)
+{
+	struct io_xattr *ix = io_kiocb_to_cmd(req, struct io_xattr);
+	int ret;
+
+	WARN_ON_ONCE(issue_flags & IO_URING_F_NONBLOCK);
+
+	ret = file_removexattr(req->file, ix->ctx.kname);
+	io_xattr_finish(req, ret);
+	return IOU_COMPLETE;
+}
+
+int io_flistxattr_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
+{
+	struct io_xattr *ix = io_kiocb_to_cmd(req, struct io_xattr);
+
+	INIT_DELAYED_FILENAME(&ix->filename);
+	ix->ctx.kname = NULL;
+	ix->ctx.kvalue = NULL;
+
+	if (READ_ONCE(sqe->addr))
+		return -EINVAL;
+
+	ix->ctx.value = u64_to_user_ptr(READ_ONCE(sqe->addr2));
+	ix->ctx.size = READ_ONCE(sqe->len);
+	ix->ctx.flags = READ_ONCE(sqe->xattr_flags);
+
+	if (ix->ctx.flags)
+		return -EINVAL;
+
+	req->flags |= REQ_F_NEED_CLEANUP;
+	req->flags |= REQ_F_FORCE_ASYNC;
+	return 0;
+}
+
+int io_flistxattr(struct io_kiocb *req, unsigned int issue_flags)
+{
+	struct io_xattr *ix = io_kiocb_to_cmd(req, struct io_xattr);
+	int ret;
+
+	WARN_ON_ONCE(issue_flags & IO_URING_F_NONBLOCK);
+
+	ret = file_listxattr(req->file, ix->ctx.value, ix->ctx.size);
+	io_xattr_finish(req, ret);
+	return IOU_COMPLETE;
+}
diff --git a/io_uring/xattr.h b/io_uring/xattr.h
index 9b459d2ae90c..d2487b49a5d2 100644
--- a/io_uring/xattr.h
+++ b/io_uring/xattr.h
@@ -13,3 +13,9 @@ int io_fgetxattr(struct io_kiocb *req, unsigned int issue_flags);
 
 int io_getxattr_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe);
 int io_getxattr(struct io_kiocb *req, unsigned int issue_flags);
+
+int io_fremovexattr_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe);
+int io_fremovexattr(struct io_kiocb *req, unsigned int issue_flags);
+
+int io_flistxattr_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe);
+int io_flistxattr(struct io_kiocb *req, unsigned int issue_flags);
diff --git a/tools/include/uapi/linux/io_uring.h b/tools/include/uapi/linux/io_uring.h
index f1c16f817742..79bf7c22009d 100644
--- a/tools/include/uapi/linux/io_uring.h
+++ b/tools/include/uapi/linux/io_uring.h
@@ -253,6 +253,19 @@ enum io_uring_op {
 	IORING_OP_FUTEX_WAIT,
 	IORING_OP_FUTEX_WAKE,
 	IORING_OP_FUTEX_WAITV,
+	IORING_OP_FIXED_FD_INSTALL,
+	IORING_OP_FTRUNCATE,
+	IORING_OP_BIND,
+	IORING_OP_LISTEN,
+	IORING_OP_RECV_ZC,
+	IORING_OP_EPOLL_WAIT,
+	IORING_OP_READV_FIXED,
+	IORING_OP_WRITEV_FIXED,
+	IORING_OP_PIPE,
+	IORING_OP_NOP128,
+	IORING_OP_URING_CMD128,
+	IORING_OP_FREMOVEXATTR,
+	IORING_OP_FLISTXATTR,
 
 	/* this goes last, obviously */
 	IORING_OP_LAST,
-- 
2.47.3

