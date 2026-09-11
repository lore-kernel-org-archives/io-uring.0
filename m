Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE6D49DBB6
	for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 15:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141706; cv=none; b=Xt0T15e/lYWxYQOUtFR+NuBYUh4BhADQlOriv4Q2tHDtXh1hAbyEkwbwudQk4BrpZjaVGFGmZAwgnLAqpv/mbLuuJzRFjY4eWPwOIRZreBDFjQ9OZYuYybFezqJDFs+3rbuuKJntUulHquYFcLtRkYsLocHOmIAZM0D+opZDyHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141706; c=relaxed/simple;
	bh=iWHEMDpGGsX368o7hGWO35yMRz05RL8XkJdNtV73dMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ie9PwtRPlE0nZASydr0AiwQ9/7qdvW216A306gxZt7lqdoXKlZtr2z6GQRbzrLrqgBeHZfZlIMXsqrEuegtFup2jEWayacHRIV5jud3nh89bHENhN/WdOb+lMvxvGRNXo6np6KxihyR73aDxJJQn7zrGipj2ON+kMRQgS6hvfWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=oeEAWzNe; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="oeEAWzNe"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7ffa69b7462so1117981a34.3
        for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 08:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141703; x=1789746503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vuyH74mKq018t9UBWeaznqAOfLSoNce2XDwrogqY5Q8=;
        b=oeEAWzNe5RPu5pb0BJNhrgObE9y/uuBN9cDqI4TRBTrgnfA2u1V3NnNuYe+lMFXSPJ
         8uFJXBPGiNAjFOKQTOGTsV03SflcWdDG5UQY0sXpq96gwqwqmiaRraMJAihOIrk9KB3M
         qIb2k0G2A0Mm6hjNRsE55BtNxO3ZucrSfWzz/lybQsViYyTOuMmF+R5sCHNiiDnQ9zIb
         Fm29AjOT7SggFa2Z2nqQbOpLwjZ2jEev+c944+dg9UEE1TIW0g0oihX0D4O3JaztjWd8
         DO0BBhiq90dN8HlVKhRfGUuA2HoFXeNR7/Zwv7DvvFnJ/SWkeN17clHEBCy7BylMSL4y
         B1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141703; x=1789746503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vuyH74mKq018t9UBWeaznqAOfLSoNce2XDwrogqY5Q8=;
        b=Q4Ysh13QwA34rlY0n6Bt799oDN7QN8N0tjfIge0ilMzpoNZOmLbGhZRtuo68DOnDVR
         yuJRbxvJPXUbIiXlVOPb025M6aHjpB9uGJQjerWGd9qWFqHb5I7ugUMca8hz1OFBIYSC
         NLBy6xYnSB2RfieNMuks5hgaFJrGnfzszJvdkiB6fWXel4XJutidHUQr+K2qVB1ha7Ak
         RkoAO7CVaCH148QO/gEOtDqtHIOv0d3VU6qN+Z86T4hJmc83+lJpP2g9lhdy8IXKkh7L
         Wx+d5BNs9uGplweEHdParVizvqJtXSu/EhmxqV84AijItWFJdvi4dj6muKRUInGaQh74
         dzuw==
X-Gm-Message-State: AFuF++lUK+ORu+EF5dFEJAV7GTBipF3dYJI9rp4cdjNyiSoqF0l5WKN2
	X7qsHM1sEOqAF8Tl7OkXUWap0I/D6z/WyXqSlWnYfzpf/S27RfmP5uhoS/RhYvL0J0s8ELDloTv
	QoQclo1c=
X-Gm-Gg: AYBFou1uwAcHeoJCozDS+Y+uQFPFA3Iqtwcndj6Qhxhcpt7KQ15EruPFwGkthMNgvf/
	BxlpXA87rojX2xpyE7oT+wI+dY+mMwyc/li+RszXLhRAfrIKpXixnZ/KN967vyt3wJoe+dbdZIa
	xSROiE75xEM0/PxTEG1NpGAnmv8W9FXOiIuhh2wyr+fK8j4g/MZhBE1uiD5ShuP07i1dtWJWGWD
	EqVHNyOgRsmTbtSPLblm/10OZwhp7sV0Qz0CrZY7E6evOU+dKmwlCdLGzV5ATiM9Gg8L9007iu3
	4SfQIlfIFBKUjCFLMQxpUTxX67BrsD9FgqwSAvXQaGrGP1ZUfu/dPJlAtgG8ULSmC2aCR6xYWE2
	ntMBRtl657plrFtzdtVojGSvIe5e9ooN4/4zNqI7z43azfWgS/biGYZEc/ttrjbPEuHsJcrTnda
	NdRVv2YIzKcM/fPtJDc4RzjIHFjC9RUq3Y9TyIFHaUNcdJPVUfRc5lbmQ6mz0VVpzEpv6nwvfKI
	SKEEabmRtKOrI1iN2uva6+F0ZqOVJBvIeqso++L1Xs=
X-Received: by 2002:a05:6830:3883:b0:7fa:ac4f:790 with SMTP id 46e09a7af769-8040166cb08mr3619369a34.28.1789141702916;
        Fri, 11 Sep 2026 08:48:22 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f6d1ca4bsm2629478a34.23.2026.09.11.08.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:48:21 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: juanlu@fastmail.com,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 07/10] io_uring/cancel: cancel and wait for all requests on process exit
Date: Fri, 11 Sep 2026 09:45:31 -0600
Message-ID: <20260911154811.646705-8-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911154811.646705-1-axboe@kernel.dk>
References: <20260911154811.646705-1-axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a task exits, io_uring only cancels and waits for the few request
types that must not outlive it, and leaves everything else to be torn
down whenever the ring itself goes away. This happens from a kernel
workqueue, and may be some time after the final fput of the ring has
been completed. This sometimes causes application issues, where a task
that was doing IO on a file in /mnt, for example, will leave /mnt busy
for a brief period of time after close(ring_fd) is done.

If the whole thread group is exiting, no thread is left to reap
completions or care about those requests. For this case, tear everything
down. This is basically what exec does today.

Two types of requests are ignored, as they never pin any files and will
always complete on their own. One is armed timeouts, which may still be
required to trigger if a ring is being shared, and the other is SEND_ZC
notifications, which can take almost an unbounded time to complete.
io_uring_try_cancel_requests() now takes flags to manage that behavior.

While in there, fix up the wait loop for the exit case. A task that is
exiting because of a fatal signal still has that signal pending, which
turns the interruptible sleep into a busy loop. Use short
uninterruptible sleeps in that case instead, task_work still gets run in
between.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/cancel.c   | 87 ++++++++++++++++++++++++++++++++++++++-------
 io_uring/cancel.h   | 13 ++++++-
 io_uring/io_uring.c |  2 +-
 io_uring/timeout.c  | 18 ++++++++++
 io_uring/timeout.h  |  2 ++
 5 files changed, 108 insertions(+), 14 deletions(-)

diff --git a/io_uring/cancel.c b/io_uring/cancel.c
index 5ee94246c43c..911a47075064 100644
--- a/io_uring/cancel.c
+++ b/io_uring/cancel.c
@@ -514,8 +514,9 @@ static __cold bool io_uring_try_cancel_iowq(struct io_ring_ctx *ctx)
 
 __cold bool io_uring_try_cancel_requests(struct io_ring_ctx *ctx,
 					 struct io_uring_task *tctx,
-					 bool cancel_all, bool is_sqpoll_thread)
+					 unsigned int flags)
 {
+	bool cancel_all = flags & IO_CANCEL_ALL;
 	struct io_task_cancel cancel = { .tctx = tctx, .all = cancel_all, };
 	enum io_wq_cancel cret;
 	bool ret = false;
@@ -544,7 +545,7 @@ __cold bool io_uring_try_cancel_requests(struct io_ring_ctx *ctx,
 
 	/* SQPOLL thread does its own polling */
 	if ((!(ctx->flags & IORING_SETUP_SQPOLL) && cancel_all) ||
-	    is_sqpoll_thread) {
+	    (flags & IO_CANCEL_SQPOLL)) {
 		while (!list_empty(&ctx->iopoll_list)) {
 			io_iopoll_try_reap_events(ctx);
 			ret = true;
@@ -561,6 +562,8 @@ __cold bool io_uring_try_cancel_requests(struct io_ring_ctx *ctx,
 	ret |= io_waitid_remove_all(ctx, tctx, cancel_all);
 	ret |= io_futex_remove_all(ctx, tctx, cancel_all);
 	ret |= io_uring_try_cancel_uring_cmd(ctx, tctx);
+	if (flags & IO_CANCEL_KEEP_TIMEOUTS)
+		cancel_all = false;
 	ret |= io_kill_timeouts(ctx, tctx, cancel_all);
 	mutex_unlock(&ctx->uring_lock);
 	if (tctx)
@@ -575,6 +578,44 @@ static s64 tctx_inflight(struct io_uring_task *tctx, bool tracked)
 	return percpu_counter_sum(&tctx->inflight);
 }
 
+/*
+ * If true, whole thread group is exiting, at which point no task is left that
+ * can reap completions and care about requests in-flight.
+ */
+static bool io_task_group_exiting(void)
+{
+	return current->signal->flags & SIGNAL_GROUP_EXIT;
+}
+
+/*
+ * Return a count of requests an exiting task should wait for. 
+ */
+static s64 tctx_inflight_exit(struct io_uring_task *tctx)
+{
+	struct io_tctx_node *node;
+	unsigned long index;
+	s64 inflight;
+
+	inflight = tctx_inflight(tctx, false);
+	xa_for_each(&tctx->xa, index, node) {
+		/* unlocked read is fine, the caller re-evaluates until done */
+		inflight -= data_race(node->ctx->nr_notifs);
+		/* takes ->uring_lock, we hold nothing on the group exit path */
+		inflight -= io_timeouts_armed(node->ctx, tctx);
+	}
+	return inflight;
+}
+
+static bool io_tctx_cancel_done(struct io_uring_task *tctx, bool cancel_all,
+				bool group_exit)
+{
+	if (cancel_all)
+		return !tctx_inflight(tctx, false);
+	if (tctx_inflight(tctx, true))
+		return false;
+	return !group_exit || tctx_inflight_exit(tctx) <= 0;
+}
+
 /*
  * Find any io_uring ctx that this task has registered or done IO on, and cancel
  * requests. @sqd should be not-null IFF it's an SQPOLL thread cancellation.
@@ -584,7 +625,9 @@ __cold void io_uring_cancel_generic(bool cancel_all, struct io_sq_data *sqd)
 	struct io_uring_task *tctx = current->io_uring;
 	struct io_ring_ctx *ctx;
 	struct io_tctx_node *node;
+	unsigned int flags = 0;
 	unsigned long index;
+	bool group_exit;
 	s64 inflight;
 	DEFINE_WAIT(wait);
 
@@ -595,18 +638,30 @@ __cold void io_uring_cancel_generic(bool cancel_all, struct io_sq_data *sqd)
 	if (tctx->io_wq)
 		io_wq_exit_start(tctx->io_wq);
 
+	/*
+	 * If a whole thread group is exiting, nobody will look at completions.
+	 * If a single thread is exiting, cancel only those that belong to that
+	 * thread.
+	 */
+	group_exit = !cancel_all && io_task_group_exiting();
+	if (cancel_all)
+		flags = IO_CANCEL_ALL;
+	else if (group_exit)
+		flags = IO_CANCEL_ALL | IO_CANCEL_KEEP_TIMEOUTS;
+	if (sqd)
+		flags |= IO_CANCEL_SQPOLL;
+
 	atomic_inc(&tctx->in_cancel);
 	do {
 		bool loop = false;
+		unsigned int state;
 
 		io_uring_drop_tctx_refs(current);
-		if (!tctx_inflight(tctx, !cancel_all))
+		if (io_tctx_cancel_done(tctx, cancel_all, group_exit))
 			break;
 
 		/* read completions before cancelations */
 		inflight = tctx_inflight(tctx, false);
-		if (!inflight)
-			break;
 
 		if (!sqd) {
 			xa_for_each(&tctx->xa, index, node) {
@@ -615,15 +670,13 @@ __cold void io_uring_cancel_generic(bool cancel_all, struct io_sq_data *sqd)
 					continue;
 				loop |= io_uring_try_cancel_requests(node->ctx,
 							current->io_uring,
-							cancel_all,
-							false);
+							flags);
 			}
 		} else {
 			list_for_each_entry(ctx, &sqd->ctx_list, sqd_list)
 				loop |= io_uring_try_cancel_requests(ctx,
 								     current->io_uring,
-								     cancel_all,
-								     true);
+								     flags);
 		}
 
 		if (loop) {
@@ -631,7 +684,12 @@ __cold void io_uring_cancel_generic(bool cancel_all, struct io_sq_data *sqd)
 			continue;
 		}
 
-		prepare_to_wait(&tctx->wait, &wait, TASK_INTERRUPTIBLE);
+		state = TASK_INTERRUPTIBLE;
+		if (task_sigpending(current))
+			state = TASK_UNINTERRUPTIBLE;
+		if (!cancel_all)
+			state |= TASK_FREEZABLE;
+		prepare_to_wait(&tctx->wait, &wait, state);
 		io_run_task_work();
 		io_uring_drop_tctx_refs(current);
 		xa_for_each(&tctx->xa, index, node) {
@@ -646,8 +704,13 @@ __cold void io_uring_cancel_generic(bool cancel_all, struct io_sq_data *sqd)
 		 * avoids a race where a completion comes in before we did
 		 * prepare_to_wait().
 		 */
-		if (inflight == tctx_inflight(tctx, !cancel_all))
-			schedule();
+		if (inflight == tctx_inflight(tctx, false)) {
+			unsigned long timeout = 1;
+
+			if (state & TASK_INTERRUPTIBLE)
+				timeout = MAX_SCHEDULE_TIMEOUT;
+			schedule_timeout(timeout);
+		}
 end_wait:
 		finish_wait(&tctx->wait, &wait);
 	} while (1);
diff --git a/io_uring/cancel.h b/io_uring/cancel.h
index 1b201a094303..e49713a1bc66 100644
--- a/io_uring/cancel.h
+++ b/io_uring/cancel.h
@@ -30,9 +30,20 @@ bool io_cancel_remove_all(struct io_ring_ctx *ctx, struct io_uring_task *tctx,
 int io_cancel_remove(struct io_ring_ctx *ctx, struct io_cancel_data *cd,
 		     unsigned int issue_flags, struct hlist_head *list,
 		     bool (*cancel)(struct io_kiocb *));
+
+/* io_uring_try_cancel_requests() flags */
+enum {
+	/* match all requests, not just REQ_F_INFLIGHT */
+	IO_CANCEL_ALL		= 1,
+	/* ignore timeouts */
+	IO_CANCEL_KEEP_TIMEOUTS	= 2,
+	/* called by the SQPOLL thread */
+	IO_CANCEL_SQPOLL	= 4,
+};
+
 __cold bool io_uring_try_cancel_requests(struct io_ring_ctx *ctx,
 					 struct io_uring_task *tctx,
-					 bool cancel_all, bool is_sqpoll_thread);
+					 unsigned int flags);
 __cold void io_uring_cancel_generic(bool cancel_all, struct io_sq_data *sqd);
 __cold bool io_cancel_ctx_cb(struct io_wq_work *work, void *data);
 
diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 9ad1962c8dd8..150fe5286f1a 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -2376,7 +2376,7 @@ static __cold void io_ring_exit_work(struct work_struct *work)
 			if (ctx->flags & IORING_SETUP_DEFER_TASKRUN)
 				io_cancel_local_task_work(ctx);
 			cond_resched();
-		} while (io_uring_try_cancel_requests(ctx, NULL, true, false));
+		} while (io_uring_try_cancel_requests(ctx, NULL, IO_CANCEL_ALL));
 
 		if (ctx->sq_data) {
 			struct io_sq_data *sqd = ctx->sq_data;
diff --git a/io_uring/timeout.c b/io_uring/timeout.c
index c4dd26cf342d..9c239c0a1715 100644
--- a/io_uring/timeout.c
+++ b/io_uring/timeout.c
@@ -729,6 +729,24 @@ static bool io_match_task(struct io_kiocb *head, struct io_uring_task *tctx,
 	return false;
 }
 
+__cold unsigned int io_timeouts_armed(struct io_ring_ctx *ctx,
+				      struct io_uring_task *tctx)
+{
+	struct io_timeout *timeout;
+	unsigned int nr = 0;
+
+	guard(mutex)(&ctx->uring_lock);
+	raw_spin_lock_irq(&ctx->timeout_lock);
+	list_for_each_entry(timeout, &ctx->timeout_list, list) {
+		struct io_kiocb *req = cmd_to_io_kiocb(timeout);
+
+		if (req->tctx == tctx)
+			nr += io_linked_nr(req);
+	}
+	raw_spin_unlock_irq(&ctx->timeout_lock);
+	return nr;
+}
+
 /* Returns true if we found and killed one or more timeouts */
 __cold bool io_kill_timeouts(struct io_ring_ctx *ctx, struct io_uring_task *tctx,
 			     bool cancel_all)
diff --git a/io_uring/timeout.h b/io_uring/timeout.h
index 1620f94dd45a..b6cd608fb667 100644
--- a/io_uring/timeout.h
+++ b/io_uring/timeout.h
@@ -11,6 +11,8 @@ struct io_timeout_data {
 __cold void io_flush_timeouts(struct io_ring_ctx *ctx);
 struct io_cancel_data;
 int io_timeout_cancel(struct io_ring_ctx *ctx, struct io_cancel_data *cd);
+__cold unsigned int io_timeouts_armed(struct io_ring_ctx *ctx,
+				      struct io_uring_task *tctx);
 __cold bool io_kill_timeouts(struct io_ring_ctx *ctx, struct io_uring_task *tctx,
 			     bool cancel_all);
 void io_queue_linked_timeout(struct io_kiocb *req);
-- 
2.55.0

