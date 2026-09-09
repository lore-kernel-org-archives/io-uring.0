Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC0B53ED1E
	for <io-uring@vger.kernel.org>; Wed,  9 Sep 2026 14:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963029; cv=none; b=gl6EbZU90uRPx0vTGRAjH/vXLgfnSJBbzKK6Lat4ZLVhAWVm6vQ4aL9Uj/JmfJh7zXwz1lNyGYKc8QTSAGkYn9fq+GlF5Buu/4Kdlyx5QbkZwTpqd1TVlauiDFCzDiEbZzRKWYqlbNRCfIMwGChAK74V2JjJsP0/MH0MUSioTKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963029; c=relaxed/simple;
	bh=ZXPac2eRdIglosEiU2mPiNLgw9LNZlytRgw1Md7qCLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PAC/xLVd+chMGzQ1G7WHNw8fnIwij8+2JR0iD1VyGrT+Hw5aHsLVA6zd8upGDltMw3hakwsf6wzXLRw2fHTSFc2Wmef+vYUg2IP0hLO/huFcn0RP96p32JuivH0fMD2nQZFfHXtUotTXPPmazJ2vNfQ+R1JKnqF/d/9T0zoh92Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=rL+3vABP; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="rL+3vABP"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccde2ad8so185211fac.2
        for <io-uring@vger.kernel.org>; Wed, 09 Sep 2026 07:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1788963026; x=1789567826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IlXc0W49WClO/UMB2uQy/UeHBy5H+WhLQSvLztttcw0=;
        b=rL+3vABPSr69XwLXAyd/Xd5En9+nxBBY2rai/r7KF7XdP3mBEzhUM7pJguqV+Cf2pn
         0HYXDG3RWJvkjTLE2s+lFIjcBhb5s5yqRtrU2G3hAqT9UBJe07389qu0ZuEGs80/KWx+
         bpI5yaROOFjAiS8hpAd51PIQFoVPGx+du/dU6iLdBiwVV1bhA71xAvzUld5lEQ5s6Px6
         FcWTZ5yvGAF6QwrQ9BoxdEwdXKRsi9uuvScNxKyTujUoH7QNIdg/rYMPyDd1MSsYXiDm
         dJNjWT/VtSJQ+CZkJVpcj03+VziCQD+BZwHHRNf4ycM+lLrjIiVkK3clLwj9JNFkvkCY
         sO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963026; x=1789567826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IlXc0W49WClO/UMB2uQy/UeHBy5H+WhLQSvLztttcw0=;
        b=FG1jLx/CA3Xe3kwU9JBL/FMPc5WBdsex+LZx5R5dLXC7NFKBFN1PsS9NkgjLKg6F0L
         EZ4oeZzv6ZIuYIqxRpc8RZa6bFSA+8iUp9I3r7VlqDZgbzfhlrxKchgKr8inmo1n67tv
         cqMMvXmvP8gfIlpqhOeHWGFJosg+f2YPdWBKCBIP8nwA9V4rN8UrH6UoJscTgYgqZXlL
         NPAh7eUkKdseWYNPf3JlHN3di2DwWdQgaOm8UchmcY83M3zAkX9ejS6X/OYXmf0aDdVM
         dTdJuJtcUxk6oBgnLB2TSjcJtr1kQquBXCMJrMb9n5ZqTcJn9+Sj9r3yToxcIEC0Mqqi
         4oAA==
X-Gm-Message-State: AFuF++mVY3Q8smzYprMqapBAN6zLglBZ9HKNWOWqNKEuq+5cTgG1eWAZ
	+VLyHI2EGC4omE0BGITd7perDQy1TJDDSMZ+kzkgbYElOlTy1Xxge6P3zmN6M5Btj/XXce9J3Z9
	W03kOcFw=
X-Gm-Gg: AYBFou3JWw4hiMDF+S1/roL1LBvSJsNT0HHo+ogNubWOsuzZJI4Cy4bk/OZxJLH1qwu
	rOU5Nl5u3KbwTqM89edWa8D6piesi0pWAjlW7qjwJMWb3mUNupQjeIv3zjDv83u54lbtSD/UHUO
	NkaxRUP0/TMj/cVi5hQ/3U8nhA5FnvHBqmvT3M4Fca+C1TNo5vk2fIl7HtXXztKS7eSJa4Udt0N
	K+PboYYz7uIcT6sINvPtc82VKHzY64VLDTd85hmZTgQPxeni+cPi3aXOqGWmaxR17FPBJKHwRhB
	HLLcCFo0eEiFPDSgGDgQxvftEd8DcrhPv5TMugYops35OkhAw+VIS9S4dy7BRSbUNPOZQ+jcdJ0
	AjBkC6EEav8jVQsW9lFlUDFtsnjBpXZcDdPwBFJmoFDKI6UGjqxQY0kV2tRVeoZ5IOchkbSaD42
	ktTgx/7zk7IVm8wLlbGKvrCd/x1GIRRC5by47FxXj+8HY0YOVXOjFmrpKNS+BH8xezvuB4XF7hb
	HFtVFjMpwFjolFWAyx4mvNXD/veHOmRDNGjasPWQjvsq/3vmWD6cAI=
X-Received: by 2002:a05:6871:6881:b0:471:3325:80ca with SMTP id 586e51a60fabf-47c5034ada2mr1152255fac.5.1788963024954;
        Wed, 09 Sep 2026 07:10:24 -0700 (PDT)
Received: from m2max ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47a7585b25esm5406514fac.11.2026.09.09.07.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:10:21 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: juanlu@fastmail.com,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 3/7] io_uring/cancel: cancel and wait for all requests on process exit
Date: Wed,  9 Sep 2026 08:06:13 -0600
Message-ID: <20260909141010.21064-4-axboe@kernel.dk>
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
index 61053421d809..3fc07d9f3eec 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -2337,7 +2337,7 @@ static __cold void io_ring_exit_work(struct work_struct *work)
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

