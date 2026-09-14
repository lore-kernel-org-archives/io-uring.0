Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8F7422541
	for <io-uring@vger.kernel.org>; Mon, 14 Sep 2026 09:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377702; cv=none; b=M9nCR7VFKVnnMtcNgHJKtbLiWrVawgWq16H4UWira7zmJy0XHlWl2IWadqBLxejWPhPbiz4CCH6jiqBnKt4jaGAhAqDzmk//4BCbqnoIbWE1e+ZWs1EtI88aHCq9rqitIyEGucEXn/TNQc30/KUqg2HRtrc3/g5af2mkBL1OJcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377702; c=relaxed/simple;
	bh=AWgNdelLuusMKTO3XmEV6H2qIFR8ZhjKw8eGqirrJj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y290ZbdRwDMjO9aFTRUbdqt8lDVM1CIQKY8qysRO2maLuDm1Jtf75GspX+Q+FXC1AbD9OitHDAMBIRH+zwFEhEuo8y0qNeWPs+szYZ7TEyyWUtvJZU5Fep3Jz748rU//Bk+JlAhEnEExzziiQP1JXKcq6CRvgjmg9cq8OY2o+Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BCKXjLqg; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BCKXjLqg"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-9103228ef53so36019386d6.0
        for <io-uring@vger.kernel.org>; Mon, 14 Sep 2026 02:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789377700; x=1789982500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DJLNgmlgQhAoJRQ2IrTohM5uVJQIzCvFDhXSRTt2DE4=;
        b=BCKXjLqgahPBnZIF2oa8n4IX/jW/XfHQtuXpWlaNdbMa1o2Kr2kIitX2FNE6YLaxxn
         IszLyAzzeP40Z/04KUGPn0PDttkyxKcWgaSeHAVO9zLVrjLfrG7/EnIvTHgaCAOBxN1a
         ey1G82Kz+9LeK5amNquTWc65uNNNU6EdqebrdPpx0uO2wZSow6zPsbtBqXJjy3RpBj+d
         8S0ZRZLQCPbkNrHmC3zmSns2jygCFE9nYmP1tZU0ONmRfnCQrmzXzp56/6AOCaYMGD6c
         c3xfwRGQadddqtIlWNm7FegBB7ORdKqRNVBNXNO4QvjXakvfqzzklMpUZwdHhPQWn+gO
         tZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789377700; x=1789982500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DJLNgmlgQhAoJRQ2IrTohM5uVJQIzCvFDhXSRTt2DE4=;
        b=j4HkHz8+jEqbRMAGPcqcQCaE9h3+6zFH+q850OgmNI+xZxH3PLw6iw6mc9fA3HoxA9
         UDLnUU78dTLSFUfse/BC0FtYeUfd2P6HMkY9Mmyp/RiFCDvxHHKT8H17xhG2TOKnzx/V
         wBplgm0PYPzM1GyQzinbnwUV5EPHHifAOYXuUjGlBc4wlxjyO3m0QPLFs8L93W0ds2N4
         PmZs70PrYim5xQB6yDNVbMLlBa8eGnhlULYVRMCKARayBpAeGjMH1FqcnNRIr90MXMR6
         S3ebe3rg+7Now6j7ZOIGSEV5a1l+cedbcFuaa0hGFsEA8/Pvyneg3jFwkcX4/dH9EQ6A
         Sn9g==
X-Gm-Message-State: AFuF++lUG55HJMg89q8WifWzwSB9TMD+wEqlOoRgzgap5GuLy+mF9Hz4
	162cQjXzuU7tbCrTrfEEBpgKtYaVnx1AWpi9LKl07u1eih3+/oFwOC4nBMB+4bI+mDw=
X-Gm-Gg: AYBFou3sg0qn/3MRSQa7FVi7bN5oAJaB6he9Y7vXqJgCGwCbBn8vjqrK0tZdHRAKSZ9
	2QllK3iT9jjNc0vlsga9KRQmaYSTKJ7+2aG9cnXDh/tXHReucChnjPxPWBhSLGQRbehZKKPUBP4
	SS3LgdQs1159h1Hy5Io9jsYcr9pYGesddLuT0KBrlyCKcasQxp81u743HQycoJeZWMmh7tJc/ea
	6nqFWr2rM4Vi4uCs9Eddk3nbWdo5typ51lxzL+ER+apR51Y4C9BCBP4oy4PqP9zXihOBAyCxDZ8
	5m0TOMczrdNwLIPhdKI+k4TdKHa7sf9tl1acPJnJ+iQNq7kN9RDRIGdDUqDuspy71YKHd6yojY8
	YPYnhLjuLEf5SXy7MQ5U14JBuuimbJ7/X8XZHcj0GTCvNIC+dByz2ikPH6S2P33lgnoBBDVDG85
	YTNbpRfUgvbcDX7aMpmmsHa1j9PqagePE6T6u2iADEx/h3qE/I6O3PC3odczvmaIEbB3kuECols
	huXcYwGmPv82c3cjTAxh5Pk5NQfQAiY6r17FLCcBBI7z/A6qB/RiYntrDHlsj2JpVcX
X-Received: by 2002:ac8:59c1:0:b0:530:db0e:e098 with SMTP id d75a77b69052e-5310cf602b0mr23311491cf.23.1789377700398;
        Mon, 14 Sep 2026 02:21:40 -0700 (PDT)
Received: from kernel-dev.. ([2a01:4ff:f0:3ff2::1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f49444bsm89854256d6.29.2026.09.14.02.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:21:40 -0700 (PDT)
From: Uzair Beg <uzairbeg11@gmail.com>
To: io-uring@vger.kernel.org
Cc: axboe@kernel.dk,
	asml.silence@gmail.com,
	Chengfeng Lin <lin2530632123@gmail.com>,
	linux-kernel@vger.kernel.org,
	Uzair Beg <uzairbeg11@gmail.com>
Subject: [RFC PATCH 2/3] io_uring/rsrc: bulk refill the node cache on allocation miss
Date: Mon, 14 Sep 2026 09:20:48 +0000
Message-ID: <20260914092049.130079-3-uzairbeg11@gmail.com>
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

A first fill of a sparse fixed file table takes one allocator round
trip per install, since the per-ring node cache starts empty and
nothing is freed back during the fill. At 4,096 slots that is 4,096
calls into the slab allocator.

When the cache has a dedicated kmem_cache, refill it in batches on a
miss: allocate up to IO_ALLOC_CACHE_REFILL objects with
kmem_cache_alloc_bulk(), return one and stash the remainder in the
cache. A 4,096-slot first fill then enters the allocator roughly once
per batch instead of once per object. This mirrors the existing bulk
allocation of requests from req_cachep.

kmem_cache_alloc_bulk() may return fewer objects than requested,
including zero; both cases are handled. Stashed objects have their
init_clear region zeroed and are poisoned like any other cached
entry, and the cache never grows past max_cached. Callers without a
dedicated slab are unchanged.

Bare-metal measurement shows this is neutral on the reported workload:
the per-object cost is in the SLUB allocation path itself, not in the
number of allocator entries. It is kept because the following patch
relies on the same bulk machinery.

Reported-by: Chengfeng Lin <lin2530632123@gmail.com>
Closes: https://lore.kernel.org/io-uring/CANGjgdmt0FQ=offsdfn+wEaDxbOFoAa6bi92X_vEo4S6aCZ56A@mail.gmail.com/
Tested-by: Chengfeng Lin <lin2530632123@gmail.com>
Signed-off-by: Uzair Beg <uzairbeg11@gmail.com>
---
 io_uring/alloc_cache.c | 29 ++++++++++++++++++++++++++---
 io_uring/alloc_cache.h |  1 +
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/io_uring/alloc_cache.c b/io_uring/alloc_cache.c
index a44b82a80f1..cba0e6c5d66 100644
--- a/io_uring/alloc_cache.c
+++ b/io_uring/alloc_cache.c
@@ -42,10 +42,33 @@ void *io_cache_alloc_new(struct io_alloc_cache *cache, gfp_t gfp)
 {
 	void *obj;
 
-	if (cache->slab)
-		obj = kmem_cache_alloc(cache->slab, gfp);
-	else
+	if (cache->slab) {
+		unsigned int room = cache->max_cached - cache->nr_cached;
+		void **slot = &cache->entries[cache->nr_cached];
+		unsigned int batch, got, i;
+
+		if (unlikely(!room))
+			return kmem_cache_alloc(cache->slab, gfp);
+
+		batch = min_t(unsigned int, IO_ALLOC_CACHE_REFILL, room);
+		got = kmem_cache_alloc_bulk(cache->slab, gfp, batch, slot);
+		if (unlikely(!got))
+			return NULL;
+
+		/* return one object, stash the rest in the cache */
+		obj = slot[got - 1];
+		for (i = 0; i < got - 1; i++) {
+			if (cache->init_clear)
+				memset(slot[i], 0, cache->init_clear);
+			if (unlikely(!kasan_mempool_poison_object(slot[i])))
+				break;
+			cache->nr_cached++;
+		}
+		for (; i < got - 1; i++)
+			kmem_cache_free(cache->slab, slot[i]);
+	} else {
 		obj = kmalloc(cache->elem_size, gfp);
+	}
 	if (obj && cache->init_clear)
 		memset(obj, 0, cache->init_clear);
 	return obj;
diff --git a/io_uring/alloc_cache.h b/io_uring/alloc_cache.h
index b288bfccc91..82d552c7517 100644
--- a/io_uring/alloc_cache.h
+++ b/io_uring/alloc_cache.h
@@ -7,6 +7,7 @@
  * Don't allow the cache to grow beyond this size.
  */
 #define IO_ALLOC_CACHE_MAX	128
+#define IO_ALLOC_CACHE_REFILL	32
 
 void io_alloc_cache_free(struct io_alloc_cache *cache,
 			 void (*free)(const void *));
-- 
2.43.0

