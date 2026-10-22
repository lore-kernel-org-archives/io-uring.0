Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792637245;
	b=mZdnJDttM1SuyhwlN1MYIyHKYKKaKN49Tj88woYY+CgWVzKSMkQe9yCzvr6jKzkQ9rTT
	 ipjxOvNL7Fx7+MxG7+iqptRUzYFIDSdWtwisFasS3eGM3bxvzWhPiNA2ipn23a+Mr3qPI
	 XI0LISE64hTmtP4+Z8erzt0sSlOD+hBg901n+SnJgh/G6KgxfDVchTDhfkvNpOg4Emo14
	 uaHWgLnNH7a6S0fM2xGL2qSHcTzTKQ78Yg7qU1MraZHKQLb4yz/SQFa+G98D+lUIWd2P9
	 cfjGwina7MhAVVhDPnrs48xD/WKovj3Mp5O1FjnLixDuAI7BNswWwYrKBW1dMRe8FKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792637245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LDiCxQcjQAeD8OMkln84Ebe26iu3V9fzssX8qiug9B0=;
	b=styyOTtVykMAwhOkwczV4FtJ3P154C2aKo6EG2BwBGlhvcQDkDulWIDNrOuNz/jSVu7g
	 Yn5YJzQQzLCP3IxV4KPSC0gK2Cq84KX0k4JcoGhef5yc86CPyyAH4a+QzTI9unc2xrr4p
	 oYrdIeQXTzd3HK+MY8pbO22MhOPqow2MuItWUalU+aUCMi5tFCHWH+tDReU+UQDwYj3sg
	 8bqc8y95gSnXXk5kLpwA02mPCm/qUUVFhpojpYZkTZgkcdEQbErYKPQVYlkCTq+7plt00
	 xF4a78hWQbIa2c5wSz8gaykaDY0BYPD1NbjfTCKhADSwvblHiyC6OJJVWTdEQKdDDMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Rh3XaJ6V;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB97606A319
	for <io-uring@vger.kernel.org>; Thu, 22 Oct 2026 02:47:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DB97606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Rh3XaJ6V
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2395578eec.0
        for <io-uring@vger.kernel.org>; Wed, 21 Oct 2026 19:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792637244; x=1793242044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDiCxQcjQAeD8OMkln84Ebe26iu3V9fzssX8qiug9B0=;
        b=Rh3XaJ6VP422xsWdJ3bNZUoqoG+KKm3tKDINX9KZsnx1LnD9j8/L2aGHLcjA8h2QwW
         HbOvk9mJ6U5Ejv1yM5JcB6g+8f/BqR3WvxalZh9bRlaeoPR2kb8tq9K8706UJzC9neoZ
         sSxLOtkuWBJXjtgHY/szhNZmiOpMqN6VzvVs1WE5BXA5SsiJ8KSo0q6jGmiSW2bPiWGz
         05/sEo/H6cMWygPKxHjoAqpWRVv0cqUVbX1hH+Vk/KVpSjkGYgDFJP0p1gum2pOXiEif
         GctJisPPH+HZ/o9QuUQoOj9LuD8v5kJKjBsCFEzDrpteTZgKk9AayXD8giY81nrUEUrb
         chqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792637244; x=1793242044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LDiCxQcjQAeD8OMkln84Ebe26iu3V9fzssX8qiug9B0=;
        b=QhY2OeD2UatqRHivmXC3zF7tTrdL4ziJS2q48f7+ObRNVknQm9kS7t++XuRaR5K1KM
         Al1WjHVIpz7uBCpPmzPi3Qe/dovTgcSEOP16cih2Cr0AtXYq7+3jqE5HiPrKrFrZDYqV
         zqx+7yq0b3ijB9iJF6V553tO6lxc/cho49TR/gDLPGCjUDQMWcte2wmBJh6ZNp6Hq5Hh
         NJJjgaT41z7W6KUA2FGZz0kGDLRRFze969XmRnv9Dq6IBp/khwykPZNIpsaOD1wTPbod
         CU1mL8zbHv/2CD4pKiblOX5VH202YHxxmd0ZhiucW43vv5Tw0+Jap51NLsbCcWlxHW5U
         OyGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGF5lqRFmpBsJSsRNtadaGFXwYx6PACN7N+knGbtlPrpuTgwdQQ/R6sp4p1MzayQ0fKT3FhdZrZA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIg2n5dHSzcslMfVaZPxByAAXAL7sQGi+F4VMh+TVgQYNNkxPJ6
	YGroVFiZKi3iNqzpE0PYAkJ0YBVh6S//bv52oF2m5EPqorpCmUCoaswi
X-Gm-Gg: AYBFou0dvZiI8w1mWZnNVe94Mc/oVjcgiDttnrWI+1ajJLdBjHvleQHBpfvKTzil/33
	604mW0imaRFUz3+/6Yx0oyfBxvSUXDwtex4PWmSyrUThGRVSRSr9XHx7nMKFMIyKi+akKIQoyVJ
	MHHMpefsRjvBmtEHySBeNZZXIAXTc5ggugyUCMheMUM4Z9Me1FSS67HKKXW6a0kK6jTJb2MIW09
	GTmLGIkt4k+nDgTSgx1qaVdFYxo7krESCsr6Rux/Q5YLuePjFJiYDiXa9cp6/r6mWKJAGCOELSC
	oD1ifYVcfM+b3PP5nC8JuFucl2EyVTZ0fdkAlbAdL71uhFRH/OdUzhFxtsxU0jPhE4L0znbP95Y
	6mBuOl67q1Z+PW53HuxE4ItpdGk1VfoGsSdlzakdPCd7P5kFeoxzPCIs/cZQTaW9oKgsLDfcmTD
	XrvfZocOdEJT1gPk1a2PinZUUg3SZ5ZGBPXNBu8A/CERxN4k8RmxEZYcEKeMkifuJ4Z24JTmvBf
	J1ktDVXLlXjOo3a3wZkQ+rKgmg8fEasN8zeP3ykjUnZOTVGrU3WVbe2KpQhThqFF1bA3qe0PXIa
	By2AaEukL0mRTrwGZVa8oSz2Uz2CN8+fOGpULIjF/QQSvxeEyelyCcBrddMW2wyALsjezgkktjq
	+5gQPpX8=
X-Received: by 2002:a05:7300:72d0:b0:35d:187c:72cc with SMTP id 5a478bee46e88-3674de4c834mr6921854eec.23.1792637244223;
        Wed, 21 Oct 2026 19:47:24 -0700 (PDT)
Received: from server1868-4.tail96fc24.ts.net ([199.188.91.198])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-368ca914bb8sm2318629eec.5.2026.10.21.19.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:47:23 -0700 (PDT)
From: Austin Schuh <austin.linux@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Austin Schuh <austin.linux@gmail.com>,
	Pavel Begunkov <asml.silence@gmail.com>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-rt-devel@lists.linux.dev
Subject: [RFC PATCH 1/2] io_uring: don't let a preempted task_work add hold back the wake up
Date: Wed, 21 Oct 2026 19:46:55 -0700
Message-ID: <20261022024701.1574811-2-austin.linux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022024701.1574811-1-austin.linux@gmail.com>
References: <20261022024701.1574811-1-austin.linux@gmail.com>
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

Only one local task_work add per wait cycle wakes the waiter: the one
that takes ->cq_wait_nr's credit.  Every later add sees the credit gone
and returns.  The credit is taken after the entry is queued and the
wake up comes after that, with nothing held in between, so an adder
preempted in that window leaves the waiter asleep with work queued.  A
lazy add preempted before it counts itself down does the same: the add
that would have reached zero stops one short.

The waiter stays asleep for as long as anything of higher priority runs
on the adder's CPU, whatever the waiter's own priority.  Nothing boosts
the adder, since it holds no lock.  This bites IORING_OP_MSG_RING into
a DEFER_TASKRUN ring in particular, where the adds come from other
tasks of any priority: a real-time sender's message waits for a
lower-priority sender that took the credit and was preempted.  On
PREEMPT_RT, where threaded interrupt handlers preempt everything below
them, that is routine.

Traced on a Jetson Orin Nano (6.18.39-rt), with a SCHED_FIFO 60 sender
posting to a SCHED_FIFO 60 receiver every 500us while lower-priority
processes post to the same ring from CPUs loaded with SCHED_FIFO 50
bursts: of the 17 wakeups over 100us late in 60s, 15 were delivered by
a lower-priority sender whose MSG_RING had been in flight since before
the real-time sender's returned, for 12 to 479us.

On for-7.4/io_uring with PREEMPT_RT, before and after this patch, the
real-time sender on CPU 4 posts a MSG_RING to the real-time receiver's
DEFER_TASKRUN ring on CPU 5 every 500us.  On CPUs 0 and 1,
lower-priority processes post to the same ring every 200us, alongside
SCHED_FIFO 50 threads running 20us to 1ms bursts and normal-priority
interrupt and system load.  Ten minutes a run, 1.2 million messages
each, timed from the send to the receiver handling it:

                              late by    late by
                     runs   over 100us  over 1ms   longest
  FIFO 40, before      3     889-1139   341-417   8.6-11.8ms
  FIFO 40, after       3        15-21         0   0.69-0.94ms
  FIFO 60, before      1         1058       438     8.3ms
  FIFO 60, after       1            0         0      71us

The three runs at FIFO 40 are that setup as is, plus a thread in each
real-time process mapping and unmapping memory on CPU 0 or 1, and with
no lower-priority processes starting or stopping.  What remains at FIFO
40 is the sender's own MSG_RING being slow, 44 to 60 sends over 100us a
run, before and after.  Traced on 6.18, its request allocation waits on
the slab node's list_lock, held by a lower-priority process that
inheritance only lifts to 40, under the FIFO 50 bursts.  At 60, nothing
is left.

Keep preemption disabled from queueing the entry to the wake up, as
mpscq_push() already does for the push itself.  That covers a few
atomics and try_to_wake_up().  eventfd_signal() takes a spinlock_t,
which sleeps on PREEMPT_RT, so signal the eventfd and wake ring pollers
after that instead of before.

Fixes: 8751d15426a3 ("io_uring: reduce scheduling due to tw")
Assisted-by: LLM
Signed-off-by: Austin Schuh <austin.linux@gmail.com>
---
 io_uring/tw.c | 80 +++++++++++++++++++++++++++++++++------------------
 1 file changed, 52 insertions(+), 28 deletions(-)

diff --git a/io_uring/tw.c b/io_uring/tw.c
index 0b5066f97224..cfb591508662 100644
--- a/io_uring/tw.c
+++ b/io_uring/tw.c
@@ -179,37 +179,14 @@ static void io_local_work_wake_poll(struct io_ring_ctx *ctx, unsigned int flags)
 	call_rcu_hurry(&ctx->poll_wq_rcu, io_poll_wq_wake_rcu);
 }
 
-void io_req_local_work_add(struct io_kiocb *req, unsigned flags)
+/*
+ * Issue the wake up of the waiter's cycle if this add is the one that takes
+ * ->cq_wait_nr's credit, see io_cq_wait_arm().
+ */
+static void io_local_work_wake(struct io_ring_ctx *ctx, unsigned int flags)
 {
-	struct io_ring_ctx *ctx = req->ctx;
 	int nr_wait;
 
-	/* pairs with synchronize_rcu() in io_ring_exit_work() */
-	guard(rcu)();
-
-	/*
-	 * We don't know how many requests there are in the link and whether
-	 * they can even be queued lazily, fall back to non-lazy.
-	 */
-	if (req->flags & IO_REQ_LINK_FLAGS)
-		flags &= ~IOU_F_TWQ_LAZY_WAKE;
-
-	/*
-	 * The xchg() in mpscq_push() implies a full barrier, which pairs with
-	 * the barrier in io_cq_wait_arm() on the io_cqring_wait() side. This
-	 * ensures that either we see the updated ->cq_wait_nr, or waiters going
-	 * to sleep will observe the work added to the list, which is similar to
-	 * the wait/wake task state sync.
-	 */
-	if (mpscq_push(&ctx->work_list, &req->io_task_work.node)) {
-		io_ctx_mark_taskrun(ctx);
-		if (data_race(ctx->int_flags) & IO_RING_F_HAS_EVFD)
-			io_eventfd_signal(ctx, false, flags & IOU_F_TWQ_IN_WAKE);
-		/* whoever sets the flag wakes ->poll_wq afterwards */
-		if (data_race(ctx->int_flags) & IO_RING_F_POLL_ACTIVATED)
-			io_local_work_wake_poll(ctx, flags);
-	}
-
 	/*
 	 * No one is waiting (IO_CQ_WAKE_INIT), or this cycle's wake up has
 	 * already been issued (zero or negative, see below).
@@ -239,6 +216,53 @@ void io_req_local_work_add(struct io_kiocb *req, unsigned flags)
 	wake_up_state(ctx->submitter_task, TASK_INTERRUPTIBLE);
 }
 
+void io_req_local_work_add(struct io_kiocb *req, unsigned flags)
+{
+	struct io_ring_ctx *ctx = req->ctx;
+	bool first;
+
+	/* pairs with synchronize_rcu() in io_ring_exit_work() */
+	guard(rcu)();
+
+	/*
+	 * We don't know how many requests there are in the link and whether
+	 * they can even be queued lazily, fall back to non-lazy.
+	 */
+	if (req->flags & IO_REQ_LINK_FLAGS)
+		flags &= ~IOU_F_TWQ_LAZY_WAKE;
+
+	/*
+	 * Only the add that takes the credit wakes the waiter, later ones
+	 * return early, and a lazy add that hasn't counted itself down yet
+	 * holds back the one that would. Neither may be preempted between
+	 * queueing its entry and the wake up: the waiter, whatever its
+	 * priority, sleeps with the entry queued for as long as anything of
+	 * higher priority runs on the adder's CPU, and nothing boosts the
+	 * adder, as it holds no lock.
+	 *
+	 * The xchg() in mpscq_push() implies a full barrier, which pairs with
+	 * the barrier in io_cq_wait_arm() on the io_cqring_wait() side. This
+	 * ensures that either we see the updated ->cq_wait_nr, or waiters going
+	 * to sleep will observe the work added to the list, which is similar to
+	 * the wait/wake task state sync.
+	 */
+	preempt_disable();
+	first = mpscq_push(&ctx->work_list, &req->io_task_work.node);
+	if (first)
+		io_ctx_mark_taskrun(ctx);
+	io_local_work_wake(ctx, flags);
+	preempt_enable();
+
+	/* eventfd_signal() takes a spinlock_t, not allowed above on PREEMPT_RT */
+	if (first) {
+		if (data_race(ctx->int_flags) & IO_RING_F_HAS_EVFD)
+			io_eventfd_signal(ctx, false, flags & IOU_F_TWQ_IN_WAKE);
+		/* whoever sets the flag wakes ->poll_wq afterwards */
+		if (data_race(ctx->int_flags) & IO_RING_F_POLL_ACTIVATED)
+			io_local_work_wake_poll(ctx, flags);
+	}
+}
+
 void io_req_normal_work_add(struct io_kiocb *req)
 {
 	struct io_uring_task *tctx = req->tctx;
-- 
2.47.3

