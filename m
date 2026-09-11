Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AA749E5D1
	for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 15:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141709; cv=none; b=TCrpXM3vhTc4iDJwOj+jxI0W+GeS4g1qkxjqz2DA1VGKoRxWaRJpKSxUh6Lc4U7w3gl3vSkOKQTELaKMeYh3z4CURUtkRyzirbjoy0UdI26ekqXAoPraQBJUWUctsATgs8Nh7Bx5MqVSsLivIfbw1wIVMaP3dRgYwbffE+caGqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141709; c=relaxed/simple;
	bh=OYvoE0poGRFPY0Lowd3hYwvh/QD65dRzyC+uPftCno8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TmdPe+7EroWbO0ahyIPYj4xrF95u8DtQjuLOeSnnKJ/+QxtrGslCxv+EoKbwV825MTy/c5NGBSC01tFQU3xknxp7zB5hjlBJ51o0a70SEHXDo03Fq+L87WlJVFKtWQE+wqdILTBz4xPtR5ep2zKDYzVUavgW4T2lbGSCuDwbxig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=WIcp3bDU; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="WIcp3bDU"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-8016ab5f277so1053001a34.3
        for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 08:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141706; x=1789746506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tncm4oNxaDv4gSkEZuE7ucOJhSRMP5NYPbtJDKLEKTw=;
        b=WIcp3bDUasn1iDpTytkc4ucRDc9SbaDxqRCjOhk0RvA08pBC+WtpAbqqYC1531jwDv
         lbBQVEEs2KLcq6KEooJw8y9f8t7c41UaFcFQM2ypEp+RhlVdp8vUjDZeeOqJ8cU3DO6l
         i8IyoXTBzoFA7a0rWAcs20EC3AiIjKnHlNmMhyDqib2ne+D6J0t1FVObfuoytLUAbLXb
         r4qX4IlQmmwT1VXM9IKWvaQAA5NIMiXzuqL9J9m+eu8fHbuT5a4a7v1VQ7qmCFdCS2mf
         i+UlKZBhIvP4hy5Uo83NHFWVNWwlM+kvCTBjGHtuT/+N6mc/b1ZPHeAfjbFwAdpITgHp
         UiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141706; x=1789746506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tncm4oNxaDv4gSkEZuE7ucOJhSRMP5NYPbtJDKLEKTw=;
        b=cIAU6hpJF7zgmPytOgha8JIYqzfLEdLEUxXOOHn2/1GZhdSgNS6m/w9ilKqXHnTD4L
         j4KXIAP2dVRj87NVRxMJhFwNTGiIUGKCbSQHbT/z4c3UpB3EwxYUf47wPyIt/U4Lpc/h
         bdtnn3O86qd7fCrDp5t/TclADhoWwVmezLhk1fhjEznY0EcqtBgVgd0rAoIEkfG4n5Fs
         jeMbel4zi13urUrNrlinI+YoDsBTIKRxkweIoXYKnhbozSASmFcdyC2oa1hJ9Gx+DuR5
         uuH1NBUvoBnishxP/q2Ghoa+U63Zk7i0Iw2hmIop2euvTNUTv3DRevEG3O9OpPPJAkr8
         YRQQ==
X-Gm-Message-State: AFuF++lg5qzGzi9hdhXU63xp3vxtJljC2HeEeu8WDyVYhF9tnhJXoPUj
	Mc/ZE6CwE6ZgSF9PsRjnZay7p1v9tqCXQQABHwwpiPuY/9qC2AyIm2niUEh38XicJGKu9nX9me0
	Gpy5ZrUs=
X-Gm-Gg: AYBFou0tr8kV9thBXnMCshCNlbDab7EBnLbX6HxPGg5b/jSr2OaLb4T9mprIdk/twFl
	i8SXg9j5gnEsy5wC1hKZUTvTyImU/oTBnFDYWgCwVLnmhcHL8BqnaL6cWlAwuO5olEkZoB0/Epe
	KJk+yJ3CmeKbcmXJkDFZAuxItssv9s/Z6N07K+Z4VFW/K09YYRkZ+7XL2fqo0ESDGh6gYHau3ht
	PPZ40P4SbQcv4h/kdHNHjIo9luOv25mtGyKIs/ufi8YFL6mn1TOriEdVsNnmLUtaeSvJK1XnGgb
	St+3CHpeY/4/IhzQDBKCffRMMsiNfuTg2YCR4Sh3yj9xlUgH24eIpZS83iWbadZ91/2jW4LvNL5
	s/N3ll5U7lQAK5CJPYOdi0OEcTxFq74rFOj+Z7qGJsUJg4WM6W6ORqEnAlUN2lNMwouUVk6okbO
	Z+VNPC3Rdwg5SreGZJMy4P4sORSD+9xphS6CuuQhvNb0H2CghPdfX7fyqGKulkf7jF0H4V6YmWF
	iDmVyzZdGMkj6IL7LO3GQvUIBx6haiZSNlkvphV01o=
X-Received: by 2002:a05:6830:4492:b0:7fa:5c49:524d with SMTP id 46e09a7af769-803fda9dc6emr3843022a34.20.1789141706356;
        Fri, 11 Sep 2026 08:48:26 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f6d1ca4bsm2629478a34.23.2026.09.11.08.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:48:25 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: juanlu@fastmail.com,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 10/10] io_uring: wait for in-flight requests on ring release
Date: Fri, 11 Sep 2026 09:45:34 -0600
Message-ID: <20260911154811.646705-11-axboe@kernel.dk>
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

With cancelations now run at release time, what's left in-flight on
the ring afterwards is mostly I/O that has already been issued to a
device and just needs to finish. Until that happens, the files from
those requests pin the files they were using. Wait for those.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/io_uring.c | 74 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 73 insertions(+), 1 deletion(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 977c8c510b85..b52e0106fa27 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -2382,6 +2382,76 @@ static __cold void io_ring_ctx_cancel(struct io_ring_ctx *ctx)
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
@@ -2472,8 +2542,10 @@ static __cold void io_ring_ctx_wait_and_kill(struct io_ring_ctx *ctx)
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

