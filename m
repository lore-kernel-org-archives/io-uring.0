Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A344F68C3
	for <io-uring@vger.kernel.org>; Wed, 14 Oct 2026 11:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791975750; cv=none; b=WtJIP22WiaNwVMAGPQQuUmbv2ztK6X7GJAXLYl+MnwsNSMOS32tpKcJe5WbTaCPVYgRPTVBS0igDT0biudIqynf7YvzEqZp2sZiMTeMGsn/LYBHpkTgXdKrbKzowcGP8RjG20ryoKKLyfvtbFdla5OCg4prOnp9he6e7MJNSgfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791975750; c=relaxed/simple;
	bh=r0p2adqwMj/5lT7C+TYVmZHcVYZ+gdU2HSJ4o7+sSAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fu1kiksmkn/OMMVIUs7nm9Y90wB78xIRYHuLaLs+2mQuIXFB+KgPVLj6K8yI9KeYfwNeg+AijIXcddCwVtXSjtoNuGZOpLzz7SmgS/KMr7XsEtBfR7G3sxAhpRYXsrK6BpSp9pfIMMA7dKGdqNUuZy/T7bK7rSSvELzsr1+8bds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AlZajlsF; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AlZajlsF"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49e73611928so37265645e9.1
        for <io-uring@vger.kernel.org>; Wed, 14 Oct 2026 04:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791975743; x=1792580543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u2SC7dcI1Y+PPMkABrALMaBjWk253olXayI/6F0cq90=;
        b=AlZajlsFuXNaw+WSC4WWNqvtnnlJsFoEwUA49HXTnNp0KUIgaki8UMeIQFfXiew5RR
         nRsVHSGB0v2wsK81ajZ+w0926oaAQXpl5IG7QFo+hAvpcGDs8MUTHaAYlh9O/0geKjs7
         LVgdmzayccV8J4e/jsDDXlN1d1p6obd8D2rlsCgLcfC7lXB+RFn+pHGzFV8hKRwP7ZTN
         wIwJ9ybi7RrKdY+g61g8xHUOwRN/bVPedQoA/V8vyIQtO/pTGzVZIZYk0BSseto93l6/
         IDg6fC43p0Uux/LxB/Ar46+trrtxI6JOyWvCSi7jTJtqrDbItzaH8VlXUO0KA8iFM6xg
         EX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791975743; x=1792580543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u2SC7dcI1Y+PPMkABrALMaBjWk253olXayI/6F0cq90=;
        b=Gh0pul24r2YCKeEqKHAg+dZ+Q4K/bS5Bztq6RNJ63YpOQ+uJXBQbToqprdlLzccAo8
         XhlJI3tQiVv/fr1kuKibMtdBic9IfSHKaI6Ip64NtyOTkfV15AibwSC1jdUtcTMNkcST
         ExQ5M0WsLeYDH3gou66e+6OBJYqNBdu9j18a57eDWmASMec4mnZpsbLr99UfBpVihD4j
         Z5mDtoRpngCKoHXRUxn9eSIJaYj6dbT1gX+PoNCX+sBvYs4QY1ArdcLhWpbv2WHGDcF+
         yqHPnVbMzjmm4u0YioKd2c6Kieqa+b5bsxiZQkAazQNgpFFccbTP3uFhcAnSlrRSYvSE
         3sRA==
X-Forwarded-Encrypted: i=1; AKwUvBxplG26/YsV6xjdNBPzpF3WeuTIZpIKyw2AdwOsoUr0fWNddwU7IsnYWhC1oC/rQ5UJDsq8Llb2Ww==@vger.kernel.org
X-Gm-Message-State: AFq9FYKqHhe9fxKOzmryUtEYKjOCeGJNM3OmhS6Wd0D9wohTIdYd2dDr
	q75qhi6usLAqRVY5Joa/3gOhMvi8tPM1dLoSnahllFPcMmXRyHEpq8nE
X-Gm-Gg: AYBFou3xrB6UMGtelxqtCUH66qBgsoR0DRxiHKf7vCkwnVR87cqehoonaQ+SXlusTs2
	SNvSvBBZl1l53KYaeclBJMl6I8IcxrlMfutHOqYxF64VGSpB6zRvkip4io6rEIfTM2cg3HmjaSq
	GU+OenqlNBNy/+MLng8lWRJ160J//Kr5SQkn3zpor9ygsRn7V+aG45zn1W9QvE4g8g2dNGwg1cV
	2QfWftgs2Tu+7qNaIhYZCGGCD6LlhDIDROQinDUOYQWh+wrQL26NUYlyZsQw3W+xjAXFpb33OOF
	jMK6HtdKs4PXcylaOuyru5WCS7gbpVdNsqXLG99Q87Umkt/52JFpJjCrHQ6ivmE8jdlNVZLmjX6
	7TJWx7vL4PAnJyntZvxrwQsfUtZvdlKwICDXyck+pD0L3w56vjueFXcyXH4UZObLMkv8YsMCl7M
	5YMIO+UTysGPThL61izwHys0C+xX0+Gq+xdMUNNKpqMVaeAY/68vviJyMev9kZCiTlI+tnL2cT2
	w0e0Pibqz/xza6Gxh6n1HhCL/NkSsPPnEjFh/ZmmR1QutdibbzM2lsGYr26hOtJq2wQ9adtIvvq
X-Received: by 2002:a05:600c:3146:b0:4a0:34a:588c with SMTP id 5b1f17b1804b1-4a18e4a7cb9mr304322515e9.14.1791975742685;
        Wed, 14 Oct 2026 04:02:22 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b45eb78csm38078845e9.2.2026.10.14.04.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:02:21 -0700 (PDT)
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
	Matthew Brost <matthew.brost@intel.com>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel@lists.linux.dev
Subject: [PATCH v11 02/13] iov_iter: add iterator type for dmabuf maps
Date: Wed, 14 Oct 2026 12:02:00 +0100
Message-ID: <6aedb1c606f20ae5bd7fa358829966384c6e738f.1791975048.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1791975048.git.asml.silence@gmail.com>
References: <cover.1791975048.git.asml.silence@gmail.com>
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
 include/linux/iov_iter.h |  2 ++
 include/linux/uio.h      | 11 +++++++++++
 lib/iov_iter.c           | 29 +++++++++++++++++++++++------
 3 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/include/linux/iov_iter.h b/include/linux/iov_iter.h
index f9a17fbbd398..2f91884d733b 100644
--- a/include/linux/iov_iter.h
+++ b/include/linux/iov_iter.h
@@ -310,6 +310,8 @@ size_t iterate_and_advance2(struct iov_iter *iter, size_t len, void *priv,
 		return iterate_folioq(iter, len, priv, priv2, step);
 	if (iov_iter_is_xarray(iter))
 		return iterate_xarray(iter, len, priv, priv2, step);
+	if (WARN_ON_ONCE(iov_iter_is_dmabuf_map(iter)))
+		return 0;
 	return iterate_discard(iter, len, priv, priv2, step);
 }
 
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

