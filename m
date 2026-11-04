Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793751571;
	b=0w6rdeBgZBVcN0eyn1rNvdRmVEgFxluZ9TxCERy1Y7gnrFLe8sNgkz7HFr+2glntTlmy
	 FFUq3rGpdCmdKhOBpTgmndw0f+SMWGzgVVLtA2m6P3EyXPAfSjUScaqCiwCrBj6bn0Sq4
	 MTguFO95NaJrpXSIBL8POBOtO5KmJDNXeD3vwvfg4i6JPS4mWGhpsKeUpqD5J9QK5kkAj
	 RLIpysmIvkxBq0hiVMaIoyt2jSwhbkWx7Z7/lcrHOnNdqmMM0M8FlsGhwHeatGtrFTY4n
	 3crC23eN/M9VqwvGRH7lHVG9VveKDVIqRkeJxhLHrNfu2tYhkkKsolFLvEQLq2EwZvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793751571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dhpcS3Pos6bUyhlWGcG9OokPKtscuwoJw0ESCtzmpvM=;
	b=gK94MmYl6Nam97sAk1eCtix79i6xG9w9ErORHUPx/82iTjvYTNekC/5pZjRWOxdCXb16
	 Ln6DK3hLvbA+T2hPAaBgPD6PGrlhsQUTHbf0mz3Pt9SdFBDC0OuPZNB/sY9IzwY8Sjzk2
	 87wJxRo1HrS9zN4OrYMIXGv9TwKm+3JBo9r0Ud7RWSKZemmklfRgDcuDTgWkxGLa8KaEy
	 EYCoznrtU3F2YJJwE6A9BHxnghSWjxpETRuYD0k9AjI2W9WpnNXMbqcKA9fNuSwMga6v2
	 YkNrsuMVhuR/hCoQ2aygd0+pKieRcAUds2jF1hhFGghi6uHbHWiEjat8JRlJYkCM/4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q6Nzpwyg;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D431606A32D
	for <io-uring@vger.kernel.org>; Wed,  4 Nov 2026 00:19:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D431606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q6Nzpwyg
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b042c0759so60681f8f.2
        for <io-uring@vger.kernel.org>; Tue, 03 Nov 2026 16:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793751569; x=1794356369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dhpcS3Pos6bUyhlWGcG9OokPKtscuwoJw0ESCtzmpvM=;
        b=Q6NzpwygdE433wwbbo5N2lVV1nDLaE4ey6+emdzBu6O3wovWkCqFPmJ6dfDoAoJF/b
         5LyNOdE3QbbljfJQEI06XAAOfwb9rAsSh+UgxMGAtbC0M9YgIXbr3Hslq8ckS55H80U2
         +jccSBX1o4TC3CnzkFJHJJx5YHTfhoH2w8fGybU0UFBUV2V/biDRg/PcJP/Ex+N5yQ0f
         BS6vR9AA2nDBgqP7bgurufhFz4WV1aN3N8dy2DlkeWHBaZcvSmJEBgsqzw+8a87fBuzG
         /042ZlJ5EJfTxVOtwxpazkhc13m2TajmP1OFtXEPbxdPyKQqijJISNCb1gvu1eiB8hRN
         4sMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793751569; x=1794356369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dhpcS3Pos6bUyhlWGcG9OokPKtscuwoJw0ESCtzmpvM=;
        b=afyeigeyDtDRLPXG0oeIw88rHFzLuSVS68CfvPtBO9Xq3CixfFOAuvrDk01JmgMKDB
         6ZXRRKwrVS9hcjxLB+RwWCmKKbctmpaWr1Ir2i0pVe1CF/R7ObnFo+BYVqsQjQTKizkd
         njDWL11cRoi5O93ojBE/S3fXteI17Fp7kr48nP1RkeCmcBkjA7et1uNaFuI+95fqTfLK
         5wpSQUfDf/iNOVSFDwqpZek68zbUW1vk+3CIau5GIB2xrpyqzPPVuqAVZzwZ9KYYvBhd
         Ra91Kb4+LAVcwzO99Yt/ROKtCLhU5DHhqi98fkfyxU1w7sZth/NtkU2vJFZ6aHog74wc
         vKOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxANvBkEPnRxOZE1MXxHAAm0d2vzgNbKUaoPtaNsrHHwdLYr19ILA0SGB6n2zvhrRp6wVpLhDrQog==@vger.kernel.org
X-Gm-Message-State: APuU4Z8VBiq7HpSvQm95pR+n4Qgu7TAgs8CHS8yy5n6BbCavEPVHI+BI
	jwvQT5e73b1TK+89Orc6YqMfxr9pKRYu0cq4hN/37iCb8lYwRaLRF6vY
X-Gm-Gg: AYBFou0GJUQfUzU+K1PpbIeZbFHUgL18QlGwN1zwA32TYpOBMM346gNbnxit6FMK8M7
	iKVOeLZmbHgNCj9ITsVravjNtM6UwolOdLXTFc9odgEdX6TMXbYNJjWuKrqdbBvlIT3kDTbwNaz
	aLQ1UwyfyWz5LiWFjGsB2e/rBscssoIB+y/Yc43IfDBrzAjECyRa65gmEB0UCgEWwLIdwzkVMfB
	5rBheAt2Gm2a7rlOU7eYJOqEk+bi1FDBmgbiKKhk0aHQab0laZvaGIsOCQ54MQSmXsJwOl+xvy2
	EDdIQZGUGCgH7lF2+OHJZw6U22ApdpJIAoH/EEmnNMUbsyBojyspxr/r6HEkzZ5iyyWGs+J+Jtv
	6b+7PWy3lJ6Zqz7l8iYOTn90uPc7l4dfZ6L1aiQJDeONC2hBoRcIP5hRAtVCIJAm6R8Jt2vFDHg
	EvMVtBJLFnwo2cXi/h7jTBaZJAssf7YtyQ8Hj7ajXKg7s4qpRhJCa/7abl9Zns+zfwDYbXlp4K3
	z/4wC5yFMsKbGSaXMnhx7trpmMoxvPFNjYKmtErLUyWvNU3vX9uAmZi/ebPYVT18snBtqaKZiEJ
	wYi7TJNZ3Mokn7xovbf0NhoKFgwpSb/jcdXku94T/Dq+R5T121sM3H0Kj58FrvwDvZ60zFlSYjS
	0t7Ti0v6lDOy4SufbKhB2Ai6kF/tQGsc0
X-Received: by 2002:a05:6000:616:b0:48f:bdb6:ca0 with SMTP id ffacd0b85a97d-48fbdb60d3dmr3036265f8f.23.1793751569507;
        Tue, 03 Nov 2026 16:19:29 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda1fb0esm676676f8f.49.2026.11.03.16.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:19:27 -0800 (PST)
From: Pavel Begunkov <asml.silence@gmail.com>
To: linux-block@vger.kernel.org,
	io-uring@vger.kernel.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Pavel Begunkov <asml.silence@gmail.com>,
	Jens Axboe <axboe@kernel.dk>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	Nitesh Shetty <nj.shetty@samsung.com>,
	Kanchan Joshi <joshi.k@samsung.com>,
	Anuj Gupta <anuj20.g@samsung.com>
Subject: [PATCH 5/5] io_uring/dma-buf: get rid of struct io_buf_dma
Date: Wed,  4 Nov 2026 00:19:01 +0000
Message-ID: <883cf9fcd8e46569ec237e9e36baf6e2f26db8de.1793751001.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1793751001.git.asml.silence@gmail.com>
References: <cover.1793751001.git.asml.silence@gmail.com>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now struct io_buf_dma only stores dma_buf_io_ctx, and we can use the
latter directly.

Fixes: 62e4bf5b25d44 ("io_uring/rsrc: add dmabuf backed registered buffers")
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/dma-buf.c | 16 ++++------------
 io_uring/dma-buf.h | 16 ++++++----------
 2 files changed, 10 insertions(+), 22 deletions(-)

diff --git a/io_uring/dma-buf.c b/io_uring/dma-buf.c
index f25749f7da22..a1fc34c0c044 100644
--- a/io_uring/dma-buf.c
+++ b/io_uring/dma-buf.c
@@ -2,17 +2,14 @@
 
 static inline void io_release_dmabuf(void *priv)
 {
-	struct io_buf_dma *bd = io_priv_to_dmabuf(priv);
-
-	dma_buf_io_ctx_release(bd->ctx);
-	kfree(bd);
+	dma_buf_io_ctx_release(io_priv_to_dmabuf(priv));
 }
 
 int __io_register_dmabuf(struct io_ring_ctx *ctx,
 			struct io_uring_regbuf_desc *desc,
 			struct io_mapped_ubuf *imu)
 {
-	struct io_buf_dma *bd = NULL;
+	struct dma_buf_io_ctx *dmabuf_ctx;
 	struct file *target_file = NULL;
 	struct dma_buf *dmabuf = NULL;
 	int ret;
@@ -27,10 +24,6 @@ int __io_register_dmabuf(struct io_ring_ctx *ctx,
 	if (desc->uaddr || desc->size)
 		return -EINVAL;
 
-	bd = kzalloc(sizeof(*bd), GFP_KERNEL);
-	if (!bd)
-		return -ENOMEM;
-
 	target_file = fget(desc->target_fd);
 	if (!target_file) {
 		ret = -EBADF;
@@ -47,20 +40,19 @@ int __io_register_dmabuf(struct io_ring_ctx *ctx,
 		goto err;
 
 	ret = dma_buf_io_ctx_create(target_file, dmabuf, DMA_BIDIRECTIONAL,
-				    &bd->ctx);
+				    &dmabuf_ctx);
 	if (ret)
 		goto err;
 
 	imu->len = dmabuf->size;
 	imu->release = io_release_dmabuf;
-	imu->priv = bd;
+	imu->priv = dmabuf_ctx;
 	imu->flags = IO_REGBUF_F_DMABUF;
 	imu->dir = IO_BUF_DEST | IO_BUF_SOURCE;
 	dma_buf_put(dmabuf);
 	fput(target_file);
 	return 0;
 err:
-	kfree(bd);
 	if (target_file)
 		fput(target_file);
 	if (dmabuf)
diff --git a/io_uring/dma-buf.h b/io_uring/dma-buf.h
index 9bd7c8c64397..c622347fbd76 100644
--- a/io_uring/dma-buf.h
+++ b/io_uring/dma-buf.h
@@ -7,16 +7,12 @@
 
 #include "rsrc.h"
 
-struct io_buf_dma {
-	struct dma_buf_io_ctx		*ctx;
-};
-
-static inline struct io_buf_dma *io_priv_to_dmabuf(void *data)
+static inline struct dma_buf_io_ctx *io_priv_to_dmabuf(void *data)
 {
 	return data;
 }
 
-static inline struct io_buf_dma *io_buf_to_dmabuf(struct io_mapped_ubuf *imu)
+static inline struct dma_buf_io_ctx *io_buf_to_dmabuf(struct io_mapped_ubuf *imu)
 {
 	return io_priv_to_dmabuf(imu->priv);
 }
@@ -40,16 +36,16 @@ static inline int io_attach_dmabuf_map(struct io_kiocb *req,
 					unsigned issue_flags)
 {
 	bool nowait = issue_flags & IO_URING_F_NONBLOCK;
+	struct io_mapped_ubuf *imu;
 	struct dma_buf_io_map *map;
-	struct io_buf_dma *bd;
 
 	if (!(req->flags & REQ_F_DMABUF))
 		return 0;
 	if (!IS_ENABLED(CONFIG_DMA_SHARED_BUFFER))
 		return -EOPNOTSUPP;
 
-	bd = io_buf_to_dmabuf(req->buf_node->buf);
-	map = dma_buf_io_get_map(bd->ctx, nowait);
+	imu = req->buf_node->buf;
+	map = dma_buf_io_get_map(io_buf_to_dmabuf(imu), nowait);
 	if (unlikely(IS_ERR(map)))
 		return PTR_ERR(map);
 	req->dmabuf_map = map;
@@ -64,7 +60,7 @@ static inline int io_import_dmabuf_map(struct io_kiocb *req,
 {
 	if (!IS_ENABLED(CONFIG_DMA_SHARED_BUFFER))
 		return -EOPNOTSUPP;
-	if (unlikely(!dma_buf_io_file_compatible(io_buf_to_dmabuf(imu)->ctx,
+	if (unlikely(!dma_buf_io_file_compatible(io_buf_to_dmabuf(imu),
 						 req->file)))
 		return -EBADF;
 	req->flags |= REQ_F_DMABUF;
-- 
2.54.0

