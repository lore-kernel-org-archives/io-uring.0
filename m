Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443021;
	b=emE238OMDyRqjLvYFkpncylPtAAzs4Ab4vtX1xnIl2q0CUfuTpJ0fuDjHYWSxViCCArY
	 3RGzIJhecm8Q+ITy0eFnGAeqrhcRvgel3R5cDH/dRJgpynIva5Mx5HM97SdGWqErZnjan
	 fcs4snmBy9PBpwTG6e9iPTZ0u5AaQaB+ySVticfoBuTo9e2b4RsPv3D84WGWA5rNhGrrb
	 RqB+X0zihCdy3vep4wzQZrgeRRN9qPNqBElYmRS7mN0546BVOi6mbsp1AKQ8yDewP9ADz
	 SrP/7UgZb41MjIo4MT3RPzyCHzoRInXRh5lDX2NBWUrM45Ee8QeWMWgirV8Rr02yENQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=OCP6FBVbnzCPqRIrU0U84NczO5QojCNnRh7oxcvyJVc=;
	b=ZGHroAnS8OQGIFs+niafzo4y197grUtyEHzqhc6N5cU5uqrPoHcDq7EIELdE1PKmPP/Y
	 zdB5UE1U3ktYNp4yIL4AKAss6vu4M1G9YZilmk4ZyLgoOmiIZxnhjrZVTA0kcn5DkE0bB
	 IitR2L3VwyrhIxL1DM3fFeHQJ0fvzLLVlxacqouTUAVdrx3KBFaaz5ekaQ8MI6bmUQLb6
	 i/Z2AVd6oantHsk3HMq6BlJY56sdCK14h9kvH+j9m+dqsui/ctnwAMMd+/e7T1OLfaw6Z
	 Uh9JVBa8RJKr8D5CMvLz9zUoVSTncdZFGl85lWCZtDpzDGYPJANNH6YcMeUpjKNjmEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=D2qI8ybo;
	arc=none smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2C0606A330
	for <io-uring@vger.kernel.org>; Mon, 19 Oct 2026 20:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F2C0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=D2qI8ybo
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-4a6f2825dd6so544160fac.2
        for <io-uring@vger.kernel.org>; Mon, 19 Oct 2026 13:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792443019; x=1793047819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OCP6FBVbnzCPqRIrU0U84NczO5QojCNnRh7oxcvyJVc=;
        b=D2qI8ybojJaYnKrA4OFIxtEcVB3pWIt4dCIyUVr5sblRAQ3c+gyI+n5e7cCuoQOmMV
         5Qt1xJdb5+ZCjFNyXmSf7Fkv86rA32zHk14hov8mZmlQCFz5G3Bs1KKis8+/VxXJDOFf
         gLJnRytXa7VjK62P6U2/LHUd/RQ+bwomWsygAN4ZDXrCi9fFB9Guni6NaBiTVjk2Hyzq
         F2rmoW4E7u4OflDaVKvfuTCTKky8ZMs8naDLs23J11TysPlGDtHa98qy8u6QltP2qU37
         H/0bSTkAIHfpSZnj1tmERaUr0jNO5Xg+4o7cdXvRFUAAFbtWQimySJferJVJnEyzTcZA
         Pi9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792443019; x=1793047819;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OCP6FBVbnzCPqRIrU0U84NczO5QojCNnRh7oxcvyJVc=;
        b=ATd300fRe1HNkqVhbiGpk0X2/ZzzNcpZ1YuywUStNz7dnnilB4MlO1AvtGMJwQopMM
         SMLbhAGBQNStpHjsIJwVsbKv0uc03LWWyYtdkM62qcozSR52FLknF4rqvG22UzQlbbzT
         ETuatZtDw9qxi3nJBLpWkInBSJX7yLhrGkJ0rsXd+wXYdimN9exHVMn30EjisO4cin57
         OyPsH0wvHeTHO2rnKAYT7dMzZPr3Hb+YQWQOwJmitbY/BtMb72/hSNvJjR84bsyRgfKA
         xqPhWoA/9Pcdvi6ahLg4UC7Lfw+zGVqADkfLCicGwaC5rO0d/5VRQ4t6RAgqvnCNp3s8
         IQpg==
X-Gm-Message-State: AFq9FYILCuVtXdym+jzdQTBabcu11L0sU5DdTzLBk6L28Bia9SXNnS0S
	OJiHZVJH66e3k/TZhg0cqPK9LV53MrytJn5YdBMMJOsjfHl2t7L8Otj84c5frHouLbzKCAu5xae
	1/6Gl3yk=
X-Gm-Gg: AYBFou1/hoI7jgHZ/J8YFMcXOZOVDwCChsPHpj/jk+vDJuCEfupuuXQ7/rdTcU7DCIv
	3v6qBnxPH2Bwnj3kqBMMy9uu8GIvUa7xdubr+4OCMwLKfMIQeYGT0Hd1M4mMFaMzuhEdFILubFi
	uJ0bG3K31sZV5PTgon7sjkkkaDspOzJ+z2aBX2YBhH6XPNIQLgMxqGZWjEUa5esI7abJmWi3XxK
	W1MIpcMFLBKDouq2g/0+/ZL5rdJmNGPZSsUiYeIbEbdxrYWDtoi2vipSy2GUrRcdAH+Cmso/hqq
	A1xCC1G5FOMb7G3wIsns668cUGec+fBdt6lKcjuLmDFNpVsx+72d1bNGxTJxTkIS8Zp4bue2MhN
	YltzOVhSaNa9WXKgeAacIA9G8ls7Cp4Qq1QIrJkNMaFvyaXUAA/tg3mxPrLafG0hLdSCEbk3Jzb
	qWKoMsEUdVwo5K43gwPXiKEy0AjlQYELrOzCEGc4RFDlSJY0AGUMoHtVSucc6j2utlx/V6i5MyJ
	xTwNJS+ytc3jsNb5HvMnnWsFatQXuyyvDX/d0VHb82GbrIkHsGf+ws=
X-Received: by 2002:a05:6808:181b:b0:4c2:5ac:7f9e with SMTP id 5614622812f47-53cd120291bmr6982795b6e.43.1792443019392;
        Mon, 19 Oct 2026 13:50:19 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388f6ed365sm8270131b6e.16.2026.10.19.13.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 13:50:18 -0700 (PDT)
Message-ID: <ae73d8b4-c2b9-4a9c-adca-8c995ac92975@kernel.dk>
Date: Mon, 19 Oct 2026 14:50:16 -0600
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring: clear IO_RING_F_DRAIN_ACTIVE on drain
 completion flush
To: Wei Gao <wegao@suse.com>, Pavel Begunkov <asml.silence@gmail.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261018070154.16944-1-wegao@suse.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261018070154.16944-1-wegao@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/18/26 1:01 AM, Wei Gao wrote:
> Fix:
> Make io_queue_deferred() return a bool indicating whether any drain
> request was active or deferred. In __io_submit_flush_completions(), track
> whether any completing request had REQ_F_IO_DRAIN. Clear
> IO_RING_F_DRAIN_ACTIVE only when a drained request has completed
> (has_drain), no drain was active or deferred (!drain_dispatched), and
> ctx->defer_list is empty. This prevents premature clearance if an
> unrelated completion flushes while a drain request is still executing
> in io-wq.

Didn't quite feel right to me, below is with some LLM assistance
to try and get to the bottom of it.

Thanks for digging into this. I don't think it's just a race with a
slow io-wq free, though. DRAIN_ACTIVE is still set when the next request gets initialized, so it's forced async and goes through the defer list
every time, even if the drain request is freed in time.een read.

Basing the clear off any REQ_F_IO_DRAIN request in the flush is not
enough:

- A drain request marked REQ_F_REISSUE counts as has_drain, but
  io_free_batch_list() punts it back to io-wq in that same flush. With
  an empty defer list, we clear DRAIN_ACTIVE while the drain is still
  pending.

- A second IOSQE_IO_DRAIN request that fails init after io_init_drain()
  has run gets completed via io_req_defer_failed() right away. If that
  happens while an earlier drain is still running in io-wq, we end the
  drain, and the next request is issued before the earlier drain
  completes.

It also only works if the drain request completes through the flush.
Without DEFER_TASKRUN, io-wq posts the CQE directly from
io_req_complete_post(), so the application can see the CQE and submit
before anything clears the flag.

A drain request dispatched from the defer list always runs alone, so
we can just remember which one it is and end the drain when its CQE is
flushed, and have io-wq complete drain requests via task_work so that
happens under ->uring_lock. Something like the below. Can you give it
a spin with your reproducer?

diff --git a/include/linux/io_uring_types.h b/include/linux/io_uring_types.h
index 7c5d99a8f75d..2e5a786f2a2a 100644
--- a/include/linux/io_uring_types.h
+++ b/include/linux/io_uring_types.h
@@ -524,6 +524,8 @@ struct io_ring_ctx {
 	atomic_t			poll_wq_rcu_pending;
 	struct list_head		defer_list;
 	unsigned			nr_drained;
+	/* drain request dispatched from ->defer_list, until it completes */
+	struct io_kiocb			*drain_req;
 
 	/* protected by ->completion_lock */
 	unsigned			nr_req_allocated;
diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index e6569c204917..8ffe0c9a4e29 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -480,6 +480,9 @@ static __cold noinline void io_queue_deferred(struct io_ring_ctx *ctx)
 
 	lockdep_assert_held(&ctx->uring_lock);
 	__io_req_caches_free(ctx);
+	/* nothing outside of ->defer_list is alive */
+	if (ctx->nr_req_allocated == ctx->nr_drained)
+		ctx->drain_req = NULL;
 
 	while (!list_empty(&ctx->defer_list)) {
 		struct io_defer_entry *de = list_first_entry(&ctx->defer_list,
@@ -491,6 +494,9 @@ static __cold noinline void io_queue_deferred(struct io_ring_ctx *ctx)
 
 		list_del_init(&de->list);
 		ctx->nr_drained -= io_linked_nr(de->req);
+		/* it runs alone, track its completion unless it's a link */
+		if ((de->req->flags & REQ_F_IO_DRAIN) && !de->req->link)
+			ctx->drain_req = de->req;
 		io_req_task_queue(de->req);
 		kfree(de);
 		first = false;
@@ -980,9 +986,11 @@ static void io_req_complete_post(struct io_kiocb *req, unsigned issue_flags)
 
 	/*
 	 * Handle special CQ sync cases via task_work. DEFER_TASKRUN requires
-	 * the submitter task context, IOPOLL protects with uring_lock.
+	 * the submitter task context, IOPOLL protects with uring_lock. A drain
+	 * request ends the drain under uring_lock as its CQE is posted.
 	 */
-	if ((ctx->int_flags & IO_RING_F_LOCKLESS_CQ) || (req->flags & REQ_F_REISSUE)) {
+	if ((ctx->int_flags & IO_RING_F_LOCKLESS_CQ) ||
+	    (req->flags & (REQ_F_REISSUE | REQ_F_IO_DRAIN))) {
 defer_complete:
 		req->io_task_work.func = io_req_task_complete;
 		io_req_task_work_add(req);
@@ -1185,11 +1193,33 @@ static void io_free_batch_list(struct io_ring_ctx *ctx,
 	} while (node);
 }
 
+/*
+ * The dispatched drain request ran alone, and anything submitted after it was
+ * deferred. Once it completed, new requests may run if nothing is waiting.
+ */
+static __cold bool io_drain_req_completed(struct io_ring_ctx *ctx)
+{
+	struct io_wq_work_node *node;
+
+	__wq_list_for_each(node, &ctx->submit_state.compl_reqs) {
+		struct io_kiocb *req = container_of(node, struct io_kiocb,
+					    comp_list);
+
+		/* a requeued request hasn't completed */
+		if (req == ctx->drain_req && !(req->flags & REQ_F_REISSUE)) {
+			ctx->drain_req = NULL;
+			return true;
+		}
+	}
+	return false;
+}
+
 void __io_submit_flush_completions(struct io_ring_ctx *ctx)
 	__must_hold(&ctx->uring_lock)
 {
 	struct io_submit_state *state = &ctx->submit_state;
 	struct io_wq_work_node *node;
+	bool drain_done = false;
 
 	/*
 	 * Drop the files before the CQEs are posted, so they're released by
@@ -1224,13 +1254,19 @@ void __io_submit_flush_completions(struct io_ring_ctx *ctx)
 	}
 	__io_cq_unlock_post(ctx);
 
+	if (unlikely(ctx->int_flags & IO_RING_F_DRAIN_ACTIVE) && ctx->drain_req)
+		drain_done = io_drain_req_completed(ctx);
+
 	if (!wq_list_empty(&state->compl_reqs)) {
 		io_free_batch_list(ctx, state->compl_reqs.first);
 		INIT_WQ_LIST(&state->compl_reqs);
 	}
 
-	if (unlikely(ctx->int_flags & IO_RING_F_DRAIN_ACTIVE))
+	if (unlikely(ctx->int_flags & IO_RING_F_DRAIN_ACTIVE)) {
 		io_queue_deferred(ctx);
+		if (drain_done && list_empty(&ctx->defer_list))
+			ctx->int_flags &= ~IO_RING_F_DRAIN_ACTIVE;
+	}
 
 	ctx->submit_state.cq_flush = false;
 }

-- 
Jens Axboe
