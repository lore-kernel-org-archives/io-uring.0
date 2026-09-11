Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEB1455624
	for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 15:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141322; cv=none; b=l9Ok3Q+Yc1ObNQucyx4gPSLNzbqlMCW/PAwybbW8onhxjSE2Mp8yVI3TvDHFuTo1tugmJLujr2muVDHVA7FuZ7pg9BGW9cs9eCPEhfpBPsXEyY6qiYcIO9XkkrzdlEWcNyAk47GGRi0bfukpfR18ffIm4u0+rI+CuMqPFb72nnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141322; c=relaxed/simple;
	bh=pHbCp/BMag/nnpNzMxAMuj5uUap5oH5CLoIai3Pt0L8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GiBPULGW6cqK2FVwLcPgaZ1KdyX1i5EvL2j9vPAxULqbGBeT76r2cMNuzOrnVcBx2Jl9jYzjS/ag8x+NhRQ9Jj2GeygS0o/W64v40m0cu6gNxTsLK2K+pONTM4SGAqVMBVx1GVHmeLur/KBgsqLngSY0Ug33hSsNJ5QrSJiAUIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=uG44yyeS; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="uG44yyeS"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4c14d66d922so549427b6e.0
        for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 08:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141318; x=1789746118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/RcGks6YdaJ2UkXyVy3FKEoUGQQvU1qrezFrY/Mkmuw=;
        b=uG44yyeS2p/eswpm9iO/SEecQ25QuCzgS3aUtbAGyWkopEBCZjHUWByJwLnUJV3agY
         70iXi8ihypvBrjWzdi4OwlyGl0k5pTDcC6c1Qwo+dh3/up9TfE/W4hQS6RoW8yItkLUw
         11UpwLSVx+iQqOT/wUCPy/BjnFKAtaYlujGfHOzxPHq1MenRifRGL45J5oFz7m5FDILM
         NI7gGt2oNoj2d0sfjbaLfKmI9SDumoScj6L6mxGSnx0SfaV2jxz4vo/DFnB9Dtane6BL
         rgpezV4fhaVCRM/R6/bCLyKyP3zoB+vPF6J0QaTfPdO6IMBtUBbwdeVGyAaxk2PSjRlJ
         FnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141318; x=1789746118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/RcGks6YdaJ2UkXyVy3FKEoUGQQvU1qrezFrY/Mkmuw=;
        b=fQB+TTjDTofldCFr5Ko/pMb83CuAspg4EK0SIse1CJcfl4S3Y2rWi9JC7v/xpB1dMk
         03+fmKJKQRYf6fOe/VDY91KO56dPtSmrbPMjtykCZ4cVSYskw86WxgzqVHqodoYExIAN
         asQQawsfXcHg1fxTskLUaWxbxWvm+oKQ0OypuD8N+O7MZF8WMxfj3n0j/dxwyYc7sIgS
         YnsWIdR7zFaTuV1YEuZNkXJzD7XrZh+ZIm0aYQhIne9bQjZbzv8HtP64AdgTpYZvbqo/
         P2T6M4VvGSe4vcIhPwsR+FmQ9+igp2ULcH3vvPKtsmHFoy3r4k/0zP1E8IlaHvPM6JaT
         CBPA==
X-Gm-Message-State: AFuF++nS3tAszM7g2Dtw4jIiJPrS5CXt7sgpGyJv7L/MNSE/dBScQ/jw
	2iQg0FpLDqO+dpo71zkHJtD8+ta1RAh2R4oCTFCsVitamJ8lxfk4ej417yQEY+bECmz3HJqp3OV
	DDpoe8kg=
X-Gm-Gg: AYBFou1raCbpWgrmHCoQ3e60/VwZv/eN3JbmVBk9OI6Bv7ICvv5BS0yKAHlibZcQxeF
	3hq5w/ip+EmyJp81WjVIyjyrLPJRdutIqST/PTqMsr4/zPYRwtU7XsVOuOWmAIBuc6j9ji9QvQo
	EuCWN0JHmv2pngSQVIBkpjJKGaNlqA+dZfu6OeitfTCj+Nb/kC6u1br8Mi+L+j7nnmXtOcPLklF
	fU+WATSILHrJLy8Z/BgIIDUgYM5M2n4axjUftfw2o9uMeQPopzUHFt23qzth244i1o3y2XffMmP
	ChgMHFHfdKZL8239AmYk4CeKKlmABPET6Hl6ktvXKJT1hrY7ImKOkP/nm3Z3F6XOZnAWJCZ0Wns
	1cyDpOHSI+LtAbM6LOhp0dpikVP6v6C3OQYOihGAC2ewYWm3Dw1Hz/OJ9kc1oMp33LGajeGu31J
	Ld+vUqNzLfTvceDF8G94/jlHFHe+/lqKR6Euvcqdilb6K97gjlkDNhmfLpgScoi8pUGddEUZiEo
	GI0S2Rva81a+gbNAQwRRQNg6vldYQdsFZ1QZTUuwFc=
X-Received: by 2002:a05:6820:c446:20b0:69d:a4f0:4191 with SMTP id 006d021491bc7-6c0b9a57494mr2410199eaf.12.1789141317982;
        Fri, 11 Sep 2026 08:41:57 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c09690af1dsm2802199eaf.1.2026.09.11.08.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:41:57 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 02/15] sched: call into io_uring when a PF_IO_HANDOFF task blocks
Date: Fri, 11 Sep 2026 09:40:52 -0600
Message-ID: <20260911154148.644489-3-axboe@kernel.dk>
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

Add PF_IO_HANDOFF, set by io_uring on a task for the duration of an
inline request issue that may block, and have sched_submit_work() call
io_uring_task_sleeping() when such a task blocks. Placeholder for now.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 include/linux/io_uring.h | 5 +++++
 include/linux/sched.h    | 2 +-
 kernel/fork.c            | 3 ++-
 kernel/sched/core.c      | 3 +++
 4 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/include/linux/io_uring.h b/include/linux/io_uring.h
index d1aa4edfc2a5..969de22c3d0f 100644
--- a/include/linux/io_uring.h
+++ b/include/linux/io_uring.h
@@ -60,4 +60,9 @@ static inline int io_uring_fork(struct task_struct *tsk)
 }
 #endif
 
+/* called from sched_submit_work() when a PF_IO_HANDOFF task blocks */
+static inline void io_uring_task_sleeping(struct task_struct *tsk)
+{
+}
+
 #endif
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 8b3d47a325cc..310310865029 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1816,7 +1816,7 @@ extern struct pid *cad_pid;
 						 * I am cleaning dirty pages from some other bdi. */
 #define PF_KTHREAD		0x00200000	/* I am a kernel thread */
 #define PF_RANDOMIZE		0x00400000	/* Randomize virtual address space */
-#define PF__HOLE__00800000	0x00800000
+#define PF_IO_HANDOFF		0x00800000	/* io_uring: hand identity off if the task blocks */
 #define PF__HOLE__01000000	0x01000000
 #define PF__HOLE__02000000	0x02000000
 #define PF_NO_SETAFFINITY	0x04000000	/* Userland is not allowed to meddle with cpus_mask */
diff --git a/kernel/fork.c b/kernel/fork.c
index 416758c8a3d4..510c8a9aa870 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2190,7 +2190,8 @@ __latent_entropy struct task_struct *copy_process(
 		goto bad_fork_cleanup_count;
 
 	delayacct_tsk_init(p);	/* Must remain after dup_task_struct() */
-	p->flags &= ~(PF_SUPERPRIV | PF_WQ_WORKER | PF_IDLE | PF_NO_SETAFFINITY);
+	p->flags &= ~(PF_SUPERPRIV | PF_WQ_WORKER | PF_IDLE |
+		      PF_NO_SETAFFINITY | PF_IO_HANDOFF);
 	p->flags |= PF_FORKNOEXEC;
 	INIT_LIST_HEAD(&p->children);
 	INIT_LIST_HEAD(&p->sibling);
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index eeb55367c0c6..bba1c3b26b7e 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -96,6 +96,7 @@
 
 #include "../workqueue_internal.h"
 #include "../../io_uring/io-wq.h"
+#include <linux/io_uring.h>
 #include <linux/thread_handoff.h>
 #include "../smpboot.h"
 #include "../locking/mutex.h"
@@ -7352,6 +7353,8 @@ static inline void sched_submit_work(struct task_struct *tsk)
 		wq_worker_sleeping(tsk);
 	else if (task_flags & PF_IO_WORKER)
 		io_wq_worker_sleeping(tsk);
+	else if (task_flags & PF_IO_HANDOFF)
+		io_uring_task_sleeping(tsk);
 
 	/*
 	 * spinlock and rwlock must not flush block requests.  This will
-- 
2.55.0

