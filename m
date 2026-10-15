Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209AA2E06ED
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092681; cv=none; b=lEAgWGH6gG0EsHrmatwMwKmIbi+xJ80aw+L5Mb4vgk8ZLKJ0r+gP7ysPK9ntIDgAXr/3GF5Zss79rczFxPRKZWNXsnQuXuP7U/MGOqkr0Sai7FhiDnjTddWSLDhMIU13TF1Usdffnwt0YqMKG0zcmWNCGwZHVHqIKS4A6qkd+Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092681; c=relaxed/simple;
	bh=dFiiWp4N0+Bs2AgCEoa4xdIp4QL+/GbYHPb9EJYifAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jqSmWxxjTqt6P1JvbYnOLGOmbtAX8NiZujMlBcSdZdjy6OLt/Zc3z7F13IdDhRzfIrcB17mFqSsxrWuM8M1ToTlxCeXlUrEnnNGJfWB6xq72NU1DZXehzrIpevdPqk82ttMMlfu3Tw9uOE7+v2UNy3IjEUAsTM0w89BsPMzXnS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=gxe9bbO7; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="gxe9bbO7"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-53440816851so20524321cf.0
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092679; x=1792697479; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G3h6TjsU+b2cB0+MsS+yUzOb5ESG08ARM/okSBncWTM=;
        b=gxe9bbO7ChD++NfsD94AUKNhXdnYfxePQwVHdg8KvM0TESa07jCr2tFsQmqWbfnRtC
         guzmwqJHTBWLjAJ1tGStSp0VNi0FDXNUMCB3XzhaVgFL5LqMZ/t4UgYrPzBPMZt8nIk5
         +enWtxDFBf6peFDtSlcFyElUi7ty2Ukox/vrTC2dqiWL4t0mgrSyfQ+XqKYW6e9107zP
         2siRsKgmEQshqmVZ46ymuPkY0MpugWA2oqj+IKSDE/Wk6loII8oxZ1FIlphAcfaoe0H8
         o6qbZl6ZyIZRYfqeJK/gUBtAoQ9E4IgXMai9FhrakXxBW0FMMSdOpwPjSG9JM9vy2Q9m
         Ih1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092679; x=1792697479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G3h6TjsU+b2cB0+MsS+yUzOb5ESG08ARM/okSBncWTM=;
        b=YdXdDK/EDjP2AaZA4LU1iyFK3PPgqRJi3pH8ycORiQCRY5KIza7QQzu72DgOfCFxE3
         v2jmhr/o24LINLgLg1TiUKu42iTQtoVD0HfL1Vbi/5KLdOiLvodW12YOnpNDtwWElHTQ
         wQyiDTCPSKwj4AhIlwdLKjjD2X20EXu4dBRhaSbRbv8CVJ3vgknTpKzORI1ldYkCipv6
         Fin2ojZt6BrHH8bOb0l8m2NnpawWrDY9Pp6hi4rJT6K/lyt2THZ0p3MHyzI5XeI/hH5p
         gCUvto9PdwundxnEpagNYfr+bCMGS7tf4Xe66xEn4WvWUGGU5C1LBqiVLTAIBBCYsMB3
         cI2Q==
X-Gm-Message-State: AFq9FYKnJ9cZLd0IvMgRDLssJe6to0uKXd6urg0UVmZzPCbamdnVDk/p
	ka8WKXEQt2zExvWVeQUGoz/wt4iD6igOj5dlrzbJg22hsTnVhpWRNq4GY3k+nNNLIceFOm5hho+
	3c7RK
X-Gm-Gg: AYBFou39v95n1sLZcV6ux2kbfITHdk6TmHvJpqXdUmefzwhXkQ6mcuLCUhwzTF1DBL8
	ooUYiwwnBsDZ8SFGkYwUjljPE7AHGqxwaDnR26vBq9pdfZlnvFhcXixIgjxiAmDNEN/15QtFrvT
	nFdUc4ZfOOvcpTxx6uF7njSmA+JGKMnDmMaOlfTxVEdgmcP8e1s661xec6kuyRA/ITTSL7EcYu8
	vlzYcpJmJxAKnShJ7mAq8SHzFgy4NM1mPWyohfTx/bRsu0HMKDCap4XD8yZApopWo56V9CR6seI
	79XdhAA39Irpk4B2A/kHdEygoUEsLfIyQi+L38u4irbkaEzGkXx/llHee3299E7XdX6QSsvXYRC
	l/ZKy6qJv+GEAJlGxZ4LCTgv9dBtOD22wmyXU319PVMYBE9Pb6w6rvwLFzyVPZ8EOjeJsvTELul
	/GbDfkCbCcjp1cqXz+9xsQkzrVLfwIpmyY+jsCM/CiqreGW/RB+h5bZX3Ng6DY0J9GQi06ynRSO
	kvGmkiBrOiy5FI=
X-Received: by 2002:a05:622a:17ce:b0:535:b566:7d2f with SMTP id d75a77b69052e-535b56693bcmr250091561cf.41.1792092678907;
        Thu, 15 Oct 2026 12:31:18 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.248])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362a74c0bcsm1760761cf.1.2026.10.15.12.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:31:18 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:30:29 +0000
Subject: [PATCH 05/43] io_uring/io-wq: don't hide a link from cancellations
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-5-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092657; l=7290;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=dFiiWp4N0+Bs2AgCEoa4xdIp4QL+/GbYHPb9EJYifAU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJKZcwnVZQzu1MOpcnHhYpqDg1C/deqI24be7EyXtsJ+UjyHbCN12vef5LSTz8vpjDi1EgGU5Rh
 WiFNnpIas4wU=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

A task that exits cancels its tracked requests and waits until they are
gone. io_uring_cancel_generic() looks everywhere a request can be, and
goes to sleep if it found nothing to cancel. It is woken up each time
one of the requests of the task is completed by task work or freed.

When io-wq is done with a request that has a link, there is a time in which
the next request of the link can't be found:

  io_worker_handle_work()
    io_assign_current_work(worker, NULL)
    io_wq_free_work(work)
      io_req_find_next()           // takes the link off the request
      io_free_req()                // task work for the task
    io_assign_current_work(worker, linked)
      io_run_task_work()
      cond_resched()
      worker->cur_work = linked

It is not pending, it is not the current work of a worker, and it is not
yet on the list that it is about to be parked on. If the pass that the
exiting task makes because of io_free_req() falls into that time, it finds
nothing and the task goes to sleep. The worker then runs the link, which
IO_WQ_BIT_EXIT doesn't prevent for bounded work. If that parks the request
nothing is completed or freed, and nobody wakes up the task. If it is the
process that exits it can't be killed any more either.

  NOP, IOSQE_ASYNC | IOSQE_IO_LINK
  FUTEX_WAIT, FUTEX2_PRIVATE
  exit of the thread, or of the process, up to 63us later

With four of these per round 5 to 8 of 10,000 rounds hang (4 CPUs, KVM):

  io_uring_cancel_generic
  do_exit

Commit f8b632e89a10 ("io_uring: tighten task exit cancellations") is about
the same gap, and makes the task look again for whatever happens before
io_free_req().

Free the request once the link is the current work of the worker, or
pending. Whoever is woken up by that can find the link, until it is parked
where cancellations look as well. To do so split io_wq_free_work() in two.

Fixes: 768134d4f481 ("io_uring: don't do flush cancel under inflight_lock")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/io-wq.c    | 18 +++++++++++++++---
 io_uring/io_uring.c | 46 +++++++++++++++++++++++++++++-----------------
 io_uring/io_uring.h |  3 ++-
 3 files changed, 46 insertions(+), 21 deletions(-)

diff --git a/io_uring/io-wq.c b/io_uring/io-wq.c
index 433c003a83e5..a5b3d2ba48bf 100644
--- a/io_uring/io-wq.c
+++ b/io_uring/io-wq.c
@@ -646,12 +646,13 @@ static void io_worker_handle_work(struct io_wq_acct *acct,
 		/* handle a whole dependent link */
 		do {
 			bool do_kill = test_bit(IO_WQ_BIT_EXIT, &wq->state);
-			struct io_wq_work *next_hashed, *linked;
+			struct io_wq_work *next_hashed, *linked, *done = work;
 			unsigned int work_flags = atomic_read(&work->flags);
 			unsigned int hash = __io_wq_is_hashed(work_flags)
 				? __io_get_work_hash(work_flags)
 				: -1U;
 			struct io_kiocb *req;
+			bool last;
 
 			next_hashed = wq_next_work(work);
 
@@ -670,7 +671,7 @@ static void io_worker_handle_work(struct io_wq_acct *acct,
 			kcov_remote_stop();
 			io_assign_current_work(worker, NULL);
 
-			linked = io_wq_free_work(work);
+			last = io_wq_put_work(work, &linked);
 			work = next_hashed;
 			if (!work && linked && !io_wq_is_hashed(linked)) {
 				work = linked;
@@ -679,6 +680,13 @@ static void io_worker_handle_work(struct io_wq_acct *acct,
 			io_assign_current_work(worker, work);
 			if (linked)
 				io_wq_enqueue(wq, linked);
+			/*
+			 * Not before the link is current or pending work again.
+			 * This may be the last time that a task is woken up
+			 * which exits and looks for requests to cancel.
+			 */
+			if (last)
+				io_wq_free_work(done);
 
 			if (hash != -1U && !next_hashed) {
 				/* serialize hash clear with wake_up() */
@@ -1008,9 +1016,13 @@ void io_wq_set_exit_on_idle(struct io_wq *wq, bool enable)
 static void io_run_cancel(struct io_wq_work *work, struct io_wq *wq)
 {
 	do {
+		struct io_wq_work *linked;
+
 		atomic_or(IO_WQ_WORK_CANCEL, &work->flags);
 		io_wq_submit_work(work);
-		work = io_wq_free_work(work);
+		if (io_wq_put_work(work, &linked))
+			io_wq_free_work(work);
+		work = linked;
 	} while (work);
 }
 
diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 0c91d466d825..464d9616234c 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -1486,28 +1486,40 @@ int io_poll_issue(struct io_kiocb *req, io_tw_token_t tw)
 	return ret;
 }
 
-struct io_wq_work *io_wq_free_work(struct io_wq_work *work)
+/*
+ * io-wq is done with @work. Returns true if it held the last reference, and
+ * hands out the next request of the link then. The caller has to make sure
+ * that cancellations can find the latter before it calls io_wq_free_work().
+ */
+bool io_wq_put_work(struct io_wq_work *work, struct io_wq_work **linked)
 {
 	struct io_kiocb *req = container_of(work, struct io_kiocb, work);
 	struct io_kiocb *nxt = NULL;
 
-	if (req_ref_put_and_test_atomic(req)) {
-		/*
-		 * Only continue the link from here if the completion has been
-		 * posted. If it's still pending, io_free_req() completes the
-		 * request and the next link follows from there, after the CQE.
-		 */
-		if ((req->flags & IO_REQ_LINK_FLAGS) &&
-		    (req->flags & REQ_F_CQE_SKIP)) {
-			struct io_ring_ctx *ctx = req->ctx;
+	*linked = NULL;
+	if (!req_ref_put_and_test_atomic(req))
+		return false;
 
-			mutex_lock(&ctx->uring_lock);
-			nxt = io_req_find_next(req);
-			mutex_unlock(&ctx->uring_lock);
-		}
-		io_free_req(req);
+	/*
+	 * Only continue the link from here if the completion has been posted.
+	 * If it's still pending, io_free_req() completes the request and the
+	 * next link follows from there, after the CQE.
+	 */
+	if ((req->flags & IO_REQ_LINK_FLAGS) && (req->flags & REQ_F_CQE_SKIP)) {
+		struct io_ring_ctx *ctx = req->ctx;
+
+		mutex_lock(&ctx->uring_lock);
+		nxt = io_req_find_next(req);
+		mutex_unlock(&ctx->uring_lock);
 	}
-	return nxt ? &nxt->work : NULL;
+	if (nxt)
+		*linked = &nxt->work;
+	return true;
+}
+
+void io_wq_free_work(struct io_wq_work *work)
+{
+	io_free_req(container_of(work, struct io_kiocb, work));
 }
 
 void io_wq_submit_work(struct io_wq_work *work)
@@ -1518,7 +1530,7 @@ void io_wq_submit_work(struct io_wq_work *work)
 	bool needs_poll = false;
 	int ret = 0, err = -ECANCELED;
 
-	/* one will be dropped by io_wq_free_work() after returning to io-wq */
+	/* one will be dropped by io_wq_put_work() after returning to io-wq */
 	if (!(req->flags & REQ_F_REFCOUNT))
 		__io_req_set_refcount(req, 2);
 	else
diff --git a/io_uring/io_uring.h b/io_uring/io_uring.h
index 109261722ca7..c7b340e5d0a8 100644
--- a/io_uring/io_uring.h
+++ b/io_uring/io_uring.h
@@ -204,7 +204,8 @@ int io_do_iopoll(struct io_ring_ctx *ctx, bool force_nonspin);
 __cold void io_iopoll_try_reap_events(struct io_ring_ctx *ctx);
 void __io_submit_flush_completions(struct io_ring_ctx *ctx);
 
-struct io_wq_work *io_wq_free_work(struct io_wq_work *work);
+bool io_wq_put_work(struct io_wq_work *work, struct io_wq_work **linked);
+void io_wq_free_work(struct io_wq_work *work);
 void io_wq_submit_work(struct io_wq_work *work);
 
 void io_free_req(struct io_kiocb *req);

-- 
2.55.0

