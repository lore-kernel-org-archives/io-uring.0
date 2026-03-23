Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E528B3AC0CC
	for <io-uring@vger.kernel.org>; Mon, 23 Mar 2026 12:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774269862; cv=none; b=bcW0n/PILfKbYp8caW56XL/gVNwrC+W/o+mUp5Fx3Tpf3Lih5HyoXL7+onDMs3GMsvj4XzVHzJy1It3DOcxmuxcStY2oLgrZA4PJRyWca+WMAGBIpdSFmxBJR67ceoUhGEbZfaZawSyoB6FNEILSZMeOFdB8d5qxW/8oTa2qMy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774269862; c=relaxed/simple;
	bh=Y7t7tUt6dttDoeVhQwZj5yxNm7WRkBuvOfI5U93wNxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ouDBG6pZhnWQAb1KMiiPoLJGzFdjnFWV55hv+1+8VAsSuKX67ZoJo5mzJPg6BHU+4qhugaUpA4xmK4nOWoQ6sb9qUaEc0NwQZagKUFUsE+SWZu5/xDCvmYVFcpz5D50JJPyd5AwyuhYaT5S0lR2euaKyOrVBGs9Kw+ZwOUfCBEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FYZr3iMx; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FYZr3iMx"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43b4fd681c2so95170f8f.3
        for <io-uring@vger.kernel.org>; Mon, 23 Mar 2026 05:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774269859; x=1774874659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DV373+pSIBMLTnC1QlsnIRzT9QyOtEAQp+0Xg1q5i/s=;
        b=FYZr3iMxEyM7BT8SVSW1bL5OYXRiS76KkU0zFbzrj2uF77Uaon7BSPVF2BNSNch7Bh
         mh1CxK4I2/7yOlk+3wkR7ec3Sp8g/oKH+XU+vEJOwnl4/Qru4RLTT/TUbaQqdRb/VYGW
         /tmkdIavKnr8nP+qfYq1gQyalH91/c7aPw5FIN9yANLcs/s9KfKw/J/ItzHJ7MHfJ/0L
         SWE2R6a2IJGpMKfnXsiZLp8oBiAWSjlP6IOgw7gX8V8B5eBWhh0Y5Sfv2FPxO+g0aIfd
         D2aEQu1cF5W0vG1P+fDgVTTiWjTPuEpo1yO5Y/hBf4ivA7HwWaTItADUpeOFU8n8qg1W
         lopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774269859; x=1774874659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DV373+pSIBMLTnC1QlsnIRzT9QyOtEAQp+0Xg1q5i/s=;
        b=dIva813VNmfqFIKvKesB3HSoY5QEsdp2ObuK6x3V2xJLBF305iIRgfAs8UAcyD+POQ
         JazpFEFV6fAV4I5JnRbwoUGyizFfP7mGIBZIBV1L5jynwwRf4haXTClv+TwHdI7pmiwK
         fU0Cf3mynq+qeK9AElVIxyZO1FT9Ofoyf++ONPvib/Q6olaSCcgjrIx+A+tm5JB+IFsV
         t2r7sZSbXhGw7Xd9+UR05ZvpvqNW5+VP7SVtUmDqT8K9XBLCWGtnvKjecwpf0EGE3LQk
         4A/AZrmehBtQphBKorh+RAopc4WcE2ArvDGFqJAmKvCNjo/dHyucYMVoFIiM+lW5w0wi
         poDg==
X-Gm-Message-State: AOJu0Yywx11kq6tXQ6HscBvr2r6mD0kfBoT94JW4rUKT3OPHFiNlWFa7
	EvNK5tRxLVZ2Rzta/X0qgqhwdbZFd47IDRqXkkWmqaql7LTqFXtMG9hm8WOUjQ==
X-Gm-Gg: ATEYQzwpJwKJR/1TvzhoUX8qRu3DtbHb1buji8imsiXuPBBUosLfvBz20T1VyK897Rn
	rh+Nvn2nyyfNJzljWwQIyKoK53jhl/kv3+VqQegcorhV6uYRUbOJtvwyGfi057xTokWvOXcuyy8
	187cJy30UFFZifkZNiiFjKfWYiWkIZAeBZaoGFCb2oa3gtT32QhCAnpcARCQ2LPbW7yTBR5Lkd+
	gEk/h71j07JzG1VQMYYaKxXl1zykEAPpkR4dpquJTjBfae5prDELPyiKdcaosHK0XuVbYhSOxdY
	keKTSQ/r242xPK4iLgSRJWQC7GpX6//PIXl2RFImuZiNHK3d38uZP//SEZ6x7gKn/uxMT9mRMSB
	LWZKEaOFpSfIB7dcCrBFWM3/aTTFChFADFyUkafGaVBaO+Mt7u04aCrXPRl9DienRfj0f60CB8p
	qCHhuAhSg29UlbdCh9hRZwuJX5scwvSLEPc6+YSEBhA+DbJChMnh5vvVoKGYiHO6t4QdrggENOv
	ooPk1EE/Q==
X-Received: by 2002:a05:6000:26c3:b0:43b:50bd:bca3 with SMTP id ffacd0b85a97d-43b64238685mr17478676f8f.1.1774269858818;
        Mon, 23 Mar 2026 05:44:18 -0700 (PDT)
Received: from 127.com ([2620:10d:c092:600::1:6969])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6425eeb4sm25520861f8f.0.2026.03.23.05.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 05:44:18 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	axboe@kernel.dk,
	netdev@vger.kernel.org
Subject: [PATCH io_uring-7.1 14/16] io_uring/zcrx: cache fallback availability in zcrx ctx
Date: Mon, 23 Mar 2026 12:44:03 +0000
Message-ID: <65e75408a7758fe7e60fae89b7a8d5ae4857f515.1774261953.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774261953.git.asml.silence@gmail.com>
References: <cover.1774261953.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Store a flag in struct io_zcrx_ifq telling if the backing memory is
normal page or dmabuf based. It was looking it up from the area, however
it logically allocates from the zcrx ctx and not a particular area, and
once we add more than one area it'll become a mess.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/zcrx.c | 9 ++++++++-
 io_uring/zcrx.h | 1 +
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
index 265b3a744ac2..d6475f95b815 100644
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@ -423,8 +423,13 @@ static void io_zcrx_free_area(struct io_zcrx_ifq *ifq,
 static int io_zcrx_append_area(struct io_zcrx_ifq *ifq,
 				struct io_zcrx_area *area)
 {
+	bool kern_readable = !area->mem.is_dmabuf;
+
 	if (WARN_ON_ONCE(ifq->area))
 		return -EINVAL;
+	if (WARN_ON_ONCE(ifq->kern_readable != kern_readable))
+		return -EINVAL;
+
 	ifq->area = area;
 	return 0;
 }
@@ -882,6 +887,8 @@ int io_register_zcrx_ifq(struct io_ring_ctx *ctx,
 	if (ret)
 		goto err;
 
+	ifq->kern_readable = !(area.flags & IORING_ZCRX_AREA_DMABUF);
+
 	if (!(reg.flags & ZCRX_REG_NODEV)) {
 		ret = zcrx_register_netdev(ifq, &reg, &area);
 		if (ret)
@@ -1296,7 +1303,7 @@ static struct net_iov *io_alloc_fallback_niov(struct io_zcrx_ifq *ifq)
 	struct io_zcrx_area *area = ifq->area;
 	struct net_iov *niov = NULL;
 
-	if (area->mem.is_dmabuf)
+	if (!ifq->kern_readable)
 		return NULL;
 
 	scoped_guard(spinlock_bh, &area->freelist_lock)
diff --git a/io_uring/zcrx.h b/io_uring/zcrx.h
index 893cd3708a06..3e07238a4eb0 100644
--- a/io_uring/zcrx.h
+++ b/io_uring/zcrx.h
@@ -54,6 +54,7 @@ struct io_zcrx_ifq {
 	unsigned			niov_shift;
 	struct user_struct		*user;
 	struct mm_struct		*mm_account;
+	bool				kern_readable;
 
 	struct zcrx_rq			rq ____cacheline_aligned_in_smp;
 
-- 
2.53.0

