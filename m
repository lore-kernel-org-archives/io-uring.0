Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42E848C8CA
	for <io-uring@vger.kernel.org>; Fri,  7 Aug 2026 13:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108811; cv=none; b=NKzt9YT2aMaOlxmK2z/EEFDlar7HVWVrLn89HXPsIeKR09XFTskvMCnj6ko2gC5/QQBcjavuXv41d/MxYcvE5QqPPIt8Y8cvezH9G+zhU8ZSafMYQce5TLMYUMp7ozXg/6ODFdY0D7EyQOPse0mVNT1UFjpZHpzd8UCLDWrd9mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108811; c=relaxed/simple;
	bh=1a6qOzfcPbGceTUo8M00/59IfvvWFhdhCg1PH9Y4fGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wyl8HZlfmYYIUSLEa9TWnCfFbUd3zF1CdTZsNfT3+VF3UIQo6/BR3o9u3tacEWl3CJTjSTPrC0z2x6tQTEgibHmEmpTl9/f3x8alX1EHeczM1XHOzfYUokCAHDEb/tzKs+XzzagxHibi7lFVSzaFYwiljuCz06m50n4NEyUwogE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hsWl+xkv; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hsWl+xkv"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-495590dde14so38623415e9.0
        for <io-uring@vger.kernel.org>; Fri, 07 Aug 2026 06:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108803; x=1786713603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kUNoE7zYHT0O2RNA8aWXzJRxXxE5DpTjCUpT/NYUB3E=;
        b=hsWl+xkvn1mtu2JQIYO0CCTM7I74sq9pVDKrYWRzn/LZITY8E/P+6EJEH44OGlUWO2
         Ad6i19y42ME4xLBzVpVy9I19tzfdKiRiIWE95b0DvJ7UqQRDUEqkDyMsPD2v0OsgK0QS
         tFlH64OUMrIsfi4HdqRWPwtGPbE+Bn4GQf7p1kuR8FGZiT8BhCiUWD+zv8oLNofIaEtU
         aRZIVvGia6zjd9WQXsO1fTudxdNfGqHEBjiJWWBqjlJMASh0PY5geaopDIuUSE2GU94D
         V3q28D0XsOwl/6bhoTBHDH91GPXH+cfjP8uTbVzdQ5UXQ1Fuq8RPy89VjGzNk2/kGd8d
         iYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108803; x=1786713603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kUNoE7zYHT0O2RNA8aWXzJRxXxE5DpTjCUpT/NYUB3E=;
        b=T3MPSsaLYKNQw7fVA3Fk9Soi+iK4ScPhZcK0kC1knyLAyCopcSAU9XXJk2D45cVb0I
         eawJmEV6Kh5buoR1t/uMN+xdfRybbnhJspHeL4nSFpVVPkFdoh81Sv+/EA3HS0zt1W+5
         THp7ye+muSwZOOp+U+C4wuTvEw+fJVYQUtdj5NR2Ok5qUXcLEGrzaS/8fCvZxPtBwt3F
         V/IW6GxU2Q28N3N3QQLniwLTUHDXCFjf8MOlnk2MzCDOkGt2kNSfDqkeXntKBjpph0yg
         Do+2LRy8olhKxxSYvwkjte22hABt0tKuEYHYvGTLrqurILx5i18WSGIDdyLirIMyGGuc
         0CcA==
X-Gm-Message-State: AOJu0Yy4bhtDUL1qGMGo2jRnVQvkCbQ18Tsn4SBEKJV9Q+YF4AIF0tO5
	/o4gbgAeB+LLzJYamv6sH2H6xOoluohs+lAp+CkGuiPwJf4pfraLcrUqhHFUjVaW
X-Gm-Gg: AR+sD11HvLRuXqYWb5hFvYNmtV0LT16Dp+MO2ZSDrjWdxWBIY88vw8+tM+3ZSqluFIg
	BjPX5oO3mngG7FPYEFWpO5dYJE3cTmu2kQhdizOen0t7mVYgQBynS4O1qSHrRjpeHT/b8RCR1i4
	M4byB10/mOgtq6I2UMpaerguorQJTgZMIiNSzcTEY2Ax/Mn6LvQMZuQcV59XakY0flfN1DSeVIX
	zn8bzNZK95rNRPABEJTys2igDzY10JdhSBVwZQTqKpvUPnIKapojO+ZX8n1rVQup2xqcTrnxr1n
	I//0oL/n++saRgAeI1uWDVDdPJqFXL5UejwG/t8K/UUhGVUveYv4CMQTOsr1txw7+bhl0BEBF+h
	FzMJnS+k63g5AaZl+7KRwFY8tXmNW+47cMXOfIrunN+fM2HgmhNVgGyhQXhSluKJ78LSs+dbAaI
	rqcbybokXapgltZFffYsT26lHDkAma1+nxJposcZHIVuc3eO4EC8ZKs6HEU374BiTI06xc4khVQ
	gjNxWHuHffdjD8HJjR0oJLmn7/xmdqkB0/kaOfXxzUeHabLXbXsvhorQTW7MaoRPQ==
X-Received: by 2002:a05:600c:8b35:b0:499:4d4b:be2b with SMTP id 5b1f17b1804b1-4994e7d2bb5mr286211975e9.16.1786108802767;
        Fri, 07 Aug 2026 06:20:02 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995427a244sm144125015e9.10.2026.08.07.06.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:20:01 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	netdev@vger.kernel.org
Subject: [PATCH io_uring 16/16] io_uring/zcrx: add dynamic area provisioning
Date: Fri,  7 Aug 2026 14:19:34 +0100
Message-ID: <43495ca686713b3f0014c9f47c4c0276d704da4d.1786108672.git.asml.silence@gmail.com>
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

It's not always possible for the user to predict during registration how
much memory zcrx will need to sustain the traffic. Allow to dynamically
add more areas with a new ctrl code ZCRX_CTRL_ADD_AREA.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 include/uapi/linux/io_uring/zcrx.h |  7 ++++
 io_uring/zcrx.c                    | 56 ++++++++++++++++++++++++++----
 2 files changed, 57 insertions(+), 6 deletions(-)

diff --git a/include/uapi/linux/io_uring/zcrx.h b/include/uapi/linux/io_uring/zcrx.h
index e01bc0e34b24..99b8636fdabb 100644
--- a/include/uapi/linux/io_uring/zcrx.h
+++ b/include/uapi/linux/io_uring/zcrx.h
@@ -116,6 +116,7 @@ enum zcrx_ctrl_op {
 	ZCRX_CTRL_FLUSH_RQ,
 	ZCRX_CTRL_EXPORT,
 	ZCRX_CTRL_ARM_EVENT,
+	ZCRX_CTRL_ADD_AREA,
 
 	__ZCRX_CTRL_LAST,
 };
@@ -134,6 +135,11 @@ struct zcrx_ctrl_arm_event {
 	__u32		__resv[11];
 };
 
+struct zcrx_ctrl_add_area {
+	__u64		area_ptr; /* pointer to struct io_uring_zcrx_area_reg */
+	__u64		__resv[5];
+};
+
 struct zcrx_ctrl {
 	__u32	zcrx_id;
 	__u32	op; /* see enum zcrx_ctrl_op */
@@ -143,6 +149,7 @@ struct zcrx_ctrl {
 		struct zcrx_ctrl_export		zc_export;
 		struct zcrx_ctrl_flush_rq	zc_flush;
 		struct zcrx_ctrl_arm_event	zc_arm_event;
+		struct zcrx_ctrl_add_area	zc_area;
 	};
 };
 
diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
index fe36520994e7..1b3b11405dac 100644
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@ -36,9 +36,15 @@
 #define ZCRX_REFILL_CAP MIN(64 * ZCRX_MAX_FRAGS_PER_PAGE, 1024)
 
 #define IO_ZCRX_AREA_SUPPORTED_FLAGS	(IORING_ZCRX_AREA_DMABUF)
+#define ZCRX_MAX_AREAS			1024
 
 #define IO_DMA_ATTR (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_WEAK_ORDERING)
 
+static inline u32 zcrx_next_area_id(struct io_zcrx_ifq *zcrx)
+{
+	return zcrx->nr_areas;
+}
+
 static inline u64 zcrx_area_id_to_token(u32 area_id)
 {
 	return (u64)area_id << IORING_ZCRX_AREA_SHIFT;
@@ -334,7 +340,7 @@ static void io_zcrx_unmap_areas(struct io_zcrx_ifq *ifq)
 {
 	unsigned area_idx;
 
-	guard(mutex)(&ifq->pp_lock);
+	lockdep_assert_held(&ifq->pp_lock);
 
 	for (area_idx = 0; area_idx < ifq->nr_areas; area_idx++)
 		__io_zcrx_unmap_area(ifq, ifq->areas[area_idx]);
@@ -469,7 +475,9 @@ static int io_zcrx_append_area(struct io_zcrx_ifq *ifq,
 	struct io_zcrx_area **areas, **old_areas;
 	unsigned old_nr;
 
-	if (WARN_ON_ONCE(ifq->kern_readable != kern_readable))
+	if (ifq->kern_readable != kern_readable)
+		return -EINVAL;
+	if (ifq->nr_areas + 1 > ZCRX_MAX_AREAS)
 		return -EINVAL;
 
 	old_areas = ifq->areas;
@@ -508,7 +516,7 @@ static int __zcrx_create_area(struct io_zcrx_ifq *ifq,
 			return -EINVAL;
 		buf_size_shift = ilog2(rx_buf_len);
 	}
-	if (WARN_ON_ONCE(ifq->niov_shift))
+	if (ifq->niov_shift && ifq->niov_shift != buf_size_shift)
 		return -EINVAL;
 	if (!ifq->dev && buf_size_shift != PAGE_SHIFT)
 		return -EOPNOTSUPP;
@@ -566,7 +574,7 @@ static int __zcrx_create_area(struct io_zcrx_ifq *ifq,
 
 	area->free_count = nr_iovs;
 	/* we're only supporting one area per ifq for now */
-	area->area_id = 0;
+	area->area_id = zcrx_next_area_id(ifq);
 	area_reg->rq_area_token = zcrx_area_id_to_token(area->area_id);
 
 	ret = io_zcrx_append_area(ifq, area);
@@ -608,7 +616,7 @@ static struct io_zcrx_ifq *io_zcrx_ifq_alloc(struct io_ring_ctx *ctx)
 
 static void io_zcrx_drop_netdev(struct io_zcrx_ifq *ifq)
 {
-	guard(mutex)(&ifq->pp_lock);
+	lockdep_assert_held(&ifq->pp_lock);
 
 	if (!ifq->netdev)
 		return;
@@ -636,7 +644,8 @@ static void io_close_queue(struct io_zcrx_ifq *ifq)
 		if (ifq->if_rxq != -1)
 			netif_mp_close_rxq(netdev, ifq->if_rxq, &p);
 
-		io_zcrx_unmap_areas(ifq);
+		scoped_guard(mutex, &ifq->pp_lock)
+			io_zcrx_unmap_areas(ifq);
 		netdev_unlock(netdev);
 		netdev_put(netdev, &netdev_tracker);
 	}
@@ -995,6 +1004,8 @@ int io_register_zcrx(struct io_ring_ctx *ctx,
 
 	if (copy_from_user(&area, u64_to_user_ptr(reg.area_ptr), sizeof(area)))
 		return -EFAULT;
+	if (area.rq_area_token)
+		return -EINVAL;
 
 	memset(&notif, 0, sizeof(notif));
 	if (reg.event_desc && copy_from_user(&notif, u64_to_user_ptr(reg.event_desc),
@@ -1057,6 +1068,8 @@ int io_register_zcrx(struct io_ring_ctx *ctx,
 			goto err;
 	}
 
+	WARN_ON_ONCE(!ifq->niov_shift);
+
 	reg.zcrx_id = id;
 
 	scoped_guard(mutex, &ctx->mmap_lock) {
@@ -1448,6 +1461,7 @@ static void io_pp_uninstall(void *mp_priv, struct netdev_rx_queue *rxq)
 	struct pp_memory_provider_params *p = &rxq->mp_params;
 	struct io_zcrx_ifq *ifq = mp_priv;
 
+	guard(mutex)(&ifq->pp_lock);
 	io_zcrx_unmap_areas(ifq);
 	io_zcrx_drop_netdev(ifq);
 
@@ -1550,6 +1564,34 @@ static int zcrx_arm_notif(struct io_ring_ctx *ctx, struct io_zcrx_ifq *zcrx,
 	return 0;
 }
 
+static int zcrx_ctrl_add_area(struct io_ring_ctx *ctx, struct io_zcrx_ifq *ifq,
+			      struct zcrx_ctrl *ctrl)
+{
+	struct zcrx_ctrl_add_area *ctrl_add = &ctrl->zc_area;
+	struct io_uring_zcrx_area_reg __user *area_uptr;
+	struct io_uring_zcrx_area_reg area_reg;
+
+	area_uptr = u64_to_user_ptr(ctrl_add->area_ptr);
+	if (copy_from_user(&area_reg, area_uptr, sizeof(area_reg)))
+		return -EFAULT;
+	if (!mem_is_zero(&ctrl_add->__resv, sizeof(ctrl_add->__resv)))
+		return -EINVAL;
+	if (area_reg.rq_area_token)
+		return -EINVAL;
+
+	guard(mutex)(&ifq->pp_lock);
+	if (ifq->dev && !ifq->netdev)
+		return -EFAULT;
+
+	/* we can't safely roll back area append, copy it out first */
+	area_reg.rq_area_token = zcrx_area_id_to_token(zcrx_next_area_id(ifq));
+	if (copy_to_user(area_uptr, &area_reg, sizeof(area_reg)))
+		return -EFAULT;
+	area_reg.rq_area_token = 0;
+
+	return __zcrx_create_area(ifq, &area_reg, 1U << ifq->niov_shift);
+}
+
 int io_zcrx_ctrl(struct io_ring_ctx *ctx, void __user *arg, unsigned nr_args)
 {
 	struct zcrx_ctrl ctrl;
@@ -1576,6 +1618,8 @@ int io_zcrx_ctrl(struct io_ring_ctx *ctx, void __user *arg, unsigned nr_args)
 		return zcrx_export(ctx, zcrx, &ctrl, arg);
 	case ZCRX_CTRL_ARM_EVENT:
 		return zcrx_arm_notif(ctx, zcrx, &ctrl);
+	case ZCRX_CTRL_ADD_AREA:
+		return zcrx_ctrl_add_area(ctx, zcrx, &ctrl);
 	}
 
 	return -EOPNOTSUPP;
-- 
2.54.0

