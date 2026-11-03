Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793740242;
	b=CW0YiI2YjhiHDvTF5aqzfRZvUDm6A3yZCs3qG+TwOHHSkFEMKH6sMEaIjSi9Vb9JHe/s
	 +b0Tdokgmi5G8+RG/FHApzmxxnpdjt2UB3zcoqgCJzNGeLa9AZCQ0eRIaBQwZqjYXD84V
	 t0IrgkgJwb3VtwMGd2RSjIuE5i/59MQBeaufdbtX6MRpEr3oYbbHDFaM4nl3u4znvCQpF
	 hxvXg2ZvO3c691bPvYMs/Zp6QribMWonStV3lI7ZnYQ7gv3HIH6LUv9zRo3qwoxFisHHm
	 tknADzULRIR5fwtcMNOCFKa2wPY9iUEYJidAZ/LQsY/vfuN+KPlvSXzAB4iRudoKR/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=acF/cHrZm7ZCAaa+Fii+qkA79+jNQyfoiXDCVuLXYzk=;
	b=IilU9uS91g+Zcv/nei8gsTy7IW6X+JrkhuyB1zv0lst3RAm9qRxTPkrlCeZMo0cBBoWA
	 xM/ZQC9iuCkZGEyw9h50SHmnyr5fOgoILvn1AhZs76uMhWV9c7c8ekWVIPV38mVb+phXi
	 21uE9MZ+1WR0Dig5dzCmjzZ5Ez4nPTweBCmmibOXndXDc/6SCYWWkdRzuHVyTKdLHO1bI
	 aDt9KIelH090IS3HN31F1Hp52zgGhilF4orL1M1ChPELs1nbgk+W3FmQkz7GGIVRBME23
	 p3tMMffv4KlDTFCNE6QXSws7stVdTbT/BtsSRbPb6N+GNMbxtZ+4dLL09vBV6MMGL+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b="Tm/Bdmbm";
	arc=none smtp.remote-ip=209.85.208.97
Received: from mail-ed1-f97.google.com (mail-ed1-f97.google.com [209.85.208.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D90606A332
	for <io-uring@vger.kernel.org>; Tue,  3 Nov 2026 21:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46D90606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Tm/Bdmbm
Received: by mail-ed1-f97.google.com with SMTP id 4fb4d7f45d1cf-6afdd46afe0so1218034a12.2
        for <io-uring@vger.kernel.org>; Tue, 03 Nov 2026 13:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793740240; x=1794345040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=acF/cHrZm7ZCAaa+Fii+qkA79+jNQyfoiXDCVuLXYzk=;
        b=Tm/BdmbmkIqDpkJvZtcxVJiN4mJom/QNFNuxBFfPOyqqx/G3iFt7eAa1NPtMOXeEM3
         gYJm/1FQ6CBW3SM/Wk9wQlxqrn4WPGBzI8orP1XQDO7N0xl+x5AbzkbJHt9fHdI32Xgm
         yzAMX6ToURt20qhKISs6ZhPfpkagLHRWvkYXoSHxezHkLYfHLEsClh0rv9VXVDH0KzHZ
         DS/w9TlXZ+U/Bt/SeFgtkFeIweGFrdcsepTGwG5/4tG9+wQo7XS7bH1ODU4h9lvZiq/Z
         mGmZTgXiRhySBC8mMFa4aOY4fvSzYGOXP4q5IdwIPA3piTXX1y5pcnqcXgs6OGKuCBn4
         Ilxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793740240; x=1794345040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=acF/cHrZm7ZCAaa+Fii+qkA79+jNQyfoiXDCVuLXYzk=;
        b=M3NaviED1AAj1G5FtsnGwBA5FX93aSsSI/jH0qiNtbS+KuAJJS9o/L/IRnnUJg70P+
         at6ydo+JLaHmqEbOM9IIMdsuE0mQGlmkbp/1XsOKB0Fy/lgTFhe1vIkp+3VBr7RKOd2x
         bQ5LlkxuUuSmWVNqic4Wda73Yt9swXFcXHDRShLfys1c1o4iqUX+0pk/L/TZHk6zau5C
         c2xaEqPh7+Gg1rnpTXg8qFrBs8cXE6cRJN7jACbugnNjqsIZfj6MoAkI53IC+6pf0uaO
         s4ynRTTVIRVIU7nIgga4qV2mnx8LMWP+Hoy5j8RzlzudK211dvs/A24eLxJjP194Y1SZ
         0KvA==
X-Gm-Message-State: APuU4Z/S0V4y/frpayazGAFeku4AeXBGTjeqcKgy5Ut4WCxsoVU7W+xw
	PHLJXXchObonARr79ALFaenzQLjOSi1OXWL6b4VKbgGnQYoGA1xhv1bULFBXqj73vZiIlCYcQbQ
	/4n5Dnuu4Argkv47n9YyyaZcKpBaJJp3hxfHB2bfGTvTIEYZ8IlE6
X-Gm-Gg: AYBFou3ZUo9+lcM7r2waPtEBb8Jo2jDfQIpM1ZCoMWTj1VdOlDRUQDxauh95xqyQayA
	mTm1Qruls2RLNWTurpZ3zUPHIyP+y3WrVYIF6vz3D+qYW1FAIevn6/uNFg5FHahs9E6G5Qsg0eL
	2IQ5eUjPSesDSJbQXzZ5qMYdQuTRxrNmDBifrN08ga0MUENiaTBahNhPPoNKkNG1RqX8pZvXcTJ
	kZ7fM8YQXovc1YSl/E+BKekUKoAoSmfjwcPoDVARY8pwAYoWKaIHhpFbkisBqbKaoHxKrKOoaAD
	ky6SEta5Zby3KMsedlm5G+Z8F+oaHlNkOGvDH7VJSg2U3NeUfcBm0kicHXQrriUF8bGAws5+9iI
	4XWv0in4XMxyY9DpFmw==
X-Received: by 2002:a05:6402:7c1:b0:6b4:5ba6:5a70 with SMTP id 4fb4d7f45d1cf-6b4d32861e9mr9622277a12.0.1793740239633;
        Tue, 03 Nov 2026 13:10:39 -0800 (PST)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 4fb4d7f45d1cf-6b55acbc272sm7076a12.8.2026.11.03.13.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:10:39 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [IPv6:2620:125:9025:23::204])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 27CCB43957;
	Tue,  3 Nov 2026 14:10:37 -0700 (MST)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 25607E40437; Tue,  3 Nov 2026 14:10:37 -0700 (MST)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 3/4] io_uring/alloc_cache: assume io_alloc_cache_get() doesn't return NULL
Date: Tue,  3 Nov 2026 14:10:30 -0700
Message-ID: <20261103211031.592745-4-csander@purestorage.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103211031.592745-1-csander@purestorage.com>
References: <20261103211031.592745-1-csander@purestorage.com>
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

All entries in a struct io_alloc_cache are non-NULL, but the compiler
doesn't know this. That results in an unnecessary NULL check on the
return value from io_alloc_cache_get() in the successful case. Return
the success/failure as a separate bool value to avoid the extra NULL
check. Propagate this change to all io_alloc_cache_get()'s transitive
callers.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 io_uring/alloc_cache.c |  2 +-
 io_uring/alloc_cache.h | 21 +++++++++++----------
 io_uring/filetable.c   |  3 +--
 io_uring/futex.c       |  3 +--
 io_uring/io_uring.h    | 11 ++++++-----
 io_uring/net.c         |  4 ++--
 io_uring/poll.c        | 13 ++++++++-----
 io_uring/rsrc.c        | 43 +++++++++++++++++++++---------------------
 io_uring/rsrc.h        |  3 ++-
 io_uring/rw.c          |  4 ++--
 io_uring/uring_cmd.c   |  4 ++--
 11 files changed, 57 insertions(+), 54 deletions(-)

diff --git a/io_uring/alloc_cache.c b/io_uring/alloc_cache.c
index 58423888b736..75cd0b07b97e 100644
--- a/io_uring/alloc_cache.c
+++ b/io_uring/alloc_cache.c
@@ -8,11 +8,11 @@ void io_alloc_cache_free(struct io_alloc_cache *cache,
 	void *entry;
 
 	if (!cache->entries)
 		return;
 
-	while ((entry = io_alloc_cache_get(cache)) != NULL)
+	while (io_alloc_cache_get(cache, &entry))
 		free(entry);
 
 	kvfree(cache->entries);
 	cache->entries = NULL;
 }
diff --git a/io_uring/alloc_cache.h b/io_uring/alloc_cache.h
index aa007b380f1b..6aacbff1fa3a 100644
--- a/io_uring/alloc_cache.h
+++ b/io_uring/alloc_cache.h
@@ -28,11 +28,12 @@ static inline bool io_alloc_cache_put(struct io_alloc_cache *cache,
 		return true;
 	}
 	return false;
 }
 
-static inline void *io_alloc_cache_get(struct io_alloc_cache *cache)
+static inline bool io_alloc_cache_get(struct io_alloc_cache *cache,
+				      void **entry_out)
 {
 	if (likely(cache->nr_cached)) {
 		void *entry = cache->entries[--cache->nr_cached];
 
 		/*
@@ -43,24 +44,24 @@ static inline void *io_alloc_cache_get(struct io_alloc_cache *cache)
 #if defined(CONFIG_KASAN)
 		kasan_mempool_unpoison_object(entry, cache->elem_size);
 		if (cache->init_clear)
 			memset(entry, 0, cache->init_clear);
 #endif
-		return entry;
+		*entry_out = entry;
+		return true;
 	}
 
-	return NULL;
+	return false;
 }
 
-static inline void *io_cache_alloc(struct io_alloc_cache *cache, gfp_t gfp)
+static inline bool io_cache_alloc(struct io_alloc_cache *cache, gfp_t gfp,
+				  void **obj)
 {
-	void *obj;
-
-	obj = io_alloc_cache_get(cache);
-	if (obj)
-		return obj;
-	return io_cache_alloc_new(cache, gfp);
+	if (io_alloc_cache_get(cache, obj))
+		return true;
+	*obj = io_cache_alloc_new(cache, gfp);
+	return *obj;
 }
 
 static inline void io_cache_free(struct io_alloc_cache *cache, void *obj)
 {
 	if (!io_alloc_cache_put(cache, obj))
diff --git a/io_uring/filetable.c b/io_uring/filetable.c
index cb1838c9fc37..3c847c478235 100644
--- a/io_uring/filetable.c
+++ b/io_uring/filetable.c
@@ -70,12 +70,11 @@ static int io_install_fixed_file(struct io_ring_ctx *ctx, struct file *file,
 	if (!ctx->file_table.data.nr)
 		return -ENXIO;
 	if (slot_index >= ctx->file_table.data.nr)
 		return -EINVAL;
 
-	node = io_rsrc_node_alloc(ctx, IORING_RSRC_FILE);
-	if (!node)
+	if (!io_rsrc_node_alloc(ctx, IORING_RSRC_FILE, &node))
 		return -ENOMEM;
 
 	if (!io_reset_rsrc_node(ctx, &ctx->file_table.data, slot_index))
 		io_file_bitmap_set(&ctx->file_table, slot_index);
 
diff --git a/io_uring/futex.c b/io_uring/futex.c
index 9e4e63ee7bc1..9c7d384bab9b 100644
--- a/io_uring/futex.c
+++ b/io_uring/futex.c
@@ -326,12 +326,11 @@ int io_futex_wait(struct io_kiocb *req, unsigned int issue_flags)
 		ret = -EINVAL;
 		goto done;
 	}
 
 	io_ring_submit_lock(ctx, issue_flags);
-	ifd = io_cache_alloc(&ctx->futex_cache, GFP_NOWAIT);
-	if (!ifd) {
+	if (!io_cache_alloc(&ctx->futex_cache, GFP_NOWAIT, (void **)&ifd)) {
 		ret = -ENOMEM;
 		goto done_unlock;
 	}
 
 	req->flags |= REQ_F_ASYNC_DATA;
diff --git a/io_uring/io_uring.h b/io_uring/io_uring.h
index a36a177559f4..4a563bd32c77 100644
--- a/io_uring/io_uring.h
+++ b/io_uring/io_uring.h
@@ -335,18 +335,19 @@ static inline ssize_t io_fixup_restart_res(ssize_t ret)
 	default:
 		return ret;
 	}
 }
 
-static inline void *
+static inline bool
 io_uring_alloc_cached_async_data(struct io_alloc_cache *cache,
 				 struct io_kiocb *req)
 {
-	req->async_data = io_cache_alloc(cache, GFP_KERNEL);
-	if (req->async_data)
-		req->flags |= REQ_F_ASYNC_DATA;
-	return req->async_data;
+	if (!io_cache_alloc(cache, GFP_KERNEL, &req->async_data))
+		return false;
+
+	req->flags |= REQ_F_ASYNC_DATA;
+	return true;
 }
 
 static inline void *io_uring_alloc_async_data(struct io_kiocb *req)
 {
 	const struct io_issue_def *def = &io_issue_defs[req->opcode];
diff --git a/io_uring/net.c b/io_uring/net.c
index e5f7c13519fb..183425f28b0c 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -187,14 +187,14 @@ static void io_netmsg_recycle(struct io_kiocb *req, unsigned int issue_flags)
 static struct io_async_msghdr *io_msg_alloc_async(struct io_kiocb *req)
 {
 	struct io_ring_ctx *ctx = req->ctx;
 	struct io_async_msghdr *hdr;
 
-	hdr = io_uring_alloc_cached_async_data(&ctx->netmsg_cache, req);
-	if (!hdr)
+	if (!io_uring_alloc_cached_async_data(&ctx->netmsg_cache, req))
 		return NULL;
 
+	hdr = req->async_data;
 	/* If the async data was cached, we might have an iov cached inside. */
 	if (hdr->vec.iovec)
 		req->flags |= REQ_F_NEED_CLEANUP;
 	return hdr;
 }
diff --git a/io_uring/poll.c b/io_uring/poll.c
index 4f04bda42f7f..8aca992b72c4 100644
--- a/io_uring/poll.c
+++ b/io_uring/poll.c
@@ -681,16 +681,19 @@ static struct async_poll *io_req_alloc_apoll(struct io_kiocb *req,
 
 	if (req->flags & REQ_F_POLLED) {
 		apoll = req->apoll;
 		kfree(apoll->double_poll);
 	} else {
-		if (!(issue_flags & IO_URING_F_UNLOCKED))
-			apoll = io_cache_alloc(&ctx->apoll_cache, GFP_ATOMIC);
-		else
+		if (!(issue_flags & IO_URING_F_UNLOCKED)) {
+			if (!io_cache_alloc(&ctx->apoll_cache, GFP_ATOMIC,
+					    (void **)&apoll))
+				return NULL;
+		} else {
 			apoll = kmalloc_obj(*apoll, GFP_ATOMIC);
-		if (!apoll)
-			return NULL;
+			if (!apoll)
+				return NULL;
+		}
 		apoll->poll.retries = APOLL_MAX_RETRY;
 	}
 	apoll->double_poll = NULL;
 	req->apoll = apoll;
 	if (unlikely(!--apoll->poll.retries))
diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index d569cea12df9..11e52db52373 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -156,17 +156,19 @@ static void io_release_ubuf(void *priv)
 
 		unpin_user_folio(folio, 1);
 	}
 }
 
-static struct io_mapped_ubuf *io_alloc_imu(struct io_ring_ctx *ctx,
-					   int nr_bvecs)
+static bool io_alloc_imu(struct io_ring_ctx *ctx, int nr_bvecs,
+			 struct io_mapped_ubuf **imu)
 {
 	if (nr_bvecs <= IO_CACHED_BVECS_SEGS)
-		return io_cache_alloc(&ctx->imu_cache, GFP_KERNEL_ACCOUNT);
-	return kvmalloc_flex(struct io_mapped_ubuf, bvec, nr_bvecs,
+		return io_cache_alloc(&ctx->imu_cache, GFP_KERNEL_ACCOUNT,
+				      (void **)imu);
+	*imu = kvmalloc_flex(struct io_mapped_ubuf, bvec, nr_bvecs,
 			     GFP_KERNEL_ACCOUNT);
+	return *imu;
 }
 
 static void io_free_imu(struct io_ring_ctx *ctx, struct io_mapped_ubuf *imu)
 {
 	if (imu->nr_bvecs <= IO_CACHED_BVECS_SEGS)
@@ -241,22 +243,25 @@ static void io_buffer_unmap(struct io_ring_ctx *ctx, struct io_mapped_ubuf *imu)
 		io_unaccount_mem(ctx->user, ctx->mm_account, acct_pages);
 	imu->release(imu->priv);
 	io_free_imu(ctx, imu);
 }
 
-struct io_rsrc_node *io_rsrc_node_alloc(struct io_ring_ctx *ctx, int type)
+bool io_rsrc_node_alloc(struct io_ring_ctx *ctx, int type,
+			struct io_rsrc_node **node_out)
 {
 	struct io_rsrc_node *node;
 
-	node = io_cache_alloc(&ctx->node_cache, GFP_KERNEL_ACCOUNT);
-	if (node) {
+	if (io_cache_alloc(&ctx->node_cache, GFP_KERNEL_ACCOUNT,
+			   (void **)&node)) {
 		node->type = type;
 		node->refs = 1;
 		node->tag = 0;
 		node->file_ptr = 0;
+		*node_out = node;
+		return true;
 	}
-	return node;
+	return false;
 }
 
 bool io_rsrc_cache_init(struct io_ring_ctx *ctx)
 {
 	const int imu_cache_size = struct_size_t(struct io_mapped_ubuf, bvec,
@@ -364,12 +369,11 @@ static int __io_sqe_files_update(struct io_ring_ctx *ctx,
 			if (io_is_uring_fops(file)) {
 				fput(file);
 				err = -EBADF;
 				break;
 			}
-			node = io_rsrc_node_alloc(ctx, IORING_RSRC_FILE);
-			if (!node) {
+			if (!io_rsrc_node_alloc(ctx, IORING_RSRC_FILE, &node)) {
 				err = -ENOMEM;
 				fput(file);
 				break;
 			}
 			ctx->file_table.data.nodes[i] = node;
@@ -678,12 +682,11 @@ int io_sqe_files_register(struct io_ring_ctx *ctx, void __user *arg,
 		if (io_is_uring_fops(file)) {
 			fput(file);
 			goto fail;
 		}
 		ret = -ENOMEM;
-		node = io_rsrc_node_alloc(ctx, IORING_RSRC_FILE);
-		if (!node) {
+		if (!io_rsrc_node_alloc(ctx, IORING_RSRC_FILE, &node)) {
 			fput(file);
 			goto fail;
 		}
 		if (tag)
 			node->tag = tag;
@@ -892,12 +895,11 @@ static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
 	ret = io_validate_user_buf_range((unsigned long)iov->iov_base,
 					 iov->iov_len);
 	if (ret)
 		return ERR_PTR(ret);
 
-	node = io_rsrc_node_alloc(ctx, IORING_RSRC_BUFFER);
-	if (!node)
+	if (!io_rsrc_node_alloc(ctx, IORING_RSRC_BUFFER, &node))
 		return ERR_PTR(-ENOMEM);
 
 	ret = -ENOMEM;
 	pages = io_pin_pages((unsigned long) iov->iov_base, iov->iov_len,
 				&nr_pages);
@@ -911,12 +913,11 @@ static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
 	if (nr_pages > 1 && io_check_coalesce_buffer(pages, nr_pages, &data)) {
 		if (data.nr_pages_mid != 1)
 			coalesced = io_coalesce_buffer(&pages, &nr_pages, &data);
 	}
 
-	imu = io_alloc_imu(ctx, nr_pages);
-	if (!imu)
+	if (!io_alloc_imu(ctx, nr_pages, &imu))
 		goto done;
 
 	imu->nr_bvecs = nr_pages;
 	ret = io_buffer_account_pin(ctx, pages, nr_pages);
 	if (ret)
@@ -1050,16 +1051,14 @@ static struct io_mapped_ubuf *io_kernel_buffer_init(struct io_ring_ctx *ctx,
 	index = array_index_nospec(index, data->nr);
 
 	if (data->nodes[index])
 		return ERR_PTR(-EBUSY);
 
-	node = io_rsrc_node_alloc(ctx, IORING_RSRC_BUFFER);
-	if (!node)
+	if (!io_rsrc_node_alloc(ctx, IORING_RSRC_BUFFER, &node))
 		return ERR_PTR(-ENOMEM);
 
-	imu = io_alloc_imu(ctx, nr_bvecs);
-	if (!imu) {
+	if (!io_alloc_imu(ctx, nr_bvecs, &imu)) {
 		io_cache_free(&ctx->node_cache, node);
 		return ERR_PTR(-ENOMEM);
 	}
 
 	imu->ubuf = 0;
@@ -1421,12 +1420,12 @@ static int io_clone_buffers(struct io_ring_ctx *ctx, struct io_ring_ctx *src_ctx
 
 		src_node = io_rsrc_node_lookup(&src_ctx->buf_table, i);
 		if (!src_node) {
 			dst_node = NULL;
 		} else {
-			dst_node = io_rsrc_node_alloc(ctx, IORING_RSRC_BUFFER);
-			if (!dst_node) {
+			if (!io_rsrc_node_alloc(ctx, IORING_RSRC_BUFFER,
+						&dst_node)) {
 				io_rsrc_data_free(ctx, &data);
 				return -ENOMEM;
 			}
 
 			refcount_inc(&src_node->buf->refs);
diff --git a/io_uring/rsrc.h b/io_uring/rsrc.h
index 9ef88383b363..2632aa577d62 100644
--- a/io_uring/rsrc.h
+++ b/io_uring/rsrc.h
@@ -52,11 +52,12 @@ struct io_imu_folio_data {
 	unsigned long	first_folio_page_idx;
 };
 
 bool io_rsrc_cache_init(struct io_ring_ctx *ctx);
 void io_rsrc_cache_free(struct io_ring_ctx *ctx);
-struct io_rsrc_node *io_rsrc_node_alloc(struct io_ring_ctx *ctx, int type);
+bool io_rsrc_node_alloc(struct io_ring_ctx *ctx, int type,
+			struct io_rsrc_node **node);
 void io_free_rsrc_node(struct io_ring_ctx *ctx, struct io_rsrc_node *node);
 void io_rsrc_data_free(struct io_ring_ctx *ctx, struct io_rsrc_data *data);
 int io_rsrc_data_alloc(struct io_rsrc_data *data, unsigned nr);
 
 struct io_rsrc_node *io_find_buf_node(struct io_kiocb *req,
diff --git a/io_uring/rw.c b/io_uring/rw.c
index 4a9538157d94..29fb96f76191 100644
--- a/io_uring/rw.c
+++ b/io_uring/rw.c
@@ -191,13 +191,13 @@ static void io_req_rw_cleanup(struct io_kiocb *req, unsigned int issue_flags)
 static int io_rw_alloc_async(struct io_kiocb *req)
 {
 	struct io_ring_ctx *ctx = req->ctx;
 	struct io_async_rw *rw;
 
-	rw = io_uring_alloc_cached_async_data(&ctx->rw_cache, req);
-	if (!rw)
+	if (!io_uring_alloc_cached_async_data(&ctx->rw_cache, req))
 		return -ENOMEM;
+	rw = req->async_data;
 	if (rw->vec.iovec)
 		req->flags |= REQ_F_NEED_CLEANUP;
 	rw->bytes_done = 0;
 	return 0;
 }
diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
index 6f417bda52ea..ba2d8c9028eb 100644
--- a/io_uring/uring_cmd.c
+++ b/io_uring/uring_cmd.c
@@ -188,13 +188,13 @@ int io_uring_cmd_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	    !!(req->flags & REQ_F_BUFFER_SELECT))
 		return -EINVAL;
 
 	ioucmd->cmd_op = READ_ONCE(sqe->cmd_op);
 
-	ac = io_uring_alloc_cached_async_data(&req->ctx->cmd_cache, req);
-	if (!ac)
+	if (!io_uring_alloc_cached_async_data(&req->ctx->cmd_cache, req))
 		return -ENOMEM;
+	ac = req->async_data;
 	if (ac->vec.iovec)
 		req->flags |= REQ_F_NEED_CLEANUP;
 	ioucmd->sqe = sqe;
 	return 0;
 }
-- 
2.56.0

