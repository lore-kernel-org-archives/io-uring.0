Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8FD47607C
	for <io-uring@vger.kernel.org>; Fri,  7 Aug 2026 13:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108809; cv=none; b=Bcg8FTSgcWQJ2rhnhExsQQUuIdtog/EUpF9kg7CLNfqb6cq6Vug8pZtCah/lVC8f7UcmbfQdVtyWIRIy+u2HVPT08cJt/kVeJiXW6p+4w1w2F8KsO1V5iovF5CSX45541dCuad/fyMzKx6LrtEi+JXZmNYKr1Krg/ZFz14iYlrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108809; c=relaxed/simple;
	bh=bFreqPMeVxYPyIEuyrghiKNSWaJS38YMTKoqeiN8TjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cJ4ERK66it9f0HIFAUUbc5dGNQJQ7/sM4QbRHVX2rB1l5TxvdQw3bp6BhQxm5wHTEUNPfOI6ZX7xN/nlkyuMq7SRA1tDD4tTMqRyZWeXXDu/GY2PyfOT7S3uM+hWol5IuSiQkWTg6KxwyqYDzEQYT+o3yAcUAz1MM4ttOpA/k/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pwOiY1r/; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pwOiY1r/"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso18477205e9.3
        for <io-uring@vger.kernel.org>; Fri, 07 Aug 2026 06:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108800; x=1786713600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mGa4bDybY7Wn5tcIMt6hSrYoRfFtUvBhREQEEWFSLvo=;
        b=pwOiY1r/bu1kGuPw2Rr7cdxjwHcLts8LpNfQaDJkJ6xDUsv+xqgInD8qGKY2GmegTj
         bJqmzvVToBa0bImF2QlepsmVaJxLOY6qql92Z7YaJSOrVXy6v+3vmTGgZ2s5c/5zdt8A
         AcuLn5DJGpE3BqiegI5pzBq2rUd9+tKD0ucckFUO32DQdG2S9SmrugCj6eUQbRT/yXqO
         0ZozR1kY+IZgON5dSxqXdnspKltzgB6X4LFRD48nHUOFx4Hipyy7DyopiV66pRFyQlMC
         gUT0RDTBhpfz6+0SWgWscb5Y9Z11++IkSvvw38+aW5Pv1MNOXVjpz8n+rC2ZHUr2Qu7S
         6xAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108800; x=1786713600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mGa4bDybY7Wn5tcIMt6hSrYoRfFtUvBhREQEEWFSLvo=;
        b=XO9QF/e4BODrtyxjaa7Zy5ej5lNx+3OL5cHnsO9iqf2EwjAXhKfM7RCPYdffwufSeN
         bJfWqu+4P1PWRWV4oV6hbrll7c7tn1iRkFw9loFcBnLFQW4yix7ywTKlUcE7C6JeIT1L
         WwulEqu6YwB/1HfoE+B9Uq4MPPhYJxAdToSe+EsAwD52ZxnCX8waoSwRsjrx3GhwaKcW
         A9JQKOU9uG3gzWCZmXDJotDb9l+n5zXy5uDJmJ1VK+GMcg/vdvWXnOlxN2/dMwPmWO0Q
         O7NH8C58zqLw67vXa//yVJWq4NbP105QpgznaUSMzP9Junsv8t3mKNX4yGUqUn35ipXr
         Y7nA==
X-Gm-Message-State: AOJu0Yw32DPiNICuvdo8TMlMnTDfINyZQVS08k5hkXGEZXnTg9Jce790
	ms/Pb3HzaPIiuayfprsbX1Tkky77hiQogwngbf6VsUaCBElrzk3QnVQ3s7E129i5
X-Gm-Gg: AR+sD13ECVQ618OQUWDg3ZvSXN7slX4+uFyO6RfczvJQauPSEo7xWUmLUkqATlPn7V+
	vPhAY1fmcH4+pwUAH/pMe28Qd/fInLSs5oYvdCHgsv2bIRsyKr3x2EFE7sAWcNJe4enBiY5EhCs
	bzRzc+FDBR/v9yQAo1qJg1d+3oWTfLJi6JENbTRF00F9so9KBtI0FZ2/gnY4T7A+LjQi2RBD+90
	n1k6dyC3sKx4DtpcJngkMgWMGAJW6HMers6qKc9KLxVmyWEaVHo0urrWHuVfLn1INwvRXezCl7k
	9patUOt/mdCLhts2h9+tHS19998yiivYl3CMRQIMgsZYXv72gURC4maMwUOzetsAmSU8nRiMkvI
	2gBIwg+GvmHWhVJIoQWgfYIAPOd8OT4oDgKpLOIqlKtbA+KK5PMjiqU+VUXjGn230j8YpWXKZQr
	9b6MwennX5QTPzdGbCvDuTGIFTBgykxsg1PjveY4sr4SjKNJxsEU/B58ATES+eiUVCOsSWz2aMo
	lHBEX6BCqqpXJJMYk/xksqeXY4H7qBLALdSkUgiZqZDs7XEoPJCMKurQin1fJcMaw==
X-Received: by 2002:a05:600c:46ca:b0:499:53c4:1daa with SMTP id 5b1f17b1804b1-49953c41e18mr163449665e9.15.1786108799840;
        Fri, 07 Aug 2026 06:19:59 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995427a244sm144125015e9.10.2026.08.07.06.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:19:59 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	netdev@vger.kernel.org
Subject: [PATCH io_uring 14/16] io_uring/zcrx: keep array of areas
Date: Fri,  7 Aug 2026 14:19:32 +0100
Message-ID: <d186adfa0ea26f651804cffef77d477f257eb404.1786108672.git.asml.silence@gmail.com>
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

Currently, we have only a one area per zcrx instance, and struct
io_zcrx_ifq stores a single pointer. To prepare for adding more areas,
replace it with an array of areas.

We'll be creating them at runtime, and the array is protected by 3
locks: ->pp_lock, ->alloc_lock and ->rq.lock. It takes all of them when
switching arrays, and readers should hold either of them.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/zcrx.c | 112 +++++++++++++++++++++++++++++++++++-------------
 io_uring/zcrx.h |   5 ++-
 2 files changed, 87 insertions(+), 30 deletions(-)

diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
index 3cf5e456990a..8de142856795 100644
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@ -306,16 +306,14 @@ static int io_import_area(struct io_zcrx_ifq *ifq,
 	return io_import_umem(ifq, mem, area_reg);
 }
 
-static void io_zcrx_unmap_area(struct io_zcrx_ifq *ifq,
+static void __io_zcrx_unmap_area(struct io_zcrx_ifq *ifq,
 				struct io_zcrx_area *area)
 {
 	int i;
 
-	if (!area)
-		return;
+	lockdep_assert_held(&ifq->pp_lock);
 
-	guard(mutex)(&ifq->pp_lock);
-	if (!area->is_mapped)
+	if (!area || !area->is_mapped)
 		return;
 	area->is_mapped = false;
 
@@ -332,6 +330,23 @@ static void io_zcrx_unmap_area(struct io_zcrx_ifq *ifq,
 	}
 }
 
+static void io_zcrx_unmap_area(struct io_zcrx_ifq *ifq,
+				struct io_zcrx_area *area)
+{
+	guard(mutex)(&ifq->pp_lock);
+	__io_zcrx_unmap_area(ifq, area);
+}
+
+static void io_zcrx_unmap_areas(struct io_zcrx_ifq *ifq)
+{
+	unsigned area_idx;
+
+	guard(mutex)(&ifq->pp_lock);
+
+	for (area_idx = 0; area_idx < ifq->nr_areas; area_idx++)
+		__io_zcrx_unmap_area(ifq, ifq->areas[area_idx]);
+}
+
 static void zcrx_sync_for_device(struct page_pool *pp, struct io_zcrx_ifq *zcrx,
 				 netmem_ref *netmems, unsigned nr)
 {
@@ -458,13 +473,29 @@ static int io_zcrx_append_area(struct io_zcrx_ifq *ifq,
 				struct io_zcrx_area *area)
 {
 	bool kern_readable = !area->mem.is_dmabuf;
+	struct io_zcrx_area **areas, **old_areas;
+	unsigned old_nr;
 
-	if (WARN_ON_ONCE(ifq->area))
-		return -EINVAL;
 	if (WARN_ON_ONCE(ifq->kern_readable != kern_readable))
 		return -EINVAL;
 
-	ifq->area = area;
+	old_areas = ifq->areas;
+	old_nr = ifq->nr_areas;
+
+	areas = kmalloc_array(old_nr + 1, sizeof(areas[0]),
+			      GFP_KERNEL_ACCOUNT | __GFP_ZERO);
+	if (!areas)
+		return -ENOMEM;
+	if (old_areas)
+		memcpy(areas, old_areas, old_nr * sizeof(areas[0]));
+	areas[old_nr] = area;
+
+	scoped_guard(spinlock_bh, &ifq->rq.lock) {
+		guard(spinlock_bh)(&ifq->alloc_lock);
+		ifq->areas = areas;
+		ifq->nr_areas = old_nr + 1;
+	}
+	kfree(old_areas);
 	return 0;
 }
 
@@ -609,7 +640,7 @@ static void io_close_queue(struct io_zcrx_ifq *ifq)
 		if (ifq->if_rxq != -1)
 			netif_mp_close_rxq(netdev, ifq->if_rxq, &p);
 
-		io_zcrx_unmap_area(ifq, ifq->area);
+		io_zcrx_unmap_areas(ifq);
 		netdev_unlock(netdev);
 		netdev_put(netdev, &netdev_tracker);
 	}
@@ -618,6 +649,8 @@ static void io_close_queue(struct io_zcrx_ifq *ifq)
 
 static void io_zcrx_ifq_free(struct io_zcrx_ifq *ifq)
 {
+	int i;
+
 	if (WARN_ON_ONCE(ifq->if_rxq != -1))
 		return;
 	if (WARN_ON_ONCE(ifq->netdev != NULL))
@@ -625,8 +658,8 @@ static void io_zcrx_ifq_free(struct io_zcrx_ifq *ifq)
 	if (WARN_ON_ONCE(ifq->master_ctx))
 		return;
 
-	if (ifq->area)
-		io_zcrx_free_area(ifq, ifq->area);
+	for (i = 0; i < ifq->nr_areas; i++)
+		io_zcrx_free_area(ifq, ifq->areas[i]);
 	if (ifq->mm_account)
 		mmdrop(ifq->mm_account);
 	if (ifq->dev)
@@ -635,6 +668,7 @@ static void io_zcrx_ifq_free(struct io_zcrx_ifq *ifq)
 	io_free_rbuf_ring(ifq);
 	free_uid(ifq->user);
 	mutex_destroy(&ifq->pp_lock);
+	kfree(ifq->areas);
 	kfree(ifq);
 }
 
@@ -680,14 +714,10 @@ static void io_zcrx_return_niov(struct net_iov *niov)
 	page_pool_put_unrefed_netmem(niov->desc.pp, netmem, -1, false);
 }
 
-static void io_zcrx_scrub(struct io_zcrx_ifq *ifq)
+static void io_zcrx_scrub_area(struct io_zcrx_ifq *ifq, struct io_zcrx_area *area)
 {
-	struct io_zcrx_area *area = ifq->area;
 	int i;
 
-	if (!area)
-		return;
-
 	/* Reclaim back all buffers given to the user space. */
 	for (i = 0; i < area->nia.num_niovs; i++) {
 		struct net_iov *niov = &area->nia.niovs[i];
@@ -701,6 +731,15 @@ static void io_zcrx_scrub(struct io_zcrx_ifq *ifq)
 	}
 }
 
+static void io_zcrx_scrub(struct io_zcrx_ifq *ifq)
+{
+	int i;
+
+	guard(mutex)(&ifq->pp_lock);
+	for (i = 0; i < ifq->nr_areas; i++)
+		io_zcrx_scrub_area(ifq, ifq->areas[i]);
+}
+
 static void zcrx_unregister_user(struct io_zcrx_ifq *ifq, struct io_ring_ctx *ctx)
 {
 	scoped_guard(spinlock_bh, &ifq->ctx_lock) {
@@ -1174,12 +1213,15 @@ static inline bool io_parse_rqe(struct io_uring_zcrx_rqe *rqe,
 	unsigned niov_idx, area_idx;
 	struct io_zcrx_area *area;
 
+	lockdep_assert_held(&ifq->rq.lock);
+
 	area_idx = off >> IORING_ZCRX_AREA_SHIFT;
 	niov_idx = (off & ~IORING_ZCRX_AREA_MASK) >> ifq->niov_shift;
 
-	if (unlikely(rqe->__pad || area_idx))
+	if (unlikely(rqe->__pad || area_idx >= ifq->nr_areas))
 		return false;
-	area = ifq->area;
+	area_idx = array_index_nospec(area_idx, ifq->nr_areas);
+	area = ifq->areas[area_idx];
 
 	if (unlikely(niov_idx >= area->nia.num_niovs))
 		return false;
@@ -1249,18 +1291,24 @@ static unsigned io_zcrx_ring_refill(struct page_pool *pp,
 static unsigned io_zcrx_refill_slow(struct page_pool *pp, struct io_zcrx_ifq *ifq,
 				    netmem_ref *netmems, unsigned to_alloc)
 {
-	struct io_zcrx_area *area = ifq->area;
+	unsigned area_idx = 0;
 	unsigned allocated = 0;
 
 	guard(spinlock_bh)(&ifq->alloc_lock);
 
-	for (allocated = 0; allocated < to_alloc; allocated++) {
-		struct net_iov *niov = zcrx_get_free_niov(area);
+	while (allocated < to_alloc) {
+		struct net_iov *niov = zcrx_get_free_niov(ifq->areas[area_idx]);
+
+		if (!niov) {
+			area_idx++;
+			if (area_idx >= ifq->nr_areas)
+				break;
+			continue;
+		}
 
-		if (!niov)
-			break;
 		net_mp_niov_set_page_pool(pp, niov);
 		netmems[allocated] = net_iov_to_netmem(niov);
+		allocated++;
 	}
 	return allocated;
 }
@@ -1404,8 +1452,8 @@ static void io_pp_uninstall(void *mp_priv, struct netdev_rx_queue *rxq)
 	struct pp_memory_provider_params *p = &rxq->mp_params;
 	struct io_zcrx_ifq *ifq = mp_priv;
 
+	io_zcrx_unmap_areas(ifq);
 	io_zcrx_drop_netdev(ifq);
-	io_zcrx_unmap_area(ifq, ifq->area);
 
 	p->mp_ops = NULL;
 	p->mp_priv = NULL;
@@ -1566,16 +1614,22 @@ static bool io_zcrx_queue_cqe(struct io_kiocb *req, struct net_iov *niov,
 static struct net_iov *io_alloc_fallback_niov(struct io_zcrx_ifq *ifq)
 {
 	struct net_iov *niov = NULL;
+	unsigned area_idx;
 
 	if (!ifq->kern_readable)
 		return NULL;
 
-	scoped_guard(spinlock_bh, &ifq->alloc_lock)
-		niov = zcrx_get_free_niov(ifq->area);
+	guard(spinlock_bh)(&ifq->alloc_lock);
+
+	for (area_idx = 0; area_idx < ifq->nr_areas; area_idx++) {
+		niov = zcrx_get_free_niov(ifq->areas[area_idx]);
+		if (niov) {
+			page_pool_fragment_netmem(net_iov_to_netmem(niov), 1);
+			return niov;
+		}
+	}
 
-	if (niov)
-		page_pool_fragment_netmem(net_iov_to_netmem(niov), 1);
-	return niov;
+	return NULL;
 }
 
 struct io_copy_cache {
diff --git a/io_uring/zcrx.h b/io_uring/zcrx.h
index 18de02716453..d4a54b4e17fd 100644
--- a/io_uring/zcrx.h
+++ b/io_uring/zcrx.h
@@ -58,7 +58,10 @@ struct zcrx_rq {
 };
 
 struct io_zcrx_ifq {
-	struct io_zcrx_area		*area;
+	/* read-protected by any of: ->pp_lock, ->alloc_lock, ->rq.lock */
+	struct io_zcrx_area		**areas;
+	unsigned			nr_areas;
+
 	unsigned			niov_shift;
 	struct user_struct		*user;
 	struct mm_struct		*mm_account;
-- 
2.54.0

