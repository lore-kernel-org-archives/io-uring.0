Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E305470122
	for <io-uring@vger.kernel.org>; Fri, 16 Oct 2026 09:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143287; cv=none; b=Q11B0dP6WhcMLHy+zSdgMTspAOpDZsFNwZw7QrZPPcJtYMgXTnDS+zeOi8bA2rtVBabOaYzwqvo4+lXtnAgWboVHCRc1KmKt3bM3BSBgNIPMcmStmTCcJNPiKOffUjbqPXMu2jaKQdSSGCvWewth4H/HXq3j3I16Ta/9qBONyjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143287; c=relaxed/simple;
	bh=kJBNDbqbA2ZO/XSS1Xme384gSmj0uq+UZoWOGgjqMgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZQmUEg9yzcYDIqqKZpjQy7jR1z4fHfPe/TLQ94XgqazLh9iaprUPSX+hZbrroun3sch0MdW0DAl1TxywWz0WjfN7kwiHlARVduTBLtMhMDw9Bf6T/pxu3nOxfjq8tq2+4BW0zjK5cKxKaRCZ9zyHZlbg5Q4cVI/QTBtNWj8kD8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fG6H+8xm; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fG6H+8xm"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso1382336f8f.1
        for <io-uring@vger.kernel.org>; Fri, 16 Oct 2026 02:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792143284; x=1792748084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SpFhCIr9XErf0TQgN9GVHVagrPdev/HktwQkCtq1cFs=;
        b=fG6H+8xm7R2bRkAAGW9QFZObmv8MHvXZvlVBqMfma6ciqEuIV5IxKJpFsxNfip+Fw9
         KIk4Ra8peQzKYelaQeNjVED2iE9WNCr0QTn0HdV1Yc9nY6Lfqwv5APQrvGCgDy6hHJAw
         VGxlw3Ix1448W0VW0g0AdzfMdQoKtSZ+Jrwbl6DMW3+2SKuR3mJ9rNqMBGsrygBO9eze
         /K0c5jWaU760vNQ/TcQOGUBv6iBPALUl5jKGIeJJaVMTwOqO49mCLLl1CZVP+zEF8hS8
         QLxdkCk3oKiDpDjL0mELGv0nA0Tg2e3Ub6T610YOsSgxlFYC0fa/ykxjgzXq9aALjnP5
         O0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143284; x=1792748084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SpFhCIr9XErf0TQgN9GVHVagrPdev/HktwQkCtq1cFs=;
        b=TfGQ7FT0oEE/s9C611AgWAF0+R/bxJRO/A88McoH4y9k8xE2HYYYYCTTxV7fw4rig5
         InK8kH9HFKLRSpjDsfnF4y4utFotTpIcGXN2zsluYr5w1+U6XC8lvx+SaF08AgI06zfm
         BFXWp6uPLbzW5y0HcGTacuRPJxqIOt+08CrJ6gA3oFwBsWgkdHTXj6Px5Xwqu5bLoUnR
         nBix9WCacM9n3tDrZT4zBvjpxAF/pzQko1Z5Z8cE1uzllb1qCZhK154FeRfqtUmTR4ZH
         t2yeM4COB3DT1tIShIrK+UWpY8uLwD2YpAJVpEHRvmNd8ifPHKmICR2EuqlXXKe8ZnDa
         8Exg==
X-Gm-Message-State: AFq9FYJ/vhNXRKX4YLFZSfLbGGzp5TAVTLW5aypyJnfhqwfL+n6RSk8j
	q1jvuhePR+j7XhHVIG1DuRutGeTb1Hu/tqweDigkOVI06aEewcJezaKSlcmrDA==
X-Gm-Gg: AYBFou0e8AjP6AMLPDZozBa5knTvQn9dxKEK/qzBDpLp6qYngu1khE/vd6zZA46vUDe
	OajUp8WytJpR88y2JjRM19vad1J6dInCoh45WlUboNoPcV+lSpxGrVMiiyHU0gxQGt9QMoxlHUq
	t6OA+0gkruZ+oXo+sMvqUboeOPOWLECbkrtLe6+VFyeNwPafhkyvM/EJGIjmve9oAuHp0TLcP1R
	v6GC2jqMKISUlj3P51jT+4pSDFzlvdARdoUQQ9N1se64954RYzAEzs/9kStlgE468lQLE+Lt4bT
	fvtkTx2MbhC0cuXDLKG9UWDwOwsfxN2+vRL6sLUzTabNZVxL47PwIG4sbtSuQKJA7vyyv+gohRI
	7vsvGeXvWtcC622+JU9jSHRx5KzB8Yr8uTRTD7lG9bPZULaX1z3zvKTM9jdAyskclgVHOCWzFt+
	HxES2fzEy4xlwb2UkdX6DjST+0O0VOzF4uywko8YYaBQJIF2zbffuBrhMGyxtO+rVwNo8E9RvYQ
	02/+Bdk1OtlyVR2oILYVJC0tjbc+rQ4FbJQU2oVsocAA2VBx1F6IzDpn8sPbuxARUqy9uTVyIuY
X-Received: by 2002:a05:600c:1553:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4a18e443ea6mr421070445e9.4.1792143283846;
        Fri, 16 Oct 2026 02:34:43 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ad6252sm63570615e9.5.2026.10.16.02.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:34:43 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	Jens Axboe <axboe@kernel.dk>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 2/2] dma-buf-io: document dma_buf_io_init_map
Date: Fri, 16 Oct 2026 10:34:37 +0100
Message-ID: <79e1cc681326365d2105203b318d8a27ed7e90d7.1792142927.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1792142927.git.asml.silence@gmail.com>
References: <cover.1792142927.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a kerneldoc for dma_buf_io_init_map().

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 drivers/dma-buf/dma-buf-io.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/dma-buf/dma-buf-io.c b/drivers/dma-buf/dma-buf-io.c
index e432194a5dfc..f724936e223b 100644
--- a/drivers/dma-buf/dma-buf-io.c
+++ b/drivers/dma-buf/dma-buf-io.c
@@ -43,6 +43,18 @@ static void dma_buf_io_kill_map(struct dma_buf_io_ctx *ctx)
 	dma_buf_io_map_release(map);
 }
 
+/**
+ * dma_buf_io_init_map - Initialise the map.
+ * @ctx:	[in]	dma-buf I/O context the map is created for
+ * @map:	[in]	dma-buf I/O map
+ * @sgt:	[in]	the backing scatter-gather table
+ *
+ * Importer's helper that initialises @map for the provided I/O context
+ * and scatter-gather table. The importer should call it once for each map
+ * on creation.
+ *
+ * Returns a map on success, or a negative errno code otherwise.
+ */
 int dma_buf_io_init_map(struct dma_buf_io_ctx *ctx, struct dma_buf_io_map *map,
 			struct sg_table *sgt)
 {
-- 
2.54.0

