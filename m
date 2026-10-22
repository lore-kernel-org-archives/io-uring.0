Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675238;
	b=1pYN1SrrKIuBa2g68ZWx5f8Er4y9Iu00g8fZAk/iyehVI+EqHpzpbQlKTyKdjALfkNqZ
	 86m7EG2psqY0xDkagJgxK4BcxvGe2r4PB9VeOT+Y6zQmRyczgE0gvIx6TlbQpW242IhF2
	 F3PfBG9SLX+owmgim3F6k+0KMpI4vYokS/uEDZ7Qea5ubnRiW4jaQNkT+358Il9kz1Yhc
	 l7Dihszs+CvK7mXkiU04I393ejRCDXrTScfXzKZX1CNNs9GNz1iG1w1X5FSwkLAi+SByo
	 sSIERQJ/1EmWoCQ82BKAFGejFpoZnQQ7toW8jW40E899DVjznLYOr5hGqMsdXauD1jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=mgme4r67JpTEYteRjS8PBWsuR6NoDzjaPbvcjurCp3U=;
	b=lB068T0iValY8MCtO2lSgQu+BvNS1pQj9nOxXFFNuCMRLRKElpZYhlW6+pEedwU5uavG
	 T1ab0rtcV6exSWJXJt/ZfZeqRmt5zEkEH1Bdm8mDkXhja0Vp5TGNHw5zs9vYUOH2HMgpY
	 pSZNx5ygIdBGpwqBgRZWGshRoTZmV9rA58c4YCQeLI5+Ywo+oJ9qSe4FHK0wS8AydYf3t
	 7qIOJkUXibus1Sz5EXxHLNZ4e1NiOVrhxAcNqHyiV52bkrXloV7IQaq6gtEIlYmBXLBTq
	 DogslymUD7gnxd1XckoYLQ3VOGQ7wf1BMPIhoV+AQ7eHKlVSUvwG/m9U+xRbB4mZNtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=B9cqxGsK;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A03606A332
	for <io-uring@vger.kernel.org>; Thu, 22 Oct 2026 13:20:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99A03606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=B9cqxGsK
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3514b90bb89so4746235eec.1
        for <io-uring@vger.kernel.org>; Thu, 22 Oct 2026 06:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792675237; x=1793280037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mgme4r67JpTEYteRjS8PBWsuR6NoDzjaPbvcjurCp3U=;
        b=B9cqxGsKdZcWzL9ZpI33nlSrGPE2NeFdUrt9P6G4FZ8hkKoSrA+jBgq4mdDpdKsWyQ
         N7AZEEINmB+2Oq9zDBY20zNVl8hzb18RBSBzyesLCfSspZBD1T4UC/y4Z26u3L4uK+st
         WSwtg4Ij05ewKt8YwaQF17Cr99GyHZgyouhBFG7mLjNAF9SaxwUc5OffV1/nVxRFjxsr
         hRiHaQj7YoefxLU8UespXOLwwd+/FEqcOfAHcj4DVo9M2ifgpAK5DbUNGDVNNctKISM3
         QRE+LLTPNZ2zaz+CBwf6ZceKtd+Hgb4ij3M49702aDJFnqBZd+mvbgnWDDJ8/UzbJMZu
         UIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675237; x=1793280037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mgme4r67JpTEYteRjS8PBWsuR6NoDzjaPbvcjurCp3U=;
        b=kriRVqLZ8Tx7fgafbe1dwVfYeKvPPJ+eN11PBxmCXVPmwMhkLhc6D55I7HB+Yqymrr
         fxW2ayK1ikRv49nx6k9NpEuRWok92/XDqOw0SIgnu5WCXcG8FTKs7mJq5ikGrgSXs+x3
         AyE7Xm71bEsOLtG/1HNOGHtmu+Rk4vQDaF8ZhnMEJMjP+cXGjSEiffYLFrkM/MI65Ch7
         g3p9eqH9t4RtvlNNH8Yks/4Uyoj8PfbXEUBd+9OEByRlE6Ae0M4q/mXCIaGfnG3a3Xl8
         sGK/ExzsS6gHVJaNqrIe+EpIidOYD47QtYCXGNkrcBz9PkjK5bYgKsKeDvJcbo1zYG9D
         4WvQ==
X-Gm-Message-State: AFq9FYKmIh8e+pNtLzW3MYa87q97b+rWc3rRI/guj+/6grLw+DCkacEk
	sICiHBz0cu6pjUTgnFNNNltuzHa+TK3XtAcZ1fHDksYSGrouHN9HLCc=
X-Gm-Gg: AYBFou1AqfYU1P7Z3WjEMPWv5++lWeWtB2LzMwByEOmWVLFiXpzjVqjO1C9huDR1dx1
	n6LSrG3p5YheuLIhGnLvFWqR7YMHJOwdmM/WdoaU6WfNVjgvHYU2iS3eLapgqUVhzO7uOObtOEr
	4iTeiFRxHoCkFz14xiflNSt/Lv6IxjrvA/1w7gVfmlXA2uvq1ghq3yFng/9eZ3eXR+lDG6Fay0i
	doI/S/F/4263+bVgmK0I0KwHrVq2LSlc5TKq8fQWWMoy3EONM8XqZtsqcMJ7GKnRMYUkqGQ/mZR
	8Zb22mK/D5Enev91oUOONt6HYZ0T9C8ime97abkQ1qRWZlN7TWKTcxG+HrvsQgvzvi5+CmXOWbq
	N4AXYAtfMfq+iOVFouC7kGByjrJSbr8bW9e+WJSKijwlduzT1tyc5Fv/yDROAqZlgFJtxmRx8E2
	fH4KAW6HSRLocXVkvK+4QooSDyzRw9lQUymLvo0buyw8khYumZCcJ8I/XLxyoSo4FV1dAE5+Kag
	d+Xa3WcYg9sfCo2sxyZwI0nuUC8yMG6gZgxbC/I8V0lhvhqdhCZ2VvvYbfoX8D6e3oFESr+cJIW
	7Q6Te0K1qPJS3dSdxh23/jGwysOB3yJqpiF6TYAmcJn8QgTPcI/0V1F7MXXPjbkQ
X-Received: by 2002:a05:7301:2024:b0:353:5908:36fc with SMTP id 5a478bee46e88-3674cd33dfdmr6837349eec.17.1792675236487;
        Thu, 22 Oct 2026 06:20:36 -0700 (PDT)
Received: from anuj-MacBookPro.. ([2406:7400:63:e55a:5016:92c7:7a35:f3ff])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367411bc89fsm20383220eec.16.2026.10.22.06.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:20:35 -0700 (PDT)
From: Anuj Gupta <anuj1072538@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Christoph Hellwig <hch@lst.de>
Cc: io-uring@vger.kernel.org,
	Anuj Gupta <anuj20.g@samsung.com>
Subject: [PATCH] io_uring/dma-buf: don't fail fixed buffers without dma-buf support
Date: Thu, 22 Oct 2026 18:50:27 +0530
Message-ID: <20261022132027.2293931-1-anuj1072538@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Anuj Gupta <anuj20.g@samsung.com>

io_attach_dmabuf_map() is called for every fixed read/write, but returns
-EOPNOTSUPP when CONFIG_DMA_SHARED_BUFFER is disabled before checking
whether the request uses a dma-buf at all. So READ_FIXED and WRITE_FIXED
fail for ordinary registered buffers. Check REQ_F_DMABUF first.

Fixes: 62e4bf5b25d4 ("io_uring/rsrc: add dmabuf backed registered buffers")
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 io_uring/dma-buf.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/io_uring/dma-buf.h b/io_uring/dma-buf.h
index a876a9e5e272..534c06b6879f 100644
--- a/io_uring/dma-buf.h
+++ b/io_uring/dma-buf.h
@@ -34,10 +34,10 @@ static inline int io_attach_dmabuf_map(struct io_kiocb *req,
 	struct dma_buf_io_map *map;
 	struct io_buf_dma *bd;
 
-	if (!IS_ENABLED(CONFIG_DMA_SHARED_BUFFER))
-		return -EOPNOTSUPP;
 	if (!(req->flags & REQ_F_DMABUF))
 		return 0;
+	if (!IS_ENABLED(CONFIG_DMA_SHARED_BUFFER))
+		return -EOPNOTSUPP;
 
 	bd = req->buf_node->buf->priv;
 	map = dma_buf_io_get_map(bd->ctx, nowait);
-- 
2.43.0

