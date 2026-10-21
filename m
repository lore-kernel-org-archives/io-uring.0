Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568736;
	b=uJdPyRDP63O4rONhN6RSf2S2uBbl1RV8LMCegORTRR7bOKRgVnh0HYQQczcgONRIy6ir
	 zvSYn7A/ySFxr6ZYihE0TIwjyQKfrLfDtdCn/6aS7XLBITiZ/EsBGvipwEzPloRcntLne
	 UvyjA4uhACeD40SWYf+aLV9wRwD8I5DyhqM+ZBQ6vunQxxQvzLc8ZoyFwhhnKoU9RhXnZ
	 ypPQBqIPv6wexcSYhvdk2I2wir0yeXwaPywJMASZmXFAPBTViHAGwX3+IHla/LdyubO0/
	 yjL2SIQdcb9c6hUZXfIGMyDaokg7qyebXdai3qd7so+OpjPmlWxZlXDt1rDQOZQipsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=VbSlF666/qtELADyJnYbEb4dVJFod2JtONLzJEpZbCw=;
	b=GiVgQEybZYnJhLiz+TxKKIuMsyNkwLHnqhM1GYrea2NkIJsaFVN2zakJH5qKh3VmYoR7
	 yHQGwrwROMnmNaXfIyxudOvAdpvkNQdg4ZV4VKzlarRgZNeznloPF0QlExo+9sNYPBdoc
	 6y19iC1zN6O+p89FYD6+ZgIAKEodnb+RCFNACmAPirkXCc/sjjhDz0KN8Mnko9gQV2qDS
	 2nPC66+EjZjCRMWCAeiw5xRsgPqkcfkANAiXUWCr0NgqTNk+YzvuB10ndkPr8Zgdp92tL
	 PsTbjMcUvB4fqtIoL0RQoR5rNa87ZyXEfenJYLVOKPOBEhhSyDUwh05PPPKZLL4gswg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=T+LwCzYD;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA52606A31A
	for <io-uring@vger.kernel.org>; Wed, 21 Oct 2026 07:45:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AA52606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=T+LwCzYD
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so821100eec.0
        for <io-uring@vger.kernel.org>; Wed, 21 Oct 2026 00:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792568735; x=1793173535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VbSlF666/qtELADyJnYbEb4dVJFod2JtONLzJEpZbCw=;
        b=T+LwCzYD/+r3BD1t+gyX97/dXd8OAFO5P+jNDQbK6LBfuQBk/f5tFHQ5H1+1yTFkny
         fz1z60u+HaatTEwFW5AdQ2dQaf+TzVc0F3dC3a6bnqthoU6GqAa3HfCItZr68hXCmkiN
         dwVgHJlE0TBg0buaRuftRj3qfT8gjqO+gJwjNbfX6FpYzM5Y2+1i5SE59OjVNm3J8t4b
         sxW4sPnqXAdKtqgEtv2YIBzgA5dUWuXnJBAerRFL5WfdCyNsxMWCnVlp3MMZakD9/rZg
         PrdWPeI7joEvJHx9HIIsQ6TetsbqF0N8xt+r1swkmcRbjU3aEoP3fS9tRqkXzQDn2iFy
         W7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792568735; x=1793173535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VbSlF666/qtELADyJnYbEb4dVJFod2JtONLzJEpZbCw=;
        b=Dl+6lFlD1mjzZTpTA6yy99TSyyjjIMd5ugd+CVvHAJ6E9nodo2hV0WwE+mOqzHkbD1
         rkfi6uFkHNqyc2ubbdsqTfwE/MXoUZ8xprw7PWKyGMfo/j7lmD3Xdo5Ei5ga9iVN78eG
         kAmoyeGVVCbKh1+50kaDOU6faQhY9WlIyPtEV6IGQHBXoRbXg3vcKkY++7hesY4X5vUv
         fIvqiR1qXh8Wi4RDNH7QzgQu6wem5P2dMdNv2qJKHsKVbzJicRWCbD5+II3ZOXHZaeqZ
         K8rdYpyrKH9MiiaKfOyHWkrZevopyiOQuRBDzzlHMpMcwsyUXGzcCUrfvaG4qbqNGHg1
         ntAQ==
X-Gm-Message-State: AFq9FYLmFamgzZSmrjWHzhuPnuW41x6Jg08sqyxb9EV10R8Fp7Yc7RsV
	8SsvD8hjqXLRbldKXjYsoN9Y21nfKm6fl1sW547C5N8fkWWks9Q7BVMOCUjMS4Dl
X-Gm-Gg: AYBFou0prb8TT4I8O1QDKO/DFwhsHMhaqUqqO3fKL04NKwQXWqAe+BrLTUonV5Eus/8
	vq9F+fn+XLWayirMq4VhyUG5Y1ub3PaYodBhBgABx4/74Lw+9HYFm5Fp8lJIpYAV+8nF+QKQGCN
	T1fjaOj4OyBYZ5xjl54VIt6szuP02Ta84vx17y6sVQxJXU0jQ0zs0dJUimoIdWxUVd/aVqZzas8
	dTE48NrXiONMPxEjb3a9F7gbub1Q7fXNN2PXc9XeXscBsMLmg/679lQxdSbyxQ5Acs3acfw9T7l
	di/76K76YGV4AuV5GY7aDKyqPT2LEDAUqZ89AM2UYDBanP+ZRelAiB2bFL0oJuYKoFzBj3QzO7f
	xyuhKRI4GjwuGnZP46VtZoD+1pnmxv17uoN9hWRRaFg2lYdSVvGervdSGtaQ0DEAJO4PWhku3MS
	9QxUDtcdE6aX4GX4zGN42MVQJ+rk8R4qSFSL/upbCfM0fbxUqUZmNB9tIc4YybTze1DSf5rzd05
	TK74QYe8waKBsuZ1oq2iH8Z4xtiv2vw7e+Y65Y7sIAHTqlU9o9YJz0544kU3AvA5Mn/0CVAQKzI
	xDZb676cHUKbNhc=
X-Received: by 2002:a05:693c:2a0b:b0:351:bb8f:540c with SMTP id 5a478bee46e88-3674df47953mr2365876eec.35.1792568735108;
        Wed, 21 Oct 2026 00:45:35 -0700 (PDT)
Received: from Athena ([36.255.108.104])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367412b24e3sm4352662eec.19.2026.10.21.00.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:45:34 -0700 (PDT)
From: Harshal Chavan <harshal24.chavan@gmail.com>
To: io-uring@vger.kernel.org,
	axboe@kernel.dk
Cc: krisman@suse.de,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Harshal Chavan <harshal24.chavan@gmail.com>
Subject: [PATCH v7] io_uring/register: add IORING_REGISTER_CLONE_FILES opcode
Date: Wed, 21 Oct 2026 13:15:17 +0530
Message-ID: <20261021074517.68961-1-harshal24.chavan@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, if an application wants to duplicate registered file
descriptors from one io_uring instance to another, it must manually
unregister and re-register them, incurring unnecessary overhead.

Add IORING_REGISTER_CLONE_FILES to allow direct cloning of the file
table from a source ring to a destination ring. This implementation
strictly mirrors the io_clone_buffers UAPI, supporting partial offsets
and the IORING_REGISTER_DST_REPLACE flag.

To ensure lock synchronization safety, destination nodes are strictly
allocated as new, private io_rsrc_nodes rather than sharing references
across rings.

Signed-off-by: Harshal Chavan <harshal24.chavan@gmail.com>
---
v7:
  - Copy src_node->tag to dst_node in io_clone_file_node (Gabriel).
v6:
  - Fixed trailing whitespace checkpatch error.
v5:
  - Added missing spacing in comment (Gabriel).
  - Removed ctx->user and mm_account checks (Gabriel).
  - Used !! for boolean conversion (Gabriel).
  - Moved mutex_unlock unconditionally above the out label (Gabriel).
  - liburing implementation and tests: https://github.com/axboe/liburing/pull/1606
v4:
  - Updated Signed-off-by to use real name and moved above the scissors line (Greg KH).
v3:
  - Rewrote the cloning loop to allocate private destination nodes via io_rsrc_node_alloc to fix non-atomic ref lock synchronization (Jens).
  - Maintained partial offset/copy support to mirror io_clone_buffers UAPI (Jens).
  - Gated the replacement free check on ctx->file_table.data.nr (Gabriel).
  - Prevented self-cloning by checking ctx == src_ctx (Gabriel).
  - Removed submitter_task check to allow cross-thread pooling setups (Gabriel).
v2:
  - Dropped unrelated whitespace formatting changes from v1.
---
 include/uapi/linux/io_uring.h |  12 +++
 io_uring/register.c           |   6 ++
 io_uring/rsrc.c               | 140 ++++++++++++++++++++++++++++++++++
 io_uring/rsrc.h               |   1 +
 4 files changed, 159 insertions(+)

diff --git a/include/uapi/linux/io_uring.h b/include/uapi/linux/io_uring.h
index 909fb7aea638..2ba13d30a6cf 100644
--- a/include/uapi/linux/io_uring.h
+++ b/include/uapi/linux/io_uring.h
@@ -723,6 +723,9 @@ enum io_uring_register_op {
 	/* register bpf filtering programs */
 	IORING_REGISTER_BPF_FILTER		= 37,
 
+	/* clone registered files from source ring to current ring */
+	IORING_REGISTER_CLONE_FILES		= 38,
+
 	/* this goes last */
 	IORING_REGISTER_LAST,
 
@@ -845,6 +848,15 @@ enum {
 	IORING_REGISTER_DST_REPLACE	= (1U << 1),
 };
 
+struct io_uring_clone_files {
+	__u32 src_fd;
+	__u32 flags;
+	__u32 src_off;
+	__u32 dst_off;
+	__u32 nr;
+	__u32 pad[3];
+};
+
 struct io_uring_clone_buffers {
 	__u32	src_fd;
 	__u32	flags;
diff --git a/io_uring/register.c b/io_uring/register.c
index dab3eb4258df..057ef27e6e4d 100644
--- a/io_uring/register.c
+++ b/io_uring/register.c
@@ -978,6 +978,12 @@ static int __io_uring_register(struct io_ring_ctx *ctx, unsigned opcode,
 			WRITE_ONCE(ctx->bpf_filters,
 				   ctx->restrictions.bpf_filters->filters);
 		break;
+	case IORING_REGISTER_CLONE_FILES:
+		ret = -EINVAL;
+		if (!arg || nr_args != 1)
+			break;
+		ret = io_register_clone_files(ctx, arg);
+		break;
 	default:
 		ret = -EINVAL;
 		break;
diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 51b46e624ddd..b4bbfb5ceb30 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -1501,6 +1501,146 @@ int io_register_clone_buffers(struct io_ring_ctx *ctx, void __user *arg)
 	return ret;
 }
 
+static int io_clone_file_node(struct io_ring_ctx *ctx,
+			      struct io_rsrc_node *src_node,
+			      int dst_index,
+			      struct io_file_table *new_table)
+{
+	struct io_rsrc_node *dst_node;
+	struct file *file;
+
+	dst_node = io_rsrc_node_alloc(ctx, IORING_RSRC_FILE);
+	if (!dst_node)
+		return -ENOMEM;
+
+	file = io_slot_file(src_node);
+	get_file(file);
+	io_fixed_file_set(dst_node, file);
+	dst_node->tag = src_node->tag;
+
+	new_table->data.nodes[dst_index] = dst_node;
+	io_file_bitmap_set(new_table, dst_index);
+
+	return 0;
+}
+
+static int io_clone_files(struct io_ring_ctx *ctx, struct io_ring_ctx *src_ctx,
+			  struct io_uring_clone_files *arg)
+{
+	struct io_file_table new_file_table;
+	unsigned int dst_nr = ctx->file_table.data.nr;
+	unsigned int src_nr = src_ctx->file_table.data.nr;
+	unsigned int new_nr, i;
+
+	lockdep_assert_held(&ctx->uring_lock);
+	lockdep_assert_held(&src_ctx->uring_lock);
+
+	if (dst_nr && !(arg->flags & IORING_REGISTER_DST_REPLACE))
+		return -EBUSY;
+
+	if (!src_nr)
+		return -ENXIO;
+
+	if (!arg->nr)
+		arg->nr = src_nr;
+	else if (arg->nr > src_nr)
+		return -EINVAL;
+
+	if (check_add_overflow(arg->src_off, arg->nr, &i) || i > src_nr)
+		return -EINVAL;
+	if (check_add_overflow(arg->dst_off, arg->nr, &i))
+		return -EINVAL;
+
+	new_nr = max(dst_nr, arg->dst_off + arg->nr);
+	if (new_nr > IORING_MAX_FIXED_FILES)
+		return -EINVAL;
+
+	memset(&new_file_table, 0, sizeof(new_file_table));
+	if (!io_alloc_file_tables(ctx, &new_file_table, new_nr))
+		return -ENOMEM;
+
+	for (i = 0; i < min(arg->dst_off, dst_nr); i++) {
+		struct io_rsrc_node *src_node = io_rsrc_node_lookup(&ctx->file_table.data, i);
+
+		if (!src_node)
+			continue;
+		if (io_clone_file_node(ctx, src_node, i, &new_file_table))
+			goto out;
+	}
+
+	for (i = 0; i < arg->nr; i++) {
+		struct io_rsrc_node *src_node = io_rsrc_node_lookup(&src_ctx->file_table.data,
+				arg->src_off + i);
+
+		if (!src_node)
+			continue;
+		if (io_clone_file_node(ctx, src_node, arg->dst_off + i, &new_file_table))
+			goto out;
+	}
+
+	for (i = arg->dst_off + arg->nr; i < dst_nr; i++) {
+		struct io_rsrc_node *src_node = io_rsrc_node_lookup(&ctx->file_table.data, i);
+
+		if (!src_node)
+			continue;
+		if (io_clone_file_node(ctx, src_node, i, &new_file_table))
+			goto out;
+	}
+
+	if (dst_nr)
+		io_free_file_tables(ctx, &ctx->file_table);
+
+	WARN_ON_ONCE(ctx->file_table.data.nr);
+	ctx->file_table = new_file_table;
+	io_file_table_set_alloc_range(ctx, 0, ctx->file_table.data.nr);
+	return 0;
+
+out:
+	io_free_file_tables(ctx, &new_file_table);
+	return -ENOMEM;
+}
+
+int io_register_clone_files(struct io_ring_ctx *ctx, void __user *arg)
+{
+	struct io_uring_clone_files clone_arg;
+	struct io_ring_ctx *src_ctx;
+	bool registered_src;
+	struct file *file;
+	int ret;
+
+	if (copy_from_user(&clone_arg, arg, sizeof(clone_arg)))
+		return -EFAULT;
+	if (clone_arg.flags &
+	    ~(IORING_REGISTER_SRC_REGISTERED | IORING_REGISTER_DST_REPLACE))
+		return -EINVAL;
+
+	if (memchr_inv(clone_arg.pad, 0, sizeof(clone_arg.pad)))
+		return -EINVAL;
+
+	registered_src = !!(clone_arg.flags & IORING_REGISTER_SRC_REGISTERED);
+	file = io_uring_ctx_get_file(clone_arg.src_fd, registered_src);
+	if (IS_ERR(file))
+		return PTR_ERR(file);
+
+	src_ctx = file->private_data;
+	if (src_ctx == ctx) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	mutex_unlock(&ctx->uring_lock);
+	lock_two_rings(ctx, src_ctx);
+
+	ret = io_clone_files(ctx, src_ctx, &clone_arg);
+
+	mutex_unlock(&src_ctx->uring_lock);
+
+out:
+	if (!registered_src)
+		fput(file);
+	return ret;
+}
+
 void io_vec_free(struct iou_vec *iv)
 {
 	if (!iv->iovec)
diff --git a/io_uring/rsrc.h b/io_uring/rsrc.h
index 9ef88383b363..10b66f3e2492 100644
--- a/io_uring/rsrc.h
+++ b/io_uring/rsrc.h
@@ -71,6 +71,7 @@ int io_prep_reg_iovec(struct io_kiocb *req, struct iou_vec *iv,
 			const struct iovec __user *uvec, size_t uvec_segs);
 
 int io_register_clone_buffers(struct io_ring_ctx *ctx, void __user *arg);
+int io_register_clone_files(struct io_ring_ctx *ctx, void __user *arg);
 int io_sqe_buffers_unregister(struct io_ring_ctx *ctx);
 int io_sqe_buffers_register(struct io_ring_ctx *ctx, void __user *arg,
 			    unsigned int nr_args, u64 __user *tags);
-- 
2.55.0

