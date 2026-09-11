Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330A049E5D1
	for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 15:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141707; cv=none; b=eXRbsWP+ml+7ZnYvIc+wYPWwSApEBPkDOBgBHw9HjkiUDS9YM7v7QX5cDS79Bscy8kxP+Xl9b8AgUQFCe2WvjYbolvaKLbzt5YCPA6vUThDui8Ner9Anl8lVI2LY33ZifmqhiyrGFBQj2Nhq1gqB8rhsq304OYk3swK2Q937tAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141707; c=relaxed/simple;
	bh=Ckg42SWOB6/XD17RW1EjpbhH6Jiznzzg/RIYCnnFIPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MqgturRk9rECAN+YzZYOTtSt/h21d+GUhMVx4+HxYtrmXhspO9JCvIcXrSnrM7Ztwv08vP+qY6BSkyb+HrAQ9f4gB+1zk5phRc3Nk5eusqhJc8tRQexEPBMzmbAPmKiTGFZAujUjE1G0NKhzDMRMGVNhoiVa8qQ9BFbZpPZINPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=St3YB7L2; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="St3YB7L2"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-7fc4034841cso924250a34.3
        for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 08:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141704; x=1789746504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nfRU5vg16PWPGyG5dC4QKlHDTj/tGPuk+InELXM26xs=;
        b=St3YB7L2S1E2XsAP+nu7z5ybCCbx+/qDGXsjU5xAIw1eX9/xGmgUMhh7yQC0Tll0oV
         noxywervmeHWr4KrsYbOXVoE2A14EpeJX8sv5s1miMdSbak/RJo9JpCP56NhnUFV9I/1
         dflFgdyvGkX8xwDwbBxKCIJQN3f485z8vGUtkGgqKIDMz++Pp/fXs7z9dkfN4rHtmUtr
         L0QCKQFJGwRQYPLdd0yZo3OSRELHKL3fVMTS+mA6iydHCtYzGU9L8Dcu+UbUy+rciU3l
         mAvKLN/vYJtz/AxOWw9DVtvsU7EugupsdyVmomN6HkCZ8/idXLodg7eq8aLXH8i0zdWn
         yNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141704; x=1789746504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nfRU5vg16PWPGyG5dC4QKlHDTj/tGPuk+InELXM26xs=;
        b=bPX2TJpnHuEcpRV/MmJyklmAmGJypbqa7WmXpJhn5zlIh/LOwPAWJV7uReiItf3dCl
         nOXwP191YXPCVIYcrcVmYzC3Mk+lC9YhDmu74wu5eURqVqR6Rj+HKgnYlik1IUTV2QL7
         iXiSf7fTXlzAg/xdCxMNQJnknKzSF2QAM1mva6GLi8TX+fNIawOOrbyi6USE/D3FbrEz
         DTvLL+EzhObdHzBe3e64Vasim7Nl8+XC8AqqpeOd793ij6wTL+2Y6yeZ5nEpVew6Xp5p
         4wFDdFUANE3OHtg8Gj5wDkZp+HdxhL9wed04XYIBn8wp6TqQjqx85J8eWcpQnwaZus/Z
         xR3A==
X-Gm-Message-State: AFuF++n6jB94zW6kD/28lzbdk3QpOO4FBwVCf+wztr+Uu/qR73jzebb1
	uSoZDYK9oPUaYQ44uwPr23MREaenkluJraHgpX/qHvzgMyIZpsb25+LvB/J+YAlbARfqSD71nlw
	dbNeKXTQ=
X-Gm-Gg: AYBFou3NP+KTOBbT03RN/6A1srsxcPhOfCaRZeMxNww+7AGUepSRRN/jDj+vdc/q1jD
	7M7aSHXJxy4LF/iF962yJQdGHuHHZe9UWHsmFDoph2jg5+T8YxIB6uMeNmXuKwqPCY5BD7my/63
	f5oFCrOJfWW99WVy9wRwta48Lo954s6oi5TjykM7Cdc6ATHwMUXdORoJbHVZNFFG2opo+gemN+L
	WgGs1JNujdwWr5+bav61ib8jn5WB+P7/Jt/Kgn4YrDJ4oqESDBOif9DuZ2ZDzwPC0y/L6B2EA1Z
	9hTP4XsS+ncN/38Qbq9qPjhE/ICp4svOJEQtLLLxYewx7Th2cwinZkzHuubvlTWJ24WF1j4KSVg
	UuU2H0ux09Q1Slquk4ruhr5tyaxhh4PtQl/3ZYYJJY1Jtp4W7pcLjjodhMRVhPQYJi7AWo6IkgL
	hZFyoZWe356naG3UagHcpzaBTszjb9hw92j8yD9ulupd4pxAmfRafQfvBbyFdOZpGeYC3TzZ35D
	FwK0uNEnxxr0VBfQSWmSnQ7KYt4/iRQWP9dDeETyb4=
X-Received: by 2002:a05:6830:1296:b0:804:7e4e:c496 with SMTP id 46e09a7af769-8047e4ecb71mr1817248a34.25.1789141704013;
        Fri, 11 Sep 2026 08:48:24 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f6d1ca4bsm2629478a34.23.2026.09.11.08.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:48:23 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: juanlu@fastmail.com,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 08/10] io_uring: run cancelations synchronously on ring release
Date: Fri, 11 Sep 2026 09:45:32 -0600
Message-ID: <20260911154811.646705-9-axboe@kernel.dk>
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

io_uring_release() just marks the ring as dying and punts everything
else to exit_work, including the cancelation of requests that are easily
cancelable right away Until that work has run, and the task_work it
generates has as well, those requests keep their files pinned. An
application that closes its ring and then expects the files it had been
using to be closed as well may be confused by this currently not being
the case.

Re-factor the cancelation pass out of io_ring_exit_work() and run it
directly from release, before punting the rest.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/io_uring.c | 82 ++++++++++++++++++++++++++-------------------
 1 file changed, 48 insertions(+), 34 deletions(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 150fe5286f1a..eb8a3626c684 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -2345,18 +2345,18 @@ static __cold void io_tctx_exit_cb(struct callback_head *cb)
 	complete(&work->completion);
 }
 
-static __cold void io_ring_exit_work(struct work_struct *work)
+/*
+ * Cancel what can be canceled on a dying ring and reap what has completed.
+ * Only waits on polled I/O, never anything else.
+ */
+static __cold void io_ring_ctx_cancel(struct io_ring_ctx *ctx)
 {
-	struct io_ring_ctx *ctx = container_of(work, struct io_ring_ctx, exit_work);
-	unsigned long timeout = jiffies + IO_URING_EXIT_WAIT_MAX;
-	unsigned long interval = HZ / 20;
-	struct io_tctx_exit exit;
-	struct io_tctx_node *node;
-	int ret;
+	struct io_sq_data *sqd = ctx->sq_data;
 
-	mutex_lock(&ctx->uring_lock);
-	io_terminate_zcrx(ctx);
-	mutex_unlock(&ctx->uring_lock);
+	if (test_bit(IO_CHECK_CQ_OVERFLOW_BIT, &ctx->check_cq)) {
+		scoped_guard(mutex, &ctx->uring_lock)
+			io_cqring_overflow_kill(ctx);
+	}
 
 	/*
 	 * If we're doing polled IO and end up having requests being
@@ -2365,32 +2365,36 @@ static __cold void io_ring_exit_work(struct work_struct *work)
 	 * as nobody else will be looking for them.
 	 */
 	do {
-		if (test_bit(IO_CHECK_CQ_OVERFLOW_BIT, &ctx->check_cq)) {
-			mutex_lock(&ctx->uring_lock);
-			io_cqring_overflow_kill(ctx);
-			mutex_unlock(&ctx->uring_lock);
-		}
+		if (ctx->flags & IORING_SETUP_DEFER_TASKRUN)
+			io_cancel_local_task_work(ctx);
+		cond_resched();
+	} while (io_uring_try_cancel_requests(ctx, NULL, IO_CANCEL_ALL));
 
-		/* The SQPOLL thread never reaches this path */
-		do {
-			if (ctx->flags & IORING_SETUP_DEFER_TASKRUN)
-				io_cancel_local_task_work(ctx);
-			cond_resched();
-		} while (io_uring_try_cancel_requests(ctx, NULL, IO_CANCEL_ALL));
-
-		if (ctx->sq_data) {
-			struct io_sq_data *sqd = ctx->sq_data;
-			struct task_struct *tsk;
-
-			io_sq_thread_park(sqd);
-			tsk = sqpoll_task_locked(sqd);
-			if (tsk && tsk->io_uring && tsk->io_uring->io_wq)
-				io_wq_cancel_cb(tsk->io_uring->io_wq,
-						io_cancel_ctx_cb, ctx, true);
-			io_sq_thread_unpark(sqd);
-		}
+	if (sqd) {
+		struct task_struct *tsk;
+
+		io_sq_thread_park(sqd);
+		tsk = sqpoll_task_locked(sqd);
+		if (tsk && tsk->io_uring && tsk->io_uring->io_wq)
+			io_wq_cancel_cb(tsk->io_uring->io_wq,
+					io_cancel_ctx_cb, ctx, true);
+		io_sq_thread_unpark(sqd);
+	}
+
+	io_req_caches_free(ctx);
+}
+
+static __cold void io_ring_exit_work(struct work_struct *work)
+{
+	struct io_ring_ctx *ctx = container_of(work, struct io_ring_ctx, exit_work);
+	unsigned long timeout = jiffies + IO_URING_EXIT_WAIT_MAX;
+	unsigned long interval = HZ / 20;
+	struct io_tctx_exit exit;
+	struct io_tctx_node *node;
+	int ret;
 
-		io_req_caches_free(ctx);
+	do {
+		io_ring_ctx_cancel(ctx);
 
 		if (WARN_ON_ONCE(time_after(jiffies, timeout))) {
 			/* there is little hope left, don't run it too often */
@@ -2458,8 +2462,18 @@ static __cold void io_ring_ctx_wait_and_kill(struct io_ring_ctx *ctx)
 	percpu_ref_kill(&ctx->refs);
 	xa_for_each(&ctx->personalities, index, creds)
 		io_unregister_personality(ctx, index);
+	io_terminate_zcrx(ctx);
 	mutex_unlock(&ctx->uring_lock);
 
+	/*
+	 * Do the first round of cancelations upfront rather than leaving it
+	 * to to exit_work. Anything cancelable is then already on its way
+	 * out, and for requests owned by the task closing the ring, this
+	 * ensures any held files are put before close(2) returns.
+	 */
+	if (!(current->flags & PF_IO_WORKER))
+		io_ring_ctx_cancel(ctx);
+
 	INIT_WORK(&ctx->exit_work, io_ring_exit_work);
 	/*
 	 * Use system_dfl_wq to avoid spawning tons of event kworkers
-- 
2.55.0

