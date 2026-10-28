Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206059;
	b=j5HlhKSA09Rg1Gg5a7Z8yPgT+aK07vSY2nGMTorGgj9xpRmZOsV/qLBxdA/FZJqhzqDg
	 oWDL2CZipgFwRcP+zCXYOGvFy00VpjZNjEc0J0KThnmvGS9JN7KxhlasDX4PXtb+Iz4q4
	 heOPTnV3/E2/KohgKKquvttWYmhP1DdDlWFlAsxKfkheh1XTAq/g19EKkPOA0PDHeQ7gP
	 aJHk1wZtvIbk1cUrIqh/ZTHvaWjPcrfTwqeX+2gq21TG0pcUKFy0pYq8gu1brynP4EVmJ
	 TeScMoi40mPFfrAenF4wAN7qlnz7Pt9rUnNdRODv18cfNBN2hSTQqkPXmh5xWW10JZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JFjgbk6WFZbmlST+M0GxkdQvyngOIe62skUxbzNLCHU=;
	b=a/+ZpArmcQeBol1e4YvCuM0uyrV+aErQ3EiP1TfYrvDOklN2Hczpi197uee0drK4yMfy
	 FoF9HxoTv6GD5ZMxD5Euh0mDmty9jR8Ngodwf6gX20w4dFwziZJ1AriZwbgXhZrAmwWpz
	 4Xfuzi7KSlVbVCb6xfjg/mfhk/kjWhLLCIqa3IDAlU4qbv8C7uxL+pCnp5RRUwiLA4UvS
	 w7pCHnK6Z8qWfpmbiS79LSw6NQpWNKBezHZf1M07wResMapZ+8rgUXXH00VjmMCKHq45m
	 L0fNKinku/y3nT7ARteY0Ar3uGxrJRwYex1XPy/emfbLoka9owCBwNMbjy+5jOtU1RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YBFNaX3C;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797CB606A320
	for <io-uring@vger.kernel.org>; Wed, 28 Oct 2026 16:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 797CB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YBFNaX3C
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6b19e291cc6so1104153eaf.2
        for <io-uring@vger.kernel.org>; Wed, 28 Oct 2026 09:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793206058; x=1793810858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JFjgbk6WFZbmlST+M0GxkdQvyngOIe62skUxbzNLCHU=;
        b=YBFNaX3CaTsTqfPcWa2EXTYjxSvYt+16lbpbvDOjMcXh4LugtpPb2gWzYrohLIEQPy
         gI+C2mc65YfOYd4jl4HY4tt6Nbfo9EN9MZrfu/yP4sJVBytOAtg/x5PIbpdd+BOW6nd/
         vqMZlbqTQWynx7EvlgOc/qHjual75Zp22FZbIqnnzT0d34WW4Eydw0GKuo6rF9MaMlJi
         dmSKOnPxppSSfzMAah0v2QAi0/FCiQjS5DLKEsQHH7fJ8ZZvvWF6nRNEPTEHG+h/lALc
         +Z8mirw+b8UGeNL4LqUM9ie13StCZBJ8EFX6Wr/L9jWxbfw7aJElqhKu8/hRfABMLZ4i
         gUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206058; x=1793810858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JFjgbk6WFZbmlST+M0GxkdQvyngOIe62skUxbzNLCHU=;
        b=vkDr3xC3jLFmA1ikZvoAF0n5zMpXyaaNIpCwb+EIGsernuc2I8w3Bywdv1L6GZjZ9W
         FUgQ7FYpVizPjP432cLCM8NljomXuqnn7XhGc+NEJ6bQI11q0zIOb2CyohMERRUM8j0J
         k/mJgk3kRvL/KlaLgVC9RjdpH/H7q8YbFTWF3YZT8wR14X1AqHz+DYgMvL5sywNie9s/
         N2Z4IlnqcJFmWwDV3/O3j4nCqQveu+X89jm1BrYmLdxWXdQ3P0jVE0kLhW+Shnseu5lS
         wOv4/o/nAXmdh+fFtUFI3Mzj8lwn9z0GG7V4VXQOAsxLGQ+0RHM65mXADSwX7U9TNHHM
         p6fg==
X-Gm-Message-State: AFq9FYLOw9fPVBoATUwas4kSh/vZjEH267akkbNOLG7CmVU3nIc9KQyw
	7ZTjTRp/C4s1ZzExBlUzitTXvSCx5hUE6K7+gKkT+FzjRdY+lX2D0BShQeZPP64SVZLSUOzUxHm
	T7ebfawQ=
X-Gm-Gg: AYBFou0iAx/7i/BdMNaOpEf6nfEFTlNYeqq/+NsWQ2YzW1tLMwT3PRIxNP5d29GwY8C
	lMllcEglu/Epd9Xx6kMPep/i4axF3HmnMjmSh916lmQkcN/dz1zyohVa8chwhWbHk0Zvk6f+Yo0
	Tv3FT66C8tiy6ZF3U063Tw7qR+UDTxPWvdDTKLNJO1nSPPoye6n1/3TGDtjc5nZgRcbQEtocx+s
	o9RmKou160TZK4bLPxw0fLWQjgatcgKbaMkvSq0V4Vogw+JpDDS0sXxtWH8LTb2flQMypHOTmPr
	V5aS+22avd4JxaUeK9frwYtuL80IOklL1sDUh2o5PbwUIclhKoi4ucBNqkP35yVqNt/xYn+3e8L
	Tv1ykmt9tfmryi3EqFlw3X8kJ7/47VoZelzAes2W7o+UUP7DL3LOh2f6CJsWGodoBrRxqtVtv36
	2OuOtWxldZI1pfit1pwifjCKd3bE6nYSTZ9l+Kdb9X6nWyoUXSHky+YOIhnSEaZKWbIeXW1QM96
	DgsXznmJuwM69b78cFligd4zRzP95ml8+Wy91TtiVjA2U4Ev2tBSUPatTfX1hrxGPl1SGobNmPK
	aV/CS/9nIYmG8Hn94CsF3++jRW7DFM8YdTIE4YE89DRHWJeaW2O5eKBHL6FysolHpsHs0jS7laN
	YXNietkQBWfKlstkwbt8=
X-Received: by 2002:a05:6820:4c06:b0:70e:177b:eb53 with SMTP id 006d021491bc7-713edca578emr1749832eaf.33.1793206058436;
        Wed, 28 Oct 2026 09:47:38 -0700 (PDT)
Received: from xps16 ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b206f8a41sm2019182a34.25.2026.10.28.09.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:47:37 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: Chris Mason <mason@kernel.org>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 03/10] io_uring: charge tctx nodes and personalities
Date: Wed, 28 Oct 2026 10:46:51 -0600
Message-ID: <20261028164732.1264069-4-axboe@kernel.dk>
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

The io_tctx_node allocated the first time a task touches a ring, and
the XArray nodes behind tctx->xa and ctx->personalities, are plain
GFP_KERNEL. tctx->xa is indexed by the ring pointer, so nearly every
entry needs nodes of its own, and a task gets one entry per ring it has
used. 642 threads on 4000 rings held 2.3GB with 59MB charged against a
64MB memory.max.

Allocate the node with GFP_KERNEL_ACCOUNT and set XA_FLAGS_ACCOUNT on
both XArrays.

Fixes: 0f2122045b94 ("io_uring: don't rely on weak ->files references")
Signed-off-by: Chris Mason <mason@kernel.org>
Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/io_uring.c | 2 +-
 io_uring/tctx.c     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index e9c65cf0cc51..76de44a91a7b 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -271,7 +271,7 @@ static __cold struct io_ring_ctx *io_ring_ctx_alloc(struct io_uring_params *p)
 	if (ret)
 		goto free_ref;
 	init_completion(&ctx->ref_comp);
-	xa_init_flags(&ctx->personalities, XA_FLAGS_ALLOC1);
+	xa_init_flags(&ctx->personalities, XA_FLAGS_ALLOC1 | XA_FLAGS_ACCOUNT);
 	mutex_init(&ctx->uring_lock);
 	init_waitqueue_head(&ctx->cq_wait);
 	init_waitqueue_head(&ctx->poll_wq);
diff --git a/io_uring/tctx.c b/io_uring/tctx.c
index 466b7300e208..4dedcdc44780 100644
--- a/io_uring/tctx.c
+++ b/io_uring/tctx.c
@@ -104,7 +104,7 @@ __cold struct io_uring_task *io_uring_alloc_task_context(struct task_struct *tas
 	}
 
 	tctx->task = task;
-	xa_init(&tctx->xa);
+	xa_init_flags(&tctx->xa, XA_FLAGS_ACCOUNT);
 	init_waitqueue_head(&tctx->wait);
 	atomic_set(&tctx->in_cancel, 0);
 	atomic_set(&tctx->inflight_tracked, 0);
@@ -123,7 +123,7 @@ static int io_tctx_install_node(struct io_ring_ctx *ctx,
 	if (xa_load(&tctx->xa, (unsigned long)ctx))
 		return 0;
 
-	node = kmalloc_obj(*node);
+	node = kmalloc_obj(*node, GFP_KERNEL_ACCOUNT);
 	if (!node)
 		return -ENOMEM;
 	node->ctx = ctx;
-- 
2.56.0

