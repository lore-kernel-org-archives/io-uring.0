Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206061;
	b=T6rZNdWhFnQnNvbvL6U7MhoPhIwi/of84q3cZ/8joPr+DEQnDzwxHoTc5CXPCsayzIgC
	 Hh5UfiEuHoSZxDj9LhsYvpFFM2Ozq96x9X8sRHi9PiymnGyiuku4wMraAr+uyUAVXn0HS
	 pUaTvVYGc/Md8rwIZi9NSSI/A0d9209NRi5NwX0TNcj1fYslAReddN7ABSeaAus+xt/Ps
	 +RAR6MJVFUL4mnfCJba9kdfpnxVzoQrzz9jgnRroB43xCxBo0BRKTTolJJtwnD5NqC+NA
	 JJieoeVQe/P4FjhF+F4JUvKIRqR6ZUgyrn85gGmFlkFyq/7WZrE58jUSCx/XH+/JzZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206061;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Hf/Bdm/wcfWXHoQ4J6G6Uajj4VcFtjy/5XdsLk2LWik=;
	b=szNCp4g0xZ8vfJywx39C8gYIiSRK77RndDIv5O2GVuxty1ncTpb/axcB5MKcJ9I8Kgou
	 JDj7JCtSLdWMsqB9e6hUCsoOgQ337ryGKy+sJKKF+YLLvLr23snKABBGL+maizlgCU7Cg
	 dwy4sb/zk8jOpg7JJjZ2PHKKFXgGm0MMwPMxV0MM1DEqRFHFelfOwhydTLiX4JZq1SL5E
	 1PYKIarnwExgwm2YJNWD9bkAToQlTlmsce2J7ZgrEMjDwAOzscbCD7ygVaYZML5GqmrRe
	 oSYEphklyDHk2qYkDSrMw8wuHyrO7Td3W9eoEfVFFKaSXuj+G4nZJe0GrxVoUstyI8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hv4ZvH3h;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4F4606A320
	for <io-uring@vger.kernel.org>; Wed, 28 Oct 2026 16:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D4F4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hv4ZvH3h
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-84a2bea315dso835663a34.1
        for <io-uring@vger.kernel.org>; Wed, 28 Oct 2026 09:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793206060; x=1793810860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hf/Bdm/wcfWXHoQ4J6G6Uajj4VcFtjy/5XdsLk2LWik=;
        b=hv4ZvH3hpNq2tnNePSgvc0QbHPvqheC+ZYYddtKQUeKxGjoNgTGff2AzcyNW6gyTtO
         /FwInRSDHqajpFfeQHOswsX8hnN2HhFNDM4r1x/NUx8ko3jWEEUtmjl/4ne5osI+zOXg
         nPyP2I7Ka56lTEMzxvHZOgjAep6+1Co+sl8jTPfrDktqXwuaUxcHguK7GlFSFux+h3fV
         z19f+y/hl5xm1cu42wVz/+F0FiQJUMyJ2TSmxWhxIGcJtwQKkxHKXtkN3EPInv9i5B9Y
         t/lu/BiPqvd/8JQj8aMoc67hJKGnZXBW8UQn2qq43kMNozpIZmx4YudRQCT6AgXL2yFt
         S2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206060; x=1793810860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hf/Bdm/wcfWXHoQ4J6G6Uajj4VcFtjy/5XdsLk2LWik=;
        b=spaIDq23bCOmxvS9TzFgzQzDmae8xM/iXFoB1zHVrhwr5F2EE99c2u5PMKGYBfJS0F
         K11QO7ggpbQeMNje5gflvQ6yIrTJ/25M2/mTKAkj22yPa0bYkSGIHnf0BwW/EotUVicC
         droAk0DSN0Fxg0I9zyz+CsN/iLmdH6zQ9L9rN1mlcQpqVM+iFSw1fLZ3ORd5X5bSciov
         +x2c1EGa/c8bPmUlXA5ox0IINzdByK89dXMH/fpViX8XwuNaCD6/UFChmB2iu3VmSZzR
         JT4j25cOA+z/tKN0PvIv1RhNEnnkvzIF0MmrunPZhFvHGxlb+IIqnKXe/5TxXcQKU2Qt
         AQpg==
X-Gm-Message-State: AFq9FYL909R3hF29Dxbt+qJz1XwXCWowOi5//GgkSs18ZpDB8bld26JI
	nAJSQlyeq2m0NYe8QNkPzkBR/nRiuDzwYik7Kw7v9MLPBclEX7IjDxCedix+DLnU3WIar+hOwgx
	Nzp145cM=
X-Gm-Gg: AYBFou3odoluKVYrWg6AAzwcYTqiC6D0G/MGObPXuk4981GbWsQfSwhlaH8qFkt/X5k
	h1qgufIgIl46WybVXy7XjRCtz+gmwA+/Ux2jlt+R8VDiODGUhMjsmzwBl/FWk/j4iEwPL/EncHr
	wivWSg9psqKWX9vjZqSt/tVWJXpy2TJwJAPuB9TjJkRo7tgh81DaEoMrx5gACO6/R6L7xCSPaeC
	/DpQUYF0NKxQIHd/92yH1DKRgo7EyJ29dkFY49PPIFZ+5ywnnLQ4F/W9vQ+qAgi0AJfzdjOV3E9
	S2RAIxes6mZ0mnG5B5+wIbiCnJi/DpO4ViSQVj0w94yIGqy1pdt6Woq1zZaWERkja/2JBM3fqRF
	TkiOtkWirlNdi2iL70XAaqRRc82gNJZyplgc7qypxShFARcujc4kKXRA3EOz6hz2FaamlqurZI5
	P1ds7nmPkNQWBNCVtkws+vwbR6qdtUNHJ+27UhLgTfp1rtosxN6B0SnsKy6HDNJZ1r95kAWfdwM
	ysfPD4YjUFwZykbgygfQD2xQbx0u/CpIu3L2R2WsSFkqNQUG11jW2x5e5pMks8DJDzfx1pzz5pf
	Zq1tcdNLaMOBZSR8rYDDYOEmB4lxspK76BrMtj2OqF94cKkCyyrli3b3ruKNuND9L3ZxMdOggg=
	=
X-Received: by 2002:a05:6830:25d1:b0:82f:5471:4dd7 with SMTP id 46e09a7af769-85ac11bfa1cmr2652084a34.30.1793206060050;
        Wed, 28 Oct 2026 09:47:40 -0700 (PDT)
Received: from xps16 ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b206f8a41sm2019182a34.25.2026.10.28.09.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:47:38 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: Chris Mason <mason@kernel.org>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 04/10] io_uring: free XArray nodes left by a failed store
Date: Wed, 28 Oct 2026 10:46:52 -0600
Message-ID: <20261028164732.1264069-5-axboe@kernel.dk>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028164732.1264069-1-axboe@kernel.dk>
References: <20261028164732.1264069-1-axboe@kernel.dk>
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

From: Chris Mason <mason@kernel.org>

A failed xa_store() can leave nodes without entries in the tree, and
erasing every entry doesn't free those. An XArray needs xa_destroy()
before it goes away, even an empty one. That was dropped for tctx->xa in
commit ca6484cd308a ("io_uring: no need to call xa_destroy() on empty
xarray") over a lockdep report from freeing the tctx in softirq context,
and ctx->personalities never had it.

Now that the nodes are charged, a store can fail at memory.max and the
leaked nodes stay charged. Call xa_destroy() in io_uring_clean_tctx(),
which the task runs itself in process context before the tctx is freed,
in the error path of __io_uring_add_tctx_node(), and for
ctx->personalities in io_ring_ctx_free().

Fixes: ca6484cd308a ("io_uring: no need to call xa_destroy() on empty xarray")
Signed-off-by: Chris Mason <mason@kernel.org>
Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/io_uring.c | 1 +
 io_uring/tctx.c     | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 76de44a91a7b..b09859c6e8ab 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -2342,6 +2342,7 @@ static __cold void io_ring_ctx_free(struct io_ring_ctx *ctx)
 	kvfree(ctx->cancel_table.hbs);
 	xa_destroy(&ctx->io_bl_xa);
 	xa_destroy(&ctx->hpage_acct);
+	xa_destroy(&ctx->personalities);
 	kfree(ctx);
 }
 
diff --git a/io_uring/tctx.c b/io_uring/tctx.c
index 4dedcdc44780..291e30e00e45 100644
--- a/io_uring/tctx.c
+++ b/io_uring/tctx.c
@@ -189,6 +189,7 @@ int __io_uring_add_tctx_node(struct io_ring_ctx *ctx)
 			io_wq_exit_start(tctx->io_wq);
 			io_wq_put_and_exit(tctx->io_wq);
 		}
+		xa_destroy(&tctx->xa);
 		percpu_counter_destroy(&tctx->inflight);
 		kfree(tctx);
 	}
@@ -250,6 +251,8 @@ __cold void io_uring_clean_tctx(struct io_uring_task *tctx)
 		io_uring_del_tctx_node(index);
 		cond_resched();
 	}
+	/* A failed xa_store() leaves nodes with no entry behind. */
+	xa_destroy(&tctx->xa);
 	if (wq) {
 		/*
 		 * Must be after io_uring_del_tctx_node() (removes nodes under
-- 
2.56.0

