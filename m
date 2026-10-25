Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792971001;
	b=wPEREVEOKznc3XzEPexmK3ACAbkepDbjJhpGIm7vW7OqqxuaCD2PwVNRNcuGbJtyhywK
	 xz1lG2vB08iGyO6jOWuRshaANhRfAoA+6RLA8SeEKnW3VMie/QRhWZJhFkX/YbdM6BiZB
	 IXNIDlgfLaqjSqLdc3RAYkxcJ2jl8FU+PnDiGPeFM/w+rMW9IUyD7bLERLMUyTX7QZz2W
	 N6a0AugYM+h78KlosrnfT69WkuUd0PF2c10R28yGvDrNksMvdShgOWHjJIiM0VrYrT82+
	 G/tivQyzeeRPDuYmdEZGmmBhl9NfTrXihaFRqNmeQOie2yHsf7cuuhN2w1o0inp3OPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792971001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Cb9GVPbCNDNEnABV4SrbBQzzA6WG5Igi7eFBQcJEZP0=;
	b=oQNb4v9Ke6cNx2Lud5crCdKNBVVT4AJyEebuURxE9tzD3LQE7KrK7DWELd/rBm1Ng5U/
	 LqXw+PEXdLw/vJezJYn09YjkCV3622jRCiIocx8RgStg3b1HAkenr2nSBEX3fXSlrJ4dF
	 RxjDyfkYwq5kceYRYWzh7CNdxQjKWyrrEUw8ymT3hD0lP11R9TKV9upJB6HzKLtppnjv7
	 1zhV/M30Bii6XNyfFI7bkmzNMbs2TzFOHbixvRpgz/+y0/gb0+1NN8Em5VXLJhGFz2xir
	 2tVV4F/Xy9kRAjDaaVSPq/OEBJNf9QsKxtncQEC2BTP3zfp7yUwa2OqdazwuKIUfpMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DYOFP6sS;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE12606A31A
	for <io-uring@vger.kernel.org>; Sun, 25 Oct 2026 23:30:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADE12606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DYOFP6sS
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c4649b35bso2506945f8f.3
        for <io-uring@vger.kernel.org>; Sun, 25 Oct 2026 16:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792970999; x=1793575799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cb9GVPbCNDNEnABV4SrbBQzzA6WG5Igi7eFBQcJEZP0=;
        b=DYOFP6sS27UENc9GFfa575sr42/vT8IOsZa9nNVZP7aTWRuzZmXumUEvucD6upCjjC
         jhJr8ivLGe/ZbdYgjHVU10rJcvw+ePLbuAfglMMXbG0qRfy7eCVSs2siUsTgs4odAC3m
         cps6UnmhkDRbFz6bJGkWG5vSFVDz5yK388l2fDp5K/zLztPYCgN73izoHSFLrWHsEjYi
         ziySmLCvQaILgbmtpk0d4fVtyst1TGzeNYuJCrTKyuwj8wjck/6b4BxjYlf5vLt1t/Cz
         HLkKq6K/u2L9fduucZpWhVjI3QrCGpt7pAXujWDuPhWWFZpb+PiDaygDjD8ILYIvEi1A
         2/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792970999; x=1793575799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cb9GVPbCNDNEnABV4SrbBQzzA6WG5Igi7eFBQcJEZP0=;
        b=W6D50GgyeMV+tSDfaYfRQLmGVOpS5/Wu3FiKDBCInKhelmTMZt/vTiLUss3839LTbN
         WSCmp5lrfU/GS60PhmBDSLmPTGPukxiEbeSe1mUKOsajau7z4aidsmZfjOxelJnphBjj
         jJWiZnppoDLIyG4XP+5/Q4JlM9trt5cW588PgdqaqQp7EDKB2TwFbuK5gcwtU99SSLCp
         AacTLD9+PNjymJvsGy8/C6gKbV2sRrO4VF8QlQR1y80nrMQ+j7gSgw7OhAepr96Znmrv
         +37hfFS9wHPtjF5uGHnVb8KN+Xsn6UutaDJiJZT6ZThPpaZn2gecLZEx/gb6hSYvuZIf
         r+vg==
X-Forwarded-Encrypted: i=1; AKwUvBwPNunh9DAcEMCh8n+hNvhly13n7nDJQ1MLDL6VGXMLj8CH2OAGh4GHUKRVShj+mwXteTBD+oxE7A==@vger.kernel.org
X-Gm-Message-State: AFq9FYLPSwcHo/NBidcqjnxzHR0uqcuxAG/lZGtdVhzW1aDxRbWYZdO4
	cgIkvvL4rSCXA/0HDZ/sRSoitvy3QuTK4r8/XMhSbx3wkJkTHk52xPlTQtAwb1xw
X-Gm-Gg: AYBFou04muqL3y8iD/BPuLtR2CzzFBVUjsPdZSDNlBtSnfFcmRUSY1r28MpDYs3P0ye
	c0EzJpG3mYXbpyDVIa8I/gc5fs1AOQGfPWdWAvsvTBCzBjpPtJ6aF8BaYXNjFlL7gUsLMBKykZk
	82+V/xHYD8Fkj/WI41xlA4QvP7yunycGj9mK6FaS1dg+rpMXtTxtXsUrPCMAUlHyo8GW+hluXnt
	WLyZfwqhyOiiUPlnw3H8xUZ76lbaksHxyaLklseMvrUDIVahk8L7oBiJdyalP5nqqf9suu6RAB4
	0C5/VHkW42cUoi0PkxtUyNjpX4BCsrV33MRLqnVCL9RjVKnYqRY/NhiGgzfkeOHMoFQa5BlBqpZ
	bWmI0OT1iZHlpOhJ2iRTuPVBWTKq6d9ELwlc2SJU5O9/TxhJIwSWspoO5Um1S2+I8Cik2L3g1aS
	39MhpK+mQ0ydhLne/Cel5tVpqz7bzlbaDPbVa/TzxJznV2GL1gMwrqEOmB/zJLBHM5BvSn1CYcS
	E2gkG90nbiFrJkpOJ8WnIPIoS4FYJSS9NfZetNZtIt3vufk
X-Received: by 2002:a5d:5d03:0:b0:488:57ad:d5c8 with SMTP id ffacd0b85a97d-48e3eb2bcb0mr11789488f8f.3.1792970999011;
        Sun, 25 Oct 2026 16:29:59 -0700 (PDT)
Received: from fedora ([2a02:168:fe54:0:500c:846b:8abe:fa7a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f37csm10380107f8f.8.2026.10.25.16.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 16:29:57 -0700 (PDT)
From: Cinq Prairie <notprairie@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Stefan Roesch <shr@devkernel.io>,
	Jakub Kicinski <kuba@kernel.org>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cinq Prairie <notprairie@gmail.com>
Subject: [PATCH] io_uring/napi: drop the single NAPI busy poll special case
Date: Mon, 26 Oct 2026 00:29:26 +0100
Message-ID: <20261025232926.17944-1-notprairie@gmail.com>
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

io_napi_blocking_busy_loop() has a special case for a single registered
NAPI: it passes io_napi_busy_loop_should_end() as loop_end to
napi_busy_loop_rcu() and runs its own loop only once, relying on the
inner __napi_busy_loop() to spin until that predicate says to stop.

napi_busy_loop_rcu() sets NAPI_F_END_ON_RESCHED, so __napi_busy_loop()
also returns when need_resched() becomes true. io_uring treats that
return as the end of the busy-poll period and falls through to
schedule_hrtimeout() for the remainder of the wait timeout. The queue
is then serviced by the gro_flush_timeout softirq timer instead of
being actively polled (when napi_defer_hard_irqs/gro_flush_timeout are
set).

With two or more NAPIs, the inner loop runs for a single iteration and
io_uring's outer loop controls the busy-poll period, honoring
busy_poll_to. As a result, the same registration behaves differently
depending on whether one or multiple NAPIs are registered.

Remove the special case so a single NAPI follows the same path as
multiple NAPIs: the inner loop runs for a single iteration, while
io_uring continues busy polling until a completion, a signal or the
deadline. Since commit df8599ee18c0 ("io_uring/napi: cap busy_poll_to
10 msec"), the deadline is at most 10 ms on every path, so this does not
extend the busy-poll period beyond what the multi-NAPI path already
allows.

First observed on a 5.14-based distribution kernel carrying the 6.13
io_uring NAPI backport, reproduced on io_uring-7.4 at 9c207aa58e54,
x86-64, HZ=1000, PREEMPT_DYNAMIC (lazy), no CPU isolation, low RX
traffic, r8169 with one RX queue, prefer_busy_poll, busy_poll_to = wait
timeout = 10 ms, with a SCHED_FIFO task pinned to the polling CPU
waking every 1 ms:

  before, 1 NAPI:  busy 0.5-1.5 ms per 10 ms wait, ~0.8M polls/s, CPU ~5%
  before, 2 NAPIs: busy 10 ms per 10 ms wait,      ~7.2M polls/s, CPU ~100%
  after,  1 NAPI:  busy 10 ms per 10 ms wait,      ~7.4M polls/s, CPU ~100%

Fixes: 8d0c12a80cde ("io-uring: add napi busy poll support")
Cc: stable@vger.kernel.org
Signed-off-by: Cinq Prairie <notprairie@gmail.com>
---
How the numbers were taken:
  - bpftrace on entry/return of __io_napi_busy_loop() to measure busy
  time per wait period
  - bpftrace on napi:napi_poll tracepoint to count poll rate
  - bpftrace on the return value of io_napi_busy_loop_should_end() to
  see whether the loop ended on io_uring's own condition. Before the
  patch, with one NAPI, it never returned true and every exit came from
  __napi_busy_loop() breaking on need_resched().
Code and raw data available on request.

The asymmetry was found because registering a second dummy NAPI id
(0xFFFFFFFF, which napi_by_id() never matches) made the busy period
honor busy_poll_to again. That is what we run as a workaround today.

On the original arm64/CentOs Stream 9/ena system (isolated CPU,
nohz_full) the trigger was most likely RCU's urgent quiescent-state
resched_cpu() (not traced) rather than a wakeup, resulting in ~97% of a
1 s busy_poll_to loss.

Alternatives considered: re-entering the singular loop after an early
return is not viable, as __napi_busy_loop() restarts its deadline on
entry and would overshoot busy_poll_to. Keeping the singular fast path
and falling back to the single-shot loop only after an early return
works, but leaves two code paths for a case whose only benefit was the
one it was broken for. Happy to switch if preferred.

Only static tracking was tested. Dynamic tracking goes through the same
loop and is unchanged.

 io_uring/napi.c | 38 ++++++++++----------------------------
 1 file changed, 10 insertions(+), 28 deletions(-)

diff --git a/io_uring/napi.c b/io_uring/napi.c
index 7e698720cd51..5362690a9d17 100644
--- a/io_uring/napi.c
+++ b/io_uring/napi.c
@@ -166,28 +166,24 @@ static bool io_napi_busy_loop_should_end(void *data,
 /*
  * never report stale entries
  */
-static bool static_tracking_do_busy_loop(struct io_ring_ctx *ctx,
-					 bool (*loop_end)(void *, unsigned long),
-					 void *loop_end_arg)
+static bool static_tracking_do_busy_loop(struct io_ring_ctx *ctx)
 {
 	struct io_napi_entry *e;
 
 	list_for_each_entry_rcu(e, &ctx->napi_list, list)
-		napi_busy_loop_rcu(e->napi_id, loop_end, loop_end_arg,
+		napi_busy_loop_rcu(e->napi_id, NULL, NULL,
 				   ctx->napi_prefer_busy_poll, BUSY_POLL_BUDGET);
 	return false;
 }
 
 static bool
-dynamic_tracking_do_busy_loop(struct io_ring_ctx *ctx,
-			      bool (*loop_end)(void *, unsigned long),
-			      void *loop_end_arg)
+dynamic_tracking_do_busy_loop(struct io_ring_ctx *ctx)
 {
 	struct io_napi_entry *e;
 	bool is_stale = false;
 
 	list_for_each_entry_rcu(e, &ctx->napi_list, list) {
-		napi_busy_loop_rcu(e->napi_id, loop_end, loop_end_arg,
+		napi_busy_loop_rcu(e->napi_id, NULL, NULL,
 				   ctx->napi_prefer_busy_poll, BUSY_POLL_BUDGET);
 
 		if (time_after(jiffies, READ_ONCE(e->timeout)))
@@ -198,15 +194,13 @@ dynamic_tracking_do_busy_loop(struct io_ring_ctx *ctx,
 }
 
 static inline bool
-__io_napi_do_busy_loop(struct io_ring_ctx *ctx,
-		       bool (*loop_end)(void *, unsigned long),
-		       void *loop_end_arg)
+__io_napi_do_busy_loop(struct io_ring_ctx *ctx)
 {
 	switch (READ_ONCE(ctx->napi_track_mode)) {
 	case IO_URING_NAPI_TRACKING_STATIC:
-		return static_tracking_do_busy_loop(ctx, loop_end, loop_end_arg);
+		return static_tracking_do_busy_loop(ctx);
 	case IO_URING_NAPI_TRACKING_DYNAMIC:
-		return dynamic_tracking_do_busy_loop(ctx, loop_end, loop_end_arg);
+		return dynamic_tracking_do_busy_loop(ctx);
 	default:
 		return false;
 	}
@@ -216,24 +210,12 @@ static void io_napi_blocking_busy_loop(struct io_ring_ctx *ctx,
 				       struct io_wait_queue *iowq)
 {
 	unsigned long start_time = busy_loop_current_time();
-	bool (*loop_end)(void *, unsigned long) = NULL;
-	void *loop_end_arg = NULL;
 	bool is_stale = false;
 
-	/* Singular lists use a different napi loop end check function and are
-	 * only executed once.
-	 */
-	if (list_is_singular(&ctx->napi_list)) {
-		loop_end = io_napi_busy_loop_should_end;
-		loop_end_arg = iowq;
-	}
-
 	scoped_guard(rcu) {
 		do {
-			is_stale = __io_napi_do_busy_loop(ctx, loop_end,
-							  loop_end_arg);
-		} while (!io_napi_busy_loop_should_end(iowq, start_time) &&
-			 !loop_end_arg);
+			is_stale = __io_napi_do_busy_loop(ctx);
+		} while (!io_napi_busy_loop_should_end(iowq, start_time));
 	}
 
 	io_napi_remove_stale(ctx, is_stale);
@@ -403,7 +385,7 @@ int io_napi_sqpoll_busy_poll(struct io_ring_ctx *ctx)
 		return 0;
 
 	scoped_guard(rcu) {
-		is_stale = __io_napi_do_busy_loop(ctx, NULL, NULL);
+		is_stale = __io_napi_do_busy_loop(ctx);
 	}
 
 	io_napi_remove_stale(ctx, is_stale);

base-commit: 9c207aa58e54ce14723361e4aaad16975ad64dc8
-- 
2.54.0

