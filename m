Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08264A0127;
	Wed, 23 Sep 2026 16:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790180233; cv=none; b=ZtKQlBhX7UfB3wBxKFXafCIy6NXsO1Bt+7ej4RT8ReUYPw0KJaTZdNp8jOZCOq2koNCSo34RPtX9yEGww/P5XUVibS7schPuioIyCYbwq0iV1m06rG3uuKDP+BvtGtMURSqEaaHFBOh79ow5vHfOmyfVVews0Mek4R0HeGC6D6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790180233; c=relaxed/simple;
	bh=9SmC5aOY/hUxQeyrIYv0C3+Fy6l/Sz4tVVS+3QCwrmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i356meqFzWRDIwMoAJdunSwpPedJEhllpAOPFWva0f3Qhjd77caUg05Mr4uVcUl+9EukzXIHThWwsFeJetniRoHNdRxoMPalZTF+nekKS1VGmwNPE8hN1Xo4dJilX+2aMBaTWGdMAEURzdBbmVP1SEXQ8nepNTaUPsrlUVHEU6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=meMlvGJ+; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="meMlvGJ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Tx
	b5LXFQn7gIszUlW4nxlEDLbM5jUUd8LGBMMAfynXw=; b=meMlvGJ+RiH0b7BiRo
	597ga1+Gfjp7LIviYoZyG5su4vqAKoCioZ9hY77nyfFGf/HIzI1rC7xCya6y14IO
	u9gJ0CKokAVsik46Xg3zfmaH3/sneSyfhVeJuUyLgqDEg30mckcC8Q/TBThhEudB
	F4SPhxsk/6KJB73Mae5IoJjJg=
Received: from cason-VMware-Virtual-Platform.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDnFUVb+7Nqi3INBA--.3923S2;
	Thu, 24 Sep 2026 00:16:28 +0800 (CST)
From: Xiaochuan Li <chuanx2070@163.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Xiaochuan Li <chuanx2070@163.com>
Subject: [PATCH v2] io_uring/lock: Keep spinlock release before wake_up()
Date: Thu, 24 Sep 2026 00:16:22 +0800
Message-ID: <20260923161622.25737-1-chuanx2070@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260919123021.21318-1-chuanx2070@163.com>
References: <20260919123021.21318-1-chuanx2070@163.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgDnFUVb+7Nqi3INBA--.3923S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF18GFWDCFyUKryUZF45trb_yoWrJrW3pa
	y3K3s8tF4rXasF9w47AF4jvw1akw4qgw4xGrs5KryrArW5Xr9xtw4kKFWF9F15urZ2vrWa
	vF48t343Wa1UZa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UveHkUUUUU=
X-CM-SenderInfo: pfkxt0j0sqlii6rwjhhfrp/xtbC7h2dgGqz+11DCwAA3Z

When CONFIG_PREEMPT_RT enable, raw_spin_lock() will preempt_disable()
-> raw_spin_lock()
-> wake_up()
  ...
  -> spin_lock_irqsave()

which will trigger:
BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:46
in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 985654, name: iou-wrk-983605
preempt_count: 1, expected: 0
RCU nest depth: 0, expected: 0
CPU: 3 PID: 985654 Comm: iou-wrk-983605 Tainted: G        O  6.1.83-rt28-g19631eb82f21
stack:0        ppid:977479 flags:0x00000008
tgid:977553 prio:120 preempt:0x100000001 rcu_read_lock_nesting:0
used_cpu 3 wake_cpu 3 on_cpu 3 on_rq 1 migrate_dis 0
arrive:17423426040675 queued:0 prev_sum:33955300 sum_exec:33955300
Call trace:
 dump_backtrace.part.0+0xdc/0xec
 show_stack+0x1c/0x30
 dump_stack_lvl+0xac/0xc4
 dump_stack+0x14/0x30
 __might_resched+0x13c/0x170
 rt_spin_lock+0x34/0xc0
 __wake_up_common_lock+0x68/0xd0
 __wake_up+0x1c/0x24
 io_worker_handle_work+0x5b0/0x600
 io_wqe_worker+0xf4/0x310
 ret_from_fork+0x10/0x20

Signed-off-by: Xiaochuan Li <chuanx2070@163.com>
---
Changes in v2:
io_uring/io-wq: fix lockdep warning by deferring hash wake up outside acct->lock

The stall wake up path in io_get_next_work() holds acct->lock while
calling wake_up() on the hash wait queue, which creates lock ordering
acct->lock -> hash->wait.lock and triggers lockdep circular dependency
warning.

The previous approach of temporarily dropping and retaking acct->lock
is racy and juggles the lock unnecessarily. Instead, add a need_wake
output flag to io_get_next_work() and defer the wake_up() to the outer
worker loop, after acct->lock has been released.

This preserves the calling convention that io_get_next_work() returns
with acct->lock held, removes the lock inversion, and avoids any racy
sleeper checks outside of the lock. Drop the wq_has_sleeper check as
bare wake_up is safe and the optimization is not worth the complexity.

 io_uring/io-wq.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/io_uring/io-wq.c b/io_uring/io-wq.c
index 2ca223e47d41..7a167f409379 100644
--- a/io_uring/io-wq.c
+++ b/io_uring/io-wq.c
@@ -526,7 +526,8 @@ static bool io_wait_on_hash(struct io_wq *wq, unsigned int hash)
 }
 
 static struct io_wq_work *io_get_next_work(struct io_wq_acct *acct,
-					   struct io_wq *wq)
+					   struct io_wq *wq
+					   bool *need_wake)
 	__must_hold(acct->lock)
 {
 	struct io_wq_work_node *node, *prev;
@@ -574,9 +575,8 @@ static struct io_wq_work *io_get_next_work(struct io_wq_acct *acct,
 		unstalled = io_wait_on_hash(wq, stall_hash);
 		raw_spin_lock(&acct->lock);
 		if (unstalled) {
+			*need_wake = true;
 			clear_bit(IO_ACCT_STALLED_BIT, &acct->flags);
-			if (wq_has_sleeper(&wq->hash->wait))
-				wake_up(&wq->hash->wait);
 		}
 	}
 
@@ -607,6 +607,7 @@ static void io_worker_handle_work(struct io_wq_acct *acct,
 
 	do {
 		struct io_wq_work *work;
+		bool need_wake = false;
 
 		/*
 		 * If we got some work, mark us as busy. If we didn't, but
@@ -615,7 +616,7 @@ static void io_worker_handle_work(struct io_wq_acct *acct,
 		 * can't make progress, any work completion or insertion will
 		 * clear the stalled flag.
 		 */
-		work = io_get_next_work(acct, wq);
+		work = io_get_next_work(acct, wq, &need_wake);
 		if (work) {
 			/*
 			 * Make sure cancelation can find this, even before
@@ -631,6 +632,9 @@ static void io_worker_handle_work(struct io_wq_acct *acct,
 
 		raw_spin_unlock(&acct->lock);
 
+		if (need_wake)
+			wake_up(&wq->hash->wait);
+
 		if (!work)
 			break;
 

base-commit: a8c591ed6b672915e0be57843f943a2a723aff40
-- 
2.43.0

