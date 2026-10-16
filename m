Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B243457E53
	for <io-uring@vger.kernel.org>; Fri, 16 Oct 2026 09:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144727; cv=none; b=bVAMMXswAcoh7Y0iS1K96A1MLcR6SfkjGn1kWmj1/SyYAdX79kQUO0AxNMtlwMW9va0kJMnUrkufP0W/MOSqdyrmT2NtHbnYDO2nvkBdgwGGHdxyN8BbCU6CV5RzkeBKTekSNq6sxO8w4zB3oicWYAN+zXuIYkh9NFH9KGGeSdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144727; c=relaxed/simple;
	bh=PxsauXHv21NaWp1pmCSC0GXy3wHjuorZp5IT1pL8Et4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pUnxWGNRuSWNdEVrRqXRZ6lFQy1Wz4528QtcwOTBHPQH3/DRxrQCfAsD38g/Zpok9ZUGMdJGuyDsLs5zR5YA8y/h4hyIFRK+wG10OGuNNUo/Y6lXXl3j9F/DBekY7Hx4tFa6fdiA9uUmOhLIYRTYHDUfDFGTAnnqz5UOByIHW4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=juczrnFt; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="juczrnFt"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48de6a62a4cso3219906f8f.2
        for <io-uring@vger.kernel.org>; Fri, 16 Oct 2026 02:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792144725; x=1792749525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WnamvmIuzRF0GlRelCYU72kM6iXFvvQVbcyQHF1dM/M=;
        b=juczrnFtzhYAvAyP1AbOUgF1x5thBGcyxMpRwqEEIxgM/PH2BSo68N11N6nA5qfrUe
         h73m3ZNqHRlyw0kgBNH4BEtLHxglMs5CEut/Kohh5ZBIoJF6LmoBuAzjmInIX/9sVO6M
         ntE40eRP7mkQdrGYqYhcPr3rVbKdag6ZKrbLluWXODFHwbW393HUE0GmGey/ztuQQhas
         xVFPBR12EMYb9WIvFS1z7A4A8+z+1ZSGpMmibXDpimQ9RNHGLIinsavqZJy2+GOcljrh
         2d4tu94irSM7eEVBJ51/eqmHIm/EaYCi0viyD9/FrxVsG+pDyq2ZiWpGJhl+IZ7UI22U
         YjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792144725; x=1792749525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WnamvmIuzRF0GlRelCYU72kM6iXFvvQVbcyQHF1dM/M=;
        b=Bcp6iJG75t/bkKLHizwyYDlYUid96gRsSgOKwXLfS7a5ZU9t+LW/0me6q70HIAsm9X
         6KkfWmHkvqmUskpHpAOr0JgtgG+QYX8Jl/H6tB+wOH67d09DLdTn4+RvlphbwQuqNLQV
         3guXFbC77yNbJleiRaFXYPX5z+Ee9oJxYPf7bBdCEJXdUxa1PAuBphNNEFStytV2uBZX
         XzON7SkYSpIJUb128Dq40g5Uxr56W0ELsAp0Pd/azwPtkMyp1xS4P+/TQuNnyHozyuGb
         NsmoYKmGo7t+rogViTThYE8OMz8/lqUE6U12aB5+K28VQ1XG5bhWV4JhW3HHDrO8mN73
         PmXg==
X-Gm-Message-State: AFq9FYIGdlZotG1CG/ywFzGsIIUGa+AXM6kOBlCga0lLjzN0VO/HaxBJ
	7PxASfCfVl72vTjZA/dgoJmm+ansK0FbBpprFwJduJIVkMRDAjtKYwpSGet/WQ==
X-Gm-Gg: AYBFou26ZWRAA+KEUTjIGJOGluM+k9w+AOVgq67oWYuGvkqj5UdUu98cnx6sLDJDgyP
	3CGm3nJSeoxAFdBxQf7j8Ue8ft9ijAi/6nihPnxSnSDYWcc/C7XWXHJ73rl+93gpHMqfRoGUgK2
	cJOffCj+DE3bvV+h/o+z1fddjCBc+MXy/MQdIBVzl0v49Yi1G3EY3T8PW8LmHb8+3GIaVMrVCwc
	AILIPCn/CFIHuKxGnUGyBqzhawcRXuJ3oG07wE47+QpTuFGby6YG4hScbkmk5jP8i2rGi4g+wCT
	NC6WctwvX4ngSpXkqGftUpz11SvI/x1T+rLISBuM1gZuXepb4X6TWLbu2lhX7LtzTrv6+FTBZOA
	xkiKZwoBMeGPZMHqTvX10HtEIGPPHms1oE6KVRpG22lMfAopp54N9GE54mmK/NZXDUuZdx678SD
	u10qRNlvlovwJgEZ9nbQZhEd7X/kaOh6JsE8Y2ATQ9vWvwdbcUVtVIt4o0MdJzESwPzWvcV2fXf
	R9tf3tdDjPM2wkXFwYt+da9kVI/FdwWKwKIKde8ErDWs2AJas41scQLqbCb1i35lht16JnaEHji
X-Received: by 2002:a05:6000:3108:b0:486:f856:1975 with SMTP id ffacd0b85a97d-48dbaae5c02mr41334703f8f.22.1792144724678;
        Fri, 16 Oct 2026 02:58:44 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5033a2sm4133033f8f.45.2026.10.16.02.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:58:43 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	Jens Axboe <axboe@kernel.dk>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH v2 1/2] dma-buf-io: fix typos in kernel docs
Date: Fri, 16 Oct 2026 10:58:30 +0100
Message-ID: <f328e279c3995cd36458ba2684c91d1bf24f057d.1792144609.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1792144609.git.asml.silence@gmail.com>
References: <cover.1792144609.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix some typos and inconsistencies in dma-buf-io kernel docs.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 drivers/dma-buf/dma-buf-io.c | 20 ++++++++++----------
 include/linux/dma-buf-io.h   |  7 ++++---
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/dma-buf/dma-buf-io.c b/drivers/dma-buf/dma-buf-io.c
index 21296bd3dde1..e432194a5dfc 100644
--- a/drivers/dma-buf/dma-buf-io.c
+++ b/drivers/dma-buf/dma-buf-io.c
@@ -106,7 +106,7 @@ static struct dma_buf_io_map *__dma_buf_io_create_map(struct dma_buf_io_ctx *ctx
  * @ctx:	[in]	dma-buf I/O context
  *
  * A slow path part of dma_buf_io_get_map() and shouldn't be used directly.
- * Behaves in the same way but allowed to block.
+ * Behaves in the same way but is allowed to block.
  *
  * Returns a map on success, or ERR_PTR encoded errno otherwise.
  */
@@ -133,16 +133,16 @@ static void dma_buf_io_ctx_shutdown(struct dma_buf_io_ctx *ctx)
 }
 
 /*
- * dma_buf_io_ctx_create - create a new dma-buf I/O context for the given file.
+ * dma_buf_io_ctx_create - Create a new dma-buf I/O context for the given file.
  * @file: 	[in]	file for which the context is created
  * @dmabuf:	[in]	buffer to create a context from
  * @dir:	[in]	direction of DMA transfers
- * @out_ctx	[out]	resulting ctx
+ * @out_ctx:	[out]	resulting ctx
  *
  * Create a new I/O context from the given DMA buffer for the given file.
  * It only works with files implementing ->init_dma_buf_io_ctx and fails
  * with -EOPNOTSUPP otherwise. Once created, the user can create a map
- * and use it to issue I/O like read / write requests to @file.
+ * and use it to issue I/O, such as read/write requests, to @file.
  */
 int dma_buf_io_ctx_create(struct file *file,
 			   struct dma_buf *dmabuf,
@@ -180,7 +180,7 @@ int dma_buf_io_ctx_create(struct file *file,
 }
 
 /**
- * dma_buf_io_ctx_release - destroy the I/O context
+ * dma_buf_io_ctx_release - Destroy the I/O context
  * @ctx:	[in]	dma-buf I/O context
  *
  * Destroy the context. It makes sure all maps are waited on and destroyed,
@@ -201,11 +201,11 @@ void dma_buf_io_ctx_release(struct dma_buf_io_ctx *ctx)
 }
 
 /**
- * dma_buf_io_invalidate_mappings - invalidate the current map
+ * dma_buf_io_invalidate_mappings - Invalidate the current map
  * @ctx: 	[in]	dma-buf I/O context
  *
  * Importer's helper for invalidating the current map. Waits for all I/O
- * using the map to complete and destroyes the map. Called with the
+ * using the map to complete and destroys the map. Called with the
  * dma-buf reservation lock held.
  */
 void dma_buf_io_invalidate_mappings(struct dma_buf_io_ctx *ctx)
@@ -215,11 +215,11 @@ void dma_buf_io_invalidate_mappings(struct dma_buf_io_ctx *ctx)
 EXPORT_SYMBOL_NS_GPL(dma_buf_io_invalidate_mappings, "DMA_BUF");
 
 /**
- * dma_buf_io_detach - detach the @ctx from the importer.
+ * dma_buf_io_detach - Detach the @ctx from the importer.
  * @ctx:	[in]	dma-buf I/O context
  *
- * Importer's helper for removing the I/O ctx. It kills all maps and
- * prevents creation of new ones. Upon return it's safe for the importer
+ * Importer's helper for removing the I/O context. It kills all maps and
+ * prevents creation of new ones. Upon return, it's safe for the importer
  * to release all its resources such as dma-buf attachments.
  */
 void dma_buf_io_detach(struct dma_buf_io_ctx *ctx)
diff --git a/include/linux/dma-buf-io.h b/include/linux/dma-buf-io.h
index b9bbeca1744f..d9f27650a851 100644
--- a/include/linux/dma-buf-io.h
+++ b/include/linux/dma-buf-io.h
@@ -60,6 +60,7 @@ void dma_buf_io_ctx_release(struct dma_buf_io_ctx *ctx);
 
 struct dma_buf_io_map *dma_buf_io_create_map(struct dma_buf_io_ctx *ctx);
 
+/* Internal helper, see dma_buf_io_get_map() */
 static inline struct dma_buf_io_map *
 __dma_buf_io_get_map(struct dma_buf_io_ctx *ctx)
 {
@@ -79,10 +80,10 @@ __dma_buf_io_get_map(struct dma_buf_io_ctx *ctx)
  * @ctx:	[in]	dma-buf I/O context
  * @nowait:	[in]	specifies whether it's allowed to block
  *
- * Create a new or acquire an existing map. When succeeds, it returns
+ * Create a new or acquire an existing map. On success, it returns
  * a referenced map, which should eventually be put down with
  * dma_buf_io_map_drop(). If @nowait is set and the function would block,
- * it return -EAGAIN, and the caller is expected to retry from a context
+ * it returns -EAGAIN, and the caller is expected to retry from a context
  * where blocking is allowed.
  *
  * Returns a map on success, or ERR_PTR encoded errno otherwise.
@@ -105,7 +106,7 @@ dma_buf_io_get_map(struct dma_buf_io_ctx *ctx, bool nowait)
  * dma_buf_io_map_drop - Drop the map.
  * @map:	[in]	dma-buf I/O map
  *
- * Put down a reference for the @map acquired via dma_buf_io_get_map().
+ * Put down a reference to the @map acquired via dma_buf_io_get_map().
  * Should be called as soon as I/O is completed.
  */
 static inline void dma_buf_io_map_drop(struct dma_buf_io_map *map)
-- 
2.54.0

