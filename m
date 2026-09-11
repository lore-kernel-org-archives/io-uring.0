Received: from mail-oo2-f17.google.com (mail-oo2-f17.google.com [74.125.231.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9701948EC76
	for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 15:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141331; cv=none; b=O8fOo6yxTrverlyWNk4P4ZJ4yu2j7yg9G4Vekb5C0MBVBCgqPuiWVPKBj5+lnOqi4eP4potUQLV7VJuG2id0423OuE6co7faG/OYwDqylgUPjSwg6QTW6y1cqQsM+s0d02clvhmDEHge57a+rA6OR64QTvMRzt2LgAOsmjXkIgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141331; c=relaxed/simple;
	bh=yVh0rVZ6GS3pgp+sdjQXZ5uUZjKAgLGO2BaRo77OYf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H8/lHF/vE8cm2TpJjuGDGXtqgJjdQvqTfgc6GKvuXM9hGPP1Oi9y5ZsQgIDvO2Oy9dbUJfdKDEzdI4NED/Bj0jh+5oxISB47eWGeSnNSivvQb7NlfzRzlNeoc2Pm3d0SCu2V9EnVYx23T3kVR/x9mGIbQmxGTYxrQd/Xvhf03+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=etXEfYo4; arc=none smtp.client-ip=74.125.231.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="etXEfYo4"
Received: by mail-oo2-f17.google.com with SMTP id 006d021491bc7-6b1ae739df3so278583eaf.0
        for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 08:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141326; x=1789746126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1mwNlgJ0Ok5ZgfwwPHL43bLSQUr6PFWje+Owka8lGt4=;
        b=etXEfYo43ilZ0Limel5MTE5uqsKiY6bHcXxumueRC/YW9U9CxektBF0U17It0a09JP
         PAPM7sWXepSlegDfCq+i97pcOwiLqhZyR6DkOcQjOOZi+XKj0owWjAdTImbARkugJ5ZK
         R5hyQwOeql6VaThMSBTBV2c7/AktgWy9nx5oeurr0FezoWPiLP936OYM/pNLf9JQGrtX
         w+bpQuDK2HR/dlQxUH11zuT4N2XxpwMi+wduJ/bEgYbYEoM76EaGIB8yz4j265YeoGTr
         haPAmJo79uzkeQjCB8IzeZgjA2hu8EY8kP46igWqTBJgpM0jWd9522Bbbub7/5b73qPq
         gIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141326; x=1789746126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1mwNlgJ0Ok5ZgfwwPHL43bLSQUr6PFWje+Owka8lGt4=;
        b=EbsbGJwShCKlRRY/PdS82cZT5Rt0XLBA8IXBTUUoS9ZGSAehmyQ8WUOarZ38bU8NrS
         fza8RY3OXciiZY0sbca6yTPa0fpGSSPsiDaE/tr3R+eKm//TN31KbCMYpReU625Os5+b
         MgFEMpNsYANvLmvrxUhw7RJYnGTDWalTtz84Wbf7yAFKgXFlPoTzbRF2I5rcmLMX5D+d
         mWAF4J9vHtYJTt5eV9MRJHBrMRcKfpPm0eelPkBZH3At5sUTe18ZjHRSzlMqZFIAn0oK
         mcMb88Je96Q7UO0+lQIf6Y+Z2lHyIrBrsSm0Lfkecr3eId7046zC3IkWF/2uRXqKVmxi
         f8fQ==
X-Gm-Message-State: AFuF++ku5yLxzc58ZyqJBFp014hUHNc+dr0zR1BqRCJNHcTjzR/Rgj3k
	HGSXNIKh5Bx1bMwYY6BBretYs4j4AOlJJXTz40eBjrq9JbQMSQU9f8wC9eRVZ/5l4a9cTVufqTx
	ByOIlo7g=
X-Gm-Gg: AYBFou24cnXzCJuzot+f5FNoN26rlEA7AMFSxHf9sc2QFwnE86koSogjk/qScHtqCko
	4GZYT8ruEN+pA5tWIXa3R2rifqTBg+GmE/t8zSxt/sde3qb0xWVobrQGttCA/KcI2Yxkh0kUOZT
	AXb4+i7lip/GVv+Koagm0U1p2WRAG02nEtPjFWCvj97D6UYRbF7IDIfBMEwtC0A3et4JHa5Y/rC
	MlSUDWJJlNEjjpPMSF7kp/dem8xYfUFKiE1IzYxCe2bttUwG+vw8htIO8vYTJqf3Nczt7rLK65R
	b17KBeHiitv2x08uKUewHS6ytZU0csbTQ0KVn08KSRP1t/egxr2L70W+atrot0dQNrIrqvo3QQS
	RwFR/Mc5KGmk0DuZpLDyx2hdxyYQJ3rRW7FUt9DE1uZo8lyXMSyUwX1RVfhuYqBpFvlNXfOyHtk
	XIdU5jIrWZ/cKN/PsDbCKZfDToujkjeDvYizY+gk030t2n/MyF4q9DKgBJmeHmGVdb2w0kQ5j3i
	krCmOgybpxdI7EEEibyhgOy3kX0tqKlQhRxAe+0A7M=
X-Received: by 2002:a05:6820:c0d9:20b0:6b5:ec3f:497d with SMTP id 006d021491bc7-6c0a8a27f9dmr1999129eaf.24.1789141326313;
        Fri, 11 Sep 2026 08:42:06 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c09690af1dsm2802199eaf.1.2026.09.11.08.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:42:05 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 08/15] io_uring: split io_uring_enter() and io_submit_sqes() into helpers
Date: Fri, 11 Sep 2026 09:40:58 -0600
Message-ID: <20260911154148.644489-9-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911154148.644489-1-axboe@kernel.dk>
References: <20260911154148.644489-1-axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the tail of io_submit_sqes() into io_submit_sqes_end(), and split
the IORING_ENTER_GETEVENTS handling out of io_uring_enter() into
io_uring_enter_finish() and io_uring_getevents(). A later patch needs
to resume io_uring_enter() from a different task than the one that
started the syscall.

No functional changes in this patch.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/io_uring.c | 179 ++++++++++++++++++++++++++++----------------
 1 file changed, 116 insertions(+), 63 deletions(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 61053421d809..b09221e239c0 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -2010,12 +2010,31 @@ static bool io_get_sqe(struct io_ring_ctx *ctx, const struct io_uring_sqe **sqe)
 	return true;
 }
 
+static int io_submit_sqes_end(struct io_ring_ctx *ctx, unsigned int entries,
+			      unsigned int left)
+	__must_hold(&ctx->uring_lock)
+{
+	int ret = entries;
+
+	if (unlikely(left)) {
+		ret -= left;
+		/* try again if it submitted nothing and can't allocate a req */
+		if (!ret && io_req_cache_empty(ctx))
+			ret = -EAGAIN;
+		current->io_uring->cached_refs += left;
+	}
+
+	io_submit_state_end(ctx);
+	 /* Commit SQ ring head once we've consumed and submitted all SQEs */
+	io_commit_sqring(ctx);
+	return ret;
+}
+
 int io_submit_sqes(struct io_ring_ctx *ctx, unsigned int nr)
 	__must_hold(&ctx->uring_lock)
 {
 	unsigned int entries;
 	unsigned int left;
-	int ret;
 
 	if (ctx->flags & IORING_SETUP_SQ_REWIND)
 		entries = ctx->sq_entries;
@@ -2026,7 +2045,7 @@ int io_submit_sqes(struct io_ring_ctx *ctx, unsigned int nr)
 	if (unlikely(!entries))
 		return 0;
 
-	ret = left = entries;
+	left = entries;
 	io_get_task_refs(left);
 	io_submit_state_start(&ctx->submit_state, left);
 
@@ -2052,18 +2071,7 @@ int io_submit_sqes(struct io_ring_ctx *ctx, unsigned int nr)
 		}
 	} while (--left);
 
-	if (unlikely(left)) {
-		ret -= left;
-		/* try again if it submitted nothing and can't allocate a req */
-		if (!ret && io_req_cache_empty(ctx))
-			ret = -EAGAIN;
-		current->io_uring->cached_refs += left;
-	}
-
-	io_submit_state_end(ctx);
-	 /* Commit SQ ring head once we've consumed and submitted all SQEs */
-	io_commit_sqring(ctx);
-	return ret;
+	return io_submit_sqes_end(ctx, entries, left);
 }
 
 static void io_rings_free(struct io_ring_ctx *ctx)
@@ -2583,6 +2591,94 @@ struct file *io_uring_ctx_get_file(unsigned int fd, bool registered)
 }
 
 
+static int io_iopoll_getevents(struct io_ring_ctx *ctx, u32 min_complete,
+			       u32 flags, const void __user *argp, size_t argsz)
+	__must_hold(&ctx->uring_lock)
+{
+	int ret;
+
+	ret = io_validate_ext_arg(ctx, flags, argp, argsz);
+	if (likely(!ret))
+		return io_iopoll_check(ctx, min_complete);
+	return ret;
+}
+
+static int io_wait_getevents(struct io_ring_ctx *ctx, u32 min_complete,
+			     u32 flags, const void __user *argp, size_t argsz)
+{
+	struct ext_arg ext_arg = { .argsz = argsz };
+	int ret;
+
+	ret = io_get_ext_arg(ctx, flags, argp, &ext_arg);
+	if (likely(!ret))
+		return io_cqring_wait(ctx, min_complete, flags, &ext_arg);
+	return ret;
+}
+
+static int io_getevents_ret(struct io_ring_ctx *ctx, int ret, int ret2)
+{
+	if (ret)
+		return ret;
+	/*
+	 * EBADR indicates that one or more CQE were dropped. Once the user has
+	 * been informed we can clear the bit as they are obviously ok with
+	 * those drops.
+	 */
+	if (unlikely(ret2 == -EBADR))
+		clear_bit(IO_CHECK_CQ_DROPPED_BIT, &ctx->check_cq);
+	return ret2;
+}
+
+static int io_uring_getevents(struct io_ring_ctx *ctx, int ret,
+			      u32 min_complete, u32 flags,
+			      const void __user *argp, size_t argsz)
+{
+	int ret2;
+
+	if (ctx->int_flags & IO_RING_F_SYSCALL_IOPOLL) {
+		/*
+		 * We disallow the app entering submit/complete with polling,
+		 * but we still need to lock the ring to prevent racing with
+		 * polled issue that got punted to a workqueue.
+		 */
+		mutex_lock(&ctx->uring_lock);
+		ret2 = io_iopoll_getevents(ctx, min_complete, flags, argp,
+					   argsz);
+		mutex_unlock(&ctx->uring_lock);
+	} else {
+		ret2 = io_wait_getevents(ctx, min_complete, flags, argp, argsz);
+	}
+	return io_getevents_ret(ctx, ret, ret2);
+}
+
+/* Finish an io_uring_enter() call that submitted and holds the uring_lock */
+static int io_uring_enter_finish(struct io_ring_ctx *ctx, int ret, u32 min_complete,
+			  u32 flags, const void __user *argp, size_t argsz)
+{
+	int ret2;
+
+	if (!(flags & IORING_ENTER_GETEVENTS)) {
+		mutex_unlock(&ctx->uring_lock);
+		return ret;
+	}
+
+	if (ctx->int_flags & IO_RING_F_SYSCALL_IOPOLL) {
+		ret2 = io_iopoll_getevents(ctx, min_complete, flags, argp,
+					   argsz);
+		mutex_unlock(&ctx->uring_lock);
+	} else {
+		/*
+		 * Ignore errors, we'll soon call io_cqring_wait() and it
+		 * should handle ownership problems if any.
+		 */
+		if (ctx->flags & IORING_SETUP_DEFER_TASKRUN)
+			(void)io_run_local_work_locked(ctx, min_complete);
+		mutex_unlock(&ctx->uring_lock);
+		ret2 = io_wait_getevents(ctx, min_complete, flags, argp, argsz);
+	}
+	return io_getevents_ret(ctx, ret, ret2);
+}
+
 SYSCALL_DEFINE6(io_uring_enter, unsigned int, fd, u32, to_submit,
 		u32, min_complete, u32, flags, const void __user *, argp,
 		size_t, argsz)
@@ -2639,57 +2735,14 @@ SYSCALL_DEFINE6(io_uring_enter, unsigned int, fd, u32, to_submit,
 			mutex_unlock(&ctx->uring_lock);
 			goto out;
 		}
-		if (flags & IORING_ENTER_GETEVENTS) {
-			if (ctx->int_flags & IO_RING_F_SYSCALL_IOPOLL)
-				goto iopoll_locked;
-			/*
-			 * Ignore errors, we'll soon call io_cqring_wait() and
-			 * it should handle ownership problems if any.
-			 */
-			if (ctx->flags & IORING_SETUP_DEFER_TASKRUN)
-				(void)io_run_local_work_locked(ctx, min_complete);
-		}
-		mutex_unlock(&ctx->uring_lock);
+		ret = io_uring_enter_finish(ctx, ret, min_complete, flags,
+					    argp, argsz);
+		goto out;
 	}
 
-	if (flags & IORING_ENTER_GETEVENTS) {
-		int ret2;
-
-		if (ctx->int_flags & IO_RING_F_SYSCALL_IOPOLL) {
-			/*
-			 * We disallow the app entering submit/complete with
-			 * polling, but we still need to lock the ring to
-			 * prevent racing with polled issue that got punted to
-			 * a workqueue.
-			 */
-			mutex_lock(&ctx->uring_lock);
-iopoll_locked:
-			ret2 = io_validate_ext_arg(ctx, flags, argp, argsz);
-			if (likely(!ret2))
-				ret2 = io_iopoll_check(ctx, min_complete);
-			mutex_unlock(&ctx->uring_lock);
-		} else {
-			struct ext_arg ext_arg = { .argsz = argsz };
-
-			ret2 = io_get_ext_arg(ctx, flags, argp, &ext_arg);
-			if (likely(!ret2))
-				ret2 = io_cqring_wait(ctx, min_complete, flags,
-						      &ext_arg);
-		}
-
-		if (!ret) {
-			ret = ret2;
-
-			/*
-			 * EBADR indicates that one or more CQE were dropped.
-			 * Once the user has been informed we can clear the bit
-			 * as they are obviously ok with those drops.
-			 */
-			if (unlikely(ret2 == -EBADR))
-				clear_bit(IO_CHECK_CQ_DROPPED_BIT,
-					  &ctx->check_cq);
-		}
-	}
+	if (flags & IORING_ENTER_GETEVENTS)
+		ret = io_uring_getevents(ctx, ret, min_complete, flags, argp,
+					 argsz);
 out:
 	if (!(flags & IORING_ENTER_REGISTERED_RING))
 		fput(file);
-- 
2.55.0

