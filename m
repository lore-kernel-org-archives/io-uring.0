Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C922496D54
	for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 15:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141339; cv=none; b=PUhsYvzL+XXbvcccuw/NzwWNU1bybsUWZdW+Mi61h+iYz/l8iIG2hrDw5eBB+8/Z20mexySuRdCJf5t/EUMGJnq8mmWiMQuEaydnJUyEXLHfMQ2aC6PeDvlkgyazs6qW7NsfU1NrEsLqL/2bbUT5bX+I/dAzIaYERA+jmrWd9ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141339; c=relaxed/simple;
	bh=0IcDUuFgsZRW2mHnNDY7QMSvPwoA7pARp/KcOd2nG6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eiiNVtIhoa1PNHDzgUVI9Xhk9P2Edul+bNtvkgKtcsL+0oyf5BXuUCtQS3UFXTF4ZRLb+8rjaIgYXkKX+oRR6JajKsG21svtKkX2XMMeY+qAvTojwSI3LParq6PCRAqzBA0syR7SnYigbs+UlpqJi4MXAZduB5G/HeOXr+m9UwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=KH7mZYIW; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="KH7mZYIW"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-46accbdfb21so2773fac.1
        for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 08:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141334; x=1789746134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a9YT6ic9x6FyZ148rG7PDLceVb4/eE9JqVTzoSzdUWU=;
        b=KH7mZYIW+Nd8JN84rRI5On75xjBWNm/NkJDjBUpY67qDqAxL1AxQWDYw2aBMyUPXVg
         +gMRXEGzQ6yuriNPMSfi8ZYvlQ7oRKDSbAngrjaOIWxKgQJyExCX5EBAae/lc4TD+QpT
         4xofkkSi6Wpy/k4pzOkyTjYO295G0BfsDopa9b9eYJwxCPn16+K+XRltCTYBgrc8cIbb
         /wN7hbGWks1yzQmTNtKIxI2Je++T2qdsg4p4feo7Y6zpia4M15j4qbaUnJ0Z/MTGczmd
         itHISjpA7153hN4jlwqgMQPVDD3MmxfBjIPXEzRWudIPsXAv471tnKRjp5GNTnHu47FX
         S79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141334; x=1789746134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a9YT6ic9x6FyZ148rG7PDLceVb4/eE9JqVTzoSzdUWU=;
        b=rVbGOCm/jD/96TpSdHBI43RfLaUAfzhDzOD2rA1uOZQRT7iJI9RrVLXxrh4g7Stmwe
         ydFdvmZ+r352sq0YV2cmO+nDMiGRY0IyyBvIlCRnXTYp8dXbsTAmkE/4M4FPWLHadI5w
         1OTdrS+AGX54i0uuUyQWHLqJGegnxSB4y6O2mai75VpXKibA0S8EkH6BJLXMmEfWBzkm
         e2f356rWLvm5xnTp/8mt8wxyzCACIvBkTwVLkqiPzJhq8S33ed+RtiAU+2PZ9kW7SFu5
         MbFFnCrz9RPESb/JnViKH/MlxSVThQkzEgddkLN6YgFZaPVNlBFdNSREYmThoneDytxk
         4ZsQ==
X-Gm-Message-State: AFuF++kzgb8FAUxibchrCBfNHmT6QFcIAE/O5dnL3hFrFEh5JigA5YIx
	OMPuy8Um/Ss/XfsbSMixUVNHs3IHLVtXLpeJzbug0is0wEnf21G+QjP5BvHhRHN1H0ypUmnNqqj
	rJ/T2hfY=
X-Gm-Gg: AYBFou1CibjSTeGqFKEPNTa9osRFrFQeDw1CvJL53tgccwXEF3RWp400Rv1Nvy5yQYn
	b5PqOFqH58BbXiVafUZz2emUPTz7T3uQxse+mOBK1D41KxHu+BEj6btt0m/I6Mwn/CpFnMo5YYO
	U/iltz5/xBXMmS7yShf6Ppz1UNlejRctqj/e6dU6nvBaXQWaUmJN+zoK81G60rFtKp25wE1+i2c
	CFWygU9xG9P9oJO4OYk63DKCKVhpNj0RyegmWzDyDfsZzuRt8U14vjlKxRQb6muAz1rCpFr5TWM
	Q3qTT0NVyIOBpsSSg4uUbeuSzgUfafgRHBa+MVOcmeeXKQIhnJY7r4IXLuinHL1aidz3y+vh25W
	xJrORtgIvXWeSf8REQkTAoIGNi+2xD3IEldaOmjwhV8cSMSI/6cky9IuIQ0qyRUrhFQvBDSHj7Q
	MwGpRf0ezGRvFhQTklbDvdhJqjManDwv01qTce/d0wvJx3EiyFuuxikBEBrQMwVzSEUBJoQZGzb
	l4ujIZ2qUSWR9Es5Qc2awldFLZMZUKGZ2BjJP4CGZw=
X-Received: by 2002:a05:6820:83d2:10b0:6b9:7d9e:5708 with SMTP id 006d021491bc7-6c0b9e5081cmr5077670eaf.3.1789141334570;
        Fri, 11 Sep 2026 08:42:14 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c09690af1dsm2802199eaf.1.2026.09.11.08.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:42:13 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 14/15] io_uring: add tracepoints for the handoff operation
Date: Fri, 11 Sep 2026 09:41:04 -0600
Message-ID: <20260911154148.644489-15-axboe@kernel.dk>
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

Add tracepoints for a handoff, a handoff that didn't happen with the
reason, and the promoted task resuming the submission.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 include/trace/events/io_uring.h | 114 ++++++++++++++++++++++++++++++++
 io_uring/handoff.c              |  42 +++++++++---
 2 files changed, 147 insertions(+), 9 deletions(-)

diff --git a/include/trace/events/io_uring.h b/include/trace/events/io_uring.h
index 34b31a855ea4..6043c5d46dbd 100644
--- a/include/trace/events/io_uring.h
+++ b/include/trace/events/io_uring.h
@@ -671,6 +671,120 @@ TRACE_EVENT(io_uring_local_work_run,
 	TP_printk("ring %p, count %d, loops %u", __entry->ctx, __entry->count, __entry->loops)
 );
 
+/**
+ * io_uring_handoff - a blocked submitter hands its identity to a worker
+ *
+ * @req:	pointer to a submitted request
+ * @dst:	the idle io-wq worker task taking over
+ */
+TRACE_EVENT(io_uring_handoff,
+
+	TP_PROTO(struct io_kiocb *req, struct task_struct *dst),
+
+	TP_ARGS(req, dst),
+
+	TP_STRUCT__entry (
+		__field(  void *,	ctx		)
+		__field(  void *,	req		)
+		__field(  u64,		user_data	)
+		__field(  u8,		opcode		)
+		__field(  pid_t,	src_pid		)
+		__field(  pid_t,	dst_pid		)
+
+		__string( op_str, io_uring_get_opcode(req->opcode)	)
+	),
+
+	TP_fast_assign(
+		__entry->ctx		= req->ctx;
+		__entry->req		= req;
+		__entry->user_data	= req->cqe.user_data;
+		__entry->opcode		= req->opcode;
+		__entry->src_pid	= task_pid_nr(current);
+		__entry->dst_pid	= task_pid_nr(dst);
+
+		__assign_str(op_str);
+	),
+
+	TP_printk("ring %p, request %p, user_data 0x%llx, opcode %s, identity %d handed to worker %d",
+		__entry->ctx, __entry->req, __entry->user_data,
+		__get_str(op_str), __entry->src_pid, __entry->dst_pid)
+);
+
+/**
+ * io_uring_handoff_fail - a handoff didn't happen for a request
+ *
+ * @req:	pointer to the request being issued
+ * @reason:	why. "lock", "prepare" and "worker" mean the task blocked in
+ *		place, anything else that it took the io-wq punt path instead.
+ */
+TRACE_EVENT(io_uring_handoff_fail,
+
+	TP_PROTO(struct io_kiocb *req, const char *reason),
+
+	TP_ARGS(req, reason),
+
+	TP_STRUCT__entry (
+		__field(  void *,	ctx		)
+		__field(  void *,	req		)
+		__field(  u64,		user_data	)
+		__field(  u8,		opcode		)
+
+		__string( op_str, io_uring_get_opcode(req->opcode)	)
+		__string( reason, reason			)
+	),
+
+	TP_fast_assign(
+		__entry->ctx		= req->ctx;
+		__entry->req		= req;
+		__entry->user_data	= req->cqe.user_data;
+		__entry->opcode		= req->opcode;
+
+		__assign_str(op_str);
+		__assign_str(reason);
+	),
+
+	TP_printk("ring %p, request %p, user_data 0x%llx, opcode %s, %s",
+		__entry->ctx, __entry->req, __entry->user_data,
+		__get_str(op_str), __get_str(reason))
+);
+
+/**
+ * io_uring_handoff_resume - a promoted worker continues the submission
+ *
+ * @ctx:	pointer to a ring context structure
+ * @req:	the request that blocked, owned by the demoted task by now
+ * @worker:	pid the demoted task now runs under
+ * @consumed:	SQEs consumed by earlier handoffs of this syscall
+ * @to_submit:	SQE count the syscall asked for
+ */
+TRACE_EVENT(io_uring_handoff_resume,
+
+	TP_PROTO(void *ctx, void *req, pid_t worker, unsigned int consumed,
+		 unsigned int to_submit),
+
+	TP_ARGS(ctx, req, worker, consumed, to_submit),
+
+	TP_STRUCT__entry (
+		__field(  void *,	ctx		)
+		__field(  void *,	req		)
+		__field(  pid_t,	worker		)
+		__field(  unsigned int,	consumed	)
+		__field(  unsigned int,	to_submit	)
+	),
+
+	TP_fast_assign(
+		__entry->ctx		= ctx;
+		__entry->req		= req;
+		__entry->worker		= worker;
+		__entry->consumed	= consumed;
+		__entry->to_submit	= to_submit;
+	),
+
+	TP_printk("ring %p, request %p now on worker %d, consumed %u, to_submit %u",
+		__entry->ctx, __entry->req, __entry->worker,
+		__entry->consumed, __entry->to_submit)
+);
+
 #endif /* _TRACE_IO_URING_H */
 
 /* This part must be outside protection */
diff --git a/io_uring/handoff.c b/io_uring/handoff.c
index 9c9bb7ba99f0..8aefea5d326e 100644
--- a/io_uring/handoff.c
+++ b/io_uring/handoff.c
@@ -20,6 +20,7 @@
 #include <linux/fs.h>
 #include <linux/file.h>
 #include <asm/syscall.h>
+#include <trace/events/io_uring.h>
 
 #include "io_uring.h"
 #include "io-wq.h"
@@ -52,28 +53,40 @@ bool io_handoff_possible(struct io_kiocb *req)
 		return false;
 	/* IOPOLL/SQPOLL issue differently, SQ_REWIND can't resume mid-batch */
 	if (ctx->flags & (IORING_SETUP_IOPOLL | IORING_SETUP_SQPOLL |
-			  IORING_SETUP_SQ_REWIND))
+			  IORING_SETUP_SQ_REWIND)) {
+		trace_io_uring_handoff_fail(req, "ring");
 		return false;
+	}
 	/* pollable files keep the nonblocking issue + poll retry path */
-	if (io_file_can_poll(req))
+	if (io_file_can_poll(req)) {
+		trace_io_uring_handoff_fail(req, "poll");
 		return false;
+	}
 	/* FMODE_NOWAIT files have a working nonblocking path, keep using it */
 	if ((def->pollin || def->pollout) && req->file &&
-	    (req->file->f_mode & FMODE_NOWAIT))
+	    (req->file->f_mode & FMODE_NOWAIT)) {
+		trace_io_uring_handoff_fail(req, "nowait-file");
 		return false;
+	}
 	if (!tctx->io_wq)
 		return false;
 	/* an intermediate task's own user state doesn't matter, it stays */
-	if (!tctx->handoff.src && !thread_handoff_allowed(current))
+	if (!tctx->handoff.src && !thread_handoff_allowed(current)) {
+		trace_io_uring_handoff_fail(req, "task");
 		return false;
+	}
 	/* the SQ head is published while we may still be running */
-	if (io_req_sqe_copy(req, IO_URING_F_INLINE))
+	if (io_req_sqe_copy(req, IO_URING_F_INLINE)) {
+		trace_io_uring_handoff_fail(req, "sqe");
 		return false;
+	}
 	req->flags |= REQ_F_HANDOFF;
 check_spare:
 	/* have a worker ready to take over */
-	if (!io_wq_handoff_spare(tctx->io_wq, !io_req_unbound(req), false))
+	if (!io_wq_handoff_spare(tctx->io_wq, !io_req_unbound(req), false)) {
+		trace_io_uring_handoff_fail(req, "spare");
 		return false;
+	}
 	return true;
 }
 
@@ -122,8 +135,10 @@ bool __io_handoff_begin(struct io_kiocb *req)
 	if (!io_handoff_possible(req))
 		return false;
 	/* would interrupt the issue right away, and can't be handled here */
-	if (task_sigpending(current))
+	if (task_sigpending(current)) {
+		trace_io_uring_handoff_fail(req, "signal");
 		return false;
+	}
 
 	ho->req = req;
 	io_handoff_block_signals(ho);
@@ -240,10 +255,14 @@ void io_uring_task_sleeping(struct task_struct *tsk)
 	WARN_ON_ONCE(tsk != current);
 
 	/* the issue path is touching state that needs the ring lock held */
-	if (ctx->submit_lock_depth)
+	if (ctx->submit_lock_depth) {
+		trace_io_uring_handoff_fail(req, "lock");
 		return;
-	if (src == tsk && !thread_handoff_prepare(tsk))
+	}
+	if (src == tsk && !thread_handoff_prepare(tsk)) {
+		trace_io_uring_handoff_fail(req, "prepare");
 		return;
+	}
 
 	/* don't let the woken worker preempt us before we've committed */
 	preempt_disable();
@@ -251,6 +270,7 @@ void io_uring_task_sleeping(struct task_struct *tsk)
 	dst = io_wq_handoff_claim(tctx->io_wq, bound, io_handoff_resume, src);
 	if (!dst) {
 		preempt_enable();
+		trace_io_uring_handoff_fail(req, "worker");
 		return;
 	}
 
@@ -262,6 +282,7 @@ void io_uring_task_sleeping(struct task_struct *tsk)
 	/* our accounting follows the identity, an intermediate's doesn't */
 	if (src == tsk)
 		thread_handoff_stats_take(&ho->stats);
+	trace_io_uring_handoff(req, dst);
 
 	io_handoff_release_ring(ctx, ho);
 	io_handoff_move_tctx(tctx, tsk, dst);
@@ -306,6 +327,9 @@ static long io_handoff_resume(void)
 	bool bound = ho->bound;
 	long ret;
 
+	trace_io_uring_handoff_resume(ctx, ho->req, task_pid_nr(prev),
+				      ho->consumed, ho->to_submit);
+
 	/* enough of the identity to issue requests on its behalf */
 	thread_handoff_adopt_creds(src);
 	put_task_struct_many(prev, ho->prev_refs);
-- 
2.55.0

