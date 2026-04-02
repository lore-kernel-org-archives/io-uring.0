Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA2023EAB2
	for <io-uring@vger.kernel.org>; Thu,  2 Apr 2026 16:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775146188; cv=none; b=YRdnB/ac+pjrEGxxO/FOCzMdJ7vv+BwgZ63l9MTjtfHpy+7vVFdMihxynjBiuKOsDcztTwrXr8VBLVZ2arcJLCEYKuWEg8mcCgXCFaViaSzrZkSk4dS3Cqnekhx9u/zKtsl0tO5160f5+50kLqHVitFahYrXqUZMXBROR72au7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775146188; c=relaxed/simple;
	bh=Q0cSaZd9rfHKEXH5w8OVnhpGCeXzPC0u8VkgOU6dq5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=idtFcZ8ErDJIWvLzB0WNVTHrZkJzmTGvk4MpCNTHE+xzLgeL4Bgw1WD/nEzXmFmXgmVyVghYs+Zy7YzdtTAGgvfbA3s7AZNGikOJFYGAKdi50atH9HPBa9wk1sw0wWGDjKFkNU/eOnfQ6BTP65HfPbjx3fTZK8+BJRphm6KzOf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X59l/otL; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X59l/otL"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35d9c7bf9a1so835951a91.3
        for <io-uring@vger.kernel.org>; Thu, 02 Apr 2026 09:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775146186; x=1775750986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Krj6CQiBkwJSjfO7pe8ZPs+eZ/Zubyv/l8EPrAisp5Y=;
        b=X59l/otLS5GuQJIOYS95FgPmL+oj0xlnnkJ528vmypZIkkEIPKVgHz6dQvKJ7r+8mr
         jXckbpd27suE9z7AsnEvL6ZYwmmhXh5I90MlFgnCpghZVmEZ82ED654L5GUkYCc05EjQ
         E0a0U9wige6p9sEg2GeH5DTZeKQ5BgNNVi9ff1m2G6H9USG2GvT6kMQySu8NEYWDGUlj
         QY1DaizyNC0i5cR2H3mKKvnag/EkXolUTd+5CXJN21EBuO9zfxenhKg655be155zPKDl
         8pnHicujL1/wVae7JxyoT0UJ45A2m5jr1EYvW85E6+4x3NrZeGwLhY9UJcbvvkkAF8yY
         +BAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775146186; x=1775750986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Krj6CQiBkwJSjfO7pe8ZPs+eZ/Zubyv/l8EPrAisp5Y=;
        b=N+ZZXzsEie1EbO6Nj5AgKkJlu9yJJ+QGGihn45LhKj3hBO1Gcj4pqLWquQ7OKhVpPE
         tEbgIUk9zTMqEkjzIwV/eiPa3Cq4oBCjuESeA4G7BiwEBslTRwxeeP5RJvgVE/5q6BBz
         6JxtjnDYCDfo9XOQ8m+1VTD55sJ5JQaVTgU65CZphkbPT3MBxBM0S1/ak6CRE7dBZov2
         cOkTsJrd3ZRWGxxpdn1IL4MhmemcifvBdPOM9J7VthahbC1CIcNKylorhX4k38Z4VQGh
         l6Dd6z0gcVaHTh7b9kPG3MRthY2IO2i8RKzrLdRnC3BW5abGtJJPrIpMi1os1Ifdzdp6
         DBJw==
X-Forwarded-Encrypted: i=1; AJvYcCVhbXIVMavFlQPwLGSHQLU2uI8f5sLsON/uziVQDF1koHPjiQscmxOLG5nX6o5azfRGo44cd5UnxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwamvUJFCFiNKN02I25Tx/kHFu/Au8dIDHFkGdCptjBdhPQVrJs
	Er9/Bre2dlGZesF3Z87SOSLYaSHzC3wPqlUWb9S3vDQDJyJmMzXFNgzV
X-Gm-Gg: AeBDieui4fObpO0h2dPQ8P9UDTBP0F7TBaHrSOK08u26wxUGlTFmoqpNj5AFP2AU/eB
	VYLM7FpOPDUF2DalRknRCoMmOqlg8849Q4p94iy5dSSFOrwfwSSoGsqrJ4t7asmJzno7RcSRm80
	govDwS1w1Pj6uJhdqeOLXK1pLPuUnp8ZPkJ/vRvp9btEvmJozH7i7qhqBC2srKzMdRBD9tnfmVF
	/dMwOTXP+MrMpu4MEXLvHyXHt+h/64v8Uhcwk351xPiTukaT7pEArubXZ9Wg410ImQpzwWY0lAV
	PXrxTQSEKcxrBv3S6fsSmTaUnknSUmjpaUOE1TJXyGd+IWhvr6V4HMM9z+00eqk5DJg7Jx5UrYh
	x3bvjdXMLAiNeZumBG1fKu7/wzea2XK27gB35pWi5cvcsdXFJDyoQU+4SIJgr1DJ0gKbE6tbbjG
	AvuaIZqHUwHjpHQ6sn
X-Received: by 2002:a17:90b:3f8f:b0:359:fe72:3559 with SMTP id 98e67ed59e1d1-35dc6f7feacmr7788634a91.21.1775146186409;
        Thu, 02 Apr 2026 09:09:46 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:9::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe937925sm11524657a91.12.2026.04.02.09.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 09:09:46 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: axboe@kernel.dk
Cc: csander@purestorage.com,
	io-uring@vger.kernel.org
Subject: [PATCH v5 4/4] io_uring/rsrc: rename and export IO_IMU_DEST / IO_IMU_SOURCE
Date: Thu,  2 Apr 2026 09:09:29 -0700
Message-ID: <20260402160929.2749744-5-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260402160929.2749744-1-joannelkoong@gmail.com>
References: <20260402160929.2749744-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename IO_IMU_DEST and IO_IMU_SOURCE to IO_BUF_DEST and IO_BUF_SOURCE
and export it so subsystems may use it.

This is needed by the io_buffer_register_bvec() path for callers who may
need the buffer to be both readable and writable.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 include/linux/io_uring_types.h | 5 +++++
 io_uring/io_uring.c            | 2 +-
 io_uring/rsrc.c                | 2 +-
 io_uring/rsrc.h                | 5 -----
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/io_uring_types.h b/include/linux/io_uring_types.h
index 28e5dbdac55b..b4f0e69633ab 100644
--- a/include/linux/io_uring_types.h
+++ b/include/linux/io_uring_types.h
@@ -44,6 +44,11 @@ enum io_uring_cmd_flags {
 	IO_URING_F_COMPAT		= (1 << 12),
 };
 
+enum {
+	IO_BUF_DEST	= 1 << ITER_DEST,
+	IO_BUF_SOURCE	= 1 << ITER_SOURCE,
+};
+
 struct iou_loop_params;
 
 struct io_wq_work_node {
diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 16122f877aed..b5debc615657 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -3215,7 +3215,7 @@ static int __init io_uring_init(void)
 	io_uring_optable_init();
 
 	/* imu->dir is u8 */
-	BUILD_BUG_ON((IO_IMU_DEST | IO_IMU_SOURCE) > U8_MAX);
+	BUILD_BUG_ON((IO_BUF_DEST | IO_BUF_SOURCE) > U8_MAX);
 
 	/*
 	 * Allow user copy in the per-command field, which starts after the
diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 4aada6548ac5..7d9d155a85b1 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -820,7 +820,7 @@ static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
 	imu->release = io_release_ubuf;
 	imu->priv = imu;
 	imu->flags = 0;
-	imu->dir = IO_IMU_DEST | IO_IMU_SOURCE;
+	imu->dir = IO_BUF_DEST | IO_BUF_SOURCE;
 	if (coalesced)
 		imu->folio_shift = data.folio_shift;
 	refcount_set(&imu->refs, 1);
diff --git a/io_uring/rsrc.h b/io_uring/rsrc.h
index cff0f8834c35..8d48195faf9d 100644
--- a/io_uring/rsrc.h
+++ b/io_uring/rsrc.h
@@ -23,11 +23,6 @@ struct io_rsrc_node {
 	};
 };
 
-enum {
-	IO_IMU_DEST	= 1 << ITER_DEST,
-	IO_IMU_SOURCE	= 1 << ITER_SOURCE,
-};
-
 enum {
 	IO_REGBUF_F_KBUF		= 1,
 };
-- 
2.52.0

