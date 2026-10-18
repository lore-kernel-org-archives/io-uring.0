Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8968A2AD32
	for <io-uring@vger.kernel.org>; Sun, 18 Oct 2026 07:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792306931; cv=none; b=muGq3xJB3XTpUI3ImFH7LNYMLwvq83tkPZVueff/1i7ye51i574F8W0begV9TXv3n0dWA3qok2Pqxs0k/iyPJIxh/0q/Cl//0oU5Dm7yUFCnMmNWPlJsj/5DOLhCUPXysiP+zGnA3EWhYE/B18nsW0B7WdlACZOeA79E5v9ewQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792306931; c=relaxed/simple;
	bh=jE2Ar3+9PEya+TsYbQfDn3zP9QbTGFdR20RDgVQHwL8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NX4DzSImRev0WligyyhbvapWwr6+0SJryRdEquleFxqx3/KkF0CoMXm5TDt5/L4+z1oO1j9HYA3aE6LmEsJz7kEGevnByCYwnimO7yNxzRf0ty8Kt8tvfGAyjgSN0io1rL5pcuW26PF3/ayX3IR8UT6Zji5js4uCnkKiCEESUdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LuypwCXT; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LuypwCXT"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso388457f8f.1
        for <io-uring@vger.kernel.org>; Sun, 18 Oct 2026 00:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792306928; x=1792911728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=73A0c87v1ZCJ/T5JipXBbFur+WuPNKvTsJQ/GuTLJLA=;
        b=LuypwCXTtxTqOmeAMneXd1vRjd3yx0e1bcHUX/mjOagib6Qf+dNrU3e2BCUdIyiOCh
         m2eZ0kaiw2qz0CToHkwyJZU/fLrP6+5KHPFFpzlLXbZOyS8zVV1bNPDCGR7mAjRVKLs6
         +ZAthpNdR8vfad1QWcUt7B21av+pl/jrYDCGuyTJJXHJhx7//cb74KIKSz1EbyRwihJv
         QL0igYzfwSlAXEcEzMHHozbFaNsm92YnNT0NMRRTsDz6mZRoxcgy/qrmObv+Cg2ImaIp
         6cRuwmN8wZTvSHE/Me1grYOCl2zbalgApMW8yCIeipkUsoRitrEDQpF13t8QTUW9RWR6
         Y5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792306928; x=1792911728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=73A0c87v1ZCJ/T5JipXBbFur+WuPNKvTsJQ/GuTLJLA=;
        b=KtmbcmDBIrz6gBTnYu7PXg3m1IgRs7PrjJHfLIbKbko7TJEcFMJLpO4da0J3CX9UM+
         O0kLiVRla4Or++M+CMjFAu9SyH6O7xiotC9BVRM+B6wPmdDTBzuOsUaBFq6UYYkAKvhw
         BpeE2xxn1zib+9w4qakGFS6RoAP9sUtGrX1QbJ+sdpe58Npr7T8xL9fvUYA2pFtOfr/R
         AfD9A44B3YRBBDkzMGJ0LZsnpSsXQoDUoDXaNYxqbdnuuxSYppJYzDGoxyjuUQu/L3/q
         ijSTydv4Wkk43N2TLddv4v8gXtbpP6rS3eqYfvXize2F0vT1698e+voDZbhJiOtKyiS7
         ynLQ==
X-Gm-Message-State: AFq9FYIYFtKpRKae2GfV5DkNBZbfDOO47ROGbA7jNwQ8fSwbIH50H4cs
	C8heuCYpALa3E51TOe/ZWaEC9KqKqoTwH1KSHHvtq5sRmCm1S/L2gSij+GwFQHeURA==
X-Gm-Gg: AYBFou3ptJmwGgxBDef9D8Pm7UGan+vQhSQb9fLCuH3kZFpEwYBWhngDvVrFDx8HXtg
	/LMSfrWnniq0LQnhSNiM7vAojSOzjC6RSwC46Nnh5YDAPX5aC6lsXH8nELbz3m20hHrOY8uwvz0
	MFKT5jrquOndYVYpKHGJw3TdAbxrRKqis0tCGL1AfjQu4Qx1aKkDJ/CUW+HFWLjYHXY60Bv9Sy6
	5o+tmdcNs/8TJOyQVAqvHrb1N84npr88T7qVq6v8xihIJU2yDE9M4fte2KHqNJyr1s+1znn286b
	pQtz0ZuZZ+HVQHeAhB1A8i44FpXc98WrofV5MYxULi1taye2+4BJczdBpsFQmn2u6HTEFJ5vaqp
	qYSMz1YU/6nZahkEkuK+yqZoMXb4B6LtZ7Ft1mKXLNNQac39FNBb1Jy4m2HkQ06cZKRn4piBHR3
	puZxulZrKsWSZ1IytNZf5eRWUdA6bh0l//hNvd4WK7qi0v3hgIR6C5/MB7oJkjyMJ/vrL9Xocc9
	EdoHL7OMjReuHyggK/la8Ch6izKiFg52SaNm7GoW2o=
X-Received: by 2002:a05:6000:2005:b0:48e:d27:bef2 with SMTP id ffacd0b85a97d-48e0d27c26bmr5425675f8f.21.1792306927634;
        Sun, 18 Oct 2026 00:02:07 -0700 (PDT)
Received: from localhost ([2a07:de40:b240:0:2ad6:ed42:2ad6:ed42])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48dfd5038b8sm15376088f8f.48.2026.10.18.00.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 00:02:07 -0700 (PDT)
From: Wei Gao <wegao@suse.com>
To: Jens Axboe <axboe@kernel.dk>,
	Pavel Begunkov <asml.silence@gmail.com>
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wei Gao <wegao@suse.com>
Subject: [PATCH] io_uring: clear IO_RING_F_DRAIN_ACTIVE on drain completion flush
Date: Sun, 18 Oct 2026 07:01:54 +0000
Message-ID: <20261018070154.16944-1-wegao@suse.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When running a test that repeatedly submits requests followed by a
drained request across iterations on the same ring (such as liburing's
test/multicqes_drain.t), the test occasionally deadlocks and times out
waiting for completions (-ETIME).

Test mechanism (multicqes_drain.t):
The test executes the following sequence in each iteration on the same
ring:
1. Submits 2 poll requests on pipes:
   - sqe[0]: multishot poll on pipe1 (user_data = 10 / 0xa)
   - sqe[1]: oneshot poll on pipe2 (user_data = 20 / 0x14)
2. Triggers events via trigger_event():
   - Writes "foo" to pipe1 twice, sleeps 1ms, and reads "foo" back.
     Generates 2 CQEs for multishot poll #10 (IORING_CQE_F_MORE).
   - Writes "foo" to pipe2 once, sleeps 1ms, and reads "foo" back.
     Generates 1 CQE for oneshot poll #20.
3. Submits poll_remove and a drained NOP:
   - sqe[0]: poll_remove #10 (user_data = 30 / 0x1e)
   - sqe[1]: NOP with IOSQE_IO_DRAIN (user_data = 40 / 0x28)
   Produces 1 CQE for poll_remove (ret=0), 1 CQE for multishot
   cancel (ret=-ECANCELED), and 1 CQE for the drained NOP.
4. Harvests all 6 expected CQEs with io_uring_wait_cqe_timeout().
5. Loops back to step 1 on the same ring for the next iteration.

Why the failure occurs:
Prior to commit 8fb7aee05591 ("io_uring: drain based on allocates reqs"),
io_queue_deferred() checked CQ sequence numbers:
(seq + ctx->cq_extra != ctx->cached_cq_tail). When the prior drain request
posted its CQE, sequence numbers matched immediately. Even if
IO_RING_F_DRAIN_ACTIVE was not cleared upon completion, the next
iteration's non-drain request dequeued right away, emptied
ctx->defer_list, and cleared the flag via io_drain_req():

    if (!drain && list_empty(&ctx->defer_list))
        ctx->int_flags &= ~IO_RING_F_DRAIN_ACTIVE;

However, commit 8fb7aee05591 ("io_uring: drain based on allocates reqs")
changed the defer check:

-   if ((drain_seen || first) && io_drain_defer_seq(de->req, de->seq))
-       break;
+   if ((drain_seen || first) && ctx->nr_req_allocated != ctx->nr_drained)
+       return;

This change severed the self-healing mechanism:
1. Originally, the check verified whether all CQEs had been posted
   (seq + cq_extra == cached_cq_tail, e.g. 6 == 6). Even if the io-wq
   worker thread was delayed in freeing request memory, cached_cq_tail had
   already advanced, allowing the request to dequeue and self-heal.
2. The commit changed the check to whether slab memory has been freed
   (nr_req_allocated != nr_drained). Drained requests run via io-wq
   (due to forced async) and have an asynchronous refcount teardown: the
   CQE is reaped by userspace, but the io-wq worker thread drops its
   reference slightly later via io_wq_free_work() -> io_free_req().
3. If iteration N+1 submits before io_wq_free_work() runs, the allocation
   counter still accounts for the prior NOP (allocated=2, drained=1).
4. Seeing 2 != 1, io_queue_deferred() aborts early via return. This
   completely bypasses list_del_init() and the self-healing clearance in
   io_drain_req(), stranding the new poll requests on ctx->defer_list.
5. While polls are stranded on ctx->defer_list, userspace writes to
   and reads from the pipe. When polls are finally released later, the
   pipe data is already gone. The multishot poll permanently misses the
   event, producing fewer CQEs and causing a timeout (-ETIME).

Trace comparison (Passing vs Failing iteration):

Kprobes registered for tracing:
  p:drain_check io_queue_deferred+0xd7 \
      allocated=+0x464:u32 drained=+0x460:u32
  p:drain_blocked io_queue_deferred+0xeb \
      allocated=+0x464:u32 drained=+0x460:u32
  p:drain_dequeued io_queue_deferred+0x88 drained=+0x460:u32
  p:free_work io_wq_free_work work=%di
  p:flush_compl __io_submit_flush_completions \
      allocated=+0x464:u32 int_flags=+0x4:u32

[Passing iteration - iou-wrk frees slab before next submission]:
1. Prior drained NOP completes, slab memory freed in time (1 == 1):
   400.411558: flush_compl: allocated=1 int_flags=208
   400.411558: io_uring_complete: user_data 0x28, result 0, cflags 0x0
2. New poll requests enter io_drain_req(); check matches (1 == 1):
   400.411563: drain_check: allocated=1 drained=1
   400.411564: drain_dequeued: drained=1
   400.411566: free_work: work freed
3. Polls arm on pipes immediately before userspace writes; events caught:
   400.412638: io_uring_complete: user_data 0xa, result 1, cflags 0x2
   400.412638: flush_compl: allocated=9 int_flags=192
   400.413703: io_uring_complete: user_data 0xa, result 1, cflags 0x2
   400.413703: flush_compl: allocated=9 int_flags=192
   400.414768: flush_compl: allocated=9 int_flags=192
   400.414768: io_uring_complete: user_data 0x14, result 1, cflags 0x0
4. poll_remove and drained NOP submitted; drained NOP waits:
   400.414769: drain_check: allocated=3 drained=1
   400.414770: drain_blocked: allocated=3 drained=1
   400.414770: flush_compl: allocated=3 int_flags=208
   400.414770: io_uring_complete: user_data 0x1e, result 0, cflags 0x0
   400.414770: drain_check: allocated=2 drained=1
   400.414770: drain_blocked: allocated=2 drained=1
   400.414771: flush_compl: allocated=2 int_flags=208
   400.414771: io_uring_complete: user_data 0xa, result -125, cflags 0x0
5. All prior requests done (1 == 1); drained NOP dequeues and completes:
   400.414771: drain_check: allocated=1 drained=1
   400.414771: drain_dequeued: drained=1
   400.414773: free_work: work freed
   400.414774: flush_compl: allocated=1 int_flags=208
   400.414774: io_uring_complete: user_data 0x28, result 0, cflags 0x0
   => All 6 CQEs reaped successfully (PASS).

[Failing iteration - iou-wrk delayed by 15 us -> FAIL]:
1. Iteration N NOP completes, but iou-wrk free_work has not run yet:
   400.424650: flush_compl: allocated=1 int_flags=208
   400.424650: io_uring_complete: user_data 0x28, result 0, cflags 0x0
2. 10 us later, Iteration N+1 submits sqe[0] (POLL_ADD) and sqe[1].
   Because DRAIN_ACTIVE was not cleared, requests enter io_drain_req().
   Because slab memory for the prior NOP is not freed yet, counters
   mismatch (2 != 1):
   400.424660: drain_check: allocated=2 drained=1
   400.424661: drain_blocked: allocated=2 drained=1
   400.424662: drain_check: allocated=3 drained=2
   400.424662: drain_blocked: allocated=3 drained=2
3. 5 us later, iou-wrk finally frees old NOP (polls already blocked):
   400.424665: free_work: work freed
4. While polls are trapped on defer_list, userspace writes and reads pipe.
   When polls are finally released 1ms later, the pipe is already empty:
   400.425726: flush_compl: allocated=3 int_flags=208
   400.425727: drain_check: allocated=2 drained=2
   400.425727: drain_dequeued: drained=2
   400.425727: drain_dequeued: drained=1
5. Pipe event permanently missed; 1.0s later, wait_cqe times out (-ETIME):
   401.428202: flush_compl: allocated=3 int_flags=208
   401.428203: io_uring_complete: user_data 0xa, result -125, cflags 0x0
   401.428207: drain_check: allocated=2 drained=2
   401.428208: drain_dequeued: drained=2
   401.428210: drain_blocked: allocated=2 drained=1
   401.428213: flush_compl: allocated=2 int_flags=208
   401.428213: io_uring_complete: user_data 0x1e, result -14, cflags 0x0
   401.428213: io_uring_complete: user_data 0x28, result -125, cflags 0x0
   => wait_cqe timed out: ret=-62 (-ETIME)

Fix:
Make io_queue_deferred() return a bool indicating whether any drain
request was active or deferred. In __io_submit_flush_completions(), track
whether any completing request had REQ_F_IO_DRAIN. Clear
IO_RING_F_DRAIN_ACTIVE only when a drained request has completed
(has_drain), no drain was active or deferred (!drain_dispatched), and
ctx->defer_list is empty. This prevents premature clearance if an
unrelated completion flushes while a drain request is still executing
in io-wq.

All 10,000 iterations of reproduce_drain and liburing multicqes_drain.t
pass reliably with this fix.

Fixes: 8fb7aee05591 ("io_uring: drain based on allocates reqs")
Signed-off-by: Wei Gao <wegao@suse.com>
---
 io_uring/io_uring.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index cf5218d100d9..4f7b054e6f97 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -445,7 +445,7 @@ unsigned io_linked_nr(struct io_kiocb *req)
 	return nr;
 }
 
-static __cold noinline void io_queue_deferred(struct io_ring_ctx *ctx)
+static __cold noinline bool io_queue_deferred(struct io_ring_ctx *ctx)
 {
 	bool drain_seen = false, first = true;
 
@@ -458,7 +458,7 @@ static __cold noinline void io_queue_deferred(struct io_ring_ctx *ctx)
 
 		drain_seen |= de->req->flags & REQ_F_IO_DRAIN;
 		if ((drain_seen || first) && ctx->nr_req_allocated != ctx->nr_drained)
-			return;
+			return true;
 
 		list_del_init(&de->list);
 		ctx->nr_drained -= io_linked_nr(de->req);
@@ -466,6 +466,8 @@ static __cold noinline void io_queue_deferred(struct io_ring_ctx *ctx)
 		kfree(de);
 		first = false;
 	}
+
+	return drain_seen;
 }
 
 void __io_commit_cqring_flush(struct io_ring_ctx *ctx)
@@ -1131,12 +1133,16 @@ void __io_submit_flush_completions(struct io_ring_ctx *ctx)
 {
 	struct io_submit_state *state = &ctx->submit_state;
 	struct io_wq_work_node *node;
+	bool has_drain = false;
 
 	__io_cq_lock(ctx);
 	__wq_list_for_each(node, &state->compl_reqs) {
 		struct io_kiocb *req = container_of(node, struct io_kiocb,
 					    comp_list);
 
+		if (req->flags & REQ_F_IO_DRAIN)
+			has_drain = true;
+
 		/*
 		 * Requests marked with REQUEUE should not post a CQE, they
 		 * will go through the io-wq retry machinery and post one
@@ -1157,8 +1163,12 @@ void __io_submit_flush_completions(struct io_ring_ctx *ctx)
 		INIT_WQ_LIST(&state->compl_reqs);
 	}
 
-	if (unlikely(ctx->int_flags & IO_RING_F_DRAIN_ACTIVE))
-		io_queue_deferred(ctx);
+	if (unlikely(ctx->int_flags & IO_RING_F_DRAIN_ACTIVE)) {
+		bool drain_dispatched = io_queue_deferred(ctx);
+
+		if (has_drain && !drain_dispatched && list_empty(&ctx->defer_list))
+			ctx->int_flags &= ~IO_RING_F_DRAIN_ACTIVE;
+	}
 
 	ctx->submit_state.cq_flush = false;
 }
-- 
2.55.0

