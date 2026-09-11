Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DCC496D2E
	for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 15:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141338; cv=none; b=TTJimV6rtnrqi5g0z82xw4MMqYz8sQHzuDWeRmC0DAZWXa73t1nBVpSHAn3WrerD/SZpHeQZdFkvpmG88WqBGk2CPMmJ4xMnsRDWnjKWAkyDJsR1nxMgg4Gn68l2jH5DTL27nA6f+EezcYQIJnVf6/u9uNzs6B9Ut8OZCpbHIDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141338; c=relaxed/simple;
	bh=dtEkrDn9TuULG8Rmh0vGe3duGIN/MxnGeLhOxWrexcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uHiZKElP4APMLk3Xy+6bbz9M6P2K0cd1tXQgQElYkbp2wEIKCjGwEoOkFTTBaDlP4djW44S/2d3/iNXOXGk+duO0sPJR8XG6hLF/5MONFllzEfyVY+WKhCresVZHyYwKf3/Pums9/BRBydUP2lQrWqNCSbST0uzI0rvdeA6gD+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=NQ/tanlM; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="NQ/tanlM"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466cc9ab667so18464fac.0
        for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 08:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141333; x=1789746133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TNGI4wdJO9MfPQNZHymsObp/iaVWwbU1kTAYKqVGN8A=;
        b=NQ/tanlMP1DsJz9UozBHS0Jq2qRVnowwWpEXTwqyeBINoXGma4LGYFKL7wJwj0485t
         AKalzR8B2fquE4dyx2CxKYc+wEWr17kLPxvwyiik+JHKMxAdfJkv0TD7q1c1ptQGVIsd
         qG+l2SL7iFpO6nWHLldEc3KgLWkOhqNXh17r4+wfCKDWJZimUJSXLOCbj0la4gZj0hT5
         qZZ9Osbe5twOl/rRHZ9WFc1ycCBLKEaoUoxERVfdues+oXY18UzUPhQEvufC8qMU004I
         NsWz8Zs9qdQu8qRHucULs37AsMHSC9UrhKhZkmobbiOgxozUExknZYw9yU9ipnaFNyr/
         vdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141333; x=1789746133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TNGI4wdJO9MfPQNZHymsObp/iaVWwbU1kTAYKqVGN8A=;
        b=KpJhuw444soBmM3XSXF8C4D1sZo5gI1YoWy624mWl6Z5bFis4IacHCeXETkmmOsKa9
         XoOP5OjJuUfqM2yOxjqGs3L6WxoPlyiNTtB+9A3+xk3cllMxaXmO7DhxqdqASggVB7NX
         HrJduquwg0ZB/pPqGTb5h570MHBLMycc+TSxgT9FaaCWUh6rdFZaXg4RlK2mRshVowhk
         zyEAFn0Uejsiztnaecv92V2IQVMsdOEI0NS+pe1P5mk88lsgp5a7k1xJsjh1pfL5VRT6
         cuzlR7t2Oyg5qsIVPT4G+fhEEQuLQX/ad70el4LU7WNk/1AWtN5JyoF/J7XGFs/BEWyy
         N65A==
X-Gm-Message-State: AFuF++msAiRA1xgkkP+PwK+xhv+pNLAGMcpVUOWUpExLgEF8YAIsQMZV
	XL/T8sGfE20xS1qNkHES6jll7DTpjxDwEP3nmt1LDMj5XxAeauSdH0A3/B9SuPp/Wdppl9LG3im
	hnK3RxEc=
X-Gm-Gg: AYBFou2YLOfBgeuZf5viu+LRrYa2vDL2VBvJfLOov+/5Ue7qrDG4U8QSCBFqKO87ZIy
	tOt+6SrwGqnbCZaPQZOt6zrFr/7i3pzzDHAj6YT+YO+rP06PorBI8FlkJUWJwipNit2qP34NKx2
	7SB4HFJgkLS/rQPYKUxR0KOoUsa7rHmk1ZZXduf/xmCs2RvEF3MBfG57xd8X89MxKgfdcMK778N
	+oSBmNqw9yX2CEj7qf0p/ui2XEwTL80NGhaTa60sa4usmLc32Ihmy13Pyt/IU3BE1sctr+SE5iK
	4BoBoHnzfcAfwveeoYvoGjMFKceuJIqIZprhGmzvqdMivuufOVrr97meRL9nN/ohy2fwGp2fxLo
	NF/ZsdiXcuKISGW+S+R45tuE2VELWYjcKCXSy9l+JWy/8WI1/JCT1XvaOo0qRtrS61+xSPCIGwc
	mWQTIs8rhqEJkPx3rxvkM5VD2iOVpn1DTouWu+1m4QidtjVBn44XIOKIszIxmXx84QzSyeVdiK2
	1H1ViAu9po13+YzCMsP9wVr+8sCGeTvYsqQrON7a0s=
X-Received: by 2002:a05:6820:a283:20b0:6ac:8e23:3078 with SMTP id 006d021491bc7-6c0b9a5f10cmr2546524eaf.5.1789141333306;
        Fri, 11 Sep 2026 08:42:13 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c09690af1dsm2802199eaf.1.2026.09.11.08.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:42:12 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 13/15] io_uring: issue blockable requests inline in blocking mode
Date: Fri, 11 Sep 2026 09:41:03 -0600
Message-ID: <20260911154148.644489-14-axboe@kernel.dk>
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

With a handoff available, there's no point in issuing a blockable opcode
nonblocking first. Clear IO_URING_F_NONBLOCK if io_handoff_begin()
succeeds, and issue REQ_F_FORCE_ASYNC requests inline rather than
punting them to io-wq upfront.

Requests with a working nonblocking issue path, like reads and writes
on FMODE_NOWAIT files, behave as before. The handoff is for requests
that otherwise would have required an io-wq punt upfront, most of which
never block. SQEs marked IOSQE_ASYNC keep their explicit io-wq offload.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 include/linux/io_uring_types.h |  6 +++
 io_uring/handoff.c             | 75 ++++++++++++++++++++++------------
 io_uring/handoff.h             | 12 +++---
 io_uring/io_uring.c            | 48 +++++++++++++++++++---
 io_uring/io_uring.h            |  7 ++++
 io_uring/splice.c              |  6 +++
 6 files changed, 116 insertions(+), 38 deletions(-)

diff --git a/include/linux/io_uring_types.h b/include/linux/io_uring_types.h
index 6c8fe7232aa2..37c56ad37e05 100644
--- a/include/linux/io_uring_types.h
+++ b/include/linux/io_uring_types.h
@@ -651,6 +651,8 @@ enum {
 	REQ_F_IMPORT_BUFFER_BIT,
 	REQ_F_SQE_COPIED_BIT,
 	REQ_F_IOPOLL_BIT,
+	REQ_F_ASYNC_USER_BIT,
+	REQ_F_HANDOFF_BIT,
 
 	/* not a real bit, just to check we're not overflowing the space */
 	__REQ_F_LAST_BIT,
@@ -746,6 +748,10 @@ enum {
 	REQ_F_SQE_COPIED	= IO_REQ_FLAG(REQ_F_SQE_COPIED_BIT),
 	/* request must be iopolled to completion (set in ->issue()) */
 	REQ_F_IOPOLL		= IO_REQ_FLAG(REQ_F_IOPOLL_BIT),
+	/* IOSQE_ASYNC was set on the SQE, not just by prep */
+	REQ_F_ASYNC_USER	= IO_REQ_FLAG(REQ_F_ASYNC_USER_BIT),
+	/* vetted at submit for an inline blocking issue with a handoff */
+	REQ_F_HANDOFF		= IO_REQ_FLAG(REQ_F_HANDOFF_BIT),
 };
 
 struct io_tw_req {
diff --git a/io_uring/handoff.c b/io_uring/handoff.c
index ddc3c4d6a4f3..9c9bb7ba99f0 100644
--- a/io_uring/handoff.c
+++ b/io_uring/handoff.c
@@ -31,12 +31,58 @@ int sysctl_io_uring_handoff __read_mostly = 1;
 
 static long io_handoff_resume(void);
 
+/*
+ * Can @req be issued inline in blocking mode with a handoff ready. Everything
+ * but the spare worker check is static, REQ_F_HANDOFF caches that part.
+ */
+bool io_handoff_possible(struct io_kiocb *req)
+{
+	const struct io_issue_def *def = &io_issue_defs[req->opcode];
+	struct io_ring_ctx *ctx = req->ctx;
+	struct io_uring_task *tctx = current->io_uring;
+
+	if (!sysctl_io_uring_handoff)
+		return false;
+	if (req->flags & REQ_F_HANDOFF)
+		goto check_spare;
+	if (!def->blockable)
+		return false;
+	/* nonblocking semantics were asked for, -EAGAIN is the answer */
+	if (req->flags & REQ_F_NOWAIT)
+		return false;
+	/* IOPOLL/SQPOLL issue differently, SQ_REWIND can't resume mid-batch */
+	if (ctx->flags & (IORING_SETUP_IOPOLL | IORING_SETUP_SQPOLL |
+			  IORING_SETUP_SQ_REWIND))
+		return false;
+	/* pollable files keep the nonblocking issue + poll retry path */
+	if (io_file_can_poll(req))
+		return false;
+	/* FMODE_NOWAIT files have a working nonblocking path, keep using it */
+	if ((def->pollin || def->pollout) && req->file &&
+	    (req->file->f_mode & FMODE_NOWAIT))
+		return false;
+	if (!tctx->io_wq)
+		return false;
+	/* an intermediate task's own user state doesn't matter, it stays */
+	if (!tctx->handoff.src && !thread_handoff_allowed(current))
+		return false;
+	/* the SQ head is published while we may still be running */
+	if (io_req_sqe_copy(req, IO_URING_F_INLINE))
+		return false;
+	req->flags |= REQ_F_HANDOFF;
+check_spare:
+	/* have a worker ready to take over */
+	if (!io_wq_handoff_spare(tctx->io_wq, !io_req_unbound(req), false))
+		return false;
+	return true;
+}
+
 /* fork a spare worker upfront, so the first blockable issue has a target */
 void io_handoff_prime(struct io_uring_task *tctx, struct io_ring_ctx *ctx)
 {
 	if (!sysctl_io_uring_handoff || !tctx->io_wq)
 		return;
-	/* handoffs are never done for these, see __io_handoff_begin() */
+	/* handoffs are never done for these, see io_handoff_possible() */
 	if (ctx->flags & (IORING_SETUP_IOPOLL | IORING_SETUP_SQPOLL |
 			  IORING_SETUP_SQ_REWIND))
 		return;
@@ -71,32 +117,9 @@ void __io_handoff_restore_signals(struct io_handoff *ho)
  */
 bool __io_handoff_begin(struct io_kiocb *req)
 {
-	struct io_ring_ctx *ctx = req->ctx;
-	struct io_uring_task *tctx = current->io_uring;
-	struct io_handoff *ho = &tctx->handoff;
+	struct io_handoff *ho = &current->io_uring->handoff;
 
-	if (!sysctl_io_uring_handoff)
-		return false;
-	/* nonblocking semantics were asked for, -EAGAIN is the answer */
-	if (req->flags & REQ_F_NOWAIT)
-		return false;
-	/* IOPOLL/SQPOLL issue differently, SQ_REWIND can't resume mid-batch */
-	if (ctx->flags & (IORING_SETUP_IOPOLL | IORING_SETUP_SQPOLL |
-			  IORING_SETUP_SQ_REWIND))
-		return false;
-	/* pollable files keep the nonblocking issue + poll retry path */
-	if (io_file_can_poll(req))
-		return false;
-	if (!tctx->io_wq)
-		return false;
-	/* an intermediate task's own user state doesn't matter, it stays */
-	if (!tctx->handoff.src && !thread_handoff_allowed(current))
-		return false;
-	/* the SQ head is published while we may still be running */
-	if (io_req_sqe_copy(req, IO_URING_F_INLINE))
-		return false;
-	/* have a worker ready to take over */
-	if (!io_wq_handoff_spare(tctx->io_wq, !io_req_unbound(req), false))
+	if (!io_handoff_possible(req))
 		return false;
 	/* would interrupt the issue right away, and can't be handled here */
 	if (task_sigpending(current))
diff --git a/io_uring/handoff.h b/io_uring/handoff.h
index b8ded4916606..f315f2ae8d80 100644
--- a/io_uring/handoff.h
+++ b/io_uring/handoff.h
@@ -6,16 +6,10 @@
 #include "opdef.h"
 #include "tw.h"
 
-/* a blocking issue got interrupted, retry on io-wq rather than restart */
-static inline bool io_issue_wants_restart(int ret)
-{
-	return ret == -ERESTARTSYS || ret == -ERESTARTNOINTR ||
-	       ret == -ERESTARTNOHAND || ret == -ERESTART_RESTARTBLOCK;
-}
-
 #ifdef CONFIG_THREAD_HANDOFF
 extern int sysctl_io_uring_handoff;
 
+bool io_handoff_possible(struct io_kiocb *req);
 bool __io_handoff_begin(struct io_kiocb *req);
 void io_handoff_prime(struct io_uring_task *tctx, struct io_ring_ctx *ctx);
 bool io_handoff_end(void);
@@ -77,6 +71,10 @@ static inline bool io_handoff_begin(struct io_kiocb *req,
 {
 	return false;
 }
+static inline bool io_handoff_possible(struct io_kiocb *req)
+{
+	return false;
+}
 static inline void io_handoff_submit_end(void)
 {
 }
diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 289e9ddc8c24..7c2aa0cfacc8 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -1424,10 +1424,25 @@ static int io_issue_sqe(struct io_kiocb *req, unsigned int issue_flags)
 	if (unlikely(!io_assign_file(req, def, issue_flags)))
 		return -EBADF;
 
+	/*
+	 * No point in a nonblocking attempt with a handoff armed. A force-async
+	 * request can't do nonblocking at all, punt if no handoff is possible.
+	 */
 	handoff = io_handoff_begin(req, def, issue_flags);
+	if (handoff) {
+		issue_flags &= ~IO_URING_F_NONBLOCK;
+	} else if ((issue_flags & IO_URING_F_INLINE) &&
+		   (req->flags & REQ_F_FORCE_ASYNC)) {
+		return -EAGAIN;
+	}
 	ret = __io_issue_sqe(req, issue_flags, def);
-	if (handoff && unlikely(io_handoff_end()))
-		return io_handoff_complete(req, ret);
+	if (handoff) {
+		if (unlikely(io_handoff_end()))
+			return io_handoff_complete(req, ret);
+		/* interrupted regardless (fatal signal, stop), io-wq retries */
+		if (unlikely(io_issue_wants_restart(ret)))
+			return -EAGAIN;
+	}
 
 	if (ret == IOU_COMPLETE) {
 		if (issue_flags & IO_URING_F_COMPLETE_DEFER)
@@ -1756,6 +1771,8 @@ static int io_init_req(struct io_ring_ctx *ctx, struct io_kiocb *req,
 	/* same numerical values with corresponding REQ_F_*, safe to copy */
 	sqe_flags = READ_ONCE(sqe->flags);
 	req->flags = (__force io_req_flags_t) sqe_flags;
+	if (sqe_flags & IOSQE_ASYNC)
+		req->flags |= REQ_F_ASYNC_USER;
 	req->cqe.user_data = READ_ONCE(sqe->user_data);
 	req->file = NULL;
 	req->tctx = current->io_uring;
@@ -1895,6 +1912,25 @@ static __cold int io_submit_fail_init(const struct io_uring_sqe *sqe,
 	return 0;
 }
 
+/* a blockable force-async request issued inline beats an io-wq punt */
+static bool io_req_force_async(struct io_kiocb *req)
+{
+	if (req->flags & REQ_F_FAIL)
+		return true;
+	if (!(req->flags & REQ_F_FORCE_ASYNC))
+		return false;
+	/* userspace asked for it, keep the explicit offload */
+	if (req->flags & REQ_F_ASYNC_USER)
+		return true;
+	if (req->ctx->int_flags & IO_RING_F_DRAIN_ACTIVE)
+		return true;
+	/* the file decides on pollability, resolve it now if fixed */
+	if (!io_assign_file(req, &io_issue_defs[req->opcode],
+			    IO_URING_F_INLINE))
+		return true;
+	return !io_handoff_possible(req);
+}
+
 static inline int io_submit_sqe(struct io_ring_ctx *ctx, struct io_kiocb *req,
 			 const struct io_uring_sqe *sqe, unsigned int *left)
 	__must_hold(&ctx->uring_lock)
@@ -1932,7 +1968,7 @@ static inline int io_submit_sqe(struct io_ring_ctx *ctx, struct io_kiocb *req,
 		/* last request of the link, flush it */
 		req = link->head;
 		link->head = NULL;
-		if (req->flags & (REQ_F_FORCE_ASYNC | REQ_F_FAIL))
+		if (io_req_force_async(req))
 			goto fallback;
 
 	} else if (unlikely(req->flags & (IO_REQ_LINK_FLAGS |
@@ -1940,11 +1976,13 @@ static inline int io_submit_sqe(struct io_ring_ctx *ctx, struct io_kiocb *req,
 		if (req->flags & IO_REQ_LINK_FLAGS) {
 			link->head = req;
 			link->last = req;
-		} else {
+			return 0;
+		}
+		if (io_req_force_async(req)) {
 fallback:
 			io_queue_sqe_fallback(req);
+			return 0;
 		}
-		return 0;
 	}
 
 	return io_queue_sqe(req, IO_URING_F_INLINE);
diff --git a/io_uring/io_uring.h b/io_uring/io_uring.h
index 79db0a8b9cc8..1f536617b584 100644
--- a/io_uring/io_uring.h
+++ b/io_uring/io_uring.h
@@ -421,6 +421,13 @@ static inline bool io_issue_needs_lock(unsigned int issue_flags)
 		io_issue_handed_off(issue_flags);
 }
 
+/* a blocking issue got interrupted, retry on io-wq rather than restart */
+static inline bool io_issue_wants_restart(int ret)
+{
+	return ret == -ERESTARTSYS || ret == -ERESTARTNOINTR ||
+	       ret == -ERESTARTNOHAND || ret == -ERESTART_RESTARTBLOCK;
+}
+
 static inline void io_ring_submit_unlock(struct io_ring_ctx *ctx,
 					 unsigned issue_flags)
 {
diff --git a/io_uring/splice.c b/io_uring/splice.c
index e81ebbb91925..7d464deb0972 100644
--- a/io_uring/splice.c
+++ b/io_uring/splice.c
@@ -100,6 +100,9 @@ int io_tee(struct io_kiocb *req, unsigned int issue_flags)
 
 	if (!(sp->flags & SPLICE_F_FD_IN_FIXED))
 		fput(in);
+	/* interrupted before making progress, have the core retry it */
+	if (io_issue_wants_restart(ret))
+		return -EAGAIN;
 done:
 	if (ret != sp->len)
 		req_set_fail(req);
@@ -141,6 +144,9 @@ int io_splice(struct io_kiocb *req, unsigned int issue_flags)
 
 	if (!(sp->flags & SPLICE_F_FD_IN_FIXED))
 		fput(in);
+	/* interrupted before making progress, have the core retry it */
+	if (io_issue_wants_restart(ret))
+		return -EAGAIN;
 done:
 	if (ret != sp->len)
 		req_set_fail(req);
-- 
2.55.0

