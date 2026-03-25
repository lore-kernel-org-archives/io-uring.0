Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512E73D4122
	for <io-uring@vger.kernel.org>; Wed, 25 Mar 2026 12:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774440504; cv=none; b=hM/mHU10dqs5XHJX7dBNNJQhmydqq+jZvdKVYoJl7nbRQt8x/fI5yThVgWWmKjwsz5wXCpMvV0xFHC0s5PtCgUvcE7oP6ES5BPBKg10SXmY/n7fNyM8a42uu7UWvsYPL4WsMXAsu5sABc88TrgR/CCWv+UZhBKDwVeJx0v5WRcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774440504; c=relaxed/simple;
	bh=+z+O+5dG8yAqI5XIZ04nkzjm+SpGwED8gAiLniTpEX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vt4SMbzwyxGM2JA9Z7zdoPECtPB1BQuXwsh++Ht/3GapRpHZ5o+mftzlAwDREPzSNJfWZqPcFJRDB4lE3LhOsXCbkmoZyhCc5HF9FX/am19uXp5IstIGpGs4/IjZeLAh3IoSrxMjWZ29Le43wkqCPkL+GUgTvdAH2aGVFggQ4IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pesKVsqN; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pesKVsqN"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so16540235e9.0
        for <io-uring@vger.kernel.org>; Wed, 25 Mar 2026 05:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774440501; x=1775045301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8aPi9VnJNqU9bs5WmBhwAhFZWUAOiIAxFjx2+/0cSY=;
        b=pesKVsqNsRSezWQawcp/p4DZZCzocAbSThGrzqdMffcmw6brLjc4layOZbDRfO44nd
         pnYcJOsCUkT5wk2/3g4anOQ5QLAAkOtTbRWsBlsVPc3+FxYzMiuoA3E5XkqrxtCSnZdl
         NeI6zKNibpHcla1vXMmvekO9g80TklBBTbJZGJz646Z4/Ja10A26BPUPvXEvuTgNF+T3
         cKsta8Jf9EvypeTP/Tim4iRpTfo2Kj4ZEtA7iAhPaj8BF3viuowV9bR9RQW87YyLw+ku
         ldJSlXYWlwH0Nfbivy1Y3RV0w1fkDiuFXYSECd8ByoEuEPJi94QxERFwtcZ2DzKPlp51
         h2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774440501; x=1775045301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p8aPi9VnJNqU9bs5WmBhwAhFZWUAOiIAxFjx2+/0cSY=;
        b=m7xpVNIBGz8ovwpXkJACSK9XdeVFuU+J97gRYlcYx2CyGLfYvZRz6ZQFveOscj0O3+
         WSPwMtwu98AZRhLu7jGxVFI8UQOGphZ8alPYaEBYaHauGrjuUuV7OzIHEP/uN2aDGVCb
         0Ecpf4N2KuhljvXS8k92XBdUB0pKdfRBL1QbUxNZ+Y7WoQGyWXhAaHB/uz0HXcKwyGy9
         V7hDyenSNwz8bOzVU+YrzJTAxieuA82ZoACQUKlEUIJ84sRRQLzPi+KveMTxK7xccYaU
         M4r7MS7XvHhxrIyfQg16BKl4cjD2it2ccIuJr7sroc9wjcGdQP9f2XQQ0EcB/HBbQCEd
         oB5Q==
X-Gm-Message-State: AOJu0YxKt5rOa2nslbAmMh1M0o6GsYegZBnKBTIPCt+IfIlkJFOH5FfD
	VhECeleS+EO5dWSOscwle9nF5Ks+ebs6L/3esVZgjb7gp5JXSq8pSEaWoK1Vkg==
X-Gm-Gg: ATEYQzwhGGt5fGvaemWqHE8pvTvgTrlwTwXdD/irBW26nmPuHrdPEBBcI1YcjIk5Dih
	13cHHRNgpifSmRLY/Fhj7JlvNSh2wHeoiPGtmRCm0RUkFy7Hpmd4/QM3DKuNtn2EdrcbhnvEbWF
	wsOmiV88PMVqWUqJGylJjWQrd/hQ6FmMvQROef1O2bKgk8FWbhHeMekgGoaz/hUyY8rxA5zzopl
	k8BTW5OaLjZJIjuPRoqY57vvXTP0F7lCZybY/1/k7oz74P17FewlyUnzT9gAnPPwFIvVMIGEiEW
	NXOBLQ3QOtZ6bnNs08pp9NItPW7UwjoyJp3rh7xAyA2RaDFzhwt7eKE7pVPpDo8hjz0JUFt/r7B
	o3SLWH5Kl+Yo+/IqIucSdfpyBARMhVkGj1dCeb3RAnpeksqMwW8rphHTbG5XoRgzI0pK6herurW
	Q77GIgy1JnfJWhCxmiDgnNNPz2HsTWVoos5o3zSWY0hW7g4T5eN6GL8sFNgpaLYmK22DGYTyI/w
	i9dZ+1hOQ==
X-Received: by 2002:a05:600c:3154:b0:485:9a50:3369 with SMTP id 5b1f17b1804b1-487160846d9mr47262005e9.29.1774440501236;
        Wed, 25 Mar 2026 05:08:21 -0700 (PDT)
Received: from 127.com ([2620:10d:c092:600::1:8126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae37dsm48618289f8f.2.2026.03.25.05.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:08:20 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	axboe@kernel.dk,
	netdev@vger.kernel.org
Subject: [PATCH io_uring-7.1 4/4] io_uring/zcrx: use correct mmap off constants
Date: Wed, 25 Mar 2026 12:08:21 +0000
Message-ID: <dc8c95b5abe9830eb5ee883caf240df67e6385e1.1774439286.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774439286.git.asml.silence@gmail.com>
References: <cover.1774439286.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

zcrx was using IORING_OFF_PBUF_SHIFT during first iterations, but there
is now a separate constant it should use. Both are 16 so it doesn't
change anything, but improve it for the future.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/zcrx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
index 0f98a3c74e2a..f38d30dc0ac7 100644
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@ -386,7 +386,7 @@ static int io_allocate_rbuf_ring(struct io_ring_ctx *ctx,
 		return -EINVAL;
 
 	mmap_offset = IORING_MAP_OFF_ZCRX_REGION;
-	mmap_offset += id << IORING_OFF_PBUF_SHIFT;
+	mmap_offset += id << IORING_OFF_ZCRX_SHIFT;
 
 	ret = io_create_region(ctx, &ifq->rq_region, rd, mmap_offset);
 	if (ret < 0)
-- 
2.53.0

