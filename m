Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795585423;
	b=Upkspg/IVoUIgPRzc1VqwvYfEI8UJSVSBFKJdTgZ2KGJXfiM+KfnXdnW2ZPGMwE1Fscu
	 lTAhqjWC+6R4cNnfpAJlmHzGAQAOUnRGK54nrlsiWWbVe9peqlJOjEL9p+VQCGSTBpSc1
	 uiAacUETbq4vlpgqVt9EUQVFu+kfID+xxE0e0Vpv8lj24J4GzysbLKjgOzZI1OHq7Tq7C
	 kG4zJUMetzePUGg+rMJZQFv1i4j9uX8poowoLtn1eTui2EG0KW5pdioGYT3IcLz+3Rcxh
	 Pi0+wVPeq7fdT6bRKdRlfl23YQuN5fxMJqg3QWmDISJkOfyQ95n1d9CTGNBVDjMttMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795585423;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=WDOXAL+cvbcfD52BQP5cFrapIxAqONminn4qwPqLLQk=;
	b=HqQEZZM/Wzr7qcMskyECvPMk2hkkuEjBu5FT6+dWknDO0nQ8gdtxv9jbBnEufJ0do3jW
	 uYDGGoxmIu6sPYuPJySezG0rCiVagJ7dDijvwv7VlLvBqjuc+3iXdbucY/Wc4OaQhYTcE
	 yvqXL6h+odvnarm6Expnv3Cz0vkhqauvjxkXUekjTl/fwemYF2OsmGa4mn/d6cOdPSAf8
	 NOmht2EuOo0KQYl7HQWRETWcgDs0R8AicFD/QEf7ma2iGSUeFJCNw7ktWmiARM+myWaA9
	 mNTPEPx6dtRLa5HzgYGH2aj65pZj97lqGiVrlNJ5zj1lNa5Zpa3EiF10SR35JwoAO7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniontech.com;
	spf=pass smtp.mailfrom=uniontech.com;
	dkim=pass header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=IBslKWuM;
	arc=none smtp.remote-ip=54.204.34.129
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AB4606A31E;
	Wed, 25 Nov 2026 05:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44AB4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=IBslKWuM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1795585394;
	bh=WDOXAL+cvbcfD52BQP5cFrapIxAqONminn4qwPqLLQk=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=IBslKWuM5MmEtgAwlYgMwMB9ScnRRbHrxkG/kIb0ZSVAn6UKHWaDDrYNukipKXcU0
	 bR2ljHPne69dIFgejbwyc/HTy+NOOuUh2EsaMnB8Hj4CUxVsmVhOhwbp1LoM8tr9q+
	 Q2LqQpSWXPNwQq7aUnUbPvNdrCasXYuFZ6OYiD90=
X-QQ-mid: zesmtpgz8t1795585379t1e161868
X-QQ-Originating-IP: hTZFnaTlgwU/U+CDgNMMVSx9F/rb4U1t6MlkUK8+UZU=
Received: from uniontech.com ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 25 Nov 2026 13:42:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11937156528048075108
EX-QQ-RecipientCnt: 6
From: Yichong Chen <chenyichong@uniontech.com>
To: Jens Axboe <axboe@kernel.dk>,
	io-uring@vger.kernel.org
Cc: Josef Bacik <josef@toxicpanda.com>,
	Pavel Begunkov <asml.silence@gmail.com>,
	linux-kernel@vger.kernel.org,
	Yichong Chen <chenyichong@uniontech.com>
Subject: [PATCH] io_uring/timeout: account for timeouts whose CQE is not posted yet
Date: Wed, 25 Nov 2026 13:42:56 +0800
Message-Id: <20261125054256.1749370-1-chenyichong@uniontech.com>
X-Mailer: git-send-email 2.20.1
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
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MMV15OJnzRKz3hTGRdvmW+9jf0AXQAXvW+0LTDYMICVVNQwL+9J4wvWy
	rX5wY6Qn4RCeTLdCeAlBWkhpnj06CEaLjLdzb3hgCyNH2XCzcjdmoc3AQj0/cQ8thAqbz/p
	PHcs28G8iHs27LRcshUrQfVTTyy3d7h7xDUCpX1sGJm7vNhxbK4m8IgkpTzF7BHzFS91Zxl
	48fMw3yiRjxdSDFDM12VrrrHRtradXXwf1yHpyU3uZXtxDfRzv+zq0wi+pfBQJAAgbHbDrV
	meO8biSLCGfEt51UndWNt1S3JOBM7T7iJHzOhVeU4IVRHZ7GLVrGX/aekA2wDO/q7wW8wET
	cb9R3GdnWpHEn3+POUbPfMGHXi+WjHi2qvt2LTzdeO1+zBufmulh3XA8CPeMiZVORuychjZ
	yH2AdkUH/wwshs+vCTsbDede7RI8oomU+qKCRpmeHDJo4/xYCS+AE/z3ZDGmp5L2egI3hgO
	hWFoXLC5fA/KY0DTWzJEEsovZ3o+mJBFpDDogZEeqwgBmeIrJX+gozIU744Bm5WN+47DSpD
	w8AgswbynupX3i84edR37vEKx95fAFZNvJoNRdYITnFhuZTSZYVEX7Kl28+Qx1ZNxwE+TYp
	GwyT+YT2CHPeaiOjzTw1aKtL+ti/yEgcsSTv1DkIHAlulxkI9xhX3+JY59aqmZpCh8OWH6X
	i+IlEJp84FsDdAQ08Oh0346CVEU1KRru1zvzUNQYLuZCZK54Wu0E2GmyErRoMK/ho8ljeq0
	Fhxt/4KEmRR7iR1b+Gp7ZMAAp3BOiRYiWPQ9oTikkVgyyUb8BQCO/ifUvlQ6sRhnUUAKgs7
	ziHL02XWGXZInRL5ZZAJTeongFrp3Th37qVgWxm0u/c016t4PzsndPnzzvAKzP67OEJ2ZH/
	GEjCzuVEP5Kl5apm0P/cqZsjQrkDiNHJji6nwqjHT+OLHgpQ7xW5IFe8GrFNrfKVbLxjvEl
	BQZ0GN8xBX+Y1qEh6NzzemlbtGPfV0PcWD9vtXQBKrRd4NoDQNv594ZsxWDRbxmxHfddP1+
	y0GwUgWcrd1SV3iBFQjiIf1ebp/yE=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

The sequence of non-timeout CQEs is derived from ->cached_cq_tail minus
->cq_timeouts, but a timeout bumps the latter when it fires, is killed or
is cancelled, which is ahead of its CQE being posted. Reading the sequence
in between comes out low, and a target counted from such a reading is
reached that much early: a counted timeout completes with 0 while nothing
but the already posted CQEs has happened, and it can also be satisfied by
timeouts posted before it was armed. Keep track of the timeouts whose CQE
is still in flight and add them back, so that the sequence is exact
whenever it is read.

Fixes: c6c0b3eba88c ("io_uring/timeout: don't skip over reached sequences")
Signed-off-by: Yichong Chen <chenyichong@uniontech.com>

---
 include/linux/io_uring_types.h |  1 +
 io_uring/timeout.c             | 53 ++++++++++++++++++++++++++++++------------
 2 files changed, 39 insertions(+), 15 deletions(-)

diff --git a/include/linux/io_uring_types.h b/include/linux/io_uring_types.h
index 1468bcb..b947c72 100644
--- a/include/linux/io_uring_types.h
+++ b/include/linux/io_uring_types.h
@@ -457,6 +457,7 @@ struct io_ring_ctx {
 		unsigned long		check_cq;
 		atomic_t		cq_wait_nr;
 		atomic_t		cq_timeouts;
+		atomic_t		cq_timeouts_pending;
 		struct wait_queue_head	cq_wait;
 	} ____cacheline_aligned_in_smp;
 
diff --git a/io_uring/timeout.c b/io_uring/timeout.c
index db78059..f662c0c 100644
--- a/io_uring/timeout.c
+++ b/io_uring/timeout.c
@@ -114,6 +114,7 @@ static void io_timeout_complete(struct io_tw_req tw_req, io_tw_token_t tw)
 	struct io_timeout_data *data = req->async_data;
 	struct io_ring_ctx *ctx = req->ctx;
 
+	atomic_dec(&ctx->cq_timeouts_pending);
 	if (!io_timeout_finish(timeout, data)) {
 		if (!tw.cancel &&
 		    io_req_post_cqe(req, -ETIME, IORING_CQE_F_MORE)) {
@@ -129,6 +130,18 @@ static void io_timeout_complete(struct io_tw_req tw_req, io_tw_token_t tw)
 	io_req_task_complete(tw_req, tw);
 }
 
+static void io_timeout_complete_killed(struct io_tw_req tw_req, io_tw_token_t tw)
+{
+	atomic_dec(&tw_req.req->ctx->cq_timeouts_pending);
+	io_req_task_complete(tw_req, tw);
+}
+
+static void io_timeout_complete_cancelled(struct io_tw_req tw_req, io_tw_token_t tw)
+{
+	atomic_dec(&tw_req.req->ctx->cq_timeouts_pending);
+	io_req_task_queue_fail(tw_req.req, -ECANCELED);
+}
+
 static __cold bool io_flush_killed_timeouts(struct list_head *list, int err)
 {
 	if (list_empty(list))
@@ -143,7 +156,9 @@ static __cold bool io_flush_killed_timeouts(struct list_head *list, int err)
 		req = cmd_to_io_kiocb(timeout);
 		if (err)
 			req_set_fail(req);
-		io_req_queue_tw_complete(req, err);
+		io_req_set_res(req, err, 0);
+		req->io_task_work.func = io_timeout_complete_killed;
+		io_req_task_work_add(req);
 	}
 
 	return true;
@@ -159,10 +174,23 @@ static void io_kill_timeout(struct io_kiocb *req, struct list_head *list)
 
 		atomic_set(&req->ctx->cq_timeouts,
 			atomic_read(&req->ctx->cq_timeouts) + 1);
+		atomic_inc(&req->ctx->cq_timeouts_pending);
 		list_move_tail(&timeout->list, list);
 	}
 }
 
+/*
+ * Number of CQEs posted that were not timeouts, i.e. the sequence counted
+ * timeouts are ordered by. A timeout bumps ->cq_timeouts when it fires,
+ * before its CQE is posted, so subtract the ones still in flight - a
+ * reading taken then is otherwise low by that much.
+ */
+static u32 io_timeout_seq(struct io_ring_ctx *ctx)
+{
+	return READ_ONCE(ctx->cached_cq_tail) - atomic_read(&ctx->cq_timeouts) +
+		atomic_read(&ctx->cq_timeouts_pending);
+}
+
 __cold void io_flush_timeouts(struct io_ring_ctx *ctx)
 {
 	struct io_timeout *timeout, *tmp;
@@ -170,13 +198,8 @@ __cold void io_flush_timeouts(struct io_ring_ctx *ctx)
 	u32 seq;
 
 	raw_spin_lock_irq(&ctx->timeout_lock);
-	seq = READ_ONCE(ctx->cached_cq_tail) - atomic_read(&ctx->cq_timeouts);
+	seq = io_timeout_seq(ctx);
 
-	/*
-	 * A fired timeout bumps ->cq_timeouts before its CQE is posted, which
-	 * leaves the sequence behind the last flush until it is. No event has
-	 * happened then, see io_timeout().
-	 */
 	if ((s32)(seq - ctx->cq_last_tm_flush) < 0)
 		seq = ctx->cq_last_tm_flush;
 
@@ -319,6 +342,7 @@ static enum hrtimer_restart io_timeout_fn(struct hrtimer *timer)
 	list_del_init(&timeout->list);
 	atomic_set(&ctx->cq_timeouts,
 		atomic_read(&ctx->cq_timeouts) + 1);
+	atomic_inc(&ctx->cq_timeouts_pending);
 	raw_spin_unlock_irqrestore(&ctx->timeout_lock, flags);
 
 	if (!(data->flags & IORING_TIMEOUT_ETIME_SUCCESS))
@@ -371,14 +395,18 @@ int io_timeout_cancel(struct io_ring_ctx *ctx, struct io_cancel_data *cd)
 
 	raw_spin_lock_irq(&ctx->timeout_lock);
 	req = io_timeout_extract(ctx, cd);
-	if (!IS_ERR(req))
+	if (!IS_ERR(req)) {
 		atomic_set(&ctx->cq_timeouts,
 			   atomic_read(&ctx->cq_timeouts) + 1);
+		atomic_inc(&ctx->cq_timeouts_pending);
+	}
 	raw_spin_unlock_irq(&ctx->timeout_lock);
 
 	if (IS_ERR(req))
 		return PTR_ERR(req);
-	io_req_task_queue_fail(req, -ECANCELED);
+	io_req_set_res(req, -ECANCELED, 0);
+	req->io_task_work.func = io_timeout_complete_cancelled;
+	io_req_task_work_add(req);
 	return 0;
 }
 
@@ -708,7 +736,7 @@ int io_timeout(struct io_kiocb *req, unsigned int issue_flags)
 		goto add;
 	}
 
-	tail = data_race(ctx->cached_cq_tail) - atomic_read(&ctx->cq_timeouts);
+	tail = io_timeout_seq(ctx);
 
 	/*
 	 * Update the last seq here in case io_flush_timeouts() hasn't, it only
@@ -722,11 +750,6 @@ int io_timeout(struct io_kiocb *req, unsigned int issue_flags)
 		ctx->cq_last_tm_flush = tail;
 	base = ctx->cq_last_tm_flush;
 
-	/*
-	 * A fired timeout bumps ->cq_timeouts before its CQE is posted, which
-	 * leaves the sequence behind the last flush until it is. Nothing else
-	 * separates the two then, so count from the flush.
-	 */
 	if ((s32)(tail - base) < 0)
 		tail = base;
 	timeout->target_seq = tail + off;
