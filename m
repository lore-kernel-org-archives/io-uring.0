Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD9E489867
	for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 15:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141327; cv=none; b=ewQavUENBMFPPHI519QPgJwrAHa5slzX06YcVt0dBkYaSuuKtCRLsKFzb8JMJ74n1uLic9letg4G6aW4tQa0/DXJQlEzsH43JJDBhGBmjz5Y+CMiyosmYa/v5QZpnwyW3jNLlqN1D8928NkebJsSptfEwCIuYikTLTtaMHZqsOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141327; c=relaxed/simple;
	bh=0NwaKUmf44Ot+C4Vhin0K2ohE4gDm+QbMEeRlNNgATA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eUUlLjQzz46oicempmRyBoVMzeMo8iAXPWj4BM1AEKjbgE0pQJcVHS7bYgTkp3IbxCuMtgpyKqkZgZGHO4z5R9Tq9R+KUZlvM1NPsM54IFN/uyjaQWFUgtz56QnLDvGQmoAi6ITQ/ww6wiwhn0zhugVb6ImCbJdVSijdPxnKRLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=g3tLiZG9; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="g3tLiZG9"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-805453b1c0cso41513a34.1
        for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 08:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141324; x=1789746124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=26NN2voef8YBl9mHMwb0pP++w/F7eMXxYYY8spi7/jc=;
        b=g3tLiZG9SIvwMgDaxYDCMXEg0m2r3sJqQ575QFWcccwf/+OP9S1ZkyTTDcBZ/GEeqc
         22T1hHUq7pVox3RSQf8p+jzX+ypj7E+ZgbYIlpQ/UvWonFGKC6qN6ydshnJTBrwK/DQ4
         IZcytgIsQHRVwafwNR7ULW8gKzl2NdfXAXjW5oFFaNWWUBenUu+2+Di/uEIQUhYtBJdH
         AsIACc1hFpYvv3bBqGhVuPl/jW+T86XefpKVdlgM01if0B3YcLaiIPzTCZTjhORT6aCW
         Tbs3BqGhwkfvp6iIeVdghIRzK670dVENUyFY0gfdmQq8X5a7cUcNLX1zHbonW1n69zrQ
         FORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141324; x=1789746124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=26NN2voef8YBl9mHMwb0pP++w/F7eMXxYYY8spi7/jc=;
        b=DQWiLop431i/z4UoJ4MgxHJxehgGuwIm0nP4l279OMeSmizVd0CbBkTOXlWHqi4bNI
         xIGwFEI8/Hfh0lplEuEeBs5HrVd5wg104r1j7++7r0pmt0R6SGqWFW7wXg9C2nEuPECh
         DdoJGVfgLEm6BD+GHcoyDN6eXN1rUJp6N3VyOAeh0gaKbfG4XsWx/JX/i8ldRyY9/khr
         M37iTem3oSTAcJSBeopdznn9t56yM/esVeJ6abynCURiOlwziGXedN21XTgv+bMg1jwW
         AwvqpOe/ofh11aUM8wqpSHtxQpC6ssM9fIKwQfzEWX2wSmuI3yn7mH/L7miWpZTrWJ8y
         l0Qw==
X-Gm-Message-State: AFuF++mjurEzMayVcajk41bLsY00zuebp/6TC2tEV73aWsDCzkF+J/Rq
	VWmavv1ICChkIiNCYre23LXmo0o5602ZEvWWKaLHSokfmWEJS+ICp2StfWGuJYw3nQhjkpMbfcm
	L9pAQxAA=
X-Gm-Gg: AYBFou2wk3L1Znu5H7LWgmFmDwTLTh6DJDwz8ZWa3SqaXPG1LW/vafsUan2BoK/eI1I
	tYozjAi6eXte4mPeukfvnJNJSJ9mKJPxfF6jfUBpv8FTtS+fuHzdUyvmTSevZgz35rQRANw62j9
	JJB/SIeL7Yydh62ufPNg/qQBfj1JZYYrS7Jzcg6a9HpYbuXNJlxJuGlM6zy+Q1tiXwX024dbq9B
	2OUs4k1eyN452kIhU7e53JEcUPGzQjxWuTNmcSZAU96Rid/8YfrXrPgZl/54CUT5F3m0oVguPIR
	3PgdhB0bX7ndSZD8hiIVF1zeT1l8IIqrCwNE70fVu14xrGG3+IYrLBLaJqwItDs/2HTgYZAHXqw
	mryb9KHUu94waVkSCyvMSfLzAT7zK5MJslYeMia2iGtriFme6kGmh/grwmauGf07twDTCNT9vPL
	qOTBkw9G9oFS8oJJdE0aYnK93325894IyMdz5Xt6vCHRNiNbIKUERqX7hOyiFd/RnojXvEIq3O2
	LSQUlb1QHBCR10gc3NT7tKmyDCUdthe70VHEtbe0OYT
X-Received: by 2002:a05:6820:2903:b0:6ba:3635:7ffd with SMTP id 006d021491bc7-6c0bde5bcd5mr3300243eaf.64.1789141323624;
        Fri, 11 Sep 2026 08:42:03 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c09690af1dsm2802199eaf.1.2026.09.11.08.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:42:02 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 06/15] io_uring: keep the tctx nodes on a list
Date: Fri, 11 Sep 2026 09:40:56 -0600
Message-ID: <20260911154148.644489-7-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911154148.644489-1-axboe@kernel.dk>
References: <20260911154148.644489-1-axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tctx->xa is indexed by the ring pointer, which makes it a deep and
sparse xarray. Iterating it with xa_for_each() is expensive, 12 usec
for a single entry in testing. Keep the nodes on a list as well and
walk that instead, lookups by ring stay in the xarray.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 include/linux/io_uring_types.h |  2 ++
 io_uring/tctx.c                | 10 ++++++----
 io_uring/tctx.h                |  2 ++
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/include/linux/io_uring_types.h b/include/linux/io_uring_types.h
index 39629ee77b91..4af3d579ead6 100644
--- a/include/linux/io_uring_types.h
+++ b/include/linux/io_uring_types.h
@@ -153,6 +153,8 @@ struct io_uring_task {
 	struct file			*registered_rings[IO_RINGFD_REG_MAX];
 
 	struct xarray			xa;
+	/* the nodes in ->xa, for walking without the xarray lookup cost */
+	struct list_head		node_list;
 	struct wait_queue_head		wait;
 	atomic_t			in_cancel;
 	atomic_t			inflight_tracked;
diff --git a/io_uring/tctx.c b/io_uring/tctx.c
index 466b7300e208..737dfad4a976 100644
--- a/io_uring/tctx.c
+++ b/io_uring/tctx.c
@@ -105,6 +105,7 @@ __cold struct io_uring_task *io_uring_alloc_task_context(struct task_struct *tas
 
 	tctx->task = task;
 	xa_init(&tctx->xa);
+	INIT_LIST_HEAD(&tctx->node_list);
 	init_waitqueue_head(&tctx->wait);
 	atomic_set(&tctx->in_cancel, 0);
 	atomic_set(&tctx->inflight_tracked, 0);
@@ -135,6 +136,7 @@ static int io_tctx_install_node(struct io_ring_ctx *ctx,
 		kfree(node);
 		return ret;
 	}
+	list_add(&node->tctx_link, &tctx->node_list);
 
 	mutex_lock(&ctx->tctx_lock);
 	list_add(&node->ctx_node, &ctx->tctx_list);
@@ -227,6 +229,7 @@ __cold void io_uring_del_tctx_node(unsigned long index)
 
 	WARN_ON_ONCE(current != node->task);
 	WARN_ON_ONCE(list_empty(&node->ctx_node));
+	list_del(&node->tctx_link);
 
 	mutex_lock(&node->ctx->tctx_lock);
 	list_del(&node->ctx_node);
@@ -243,11 +246,10 @@ __cold void io_uring_del_tctx_node(unsigned long index)
 __cold void io_uring_clean_tctx(struct io_uring_task *tctx)
 {
 	struct io_wq *wq = tctx->io_wq;
-	struct io_tctx_node *node;
-	unsigned long index;
+	struct io_tctx_node *node, *tmp;
 
-	xa_for_each(&tctx->xa, index, node) {
-		io_uring_del_tctx_node(index);
+	list_for_each_entry_safe(node, tmp, &tctx->node_list, tctx_link) {
+		io_uring_del_tctx_node((unsigned long)node->ctx);
 		cond_resched();
 	}
 	if (wq) {
diff --git a/io_uring/tctx.h b/io_uring/tctx.h
index 76ad1ad4594e..9a139816ce4f 100644
--- a/io_uring/tctx.h
+++ b/io_uring/tctx.h
@@ -2,6 +2,8 @@
 
 struct io_tctx_node {
 	struct list_head	ctx_node;
+	/* on tctx->node_list, only ever touched by the owning task */
+	struct list_head	tctx_link;
 	struct task_struct	*task;
 	struct io_ring_ctx	*ctx;
 };
-- 
2.55.0

