Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D4257C72A
	for <io-uring@vger.kernel.org>; Wed,  9 Sep 2026 14:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963041; cv=none; b=BFhl8psfgZAWZtorrWlVVIhmkD79VVpsbdOruuIkc9eXC9oDM35XbyDcky8TtTRy6b57JewhV8O1AvE0WUlwdylMTw82oGzGzN9QbZmhtC+YboHlXy2zCXs8wXNawmwGfGs9Pho+2PR7tY0Tbxyx79gPOW/tgsFfdBKJaHtzVvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963041; c=relaxed/simple;
	bh=gj4QX4R/Eo4TFpo9/vY8O6DSsgDd6rFdAguJL3YCba0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D5JAp6M5aZYqdAV5jb/A7vJb/PPFReBkLKFLEU23TziiY9XvuD0j1F3Q9amVxlobsbaOhJ36fvCq+2ZlVJfxVkTiVHZWV3BZrk0JOnBbOFnLA4toaTtjrmesm4MreYPPPjU+vihpbtw1eypJ+5vL7JRCv6qWqwiKDB9L5dGPSXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=PArsjIki; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="PArsjIki"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-43b7e186a0cso3151371fac.0
        for <io-uring@vger.kernel.org>; Wed, 09 Sep 2026 07:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1788963038; x=1789567838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S3zQwxx5Tco32EyQn+PtsdLeuLR0i+7QJ8jY547nns0=;
        b=PArsjIkimIl7RRi7aAWP9XdVjnxbeMUIxbLNdhsPCqHlkgh5DAeFG5N4E2kEasHBkd
         3Lty/WfmI2OdHvNNd4GRTPqm9YWMEBxICYBpHcvajI1iXJT2FlodqxBMrbUn8StJj2oO
         jDlG6AM5IutaFx1CqVa5XN3midga1mTXe4LMX7RWlk20NAy4tLfO3aypsSei0l0XONaL
         xmfd7pZSREAQhZ/icLAY1kQdK4nvb2EpPqGoJuYUzDERXmqqMqdWWmjFmLolYCISoxcM
         AH9Bp73btNcCv9BOndeoPI9pu1xdzsIDQ8832O9qKbBalN6HZgS4B8p0M1tQQkbgSYpg
         tASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963038; x=1789567838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S3zQwxx5Tco32EyQn+PtsdLeuLR0i+7QJ8jY547nns0=;
        b=CCMUB0RSDLmZ87H8gJMvlLocmGMqXeicHSs/OBTxvRJ/zk5BEJqV6bbtc3j+h85Mj5
         rWtdVcWYYmSyiR3NNtDcXYchqAWt/h6SUgHBWV4kEpOlQVdUOmqQRPEsqc66YgP5RGsi
         jRhmUT5LH+QoQmxFIC5nh/7u3vdFcn0grxLIGynqykCMWJ+Lr/XtBvd6YWnTXTAwYIyo
         zDAPVdWY1vY2hg8jOzs5hkR13NeTZoVIEhR2GfLM75xU/OvYFEF75LqBsuM5yzUdpybu
         brhCiXvO5Lq137IvSBu/XoYwFFwTqsjBBdADrVyxDclN/o5q1C7A937Xy8lMVW1o+LsW
         8o1A==
X-Gm-Message-State: AFuF++nynC7v5zeiSc6hLKYax892q3fWDo2oLR6mYX/X+xJTl0NB1lhV
	4N/vQb+mJpNE0tXm5Kk//V1UN1qySMwiGdwe2nKOAxR9WicMDJ3yQSopL420IC5loPv9ygTTYmE
	ASoPV20Q=
X-Gm-Gg: AYBFou3Bo9EainK7xYUWTF2U/z4SbUVyoqvoUAE1zIxtWqiodyNBLoKntAQ4HmYaYLI
	mi+zTFd7VagG2bW+YGdackJRf44uJMuGH4C6Lfa1thcC+C90TtmgNVDqoSOiiR9QEwjzIltzAyT
	tTHG3zw/2B+40/PScBlBmwgfgQuXoVb0u1ChFXfeywu2WBjUBjohu/R1KS+eG/34zhhJalrPwS4
	EwYE9rYF9QqQYwpL4pNymvYs3Q1wxMUWNMEn+7mVbmPel5j092Yywbu75Sxef/pIqEJCNNmsU2s
	S1vyDBTSOI3n5J/GGoYs1Ji2octbCDo7vBSdNsCO4Mwak1iOpgr+wB9HNbDLbsz1lyeNbzuMuoy
	jZC+kXWcg+z872VxnTFvoLv52NkMDfxmwMb8jJwut0S1IQ+sG/9xzWIm4ArXH4R2yb2DgSp/6//
	dWN9KFn0UvhG3MG3Ks4N04vq9xvRBUtn4Pu+i5r8z+GlgKlZL/WeiLFQ7Z6zNG4YrWItQQOt8xG
	UkYRix1FbOgRcyhdAj7IOOywNtvi8xlM4DnLiAhPOwE
X-Received: by 2002:a05:6870:c389:b0:475:a112:1277 with SMTP id 586e51a60fabf-475a1124b65mr16757302fac.36.1788963037815;
        Wed, 09 Sep 2026 07:10:37 -0700 (PDT)
Received: from m2max ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47a7585b25esm5406514fac.11.2026.09.09.07.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:10:35 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: juanlu@fastmail.com,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 6/7] io_uring: wait for in-flight requests on ring release
Date: Wed,  9 Sep 2026 08:06:16 -0600
Message-ID: <20260909141010.21064-7-axboe@kernel.dk>
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

With cancelations now run at release time, what's left in-flight on
the ring afterwards is mostly I/O that has already been issued to a
device and just needs to finish. Until that happens, the files from
those requests pin the files they were using. Wait for those.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/io_uring.c | 74 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 73 insertions(+), 1 deletion(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 0acdece3c196..32adb2d26d17 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -2343,6 +2343,76 @@ static __cold void io_ring_ctx_cancel(struct io_ring_ctx *ctx)
 	io_req_caches_free(ctx);
 }
 
+/* Number of requests that should be waited for */
+static __cold unsigned int io_ring_ctx_inflight(struct io_ring_ctx *ctx)
+{
+	guard(mutex)(&ctx->uring_lock);
+	__io_req_caches_free(ctx);
+	return ctx->nr_req_allocated - ctx->nr_notifs;
+}
+
+/*
+ * Run task_work completions for current. Only do so if the io_uring callback
+ * itself can get pruned first, otherwise we risk recursing.
+ */
+static __cold bool io_ring_run_own_completions(struct io_uring_task *tctx)
+{
+	unsigned int count = 0;
+
+	if (!tctx || mpscq_empty(&tctx->task_list))
+		return true;
+	if (!task_work_cancel(current, &tctx->task_work))
+		return false;
+	tctx_task_work_run(tctx, UINT_MAX, &count);
+	return true;
+}
+
+/*
+ * Requests may remain after cancelations have been run, as not all requests
+ * are cancelable. Storage I/O is an example. Wait for those so that once
+ * close(2) returns, files pinned by these requests have been released.
+ */
+static __cold void io_ring_ctx_wait_inflight(struct io_ring_ctx *ctx)
+{
+	struct io_uring_task *tctx = current->io_uring;
+	bool ran_own = true;
+
+	if (current->flags & (PF_KTHREAD | PF_EXITING))
+		return;
+	if (tctx && atomic_read(&tctx->in_cancel))
+		return;
+
+	while (io_ring_ctx_inflight(ctx) && !fatal_signal_pending(current)) {
+		unsigned int state;
+
+		if (test_thread_flag(TIF_NOTIFY_SIGNAL)) {
+			clear_notify_signal();
+			if (task_work_pending(current))
+				set_notify_resume(current);
+		}
+		state = TASK_INTERRUPTIBLE;
+		if (signal_pending(current))
+			state = TASK_KILLABLE;
+		set_current_state(state | TASK_FREEZABLE);
+		/* don't sleep on work that's already there and that we can run */
+		if (ran_own && ((tctx && !mpscq_empty(&tctx->task_list)) ||
+		    io_local_work_pending(ctx)))
+			__set_current_state(TASK_RUNNING);
+		else
+			schedule_timeout(1);
+
+		/* completions may be queued behind us */
+		if (!io_ring_run_own_completions(tctx)) {
+			if (!ran_own)
+				break;
+			ran_own = false;
+		} else {
+			ran_own = true;
+		}
+		io_ring_ctx_cancel(ctx);
+	}
+}
+
 static __cold void io_ring_exit_work(struct work_struct *work)
 {
 	struct io_ring_ctx *ctx = container_of(work, struct io_ring_ctx, exit_work);
@@ -2433,8 +2503,10 @@ static __cold void io_ring_ctx_wait_and_kill(struct io_ring_ctx *ctx)
 	 * out, and for requests owned by the task closing the ring, this
 	 * ensures any held files are put before close(2) returns.
 	 */
-	if (!(current->flags & PF_IO_WORKER))
+	if (!(current->flags & PF_IO_WORKER)) {
 		io_ring_ctx_cancel(ctx);
+		io_ring_ctx_wait_inflight(ctx);
+	}
 
 	INIT_WORK(&ctx->exit_work, io_ring_exit_work);
 	/*
-- 
2.55.0

