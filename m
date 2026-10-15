Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74264A2E1F
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092709; cv=none; b=EFV0yqe9HvcOJRWP9Jaf+3K+rd69r0fkfdT0WFUR9DmyYsqJyMKGlbt170k1FLMlPoSxKeCwMo8ND16AstjiHwwhZzGWlFTdlsd9ME6Tiy7OAgHew+NJ8/sc0BZ7eTD2Ur/6qHiW9b8b7RfTvMWp2hjWF2SWVvPfdoZ33k1C1CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092709; c=relaxed/simple;
	bh=BkxHHi+uYOvmeMoAsoak569DbKwyPDdSz3/JBWqnWn0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WPZjUX45Y4jgEHuVUevJC12rmYCCcFjDf7HPBQqT7LDqbWdrl4VPe06O4w3bWf4onFMOMbaSptfpB37bSz0Wm3inM1VYDQ5qJoV+sUyBdeZqMnShWMQD8zvXFCKLy4NPfM3+DKDNOu9BuuzJn3OBrrWcIOhAEA2lgn0mnSR1onY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=JmNuOB0z; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="JmNuOB0z"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93e6fb35f91so535498085a.2
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092707; x=1792697507; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0rTg4i5i4W3B7Gi8M95yBHplDLn3sfQ2/3IIh92SEMo=;
        b=JmNuOB0zoo2uNcfB+2nFWR2i6sW+gDxyPEOuewby0ZEZLIFfa5dEA+FRDVYxS8+j7k
         6ZkoFnirBuNJ0PUBWLA0In7h4KF32U8OY0mhC/iN3P66SkwcH6FC88YtOrSA84gR/IF0
         rOfvHrauDfMXUsfIfbSylv3ZGeGWGO36SlBMszUyRi3m1k0gD3S0xPw+kA1rK+G4nHc0
         TCg1ME63uUpu9rDg7VnDB5+DHWxVS4sVjniRaxRuhkb9tBm1fYccrx/zeuARTDEfYFW9
         /KeklcX4zx9L4aGI5dFdldFaVBPymfLYHGn3i2cOFy2MeB+JUSKWSIWEISVRqYFvBkBM
         XCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092707; x=1792697507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0rTg4i5i4W3B7Gi8M95yBHplDLn3sfQ2/3IIh92SEMo=;
        b=TEgj3V2RAvnsvUBTqtrHmanUGkHB5gMolfbzCkhyzPPGZUPGsCxaVk7WykXctpEvKB
         K+Djnfjo5u4eItL2Hqq8hZ9E+D03eNvbecXggaeIIdWdPuWKwLD5bSOL6CvZsT/mBQUH
         WY5niaEO9dNYzD0vRba74dcuUJD1bYzkISg96QkhPtvO1I2as6yGDy215x0kYNlyaELi
         nYHUOmkknTM/JiLcbssU6HOgVS1zUIMjU5Fe5xpolPNJL84uA8MsreWU1vJlpLSHG56p
         lSjkpN4lIVJW89G0gLvINklCnQJt/yFw7NydQtB4BbBWVCELVgJZMFkj6iSjRT5dGVYh
         PYiQ==
X-Gm-Message-State: AFq9FYL7PcA3Zp8+l8f+LQL6izKYaOt9FVAEZ1xCouc+kcVlcu8nv7jS
	SePtjwLaxDSus33W8abmpRiRgK2HbQeh9coPG3R0JOcXeThfAesNT3ijd0xP97m3Byk=
X-Gm-Gg: AYBFou3f8MWjPq+bzCedZ2HS9zIeAXZVo1kHE3DJbsd0EI8MBi9gO536624X400qWdl
	DYA9SUDj1Mm4mQsZHKaHmzJ2Oiuw9ynfBy5fQ2uhLrv6XVl9uiePQHCJz/b3rdu6NDVEbeKbhd7
	Q+dp2eY868pX1CYm1Cj/L3Sn/zUeG0s5nrw++BFfX1FaOS3GWP10vvEnSny/hrnRu3ABdkp6qVV
	w1QeAvRUQUF5HVdQo+8sBvfkKw9mpI+8WmPT80yQWCy6PUXmzwW4S3619Vm6Kv94+KRh4n0Qv02
	AtSPyLAxFHsfMFXrAB1yOCFHvuhj12hvv41vqwOCVGdPL596vWkmuvPJkybPZe88O3swF3ZiqPs
	OiXjRhe22Q+F3rJw+DcMu+CEroNG4UuSUL7218aXB0P09kNSdZUmclevCobVmimlooBTYvJZKJa
	OeYoVAZSzqs5XbGvVvA3EKcifakjy0oXtQXWoYoUk4/Jj0hv+l2Iq8iku/i5NhzuMOO3M82PgIk
	4UPGoypBEIf2WY=
X-Received: by 2002:a05:620a:2a10:b0:93e:c12c:9dc7 with SMTP id af79cd13be357-93ec12ca028mr3302029085a.71.1792092706653;
        Thu, 15 Oct 2026 12:31:46 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.249])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbae1e06sm3460076d6.27.2026.10.15.12.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:31:46 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:30:43 +0000
Subject: [PATCH 19/43] io_uring: wake ring pollers for local task_work
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-19-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092658; l=3866;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=BkxHHi+uYOvmeMoAsoak569DbKwyPDdSz3/JBWqnWn0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QK18UjAmoVijSHr9VBdOIh3QwdAMSQrkwyogMYzCa9HSXICvBHNlfsd+n3FJTjGlIB2Gs5Q+kXE
 A9rKHY9Hs/gA=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

With IORING_SETUP_DEFER_TASKRUN completions are queued as local work, and
only become CQEs when the submitter enters the kernel to wait for events.
For an application that finds out via poll() or epoll on the ring fd when
it is time to do that, io_uring_poll() reports EPOLLIN if local work is
pending.

That only helps if the work is there at the time of the call. When
DEFER_TASKRUN was added, io_req_local_work_add() did io_cqring_wake(),
which took care of tasks sleeping in poll() as well. Then polling got a
wait queue of its own, ->poll_wq, and the wake up in
io_req_local_work_add() was replaced by waking the submitter directly.
Since then ->poll_wq is only woken when CQEs are committed, which for
such a ring is done by the very task that is waiting to be told to:

  submitter                           completion
  poll(ring_fd)
    io_uring_poll()  // nothing yet
    schedule()
                                      io_req_local_work_add()
                                        // ->cq_wait_nr: nobody waits
  // sleeps on

Wake ->poll_wq when the first entry is put on the work list. Like for the
eventfd, that must not be done right away if the work is queued from a
wake up handler, as the chain of wake ups could get back to the wait
queue whose lock is held. Use an RCU callback in that case, with a
reference to the ring.

Fixes: 130bd686d9be ("io_uring: waitqueue-less cq waiting")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/io_uring_types.h |  3 +++
 io_uring/tw.c                  | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/include/linux/io_uring_types.h b/include/linux/io_uring_types.h
index 50970b382a9a..3e00012cbfd4 100644
--- a/include/linux/io_uring_types.h
+++ b/include/linux/io_uring_types.h
@@ -520,6 +520,9 @@ struct io_ring_ctx {
 	u32				iowq_limits[2];
 
 	struct callback_head		poll_wq_task_work;
+	/* deferred ->poll_wq wake up for local task_work */
+	struct rcu_head			poll_wq_rcu;
+	atomic_t			poll_wq_rcu_pending;
 	struct list_head		defer_list;
 	unsigned			nr_drained;
 
diff --git a/io_uring/tw.c b/io_uring/tw.c
index 98e3b1bc61b4..0b5066f97224 100644
--- a/io_uring/tw.c
+++ b/io_uring/tw.c
@@ -148,6 +148,37 @@ static void io_ctx_mark_taskrun(struct io_ring_ctx *ctx)
 	}
 }
 
+static void io_poll_wq_wake_rcu(struct rcu_head *rcu)
+{
+	struct io_ring_ctx *ctx = container_of(rcu, struct io_ring_ctx,
+					       poll_wq_rcu);
+
+	atomic_set(&ctx->poll_wq_rcu_pending, 0);
+	io_poll_wq_wake(ctx);
+	percpu_ref_put(&ctx->refs);
+}
+
+/*
+ * io_uring_poll() reports pending local work as EPOLLIN, as it takes a trip to
+ * the kernel to turn it into CQEs. Let those know who are asleep already.
+ */
+static void io_local_work_wake_poll(struct io_ring_ctx *ctx, unsigned int flags)
+{
+	if (!(flags & IOU_F_TWQ_IN_WAKE)) {
+		io_poll_wq_wake(ctx);
+		return;
+	}
+	/*
+	 * Called from a wake up handler with some wait queue lock held, this
+	 * one could lead back to it. Do it from a clean context.
+	 */
+	if (!wq_has_sleeper(&ctx->poll_wq) ||
+	    atomic_xchg(&ctx->poll_wq_rcu_pending, 1))
+		return;
+	percpu_ref_get(&ctx->refs);
+	call_rcu_hurry(&ctx->poll_wq_rcu, io_poll_wq_wake_rcu);
+}
+
 void io_req_local_work_add(struct io_kiocb *req, unsigned flags)
 {
 	struct io_ring_ctx *ctx = req->ctx;
@@ -174,6 +205,9 @@ void io_req_local_work_add(struct io_kiocb *req, unsigned flags)
 		io_ctx_mark_taskrun(ctx);
 		if (data_race(ctx->int_flags) & IO_RING_F_HAS_EVFD)
 			io_eventfd_signal(ctx, false, flags & IOU_F_TWQ_IN_WAKE);
+		/* whoever sets the flag wakes ->poll_wq afterwards */
+		if (data_race(ctx->int_flags) & IO_RING_F_POLL_ACTIVATED)
+			io_local_work_wake_poll(ctx, flags);
 	}
 
 	/*

-- 
2.55.0

