Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793751565;
	b=NhXcE2VTxQePdgagH+pa5qgY3WdObvkl2EYfyO9Xrhi4cKPlyE5+EgUkz0QAf1IFNXfe
	 uJvaLxjeEaLLDcV7FJS96yhzMJukBV9fkWHJ4Quehfr3c/YTCagNvjs60EJgOA4dN3kL6
	 fk5hWO8IX5aDgG12+f9R21z3djLw/VPZh7zvyb3PPAFuwyN7NZArk0wR+G5BNWmuTyvjK
	 A9elxm0eVbCHJ85XXRF5g07K+AXH2jTBhrhZWU9lT12lx6Ofok/Gsp9ESIpo7rzi7hNh5
	 PrR5G3kAktNB8U8QVfkM2NivF9pj/x00cPG8I50QwlB1xAR+xkKoEn4HAJLrXSN7Kdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793751565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XVYAkQiJxcRVRCy/m307F8zyGYSwmQhGdJmr4iFyUcg=;
	b=T89DfI6EA6YvpVVapAZGztquhBN0lvO/GcuvmmaK0swEesCqQJdyTeBWzlHb3hvcoGhJ
	 eD4IiTu76RMewPA+aMdrHCKaUpSm7sqKEZh5jSEQ54ALNllB2YFyhyMSZ4ywIIcFMYVLB
	 b5/roSa1qZ4CzuWQ/9ZNcuUUVH+ZXavrEBRGYNSV+SjOBRiP549m7Q61xv6jTQz9DArAH
	 y8D3qWzpAXxfQ7RgGaULjW8t+IP/UlaxIoYd+P0FphBiVCyUNVnX8CIedezky3N6FEcxH
	 iAJriIuK4xdltE/lj4sqC8/yxnWOsHTODhzduO6JpZSx1Il8CmWuNSeps7ukfTPBD9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ubHDxxZj;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A16606A328
	for <io-uring@vger.kernel.org>; Wed,  4 Nov 2026 00:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9A16606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ubHDxxZj
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso106093f8f.2
        for <io-uring@vger.kernel.org>; Tue, 03 Nov 2026 16:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793751563; x=1794356363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XVYAkQiJxcRVRCy/m307F8zyGYSwmQhGdJmr4iFyUcg=;
        b=ubHDxxZj7rU5XinezEEZWcKP0nRzW3AwNFt5hy58vHf3T1o4Qx1PHGZgNPVDniG8gJ
         cYrsILGN1FBWy75lXmZUSYF3+AN1Svm3edvlRj2Sxu5EvSyHtoggU6vLH51eJDpSrK5T
         10IoJBC2S484EOwmf/KQCB6+54VFFbrgZ/QOXvI6pNj6dVEo+8UhDLxVI0YHlToXNxFO
         5cHnvS/z+1Nc7tzErbZvOKmbxwNteSUlofkVUMWJClgZQsUpoO59CNT/sTHvpf33zI6e
         ysaZEPYfcdyEJZ5k1dWEusf3nj78SP6JNirFZ7APQYBR6SUmK9u9klK1nv8jERrTOeux
         A3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793751563; x=1794356363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XVYAkQiJxcRVRCy/m307F8zyGYSwmQhGdJmr4iFyUcg=;
        b=qXjYDkwAa7KgJLjVXtjjqGsA2eJMJ99tIre/taayCV7DrVnoFqrzMWMgiwGEII20/O
         4Q2eNLvCo5Og6K2PHixYtDMMmyfViwUcoBMfco7BfZdqWhkqSd1+R3xcqjcP9FG/7jYH
         IK1YEF668xzmHvlxQRxqWBDolIpqWdkmSw5vKevAY542OJFdzbmBB05DGa1mebocE2hJ
         YOFSNKAdKZ2iJLxDQdzHsCSu9+1rLbf5fNQi8J03M65/t7+HJ/LQa5BccZ6ngsFxY3oy
         uGNoKzeRjeUTJhAJ9wW1IGkqoNZbHLJCW2Pw4rHguDzvyM/01TvkRopEDa19kH1/DS41
         D2Xw==
X-Forwarded-Encrypted: i=1; AKwUvBwAD3IF9K3qk6vSaFapj7P9oBmgEO9hFhUMbb3XbJjZpQPEUy9o9cYFD50UtuXXlA3hZ1ICkXRtEw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Smu0FmuB58ulLSDfUABuW7gx0b4o0dzeIpw7duR5CZIdqitR2
	A290TY21FQwKTAWXKrRd9OMX0bcBDDxjshJ+sA9tzPj6+SX3YK7xyWR/
X-Gm-Gg: AYBFou1onC6YPjZyA1+CHM4C7Ne+ZdpCmRvLbDNTMVppIFA8G/nE5Q76/MZhUp8VSj7
	ikxenoQVj4SiRaMQwlvAScd8GGmcb4mP1IWt+/6MGJw+1FPZp1BreM8cDo/76VWjmsdS5rYsWdQ
	R8IO8kgRZ7a4zjn2/mpWZmt7pH+LyX9nkmUrD6uxYzUKL3pikbLTjK3lEy4gwMwU7XTgO3nnEBH
	r3N9ziO4Larjte8+sAhkG2zNMbJcDj6YlkdbcvO3B2una+JghVjNxXtPrKkN7YAbCfVF2mOQdnM
	mqPu1CqkJS3iqFgwuJWNfLpA3t1Baf2H5AAS8kG6153Zsy+zupPVUOMT9CRfbCeIT/h3UVFYX7f
	ig+D6wiTehg0oeoY6E/MerXVzvJi4u2tSjg+9IxzO0xKjjRZvvEYdXpiORZyCb5eOeix3uZZiCW
	HM32i9orVH30huHGgqDJgpQ1RNeop97OIOYUE7kqJujN1uBfWqeun/6YFs9CQiV6REndc/mxuou
	GHi0WUUo5HVSVPl+16kJDI+zUto6J2s8aZFHfAItZpUWhV16xPGdwQ+DhR+a7L8OIpxWCxAi0rS
	OJ7ptBqkj8TKEukZTMSSijLBKIFzGozvbcReu+Y9Dud1MTtn5YLeFFWRpRSlKdmPPjqY7eqyU5H
	qP0H2fG4sUG9+KhkPdIW5uSpOsq4bMLs=
X-Received: by 2002:a5d:59c4:0:b0:48e:3085:425f with SMTP id ffacd0b85a97d-48e6e2dbbdamr34641010f8f.2.1793751563267;
        Tue, 03 Nov 2026 16:19:23 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda1fb0esm676676f8f.49.2026.11.03.16.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:19:21 -0800 (PST)
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
Subject: [PATCH 3/5] io_uring: add data to dma-buf convertion helpers
Date: Wed,  4 Nov 2026 00:18:59 +0000
Message-ID: <e9e74cb1d6e46f62e29b0934fa9c1e7f2d2c1e3b.1793751001.git.asml.silence@gmail.com>
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

struct io_buf_dma is stored as void * in registered buffers, and it's
casted in multiple places. It's inconvenient as void* casts can't be
type checked, so wrap all of them into helpers and keep casting
centralised. No functional changes.

Fixes: 62e4bf5b25d44 ("io_uring/rsrc: add dmabuf backed registered buffers")
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/dma-buf.c |  2 +-
 io_uring/dma-buf.h | 14 ++++++++++++--
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/io_uring/dma-buf.c b/io_uring/dma-buf.c
index 132e3d0d7023..6f1d21c0f558 100644
--- a/io_uring/dma-buf.c
+++ b/io_uring/dma-buf.c
@@ -2,7 +2,7 @@
 
 static inline void io_release_dmabuf(void *priv)
 {
-	struct io_buf_dma *bd = priv;
+	struct io_buf_dma *bd = io_priv_to_dmabuf(priv);
 
 	fput(bd->target_file);
 	dma_buf_io_ctx_release(bd->ctx);
diff --git a/io_uring/dma-buf.h b/io_uring/dma-buf.h
index 534c06b6879f..a97412ebbb3f 100644
--- a/io_uring/dma-buf.h
+++ b/io_uring/dma-buf.h
@@ -12,6 +12,16 @@ struct io_buf_dma {
 	struct file			*target_file;
 };
 
+static inline struct io_buf_dma *io_priv_to_dmabuf(void *data)
+{
+	return data;
+}
+
+static inline struct io_buf_dma *io_buf_to_dmabuf(struct io_mapped_ubuf *imu)
+{
+	return io_priv_to_dmabuf(imu->priv);
+}
+
 int __io_register_dmabuf(struct io_ring_ctx *ctx,
 			struct io_uring_regbuf_desc *desc,
 			struct io_mapped_ubuf *imu);
@@ -39,7 +49,7 @@ static inline int io_attach_dmabuf_map(struct io_kiocb *req,
 	if (!IS_ENABLED(CONFIG_DMA_SHARED_BUFFER))
 		return -EOPNOTSUPP;
 
-	bd = req->buf_node->buf->priv;
+	bd = io_buf_to_dmabuf(req->buf_node->buf);
 	map = dma_buf_io_get_map(bd->ctx, nowait);
 	if (unlikely(IS_ERR(map)))
 		return PTR_ERR(map);
@@ -53,7 +63,7 @@ static inline int io_import_dmabuf_map(struct io_kiocb *req,
 				struct io_mapped_ubuf *imu,
 				size_t len, size_t offset)
 {
-	struct io_buf_dma *bd = imu->priv;
+	struct io_buf_dma *bd = io_buf_to_dmabuf(imu);
 
 	if (!IS_ENABLED(CONFIG_DMA_SHARED_BUFFER))
 		return -EOPNOTSUPP;
-- 
2.54.0

