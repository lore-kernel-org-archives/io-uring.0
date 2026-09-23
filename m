Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9155A3E3141;
	Wed, 23 Sep 2026 17:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790184190; cv=none; b=GS/SMNXNhQ59JyFQ8qKy4OqSxuRdl8j2GxNNlEIa+1pi3/fNjawz0+oZhXlF+ULqI6KvWBKSNweAzptjN6FqeqAiOFysSNoesKzOSJvDsAKCXsW3aDzvggY42cpDg4vxv3ichb+JKwUsZolmieNZuyPA/r8bDAm06lWPrd5g250=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790184190; c=relaxed/simple;
	bh=zVqDY3QHhz61/o9oOsjPRhH1RXoSoxjW5AYr4k5N2a0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qfrj/Bk9OjUhoHKQPtF0fr++x5kQTzm164t1ttnXm4eeZ23+8gXFH7gaaCKb21X7FcJLmfVikf8KMANTe1crYazWHHVFCiu8vL6ReDYMB+ZrFxudfI/jxPl/5v/uYDCSrGvxvkrDiCXb/4ZxrmrqKq8/YY4mUR1gCxIo96n9d5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=kLUT1bIw; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="kLUT1bIw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Qm
	jvDmH7U0nEx2P2zYXk+jYlzUqQoozGJXETiQk5K7g=; b=kLUT1bIwDkZXh3np2k
	Mbw4UZ54q8gJW7QsfbPDC9O+cqobhvtNT63mSXAlcxuITzcWJfoK1s6bH4wtA7jz
	lzvwuOnYu9kQndkaz27vWX0XnY6D26QUXuIdNr8b22hgDcQOURqScP/4g10SCJPj
	VW3U77h6tGKKVpTiaoBnIGu68=
Received: from cason-VMware-Virtual-Platform.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDnz0NjCrRqQKRpAQ--.63117S2;
	Thu, 24 Sep 2026 01:20:35 +0800 (CST)
From: Xiaochuan Li <chuanx2070@163.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Xiaochuan Li <chuanx2070@163.com>
Subject: [PATCH v3] io_uring/lock: Keep spinlock release before wake_up()
Date: Thu, 24 Sep 2026 01:20:32 +0800
Message-ID: <20260923172032.11057-1-chuanx2070@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923164849.135000-1-chuanx2070@163.com>
References: <20260923164849.135000-1-chuanx2070@163.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnz0NjCrRqQKRpAQ--.63117S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF18GFWDCFyUKryUZF45trb_yoW5CrW3pF
	W3K34rtFW8XFyq93y7AF1jy342kw4qgw48Grs5G34rArW5XrnIva1ktF4F9F45WrZ7Cry5
	uF48trWa9a18ZwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U9_-QUUUUU=
X-CM-SenderInfo: pfkxt0j0sqlii6rwjhhfrp/xtbC7gRjRmq0CmSFlQAA3v

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
Changes in v3:
- Defer wake_up() after releasing acct->lock, add need_wake flag
- keep need_wake from wq_has_sleeper() in the same order

The v1 patch didn't show up on lore.kernel.org

Link: [https://lore.kernel.org/io-uring/20260923164849.135000-1-chuanx2070@163.com/T/#t]

 io_uring/io-wq.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/io_uring/io-wq.c b/io_uring/io-wq.c
index 2ca223e47d41..2dadde0ca395 100644
--- a/io_uring/io-wq.c
+++ b/io_uring/io-wq.c
@@ -526,7 +526,8 @@ static bool io_wait_on_hash(struct io_wq *wq, unsigned int hash)
 }
 
 static struct io_wq_work *io_get_next_work(struct io_wq_acct *acct,
-					   struct io_wq *wq)
+					   struct io_wq *wq,
+					   bool *need_wake)
 	__must_hold(acct->lock)
 {
 	struct io_wq_work_node *node, *prev;
@@ -575,8 +576,7 @@ static struct io_wq_work *io_get_next_work(struct io_wq_acct *acct,
 		raw_spin_lock(&acct->lock);
 		if (unstalled) {
 			clear_bit(IO_ACCT_STALLED_BIT, &acct->flags);
-			if (wq_has_sleeper(&wq->hash->wait))
-				wake_up(&wq->hash->wait);
+			*need_wake = wq_has_sleeper(&wq->hash->wait);
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

