Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8286147F2C3
	for <io-uring@vger.kernel.org>; Fri,  7 Aug 2026 13:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108796; cv=none; b=rHIhtQPAcs7KpGHQfOwFhTZkJ0BPFNeO/EuFe5vqBgdh5qw1erLRx6n+xb4B0QnjxD7xfqMYblgLSH/DMW2IUakdjQ0ifec3z1XJrMWYr6tZVhJjgdWZQoW9ctpox3If9gDQyRxtWomB//LGtDLafc3HLdrZ/VYf08S8bSAEr5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108796; c=relaxed/simple;
	bh=4YjmpMBph23jpmNi5pIu1lAttkg50B5OhEcnauebiG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d8jbbaPYo9PP8PzN+miN19hWd12yO/oRyqxLiuYOKwJBvZVKECi8+W5D5R6dtFMwCKZFKD6LYWCxJ8Tzgm16D5IWjAUgT/Zqx+rwT4aVCcE3ap/3xRLgX7hJYkAkO7bJry3shF4GP7aFq7AK4r63VQWwBz2f+ubRGb9sh/X+v/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OF/NP7Tq; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OF/NP7Tq"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493b966dd74so20387875e9.3
        for <io-uring@vger.kernel.org>; Fri, 07 Aug 2026 06:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108788; x=1786713588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dtLOE6UfRc4choy+RqQ8hJ7IRsUIafze2ylP3yt/xGE=;
        b=OF/NP7TqcupYoMjWDdtfeDzBL/kKlmB16dd/X8u7tAPGiPzoBGW7nvnuYdznbJmncB
         5Bw7GawwpvQkTZXNWqf45cY5q0gEBUmuHEzZKUfPTCHa7MpS3cgPDSp/g/wAte5ISDTM
         QjSszaG0ZAv56UGRsssd/iP/MH9YKZEbw9wkgZ21KrgcTTBXOm+Ogb6Ho4g9sRz0D/CQ
         yG5+bmWxHeCei4r/DrqyK+y3YgA3xSr9+zVQ4andYKFvlooc8Cgv+EnhJwim5JIU42oe
         OWRya76lCQ5r1cVDnQkYo2mSlL+5rNJufzh7daJbb1lp5BN6iMYVa0gVYpk28Xqkl2Im
         /zDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108788; x=1786713588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dtLOE6UfRc4choy+RqQ8hJ7IRsUIafze2ylP3yt/xGE=;
        b=orcIg1fIY8ieZ/gly9u6RxkeaW6GgtSlqMdJdLB66b1W6kKkgy4aXOMg6ecQjSb4Xv
         3PH58hz4P9sMp9Htt1AdUthBOK8Zs71nu/b1w4GvIDR36h6l7hpjY5LSxdxe9lVw6fMo
         dp85jYrQUQQfVBspHjdo6PVjRma1Sn969RI3Q7dPtzP2P8JykakE5Sd2akuiy8Kvm78W
         HcIfwng3iPE41FjFEd6cIPNdmrUSs8B6ApjCXXltvjaNAzas2kKWDKoci74A1KvWjZ3/
         WnoXOsVc8nhbRXwBoBrTTsXF26KosEeMG4L2q16XrnYNRyW40LczUDeSF7txuZFkDb7L
         GD1Q==
X-Gm-Message-State: AOJu0YxgVSC7n+Xu1Ik+LGdIBYUwuxSeqOJEIVMvF9ps/d8VjDlEBX0w
	CKUyzJfAZGlfd9szAESPKjz8Bi90vusRsI8N4+RKXBlGM1KR4sEmq3JQXlaH/T22
X-Gm-Gg: AR+sD13bdwsnJZMaiiPCRNAG7uAxvd/MdEofj1wRUTHOi8LGjNgF0Ff+FbxtPRwNGnG
	7GNELIzBVTccrQdjozDbqqhDVNtajxL7M/C61qJ4n2VFeBncbzmsbEs0pyGTTKovmiECdtDGnjB
	hyltIm0o//x7l3gMIn8IEW85ZYs9jH4BR++f6sn6oEIJR5DWOLCqjebKSVt7jHG3NCFtcXpy+pp
	xJKpMyhtvIQrYTQXSb1lO0BCONvz0nP1SueiaTQ3O5Q58NVC33qenY3TGNPooPct86atms+XgZE
	J4yYjFg0mvEYUcEaf2tQkNrBAs6l8xUS7pe0Ob4ORw+FBfpfd0+n6mD70JHViNjiXybDxQ9bdyS
	w8Apc9dHsjD9A3/8iL4skQnRbZAqiZl08rR+2w16t2gNxAYAohBQoxcR12b3JojDWE8aezGLTgx
	N5fw9pUApUZYeELnckYN99qP8DcyvjlIcRGA1cbMeddxjAdGutDvMq4VQiZuILjZvzsgMk8h0XS
	9fyDPov3SJX5TODisSHZ7UN/4yLeTiHaXRnDTWRS9iVTEgDLzMPSIwea4jvZ7b9eA==
X-Received: by 2002:a05:600c:6b4e:b0:496:bbcb:b0bb with SMTP id 5b1f17b1804b1-4994e7e863amr244964415e9.18.1786108787583;
        Fri, 07 Aug 2026 06:19:47 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995427a244sm144125015e9.10.2026.08.07.06.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:19:46 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	netdev@vger.kernel.org
Subject: [PATCH io_uring 05/16] io_uring/zcrx: coalesce same-niov RQEs on refill
Date: Fri,  7 Aug 2026 14:19:23 +0100
Message-ID: <71f11d5de47553f187737e0e892ab783b03f53b1.1786108672.git.asml.silence@gmail.com>
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

With large rx piages I often see >10 sequential RQEs referring to the
same niov. Instead of putting them one by one, count such RQEs during
parsing and batch refcounting for the niov.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/zcrx.c | 56 +++++++++++++++++++++++++++++++------------------
 1 file changed, 36 insertions(+), 20 deletions(-)

diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
index 38557a9194ef..691206a7721b 100644
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@ -358,16 +358,16 @@ static inline atomic_t *io_get_user_counter(struct net_iov *niov)
 	return &area->user_refs[net_iov_idx(niov)];
 }
 
-static bool io_zcrx_put_niov_uref(struct net_iov *niov)
+static bool io_zcrx_put_niov_uref(struct net_iov *niov, unsigned refs)
 {
 	atomic_t *uref = io_get_user_counter(niov);
 	int old;
 
 	old = atomic_read(uref);
 	do {
-		if (unlikely(old == 0))
+		if (unlikely(old < refs))
 			return false;
-	} while (!atomic_try_cmpxchg(uref, &old, old - 1));
+	} while (!atomic_try_cmpxchg(uref, &old, old - refs));
 
 	return true;
 }
@@ -1163,6 +1163,22 @@ static inline bool io_parse_rqe(struct io_uring_zcrx_rqe *rqe,
 	return true;
 }
 
+static bool zcrx_put_refill_niov(struct net_iov *niov, struct page_pool *pp,
+				 unsigned refs)
+{
+	netmem_ref netmem = net_iov_to_netmem(niov);
+
+	if (!io_zcrx_put_niov_uref(niov, refs))
+		return false;
+	if (page_pool_unref_netmem(netmem, refs) != 0)
+		return false;
+	if (unlikely(niov->desc.pp != pp)) {
+		io_zcrx_return_niov(niov);
+		return false;
+	}
+	return true;
+}
+
 static unsigned io_zcrx_ring_refill(struct page_pool *pp,
 				    struct io_zcrx_ifq *ifq,
 				    netmem_ref *netmems, unsigned to_alloc)
@@ -1170,34 +1186,34 @@ static unsigned io_zcrx_ring_refill(struct page_pool *pp,
 	struct zcrx_rq *rq = &ifq->rq;
 	struct io_uring_zcrx_rqe *rqe;
 	struct zcrx_rq_iter it;
+	struct net_iov *niov = NULL;
+	unsigned niov_refs = 0;
 	unsigned allocated = 0;
 
 	guard(spinlock_bh)(&rq->lock);
 
 	zcrx_rq_iter_init(&it, rq);
 
-	while (zcrx_rq_iter_next(&it, rq, &rqe)) {
-		struct net_iov *niov;
-		netmem_ref netmem;
+	while (allocated < to_alloc - 1 && zcrx_rq_iter_next(&it, rq, &rqe)) {
+		struct net_iov *next_niov;
 
-		if (!io_parse_rqe(rqe, ifq, &niov))
-			continue;
-		if (!io_zcrx_put_niov_uref(niov))
+		if (!io_parse_rqe(rqe, ifq, &next_niov))
 			continue;
-
-		netmem = net_iov_to_netmem(niov);
-		if (!page_pool_unref_and_test(netmem))
-			continue;
-
-		if (unlikely(niov->desc.pp != pp)) {
-			io_zcrx_return_niov(niov);
+		if (niov == next_niov) {
+			niov_refs++;
 			continue;
 		}
+		if (niov && zcrx_put_refill_niov(niov, pp, niov_refs)) {
+			netmems[allocated] = net_iov_to_netmem(niov);
+			allocated++;
+		}
+		niov = next_niov;
+		niov_refs = 1;
+	}
 
-		netmems[allocated] = netmem;
+	if (niov && zcrx_put_refill_niov(niov, pp, niov_refs)) {
+		netmems[allocated] = net_iov_to_netmem(niov);
 		allocated++;
-		if (allocated >= to_alloc)
-			break;
 	}
 
 	smp_store_release(&rq->ring->head, rq->cached_head);
@@ -1409,7 +1425,7 @@ static void zcrx_return_buffers(netmem_ref *netmems, unsigned nr)
 		netmem_ref netmem = netmems[i];
 		struct net_iov *niov = netmem_to_net_iov(netmem);
 
-		if (!io_zcrx_put_niov_uref(niov))
+		if (!io_zcrx_put_niov_uref(niov, 1))
 			continue;
 		if (!page_pool_unref_and_test(netmem))
 			continue;
-- 
2.54.0

