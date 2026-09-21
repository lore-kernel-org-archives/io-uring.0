Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344B64A43E2
	for <io-uring@vger.kernel.org>; Mon, 21 Sep 2026 13:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789997996; cv=none; b=EvcYuDywntsHE+9mWKcSqkYhkFV6k5Sxqm5t65fJ/qaTtpICqXkTKTKcXsfW6EIxhshtvc+pIR/5WBYb54eSB4BuFO/OMsVv3Rw/iPJvJlDkUqaiDMz7XQgQFFyaO/FOtlIPyrAMGEVkglZ0wAFwqfg5XfHLIk5q5ZVEOw1jXrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789997996; c=relaxed/simple;
	bh=Z4vOxks9qTIFK+TCf+DcsECaWrDahRJWHvnK/Oy0YsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ou+1wQ6DNvpNzSBoMkDJOWxmYj+BwiBS9K193x7qcFAbKOwzXfUbAgO2OQzrO1Lj1m0BL+Tx5ewVot/bLxNignfRNHIpLgfmqPhStODPDRCxioY7XLQGP6xNEkNkJJTkz8GiVJuFK6Q/mTf4GSpk6lJ6MYmUcwemUzRio9CFLiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fcYiafm8; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fcYiafm8"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so16572125e9.1
        for <io-uring@vger.kernel.org>; Mon, 21 Sep 2026 06:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789997991; x=1790602791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/RT09IM6iAPFk2VI7P8d4NpW1v04uxG67FoGdSGxGhI=;
        b=fcYiafm8WU+PsHRjH0kBI4wrr69zkXEz7/dHrIMdS1Z/IFxyLYqxbvjL/7VyDJi8Ld
         Jpa6Vc6CfYPjuicYz74Ga+Dh7Vw+gpR24aYwywaCtE3A+VObPrOoZ569w6NQghrXi81l
         hCzCS9HVe9HBEa1PYdxPSP2GcnXEYJYpB9W1KeLKNW2IqMxw25mx5mD1Negm+gU82j6P
         Bwr1NPRIt5MNZn/ynUqrtU0IVtWykr8mO1MM++j+r/IQGxxuUGg+vYgADzl6XI4GjeZ2
         bU0fPWvVUZ+5faGWAp2h219j1GTQ518m4kyuyFj3qUdctv2uFuJsniJ676LO29k4Vvr6
         8wRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789997991; x=1790602791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/RT09IM6iAPFk2VI7P8d4NpW1v04uxG67FoGdSGxGhI=;
        b=NWxrUOvYvupBOMhuZMyy3/OUNQY6JHsmlIJ+xqHLLoF6SkaZil41WIvWl8oj++NSnf
         Dyv30kkq3ecOzLI9bGGN/EkN/PRv5pLliLZ9KeYooS10yKmBeyOKnrXKYj2xVrg/EWzF
         tBdcnLtfOb8P6yTBhLKXwj2w4hrX7DKM3b/FQ5CE+5l9XwrLBOFgPb+NlNbVhkwFc90q
         7ATD+9pa+TU9X0orvjQNaPg/qCHoAEuA9tWE3nI1FBQ4QSlEj0wpVK7icld6mc4NQQ6A
         IFIrumoaPbxs1/O3uroacaX4+cKDn6M5fCWI83JGfflio8O4agNPXqxyL2P3Y7fbT0bI
         /4QQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhuey/XLyvPae5wHCSYRUiMSyWhbOdXqoJOj2JVUCdhvWLK6wnR55EnUf0nR9Gnc9KlHoKyQWXmw==@vger.kernel.org
X-Gm-Message-State: AFuF++kFicHQHdIUpUgoCcOQesgFkaMfAJB90VH7eRL6iLorLQShniui
	5R8bb/Qv9B6GAoPEQf197dIGdQKVknZVwawx13I8QSTqWsctMneeyAH7
X-Gm-Gg: AYBFou0Fu/0DaVYmem4vsMA/+iqoUtOe9Eaiy1lFPtXeoepmJv3SY0mDCsmOYum/rEZ
	jn9PsrC5PvLgssQTu+K9Ab/F0IgFs8CW4Z4TemaqjhIBMQ2iy9oIGBdW92S4So2YrcMXO4pK2z1
	87Akn3Cuwuk5AHGYt1nZWESmnzg+ORGfFh/aov8QWMkaI3e41+WZ3L6t/UYVas9qv5zWbTUPmGo
	QnviGeWRSNziC62JjkYa4K5yDnWdqun3RxXIGK8ysamx5wKsFMh4LOikSn4hirr2iznHC7vrVXy
	gpK1JaXpxWAIjg1+dQZThF044oN+6g6VogBrCKHv/7e/dLMxD9NAcxU5aS0g3pxlBP4wniwj4Fb
	L8UU3E+EPjc/oKMh+Tv6q2ywuUhHNjGb8Qnnn/S5HbBUKOA1LBUnIhEKxVks3Jte2huanCdPeZn
	m9xMgceG3R/6Uz4JASDNOhJ3CeFaf3AOHUhhK/wuCWxI4613fcRazbH5/bILxwvvVjxbJ3z/9do
	ZlTO0e2fESyWu/I+CDkPXONU6UMk22v2eYvA9fOGg/s1gqMxbsmREl7D2zQP2IhD+inHFoNgqj8
	r4BTD4pHmbZLFqt64Hz6Yz2ykQ/zsw==
X-Received: by 2002:a05:600c:e558:20b0:49f:ce73:5e97 with SMTP id 5b1f17b1804b1-49fce735f5bmr54726715e9.35.1789997991415;
        Mon, 21 Sep 2026 06:39:51 -0700 (PDT)
Received: from 127.0.0.1localhost (82-132-213-26.dab.02.net. [82.132.213.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc585920fsm617171605e9.4.2026.09.21.06.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 06:39:49 -0700 (PDT)
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
Subject: [PATCH v6 09/13] io_uring/rsrc: introduce buf registration structure
Date: Mon, 21 Sep 2026 14:38:53 +0100
Message-ID: <13677c50b853ec0518528ad03ba06012342f1316.1789997898.git.asml.silence@gmail.com>
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

In preparation to following changes, instead of passing an iovec for
buffer registration introduce a new structure. It'll be moved to uapi
later, but for now it's initialised early from a user provided iovec.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/rsrc.c | 47 ++++++++++++++++++++++++++++++++---------------
 1 file changed, 32 insertions(+), 15 deletions(-)

diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 51b46e624ddd..da767b34eb55 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -27,8 +27,13 @@ struct io_rsrc_update {
 	u32				offset;
 };
 
+struct io_uring_regbuf_desc {
+	__u64 uaddr;
+	__u64 size;
+};
+
 static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
-						   struct iovec *iov);
+						   struct io_uring_regbuf_desc *desc);
 
 static int hpage_acct_ref(struct io_ring_ctx *ctx, struct page *hpage,
 			  bool *acct_new)
@@ -81,6 +86,15 @@ static bool hpage_acct_unref(struct io_ring_ctx *ctx, struct page *hpage)
 
 #define IO_CACHED_BVECS_SEGS	32
 
+static void io_iov_to_regbuf_desc(const struct iovec *iov,
+				  struct io_uring_regbuf_desc *desc)
+{
+	*desc = (struct io_uring_regbuf_desc) {
+		.uaddr = (u64)(uintptr_t)iov->iov_base,
+		.size = iov->iov_len,
+	};
+}
+
 int __io_account_mem(struct user_struct *user, unsigned long nr_pages)
 {
 	unsigned long page_limit, cur_pages, new_pages;
@@ -381,6 +395,7 @@ static int __io_sqe_buffers_update(struct io_ring_ctx *ctx,
 		return -EINVAL;
 
 	for (done = 0; done < nr_args; done++) {
+		struct io_uring_regbuf_desc desc;
 		struct io_rsrc_node *node;
 		u64 tag = 0;
 
@@ -394,7 +409,9 @@ static int __io_sqe_buffers_update(struct io_ring_ctx *ctx,
 			err = -EFAULT;
 			break;
 		}
-		node = io_sqe_buffer_register(ctx, iov);
+
+		io_iov_to_regbuf_desc(iov, &desc);
+		node = io_sqe_buffer_register(ctx, &desc);
 		if (IS_ERR(node)) {
 			err = PTR_ERR(node);
 			break;
@@ -853,26 +870,26 @@ bool io_check_coalesce_buffer(struct page **page_array, int nr_pages,
 }
 
 static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
-						   struct iovec *iov)
+						   struct io_uring_regbuf_desc *desc)
 {
+	unsigned long uaddr = (unsigned long)desc->uaddr;
+	size_t size = desc->size;
 	struct io_mapped_ubuf *imu = NULL;
 	struct page **pages = NULL;
 	struct io_rsrc_node *node;
 	unsigned long off;
-	size_t size;
 	int ret, nr_pages, i;
 	struct io_imu_folio_data data;
 	bool coalesced = false;
 
-	if (!iov->iov_base) {
-		if (iov->iov_len)
+	if (!uaddr) {
+		if (size)
 			return ERR_PTR(-EFAULT);
 		/* remove the buffer without installing a new one */
 		return NULL;
 	}
 
-	ret = io_validate_user_buf_range((unsigned long)iov->iov_base,
-					 iov->iov_len);
+	ret = io_validate_user_buf_range(uaddr, size);
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -881,8 +898,7 @@ static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
 		return ERR_PTR(-ENOMEM);
 
 	ret = -ENOMEM;
-	pages = io_pin_pages((unsigned long) iov->iov_base, iov->iov_len,
-				&nr_pages);
+	pages = io_pin_pages(uaddr, size, &nr_pages);
 	if (IS_ERR(pages)) {
 		ret = PTR_ERR(pages);
 		pages = NULL;
@@ -904,10 +920,9 @@ static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
 	if (ret)
 		goto done;
 
-	size = iov->iov_len;
 	/* store original address for later verification */
-	imu->ubuf = (unsigned long) iov->iov_base;
-	imu->len = iov->iov_len;
+	imu->ubuf = uaddr;
+	imu->len = size;
 	imu->folio_shift = PAGE_SHIFT;
 	imu->release = io_release_ubuf;
 	imu->priv = imu;
@@ -917,7 +932,7 @@ static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
 		imu->folio_shift = data.folio_shift;
 	refcount_set(&imu->refs, 1);
 
-	off = (unsigned long)iov->iov_base & ~PAGE_MASK;
+	off = uaddr & ~PAGE_MASK;
 	if (coalesced)
 		off += data.first_folio_page_idx << PAGE_SHIFT;
 
@@ -969,6 +984,7 @@ int io_sqe_buffers_register(struct io_ring_ctx *ctx, void __user *arg,
 		memset(iov, 0, sizeof(*iov));
 
 	for (i = 0; i < nr_args; i++) {
+		struct io_uring_regbuf_desc desc;
 		struct io_rsrc_node *node;
 		u64 tag = 0;
 
@@ -992,7 +1008,8 @@ int io_sqe_buffers_register(struct io_ring_ctx *ctx, void __user *arg,
 			}
 		}
 
-		node = io_sqe_buffer_register(ctx, iov);
+		io_iov_to_regbuf_desc(iov, &desc);
+		node = io_sqe_buffer_register(ctx, &desc);
 		if (IS_ERR(node)) {
 			ret = PTR_ERR(node);
 			break;
-- 
2.54.0

