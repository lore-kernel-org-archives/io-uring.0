Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F3444E042
	for <io-uring@vger.kernel.org>; Fri, 16 Oct 2026 09:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144729; cv=none; b=bEf5+vLn9bLgKeDQA6m+iOZ5qYdK0Gx1qZDhl5EbhtLwuvJkUWEVOp7Nmlg7okvjhISFyy6vI6weqs/4kn2s9hIerHow8QseNUUtibE9CYsJpBbUgIeTIQOQs6tZa41y+5laCYTPxEBpD6YAXeUyYb8p4ZTH3qwh0MItU/mwGfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144729; c=relaxed/simple;
	bh=NOzo9UtrfXrBxeXN6L/zMybYdAYQiBOS8ivGdbg0DuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h2g8v4eyQ3wnnc3rOO7EdMU5PvoENl2rIoZv4WQ9xx48maA7+3JSJ4hDh1fn68mxvzHFoQtI5u9BDAONLH4LOa6LeJBz9oSvnzQurZnFgEEeLm/z2Y2wn8zAIgVY2tMciOk+S/+RAJt+8cCUuq2fqqghkJigcXwAEWAYVXNWaOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TSEGkZyu; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TSEGkZyu"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c45111bebso3991182f8f.0
        for <io-uring@vger.kernel.org>; Fri, 16 Oct 2026 02:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792144726; x=1792749526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LD2knUg3bwI53NAkb4XKjLA3TEnvxqdDcA9IYxZn/Mo=;
        b=TSEGkZyuJjDVgmXZBn+b3n8hq2O1ah2mTSsMXXWTsBH6VCAFjUopMU5E6Nm2FGDrBD
         57jLmjPTy5lYKFIv4x3TP+Z4W8WMSDBFojq+7VPoaIqpF8qcBMS0/rzUWNTsZcqIabwN
         3binmxN807VMzpPgxBRQ91oZ5wQyGfP3pR7UB16007WFT/GteIiRCxS7mjXPNQ5d76VT
         wCWAyhTAa1EIdwKuInnS4n297hwpepYz6c0LTmJuuZ67FpvsrquKtQwE0/pGtlMKMNb7
         fSVKTdj4qRIIbHXeMfjRNRbI3xNBdUZEFdl8xYvGL3bKmiau2sw3gw8uZADV4026tciu
         UFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792144726; x=1792749526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LD2knUg3bwI53NAkb4XKjLA3TEnvxqdDcA9IYxZn/Mo=;
        b=yXQm0CKoqBonbyh3EHd90I4WvrH5AMWNUyHffp8kOsSugFuikP6AffPiPepngrcEab
         877h7qujy0h0BYRAn46DVTSWhjbQjMQoGalHE9yUFtlMNQYosb+MxFGmgziWA7o4Ixq+
         zkeO4HlPRy6Jj76qWwsgdqDNAnfdBwdOis/StBaneOz18TFpFI6lSV9OyqEuZ/oQiZ26
         DqlEClMEZla/grDDQnUzLlzDCVS2tyLPIS5Ls5puN2CbluIUEN0B2kRv2JB1vOPP/bhG
         B7VIDLaFMTzCdTsmmY2xaG09Ox0IIUI53rb3Rp02CmvLaI839dq9rqrrv/OkdVlDx4c7
         /lzA==
X-Gm-Message-State: AFq9FYKsHfXYsvZm2Luzy/30kSBwjOTtPHIzZQ/LLBaZSRilxfVfjNJj
	tyx3UFs9hO9tX3MB8udO3f66NgGfCpPksI0R6JdRs4vfTBm3I81ii10wwWN6gw==
X-Gm-Gg: AYBFou2MoRbQbsqG9AnFksFM2xigSZcFdCX0CTuXSCcy+SuCmSl6fymXOg+7vGC2NxQ
	uT+qrJepCnaqxt/X9y0beggEjw2y93IGPn3tbYiBs+auADQ9aBVtCKjFtvKDMNucBsqb0VjgOEl
	ZvbrXYcUVPTdM3f940exNOyMhNKOf2tqFHJG1/1+fAVcR0IYUEeMyZ9hKJG66fBj6Aw2wfngezW
	9mEBGP8d1gQaMP+E7Ja4EcYQmeUHxOv4K4pr9dROFqUmJk6tVw19r6MnsePeL3hzftz9wpfEN02
	6GxCgMVfDrKVPgOYJkuiOSezxYcoA46SMT6H77V+3D0q6PHi8yIMqAM+JiyeAD8oen7Pa4qaxas
	a+X5/sK6JOmtnk9UccS0OjXyxdp5xY8JvdIPYCz94eCzWU6LuVwfoXuAcjIgOlN/0HZbl+eHeqP
	4em7ORoGlwopBEwmqRe4OrwR0kNaBcekNkfgTvLupMTgLkg8jqyFDYtq2Dt77QToT43UtWaIGXv
	snmBF7ImWD921NMDcrTp9ZdDSFw9cbCh523eV8SVeZqi965C4P/2b7NV0ujjMNbPdc/mvYgSFIq
X-Received: by 2002:a05:6000:29c3:b0:48d:c15c:94a5 with SMTP id ffacd0b85a97d-48dc15c964amr29582852f8f.14.1792144726031;
        Fri, 16 Oct 2026 02:58:46 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5033a2sm4133033f8f.45.2026.10.16.02.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:58:45 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	Jens Axboe <axboe@kernel.dk>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH v2 2/2] dma-buf-io: document dma_buf_io_init_map
Date: Fri, 16 Oct 2026 10:58:31 +0100
Message-ID: <a9fdfbe6e447ac583f4d3a3f981b203141a624c4.1792144609.git.asml.silence@gmail.com>
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

Add a kerneldoc for dma_buf_io_init_map().

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 drivers/dma-buf/dma-buf-io.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/dma-buf/dma-buf-io.c b/drivers/dma-buf/dma-buf-io.c
index e432194a5dfc..8440151de860 100644
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
+ * Return: 0 on success, or a negative errno code otherwise.
+ */
 int dma_buf_io_init_map(struct dma_buf_io_ctx *ctx, struct dma_buf_io_map *map,
 			struct sg_table *sgt)
 {
-- 
2.54.0

