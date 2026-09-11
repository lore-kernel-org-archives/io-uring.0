Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FEC47728F
	for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 15:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141337; cv=none; b=Lc0tA5sO+lstWQkqvtBk6vGX9B4X29W2gHpOnkqorHUI5anl9u2OOKrbup9RNR5QH6YNbYWSW2wdbC5fTHn1d1VpaZgJbL/iT1QvRuHpzW23MNX5AkovwGvVUFz9ITbJD9pNGxB7uv+PsYun7qhVIMB1ZnX+aVqP7YqWP4Ezry4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141337; c=relaxed/simple;
	bh=xWUtciFBYWJsNLzGvaU/kzObElfZHwwMSlHjuUQOHF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dUYMCJuPGEOgtZVTqSLXaiRNyUnwIB+rYRxtBSTP4LbNYC9PvsXwieCj5ul6/13ijiLsNpwDuU+2YLq4AiLU/u2rP1TTADYNf+Bz/dGvfqHgbogSfXVhJNChYrGz7SJX+AImNgjHnlPp44f2zcO1P8Ye4TpaKEmQWgF5C7+DDso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=F3r5Y288; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="F3r5Y288"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6b1b3d7f10eso900995eaf.3
        for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 08:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141331; x=1789746131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RKc5Jg/Dnuhi3Awy6UWcgXwLQtmBLJceWKQ5shu2ooU=;
        b=F3r5Y288EPyoU8E9/5Xh1sMm73uSoNPFe/DHV+iFSJrt61Mnz18n1JE50izwVHRMD/
         WzC6ZJT9PDVnskpyWddmjaGh1a0CvCLSIyVpHd7j6grhmM6WU7WRbKyxSYImhZ7uBdk+
         gqb8G5ZNUYxvilbUp5BuhGw0TnYXwHf6/evn38rMIFFe7FN+M0Mopl1grt/ZOcKvBTRd
         lYQdghSubSaAYfy16Mp9tveZ/f2GQGWi7Y+lY9fju0pXLVGKXKEyRa/JwEG5h9alS2Xf
         F3nZZtWI7WYr3jnLJdJgmfOHSksOsNtIINygwWaU6grxOyKCR7kHLv9BoIFoKogk7fZX
         7t8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141331; x=1789746131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RKc5Jg/Dnuhi3Awy6UWcgXwLQtmBLJceWKQ5shu2ooU=;
        b=s75VIDOcXB2p4y56OjKNCnBWIbB3TXrJVwAl0gFYDibm2pCPyxBnZ2gZt4uwvaH1NF
         7Rs1oqLCTwn/c7Zw0JBEFMr2hygj/+CrBg3ZbgvL+t3GZnrL2yThN794+qCNufPA9A30
         Ix2ouC+0IJ56N0kXzh4JMIzxEM+enDr1smCVcSVcC0pw7fd8knl9igybi18FEi4jGrek
         vKVT68C+qPAEE9qiBpOXo8lyf9o+M9ieULjTb+ani/PznDrJ8AXwhPoKgInBtleDuWQv
         6WLXintTfxdknvhVK+gdB7Oz5kaSmQIBHvShFOjHVFdiEy/jBwNdabM4DOBOX6rJ1KjE
         jgdA==
X-Gm-Message-State: AFuF++n/e1lC2mQky5f0CBDhNxMg5tw7k6OnALYNDhQGm/1DskeYXJn8
	LP7KXSzg44kQE+JP3UJbfPm9G6tJXxV2cSDlcicrtLYIkCDy/SZkH/EIMobcA21zH0oKqaQ5mta
	YVju6/Sk=
X-Gm-Gg: AYBFou0f1oqN7nEeF9SbKbiZn6Lsdn+nFD1kBMIvBJALgOkq/BzzJspZIrRYD6RgMRh
	BQBrS0fOHnJ6mLnoilUZoRVd5KUyTExF9KYqdDdDGvGcMkQHhzMs3eGo1aRDqtUMt9fmb9mw1F/
	Oj4hyHufvL6sdiLFbBHjL6m7tjzoJwzEgEna4DHqGQCib59wHEXCKTe4hXZ4KL+t8RC0JoS/uvO
	x0AL20wstQnRtRqlTiS74wf/713t4EWkdeuwdarM39585GSzTV1S6zWczc+YkvStS8DU/uXJ4ob
	odOJkcmp6hwCmRPhMqzBeDT9Yxte1GVdG8idOEwH++mWMpSuRO6e1LPuW1zEqHl6bPcSnenCAON
	St42J1hi8mXWiim96YqfKNfa8mpHvD9vdmqx860x+ohdlCuwbKxTBBXsSiJwMjoP3/8xtV0zSS+
	aFifoF2uSWi11JubKdjYSb4pD1eXUcvDnIGWuvEiC9aL3wJN9gw+NcNRpP7Y0JhJCu+F6nQQKLy
	IauDLxSzfOhRrxpvicohR/9ZINB
X-Received: by 2002:a05:6820:3414:10b0:6b3:4b80:3100 with SMTP id 006d021491bc7-6c0ba92040dmr2407722eaf.23.1789141330439;
        Fri, 11 Sep 2026 08:42:10 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c09690af1dsm2802199eaf.1.2026.09.11.08.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:42:09 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 11/15] io_uring: enable handing submitter identity to an io-wq worker
Date: Fri, 11 Sep 2026 09:41:01 -0600
Message-ID: <20260911154148.644489-12-axboe@kernel.dk>
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

If a blockable request issued inline from io_uring_enter() blocks, hand
the submitter's identity to an idle io-wq worker. The worker finishes
the io_uring_enter() call and returns to userspace as the submitter,
while the original task finishes the request and lives on as the
worker.

Requests are still issued with IO_URING_F_NONBLOCK, but any sleep they
hit anyway (page fault, lock, allocation stall) no longer blocks the
submitter.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 include/linux/io_uring.h       |   4 +
 include/linux/io_uring_types.h |  34 ++++
 io_uring/Makefile              |   1 +
 io_uring/handoff.c             | 326 +++++++++++++++++++++++++++++++++
 io_uring/handoff.h             | 102 +++++++++++
 io_uring/io_uring.c            |  84 +++++++--
 io_uring/io_uring.h            |  36 +++-
 io_uring/msg_ring.c            |   2 +-
 io_uring/rw.c                  |   2 +-
 io_uring/tctx.c                |   6 +-
 io_uring/tw.c                  |  14 +-
 io_uring/uring_cmd.c           |   5 +-
 12 files changed, 596 insertions(+), 20 deletions(-)
 create mode 100644 io_uring/handoff.c
 create mode 100644 io_uring/handoff.h

diff --git a/include/linux/io_uring.h b/include/linux/io_uring.h
index 969de22c3d0f..4137276ba8f1 100644
--- a/include/linux/io_uring.h
+++ b/include/linux/io_uring.h
@@ -61,8 +61,12 @@ static inline int io_uring_fork(struct task_struct *tsk)
 #endif
 
 /* called from sched_submit_work() when a PF_IO_HANDOFF task blocks */
+#if defined(CONFIG_IO_URING) && defined(CONFIG_THREAD_HANDOFF)
+void io_uring_task_sleeping(struct task_struct *tsk);
+#else
 static inline void io_uring_task_sleeping(struct task_struct *tsk)
 {
 }
+#endif
 
 #endif
diff --git a/include/linux/io_uring_types.h b/include/linux/io_uring_types.h
index 0b0d73688b8c..81bc4810fcab 100644
--- a/include/linux/io_uring_types.h
+++ b/include/linux/io_uring_types.h
@@ -4,9 +4,11 @@
 #include <linux/blk_plug.h>
 #include <linux/hashtable.h>
 #include <linux/task_work.h>
+#include <linux/thread_handoff.h>
 #include <linux/bitmap.h>
 #include <linux/llist.h>
 #include <linux/uio.h>
+#include <linux/signal_types.h>
 #include <uapi/linux/io_uring.h>
 
 struct iou_loop_params;
@@ -139,12 +141,42 @@ struct io_br_sel {
  */
 #define IO_RINGFD_REG_MAX 16
 
+/* handoff state of a submitter that blocked inline, see io_uring/handoff.c */
+struct io_handoff {
+	/* the request being issued, while a handoff is possible */
+	struct io_kiocb			*req;
+	/* its ring and io-wq pool, @req is the demoted task's after that */
+	struct io_ring_ctx		*ctx;
+	bool				bound;
+	/* the submitter's signal mask while blocking issues run without */
+	sigset_t			sigmask;
+	bool				sigsaved;
+	/* the task the identity came from, and the task refs it held */
+	struct task_struct		*src;
+	unsigned int			src_refs;
+	struct thread_handoff_stats	stats;
+	/* io_uring_enter() arguments, to resume the syscall */
+	struct file			*file;
+	u32				to_submit;
+	/* SQEs consumed so far by this syscall, across handoffs */
+	u32				consumed;
+	u32				min_complete;
+	u32				flags;
+	const void __user		*argp;
+	size_t				argsz;
+};
+
 struct io_uring_task {
 	/* submission side */
 	int				cached_refs;
 	const struct io_ring_ctx 	*last;
 	struct task_struct		*task;
+	/* serializes ->task changes against off-task reference puts */
+	raw_spinlock_t			task_ref_lock;
 	struct io_wq			*io_wq;
+#ifdef CONFIG_THREAD_HANDOFF
+	struct io_handoff		handoff;
+#endif
 	/*
 	 * Consumer cursor for ->task_list. Only popped by the task itself,
 	 * or by ->fallback_work once the task can no longer run task_work.
@@ -298,6 +330,8 @@ struct io_submit_state {
 	bool			need_plug;
 	bool			cq_flush;
 	unsigned short		submit_nr;
+	/* cached SQ head at the start of the batch */
+	unsigned int		sq_head;
 	/* the submitting task's plug, lives on its stack */
 	struct blk_plug		*plug;
 };
diff --git a/io_uring/Makefile b/io_uring/Makefile
index c54e328d1410..9fd99118d26a 100644
--- a/io_uring/Makefile
+++ b/io_uring/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_IO_URING)		+= io_uring.o opdef.o kbuf.o rsrc.o notif.o \
 
 obj-$(CONFIG_IO_URING_ZCRX)	+= zcrx.o
 obj-$(CONFIG_IO_WQ)		+= io-wq.o
+obj-$(CONFIG_THREAD_HANDOFF)	+= handoff.o
 obj-$(CONFIG_FUTEX)		+= futex.o
 obj-$(CONFIG_EPOLL)		+= epoll.o
 obj-$(CONFIG_NET_RX_BUSY_POLL)	+= napi.o
diff --git a/io_uring/handoff.c b/io_uring/handoff.c
new file mode 100644
index 000000000000..25e9e06812a7
--- /dev/null
+++ b/io_uring/handoff.c
@@ -0,0 +1,326 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Inline issue handoff: if an inline issue blocks, the submitter's identity
+ * moves to an idle io-wq worker which returns to userspace as the submitter,
+ * while the submitter finishes the request as the worker.
+ *
+ * Copyright (C) 2026 Jens Axboe
+ */
+#include <linux/kernel.h>
+#include <linux/errno.h>
+#include <linux/sched.h>
+#include <linux/sched/task.h>
+#include <linux/sched/signal.h>
+#include <linux/sched/task_stack.h>
+#include <linux/signal.h>
+#include <linux/task_work.h>
+#include <linux/thread_handoff.h>
+#include <linux/io_uring.h>
+#include <linux/blkdev.h>
+#include <linux/fs.h>
+#include <linux/file.h>
+#include <asm/syscall.h>
+
+#include "io_uring.h"
+#include "io-wq.h"
+#include "opdef.h"
+#include "tctx.h"
+#include "handoff.h"
+
+int sysctl_io_uring_handoff __read_mostly = 1;
+
+static long io_handoff_resume(void);
+
+/* fork a spare worker upfront, so the first blockable issue has a target */
+void io_handoff_prime(struct io_uring_task *tctx, struct io_ring_ctx *ctx)
+{
+	if (!sysctl_io_uring_handoff || !tctx->io_wq)
+		return;
+	/* handoffs are never done for these, see __io_handoff_begin() */
+	if (ctx->flags & (IORING_SETUP_IOPOLL | IORING_SETUP_SQPOLL |
+			  IORING_SETUP_SQ_REWIND))
+		return;
+	io_wq_handoff_spare(tctx->io_wq, true, true);
+}
+
+/*
+ * Blocking inline issues run with an io-wq worker's signal mask, a request
+ * shouldn't fail with -EINTR because the submitter has a timer.
+ */
+static void io_handoff_block_signals(struct io_handoff *ho)
+{
+	sigset_t mask;
+
+	if (ho->sigsaved)
+		return;
+	ho->sigsaved = true;
+	ho->sigmask = current->blocked;
+	siginitsetinv(&mask, sigmask(SIGKILL) | sigmask(SIGSTOP));
+	set_current_blocked(&mask);
+}
+
+void __io_handoff_restore_signals(struct io_handoff *ho)
+{
+	ho->sigsaved = false;
+	set_current_blocked(&ho->sigmask);
+}
+
+/*
+ * Arm a handoff for the inline issue of @req. Until io_handoff_end() the issue
+ * runs like on io-wq, neither normal signals nor task_work interrupt it.
+ */
+bool __io_handoff_begin(struct io_kiocb *req)
+{
+	struct io_ring_ctx *ctx = req->ctx;
+	struct io_uring_task *tctx = current->io_uring;
+	struct io_handoff *ho = &tctx->handoff;
+
+	if (!sysctl_io_uring_handoff)
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
+	if (!tctx->io_wq)
+		return false;
+	if (!thread_handoff_allowed(current))
+		return false;
+	/* the SQ head is published while we may still be running */
+	if (io_req_sqe_copy(req, IO_URING_F_INLINE))
+		return false;
+	/* have a worker ready to take over */
+	if (!io_wq_handoff_spare(tctx->io_wq, !io_req_unbound(req), false))
+		return false;
+	/* would interrupt the issue right away, and can't be handled here */
+	if (signal_pending(current))
+		return false;
+
+	ho->req = req;
+	io_handoff_block_signals(ho);
+	current->flags |= PF_IO_HANDOFF;
+	return true;
+}
+
+/* Returns true if the identity got handed off during the issue */
+bool io_handoff_end(void)
+{
+	bool handed_off = current->flags & PF_IO_WORKER;
+
+	current->flags &= ~PF_IO_HANDOFF;
+	/* pairs with io_wq_task_work_add(), notify for work queued meanwhile */
+	smp_mb();
+	if (task_work_pending(current))
+		set_notify_signal(current);
+
+	/* once handed off the tctx isn't ours anymore */
+	if (likely(!handed_off))
+		current->io_uring->handoff.req = NULL;
+	return handed_off;
+}
+
+/* close our part of the batch and drop uring_lock for the promoted task */
+static void io_handoff_release_ring(struct io_ring_ctx *ctx,
+				    struct io_handoff *ho)
+	__releases(&ctx->uring_lock)
+{
+	lockdep_assert_held(&ctx->uring_lock);
+
+	ho->consumed += io_submit_sqes_abandon(ctx);
+	mutex_unlock(&ctx->uring_lock);
+}
+
+/* move the outstanding tctx task refs from @src to @dst, see io_put_task() */
+static void io_handoff_task_refs(struct io_uring_task *tctx,
+				 struct task_struct *src,
+				 struct task_struct *dst)
+{
+	unsigned int nr;
+
+	raw_spin_lock(&tctx->task_ref_lock);
+	nr = percpu_counter_sum(&tctx->inflight);
+	refcount_add(nr, &dst->usage);
+	WRITE_ONCE(tctx->task, dst);
+	raw_spin_unlock(&tctx->task_ref_lock);
+
+	/* dropped by the promoted task once it's done taking over */
+	tctx->handoff.src_refs = nr;
+}
+
+/* move tctx task_work queued on @task along to the tctx's new task */
+void io_handoff_tw_moved(struct io_uring_task *tctx, struct task_struct *task)
+{
+	struct task_struct *cur;
+
+	while (task_work_cancel(task, &tctx->task_work)) {
+		cur = READ_ONCE(tctx->task);
+		if (WARN_ON_ONCE(task_work_add(cur, &tctx->task_work, TWA_SIGNAL)))
+			break;
+		if (READ_ONCE(tctx->task) == cur)
+			break;
+		task = cur;
+	}
+}
+
+/* Move the io_uring task state from @src to @dst */
+static void io_handoff_move_tctx(struct io_uring_task *tctx,
+				 struct task_struct *src,
+				 struct task_struct *dst)
+{
+	struct io_tctx_node *node;
+
+	io_handoff_task_refs(tctx, src, dst);
+
+	dst->io_uring = tctx;
+	src->io_uring = NULL;
+	dst->io_uring_restrict = src->io_uring_restrict;
+	src->io_uring_restrict = NULL;
+
+	list_for_each_entry(node, &tctx->node_list, tctx_link) {
+		struct io_ring_ctx *ctx = node->ctx;
+
+		node->task = dst;
+		if (READ_ONCE(ctx->submitter_task) == src) {
+			get_task_struct(dst);
+			WRITE_ONCE(ctx->submitter_task, dst);
+			put_task_struct(src);
+		}
+	}
+
+	io_handoff_tw_moved(tctx, src);
+}
+
+/*
+ * Called from sched_submit_work() when a task blocks inside an inline issue,
+ * hand our identity to an idle worker. Can't block, uring_lock is held.
+ */
+void io_uring_task_sleeping(struct task_struct *tsk)
+{
+	struct io_uring_task *tctx = tsk->io_uring;
+	struct io_handoff *ho = &tctx->handoff;
+	struct io_kiocb *req = ho->req;
+	struct io_ring_ctx *ctx = req->ctx;
+	struct task_struct *dst;
+	bool bound;
+
+	WARN_ON_ONCE(tsk != current);
+
+	/* the issue path is touching state that needs the ring lock held */
+	if (ctx->submit_lock_depth)
+		return;
+	if (!thread_handoff_prepare(tsk))
+		return;
+
+	/* don't let the woken worker preempt us before we've committed */
+	preempt_disable();
+	bound = !io_req_unbound(req);
+	dst = io_wq_handoff_claim(tctx->io_wq, bound, io_handoff_resume);
+	if (!dst) {
+		preempt_enable();
+		return;
+	}
+
+	/* committed, @req is ours as the worker from here on */
+	ho->src = tsk;
+	ho->ctx = ctx;
+	ho->bound = bound;
+	thread_handoff_stats_take(&ho->stats);
+
+	io_handoff_release_ring(ctx, ho);
+	io_handoff_move_tctx(tctx, tsk, dst);
+	io_wq_handoff_commit(dst);
+
+	/* do what sched_submit_work() would have done for an io-wq worker */
+	io_wq_worker_sleeping(tsk);
+	preempt_enable();
+}
+
+/* the issue of @req blocked and we're a worker now, finish it like io-wq */
+int io_handoff_complete(struct io_kiocb *req, int ret)
+{
+	WARN_ON_ONCE(!io_wq_current_is_worker());
+
+	if (ret == IOU_COMPLETE) {
+		req->io_task_work.func = io_req_task_complete;
+		io_req_task_work_add(req);
+	} else if (ret == IOU_ISSUE_SKIP_COMPLETE) {
+		/* completes on its own */
+	} else if ((ret == -EAGAIN && !(req->flags & REQ_F_NOWAIT)) ||
+		   io_issue_wants_restart(ret)) {
+		/* wants a blocking retry, or got interrupted, io-wq does that */
+		io_queue_iowq(req);
+	} else {
+		io_req_task_queue_fail(req, ret);
+	}
+
+	return -EIOCBQUEUED;
+}
+
+/* runs on the promoted task, finishes io_uring_enter() for the submitter */
+static long io_handoff_resume(void)
+{
+	struct io_uring_task *tctx = current->io_uring;
+	struct io_handoff *ho = &tctx->handoff;
+	struct task_struct *src = ho->src;
+	struct io_ring_ctx *ctx = ho->ctx;
+	bool bound = ho->bound;
+	long ret;
+
+	if (WARN_ON_ONCE(thread_handoff_finish(src, &ho->stats)))
+		force_sig(SIGKILL);
+	io_wq_handoff_finished(src);
+	put_task_struct_many(src, ho->src_refs);
+	ho->src_refs = 0;
+	ho->src = NULL;
+	ho->req = NULL;
+	ho->ctx = NULL;
+
+	/* flush what the blocked batch left behind, then submit the rest */
+	io_run_task_work();
+	mutex_lock(&ctx->uring_lock);
+	io_submit_flush_completions(ctx);
+	if (ho->consumed < ho->to_submit) {
+		ret = io_submit_sqes(ctx, ho->to_submit - ho->consumed);
+		if (ret == -EIOCBQUEUED)
+			return ret;
+		if (ret > 0)
+			ho->consumed += ret;
+	}
+	/* the identity came with the mask the blocking issue ran under */
+	io_handoff_submit_end();
+	ret = ho->consumed;
+	if (ret != ho->to_submit) {
+		mutex_unlock(&ctx->uring_lock);
+	} else {
+		ret = io_uring_enter_finish(ctx, ret, ho->min_complete,
+					    ho->flags, ho->argp, ho->argsz);
+	}
+	if (!(ho->flags & IORING_ENTER_REGISTERED_RING))
+		fput(ho->file);
+
+	/* we took a worker, top the spare pool back up now the work is done */
+	io_wq_handoff_spare(tctx->io_wq, bound, true);
+
+	syscall_set_return_value(current, task_pt_regs(current),
+				 ret < 0 ? ret : 0, ret);
+	return ret;
+}
+
+/* run the worker loop after a demotion, returns once handed an identity */
+long io_uring_handoff_worker(void)
+{
+	io_wq_handoff_fn *fn;
+	long ret;
+
+	do {
+		fn = io_wq_handoff_worker();
+		ret = fn();
+	} while (ret == -EIOCBQUEUED);
+
+	return ret;
+}
diff --git a/io_uring/handoff.h b/io_uring/handoff.h
new file mode 100644
index 000000000000..833c6314d3b7
--- /dev/null
+++ b/io_uring/handoff.h
@@ -0,0 +1,102 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef IOU_HANDOFF_H
+#define IOU_HANDOFF_H
+
+#include <linux/io_uring_types.h>
+#include "opdef.h"
+#include "tw.h"
+
+/* a blocking issue got interrupted, retry on io-wq rather than restart */
+static inline bool io_issue_wants_restart(int ret)
+{
+	return ret == -ERESTARTSYS || ret == -ERESTARTNOINTR ||
+	       ret == -ERESTARTNOHAND || ret == -ERESTART_RESTARTBLOCK;
+}
+
+#ifdef CONFIG_THREAD_HANDOFF
+extern int sysctl_io_uring_handoff;
+
+bool __io_handoff_begin(struct io_kiocb *req);
+void io_handoff_prime(struct io_uring_task *tctx, struct io_ring_ctx *ctx);
+bool io_handoff_end(void);
+void __io_handoff_restore_signals(struct io_handoff *ho);
+int io_handoff_complete(struct io_kiocb *req, int ret);
+long io_uring_handoff_worker(void);
+void io_handoff_tw_moved(struct io_uring_task *tctx, struct task_struct *task);
+
+/*
+ * Stash the io_uring_enter() arguments so a promoted task can resume it, and
+ * run pending task_work so it doesn't interrupt a blocking issue later.
+ */
+static inline void io_handoff_enter(struct file *file, u32 to_submit,
+				    u32 min_complete, u32 flags,
+				    const void __user *argp, size_t argsz)
+{
+	struct io_handoff *ho = &current->io_uring->handoff;
+
+	io_run_task_work();
+	ho->file = file;
+	ho->to_submit = to_submit;
+	ho->consumed = 0;
+	ho->min_complete = min_complete;
+	ho->flags = flags;
+	ho->argp = argp;
+	ho->argsz = argsz;
+}
+
+/* a submit call is done issuing, restore the signal mask if we changed it */
+static inline void io_handoff_submit_end(void)
+{
+	struct io_handoff *ho = &current->io_uring->handoff;
+
+	if (unlikely(ho->sigsaved))
+		__io_handoff_restore_signals(ho);
+}
+
+/* if true, @req gets a blocking inline issue. Pair with io_handoff_end() */
+static inline bool io_handoff_begin(struct io_kiocb *req,
+				    const struct io_issue_def *def,
+				    unsigned int issue_flags)
+{
+	if (!(issue_flags & IO_URING_F_INLINE) || !def->blockable)
+		return false;
+	return __io_handoff_begin(req);
+}
+#else
+static inline void io_handoff_enter(struct file *file, u32 to_submit,
+				    u32 min_complete, u32 flags,
+				    const void __user *argp, size_t argsz)
+{
+}
+static inline bool io_handoff_begin(struct io_kiocb *req,
+				    const struct io_issue_def *def,
+				    unsigned int issue_flags)
+{
+	return false;
+}
+static inline void io_handoff_submit_end(void)
+{
+}
+static inline bool io_handoff_end(void)
+{
+	return false;
+}
+static inline int io_handoff_complete(struct io_kiocb *req, int ret)
+{
+	return -EFAULT;
+}
+static inline long io_uring_handoff_worker(void)
+{
+	return -EFAULT;
+}
+static inline void io_handoff_tw_moved(struct io_uring_task *tctx,
+				       struct task_struct *task)
+{
+}
+static inline void io_handoff_prime(struct io_uring_task *tctx,
+				    struct io_ring_ctx *ctx)
+{
+}
+#endif
+
+#endif
diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 100ade1eee3e..289e9ddc8c24 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -98,6 +98,7 @@
 #include "wait.h"
 #include "bpf_filter.h"
 #include "loop.h"
+#include "handoff.h"
 
 #define SQE_COMMON_FLAGS (IOSQE_FIXED_FILE | IOSQE_IO_LINK | \
 			  IOSQE_IO_HARDLINK | IOSQE_ASYNC)
@@ -119,7 +120,7 @@
 /* requests with any of those set should undergo io_disarm_next() */
 #define IO_DISARM_MASK (REQ_F_ARM_LTIMEOUT | REQ_F_LINK_TIMEOUT | REQ_F_FAIL)
 
-static void io_queue_sqe(struct io_kiocb *req, unsigned int extra_flags);
+static int io_queue_sqe(struct io_kiocb *req, unsigned int extra_flags);
 static void __io_req_caches_free(struct io_ring_ctx *ctx);
 
 static __read_mostly DEFINE_STATIC_KEY_DEFERRED_FALSE(io_key_has_sqarray, HZ);
@@ -132,6 +133,17 @@ static int __read_mostly sysctl_io_uring_group = -1;
 
 #ifdef CONFIG_SYSCTL
 static const struct ctl_table kernel_io_uring_disabled_table[] = {
+#ifdef CONFIG_THREAD_HANDOFF
+	{
+		.procname	= "io_uring_handoff",
+		.data		= &sysctl_io_uring_handoff,
+		.maxlen		= sizeof(sysctl_io_uring_handoff),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec_minmax,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= SYSCTL_ONE,
+	},
+#endif
 	{
 		.procname	= "io_uring_disabled",
 		.data		= &sysctl_io_uring_disabled,
@@ -384,9 +396,8 @@ static void io_prep_async_work(struct io_kiocb *req)
 			should_hash = false;
 		if (should_hash || (req->flags & REQ_F_IOPOLL))
 			io_wq_hash_work(&req->work, file_inode(req->file));
-	} else if (!req->file || !S_ISBLK(file_inode(req->file)->i_mode)) {
-		if (def->unbound_nonreg_file)
-			atomic_or(IO_WQ_WORK_UNBOUND, &req->work.flags);
+	} else if (io_req_unbound(req)) {
+		atomic_or(IO_WQ_WORK_UNBOUND, &req->work.flags);
 	}
 }
 
@@ -595,10 +606,16 @@ static inline void io_put_task(struct io_kiocb *req)
 	if (likely(tctx->task == current)) {
 		tctx->cached_refs++;
 	} else {
+		struct task_struct *task;
+
+		/* ->task can change under us, see io_handoff_task_refs() */
+		raw_spin_lock(&tctx->task_ref_lock);
 		percpu_counter_sub(&tctx->inflight, 1);
+		task = tctx->task;
+		raw_spin_unlock(&tctx->task_ref_lock);
 		if (unlikely(atomic_read(&tctx->in_cancel)))
 			wake_up(&tctx->wait);
-		put_task_struct(tctx->task);
+		put_task_struct(task);
 	}
 }
 
@@ -1401,12 +1418,16 @@ static inline int __io_issue_sqe(struct io_kiocb *req,
 static int io_issue_sqe(struct io_kiocb *req, unsigned int issue_flags)
 {
 	const struct io_issue_def *def = &io_issue_defs[req->opcode];
+	bool handoff;
 	int ret;
 
 	if (unlikely(!io_assign_file(req, def, issue_flags)))
 		return -EBADF;
 
+	handoff = io_handoff_begin(req, def, issue_flags);
 	ret = __io_issue_sqe(req, issue_flags, def);
+	if (handoff && unlikely(io_handoff_end()))
+		return io_handoff_complete(req, ret);
 
 	if (ret == IOU_COMPLETE) {
 		if (issue_flags & IO_URING_F_COMPLETE_DEFER)
@@ -1590,7 +1611,7 @@ struct file *io_file_get_normal(struct io_kiocb *req, int fd)
 	return file;
 }
 
-static int io_req_sqe_copy(struct io_kiocb *req, unsigned int issue_flags)
+int io_req_sqe_copy(struct io_kiocb *req, unsigned int issue_flags)
 {
 	const struct io_cold_def *def = &io_cold_defs[req->opcode];
 
@@ -1630,7 +1651,8 @@ static void io_queue_async(struct io_kiocb *req, unsigned int issue_flags, int r
 	}
 }
 
-static inline void io_queue_sqe(struct io_kiocb *req, unsigned int extra_flags)
+/* returns -EIOCBQUEUED if the identity got handed off, we're a worker now */
+static inline int io_queue_sqe(struct io_kiocb *req, unsigned int extra_flags)
 	__must_hold(&req->ctx->uring_lock)
 {
 	unsigned int issue_flags = IO_URING_F_NONBLOCK |
@@ -1638,6 +1660,8 @@ static inline void io_queue_sqe(struct io_kiocb *req, unsigned int extra_flags)
 	int ret;
 
 	ret = io_issue_sqe(req, issue_flags);
+	if (unlikely(ret == -EIOCBQUEUED))
+		return ret;
 
 	/*
 	 * We async punt it if the file wasn't marked NOWAIT, or if the file
@@ -1645,6 +1669,7 @@ static inline void io_queue_sqe(struct io_kiocb *req, unsigned int extra_flags)
 	 */
 	if (unlikely(ret))
 		io_queue_async(req, issue_flags, ret);
+	return 0;
 }
 
 static void io_queue_sqe_fallback(struct io_kiocb *req)
@@ -1922,8 +1947,7 @@ static inline int io_submit_sqe(struct io_ring_ctx *ctx, struct io_kiocb *req,
 		return 0;
 	}
 
-	io_queue_sqe(req, IO_URING_F_INLINE);
-	return 0;
+	return io_queue_sqe(req, IO_URING_F_INLINE);
 }
 
 /*
@@ -2033,6 +2057,25 @@ static int io_submit_sqes_end(struct io_ring_ctx *ctx, unsigned int entries,
 	return ret;
 }
 
+#ifdef CONFIG_THREAD_HANDOFF
+/*
+ * The submitter blocked mid-batch, return the task refs for what it won't
+ * submit and publish the SQ head. Returns the number of entries consumed.
+ */
+unsigned int io_submit_sqes_abandon(struct io_ring_ctx *ctx)
+	__must_hold(&ctx->uring_lock)
+{
+	struct io_submit_state *state = &ctx->submit_state;
+	unsigned int consumed = ctx->cached_sq_head - state->sq_head;
+
+	WARN_ON_ONCE(state->link.head);
+	current->io_uring->cached_refs += state->submit_nr - consumed;
+	state->plug_started = false;
+	io_commit_sqring(ctx);
+	return consumed;
+}
+#endif
+
 int io_submit_sqes(struct io_ring_ctx *ctx, unsigned int nr)
 	__must_hold(&ctx->uring_lock)
 {
@@ -2052,10 +2095,12 @@ int io_submit_sqes(struct io_ring_ctx *ctx, unsigned int nr)
 	left = entries;
 	io_get_task_refs(left);
 	io_submit_state_start(&ctx->submit_state, &plug, left);
+	ctx->submit_state.sq_head = ctx->cached_sq_head;
 
 	do {
 		const struct io_uring_sqe *sqe;
 		struct io_kiocb *req;
+		int ret;
 
 		if (unlikely(!io_alloc_req(ctx, &req)))
 			break;
@@ -2064,17 +2109,24 @@ int io_submit_sqes(struct io_ring_ctx *ctx, unsigned int nr)
 			break;
 		}
 
+		ret = io_submit_sqe(ctx, req, sqe, &left);
+		/* handed off, the promoted task finishes the batch */
+		if (unlikely(ret == -EIOCBQUEUED)) {
+			if (current->plug == &plug)
+				blk_finish_plug(&plug);
+			return ret;
+		}
 		/*
 		 * Continue submitting even for sqe failure if the
 		 * ring was setup with IORING_SETUP_SUBMIT_ALL
 		 */
-		if (unlikely(io_submit_sqe(ctx, req, sqe, &left)) &&
-		    !(ctx->flags & IORING_SETUP_SUBMIT_ALL)) {
+		if (unlikely(ret) && !(ctx->flags & IORING_SETUP_SUBMIT_ALL)) {
 			left--;
 			break;
 		}
 	} while (--left);
 
+	io_handoff_submit_end();
 	return io_submit_sqes_end(ctx, entries, left);
 }
 
@@ -2656,7 +2708,7 @@ static int io_uring_getevents(struct io_ring_ctx *ctx, int ret,
 }
 
 /* Finish an io_uring_enter() call that submitted and holds the uring_lock */
-static int io_uring_enter_finish(struct io_ring_ctx *ctx, int ret, u32 min_complete,
+int io_uring_enter_finish(struct io_ring_ctx *ctx, int ret, u32 min_complete,
 			  u32 flags, const void __user *argp, size_t argsz)
 {
 	int ret2;
@@ -2733,8 +2785,16 @@ SYSCALL_DEFINE6(io_uring_enter, unsigned int, fd, u32, to_submit,
 		if (unlikely(ret))
 			goto out;
 
+		io_handoff_enter(file, to_submit, min_complete, flags, argp,
+				 argsz);
 		mutex_lock(&ctx->uring_lock);
 		ret = io_submit_sqes(ctx, to_submit);
+		/* handed off, the promoted task finishes the syscall */
+		if (unlikely(ret == -EIOCBQUEUED)) {
+			/* uring_lock was dropped for the promoted task */
+			__release(&ctx->uring_lock);
+			return io_uring_handoff_worker();
+		}
 		if (ret != to_submit) {
 			mutex_unlock(&ctx->uring_lock);
 			goto out;
diff --git a/io_uring/io_uring.h b/io_uring/io_uring.h
index 870bb4dcc415..79db0a8b9cc8 100644
--- a/io_uring/io_uring.h
+++ b/io_uring/io_uring.h
@@ -211,6 +211,10 @@ void io_free_req(struct io_kiocb *req);
 void io_queue_next(struct io_kiocb *req);
 void io_task_refs_refill(struct io_uring_task *tctx);
 bool __io_alloc_req_refill(struct io_ring_ctx *ctx);
+int io_req_sqe_copy(struct io_kiocb *req, unsigned int issue_flags);
+unsigned int io_submit_sqes_abandon(struct io_ring_ctx *ctx);
+int io_uring_enter_finish(struct io_ring_ctx *ctx, int ret, u32 min_complete,
+			  u32 flags, const void __user *argp, size_t argsz);
 
 void io_activate_pollwq(struct io_ring_ctx *ctx);
 void io_restriction_clone(struct io_restriction *dst, struct io_restriction *src);
@@ -389,13 +393,41 @@ static inline void io_put_file(struct io_kiocb *req)
 		fput(req->file);
 }
 
+/* a handed off issue keeps its issue_flags but no longer holds uring_lock */
+static inline bool io_issue_handed_off(unsigned int issue_flags)
+{
+	return !(issue_flags & IO_URING_F_UNLOCKED) &&
+		(current->flags & (PF_IO_HANDOFF | PF_IO_WORKER)) ==
+			(PF_IO_HANDOFF | PF_IO_WORKER);
+}
+
+/* which io-wq pool a request belongs in, bound unless a non-reg file op */
+static inline bool io_req_unbound(struct io_kiocb *req)
+{
+	if (!io_issue_defs[req->opcode].unbound_nonreg_file)
+		return false;
+	if (req->file) {
+		umode_t mode = file_inode(req->file)->i_mode;
+
+		if (S_ISREG(mode) || S_ISBLK(mode))
+			return false;
+	}
+	return true;
+}
+
+static inline bool io_issue_needs_lock(unsigned int issue_flags)
+{
+	return (issue_flags & IO_URING_F_UNLOCKED) ||
+		io_issue_handed_off(issue_flags);
+}
+
 static inline void io_ring_submit_unlock(struct io_ring_ctx *ctx,
 					 unsigned issue_flags)
 {
 	lockdep_assert_held(&ctx->uring_lock);
 	lockdep_assert(ctx->submit_lock_depth > 0);
 	ctx->submit_lock_depth--;
-	if (unlikely(issue_flags & IO_URING_F_UNLOCKED))
+	if (unlikely(io_issue_needs_lock(issue_flags)))
 		mutex_unlock(&ctx->uring_lock);
 }
 
@@ -408,7 +440,7 @@ static inline void io_ring_submit_lock(struct io_ring_ctx *ctx,
 	 * The only exception is when we've detached the request and issue it
 	 * from an async worker thread, grab the lock for that case.
 	 */
-	if (unlikely(issue_flags & IO_URING_F_UNLOCKED))
+	if (unlikely(io_issue_needs_lock(issue_flags)))
 		mutex_lock(&ctx->uring_lock);
 	lockdep_assert_held(&ctx->uring_lock);
 	ctx->submit_lock_depth++;
diff --git a/io_uring/msg_ring.c b/io_uring/msg_ring.c
index 3067c9343991..04f2ffe4381d 100644
--- a/io_uring/msg_ring.c
+++ b/io_uring/msg_ring.c
@@ -245,7 +245,7 @@ static int io_msg_fd_remote(struct io_kiocb *req)
 	struct task_struct *task = ctx->submitter_task;
 
 	init_task_work(&msg->tw, io_msg_tw_fd_complete);
-	if (task_work_add(task, &msg->tw, TWA_SIGNAL))
+	if (io_wq_task_work_add(task, &msg->tw, TWA_SIGNAL))
 		return -EOWNERDEAD;
 
 	return IOU_ISSUE_SKIP_COMPLETE;
diff --git a/io_uring/rw.c b/io_uring/rw.c
index 95106dd1d7eb..23b078fe2991 100644
--- a/io_uring/rw.c
+++ b/io_uring/rw.c
@@ -134,7 +134,7 @@ static bool io_rw_recycle(struct io_kiocb *req, unsigned int issue_flags)
 {
 	struct io_async_rw *rw = req->async_data;
 
-	if (unlikely(issue_flags & IO_URING_F_UNLOCKED))
+	if (unlikely(io_issue_needs_lock(issue_flags)))
 		return false;
 
 	io_alloc_cache_vec_kasan(&rw->vec);
diff --git a/io_uring/tctx.c b/io_uring/tctx.c
index 737dfad4a976..f86aca489d15 100644
--- a/io_uring/tctx.c
+++ b/io_uring/tctx.c
@@ -10,6 +10,7 @@
 #include <uapi/linux/io_uring.h>
 
 #include "io_uring.h"
+#include "handoff.h"
 #include "tctx.h"
 #include "bpf_filter.h"
 
@@ -104,6 +105,7 @@ __cold struct io_uring_task *io_uring_alloc_task_context(struct task_struct *tas
 	}
 
 	tctx->task = task;
+	raw_spin_lock_init(&tctx->task_ref_lock);
 	xa_init(&tctx->xa);
 	INIT_LIST_HEAD(&tctx->node_list);
 	init_waitqueue_head(&tctx->wait);
@@ -175,8 +177,10 @@ int __io_uring_add_tctx_node(struct io_ring_ctx *ctx)
 	 * been marked for idle-exit when the task temporarily had no active
 	 * io_uring instances.
 	 */
-	if (tctx->io_wq)
+	if (tctx->io_wq) {
 		io_wq_set_exit_on_idle(tctx->io_wq, false);
+		io_handoff_prime(tctx, ctx);
+	}
 
 	if (new_tctx)
 		current->io_uring = tctx;
diff --git a/io_uring/tw.c b/io_uring/tw.c
index f573bcc3af6a..f26faeb5d21c 100644
--- a/io_uring/tw.c
+++ b/io_uring/tw.c
@@ -9,6 +9,7 @@
 #include <linux/indirect_call_wrapper.h>
 
 #include "io_uring.h"
+#include "handoff.h"
 #include "tctx.h"
 #include "poll.h"
 #include "rw.h"
@@ -130,6 +131,10 @@ void tctx_task_work(struct callback_head *cb)
 	unsigned int count = 0;
 
 	tctx = container_of(cb, struct io_uring_task, task_work);
+	/* the tctx may have moved while queued, run it there if so */
+	if (unlikely(READ_ONCE(tctx->task) != current) &&
+	    !task_work_add(tctx->task, cb, TWA_SIGNAL))
+		return;
 	tctx_task_work_run(tctx, UINT_MAX, &count);
 }
 
@@ -209,6 +214,7 @@ void io_req_normal_work_add(struct io_kiocb *req)
 {
 	struct io_uring_task *tctx = req->tctx;
 	struct io_ring_ctx *ctx = req->ctx;
+	struct task_struct *task;
 
 	/* tw run already pending, nothing else to do */
 	if (!mpscq_push(&tctx->task_list, &req->io_task_work.node))
@@ -227,8 +233,14 @@ void io_req_normal_work_add(struct io_kiocb *req)
 		return;
 	}
 
-	if (likely(!task_work_add(tctx->task, &tctx->task_work, ctx->notify_method)))
+	task = READ_ONCE(tctx->task);
+	if (likely(!io_wq_task_work_add(task, &tctx->task_work,
+					 ctx->notify_method))) {
+		/* the tctx moved while we were adding, move the work along */
+		if (unlikely(READ_ONCE(tctx->task) != task))
+			io_handoff_tw_moved(tctx, task);
 		return;
+	}
 
 	io_fallback_tw(tctx);
 }
diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
index 726a659f38c3..ba36a555db98 100644
--- a/io_uring/uring_cmd.c
+++ b/io_uring/uring_cmd.c
@@ -28,7 +28,7 @@ static void io_req_uring_cleanup(struct io_kiocb *req, unsigned int issue_flags)
 	struct io_uring_cmd *ioucmd = io_kiocb_to_cmd(req, struct io_uring_cmd);
 	struct io_async_cmd *ac = req->async_data;
 
-	if (issue_flags & IO_URING_F_UNLOCKED)
+	if (io_issue_needs_lock(issue_flags))
 		return;
 
 	io_alloc_cache_vec_kasan(&ac->vec);
@@ -172,7 +172,8 @@ void __io_uring_cmd_done(struct io_uring_cmd *ioucmd, s32 ret, u64 res2,
 	if (req->flags & REQ_F_IOPOLL) {
 		/* order with io_do_iopoll() checking ->iopoll_completed */
 		smp_store_release(&req->iopoll_completed, 1);
-	} else if (issue_flags & IO_URING_F_COMPLETE_DEFER) {
+	} else if ((issue_flags & IO_URING_F_COMPLETE_DEFER) &&
+		   !io_issue_handed_off(issue_flags)) {
 		if (WARN_ON_ONCE(issue_flags & IO_URING_F_UNLOCKED))
 			return;
 		io_req_complete_defer(req);
-- 
2.55.0

