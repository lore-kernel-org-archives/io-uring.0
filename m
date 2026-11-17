Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905443;
	b=4UPih0IT6frB0hfETfzUaamVwW5uUyws7QMldC2ukcKMdSQG48YDJmgs0pEueFncES5S
	 3YiFCTyfEgPnvU+jK+BbfHi5hZ1NGFo6gqt2OeQ2500q9usgPaJqWpN03qPg6b1nmvKNO
	 LI1guJiX97TdGi8oy9qRfdDHJDojs20/JJB4h888udekUASGAuPbWAEjd/ZgpgbEQg/SZ
	 WERBIPj+CHXribEHtR7CQRsbNMC70Q8KNs4lkXEiOpoiYigA2+UrwfEMCqssl3we7MAp8
	 XZ8eL5VSA+HUTMOPlzKXaeh1kz5uIwBv8ITNYHD+VLFOY80Cy+gsP/fyHzKext30/Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=S8jiyJWvi6Hu7n3hQU2n9ckXcuveFbIRyC3veX49U9c=;
	b=NwieMzTRL5aNjZj57RTrgkLW2MOb5u8mC2+kuT8dfHByxscnn2trvGWfvWP2Uf4Q4FwJ
	 GUz2UrfI/jxPOnRboEHp4gy4j43LVbNsOyqSX7gSQVQLMT+dxjcr+Ep4RKKc5hgPCcWRA
	 jcFWz7uoHTmdjrHagkOCgfjmLcvDJH/g+nq86ttvIArtRiTStFstBxW+AmHVkf681zbB2
	 c17LC4AHiqYSybFmNeKvecbDol38mHTTXYIUpw3zIHUYS4z7rONpZuHqSqXrholrpWgQW
	 ytcRijYcjRhoAGQAoLHWdHYH8jXzCW07gpTajPkBdteB8f1aD5CRdDZXXJt7z4tKiAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gO5O9DeC;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC24C606A888
	for <io-uring@vger.kernel.org>; Tue, 17 Nov 2026 08:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC24C606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gO5O9DeC
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so2023108a12.0
        for <io-uring@vger.kernel.org>; Tue, 17 Nov 2026 00:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794905442; x=1795510242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S8jiyJWvi6Hu7n3hQU2n9ckXcuveFbIRyC3veX49U9c=;
        b=gO5O9DeCgd3HRuujgGdklYqnNTZWm54iRYZFen9tHeY8fw6CKfSGi96zr4Tyfyim1G
         ie9PLHQsc8JysuACVG+ot57kHX5W4W5PLnB3H73cV2YGjPCGPE5KZIvexKQSnR/DeLMo
         92bo7MzEW+bxsSiUzd7MP/C9GczoQv+Xf7LyVWWys7Qdc3RXgheM3WVJXQkivsAVALoz
         hBa9f7XoHOwr5ygSARcqN5YOVXmLZbOBs6ieJTIx2+8mohasemGWy5zMEODFLAYbzebO
         tEM6Rx+zXyhHzUBjr1i7iLvYNUP+8AagCzQUxGlwcLUrTemVe7qUnIRg/fj6f+V9r1rp
         fVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905442; x=1795510242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S8jiyJWvi6Hu7n3hQU2n9ckXcuveFbIRyC3veX49U9c=;
        b=wZkGe79I9+rIDLGIspJu+o9FugSxyhp6lenbUxTo+EwFtGM9jZCHuc/w2u0XvgKbEC
         RRxEmHlyU9EVlmyYdRfOyGNqrHtTn1ZPGh7dTwwXeod+C6CwRyx9CyqYSDcSKrJFFCYR
         J7nA4DXP0kikY11nzRwxABSIV5ZKL2mY3am9uehQBjev/beLlbxG+YXN3g/z8THKMqm6
         FV6g/6UYJWd2G5PF+ALVvvx2YcBNzAJLE6uUbryTakJRCCqd90vHObT/j/oJD/H0EBr3
         RTyKT4BiYkG/eDbK4QnV5uYYx/eRAozGYOeBrR1t7HhhtH8/rK9FLdkR9wyln1XAFCRx
         a4dQ==
X-Forwarded-Encrypted: i=1; AL+hErG7h2TVrLQk0UVP5J6qZc8zL/af973BZkqHAqsPsxkHIBhI8X+d5td/jtGoLzvgU7/5vq2j41EOAA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8tUkSLQ/7TVjkkBGH3p6fwBSlRQqWRsfqE9u8H7czxn/tKKzhU
	7iIUddBsjr6bLc1b70+YPPdwpj/Zp04wG45R6aUt/SvxzQ9XoxRjXdfM
X-Gm-Gg: AZFdTZd7bN1SIS4pjTCp06vsI4EzCSph1rxvl8qXD+u7ieTnENhCwtb4nM6Ex/UGYAZ
	qhWwAv7tdsti8SV5N1U8islt8dAWbRrKAEUVJuM3Ja8d0byrQDXllXCZo6cUhvDP/Zan5Hd3O03
	atQDORifCcmI4zcpS1HHVP0cFxEQ9xw+jFaYIANXprP59oLxcTWBmiln/eu2OCQYDIsyWRayWT3
	LXLDzhkiVf7QiBjCKB5X7kEXry8yDKXWK7Il55+3ad6zQdkOvsKxEbCjcq6bvHfdWXIt/8BHI0T
	ogPhkICetbVM7A/ny/SGQ1pIBiyF+xzAl6IbN/i5MICbKdpiMCKQwv1XsMod2c6RIG2jVbMq4yw
	tDWD989oKrGGpY6Gh5T3yS8xuicsZriz31DMsgKGJB3HjdWV5oQmvLOo0eTGSQotXPbesnBrJNN
	+PIY7FMJQYXo0klxBAdM7kW0oEi1i6USVLmk0p7E7tq7EbS85kG5pCw0rAqTO7RNyfjNwqOS+kc
	7ibSx1CokAWTULHtma8TI2fK2ks2P/cixkH6/4NGXQsuDnEKCsz4IFO3c3XCKKdSHsHqFUnRMpt
	kwm6qCZ8YcN/q02IBLShxc+5tW7Mkf2DjjkLInStefcOaMrio+WfQmuFYgPOSDXY4h5DomcnFuG
	+
X-Received: by 2002:a17:90b:2e8d:b0:3b3:c00e:56a7 with SMTP id 98e67ed59e1d1-3b3c00e56d4mr241802a91.42.1794905442058;
        Tue, 17 Nov 2026 00:50:42 -0800 (PST)
Received: from LDYT9Q2G2M ([2a09:bac1:7680:450::1c:35f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm3006240a91.5.2026.11.17.00.50.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 00:50:40 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	io-uring@vger.kernel.org
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] io_uring: avoid activating drain for failed requests or links
Date: Tue, 17 Nov 2026 16:50:32 +0800
Message-ID: <20261117085033.98363-2-zhiqizhangg@gmail.com>
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

io_init_req() currently calls io_init_drain() and consumes
IO_RING_F_DRAIN_NEXT before request initialization and BPF filter
checks have completed. If io_init_req(), io_uring_run_bpf_filters(),
or a later request in the same link fails, io_submit_fail_init()
completes the request or link via io_req_defer_failed(), bypassing
io_drain_req().

This can leave IO_RING_F_DRAIN_ACTIVE or IO_RING_F_DRAIN_NEXT set on
the ring with no deferred drain request and ctx->drain_req == NULL:

  1. P0 (e.g. POLL_ADD) is in flight
  2. Invalid IOSQE_IO_DRAIN SQE sets IO_RING_F_DRAIN_ACTIVE, then fails
     with -EINVAL and frees immediately
  3. Subsequent non-drain SQE sees IO_RING_F_DRAIN_ACTIVE, is forced
     through io_drain_req(), and blocks in ->defer_list behind P0

Similarly, a failed link containing an IOSQE_IO_DRAIN SQE leaks
IO_RING_F_DRAIN_ACTIVE and IO_RING_F_DRAIN_NEXT onto the next
unrelated request, or an -ENOMEM failure allocating io_defer_entry in
io_drain_req() fails the request with IO_RING_F_DRAIN_ACTIVE still set.

Do not touch IO_RING_F_DRAIN_ACTIVE or IO_RING_F_DRAIN_NEXT in
io_init_req(). During link assembly, only propagate REQ_F_IO_DRAIN to
a non-failing link head, and move drain flag activation into
io_drain_req() after struct io_defer_entry allocation succeeds. Also
clear state->link.head before flushing an unterminated link in
io_submit_state_end().

Fixes: 8fb7aee05591 ("io_uring: drain based on allocates reqs")
Cc: stable@vger.kernel.org
Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---
 io_uring/io_uring.c | 100 +++++++++++++++++++++++++-------------------
 1 file changed, 57 insertions(+), 43 deletions(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 5db57bf675f0..4e8b93a584b4 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -1471,8 +1471,9 @@ static __cold void io_drain_req(struct io_kiocb *req)
 	__must_hold(&ctx->uring_lock)
 {
 	struct io_ring_ctx *ctx = req->ctx;
-	bool drain = req->flags & IOSQE_IO_DRAIN;
 	struct io_defer_entry *de;
+	bool drain_next = false;
+	bool drain;
 
 	de = kmalloc_obj(*de, GFP_KERNEL_ACCOUNT);
 	if (!de) {
@@ -1480,6 +1481,33 @@ static __cold void io_drain_req(struct io_kiocb *req)
 		return;
 	}
 
+	/*
+	 * If a request in the middle or end of a link needs draining, drain
+	 * the link head (propagated at link assembly) and the next request/link
+	 * after the current link.
+	 */
+	if (unlikely(req->link)) {
+		struct io_kiocb *cur;
+
+		io_for_each_link(cur, req->link) {
+			if (cur->flags & REQ_F_IO_DRAIN) {
+				drain_next = true;
+				break;
+			}
+		}
+	}
+	if (unlikely(ctx->int_flags & IO_RING_F_DRAIN_NEXT)) {
+		ctx->int_flags &= ~IO_RING_F_DRAIN_NEXT;
+		ctx->int_flags |= IO_RING_F_DRAIN_ACTIVE;
+		req->flags |= REQ_F_IO_DRAIN;
+	}
+	if (unlikely(req->flags & REQ_F_IO_DRAIN))
+		ctx->int_flags |= IO_RING_F_DRAIN_ACTIVE;
+	if (unlikely(drain_next))
+		ctx->int_flags |= IO_RING_F_DRAIN_NEXT;
+	req->flags |= REQ_F_FORCE_ASYNC;
+	drain = req->flags & REQ_F_IO_DRAIN;
+
 	io_prep_async_link(req);
 	trace_io_uring_defer(req);
 	de->req = req;
@@ -1801,6 +1829,13 @@ static inline void io_queue_sqe(struct io_kiocb *req, unsigned int extra_flags)
 		io_queue_async(req, issue_flags, ret);
 }
 
+static inline bool io_drain_needed(const struct io_ring_ctx *ctx,
+				   const struct io_kiocb *req)
+{
+	return (ctx->int_flags & (IO_RING_F_DRAIN_ACTIVE | IO_RING_F_DRAIN_NEXT)) ||
+	       (req->flags & REQ_F_IO_DRAIN);
+}
+
 static void io_queue_sqe_fallback(struct io_kiocb *req)
 	__must_hold(&req->ctx->uring_lock)
 {
@@ -1815,7 +1850,7 @@ static void io_queue_sqe_fallback(struct io_kiocb *req)
 	} else {
 		/* can't fail with IO_URING_F_INLINE */
 		io_req_sqe_copy(req, IO_URING_F_INLINE);
-		if (unlikely(req->ctx->int_flags & IO_RING_F_DRAIN_ACTIVE))
+		if (unlikely(io_drain_needed(req->ctx, req)))
 			io_drain_req(req);
 		else
 			io_queue_iowq(req);
@@ -1847,24 +1882,6 @@ static inline bool io_check_restriction(struct io_ring_ctx *ctx,
 	return true;
 }
 
-static void io_init_drain(struct io_ring_ctx *ctx)
-{
-	struct io_kiocb *head = ctx->submit_state.link.head;
-
-	ctx->int_flags |= IO_RING_F_DRAIN_ACTIVE;
-	if (head) {
-		/*
-		 * If we need to drain a request in the middle of a link, drain
-		 * the head request and the next request/link after the current
-		 * link. Considering sequential execution of links,
-		 * REQ_F_IO_DRAIN will be maintained for every request of our
-		 * link.
-		 */
-		head->flags |= REQ_F_IO_DRAIN | REQ_F_FORCE_ASYNC;
-		ctx->int_flags |= IO_RING_F_DRAIN_NEXT;
-	}
-}
-
 static __cold int io_init_fail_req(struct io_kiocb *req, int err)
 {
 	/* ensure per-opcode data is cleared if we fail before prep */
@@ -1937,25 +1954,13 @@ static int io_init_req(struct io_ring_ctx *ctx, struct io_kiocb *req,
 		}
 		if (sqe_flags & IOSQE_CQE_SKIP_SUCCESS)
 			ctx->int_flags |= IO_RING_F_DRAIN_DISABLED;
-		if (sqe_flags & IOSQE_IO_DRAIN) {
-			if (ctx->int_flags & IO_RING_F_DRAIN_DISABLED)
-				return io_init_fail_req(req, -EOPNOTSUPP);
-			io_init_drain(ctx);
-		}
-	}
-	if (unlikely(ctx->int_flags & (IO_RING_F_OP_RESTRICTED | IO_RING_F_DRAIN_ACTIVE | IO_RING_F_DRAIN_NEXT))) {
-		if (!io_check_restriction(ctx, req, sqe_flags))
-			return io_init_fail_req(req, -EACCES);
-		/* knock it to the slow queue path, will be drained there */
-		if (ctx->int_flags & IO_RING_F_DRAIN_ACTIVE)
-			req->flags |= REQ_F_FORCE_ASYNC;
-		/* if there is no link, we're at "next" request and need to drain */
-		if (unlikely(ctx->int_flags & IO_RING_F_DRAIN_NEXT) && !ctx->submit_state.link.head) {
-			ctx->int_flags &= ~IO_RING_F_DRAIN_NEXT;
-			ctx->int_flags |= IO_RING_F_DRAIN_ACTIVE;
-			req->flags |= REQ_F_IO_DRAIN | REQ_F_FORCE_ASYNC;
-		}
+		if ((sqe_flags & IOSQE_IO_DRAIN) &&
+		    (ctx->int_flags & IO_RING_F_DRAIN_DISABLED))
+			return io_init_fail_req(req, -EOPNOTSUPP);
 	}
+	if (unlikely(ctx->int_flags & IO_RING_F_OP_RESTRICTED) &&
+	    !io_check_restriction(ctx, req, sqe_flags))
+		return io_init_fail_req(req, -EACCES);
 
 	if (!def->ioprio && sqe->ioprio)
 		return io_init_fail_req(req, -EINVAL);
@@ -2065,17 +2070,22 @@ static inline int io_submit_sqe(struct io_ring_ctx *ctx, struct io_kiocb *req,
 		io_req_sqe_copy(req, IO_URING_F_INLINE);
 		link->last->link = req;
 		link->last = req;
+		if (unlikely((req->flags & REQ_F_IO_DRAIN) &&
+			     !(link->head->flags & REQ_F_FAIL)))
+			link->head->flags |= REQ_F_IO_DRAIN;
 
 		if (req->flags & IO_REQ_LINK_FLAGS)
 			return 0;
 		/* last request of the link, flush it */
 		req = link->head;
 		link->head = NULL;
-		if (req->flags & (REQ_F_FORCE_ASYNC | REQ_F_FAIL))
+		if ((req->flags & (REQ_F_FORCE_ASYNC | REQ_F_FAIL)) ||
+		    io_drain_needed(ctx, req))
 			goto fallback;
 
-	} else if (unlikely(req->flags & (IO_REQ_LINK_FLAGS |
-					  REQ_F_FORCE_ASYNC | REQ_F_FAIL))) {
+	} else if (unlikely((req->flags & (IO_REQ_LINK_FLAGS | REQ_F_FORCE_ASYNC |
+					   REQ_F_FAIL)) ||
+			    io_drain_needed(ctx, req))) {
 		if (req->flags & IO_REQ_LINK_FLAGS) {
 			link->head = req;
 			link->last = req;
@@ -2097,8 +2107,12 @@ static void io_submit_state_end(struct io_ring_ctx *ctx)
 {
 	struct io_submit_state *state = &ctx->submit_state;
 
-	if (unlikely(state->link.head))
-		io_queue_sqe_fallback(state->link.head);
+	if (unlikely(state->link.head)) {
+		struct io_kiocb *head = state->link.head;
+
+		state->link.head = NULL;
+		io_queue_sqe_fallback(head);
+	}
 	/* flush only after queuing links as they can generate completions */
 	io_submit_flush_completions(ctx);
 	if (state->plug_started)

base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
-- 
2.43.0

