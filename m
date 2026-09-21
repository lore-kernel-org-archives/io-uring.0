Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6FC4A0935
	for <io-uring@vger.kernel.org>; Mon, 21 Sep 2026 13:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789997971; cv=none; b=VcQUhX999X7jUWFTDtMyvOrTpBXsfCDASIHpqZ9BM4cFXyO5CXhsl8PlpE1RUIICeDKiA1w/Jb/94h0Td0MAO0st4GDUk4X6+3gfxRu+5hDQ8IaN04zTITQZ4PqtlQKlwH0jVKFFlHUfgI9S4qp9Z78cZhBRzVZuZAM0PW84D/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789997971; c=relaxed/simple;
	bh=9vQH2FkifwfjUkmpno2ejJJq+JJRqKfmbGSl7/camvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mhLzL3wZLzt75zxufXAEshSPHueQ/zeMk/Kt41NqrF9rHFek1RZZFd2kk2BtC+5oXr6BGLHmXl5TwVM3bcNnQtT0Sw/H18XhfAova8WS2mOBXJ0VhQ4s5eHZfkv/NZ+UEPzeh8CJBelqipSjfvNoBcPDRclH9sWFE4KbYI4bR6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OBX0Kho9; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBX0Kho9"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-482f6351831so1518874f8f.1
        for <io-uring@vger.kernel.org>; Mon, 21 Sep 2026 06:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789997967; x=1790602767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lhfYmNfKHeufPvJ/pLV04jPXJys5SvK0KBUyCDM0noo=;
        b=OBX0Kho9R6MTUYOALWN0nKWJp+S/nhUEONjYX7gfgpUph7N899PxoK1kfuxxth8oGW
         Lx7JG0hz5qtBxnGYBGsLP+g29A0o2Zb8vkwyzYXyedoUivYksnuI0+Gvc+sGOXmH6Js8
         rKguejXDcfFbgT8m9ZkU3v0KtoFTFi4Lz+YeS+k2mHz8YvWxCHbh1oEwQASW/h6QJDFX
         oG8hZN25N0tXeiMWvuBN4QlZVp25ZdEVJbYjZ/ZVeMu6CaHhapvjfs6KkFIuZiTEj5gX
         kBRHccMC2MTXllk821eiqbU9KSkLU9biO+Z8IYmep5AZd6asZ+Ny50m8BszeTh5kxAAm
         5yGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789997967; x=1790602767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lhfYmNfKHeufPvJ/pLV04jPXJys5SvK0KBUyCDM0noo=;
        b=gkZz7eR06LNTItu4zIab+JHitERvC0Xpppk4SDZoLOeKUrJwSHKtRm1TRj0poO9S6j
         p17oQr0kidQOteZlTmbCacGtc9+uylxTG95oqJ8pJyhq7W8whJrDnbdx6KQhasVIzinb
         PE/VDv1+kQQaQI/2RExMwLlwHL7HjJM36ZukfoLfewtfI8fV4mtuApUmZFZP5cSVWZCj
         wSgfro2WCiLo5+TIjDcJwnflw/RKVt2uheVxTNEx42YxoOA1jVbN8R5VkULOgSm8MmCM
         U41/RVBQ5QzQHKNd8H5U5Q8J5SUVRtXocVGtUwYl5/ZhkOlXtWGR8k70YI2/A8Z3hWtJ
         Bj3A==
X-Forwarded-Encrypted: i=1; AKwUvBxzdB6j7p7Gt1TpjA04XSCB8ivYW3X4b+MAZHCy2oz8o8CWV6WNDdNGiyK6Wmlx6IL3bk+Pi0vKBA==@vger.kernel.org
X-Gm-Message-State: AFuF++mnQD4nP0DqFCmAehgKVGA9KdqMc57VvHPL55NQ1hxEjuTgztya
	eF5+xS/YMprNED9zAo87pHFvIU57sM7QbTx+8QKlMcPt6Afxu9rpYaMK
X-Gm-Gg: AYBFou1hXg94hd+krvICggpaoDKmyy9ziELE1FAxHBeMy0fkCou3WrYZv3W/kgRfLRD
	SvJLmn2GESYB0Txx8PN1Hu1zGWPUDPoaNTXWiXH+ryIP+bwzh6aXthWLYsIgOEFxMbY/NgW040l
	QLY9fYOa1vdixDumYwR245VoWroA0ZFdpmDfzrLk6+H33G2jfmB/aX/LhAIaIlTermxM1sb6qIr
	XQJrRgPgpijr4YSNpanXRlSTBqVz2PlPmOW6k4MtsZYTAhcGjf5oR+G6+jrhIDbGXl5tyqsV9qN
	Ien73AJBZHJr72pqmzC21O6vdkx3UE92DSamavGdKlPG7zIWiJ4rFczxjTly+7PM+z9v+4dvZlO
	XG9/1rWAuTzlTIOCPje/yLNRdC5e2oeV7yAIEa4PtN8UlI12ooev7d4A4ZLVEtX937iCHzpxnxb
	lIq6jzGJ4FrpGOhjN3eKx1kEXb6BW6tYlZsEIIf045Xo0Qv8aomh5QlVTBMbddxuTgjNnO7zHbm
	oZY3OSTCOqPtG0WFdiu7ojoaIwEpk1S4yCQLc5XIhwNZUHKgpCs9RWDxvDUXN52H4tHJ3sNVaib
	Fooc1B75aGsHjfyqnT+HWoFcu4GExA==
X-Received: by 2002:a05:600c:19cb:b0:49e:8184:f619 with SMTP id 5b1f17b1804b1-49fc57410f2mr151435725e9.22.1789997966776;
        Mon, 21 Sep 2026 06:39:26 -0700 (PDT)
Received: from 127.0.0.1localhost (82-132-213-26.dab.02.net. [82.132.213.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc585920fsm617171605e9.4.2026.09.21.06.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 06:39:26 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: linux-block@vger.kernel.org
Cc: asml.silence@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-nvme@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	io-uring@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Keith Busch <kbusch@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jens Axboe <axboe@kernel.dk>,
	Nitesh Shetty <nj.shetty@samsung.com>,
	Kanchan Joshi <joshi.k@samsung.com>,
	Anuj Gupta <anuj20.g@samsung.com>,
	Tushar Gohad <tushar.gohad@intel.com>,
	William Power <william.power@intel.com>,
	Phil Cayton <phil.cayton@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel@lists.linux.dev
Subject: [PATCH v6 02/13] iov_iter: add iterator type for dmabuf maps
Date: Mon, 21 Sep 2026 14:38:46 +0100
Message-ID: <6b78003332b57ec3a4552d7393464636793aff76.1789997898.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1789997898.git.asml.silence@gmail.com>
References: <cover.1789997898.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a new iterator type for dmabuf maps. The map in an opaque
object with internals and format specific to the subsystem / driver, and
only it can use that subsystem / driver for issuing IO. The task of the
middle layers is to pass the map / iterator further down, maybe doing
basic splitting and length checking. The iterator can only be used by
operations of the file the associated map was created for.

Suggested-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 include/linux/uio.h | 11 +++++++++++
 lib/iov_iter.c      | 29 +++++++++++++++++++++++------
 2 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/include/linux/uio.h b/include/linux/uio.h
index fe2e985d74d2..638c1116e912 100644
--- a/include/linux/uio.h
+++ b/include/linux/uio.h
@@ -12,6 +12,7 @@
 
 struct page;
 struct folio_queue;
+struct dma_buf_io_map;
 
 typedef unsigned int __bitwise iov_iter_extraction_t;
 
@@ -29,6 +30,7 @@ enum iter_type {
 	ITER_FOLIOQ,
 	ITER_XARRAY,
 	ITER_DISCARD,
+	ITER_DMABUF_MAP,
 };
 
 #define ITER_SOURCE	1	// == WRITE
@@ -71,6 +73,7 @@ struct iov_iter {
 				const struct folio_queue *folioq;
 				struct xarray *xarray;
 				void __user *ubuf;
+				struct dma_buf_io_map *dmabuf_map;
 			};
 			size_t count;
 		};
@@ -155,6 +158,11 @@ static inline bool iov_iter_is_xarray(const struct iov_iter *i)
 	return iov_iter_type(i) == ITER_XARRAY;
 }
 
+static inline bool iov_iter_is_dmabuf_map(const struct iov_iter *i)
+{
+	return iov_iter_type(i) == ITER_DMABUF_MAP;
+}
+
 static inline unsigned char iov_iter_rw(const struct iov_iter *i)
 {
 	return i->data_source ? WRITE : READ;
@@ -300,6 +308,9 @@ void iov_iter_folio_queue(struct iov_iter *i, unsigned int direction,
 			  unsigned int first_slot, unsigned int offset, size_t count);
 void iov_iter_xarray(struct iov_iter *i, unsigned int direction, struct xarray *xarray,
 		     loff_t start, size_t count);
+void iov_iter_dmabuf_map(struct iov_iter *i, unsigned int direction,
+			struct dma_buf_io_map *map,
+			loff_t off, size_t count);
 ssize_t iov_iter_get_pages2(struct iov_iter *i, struct page **pages,
 			size_t maxsize, unsigned maxpages, size_t *start);
 ssize_t iov_iter_get_pages_alloc2(struct iov_iter *i, struct page ***pages,
diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index 2072c04e99d0..6831a5d9396e 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -575,7 +575,8 @@ void iov_iter_advance(struct iov_iter *i, size_t size)
 {
 	if (unlikely(i->count < size))
 		size = i->count;
-	if (likely(iter_is_ubuf(i)) || unlikely(iov_iter_is_xarray(i))) {
+	if (likely(iter_is_ubuf(i)) || unlikely(iov_iter_is_xarray(i)) ||
+	    unlikely(iov_iter_is_dmabuf_map(i))) {
 		i->iov_offset += size;
 		i->count -= size;
 	} else if (likely(iter_is_iovec(i) || iov_iter_is_kvec(i))) {
@@ -631,7 +632,8 @@ void iov_iter_revert(struct iov_iter *i, size_t unroll)
 		return;
 	}
 	unroll -= i->iov_offset;
-	if (iov_iter_is_xarray(i) || iter_is_ubuf(i)) {
+	if (iov_iter_is_xarray(i) || iter_is_ubuf(i) ||
+	    iov_iter_is_dmabuf_map(i)) {
 		BUG(); /* We should never go beyond the start of the specified
 			* range since we might then be straying into pages that
 			* aren't pinned.
@@ -775,6 +777,20 @@ void iov_iter_xarray(struct iov_iter *i, unsigned int direction,
 }
 EXPORT_SYMBOL(iov_iter_xarray);
 
+void iov_iter_dmabuf_map(struct iov_iter *i, unsigned int direction,
+			 struct dma_buf_io_map *map,
+			 loff_t off, size_t count)
+{
+	WARN_ON(direction & ~(READ | WRITE));
+	*i = (struct iov_iter){
+		.iter_type = ITER_DMABUF_MAP,
+		.data_source = direction,
+		.dmabuf_map = map,
+		.count = count,
+		.iov_offset = off,
+	};
+}
+
 /**
  * iov_iter_discard - Initialise an I/O iterator that discards data
  * @i: The iterator to initialise.
@@ -856,7 +872,7 @@ unsigned long iov_iter_alignment(const struct iov_iter *i)
 		return iov_iter_alignment_bvec(i);
 
 	/* With both xarray and folioq types, we're dealing with whole folios. */
-	if (iov_iter_is_folioq(i))
+	if (iov_iter_is_folioq(i) || iov_iter_is_dmabuf_map(i))
 		return i->iov_offset | i->count;
 	if (iov_iter_is_xarray(i))
 		return (i->xarray_start + i->iov_offset) | i->count;
@@ -872,7 +888,7 @@ unsigned long iov_iter_gap_alignment(const struct iov_iter *i)
 	size_t size = i->count;
 	unsigned k;
 
-	if (iter_is_ubuf(i))
+	if (iter_is_ubuf(i) || iov_iter_is_dmabuf_map(i))
 		return 0;
 
 	if (WARN_ON(!iter_is_iovec(i)))
@@ -1469,11 +1485,12 @@ EXPORT_SYMBOL_GPL(import_ubuf);
 void iov_iter_restore(struct iov_iter *i, struct iov_iter_state *state)
 {
 	if (WARN_ON_ONCE(!iov_iter_is_bvec(i) && !iter_is_iovec(i) &&
-			 !iter_is_ubuf(i)) && !iov_iter_is_kvec(i))
+			 !iter_is_ubuf(i) && !iov_iter_is_kvec(i) &&
+			 !iov_iter_is_dmabuf_map(i)))
 		return;
 	i->iov_offset = state->iov_offset;
 	i->count = state->count;
-	if (iter_is_ubuf(i))
+	if (iter_is_ubuf(i) || iov_iter_is_dmabuf_map(i))
 		return;
 	/*
 	 * For the *vec iters, nr_segs + iov is constant - if we increment
-- 
2.54.0

