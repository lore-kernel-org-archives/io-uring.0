Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.213
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793499719;
	b=pDqQX01p5LGhg47UmXiDGaaFcEA4cAAwAqdNGfd6FRTmVThl0Dh3iIMEexnoDfE8Zsmu
	 cqQjFZ6+tqVm8/WUaFnTCR5JpzD151cYGG8ZIaqhIzopesjaITUMsUz6KjnFESd/zBzgf
	 TCOWxd21Sf90Z2X4qnNiYyw0LSjggeiHlqFqMwR8260sT0i3cpPNOdEKU5obKcNwDCw/I
	 duWTFr4icCL6QpIyIskmuTGmtPoUgWCvHlMLj0kB5S1+wC3rSCAfbNlWlG1XmNZo46dFN
	 1AO7OJCe5uRT7DQ6wfN1bxyh6ucYj9kYNkYJ2lvkg4zMxrobH3JGhgBhxv+5sess87w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793499719;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Pg87gFc6D5vPj6Z68gMhcX5RARC2NQRQPzk8oYKjjSc=;
	b=Z9TLlK9tzR/7aoI4irD/kcarp1dCb2C7PyL8r0KX+6ah8Afv+DL8MAdTv1N630VDGWai
	 rVj3vu5IsXSgeuhokBf9gnjDixdhF1bxpheLcoIMUVFAR7R2dfZByUQjTBQYBWurA4bOE
	 lipoNPBr3uw31cTLOTxIpU/hI6o7RHScx3+ORRiubfsAlcFkCr7UDIweCR9axz99Qp4bZ
	 RqIJpIReWI/OnBS219uQ2YMFgcfkI3GNW4qPrhlyaO97bmNI0JzgvXQ1XY5+o2T6dGDA8
	 Jbcb9NP7ZqBT0FFJ4L26Cbh4qJUMdZEsgLbvY6QXPAAlS45iTaZ2AtHrbNmlCURwbaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MtU+qDmv;
	arc=none smtp.remote-ip=95.215.58.213
Received: from mta1.migadu.com (out-213.mta1.migadu.com [95.215.58.213])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79B7606A327
	for <io-uring@vger.kernel.org>; Sun,  1 Nov 2026 02:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A79B7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MtU+qDmv
X-Envelope-To: io-uring@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lPd+L3Fi5L/JRb8mgYsEPFBFLc/EK/FoHzehgXk/yCE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793499715; v=1; x=1794104515;
 b=MtU+qDmvGwEezhnxq1/Osl48o/WbBTXtEJ5vMyCs3UC9AGmqBI5U9kFR7Ok9AKWWhECQT9eR
 aLJ5mZa4ceeTS24uf18t6Zdu0iGEGF0Xx4BuF5qki7jqwdEyQGpoFHMghUzN7XY/R1XEmRZB0LF
 piFLg/6zeHN1+TFnWNQbBDew=
X-Envelope-To: io-uring@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7c5fdc765f8b831e;
	Sun, 01 Nov 2026 02:21:55 +0000
X-Mizu-Trace-ID: 7c5fdc765f8b831e
X-Migadu-Flow: FLOW_OUT
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Jens Axboe <axboe@kernel.dk>
Cc: Meta kernel team <kernel-team@meta.com>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] io_uring/sqpoll: do the return-to-userspace work in the SQPOLL thread
Date: Sat, 31 Oct 2026 19:21:46 -0700
Message-ID: <20261101022146.309201-1-shakeel.butt@linux.dev>
X-Mailer: git-send-email 2.53.0
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

The SQPOLL thread never returns to userspace. io_sq_tw() runs its
task_work, but the rest of resume_user_mode_work(), like memory.high
reclaim and block cgroup throttling, only runs when the thread exits.
So memory.high reclaim only happens inside a charge, with sqd->lock and
ctx->uring_lock held, and not at all if the charges can't block.

This used to work. The loop called io_run_task_work(), which does this
work since commit b5d3ae202fbf ("io_uring: handle TIF_NOTIFY_RESUME
when checking for task_work"). Commit af5d68f8892f ("io_uring/sqpoll:
manage task_work privately") replaced that call with io_sq_tw().

Call resume_user_mode_work() at the top of the loop when
TIF_NOTIFY_RESUME is set, with sqd->lock dropped. It runs once per pass,
so a pass that charges two or more batches still reclaims inside the
charge, as before.

Tested in a VM with memory.high=64M and swap on zram. An SQPOLL ring
reads 256M from /dev/zero into untouched memory, 64K at a time. Before,
the thread made 337 calls to __mem_cgroup_handle_over_high(), all from
inside the charge. After, it makes 704, all from the top of the loop.
memory.peak stays at 64M. With 1M reads, 296 of its 385 calls still come
from inside the charge. Both runs take about 50% longer, and the extra
time is in the handler, which now runs more often. Without memory.high
pressure, the test never calls resume_user_mode_work() and the times
do not change. Lockdep showed no warnings, also with io_uring_register()
racing for sqd->lock.

Fixes: af5d68f8892f ("io_uring/sqpoll: manage task_work privately")
Cc: stable@vger.kernel.org
Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
---

There was similar code pattern in the same function i.e.
unlock/cond-resched/lock. I kept this separate for easy backport.

 io_uring/sqpoll.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/io_uring/sqpoll.c b/io_uring/sqpoll.c
index 49c52284ecdd..0fef4d3f4472 100644
--- a/io_uring/sqpoll.c
+++ b/io_uring/sqpoll.c
@@ -348,6 +348,18 @@ static int io_sq_thread(void *data)
 			timeout = jiffies + sqd->sq_thread_idle;
 		}
 
+		/*
+		 * The SQPOLL thread never returns to userspace, so do the
+		 * return-to-userspace work, like memory.high reclaim, here.
+		 * It can sleep for a long time, so drop sqd->lock.
+		 */
+		if (test_thread_flag(TIF_NOTIFY_RESUME)) {
+			mutex_unlock(&sqd->lock);
+			resume_user_mode_work(NULL);
+			mutex_lock(&sqd->lock);
+			sqd->sq_cpu = raw_smp_processor_id();
+		}
+
 		cap_entries = !list_is_singular(&sqd->ctx_list);
 		list_for_each_entry(ctx, &sqd->ctx_list, sqd_list) {
 			int ret;
-- 
2.53.0-Meta

