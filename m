Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905449;
	b=uEB1Ll7RewIvY+KAf6cbCKrgHGlbe50/u79Ka0wtNnrdsxi5ByCEyBDQIn4m+r1w1z0P
	 fQgjOHK9+gtjSWlkXXb/VUhagZWUzv1vsRBjF+oc9QP5zgUil7A3rMPDpoJC32ljc5Ux/
	 TOuOthmCFiY54sLYcXomQWfBPsJRcQzbsyQF03L/fTkf8hwGkkYSYYL9WL7Ml54bvFuV8
	 SorIo6J7/qsYC7si+0Gtay8S6AReRnw1DDqHrezRijXP3JhGYzq4g1jQdacf+RIBO5Y9Z
	 LagJeSn4km+cM4bl9h5TLNVeYvuv5Z+zv+1pF5xfsbbAmIOCF8uzWa+6ZsQ8NMghnbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0fkXrfPy3BaNhY2tRM825lAtXdeRpZqfswiAUDy5uKc=;
	b=P1HTHjdF1QCgx2ox3SBg/Pk0nm86VEcds25gnvc6sDHTIjuTFwO7zHZZlZC4Ulr8m+l7
	 B7Y8T8eHyNbYHWdxu+L2Zk6Kr32h3yxzGPF/YgrjoR3cNPSZqJ4qvG2Ord6c0pLaPDRQa
	 F9Ut+k782YUKrekqmNqag8487di4xwNnFSW/FyaGaUVGdBBY1B3lGjfpFO008vGQEGI6P
	 QqTh63mDg1qqNTgW/GfClmxvnz+itTZ++yGZmoxSAvCB3u+6TINRKWrzbCU5+zSckv4IT
	 Cwl/wX2IcWJPX2N8J8FSgO4CvHlxSFf+7GTMx+yB1SvgTQ95bYY3J7PUIn6YyYJsOPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CtVHR++P;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0E5606A338
	for <io-uring@vger.kernel.org>; Tue, 17 Nov 2026 08:50:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE0E5606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CtVHR++P
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdddc79a4afso1430454a12.1
        for <io-uring@vger.kernel.org>; Tue, 17 Nov 2026 00:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794905447; x=1795510247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0fkXrfPy3BaNhY2tRM825lAtXdeRpZqfswiAUDy5uKc=;
        b=CtVHR++PiF/zKaqArhbp8D7yfYXz4VNoBlKeIx/chEyYFfhFm4Fk6J+YjXLURHhDx6
         qMq1kNKCNk36QA+JnUde9AfnHUAmh+hIFf7wxeCCPb/x41aXYKNkvOSrpj15y0kegMhG
         UL3fzxhlWsPNmcYSRZmdiOrqqdwqdLYx9QjptcIfgivFDktJwaA/bfQQ9WXUs4PNWovl
         Ek2ELjFHpYZEdvb0lMjLQce71NwmRVAIx7BFd39/DQ2+mHRe9VJ9aaWHjxvYACU+/TFG
         RFPKvk+tj07JbXAC3FLUHwJkeoV8ruqq//B8DSv2JNcoWFPizZww7jKc1kIjGOkXhasm
         oa5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905447; x=1795510247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0fkXrfPy3BaNhY2tRM825lAtXdeRpZqfswiAUDy5uKc=;
        b=lrLtFjuNMvPU5/pE9X/NTQv6C2Pq3fYroODhT+zWGnBESy+zomgWIxoHHIXTCy3rBO
         Mm+zwwjiwmEajDL/XlKFG/ulxGQx+H6DHCayiSok3ecHYrYzL3y6kOF+5k8V3hZ4LPUY
         0pRePoo9z+dVKt2i7HweFIgFWsoralmhLgEK0wb9YU13z9GYUApK4/dsQ0BUSxSeLWXM
         rLvUbKfkoxxIP2BepajtTMi3a4+TGE/roGLSZW4Rt4FTex32l5sEAQis1mAHmL+BfXN7
         V0sp5kG7L4Rjw29d4JE3YgiyosEAWHOdlYl2HiaavbDuLwZg9CP/DboLxsfpWSJ5JXF8
         bh7w==
X-Forwarded-Encrypted: i=1; AL+hErF3l5FOpf+qUjqiMEji9SXlvnjNgIjaSL1f/DP6yabUSVh0ZNwB6ShU9eNhYHYNhS8yyJAIu+0Umw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/kvMgw0LJ5RgwQTURdP0MAPxuAOzO+AZcZoPY89MCyLlp+bRMt
	tSfM1BxzT1WMoP5NNOVabKQ8qrrI9uENSUfbJyNnpBMa4gu/JO47++aw
X-Gm-Gg: AZFdTZfl3YRV7LH+Qu6Vbxp60BSM0xiFV5qWTZjDWWuUdB8O5WbxFj+PWGGnTLYdsgc
	zv3kWIaQDryWrIbQrf0o9uhREmwJSYXw6XH9XPRYebEA6FUVNZP/knQJGsJEQehcN16alh8uWVz
	3bvQcGIRstvAlPLqHWVi6Buy0LLaUSMsSAKxxtcYlBWeQC8cjIXACPEB9f+I+Aq4k2bHJFfrA/e
	H0puqCC76TpG39FQygwChBEmk3BIDhbSddSt4l2Jjf/g77d3jApOpg+QcDthLMLzNNIFDMGMWly
	sDoosUcMFLDf5PXu+4Yw/kbXUrXBQLFh9xfNP2fE6ydZ2sHDfob350gHBBAR/lkcgK0S5Sz1jGx
	fheFX5IPy8oo+9ROAAlZaQdUT4Vz5xsBExi2fvLPkXKbJOvvZPwd800JQPSehLpBrfINC7L9Ysp
	nCsnmdtlT1xoH2JfSdoVyb11WkOvZZ7YmWzQmNzpMI0Tr5/b/iDfpDkEKe8ykWRUoFa7V6O5aW6
	dP0F21YofLd1JNpy4BS/Cv+zefGQV4bMjmy5fcx5jiq/wA9fsZp0OYWll2pxS0tvwPKvZy7fs8j
	3sfDBkCM+zw/uzhYI3rqzMH4qgRhC61+CTW2x0oVsreTCx/JJcrTfMGWYRatf2dJLItNG3tifv/
	l
X-Received: by 2002:a17:90b:2b4b:b0:3b3:c18f:d8e3 with SMTP id 98e67ed59e1d1-3b3c18fd9f7mr117575a91.20.1794905446882;
        Tue, 17 Nov 2026 00:50:46 -0800 (PST)
Received: from LDYT9Q2G2M ([2a09:bac1:7680:450::1c:35f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm3006240a91.5.2026.11.17.00.50.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 00:50:46 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	io-uring@vger.kernel.org
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] io_uring: clear IO_RING_F_DRAIN_ACTIVE when all drains have finished
Date: Tue, 17 Nov 2026 16:50:33 +0800
Message-ID: <20261117085033.98363-3-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261117085033.98363-1-zhiqizhangg@gmail.com>
References: <20261117085033.98363-1-zhiqizhangg@gmail.com>
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

io_queue_deferred() only sets ctx->drain_req for standalone drain
requests, leaving ctx->drain_req NULL when a linked drain request is
dispatched. If a non-drain request is waiting in ->defer_list behind
the linked drain:

  1. P0 in flight
  2. Linked drain [D0 (IOSQE_IO_DRAIN | IOSQE_IO_LINK), D1] queued
  3. Non-drain P1 (e.g. POLL_ADD) queued to ->defer_list
  4. P0 completes, [D0, D1] is dispatched with ctx->drain_req == NULL
  5. [D0, D1] completes and frees; drain_done stays false
  6. io_queue_deferred() pops P1 (non-drain) and empties ->defer_list

Because drain_done is false, __io_submit_flush_completions() leaves
IO_RING_F_DRAIN_ACTIVE set permanently after all drain requests have
finished. Any subsequent non-drain submission (e.g. a WRITE or cancel
targeting P1) is forced through io_drain_req() and deadlocks behind P1.
The same happens for a standalone io-wq drain request if its CQE is
flushed while P1 stays deferred awaiting the worker's final reference
drop, because ctx->drain_req is already cleared before the later flush
that frees the request and starts P1.

When io_queue_deferred() observes ctx->nr_req_allocated ==
ctx->nr_drained before dequeuing (nothing outside ->defer_list is
alive), all prior drains have completed and been freed. If the loop
drains ->defer_list without starting another REQ_F_IO_DRAIN request,
clear IO_RING_F_DRAIN_ACTIVE. That also subsumes the !drain clearing in
io_drain_req().

Fixes: ecb6817b769f ("io_uring: end the drain when the drain request completes")
Cc: stable@vger.kernel.org
Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---
 io_uring/io_uring.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 4e8b93a584b4..1fb2b9bb601f 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -498,11 +498,13 @@ unsigned io_linked_nr(struct io_kiocb *req)
 static __cold noinline bool io_queue_deferred(struct io_ring_ctx *ctx)
 {
 	bool drain_seen = false, first = true, drain_queued = false;
+	bool nothing_alive;
 
 	lockdep_assert_held(&ctx->uring_lock);
 	__io_req_caches_free(ctx);
 	/* nothing outside of ->defer_list is alive */
-	if (ctx->nr_req_allocated == ctx->nr_drained)
+	nothing_alive = ctx->nr_req_allocated == ctx->nr_drained;
+	if (nothing_alive)
 		ctx->drain_req = NULL;
 
 	while (!list_empty(&ctx->defer_list)) {
@@ -525,6 +527,9 @@ static __cold noinline bool io_queue_deferred(struct io_ring_ctx *ctx)
 		kfree(de);
 		first = false;
 	}
+
+	if (nothing_alive && !drain_queued)
+		ctx->int_flags &= ~IO_RING_F_DRAIN_ACTIVE;
 	return drain_queued;
 }
 
@@ -1473,7 +1478,6 @@ static __cold void io_drain_req(struct io_kiocb *req)
 	struct io_ring_ctx *ctx = req->ctx;
 	struct io_defer_entry *de;
 	bool drain_next = false;
-	bool drain;
 
 	de = kmalloc_obj(*de, GFP_KERNEL_ACCOUNT);
 	if (!de) {
@@ -1506,7 +1510,6 @@ static __cold void io_drain_req(struct io_kiocb *req)
 	if (unlikely(drain_next))
 		ctx->int_flags |= IO_RING_F_DRAIN_NEXT;
 	req->flags |= REQ_F_FORCE_ASYNC;
-	drain = req->flags & REQ_F_IO_DRAIN;
 
 	io_prep_async_link(req);
 	trace_io_uring_defer(req);
@@ -1515,8 +1518,6 @@ static __cold void io_drain_req(struct io_kiocb *req)
 	ctx->nr_drained += io_linked_nr(req);
 	list_add_tail(&de->list, &ctx->defer_list);
 	io_queue_deferred(ctx);
-	if (!drain && list_empty(&ctx->defer_list))
-		ctx->int_flags &= ~IO_RING_F_DRAIN_ACTIVE;
 }
 
 #define REQ_ISSUE_SLOW_FLAGS	(REQ_F_CREDS | REQ_F_ARM_LTIMEOUT)
-- 
2.43.0

