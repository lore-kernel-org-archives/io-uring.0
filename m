Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393354252AB
	for <io-uring@vger.kernel.org>; Mon, 14 Sep 2026 09:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377706; cv=none; b=U6KLNCowAFDyN0id0m1H712BD6gY2yCcHQnnWXhjlkv8AnlgJoYAvqyEIxYtBR0W6Sq6YCGzZM1ds/YRVQZzPpN9zuaM8SwwTnBvkdYz3OZgiWFrhKU+9B/55HPxAgY21zF8XXsijR2COAvMPJWZjSYhM4Q6bT2gidr0bhKi+s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377706; c=relaxed/simple;
	bh=QmGWJsYTjqPI0bHKbLqcwPxNwliWQUZfC/2eQCFNoE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R2HONfpzLx5zLhkZ0TozaklOIeRtHXyscvbP/vdKc4p5mwwjFtc0hiAHW8L+ng6Aval2GA8+KT2JXKlbRv5JYxErLU8oYhmRUTub5r3qkSqWi/QYzKI2VtYgU+dM6AmnUzXxIm/fcEPWbRt5/fk07rtrDm7echh7nwi86sygywo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QY3g1G96; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QY3g1G96"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfcb5cb3so23319776d6.3
        for <io-uring@vger.kernel.org>; Mon, 14 Sep 2026 02:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789377704; x=1789982504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bzaXd3BjbK6IZPh5AWHB8yMlFpjXv/VnxLmPZtypjps=;
        b=QY3g1G96GGri1ar1iPDUnBfbr5H8xmdU+0FwvSbYk/HCRxQhcV108Wx+cqvXfZxNTI
         t8M9W1VP0Azzmre9kO/pgb/crmvZPwlyDIUztxZyBlBvUNZ24eQ3s4JFHWUBHQ4PUwnz
         1Ele43MjhETiCzr8Tzxf/qI7lYhWN++0Qlm7UdKMk0x95k3ICEc9qHbQMiqFWqUvCpYT
         cPFZdAvKY35o5lKhg8xBOKeCjYxK3iHGrT0OH30vqS+pGyd98o2KzExrOLs13s4XPs7C
         iOgbsA23ZoQfGMcyM4J9gZKONjBJ/VtTY9ECLyUT6RNs0l4Y7hZOZt484EFWjU/jYLbh
         uWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789377704; x=1789982504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bzaXd3BjbK6IZPh5AWHB8yMlFpjXv/VnxLmPZtypjps=;
        b=lozRla54joqeZGT8dEzqJ0GiRYdV0NjtaFXtfvgrXpHUYBMdKVncqUmo1uVWxFfKpb
         N1tD+5VErEBOZ7Xip9OW2VAHf5CXegjdwSXDwVnqzrRBbg6TFP3/nt0/k+wyLC20Al6X
         hXeSEorSGtPVzAOS0f37UK/VN7PWoV9FWQvq2RAH4HJQ0WezCqp4hIJCuVK9xz1ZsJnt
         UhnWViO4qHST/0cDhHPcQQRznPWZOjBifkB7FpTf8AtYmq8E01gOSjsnvEPYgkUuEhiA
         OYEWX9bLHG6/rCILn7Qk58cZBb7knSf45Znqejwh3k2ciS6L5kAFd3bybdwcLI0pHUPR
         WKXg==
X-Gm-Message-State: AFuF++mrP2YQEginaSAfhqUMjU1typF3yWxJVmOQQt6wxfz9G5oakWDc
	o1aFOGSb54xck1bdp72HGCAUwH8swgx+rxk40Hipi3TXzvFRoweUut2uAl2pzGL6WVg=
X-Gm-Gg: AYBFou2V9O4UoXZ/Tp42zjGUiTuvcBJ4LxKEPBDvhaBIMCoet6YteCFjzsYyqCfex/r
	9k2/prpmJFlHhcxV8T13i7QV2gNg3tjv9GJTNs0qkgaLfkttrcv1LRnLwgERy5z8JVoeCRc82dO
	bhmw1KDLzWTZqhbHkDFVtxlKpw+BD790G88PZG3OpR0hzmatU8LP6bfiueZwTUFJJ3G/NZ62YtB
	iSDMfa3WTwtsdJD1vNc5O08z/qerwHV5UXPK/mW62OmELTv7+zHWo5rY6eEczbAvjtsKcCOXIMP
	xlfvtrSOV9vyI9XNdzF7MSGOM5H8ytD3BfDP0ACzo1RmpMVVsFhEMkqB08zluFiKEyZBsjJe2CS
	WF7bTjMFO7bLiB2z5R8Xqlo6OXWrza23AUDjvaLrzdF5bhcM6bJUBHHt1gkSruBOu/8zGQ8VOPR
	aY+Gdav3454vfufryX9L0S4fa9HaUtxjnlGnh9wWMTIvgaWxCPLIprkXxX7wLpbDxiFY1anVpEe
	GpnPJtYP/ZLucE6E78oRkHftdwaPtegOXew0s6kcjVoGwvnqSeZIhmAtQ==
X-Received: by 2002:a05:622a:181e:b0:530:ce8c:b6ee with SMTP id d75a77b69052e-5310d093697mr22811311cf.60.1789377704061;
        Mon, 14 Sep 2026 02:21:44 -0700 (PDT)
Received: from kernel-dev.. ([2a01:4ff:f0:3ff2::1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f49444bsm89854256d6.29.2026.09.14.02.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:21:43 -0700 (PDT)
From: Uzair Beg <uzairbeg11@gmail.com>
To: io-uring@vger.kernel.org
Cc: axboe@kernel.dk,
	asml.silence@gmail.com,
	Chengfeng Lin <lin2530632123@gmail.com>,
	linux-kernel@vger.kernel.org,
	Uzair Beg <uzairbeg11@gmail.com>
Subject: [RFC PATCH 3/3] io_uring/rsrc: prefill the node cache when a file table is registered empty
Date: Mon, 14 Sep 2026 09:20:49 +0000
Message-ID: <20260914092049.130079-4-uzairbeg11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914092049.130079-1-uzairbeg11@gmail.com>
References: <20260914092049.130079-1-uzairbeg11@gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Registering a sparse fixed file table allocates no nodes at
registration time; each node is allocated later, on the install path,
where MSG_RING SEND_FD pays for it. Bare-metal measurement of the
4,096-slot first fill shows the cost is not the allocator call
(bulk refill was neutral) nor fresh slab pages (priming the slab was
neutral), but the per-object SLUB allocation path itself. The only way
to take it off the install path is to not allocate there.

When a sparse table of N slots is registered, grow the per-ring node
cache to min(N, IO_ALLOC_CACHE_PREFILL_MAX) and bulk-fill it, so the
subsequent installs hit the cache. Prefill is best-effort: on any
failure the cache is left in a valid state (a successfully grown
pointer array is retained) and registration proceeds unchanged.
Non-sparse registrations are untouched, since they allocate every node
inline anyway.

On the reported 4,096-slot first fill this is 9.8% faster than
unpatched. Because the enlarged cache also retains nodes released by
FILES_UPDATE, a same-ring remove-and-refill of 4,096 files is 18.8%
faster. The cost is moved to registration rather than removed: a
one-shot register-then-fill is unchanged overall, and a program that
registers many slots and installs few pays for nodes it never uses.
Whether that trade is acceptable, or should be behind a registration
flag, is the question this patch is intended to raise.

The stash loop from the bulk refill path is factored into a helper so
both callers share it.

Reported-by: Chengfeng Lin <lin2530632123@gmail.com>
Closes: https://lore.kernel.org/io-uring/CANGjgdmt0FQ=offsdfn+wEaDxbOFoAa6bi92X_vEo4S6aCZ56A@mail.gmail.com/
Tested-by: Chengfeng Lin <lin2530632123@gmail.com>
Co-developed-by: Chengfeng Lin <lin2530632123@gmail.com>
Signed-off-by: Chengfeng Lin <lin2530632123@gmail.com>
Signed-off-by: Uzair Beg <uzairbeg11@gmail.com>
---
 io_uring/alloc_cache.c | 58 ++++++++++++++++++++++++++++++++++--------
 io_uring/alloc_cache.h |  2 ++
 io_uring/rsrc.c        |  4 +++
 3 files changed, 54 insertions(+), 10 deletions(-)

diff --git a/io_uring/alloc_cache.c b/io_uring/alloc_cache.c
index cba0e6c5d66..2c6e09313d2 100644
--- a/io_uring/alloc_cache.c
+++ b/io_uring/alloc_cache.c
@@ -38,6 +38,22 @@ bool io_alloc_cache_init(struct io_alloc_cache *cache,
 	return false;
 }
 
+static void io_cache_stash(struct io_alloc_cache *cache, void **slot,
+			   unsigned int nr)
+{
+	unsigned int i;
+
+	for (i = 0; i < nr; i++) {
+		if (cache->init_clear)
+			memset(slot[i], 0, cache->init_clear);
+		if (unlikely(!kasan_mempool_poison_object(slot[i])))
+			break;
+		cache->nr_cached++;
+	}
+	for (; i < nr; i++)
+		kmem_cache_free(cache->slab, slot[i]);
+}
+
 void *io_cache_alloc_new(struct io_alloc_cache *cache, gfp_t gfp)
 {
 	void *obj;
@@ -45,7 +61,7 @@ void *io_cache_alloc_new(struct io_alloc_cache *cache, gfp_t gfp)
 	if (cache->slab) {
 		unsigned int room = cache->max_cached - cache->nr_cached;
 		void **slot = &cache->entries[cache->nr_cached];
-		unsigned int batch, got, i;
+		unsigned int batch, got;
 
 		if (unlikely(!room))
 			return kmem_cache_alloc(cache->slab, gfp);
@@ -57,15 +73,7 @@ void *io_cache_alloc_new(struct io_alloc_cache *cache, gfp_t gfp)
 
 		/* return one object, stash the rest in the cache */
 		obj = slot[got - 1];
-		for (i = 0; i < got - 1; i++) {
-			if (cache->init_clear)
-				memset(slot[i], 0, cache->init_clear);
-			if (unlikely(!kasan_mempool_poison_object(slot[i])))
-				break;
-			cache->nr_cached++;
-		}
-		for (; i < got - 1; i++)
-			kmem_cache_free(cache->slab, slot[i]);
+		io_cache_stash(cache, slot, got - 1);
 	} else {
 		obj = kmalloc(cache->elem_size, gfp);
 	}
@@ -73,3 +81,33 @@ void *io_cache_alloc_new(struct io_alloc_cache *cache, gfp_t gfp)
 		memset(obj, 0, cache->init_clear);
 	return obj;
 }
+
+void io_alloc_cache_prefill(struct io_alloc_cache *cache, unsigned int nr)
+{
+	gfp_t gfp = GFP_KERNEL | __GFP_NOWARN;
+	unsigned int got;
+	void **entries;
+
+	if (!cache->slab || !cache->entries)
+		return;
+
+	nr = min_t(unsigned int, nr, IO_ALLOC_CACHE_PREFILL_MAX);
+	if (nr <= cache->nr_cached)
+		return;
+
+	if (nr > cache->max_cached) {
+		entries = kvmalloc_array(nr, sizeof(void *), gfp);
+		if (!entries)
+			return;
+		memcpy(entries, cache->entries,
+		       cache->nr_cached * sizeof(void *));
+		kvfree(cache->entries);
+		cache->entries = entries;
+		cache->max_cached = nr;
+	}
+
+	got = kmem_cache_alloc_bulk(cache->slab, gfp, nr - cache->nr_cached,
+				    &cache->entries[cache->nr_cached]);
+	if (got)
+		io_cache_stash(cache, &cache->entries[cache->nr_cached], got);
+}
diff --git a/io_uring/alloc_cache.h b/io_uring/alloc_cache.h
index 82d552c7517..ca6af52dd7d 100644
--- a/io_uring/alloc_cache.h
+++ b/io_uring/alloc_cache.h
@@ -8,6 +8,7 @@
  */
 #define IO_ALLOC_CACHE_MAX	128
 #define IO_ALLOC_CACHE_REFILL	32
+#define IO_ALLOC_CACHE_PREFILL_MAX	4096
 
 void io_alloc_cache_free(struct io_alloc_cache *cache,
 			 void (*free)(const void *));
@@ -16,6 +17,7 @@ bool io_alloc_cache_init(struct io_alloc_cache *cache,
 			 unsigned int init_bytes);
 
 void *io_cache_alloc_new(struct io_alloc_cache *cache, gfp_t gfp);
+void io_alloc_cache_prefill(struct io_alloc_cache *cache, unsigned int nr);
 
 static inline bool io_alloc_cache_put(struct io_alloc_cache *cache,
 				      void *entry)
diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 6413682ebe4..b7f78b6b514 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -560,6 +560,10 @@ int io_sqe_files_register(struct io_ring_ctx *ctx, void __user *arg,
 	if (!io_alloc_file_tables(ctx, &ctx->file_table, nr_args))
 		return -ENOMEM;
 
+	/* sparse table: nodes are installed later, so cache them now */
+	if (!fds)
+		io_alloc_cache_prefill(&ctx->node_cache, nr_args);
+
 	for (i = 0; i < nr_args; i++) {
 		struct io_rsrc_node *node;
 		u64 tag = 0;
-- 
2.43.0

