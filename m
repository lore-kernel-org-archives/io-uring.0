Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793751568;
	b=Pb7rM3NmbjJzAuC3W3saAPlvy23QkGuZYpnhaSWmjMhumkbcliOkL7OEYddtHL7ZbZvX
	 sZFfgMV4+YDBxvONp4s0Bp6ptHrDGoibyvskk/kXP1+O++3j5Mu3/J6KxJYRo4L7Lw6OX
	 Yb+JCpm20zyALgiq3HFsmVnmmQ5zcp37fIiEp2bIEcDXZzHLYxfNS4Wcsdgc1vYOsbX4l
	 UyhXBjkepYbys7nc/dgCP9UuaLcQMo2kqU1M81/HBLavbnN0nnH5EcE7L+EeDvD2ch4/t
	 T0oFnCEhOJzysW4/zzly9sihoIG/JW6Azs78Gh3qangW7JxGXMYq7oimegjOrJNNeJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793751568;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GGAHJoXoaHYDS7ZVcS4Ysy1Ws2W94TVdrbuzvKnZ5Q4=;
	b=1CgWm4C6TqzvKrLbe/cvobpbiAj4g6jVV8kQ4khcFrxIFj+LJC2Ant1UPQ4+UYzc+nAI
	 29kgw4vRWFUGtqQYNYhtDrN0s1xyY+6og7q49LDU/ZuQAAsZp+X42yf5UjDi+7SjfxPTh
	 4JRijOc5PwRcP4J2O+v49Z3pabUmFRVMBtzBOCs/NtSYLYXrcCPa2kKiveB1jntRjxG8F
	 f4+I6z3u24TciM1KDeQmnoPH6q6tTcHlrbGEHPejgfdHyxkXS3TF/DsPosYkdrtmiTUHj
	 ckbbRMbgfbZM4OvFntfwo/4jI3xHuwAMlMGzp3Wz9z8qIjJGcXK3LfKgkd1EjL8KpVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="aqcmbjj/";
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A87606A31B
	for <io-uring@vger.kernel.org>; Wed,  4 Nov 2026 00:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9A87606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aqcmbjj/
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c5358fc28so124646f8f.0
        for <io-uring@vger.kernel.org>; Tue, 03 Nov 2026 16:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793751566; x=1794356366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GGAHJoXoaHYDS7ZVcS4Ysy1Ws2W94TVdrbuzvKnZ5Q4=;
        b=aqcmbjj/IWzOkhPn945GltKgVAuWp1ceWZ4PcwlLjSUgP3pgLCeRJUSh0ZCERqiyBX
         BRUEwzA5Z8xgKIav5x8qMnG0g6orgm0+fafeQJR5uALlpITJemgYZ0F1WH87wHcFvnBU
         iOXxLrnLQwkdRO6nlEteWgXYV4Cv8LIP1HVaxL/mqH5vQt8+NxjuAL3gDJaGtaeRBNWb
         e8y0Zv3LmzgJgaHpG2wmrWPuYxkySs/xPswkQ12biHoWXbmGl6Os11AgxGOZb6W563OH
         dl/j7z99E03O0iXUVwWY/60ifcs1WdhHNDnyeOd7gotcaX3uexLytaLZamiZsZMwyWoK
         20SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793751566; x=1794356366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GGAHJoXoaHYDS7ZVcS4Ysy1Ws2W94TVdrbuzvKnZ5Q4=;
        b=CEoPcVpFdE7s3IUNpl+a8xVdgA6TzwTraGPZ9dnktlfsTsoAofT0R26NPwNwiZw8IL
         noNWfi6iZ78NBFxs5qm8eM3dS28dGhu6mHKjV7KE7R7n2FB831+rIUedKnEwQpuW3MDN
         4pjxjC2nIDmVtSThvszibbONgyO/Kz4Tod8DsmsRHKZbgHN3Jtjs5NaeJNO02Be1iy74
         1n3wBX7dzdItUxKfK3z1hHihmPdbyp1rTB9/Mhs4sBiEkQliGP7DelUV2rYebqjJ1mbO
         rvvLvhPzDYwPkMCz5Q6NkRQGpbf7kYFO/wbHFfaMyMle7BpVdaefOO0v67iTvNf8f+YO
         MrjQ==
X-Forwarded-Encrypted: i=1; AKwUvByz353kgpSQJhtmQgLyQEUtAY9xAfamRvsNXcPAMLGZGjzoIYgKx2ZZ2qEtFP2JkfQ7cH4d5XK9rg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9oWpJSakSyOEdRG0QfpiTAwEUlCuT+9vkX5OLHioA1uSzykD0H
	gR4AmNUqvlqh1vkcgv/n1FcZvQBLfQ/1ohUIjVL5cbXYkrS92rwAATHk
X-Gm-Gg: AYBFou14v2d7/SquXyI+0q3bnFVRjC1QvMLE+HaqZPPtDAIuHDKfHwuU9s0MIn3vCVx
	IaaZHONASsRdEO1H53C2u4KVSus0ndeBi/OxH3UJjUKr93erVL870lq3tMH26RiPIbTKuPmCC1l
	RHYEQ0sGq+igpZ57YsNmEBh1nO08wphK4O6PlRj6LF/adm9vQgMbF9Y1MYWtrqgXfRv5AH9qdMr
	KyQHPihCPX37GfzxJ0AUI+eGSxk4Lc9qKvXtpPYPiHwNWYbwo75IGx8nlxKpmwxxknn9B3GccLi
	D6AaYhD+m6vXnNXKZMkjBURTblR5gwr8Y+kQGrv7qlaY8vJy3hWOL8VIntSMJx0s+Tn5pxdj+9O
	GbR39V4FvaTK7+Up0xzDWlEjzPPV/Aqh9t92G+oKS1uemowGYEeYSeUwVJQG+rxDtbcVypcT1SC
	+ESs1dsjxtSIj6NOg2RkRaNgWpOC0Q6JYSUOy9xkND+GcYj4Vv69Z7+ENBqGlP7kOo3zr7oP2+D
	+xCd2OwLy2Z0bRyYJLZmag8IhWVpcn26zkqZpWE9Tf5FjxhLYUoVCBYSX2EyvZTj58cphzkMfis
	XuYNYioVHIKZmPHXBiwOC2TzH/PSA0wH5VMyUCqo0mPx3gPPpj8nBvZVxZSD1XKa/7G1716I75x
	uuTVpLea/X2370tjD36Fkkkr+Yi7gp+o=
X-Received: by 2002:a05:6000:4a13:b0:48b:9d2:1a6a with SMTP id ffacd0b85a97d-48e6e2b9ce9mr32274342f8f.1.1793751566267;
        Tue, 03 Nov 2026 16:19:26 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda1fb0esm676676f8f.49.2026.11.03.16.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:19:24 -0800 (PST)
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
Subject: [PATCH 4/5] io_uring/dma-buf: switch to tag file filtering
Date: Wed,  4 Nov 2026 00:19:00 +0000
Message-ID: <7165ab453cc680276b88f47f9ae89bc4967543cd.1793751001.git.asml.silence@gmail.com>
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

Instead of enforcing that a dma-buf-io ctx is used only with the
registered file, allow sharing using tags.

Fixes: 62e4bf5b25d44 ("io_uring/rsrc: add dmabuf backed registered buffers")
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/dma-buf.c | 3 +--
 io_uring/dma-buf.h | 6 ++----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/io_uring/dma-buf.c b/io_uring/dma-buf.c
index 6f1d21c0f558..f25749f7da22 100644
--- a/io_uring/dma-buf.c
+++ b/io_uring/dma-buf.c
@@ -4,7 +4,6 @@ static inline void io_release_dmabuf(void *priv)
 {
 	struct io_buf_dma *bd = io_priv_to_dmabuf(priv);
 
-	fput(bd->target_file);
 	dma_buf_io_ctx_release(bd->ctx);
 	kfree(bd);
 }
@@ -52,13 +51,13 @@ int __io_register_dmabuf(struct io_ring_ctx *ctx,
 	if (ret)
 		goto err;
 
-	bd->target_file = target_file;
 	imu->len = dmabuf->size;
 	imu->release = io_release_dmabuf;
 	imu->priv = bd;
 	imu->flags = IO_REGBUF_F_DMABUF;
 	imu->dir = IO_BUF_DEST | IO_BUF_SOURCE;
 	dma_buf_put(dmabuf);
+	fput(target_file);
 	return 0;
 err:
 	kfree(bd);
diff --git a/io_uring/dma-buf.h b/io_uring/dma-buf.h
index a97412ebbb3f..9bd7c8c64397 100644
--- a/io_uring/dma-buf.h
+++ b/io_uring/dma-buf.h
@@ -9,7 +9,6 @@
 
 struct io_buf_dma {
 	struct dma_buf_io_ctx		*ctx;
-	struct file			*target_file;
 };
 
 static inline struct io_buf_dma *io_priv_to_dmabuf(void *data)
@@ -63,11 +62,10 @@ static inline int io_import_dmabuf_map(struct io_kiocb *req,
 				struct io_mapped_ubuf *imu,
 				size_t len, size_t offset)
 {
-	struct io_buf_dma *bd = io_buf_to_dmabuf(imu);
-
 	if (!IS_ENABLED(CONFIG_DMA_SHARED_BUFFER))
 		return -EOPNOTSUPP;
-	if (req->file != bd->target_file)
+	if (unlikely(!dma_buf_io_file_compatible(io_buf_to_dmabuf(imu)->ctx,
+						 req->file)))
 		return -EBADF;
 	req->flags |= REQ_F_DMABUF;
 	iov_iter_dmabuf_map(iter, ddir, NULL, offset, len);
-- 
2.54.0

