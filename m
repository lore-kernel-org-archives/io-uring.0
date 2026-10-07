Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E9536DA00
	for <io-uring@vger.kernel.org>; Wed,  7 Oct 2026 01:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791336751; cv=none; b=n6dQgjKO92/VMuCHnPacYairPm+Zvt+zkBrk8tOM8eDSi/IeMKVOjr4lhHFT5V6Nm1EABZ+mOUP4vtJ9casQujiFJvvSsLRWt8sHVbxLdCCcL4xg63sdkJrFV6DMJ1in9UlT5SWpSa+RuTdgpvvDN7wxKHZt60MHVQqpRMPNvII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791336751; c=relaxed/simple;
	bh=3Fg4fgarhp43AXGD3uCEPBH0DKGK1BrLFUwZDank6PA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=leGancTHTiqPyeeFzKT7t5BcPjujJsYs7ZrmgpshKoudqUO6xU60QwgMYt1P5xXCLptI9wcUsKaQriPSFPm8hq4GZ3CrHKZZYTP5EUAUMlXd/NQqB/+8rskv2DlQn22tncOTSmOYlvwyEztWoe4jyqwx/QHZfwzwPBaQhZWClCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nuOYol1a; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nuOYol1a"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so21778105e9.3
        for <io-uring@vger.kernel.org>; Tue, 06 Oct 2026 18:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791336747; x=1791941547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TBD7LAGhjErBgJ6Wm5F1SHztZSPVsK9gsGPfOw+QBug=;
        b=nuOYol1aC6X8L/xigo/TBkZDTweaj4oqejJyR/Qx/mJxv2rajTwLgewhJ8QRwPMOvY
         LK+93HZuFgPBm7G7i58N6z6go5KK9oWI5e7hrswLHZ+1pMrb8pOeaL8uZKkRAeHR8o3T
         BPgWgY2N06phNMqkM4dcj+V53AnDQ7E+uJFbarB0YKtuKHMY1Vx0Wy8wm2Y0dpVInP9t
         3KZ+Ggh/10orKHRfsDF7mGVWcumhhLp47tfFQnok9CbcaYA2axdT8/BC1hCNYtPBuD3u
         oSg2qSWDmbn+wXrtBUYdYAcmBG3sNnbnc0RVAO401peNf3n7IoyMIvlpf78DRMl/B6rA
         CqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791336747; x=1791941547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TBD7LAGhjErBgJ6Wm5F1SHztZSPVsK9gsGPfOw+QBug=;
        b=hKrMpFRIJ4jAue0sdK5dhEMLNMsjGm7z7IPYYtOLGZSFdURj1btOSxDFw4x7XWs0YE
         suu81WCRNHgO2z9RqpYhHZ4YOQY2sP9VkWGcBSlBSAWArYVLCW9C1mlpGVB/hWBnwS9T
         Cujm5ASlQUp7sALa4eE42PdA4WG2aJv3g9QzOx1rhRuY0IU7ugH18BXqFeiWxE5glZee
         OSd22Oga8ttGyidjU6aCXYDkkG7cKLm3DGq9hslslPGb+MTanm1kwYxKYwTvY2q6UmV/
         jzgNTn8bo3QUosDwlIUhf9OD3ebfaQXg6n2Dvd9PE3DCgHJNSbcHJ7OyQIYWh6GKcCjk
         q6aw==
X-Forwarded-Encrypted: i=1; AKwUvBzobnxeQTLmNTtpXjMnRMAOzIWHNdvCQ8NKPKXXHQzumIAg4lKTHVOrbPQAk4ZT1cRdums4X6/fDQ==@vger.kernel.org
X-Gm-Message-State: AFuF++ksBBRcwwKDZ8fSLz/NFQu86Ri19lojg53qwWeTYjtnX7zGm1Fa
	eighF4UoNyotTcSQkffR7ptPrbcfNXNJM+eWyy8vtdiKlNhVq/rpWA4S
X-Gm-Gg: AYBFou0w1s1NP+TUhwcMHhm45RRNKYWzDrdiWdTel4PTMYHBo8k/ESeEpzF3sNkG9K6
	YAY+GwHTo5MbgBFn9fendzGhSfonSIyHsgvyWlUNo8GKqZPPjzZQB8MP05Och7BIZKzA9FQItK/
	J3gXiAESytVYJt78jG41KwZ2zXw+N9+mM/jSIiYBTkXrbMaj6kSHZuhcAEcBx20plgQFpjTeAlW
	VORNeHDP6GCoU9xmsD/sHUKefJ8Nt9Nkzcvh0udNdMvyyjfTTz1ciCiMusYtWnMsXDHdJryas1J
	T9ybl4j34yfYRk3/n93Zsu4twkw/G9Xslxr3aWfs4lbIINcRpMEkr/C5QQ/0AlD8dIpIXjjyPEX
	HTQKo6V8TOrgkyQsgNoD5HqhHrkwRwT17SDLvbf6//o2i/5jDFtnPRnWooq8aaAbbFnj3veYbvX
	zz43NIOWVi9y6ynFKjAMrI/61z3ngLIa+kTxWbXD6CNEqrbZuWWTZtCW7slW4rTRXIZ/r1uzJ8l
	ggBHXLwGNVnk/IQ/I1SDE/qgRAwXOJkAOhIzLVzVLjOZbM9c1EdXY4AHr22qdM/RBJGw+4nJTh+
	7Q==
X-Received: by 2002:a05:600c:609a:b0:4a0:c4:a1e0 with SMTP id 5b1f17b1804b1-4a18031122fmr6686705e9.9.1791336747330;
        Tue, 06 Oct 2026 18:32:27 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f6538b7sm21183615e9.13.2026.10.06.18.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 18:32:26 -0700 (PDT)
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
Subject: [PATCH v8 09/13] io_uring/rsrc: introduce buf registration structure
Date: Wed,  7 Oct 2026 02:31:52 +0100
Message-ID: <766ededb7a1e3b4152408fa17dbf92f5c4a34c90.1791336002.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1791336002.git.asml.silence@gmail.com>
References: <cover.1791336002.git.asml.silence@gmail.com>
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
index 1efaf29514e8..7e58e9d96055 100644
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
@@ -870,26 +887,26 @@ bool io_check_coalesce_buffer(struct page **page_array, int nr_pages,
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
 
@@ -898,8 +915,7 @@ static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
 		return ERR_PTR(-ENOMEM);
 
 	ret = -ENOMEM;
-	pages = io_pin_pages((unsigned long) iov->iov_base, iov->iov_len,
-				&nr_pages);
+	pages = io_pin_pages(uaddr, size, &nr_pages);
 	if (IS_ERR(pages)) {
 		ret = PTR_ERR(pages);
 		pages = NULL;
@@ -921,10 +937,9 @@ static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
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
@@ -934,7 +949,7 @@ static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
 		imu->folio_shift = data.folio_shift;
 	refcount_set(&imu->refs, 1);
 
-	off = (unsigned long)iov->iov_base & ~PAGE_MASK;
+	off = uaddr & ~PAGE_MASK;
 	if (coalesced)
 		off += data.first_folio_page_idx << PAGE_SHIFT;
 
@@ -986,6 +1001,7 @@ int io_sqe_buffers_register(struct io_ring_ctx *ctx, void __user *arg,
 		memset(iov, 0, sizeof(*iov));
 
 	for (i = 0; i < nr_args; i++) {
+		struct io_uring_regbuf_desc desc;
 		struct io_rsrc_node *node;
 		u64 tag = 0;
 
@@ -1009,7 +1025,8 @@ int io_sqe_buffers_register(struct io_ring_ctx *ctx, void __user *arg,
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

