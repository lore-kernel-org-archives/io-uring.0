Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632289;
	b=4X70uWLW+NIFugScRPrxwdNsP2pLhazvPsyC0RlsrZhkmQkR12oThrPlkfYu6bvr6NBB
	 9o+MrdRF+wQ6egA5wa9A2C0RFzFYUWaxWnTYYlrn2Psr3AEMbpgWjwuEkPCyWbIXbOFQb
	 cgwu0EVrBCOmd2SXJNGczHuZmKm3J3zars2oGABolYNDlL+LiJ2st1YxRrisQKhl0wwb5
	 bs7UKLhqOD5vMgilRrwxlRUNU5movSq362JHvXfwADD4Gm+2gdbkpt5qUZlGMR9Yf0+XV
	 7x4v2iF6kkAFV9YVZCe48akC1DneMfDd7dSQ6a1ZA0G6zi2BiDpSE2+HV85RvlIwMNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+jt43aRnoR3s9JtmS/DSQiBRC/KMz48ENkJFrckz6oQ=;
	b=UC2PEdeHtMeXfphz2fYJNk/ytpT9JLZpkDChucsGIEuxoe+G+DUr86MbP/tn3/EgDcxA
	 1ZSWroEzv5euSQ4YgAKbAabHXR6YIZxGeayfc6qcnfTguG5yvoMXh/kjilqh1DqYCWaJa
	 Dft398uXheh0qU1wnpJMwqljNMpbXccIX9pGc2BvQrwPpQxcOSCyqWIoPGbOpF1zeXRV7
	 Zdi5N9YeqIK7Cbhs/aRZ3rfVK4Ht+t35ms8YlwWoVzqREq8bKnGJOs/K2OYAGLd87k8GQ
	 x42tWr8tVpD3iRKf6ECvQGf/5lK+p5e5FHipEccDMr9ptIRpfkEYDvXcYprBupmGQvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=xaig7rpW;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D7F606A31E
	for <io-uring@vger.kernel.org>; Wed, 25 Nov 2026 18:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6D7F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=xaig7rpW
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-71b30ed75a1so3552019eaf.0
        for <io-uring@vger.kernel.org>; Wed, 25 Nov 2026 10:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795632288; x=1796237088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+jt43aRnoR3s9JtmS/DSQiBRC/KMz48ENkJFrckz6oQ=;
        b=xaig7rpWhigtPkhpsWuQMuy5nic+N40aZhzNUS0FPRJvDScqjJMFVKughtFM/ldwIa
         RJtM3X3+GsoBLlhCYticmxgx1V/1skvQmrfMM2yf1ZJrfDmv1Bp3WBbUz7ydvqj17yl6
         nmpvDAoNPKXQF54+uI2/BkSlaN5TX7IX06hgJRBHYKXw1zbgjsWU9OYANXMP2OzLzwdG
         jFJufUz1yWYUJDQ35IAQSbv+ydw/WqYcJfThrIE2bgXV+iDofzDKWg6LOclNMReFrHRN
         lxk9L0cGI+iLVOVxYoXLsVDgllLinZ/QRJ0BJW8+Jxjl9YyQ5L6FnDTGwTd+on5fTLWm
         MDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795632288; x=1796237088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+jt43aRnoR3s9JtmS/DSQiBRC/KMz48ENkJFrckz6oQ=;
        b=Qf0b6kg0CQWSbwpEUOy4wNSqUoZem+Pw9uHKw/GFntWu1IM5Zf9ZF0IsEk5fnfcmWY
         FkmDrPm7retjYl+at2gp97xmXfA89G1XFOtbVvGq2t8eLBaGlayyu5Gl01qHAR+y2SZK
         V9TY9nrtndPFpl9INp9KrRUTVeSvMomU5GOC4QAe0k6+RoSuGrlIitSp597w5ynGjY83
         RF2zIC9fNtJW5Fy0vXRobVxo+G5vzb/8eG0sugGfqrhRnaCsX1KDUM5kiBcct6o+vDaj
         B8OM3VVPxjZY+zFvuO92lqwWO5Qu71V/iHZdegpPF/CP1soH5nzRY8JtaxRz9+Cjcs+x
         +sjQ==
X-Gm-Message-State: APuU4Z/f7EAb1ubolwT3LIrktLGNIOIxGr+Lu0hdCgSrWgT5XDBjnGku
	9rrPgcsGTnVlaK1gblxvk0QE9FNYelqHp/VJRD0PUhnEJRZrjt6pkmPnpBlkNzyd3wALoF4338o
	HuAFoGl4=
X-Gm-Gg: AZFdTZf64PFIKDgAWc0HvmlfMupWkHT7dOMYGxj8v9MJ/i9eSdGRmAlavZNdp5RFtpv
	8ThyKzUNmkOdcCb5QoO0ufRsb/3NyzbG9dSZmjvm1WIq+l6Nz0gRLbql7w0lFyhAaHe02gyTTsP
	/kQ4jt4zkf4Ri6tt15BQa9nJ9/SEu1ZVJTcz1Pzt8Xv5mdBKjI6+ImOFyYixD+wfmSSnYYMU5bo
	tchOaHVYSMhbf90uH0lT+d6Ytf3PqwvNFRv/kqmlNpjXemKuh297IoYd+Sk8VmtgKNxhgZKkNXf
	G/Kk2ZfjbsEO4c719matMj8AcnE556xrQ8DHSpFlkkrDYayEvWo4xsgIewi2TLXL8q1ucsiUxg9
	Zr16uvE6+pfY1sjTZDydnQewuv0kaD5csOL0IeteEWDlgaxcPPz8/dbQu5TtPWIQirmNpKVBMgi
	XwXxKqQ5eqHKLc/bg+dg1t466y2aiMutUO/VGYCxCP6rkxMIHuDI/PvDVeZ7bI1+c+NpZ2tSGr8
	2lIU/eto0C/xL/nGMyF8QtLKeeZwTuDwVCzMnDBeiFLMzQNDOcEjjvaeRybJh84YCDvjaYe2Em2
	akTGZgjSlCkGAKVths50R/Ca50/krPS35s7hf3NTDCmbO0+g8HYG+GZMWzHPUKMXeuM22v68zTw
	OEUSaq1gY03w/iXCqs7+vJdtBbihVVXOlUeY=
X-Received: by 2002:a05:6820:1614:b0:71b:8345:c243 with SMTP id 006d021491bc7-71b8345e15bmr1318857eaf.41.1795632287876;
        Wed, 25 Nov 2026 10:44:47 -0800 (PST)
Received: from m5pro ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b37c52ae6sm12332828eaf.0.2026.11.25.10.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:44:47 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 04/10] io_uring: free the ring from an RCU work
Date: Wed, 25 Nov 2026 11:43:13 -0700
Message-ID: <20261125184439.58077-5-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261125184439.58077-1-axboe@kernel.dk>
References: <20261125184439.58077-1-axboe@kernel.dk>
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

The ring is currently freed in two steps: a synchronize_rcu() in
io_ring_exit_work() for DEFER_TASKRUN and SQPOLL rings, which pairs with
the RCU read sections in the task_work add paths, and a kfree_rcu() of
the ctx itself, which pairs with the one in io_uring_del_tctx_node().

The kfree_rcu() alone can't replace the synchronize_rcu(). The task_work
add paths also look at the ring memory (->rings and ->rings_rcu, for the
SQ flags) and at ->submitter_task, and io_ring_ctx_free() releases both
before it gets to the free of the ctx.

Instead of waiting for a grace period in the exit work, queue the whole
io_ring_ctx_free() as an RCU work, and make its final free a plain
kfree(). That is process context, as io_ring_ctx_free() needs, and
everything it tears down now happens after a grace period. This covers
the readers in the task_work add paths for all rings, and the unlock in
io_uring_del_tctx_node(), and removes both the synchronize_rcu() and the
rcu_head in the ctx.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 include/linux/io_uring_types.h |  4 ++--
 io_uring/io_uring.c            | 23 +++++++++++++++++------
 io_uring/tctx.c                |  2 +-
 io_uring/tw.c                  |  2 +-
 4 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/include/linux/io_uring_types.h b/include/linux/io_uring_types.h
index 1b85872bb7ea..7a835113eac3 100644
--- a/include/linux/io_uring_types.h
+++ b/include/linux/io_uring_types.h
@@ -517,8 +517,8 @@ struct io_ring_ctx {
 
 	/* ctx exit and cancelation */
 	struct work_struct		exit_work;
-	/* the ctx is freed after a grace period, see io_uring_del_tctx_node() */
-	struct rcu_head			rcu;
+	/* the ctx is freed after a grace period, see io_ring_exit_work() */
+	struct rcu_work			free_rwork;
 	struct completion		ref_comp;
 
 	/* io-wq management, e.g. thread count */
diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 06ff99921871..6808229edf07 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -2368,7 +2368,15 @@ static __cold void io_ring_ctx_free(struct io_ring_ctx *ctx)
 	xa_destroy(&ctx->io_bl_xa);
 	xa_destroy(&ctx->hpage_acct);
 	xa_destroy(&ctx->personalities);
-	kfree_rcu(ctx, rcu);
+	kfree(ctx);
+}
+
+static __cold void io_ring_ctx_free_work(struct work_struct *work)
+{
+	struct io_ring_ctx *ctx = container_of(to_rcu_work(work),
+					       struct io_ring_ctx, free_rwork);
+
+	io_ring_ctx_free(ctx);
 }
 
 static __cold void io_activate_pollwq_cb(struct callback_head *cb)
@@ -2660,11 +2668,14 @@ static __cold void io_ring_exit_work(struct work_struct *work)
 	spin_lock(&ctx->completion_lock);
 	spin_unlock(&ctx->completion_lock);
 
-	/* pairs with the RCU read sections in the task_work add paths */
-	if (ctx->flags & (IORING_SETUP_DEFER_TASKRUN | IORING_SETUP_SQPOLL))
-		synchronize_rcu();
-
-	io_ring_ctx_free(ctx);
+	/*
+	 * Free the ring after a grace period. This pairs with the RCU read
+	 * sections in the task_work add paths, which look at the rings and
+	 * the submitter task, and with the one in io_uring_del_tctx_node(),
+	 * which may still be unlocking ->tctx_lock.
+	 */
+	INIT_RCU_WORK(&ctx->free_rwork, io_ring_ctx_free_work);
+	queue_rcu_work(iou_wq, &ctx->free_rwork);
 }
 
 static __cold void io_ring_ctx_wait_and_kill(struct io_ring_ctx *ctx)
diff --git a/io_uring/tctx.c b/io_uring/tctx.c
index c6b7f5647f79..508a72fdfc1b 100644
--- a/io_uring/tctx.c
+++ b/io_uring/tctx.c
@@ -231,7 +231,7 @@ __cold void io_uring_del_tctx_node(unsigned long index)
 
 	mutex_lock(&node->ctx->tctx_lock);
 	list_del(&node->ctx_node);
-	/* keeps the ctx until the unlock is done, see io_ring_ctx_free() */
+	/* keeps the ctx until the unlock is done, see io_ring_exit_work() */
 	rcu_read_lock();
 	mutex_unlock(&node->ctx->tctx_lock);
 	rcu_read_unlock();
diff --git a/io_uring/tw.c b/io_uring/tw.c
index b4a9e28ce779..41b3b9422d41 100644
--- a/io_uring/tw.c
+++ b/io_uring/tw.c
@@ -184,7 +184,7 @@ void io_req_local_work_add(struct io_kiocb *req, unsigned flags)
 	struct io_ring_ctx *ctx = req->ctx;
 	int nr_wait;
 
-	/* pairs with synchronize_rcu() in io_ring_exit_work() */
+	/* pairs with the grace period before the free in io_ring_exit_work() */
 	guard(rcu)();
 
 	/*
-- 
2.55.0

