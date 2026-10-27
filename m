Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793134146;
	b=ZFEem4dxoB5gJ/BwtPNB/V7AdaYgiHOtfXmWciWgrYxGi4QeABO4JyGfP2XGE/zFiM4E
	 jpCWml0zGwkR5N8ff2hv4+UmrrHKjVujJ5vu0miapt9vS6wZMcce36KMPzQEij7mgC/Pf
	 BcHn5RzDsHVJkhYIO1jshyu64EcxdqSGOVYeV5RF+BYmsvu/lgecMHzeDNlBXC9j4LWuY
	 B9PxalMSKEnTMUlpVhY/+47P8E36rwJMh+oDdLtSzBFRFbVvIip8si6yv3uIf6mlUMa2A
	 k9dxP2ptlqkOU+tT2gJUaKBp0xi/BUpRe3dlRpujieXFZnUmPLL4W5jNX2TNzOJ5DCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793134146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0CwhWIrFGwh+OtOYiij9Aw5L8ognFC7BhFUQdRBV25g=;
	b=p5zKDBxk77NGUZLgbPLiBJ37ZuJpAywPuqcakTsCVDFcXkHpMYek+5zCf535rYyvLvU2
	 BrgdiNkkwqWZcZVXeMA3UEK38qFnxc8A+KMpu36NTgFYChwlhj2WvH458JjotBvqG49OH
	 1dJjfmcM64fGfRlMOKvZ6geQcaZPZv11SnFb+nWk42PBJilCvisFLm1Bw5g7gZjJNORoj
	 WPoMcjhq/Zlt1uB5aErRS5YBeEhV3z3QSComxxTA1ztKc++eQzMXgL6werDHYR+sLvXJc
	 nQjEe3/4w0qUsD3cQ8T6xOhranlYHaP6SeKyYN/58z6N1+y3M899wTO5gegKwer7HIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i4idKlJF;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD9C606A31D
	for <io-uring@vger.kernel.org>; Tue, 27 Oct 2026 20:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DD9C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i4idKlJF
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a215e64962so3105105e9.1
        for <io-uring@vger.kernel.org>; Tue, 27 Oct 2026 13:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793134144; x=1793738944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0CwhWIrFGwh+OtOYiij9Aw5L8ognFC7BhFUQdRBV25g=;
        b=i4idKlJFAdQeiFyVEzCfHl4JdjLGwUYB46fnzJphuGrfOfJl64Xhwmh+vZBGH5KBKU
         nImD8MAMV+BGgkSrjZJLfA/y9MRJQVPzksCv6Jzag5Q5IOZz2YM1OiMl+ga3JZJNkHNL
         kc06XAnAOdOEwNGL8oySF2MTtEa+UyTzSDiotBYKs1IPq0CRjKzhckF0hZcduv74Wz7B
         hvEgeqb0Ay3SIbmQ88wCIdkCd/xSvMBnltVR4MDGoe+DfQa8CGsAwoT78Mh2KqP0Bjyo
         vVhm8XErx1TI/5m3+xcDCrk7pfSGgXycqLyajQgXb+w9mzc7ieQ7d93effGlDOODvRDi
         8Y2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793134144; x=1793738944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0CwhWIrFGwh+OtOYiij9Aw5L8ognFC7BhFUQdRBV25g=;
        b=r+Hb02SU7RbnoSNTZBZeFg3ep881dJP5YopsItLtqneAGX0p9Dt9fTYwD2A1Z+2HqV
         rSq6yVHKDZkDzHuT2sZxQ6VknFBJ+UXqAAae1hpfE80UsS0lKGqsNwYQh/6EZ9OtcYVF
         5uzaVRKkVvReZ8RF/ZabKC+FjcwVfo/Hs3k2nRx9UzVrFJXiFVK+b8YytHELIl8Lv+um
         wVgRnsrmlxpaWT8wMhPWdHyCmYFo7U81/090e6ucP4K3yKMFUF4sbHhSb6QL8uVaTZD4
         rgOVz7W6AKTcs+WHkJ0K9hG70SrM76S08iOwk+W19azZaPfyswuOPTRkEAd/E1clcyhU
         HNGg==
X-Forwarded-Encrypted: i=1; AKwUvBxU+A8V4AHDFtwCKERWoGRHn4K6bDkW3DDwi/2ZD+XKfFWW171wqSV3fu+nK8EZNm1iov2KeCpBBA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIhwvvVi+9lt+FPFyh/qA6G9+iEpjsQHMpnbn2jqrjSTvvwdPqm
	VV9O7lMJpZQP4vNrLM4Rgx7+JzFlYxJ8siOfxAxzWpL0c0Pre26LSRle
X-Gm-Gg: AYBFou1/pnndQmsQMexF43nLwXHd1MH9A1Ji9n4G2pDipscOP0gZ9OJCLTP67vif8gQ
	XRB+Kl2d8siSO8SX4lU5JIPyT0N5MiF4V0BM61Y359vfMGYQqpY6lbGL2mZxRz/6k93f2f/W9dQ
	v7ScBetlum+JBhsN07LmY60JqqBQGdcTSEg1hZRJK8LSrbq6QWFs4Vk4C+zeam7cwZmmGpMfkvg
	7RviXeFcJ1LdCpThFQt6/fbjMck0SAAreBA3Vt0UykJGbpsfqiJmmKIprF0BtKOzr1LUb7yWH5/
	MZodOQ/HJiRGhnCIAqIdyztlFkdVkt6ddxvdoKA01xnZRiUSTSJ101hYgpgtl+PrfPx6ZBS4OSN
	EXTgDXo2ZW3QgU2KJQx6O32NYmua2xvmrmbVXi3WsJAEprRQa8oO4BF8vBGcY3LehUDUFLmIbMi
	fKRWKaavrv0JxE5uDFMmZYQ90qpm1ZSuLcR3kkkVZI4Ald7cGSpc1mEw8T9JiT8s81HZvgocX02
	d+xScBiCIlQGFoC+UrKadUFGocuI34PJsy03BBk4TJjNzzEYx9MgkkI
X-Received: by 2002:a05:600c:811b:b0:4a7:462c:6b9e with SMTP id 5b1f17b1804b1-4a967d96eebmr1828295e9.32.1793134144546;
        Tue, 27 Oct 2026 13:49:04 -0700 (PDT)
Received: from prairie.home ([2a02:168:fe54:0:500c:846b:8abe:fa7a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94ddf8c48sm6931075e9.3.2026.10.27.13.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 13:49:03 -0700 (PDT)
From: Cinq Prairie <notprairie@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Stefan Roesch <shr@devkernel.io>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cinq Prairie <notprairie@gmail.com>
Subject: [PATCH v2] io_uring/napi: don't end the single NAPI busy poll early on need_resched()
Date: Tue, 27 Oct 2026 21:48:40 +0100
Message-ID: <20261027204840.7823-1-notprairie@gmail.com>
X-Mailer: git-send-email 2.54.0
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

With a single registered NAPI, io_napi_blocking_busy_loop() hands
io_napi_busy_loop_should_end() to napi_busy_loop_rcu() as loop_end and
runs its own loop once, relying on __napi_busy_loop() to spin until
that predicate fires. napi_busy_loop_rcu() sets NAPI_F_END_ON_RESCHED,
so __napi_busy_loop() also returns on the first need_resched(). io_uring
treats the return as the end of the busy poll period and sleeps in
schedule_hrtimeout() for the rest of the wait timeout.

With two or more NAPIs the inner loop is single-shot and io_uring's own
loop runs until its predicate is met, so busy_poll_to is honoured. The
same registration therefore behaves differently for one NAPI than for
several.

Make the busy poll deadline absolute, stored in io_wait_queue, so that
io_napi_busy_loop_should_end() no longer depends on the start_time the
napi loop snapshots on every entry. The single NAPI loop can then be
re-entered after an early need_resched() exit if there is budget left,
and the loop condition drops the "run once" special case. The fast path
that holds the NAPI across polls is kept.

Measured on io_uring-7.4 at 9c207aa58e54, x86-64, HZ=1000,
PREEMPT_DYNAMIC (lazy), no CPU isolation, low RX traffic, r8169 with one
RX queue, prefer_busy_poll, busy_poll_to = wait timeout = 10 ms.
"waker" is a SCHED_FIFO task pinned to the polling CPU waking every 1 ms:

  1 NAPI, waker, before:  busy 0.5-1.5 ms per 10 ms wait, ~0.8M polls/s
  1 NAPI, waker, after:   busy 10 ms per 10 ms wait,      ~16.2M polls/s
  1 NAPI, idle, before:   busy 10 ms per 10 ms wait,      ~15.3M polls/s
  1 NAPI, idle, after:    busy 10 ms per 10 ms wait,      ~16.2M polls/s
  2 NAPIs, waker, before: busy 10 ms per 10 ms wait,      ~7.2M polls/s
  2 NAPIs, waker, after:  busy 10 ms per 10 ms wait,      ~7.1M polls/s

The held-NAPI fast path polls about twice as often as the single-shot
path used for several NAPIs, which is why it is kept.

Fixes: 8d0c12a80cde ("io-uring: add napi busy poll support")
Cc: stable@vger.kernel.org
Signed-off-by: Cinq Prairie <notprairie@gmail.com>
---
v1 -> v2:
- keep the single NAPI fast path, make the deadline absolute and
  re-enter the napi loop after an early need_resched() exit instead of
  removing the special case (idea from Jens)
- add numbers for the single NAPI fast path when it is not cut short
- cond_resched() between laps deferred to a follow-up patch
v1: https://lore.kernel.org/io-uring/20261025232926.17944-1-notprairie@gmail.com/

Until the follow-up adds a cond_resched() between laps, a pending
need_resched() makes the single NAPI path fall back to one-poll laps
(acquire, poll, busy_poll_stop()) for the rest of the wait, i.e. it 
behaves like the multi NAPI path until the reschedule is serviced.

How the numbers were taken:
  - bpftrace on entry/return of __io_napi_busy_loop() to measure busy
  time per wait period
  - bpftrace on napi:napi_poll tracepoint to count poll rate
  - bpftrace on the return value of io_napi_busy_loop_should_end() to
  see whether the loop ended on io_uring's own condition. Before the
  patch, with one NAPI, it never returned true and every exit came from
  __napi_busy_loop() breaking on need_resched().

First seen on a 5.14-based distribution kernel (CentOS Stream 9)
carrying the 6.13 io_uring NAPI backport (arm64, ena, isolated CPU).
Registering a second unused NAPI id works around it, which is how the
asymmetry was found.

Only static tracking was tested. Dynamic tracking goes through the same
loop and is unchanged.

 io_uring/io_uring.h |  1 +
 io_uring/napi.c     | 38 ++++++++++++++++++++------------------
 2 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/io_uring/io_uring.h b/io_uring/io_uring.h
index 32247529076c..cd2a013143e3 100644
--- a/io_uring/io_uring.h
+++ b/io_uring/io_uring.h
@@ -139,6 +139,7 @@ struct io_wait_queue {
 
 #ifdef CONFIG_NET_RX_BUSY_POLL
 	ktime_t napi_busy_poll_dt;
+	ktime_t napi_busy_poll_end;
 	bool napi_prefer_busy_poll;
 #endif
 };
diff --git a/io_uring/napi.c b/io_uring/napi.c
index 7e698720cd51..be3d557db010 100644
--- a/io_uring/napi.c
+++ b/io_uring/napi.c
@@ -134,21 +134,21 @@ static inline void io_napi_remove_stale(struct io_ring_ctx *ctx, bool is_stale)
 		__io_napi_remove_stale(ctx);
 }
 
-static inline bool io_napi_busy_loop_timeout(ktime_t start_time,
-					     ktime_t bp)
+static inline bool io_napi_busy_loop_timeout(struct io_wait_queue *iowq)
 {
-	if (bp) {
-		ktime_t end_time = ktime_add(start_time, bp);
-		ktime_t now = net_to_ktime(busy_loop_current_time());
-
-		return ktime_after(now, end_time);
-	}
-
-	return true;
+	if (!iowq->napi_busy_poll_dt)
+		return true;
+	return ktime_after(net_to_ktime(busy_loop_current_time()),
+			   iowq->napi_busy_poll_end);
 }
 
+/*
+ * The deadline is absolute so that the napi loop, which takes a fresh
+ * start_time on every entry, can be re-entered for the remaining budget
+ * after it ends early on need_resched() (NAPI_F_END_ON_RESCHED).
+ */
 static bool io_napi_busy_loop_should_end(void *data,
-					 unsigned long start_time)
+					 unsigned long __always_unused start_time)
 {
 	struct io_wait_queue *iowq = data;
 
@@ -156,8 +156,7 @@ static bool io_napi_busy_loop_should_end(void *data,
 		return true;
 	if (io_should_wake(iowq) || io_has_work(iowq->ctx))
 		return true;
-	if (io_napi_busy_loop_timeout(net_to_ktime(start_time),
-				      iowq->napi_busy_poll_dt))
+	if (io_napi_busy_loop_timeout(iowq))
 		return true;
 
 	return false;
@@ -215,13 +214,17 @@ __io_napi_do_busy_loop(struct io_ring_ctx *ctx,
 static void io_napi_blocking_busy_loop(struct io_ring_ctx *ctx,
 				       struct io_wait_queue *iowq)
 {
-	unsigned long start_time = busy_loop_current_time();
+	ktime_t now = net_to_ktime(busy_loop_current_time());
 	bool (*loop_end)(void *, unsigned long) = NULL;
 	void *loop_end_arg = NULL;
 	bool is_stale = false;
 
-	/* Singular lists use a different napi loop end check function and are
-	 * only executed once.
+	iowq->napi_busy_poll_end = ktime_add(now, iowq->napi_busy_poll_dt);
+
+	/*
+	 * With a single NAPI, hand our end check to __napi_busy_loop() so it
+	 * holds the NAPI for the whole spin. It may return early on
+	 * need_resched(), so keep going until our own deadline.
 	 */
 	if (list_is_singular(&ctx->napi_list)) {
 		loop_end = io_napi_busy_loop_should_end;
@@ -232,8 +235,7 @@ static void io_napi_blocking_busy_loop(struct io_ring_ctx *ctx,
 		do {
 			is_stale = __io_napi_do_busy_loop(ctx, loop_end,
 							  loop_end_arg);
-		} while (!io_napi_busy_loop_should_end(iowq, start_time) &&
-			 !loop_end_arg);
+		} while (!io_napi_busy_loop_should_end(iowq, 0));
 	}
 
 	io_napi_remove_stale(ctx, is_stale);

base-commit: 4a93427e99a8524f3612f29ec8bc0da5f8435a51
-- 
2.54.0

