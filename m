Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D233949EC5F
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092685; cv=none; b=jn8Xyp7dc/5K/BFP3sl/13x4Q/SC59+cerUlHRE5XvyZ9S/H4wPpqd9YlyQf+JdLzbxUI0IjOEYwtmfB5J1S+5BxWpArXihiOzV+hRocaosMpjzdkch+sTcaqRPTKp9gDPjw32jqkic02hoTSalbl3sXkAADdKlKYo1O7npjUD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092685; c=relaxed/simple;
	bh=qvYjjAFxOEeWad4CLpSo8acrYwRfAVc5eUP0geCPlsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ed5kAm4g7a3wz0gnE75ChvGlPZXn1w1Z88ZKuUuZQjrG9sk6b5x02CoFmCqVVmE7fhd9Te1GJswKnOE/g3yr0IAYlYlKaSv3tZjURYDt8hx1bmjcqchBp+OuoWF/Ac+FOzG48PPfgXBCXRdAe6ZjA0z+Ku7a3dFYEvnbs+A3u48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=ruMM2m2Y; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="ruMM2m2Y"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93d92abf38dso530166685a.3
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092683; x=1792697483; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/rAdvsIWKYZQ/dDY33wIdz/aTZqAmtiSRi/zIbdKEAs=;
        b=ruMM2m2YNcR9zyw2N0NAmQsLboTeogWW9VVVw7aCRsDhefyxqPWDQ6qdTiND+r2UbF
         s26fglbVCSPukITPIjilt1wTzPX7T/NClaKkVma+a8QHLuAvzLmvI4lMVv0t4YqPcDIO
         KH1A5DvIHsv3flIiMi6CpbgEFzPzXPYm0F13FxLv4+IV0oSmKKAWRfZzJkCy7xFMYkEi
         g4otwx1B4WrQDsN4dy6hZcgsNZVQrYH1Ffk10RgvVx0ReIGJCgK1YWUCZIEMVL5pLMKN
         YvtQN3ggClw90thy8Hu3LHBNVy8AK56si3wHSEl5Gj0T5CGYh5mnn1CfsJ2JZvgId3Ai
         DvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092683; x=1792697483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/rAdvsIWKYZQ/dDY33wIdz/aTZqAmtiSRi/zIbdKEAs=;
        b=rqnF/S+8dJ7LadoBKd/SoKn3E0dvk6Kao/ruVDR8NjQTyDHBdXlZVeLmBqSaOGtB6t
         05nTP6Mr1yCckhAXeuEIhZ85nXMO2ONahM3aIvgaDYQDORZTwMEDTJohFmgmeSdIDU5E
         uZesHaktyePPO0HlqsPQjlJunDp8yzU5WeZD9kSEMLWxxFclGQ7YgCNmyCS+taaEoaC+
         z/xxg887+0KD1XWlbLUbY34FXmxhBY4I1y9zcYkJ1H9ulOTDc2kdrth+F2HzQGXvi5ds
         d/6+zqow58RPUmyqLIshR1hjeI6eamAt+KVuDyKmSjtp3d5ZTUj4HyJH9sp3Q88mrciY
         cdcA==
X-Gm-Message-State: AFq9FYLXoJnkxKcsigViBdmwSB7eOJI2OHPGeiwvQxnLrO5AaAR+NlgO
	8OaO/biJAZQNSVpozUCI0MWB+aPUGeqV9b3cIUQG5u6jYkWf+2ngieDA83vg7bmPqVg=
X-Gm-Gg: AYBFou0Dj/ckgozvrZ7r0IkIHPWEOIHuNnyE6DD+mvYLYhoX+eeXk/yh9kHApbaYCWE
	uc866UTA0hI9dN6bJ922G/ojoaMuUHPehkw35K3wkyKREkL/WpbVKo+WkLccbc7bzOLfVEkdNg3
	vhsrO8WRVXt3TE0bJWzJYkFEVIlevKPwJ52BRBwerljVGcjv0OJf2TEVjX9m/Cr1oEpXvmqtXbK
	jJz0z0gs0RqDOPTa/YrIRKutU7qk7qT6CB3JIvpw3U8veQKg2U3WFfm0JDZgEK3rRh9DILOIXqz
	Bbyhw/BsLAy5gMwPCLS1nXeoVI+DHYd8Xha+vkSGWQI01zXE6a9SKCywCdxkycdD3yDb9bzKJvB
	EEY/AkVvKPdjgnXEQABf35D8p3pBavo9V2B4h35kiZqrhYO3xx8XZpplXl3cDEHasM70A64159p
	HtBhWhu1GvjZuChe80e5tl1dGWx0SoUWrRB2B2MK/gpumD2IpjwJYVdrgi5MzcdIqnZl395yHAy
	BDex1vTvYmLx5k=
X-Received: by 2002:a05:620a:2808:b0:93f:953:9a1d with SMTP id af79cd13be357-93f09539b27mr838361285a.67.1792092682455;
        Thu, 15 Oct 2026 12:31:22 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.240])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a0cf974sm15173485a.1.2026.10.15.12.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:31:21 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:30:31 +0000
Subject: [PATCH 07/43] io_uring: don't lose the DEFER_TASKRUN wake up
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-7-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092658; l=4905;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=qvYjjAFxOEeWad4CLpSo8acrYwRfAVc5eUP0geCPlsQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDaYB6TrsN6hVAev7iAYLYuc6XQCv5trliMWiqy0I4+9ndZFY1OJtqY+vfC8MRlIGTgSAFrGW0G
 t29fBhOPH9g8=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

Since local task_work moved to the mpscq, ->cq_wait_nr is a credit: the
add that counts it down to zero, or exchanges it for IO_CQ_WAKE_INIT,
issues the only wake up of the wait cycle, and every later add returns
early as the count is <= 0.

An add looks at the count after it has queued its entry, so an add that
gets delayed in between can take the credit of a later cycle. That was
assumed to cause an early wake up at worst, but the waiter publishes the
count before it changes its task state:

CPU0 (submitter, io_cqring_wait)      CPU1 (io_req_local_work_add)
                                      mpscq_push(req A)
io_run_local_work()  // runs req A
atomic_set(&ctx->cq_wait_nr, 1)
                                      atomic_read(&ctx->cq_wait_nr) == 1
                                      atomic_xchg(.., IO_CQ_WAKE_INIT)
                                      wake_up_state(.., TASK_INTERRUPTIBLE)
                                        // still TASK_RUNNING, no-op
set_current_state(TASK_INTERRUPTIBLE)
io_local_work_pending() == false
schedule()
                                      mpscq_push(req B)
                                      cq_wait_nr <= 0, return

The task now sleeps with req B queued, until a signal or a timeout ends
the wait.

Set the task state first and only then make the count visible, so that
whoever takes the credit finds a task it can wake. The full barrier that
orders the count against the check of the work list is kept. Do the same
for the wait of the BPF driven loop, which copied the sequence.

Fixes: d46ab2c98aba ("io_uring: switch local task_work to a mpscq")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/loop.c |  8 +-------
 io_uring/tw.c   |  2 +-
 io_uring/wait.c |  3 +--
 io_uring/wait.h | 15 +++++++++++++++
 4 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/io_uring/loop.c b/io_uring/loop.c
index 3d472b7827fa..2340459164a1 100644
--- a/io_uring/loop.c
+++ b/io_uring/loop.c
@@ -10,12 +10,6 @@ static inline int io_loop_nr_cqes(const struct io_ring_ctx *ctx,
 	return lp->cq_wait_idx - READ_ONCE(ctx->rings->cq.tail);
 }
 
-static inline void io_loop_wait_start(struct io_ring_ctx *ctx, unsigned nr_wait)
-{
-	atomic_set(&ctx->cq_wait_nr, nr_wait);
-	set_current_state(TASK_INTERRUPTIBLE);
-}
-
 static inline void io_loop_wait_finish(struct io_ring_ctx *ctx)
 {
 	__set_current_state(TASK_RUNNING);
@@ -25,7 +19,7 @@ static inline void io_loop_wait_finish(struct io_ring_ctx *ctx)
 static void io_loop_wait(struct io_ring_ctx *ctx, struct iou_loop_params *lp,
 			 unsigned nr_wait)
 {
-	io_loop_wait_start(ctx, nr_wait);
+	io_cq_wait_arm(ctx, nr_wait);
 
 	if (unlikely(io_local_work_pending(ctx) ||
 		     io_loop_nr_cqes(ctx, lp) <= 0) ||
diff --git a/io_uring/tw.c b/io_uring/tw.c
index f9affd68dd26..98e3b1bc61b4 100644
--- a/io_uring/tw.c
+++ b/io_uring/tw.c
@@ -165,7 +165,7 @@ void io_req_local_work_add(struct io_kiocb *req, unsigned flags)
 
 	/*
 	 * The xchg() in mpscq_push() implies a full barrier, which pairs with
-	 * the barrier in set_current_state() on the io_cqring_wait() side. This
+	 * the barrier in io_cq_wait_arm() on the io_cqring_wait() side. This
 	 * ensures that either we see the updated ->cq_wait_nr, or waiters going
 	 * to sleep will observe the work added to the list, which is similar to
 	 * the wait/wake task state sync.
diff --git a/io_uring/wait.c b/io_uring/wait.c
index e03b40d9c141..5093365e9eb2 100644
--- a/io_uring/wait.c
+++ b/io_uring/wait.c
@@ -257,8 +257,7 @@ int io_cqring_wait(struct io_ring_ctx *ctx, int min_events, u32 flags,
 		unsigned long check_cq;
 
 		if (ctx->flags & IORING_SETUP_DEFER_TASKRUN) {
-			atomic_set(&ctx->cq_wait_nr, nr_wait);
-			set_current_state(TASK_INTERRUPTIBLE);
+			io_cq_wait_arm(ctx, nr_wait);
 		} else {
 			prepare_to_wait_exclusive(&ctx->cq_wait, &iowq.wq,
 							TASK_INTERRUPTIBLE);
diff --git a/io_uring/wait.h b/io_uring/wait.h
index b7b9c46b1b01..eb5ae8a6fc94 100644
--- a/io_uring/wait.h
+++ b/io_uring/wait.h
@@ -14,6 +14,21 @@
  */
 #define IO_CQ_WAKE_INIT		(-1)
 
+/*
+ * Start a wait cycle of the current task. The add that uses up ->cq_wait_nr
+ * may be one that queued its entry long ago and only now gets to look at the
+ * count. As nobody else wakes us after that, it has to find us sleeping, hence
+ * the task state must be visible before the count is. The barrier pairs with
+ * the xchg() in mpscq_push(), see io_req_local_work_add().
+ */
+static inline void io_cq_wait_arm(struct io_ring_ctx *ctx, int nr_wait)
+{
+	__set_current_state(TASK_INTERRUPTIBLE);
+	atomic_set_release(&ctx->cq_wait_nr, nr_wait);
+	/* order the above against looking at the work list */
+	smp_mb();
+}
+
 struct ext_arg {
 	size_t argsz;
 	struct timespec64 ts;

-- 
2.55.0

