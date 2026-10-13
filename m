Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA66A552945
	for <io-uring@vger.kernel.org>; Tue, 13 Oct 2026 20:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924945; cv=none; b=fdiyE90kdJ+dqw3Vm8fAJuhLdD0FUaoEYNOJf8fveysbit2oeEkrgjSMZB7JDmt+PkqiYPsXRJpq9c8G+IKxHSx5iZUfevMAjd9DG5AaAlQPCUNEVF4EN46z5QvWbZM9ff391Bs9W7q9aHxxAJKMWjmSmnppPNkYITZiBYlnl9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924945; c=relaxed/simple;
	bh=VfD6HJzx1Y38GpK6rDkYF3jfCC0ZHJ/tqnfgL8fmZrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s0L9MuAeoaJGrtpz+5bAzR2kgdOzyaZYCY6GSkB150McKTFhSmSDB3wDMei2F7MtAIeWOWlSqcCIeZ8u+j8HY9qHlGC8I/c0EBxvLFgNVqdKkptUDV5pp+SZc6dZ8hy2rKy3IsFgXHe/NRhvPcWvvwfgzL77dSu/i2Ti/XEffbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NYF1X9dw; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NYF1X9dw"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48afbd2c386so1987052f8f.3
        for <io-uring@vger.kernel.org>; Tue, 13 Oct 2026 13:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791924937; x=1792529737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XniK4D9I5IxaguHxPaSeNTaZUyaBimf3PNveaq2tpgg=;
        b=NYF1X9dw5MEUnL0I/Vo35Pmqx1XgPO/cKl/aSaUBAn83JUwVJDIaq+bC6tXUWHHa9M
         6dGrcsLhtLzOCIGuV9VCMgSwoxPI/6H9BcPBmQ3vRn9uQ1YjtLsoamxCU7T5CCt9cZLd
         onxPh5HLJxv1zkxdYyw1cLVlcuHGNdfq7BZAvMj9GOHwdBYwfS85yBNtfG5tUID85xXb
         t0nhbaArq+S6CTkLUzi139X1cmKQulUWG+r0PZTXX6R195xjb52iHKHqQCqCSBApHcAH
         eEDVH82VhYSsBHuQGeas8JsPIl6OwtK2gAs27Z6elehdYeeayqnDxMQs7odCZ1kG3UJc
         M1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924937; x=1792529737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XniK4D9I5IxaguHxPaSeNTaZUyaBimf3PNveaq2tpgg=;
        b=t8nXClE+PuHL0frnZX7WnPgsfZJIIanDCy1vhFE8loQIuDCUU4tQGdVXR/xoshIEpY
         eLnZ28VI4PUMxIBviurFPtLrVQ8RiMHB7KGssZIWEneiIpz/fTfQ30YxZsXXAvwczzzE
         M3ps2x1iMyrDUs0CT+Xhh2rmzAsqfr1WLjNjL5c7GHABpxMrHZJo4hvJ/Qg05fzMZwBw
         G6dCR34z4DmcWmgZmmo0fn4FZ8zWGpu7mmuerbm+74Ij8TVtLB0reYKg42Z7a3o9T47P
         n1rXQ/RQoT43XNIjiADnvnYXZJjeoO7J6UX6RmQ88zc+XkHaKeTkrxU+74U0VqHe8yFV
         CE8g==
X-Forwarded-Encrypted: i=1; AKwUvBwrnjs+2sZPkyqyYIOcgsLreGEesUuyrv65CzhWa/l8mx2eqX9ZEgJA37aziGTyMvSNnkKn0cFw6w==@vger.kernel.org
X-Gm-Message-State: AFq9FYKxwl9oJFq5yaRB9L65+DzMAtf16N1a9ReOm3lUuDE+qauLZTaK
	pYn5UdJWReQyU7z68nZVNCSNp5pOJ3C8fwWE2WqjmeuZeds9d+PLRO5j
X-Gm-Gg: AYBFou1lZcFmPQNI7MAiPFnOcbxTCx06GoIJLgMb20T7FhtwMxEU0/NsLaXml8S0NHu
	BFPXy4+DqiD9qBLADs0MAhjBhfVLKg8XPvNpJR5Gen5XEA5Oo/w+XhMKk7mK0QfcVUfPor48W6F
	vpWAbhj2Rnx3laEWjJ/Gdbh1PmqOR94B7q8BWuqbNjBDRiGPu+O7tKJXZKjlY82T0oFu8GI0uOR
	Lk8tGqS10zFI5JRZLJNd+fjxSB+CgJapAS7rfMtzE7bG2ZZiVOjnhRFa2dTkkKZ+rBNmRzYemqL
	sacfJcuUGLL8cUeKhJ/yJx6JMVfv8MIEb4MwJsoBC4wqUSOH2Ypv1fpB7vMWI8VUdNEcbVQjj+Q
	bcv1mW0aJB02/JXSo+R9HVe4IRLEdcdtoDnN3Xr7MN2Jbf+niyVwoOVqC+9fhd4eVNNIegf212N
	LIkHV0j2wnGlxh8uDXOaxUZ5/VSFYagEfLLPFODjRh2gP+GDiDLKWdp1BSn9+IQeR3my7UwPe8Z
	bTKagNEnszkNC/KdKvz3aegr2OfV3kZA5sW7yu1djN8IlUnSdOnqkA7h8OsK2BtKBYRs1/5oKeh
X-Received: by 2002:a05:6000:43c5:20b0:487:27f6:a4df with SMTP id ffacd0b85a97d-48dbad3c1e2mr19287115f8f.47.1791924936713;
        Tue, 13 Oct 2026 13:55:36 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de7273a0esm2380730f8f.29.2026.10.13.13.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:55:35 -0700 (PDT)
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
Subject: [PATCH v10 09/13] io_uring/rsrc: introduce buf registration structure
Date: Tue, 13 Oct 2026 21:54:53 +0100
Message-ID: <52b9853215688e10e760ba4d6b4d9e91d56b6756.1791924581.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1791924581.git.asml.silence@gmail.com>
References: <cover.1791924581.git.asml.silence@gmail.com>
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
 io_uring/rsrc.c | 50 ++++++++++++++++++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 15 deletions(-)

diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 1efaf29514e8..7234dcdb8372 100644
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
@@ -398,6 +412,7 @@ static int __io_sqe_buffers_update(struct io_ring_ctx *ctx,
 		return -EINVAL;
 
 	for (done = 0; done < nr_args; done++) {
+		struct io_uring_regbuf_desc desc;
 		struct io_rsrc_node *node;
 		u64 tag = 0;
 
@@ -411,7 +426,9 @@ static int __io_sqe_buffers_update(struct io_ring_ctx *ctx,
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
@@ -870,26 +887,29 @@ bool io_check_coalesce_buffer(struct page **page_array, int nr_pages,
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
+	if (uaddr != desc->uaddr || size != desc->size)
+		return ERR_PTR(-EOVERFLOW);
+
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
 
@@ -898,8 +918,7 @@ static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
 		return ERR_PTR(-ENOMEM);
 
 	ret = -ENOMEM;
-	pages = io_pin_pages((unsigned long) iov->iov_base, iov->iov_len,
-				&nr_pages);
+	pages = io_pin_pages(uaddr, size, &nr_pages);
 	if (IS_ERR(pages)) {
 		ret = PTR_ERR(pages);
 		pages = NULL;
@@ -921,10 +940,9 @@ static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
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
@@ -934,7 +952,7 @@ static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
 		imu->folio_shift = data.folio_shift;
 	refcount_set(&imu->refs, 1);
 
-	off = (unsigned long)iov->iov_base & ~PAGE_MASK;
+	off = uaddr & ~PAGE_MASK;
 	if (coalesced)
 		off += data.first_folio_page_idx << PAGE_SHIFT;
 
@@ -986,6 +1004,7 @@ int io_sqe_buffers_register(struct io_ring_ctx *ctx, void __user *arg,
 		memset(iov, 0, sizeof(*iov));
 
 	for (i = 0; i < nr_args; i++) {
+		struct io_uring_regbuf_desc desc;
 		struct io_rsrc_node *node;
 		u64 tag = 0;
 
@@ -1009,7 +1028,8 @@ int io_sqe_buffers_register(struct io_ring_ctx *ctx, void __user *arg,
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

