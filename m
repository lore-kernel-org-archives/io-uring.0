Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D98348BD3C
	for <io-uring@vger.kernel.org>; Fri,  7 Aug 2026 13:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108806; cv=none; b=D8sWLx7Jg5CkHfruzjRNWwck2PL01qqbqN7fO0Bq4JNTwVq0Ryis43DY+BPvGpkCy2r3e69L/Zpngdw75ZEOwuuz1QkdgcvYdDfSdZaZna0CW/6VKZHZQuvVPjzecvhZ4R+N4+tW/eqJYzqLchTIl37uRK9NYjRAJj+T6QZqB8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108806; c=relaxed/simple;
	bh=/3HagUJ4Pybmqpr0Qi/Ixj0J+wo2YovCsMOIKJULDxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g9/STuk/AoXS2NWhfb1d0Hasmed+dw3xMMC8hogCiEjmmwefSRsbfKfu76kxqJxqBzhwVGL+ngPDxMsc965t2XLSBGMnJjj7x0mh7ySoZvWfAUPMllwJJV799ASDGqK+5MF8ESMFT/PYT3MAzyS0A9rSMto4jVgFeVTv87PmqNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o5JQFNlK; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o5JQFNlK"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49553515a8bso50396585e9.1
        for <io-uring@vger.kernel.org>; Fri, 07 Aug 2026 06:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108799; x=1786713599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PppqanDeaBzdghzKyGwgkSIodmXbiybUfG6LdKWWozc=;
        b=o5JQFNlKOta/PRVM8zVA7Uv268Ip3z8Aktiq1APtNjyjcUn7gkVn/4Kh3m12PIkgZI
         Q4x4Xkv9IH8rJ35zUbkk9VXAFFAdYnGbZyVz7oAiLuwsUIuFnAlnTY3WlsmYjLwNv9Qn
         4Mg4ReWDRu/KN5hjDc4c/WGukiwpCcNiwMyd9O4oDholGEUFxloo1GyrUgkVMAJY1ckr
         GeYKSsFypL7VTFas+0KSY7qE5i4MiXHZm9lIsvH/PWurMF/mYBACg84StWes0TdwvrsA
         u/sNBlltmD1ZK0OqOJQynwbUwuhW9QdUHNUwG+sTuCT/AoOJMfLZPTkcTFLxgORF9RQl
         CiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108799; x=1786713599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PppqanDeaBzdghzKyGwgkSIodmXbiybUfG6LdKWWozc=;
        b=TcOsvfduyQq5iPb0u8SXlGFSdowYAsi2A6tiiOygYkDTtUFdpN6cK11hcpYu/fLLl9
         JDGbFKLvdXffTO7FgR8k1EkmhqIpp8fv0ab1EQgxZVFskhlSi/nlfEPPa6ONUkptiBSt
         hUQvwGI/rC4lsFh/8hzVFr1fU1RUNjzHjNdibW+sjqLLh8JQ9AyEYC7zieWLdjO6JvIp
         7ajFhKQf+KBYr7lkfNJxxC0RQBU69vGTtNWTn27Jo/3u1iQ1twhwaFH591hYATI+dhoT
         rkSjkgRe8jcgcAlW3EorlFIez4nzoSMFz/FktK+mWHHn6NH0T4+XBBQloALHeBsHXrUv
         C84A==
X-Gm-Message-State: AOJu0Yz+AF1KdKFgS/cHTqo3HjYLKgNqp0dIyHPfolZCcoN5C0k7m/LR
	OvaVKrMSuz3Nbd94M/vwn6wgNIVIWVzcj7PBG7eCDzi3SHHLR2nUkWuzOi2fA5X0
X-Gm-Gg: AR+sD12XvVq89rbuenjJV7HxGz1gmT2NuKcXhl4cJ64GIzytReHDsaPR7y4YZ/Qj1hP
	5HeGfaJcrIsl0KsHRu6061mrO1B6yilrH8/werQ01p53YdSMVWaBwljeMv/Pzh8QI4SaQ+0fTxY
	cI5yONthgf5+nZBmpTr/zzJpzvS00twc44H/i0xlgRNx6sluI3p7tbkTSUXdg8LOXIqWvajORn0
	ea/MR5tkFspYsJ9YXf9y/cgUnFNIyn9xTVWN6TR391k7I1UgLBKMkIwvfxdkffvIUyJjz66ZZpn
	k78v3R9X+VQaimO43ZM2yfNckqMWlldlhuD7WdXvouBcu2zOVn+75y9OIPbqVlebD2JWcFzwJBz
	YlByNhEXYRBpvLbMzbOfyy72zbduWO1z4cDFnWq0yNBCjAXIj5fbe41Yzu2tAttdgrGdH07khub
	LMSEnPB3SN7r4Pp3PEW1HqOaZV/E3nZ3SB54mXPNaTV+Q0noOPRi38JZKhwtUnD9wH3zD0WRoys
	iqPD/A6h2SjqIGuJKuO9LCCLrza+d/1V95oWliaIFLCoCktMej7TUDmvOqSvcbZw5k=
X-Received: by 2002:a05:600c:4f4a:b0:499:51f0:a9b2 with SMTP id 5b1f17b1804b1-49959e0179bmr112603675e9.1.1786108798795;
        Fri, 07 Aug 2026 06:19:58 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995427a244sm144125015e9.10.2026.08.07.06.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:19:57 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	netdev@vger.kernel.org
Subject: [PATCH io_uring 13/16] io_uring/zcrx: move freelist lock to struct zcrx
Date: Fri,  7 Aug 2026 14:19:31 +0100
Message-ID: <be7feadff1e210861433f99fe44170aa27ec5b33.1786108672.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1786108672.git.asml.silence@gmail.com>
References: <cover.1786108672.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

freelist_lock, which protects slow path allocations, is currently stored
in struct io_zcrx_area. Once we add support for multiple queues, we'll
need a lock in the zcrx ctx, move it there.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/zcrx.c | 14 +++++++-------
 io_uring/zcrx.h |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
index be3560739bbc..3cf5e456990a 100644
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@ -542,7 +542,6 @@ static int __zcrx_create_area(struct io_zcrx_ifq *ifq,
 	/* we're only supporting one area per ifq for now */
 	area->area_id = 0;
 	area_reg->rq_area_token = zcrx_area_id_to_token(area->area_id);
-	spin_lock_init(&area->freelist_lock);
 
 	ret = io_zcrx_append_area(ifq, area);
 	if (!ret)
@@ -573,6 +572,7 @@ static struct io_zcrx_ifq *io_zcrx_ifq_alloc(struct io_ring_ctx *ctx)
 	ifq->if_rxq = -1;
 	spin_lock_init(&ifq->ctx_lock);
 	spin_lock_init(&ifq->rq.lock);
+	spin_lock_init(&ifq->alloc_lock);
 	mutex_init(&ifq->pp_lock);
 	refcount_set(&ifq->refs, 1);
 	refcount_set(&ifq->user_refs, 1);
@@ -647,8 +647,9 @@ static void io_put_zcrx_ifq(struct io_zcrx_ifq *ifq)
 static void io_zcrx_return_niov_freelist(struct net_iov *niov)
 {
 	struct io_zcrx_area *area = io_zcrx_iov_to_area(niov);
+	struct io_zcrx_ifq *ifq = area->ifq;
 
-	guard(spinlock_bh)(&area->freelist_lock);
+	guard(spinlock_bh)(&ifq->alloc_lock);
 	if (WARN_ON_ONCE(area->free_count >= area->nia.num_niovs))
 		return;
 	area->freelist[area->free_count++] = net_iov_idx(niov);
@@ -658,7 +659,7 @@ static struct net_iov *zcrx_get_free_niov(struct io_zcrx_area *area)
 {
 	unsigned niov_idx;
 
-	lockdep_assert_held(&area->freelist_lock);
+	lockdep_assert_held(&area->ifq->alloc_lock);
 
 	if (unlikely(!area->free_count))
 		return NULL;
@@ -1251,7 +1252,7 @@ static unsigned io_zcrx_refill_slow(struct page_pool *pp, struct io_zcrx_ifq *if
 	struct io_zcrx_area *area = ifq->area;
 	unsigned allocated = 0;
 
-	guard(spinlock_bh)(&area->freelist_lock);
+	guard(spinlock_bh)(&ifq->alloc_lock);
 
 	for (allocated = 0; allocated < to_alloc; allocated++) {
 		struct net_iov *niov = zcrx_get_free_niov(area);
@@ -1564,14 +1565,13 @@ static bool io_zcrx_queue_cqe(struct io_kiocb *req, struct net_iov *niov,
 
 static struct net_iov *io_alloc_fallback_niov(struct io_zcrx_ifq *ifq)
 {
-	struct io_zcrx_area *area = ifq->area;
 	struct net_iov *niov = NULL;
 
 	if (!ifq->kern_readable)
 		return NULL;
 
-	scoped_guard(spinlock_bh, &area->freelist_lock)
-		niov = zcrx_get_free_niov(area);
+	scoped_guard(spinlock_bh, &ifq->alloc_lock)
+		niov = zcrx_get_free_niov(ifq->area);
 
 	if (niov)
 		page_pool_fragment_netmem(net_iov_to_netmem(niov), 1);
diff --git a/io_uring/zcrx.h b/io_uring/zcrx.h
index 4f8428db4aa4..18de02716453 100644
--- a/io_uring/zcrx.h
+++ b/io_uring/zcrx.h
@@ -37,7 +37,6 @@ struct io_zcrx_area {
 	u16			area_id;
 
 	/* freelist */
-	spinlock_t		freelist_lock ____cacheline_aligned_in_smp;
 	u32			free_count;
 	u32			*freelist;
 
@@ -66,6 +65,7 @@ struct io_zcrx_ifq {
 	bool				kern_readable;
 
 	struct zcrx_rq			rq ____cacheline_aligned_in_smp;
+	spinlock_t			alloc_lock ____cacheline_aligned_in_smp;
 
 	u32				if_rxq;
 	struct device			*dev;
-- 
2.54.0

