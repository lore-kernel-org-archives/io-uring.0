Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC22557C707
	for <io-uring@vger.kernel.org>; Wed,  9 Sep 2026 14:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963030; cv=none; b=KNltBijv9dG8RvMQhyzrzED49Hn1558cyX+zCejuCd+aW4nHnSQM83J/eKhn42CizpmpxLt2VLWdeWN5RZ5KKvJ0mzCnGI6gXAJVGG3rlWajEBYvIOfyae3v8svTK8tgNV92naXy8kq2dYdNdU2WHYk/fKbXeygnPXMyBfQhiC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963030; c=relaxed/simple;
	bh=BR4zfM2XLenqlMniY/+QDooTlW9YVk7td4PxD/0sXrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b2DyDKUHIS8mn8LpwmNl9uAsh7gwKMG0Sl3GfYAsYKhe1rOPp1YNd1hUauLScPpDkbD93xLcuZVb54HLwc+/nytbV7m7I8BybiS0NgJtuIgyJGulU2jaIZJsnBg8x7CEFHulcRESmYC+MQ1ff2fwIkX2VFtf9oFVNNg25z6j0qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=JvDyId5G; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="JvDyId5G"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-46f415ce6deso3192931fac.2
        for <io-uring@vger.kernel.org>; Wed, 09 Sep 2026 07:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1788963028; x=1789567828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kn57hmHz1t2sHUZ7D07dRBfto1tRivt7B8Ue7L7snB4=;
        b=JvDyId5GSMuNCsZ04KlDP+MDibCWgryVHKMnO4Pw9+FU0OMH+/aVgfbHtktwUoERDz
         Mkr+it/7bBPe6JUMvt0QT8KUfxwcDq9WPUFaBl2hLbMEgO8O4Yy2jc4nJ14Kd1ricJbz
         rO9fcdDSHs+q2gd3FRxkEIl3JX8/BAiAx4Z3MBlKf9Y7ECtJHWfSbHLDCMZlJCjk03h9
         tcBKEv8alxH8tE04puSqtZEdFLE1KHgaC3OQgA9tlduUiYK0K+s9qQaNbllUITTH2T/9
         71/vI5civzRwTSsZiXiI1bIrysfeO+QSITj9EixX3p0TGwZiS4ryMfahL03VsLVy6KuL
         78mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963028; x=1789567828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kn57hmHz1t2sHUZ7D07dRBfto1tRivt7B8Ue7L7snB4=;
        b=OjXggF6vvTOcdpBhik69QPttmegWdYmpurNZNrb/sto/Lg4yoARbvCWmCyqiErvoD/
         QTsY8ysdP9Fxp2GiZvT5biFULJDcgcbXudBRuDY1RTkLmhjVVrJCZp2Ov05LXL1aIQ2O
         uJe5i5fo9ncOnDS4var3jxgZXsJQEDg+z4ZPsPrZ7D+lV9Qxvkpbq2OdYN0Y56dQBgwy
         TKvB87NHC4JN5wUfoFArvXeNaAkhdiP3AKWxgCJvV/n1W15EpDRVWmPeoaluv4hZm+Ql
         F4NbekMJ06ktdaRbMDBRs5rSyII/NBbmJVpI5oqejd8wC9NFxGcql0EfarqNaCYCgtoE
         H5DA==
X-Gm-Message-State: AFuF++lDP66SSwOxskVMKBNFEdkuCvWxlwg2VcQsD7FQr17NQliOTAW/
	D96sGasH9YX7Y6jCwps1p9EywB40ilAztZoP27UmiD2xsMEcM1gEKGnshYeYepzVRl1VetphD+3
	DMfiam+g=
X-Gm-Gg: AYBFou3lTxaOWui/Szup6bkDekShOImWC0eHmyqOqYQ7S/Vf9OnvvF6mh/2agXi1sol
	N82UnClf0u4r/xymP3tOs8sr9nkY+u8y1uEWo2qYAA8QWVSxMKSo/wEJho/Ek/JlSfVtTtmBtap
	t1EsQPf1nzBtVITtBwu/kpimXqAISZA0NXtWm8vAlZHhQmVVrlIffNn0KFwiMFqQm8VgEOQDFCb
	cZCzeWxCMPtjSrTm6u9udvNDx6i4zeJRmpjy03+pQqjNFUlcEQwUBHfRnVFlBWL1Vt8ub0bGBLn
	fHBAPIj71ofbcDh6Qegsv7mbPpIbEUqYCjc8YH3T59GPCZAzxKX/2lTSYM3ltvO4gBD+Xb+e7nw
	N83BFlo6ZWmpiV0MslBagKxh8Z9j/lMwvGE7hZnCofBXAel5waRMc34nfeKRDSTB09WKRlZoaiT
	txODjuNl2Fp5R6qDmezFFaGUA5e0/Z1JjLsr6aujjLii/8WXazd9FHvGE4OTG4bumbNZ0bmodOp
	7dElcpEHOXRfNAWF+e9qcqtKFPS17CzZynUrNSpsbdp
X-Received: by 2002:a05:6871:48f:b0:47c:2d65:8fca with SMTP id 586e51a60fabf-47c2d65a43dmr996824fac.0.1788963027603;
        Wed, 09 Sep 2026 07:10:27 -0700 (PDT)
Received: from m2max ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47a7585b25esm5406514fac.11.2026.09.09.07.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:10:25 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: juanlu@fastmail.com,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 4/7] io_uring: run cancelations synchronously on ring release
Date: Wed,  9 Sep 2026 08:06:14 -0600
Message-ID: <20260909141010.21064-5-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909141010.21064-1-axboe@kernel.dk>
References: <20260909141010.21064-1-axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

io_uring_release() just marks the ring as dying and punts everything
else to exit_work, including the cancelation of requests that are easily
cancelable right away Until that work has run, and the task_work it
generates has as well, those requests keep their files pinned. An
application that closes its ring and then expects the files it had been
using to be closed as well may be confused by this currently not being
the case.

Re-factor the cancelation pass out of io_ring_exit_work() and run it
directly from release, before punting the rest.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/io_uring.c | 82 ++++++++++++++++++++++++++-------------------
 1 file changed, 48 insertions(+), 34 deletions(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 3fc07d9f3eec..e98b6f1d4495 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -2306,18 +2306,18 @@ static __cold void io_tctx_exit_cb(struct callback_head *cb)
 	complete(&work->completion);
 }
 
-static __cold void io_ring_exit_work(struct work_struct *work)
+/*
+ * Cancel what can be canceled on a dying ring and reap what has completed.
+ * Only waits on polled I/O, never anything else.
+ */
+static __cold void io_ring_ctx_cancel(struct io_ring_ctx *ctx)
 {
-	struct io_ring_ctx *ctx = container_of(work, struct io_ring_ctx, exit_work);
-	unsigned long timeout = jiffies + IO_URING_EXIT_WAIT_MAX;
-	unsigned long interval = HZ / 20;
-	struct io_tctx_exit exit;
-	struct io_tctx_node *node;
-	int ret;
+	struct io_sq_data *sqd = ctx->sq_data;
 
-	mutex_lock(&ctx->uring_lock);
-	io_terminate_zcrx(ctx);
-	mutex_unlock(&ctx->uring_lock);
+	if (test_bit(IO_CHECK_CQ_OVERFLOW_BIT, &ctx->check_cq)) {
+		scoped_guard(mutex, &ctx->uring_lock)
+			io_cqring_overflow_kill(ctx);
+	}
 
 	/*
 	 * If we're doing polled IO and end up having requests being
@@ -2326,32 +2326,36 @@ static __cold void io_ring_exit_work(struct work_struct *work)
 	 * as nobody else will be looking for them.
 	 */
 	do {
-		if (test_bit(IO_CHECK_CQ_OVERFLOW_BIT, &ctx->check_cq)) {
-			mutex_lock(&ctx->uring_lock);
-			io_cqring_overflow_kill(ctx);
-			mutex_unlock(&ctx->uring_lock);
-		}
+		if (ctx->flags & IORING_SETUP_DEFER_TASKRUN)
+			io_cancel_local_task_work(ctx);
+		cond_resched();
+	} while (io_uring_try_cancel_requests(ctx, NULL, IO_CANCEL_ALL));
 
-		/* The SQPOLL thread never reaches this path */
-		do {
-			if (ctx->flags & IORING_SETUP_DEFER_TASKRUN)
-				io_cancel_local_task_work(ctx);
-			cond_resched();
-		} while (io_uring_try_cancel_requests(ctx, NULL, IO_CANCEL_ALL));
-
-		if (ctx->sq_data) {
-			struct io_sq_data *sqd = ctx->sq_data;
-			struct task_struct *tsk;
-
-			io_sq_thread_park(sqd);
-			tsk = sqpoll_task_locked(sqd);
-			if (tsk && tsk->io_uring && tsk->io_uring->io_wq)
-				io_wq_cancel_cb(tsk->io_uring->io_wq,
-						io_cancel_ctx_cb, ctx, true);
-			io_sq_thread_unpark(sqd);
-		}
+	if (sqd) {
+		struct task_struct *tsk;
+
+		io_sq_thread_park(sqd);
+		tsk = sqpoll_task_locked(sqd);
+		if (tsk && tsk->io_uring && tsk->io_uring->io_wq)
+			io_wq_cancel_cb(tsk->io_uring->io_wq,
+					io_cancel_ctx_cb, ctx, true);
+		io_sq_thread_unpark(sqd);
+	}
+
+	io_req_caches_free(ctx);
+}
+
+static __cold void io_ring_exit_work(struct work_struct *work)
+{
+	struct io_ring_ctx *ctx = container_of(work, struct io_ring_ctx, exit_work);
+	unsigned long timeout = jiffies + IO_URING_EXIT_WAIT_MAX;
+	unsigned long interval = HZ / 20;
+	struct io_tctx_exit exit;
+	struct io_tctx_node *node;
+	int ret;
 
-		io_req_caches_free(ctx);
+	do {
+		io_ring_ctx_cancel(ctx);
 
 		if (WARN_ON_ONCE(time_after(jiffies, timeout))) {
 			/* there is little hope left, don't run it too often */
@@ -2419,8 +2423,18 @@ static __cold void io_ring_ctx_wait_and_kill(struct io_ring_ctx *ctx)
 	percpu_ref_kill(&ctx->refs);
 	xa_for_each(&ctx->personalities, index, creds)
 		io_unregister_personality(ctx, index);
+	io_terminate_zcrx(ctx);
 	mutex_unlock(&ctx->uring_lock);
 
+	/*
+	 * Do the first round of cancelations upfront rather than leaving it
+	 * to to exit_work. Anything cancelable is then already on its way
+	 * out, and for requests owned by the task closing the ring, this
+	 * ensures any held files are put before close(2) returns.
+	 */
+	if (!(current->flags & PF_IO_WORKER))
+		io_ring_ctx_cancel(ctx);
+
 	INIT_WORK(&ctx->exit_work, io_ring_exit_work);
 	/*
 	 * Use system_dfl_wq to avoid spawning tons of event kworkers
-- 
2.55.0

