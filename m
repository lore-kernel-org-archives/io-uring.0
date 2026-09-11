Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BF14718E5
	for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 15:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141322; cv=none; b=eWMSr3QKfwzNQnjQ2rdd3pv9Odb40/R98bW0n1Vu/UCEWtFd9/qywbLgSgTCfDKpsV6laakorZI8E4htb/WLNtx81SfH4mttp1Pgbv67ZlQd3U2LJ1vXbKCp3OGzXjHyT0X71aO/dMHXHHzzgUkqjAin44kmgpc+/6qSW9ccr5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141322; c=relaxed/simple;
	bh=r/qsE4zGgo7MhImrb2TlshD5UTHqgg274D7HoUGeQkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dF0IfhtX3kjvP8et6Ji/Z+KFGKnYXDY2cQuHgHTcGVxkYfh6DybdJzvjhjj3b+TuBWqMrXSCdqZ8joFqSbxYt/VstnvGnxZg9DkHi86zyYZV1ClRfOTqO3X8TadLeWRXbr1f5lWzOS5i5G6lo6RwYOZWdNYUCqideVA74ZPXERM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=0r1hjtZ6; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="0r1hjtZ6"
Received: by mail-oo2-f43.google.com with SMTP id 006d021491bc7-6b1ae6f5fc4so483462eaf.2
        for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 08:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141317; x=1789746117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LQGIaUxtlzAP3sjiLv3UoTOfP6jJ6w5b9DVleKCMx9s=;
        b=0r1hjtZ6LSHw1RdShsmODshx0ksFvZNxUF/S/zxsGU5PnKiin3G9XIlhpZqd5gSDZu
         ShnTZ/wUoRsKU0CtPxIWtuj1ShiG1ZV84OPjyXpS2H91Sxir75P+cRQSdgS7bpD7X3Sg
         lJzF8wgdT5JEjCgIMJ+NGnbobBY6HvsiFqsiBbkDJUmtBr9Q90g2CX/sLcf9L5MoEOtn
         yvTwnwx3zed0dFGWWT0U7u5uRwOJtonLFiNKvxK4JEVtSv0TX0bRtu5UBEC6Md/Dh3HT
         swBqbw+1uEa5WNZo0VJ5L4dra31JKBJG/tEk1zJiYQXpZKODHdkdGGivCRbgenkOm4VU
         a3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141317; x=1789746117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LQGIaUxtlzAP3sjiLv3UoTOfP6jJ6w5b9DVleKCMx9s=;
        b=QdGiYjrWK8+IZpudNCSURCPU9Nhq7li1vT6Xy/ujPnIEuO7ZlPC8X06Za3wQ72lSOJ
         EmjlnFe7Tqhw67EumBEqA0zcCbTzNyVSk5ys3aVzc5U2nNFG5DC8dEUToW9sAl+HyTBn
         +yHz7F8lq6FRubYg/qXFU8RNo70iajzF62LnozBPewnnPYpfjcvK1J5MlNsp0MOyFXxJ
         Jd1tWwdjqN5aGq+FLFg4QXezQ2ToEaeN2WxpFNnGfQDgPqPDrF5/kXE9Kw5bgYcRo9Br
         Ya9BDBIIbh+LNbYw2kA4vCdW7P+ecg05oZpmW637ELoVjsEtywdgZhk9MBw6aoa4BNW/
         u1Xw==
X-Gm-Message-State: AFuF++mG5emFXN0veiArFvLWODpiuolbpul8tqBeeNs4KoUv1JZx+I+l
	H60xVqXEnEnbVYvWk28x4L3nJXGYeTKJCPp+giOncN2eCNIrdmyQ0JsPkF9P//98ODhJX4eDOd/
	kbq4XGs4=
X-Gm-Gg: AYBFou0A5DQYVGt1m851uso77I9AF8fByboflptP4vSIpAa5mtwRSMcD0fubqbOUJ4C
	Y4ApV2XbUHRq7WUwwZ8xmIIeqw4MwW1/TUb/1/Rg8Xb0gngz8CTc3OGzLFRvMoRAAoaEv410FZW
	JqmkmFLLXmxTwlkaJnkefFvSRFtCws8mv+KZ6XKe4cp1waFXClmYrhtPRa4CLc3vxJcbIqy5HUX
	eZIoLUV9SeqnioiOFWeLUTh8SyDo8tsC9AAP89QdCJUmjxSWLJX22Y5Bx4du+v2QoIMLU4HMriQ
	QvYBMUPWGIng5FY7E3dbPqmAHCIMhFVpv/D696Duyn3L/ncqQOm2+E0+F44DpfOcmtCyIGf94lc
	AzAgaYHXvXrFNBEoKnCIxnKmgg6G9kRO43SksfbFjtmgR8SVFqIWI9kAEleH5rSmJChJb/9VAE8
	WcxhVbgpGt3Pi6CL2d1bACAg+kNXtGw+CDNyJJ/2kc6xi++Q2huIcUBrblVO070cVuxUQRD1nov
	aLW/60+VO2DnLJow7gPX/bKTqWvpMFZkk88SNI112c=
X-Received: by 2002:a05:6820:1f07:b0:6b1:b867:1a1 with SMTP id 006d021491bc7-6c0bb2f3cadmr6386168eaf.12.1789141316858;
        Fri, 11 Sep 2026 08:41:56 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c09690af1dsm2802199eaf.1.2026.09.11.08.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:41:56 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 01/15] kernel: add thread identity handoff
Date: Fri, 11 Sep 2026 09:40:51 -0600
Message-ID: <20260911154148.644489-2-axboe@kernel.dk>
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

Add infrastructure for moving the user visible identity of a thread that
is about to block in the kernel to another thread in the same process,
which then returns to userspace on its behalf.

The blocked thread keeps its task_struct and kernel stack, only what
userspace observes moves: tid, signal state, rseq and robust list,
credentials, scheduling attributes, mempolicy, comm and the user
register state. Thread group leadership follows the tid.

thread_handoff_allowed() vets the source and thread_handoff_compatible()
the destination. thread_handoff_prepare() runs on the source right
before it blocks, thread_handoff_finish() on the destination moves the
identity over. Architectures provide the arch_thread_handoff_*() hooks
and select ARCH_HAS_THREAD_HANDOFF.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 arch/Kconfig                   |   7 +
 include/linux/thread_handoff.h |  72 +++++
 init/Kconfig                   |  11 +
 kernel/Makefile                |   1 +
 kernel/sched/core.c            |  33 +++
 kernel/thread_handoff.c        | 484 +++++++++++++++++++++++++++++++++
 6 files changed, 608 insertions(+)
 create mode 100644 include/linux/thread_handoff.h
 create mode 100644 kernel/thread_handoff.c

diff --git a/arch/Kconfig b/arch/Kconfig
index 45c657772362..5ce7e1713f59 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -604,6 +604,13 @@ config ARCH_HAVE_EXTRA_ELF_NOTES
 config ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
 	bool
 
+config ARCH_HAS_THREAD_HANDOFF
+	bool
+	help
+	  Architecture provides the arch_thread_handoff_*() hooks for moving
+	  the user visible register state of a thread that is blocked in the
+	  kernel to another thread of the same process.
+
 config HAVE_ALIGNED_STRUCT_PAGE
 	bool
 	help
diff --git a/include/linux/thread_handoff.h b/include/linux/thread_handoff.h
new file mode 100644
index 000000000000..e1c17b833e7c
--- /dev/null
+++ b/include/linux/thread_handoff.h
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_THREAD_HANDOFF_H
+#define _LINUX_THREAD_HANDOFF_H
+
+#include <linux/sched.h>
+
+/* per-thread accounting that follows the identity */
+struct thread_handoff_stats {
+	u64				utime;
+	u64				stime;
+	u64				gtime;
+	u64				exec_runtime;
+	unsigned long			min_flt;
+	unsigned long			maj_flt;
+	unsigned long			nvcsw;
+	unsigned long			nivcsw;
+	struct task_io_accounting	ioac;
+};
+
+/*
+ * Move the user visible identity of a thread that is about to block in the
+ * kernel (tid, signals, registers, rseq, creds, sched attributes, ...) to
+ * another thread in the same group, which then returns to userspace on its
+ * behalf. The blocked thread keeps its task_struct and in-kernel state.
+ */
+#ifdef CONFIG_THREAD_HANDOFF
+bool thread_handoff_allowed(struct task_struct *tsk);
+bool thread_handoff_compatible(struct task_struct *src,
+			       struct task_struct *dst);
+bool thread_handoff_prepare(struct task_struct *tsk);
+void thread_handoff_stats_take(struct thread_handoff_stats *st);
+int thread_handoff_finish(struct task_struct *src,
+			  struct thread_handoff_stats *st);
+
+u64 sched_exec_runtime_take(struct task_struct *p);
+void sched_exec_runtime_add(struct task_struct *p, u64 ns);
+
+/*
+ * Arch hooks. _prepare() syncs the live user register state on the source
+ * before it blocks, _finish() copies it over and loads what the return to
+ * userspace won't. @leader tells it that thread group leadership moved.
+ */
+bool arch_thread_handoff_allowed(struct task_struct *tsk);
+bool arch_thread_handoff_compatible(struct task_struct *src,
+				    struct task_struct *dst);
+bool arch_thread_handoff_prepare(void);
+int arch_thread_handoff_finish(struct task_struct *src, bool leader);
+#else
+static inline bool thread_handoff_allowed(struct task_struct *tsk)
+{
+	return false;
+}
+static inline bool thread_handoff_compatible(struct task_struct *src,
+					     struct task_struct *dst)
+{
+	return false;
+}
+static inline bool thread_handoff_prepare(struct task_struct *tsk)
+{
+	return false;
+}
+static inline void thread_handoff_stats_take(struct thread_handoff_stats *st)
+{
+}
+static inline int thread_handoff_finish(struct task_struct *src,
+					struct thread_handoff_stats *st)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
+#endif
diff --git a/init/Kconfig b/init/Kconfig
index 8583d9f06c52..b376f802a77a 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1957,9 +1957,20 @@ config AIO
 	  by some high performance threaded applications. Disabling
 	  this option saves about 7k.
 
+config THREAD_HANDOFF
+	bool
+	depends on ARCH_HAS_THREAD_HANDOFF
+	help
+	  Support for handing the user visible identity of a thread that is
+	  about to block in the kernel to another thread of the same process,
+	  which then returns to userspace on its behalf. Used by io_uring to
+	  issue requests inline and only offload them to a worker thread if
+	  they actually block.
+
 config IO_URING
 	bool "Enable IO uring support" if EXPERT
 	select IO_WQ
+	select THREAD_HANDOFF if ARCH_HAS_THREAD_HANDOFF
 	default y
 	help
 	  This option enables support for the io_uring interface, enabling
diff --git a/kernel/Makefile b/kernel/Makefile
index 1e1a31673577..5843d4866db7 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -14,6 +14,7 @@ obj-y     = fork.o exec_domain.o exec_state.o panic.o \
 
 obj-$(CONFIG_MULTIUSER) += groups.o
 obj-$(CONFIG_VHOST_TASK) += vhost_task.o
+obj-$(CONFIG_THREAD_HANDOFF) += thread_handoff.o
 
 ifdef CONFIG_FUNCTION_TRACER
 # Do not trace internal ftrace files
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index b998ef6b87af..eeb55367c0c6 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -96,6 +96,7 @@
 
 #include "../workqueue_internal.h"
 #include "../../io_uring/io-wq.h"
+#include <linux/thread_handoff.h>
 #include "../smpboot.h"
 #include "../locking/mutex.h"
 
@@ -5684,6 +5685,38 @@ static inline void prefetch_curr_exec_start(struct task_struct *p)
  * In case the task is currently running, return the runtime plus current's
  * pending runtime that have not been accounted yet.
  */
+#ifdef CONFIG_THREAD_HANDOFF
+/* keep the prev_sum_exec_runtime delta intact, slice accounting uses it */
+u64 sched_exec_runtime_take(struct task_struct *p)
+{
+	struct rq_flags rf;
+	struct rq *rq;
+	u64 ns;
+
+	rq = task_rq_lock(p, &rf);
+	if (task_current_donor(rq, p) && task_on_rq_queued(p)) {
+		update_rq_clock(rq);
+		p->sched_class->update_curr(rq);
+	}
+	ns = p->se.sum_exec_runtime;
+	p->se.sum_exec_runtime = 0;
+	p->se.prev_sum_exec_runtime -= ns;
+	task_rq_unlock(rq, p, &rf);
+	return ns;
+}
+
+void sched_exec_runtime_add(struct task_struct *p, u64 ns)
+{
+	struct rq_flags rf;
+	struct rq *rq;
+
+	rq = task_rq_lock(p, &rf);
+	p->se.sum_exec_runtime += ns;
+	p->se.prev_sum_exec_runtime += ns;
+	task_rq_unlock(rq, p, &rf);
+}
+#endif
+
 unsigned long long task_sched_runtime(struct task_struct *p)
 {
 	struct rq_flags rf;
diff --git a/kernel/thread_handoff.c b/kernel/thread_handoff.c
new file mode 100644
index 000000000000..1901eb85bae8
--- /dev/null
+++ b/kernel/thread_handoff.c
@@ -0,0 +1,484 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Thread identity handoff, see include/linux/thread_handoff.h
+ *
+ * Copyright (C) 2026 Jens Axboe
+ */
+#include <linux/thread_handoff.h>
+#include <linux/sched/signal.h>
+#include <linux/sched/task.h>
+#include <linux/sched/rt.h>
+#include <linux/sched/mm.h>
+#include <linux/audit.h>
+#include <linux/cgroup.h>
+#include <linux/cred.h>
+#include <linux/futex.h>
+#include <linux/mempolicy.h>
+#include <linux/pid.h>
+#include <linux/rseq.h>
+#include <linux/seccomp.h>
+#include <linux/thread_info.h>
+#include <uapi/linux/sched/types.h>
+#include <linux/ioprio.h>
+#include <linux/iocontext.h>
+#include <linux/task_io_accounting_ops.h>
+#include <linux/uprobes.h>
+#include <linux/perf_event.h>
+
+/* prctl state that moves. Not PF_MEMALLOC_NOIO, kernel code sets that too */
+#define THREAD_HANDOFF_PF_FLAGS	(PF_MCE_PROCESS | PF_MCE_EARLY)
+
+/* can the identity of @tsk (current) be handed off, errs on the safe side */
+bool thread_handoff_allowed(struct task_struct *tsk)
+{
+	WARN_ON_ONCE(tsk != current);
+
+	if (tsk->flags & (PF_EXITING | PF_KTHREAD | PF_IO_WORKER))
+		return false;
+	if (tsk->ptrace)
+		return false;
+	/* tracees point back at the tracer task */
+	if (!list_empty(&tsk->ptraced))
+		return false;
+	if (tsk->signal->flags & SIGNAL_GROUP_EXIT)
+		return false;
+#ifdef CONFIG_PERF_EVENTS
+	/* per-task perf contexts are bound to the task_struct */
+	if (tsk->perf_event_ctxp)
+		return false;
+#endif
+#ifdef CONFIG_FUTEX
+	/* PI futex ownership is tied to the task_struct */
+	if (!list_empty(&tsk->futex.pi_state_list))
+		return false;
+#endif
+#ifdef CONFIG_GENERIC_ENTRY
+	if (test_syscall_work(SYSCALL_USER_DISPATCH))
+		return false;
+#endif
+	/* only the fair class moves, see thread_handoff_sched() */
+	if (rt_or_dl_task(tsk))
+		return false;
+#ifdef CONFIG_SCHED_CORE
+	/* the core scheduling cookie is bound to the task */
+	if (tsk->core_cookie)
+		return false;
+#endif
+#ifdef CONFIG_KCOV
+	/* coverage collection is per-thread */
+	if (tsk->kcov)
+		return false;
+#endif
+#ifdef CONFIG_POSIX_TIMERS
+	/* armed per-thread CPU timers would sample the destination's clock */
+	if (tsk->posix_cputimers.timers_active)
+		return false;
+#endif
+	/* the syscall never exits, its audit record would never be emitted */
+	if (!audit_dummy_context())
+		return false;
+#ifdef CONFIG_UPROBES
+	/* pending uretprobes, the return address bookkeeping is in our utask */
+	if (tsk->utask && tsk->utask->return_instances)
+		return false;
+#endif
+	/* a vfork() parent waits on this task_struct, not on the identity */
+	if (tsk->vfork_done)
+		return false;
+
+	return arch_thread_handoff_allowed(tsk);
+}
+
+/* can @dst take over the identity of @src, called from sched_submit_work() */
+bool thread_handoff_compatible(struct task_struct *src, struct task_struct *dst)
+{
+	if (dst->flags & PF_EXITING)
+		return false;
+	/* the identity would land under a tracer that never attached to it */
+	if (dst->ptrace)
+		return false;
+	if (!same_thread_group(src, dst))
+		return false;
+#ifdef CONFIG_GENERIC_ENTRY
+	/* inherited from the thread that forked the destination */
+	if (test_task_syscall_work(dst, SYSCALL_USER_DISPATCH))
+		return false;
+#endif
+	if (dst->mm != src->mm || dst->files != src->files ||
+	    dst->fs != src->fs || dst->nsproxy != src->nsproxy)
+		return false;
+	/* the identity must not gain no_new_privs */
+	if (task_no_new_privs(dst) && !task_no_new_privs(src))
+		return false;
+#ifdef CONFIG_SECCOMP
+	/* seccomp filters are per-thread, the identity must not escape them */
+	if (dst->seccomp.mode != src->seccomp.mode ||
+	    dst->seccomp.filter != src->seccomp.filter)
+		return false;
+#endif
+#ifdef CONFIG_SYSVIPC
+	/* SEM_UNDO adjustments are accounted per undo list */
+	if (dst->sysvsem.undo_list != src->sysvsem.undo_list)
+		return false;
+#endif
+	/* thread_handoff_creds() doesn't switch namespaces */
+	scoped_guard(rcu) {
+		if (__task_cred(dst)->user_ns != __task_cred(src)->user_ns)
+			return false;
+	}
+	return arch_thread_handoff_compatible(src, dst);
+}
+
+/* runs on the source right before it blocks, syncs its live user state */
+bool thread_handoff_prepare(struct task_struct *tsk)
+{
+	WARN_ON_ONCE(tsk != current);
+	/* re-check, may have changed since thread_handoff_allowed() */
+	if (tsk->ptrace)
+		return false;
+#ifdef CONFIG_PERF_EVENTS
+	if (tsk->perf_event_ctxp)
+		return false;
+#endif
+#ifdef CONFIG_FUTEX
+	if (!list_empty(&tsk->futex.pi_state_list))
+		return false;
+#endif
+	return arch_thread_handoff_prepare();
+}
+
+/*
+ * Take the source's per-thread accounting for the destination, so the tid's
+ * counters stay monotonic. Runs as current, the tick writes these from irq.
+ */
+void thread_handoff_stats_take(struct thread_handoff_stats *st)
+{
+	struct task_struct *p = current;
+
+	st->exec_runtime = sched_exec_runtime_take(p);
+
+	local_irq_disable();
+	st->utime = p->utime;
+	st->stime = p->stime;
+	st->gtime = p->gtime;
+	p->utime = p->stime = p->gtime = 0;
+#ifndef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
+	raw_spin_lock(&p->prev_cputime.lock);
+	p->prev_cputime.utime = p->prev_cputime.stime = 0;
+	raw_spin_unlock(&p->prev_cputime.lock);
+#endif
+	local_irq_enable();
+
+	st->min_flt = p->min_flt;
+	st->maj_flt = p->maj_flt;
+	st->nvcsw = p->nvcsw;
+	st->nivcsw = p->nivcsw;
+	p->min_flt = p->maj_flt = p->nvcsw = p->nivcsw = 0;
+	st->ioac = p->ioac;
+	memset(&p->ioac, 0, sizeof(p->ioac));
+}
+
+static void thread_handoff_stats_add(struct task_struct *p,
+				     struct thread_handoff_stats *st)
+{
+	sched_exec_runtime_add(p, st->exec_runtime);
+
+	local_irq_disable();
+	p->utime += st->utime;
+	p->stime += st->stime;
+	p->gtime += st->gtime;
+	local_irq_enable();
+
+	p->min_flt += st->min_flt;
+	p->maj_flt += st->maj_flt;
+	p->nvcsw += st->nvcsw;
+	p->nivcsw += st->nivcsw;
+	task_io_accounting_add(&p->ioac, &st->ioac);
+}
+
+/* signal state follows the identity, the source gets a worker's mask */
+static void thread_handoff_signals(struct task_struct *dst,
+				   struct task_struct *src)
+	__must_hold(&dst->sighand->siglock)
+{
+	dst->blocked = src->blocked;
+	dst->real_blocked = src->real_blocked;
+	dst->saved_sigmask = src->saved_sigmask;
+	dst->sas_ss_sp = src->sas_ss_sp;
+	dst->sas_ss_size = src->sas_ss_size;
+	dst->sas_ss_flags = src->sas_ss_flags;
+	dst->restart_block = src->restart_block;
+
+	siginitsetinv(&src->blocked, sigmask(SIGKILL) | sigmask(SIGSTOP));
+	sigemptyset(&src->real_blocked);
+	sas_ss_reset(src);
+
+	list_splice_tail_init(&src->pending.list, &dst->pending.list);
+	sigorsets(&dst->pending.signal, &dst->pending.signal,
+		  &src->pending.signal);
+	sigemptyset(&src->pending.signal);
+}
+
+/* the tgid is the leader's tid, so leadership follows. Like de_thread() */
+static void thread_handoff_leader(struct task_struct *dst,
+				  struct task_struct *src)
+	__must_hold(&tasklist_lock)
+{
+	struct list_head *prev = dst->thread_node.prev;
+	struct task_struct *t;
+
+	/*
+	 * The leader must be first on ->thread_head, swap the two list
+	 * positions. RCU readers may see a thread twice, never miss one.
+	 */
+	if (prev == &src->thread_node)
+		prev = &dst->thread_node;
+	list_del_rcu(&dst->thread_node);
+	list_replace_rcu(&src->thread_node, &dst->thread_node);
+	list_add_rcu(&src->thread_node, prev);
+
+	transfer_pid(src, dst, PIDTYPE_TGID);
+	transfer_pid(src, dst, PIDTYPE_PGID);
+	transfer_pid(src, dst, PIDTYPE_SID);
+
+	list_replace_rcu(&src->tasks, &dst->tasks);
+	list_replace_init(&src->sibling, &dst->sibling);
+
+	for_each_thread(dst, t)
+		t->group_leader = dst;
+
+	dst->exit_signal = src->exit_signal;
+	src->exit_signal = -1;
+}
+
+/* children are parented to the forking thread, move them along */
+static void thread_handoff_children(struct task_struct *dst,
+				    struct task_struct *src)
+	__must_hold(&tasklist_lock)
+{
+	struct task_struct *p;
+
+	list_for_each_entry(p, &src->children, sibling) {
+		RCU_INIT_POINTER(p->real_parent, dst);
+		if (rcu_access_pointer(p->parent) == src)
+			RCU_INIT_POINTER(p->parent, dst);
+	}
+	list_splice_init(&src->children, &dst->children);
+	dst->self_exec_id = src->self_exec_id;
+}
+
+static bool thread_handoff_sched_same(struct task_struct *dst,
+				      struct task_struct *src)
+{
+	if (dst->policy != src->policy || task_nice(dst) != task_nice(src))
+		return false;
+	if (dst->sched_reset_on_fork != src->sched_reset_on_fork)
+		return false;
+	if (dst->se.custom_slice != src->se.custom_slice ||
+	    (src->se.custom_slice && dst->se.slice != src->se.slice))
+		return false;
+#ifdef CONFIG_UCLAMP_TASK
+	for (int i = 0; i < UCLAMP_CNT; i++) {
+		if (dst->uclamp_req[i].user_defined != src->uclamp_req[i].user_defined)
+			return false;
+		if (src->uclamp_req[i].user_defined &&
+		    dst->uclamp_req[i].value != src->uclamp_req[i].value)
+			return false;
+	}
+#endif
+	return true;
+}
+
+/* sched attributes follow the identity, sched_setattr() only if needed */
+static void thread_handoff_sched(struct task_struct *dst,
+				 struct task_struct *src)
+{
+	struct sched_attr attr = {
+		.sched_policy = src->policy,
+		.sched_nice = task_nice(src),
+	};
+
+	if (thread_handoff_sched_same(dst, src))
+		return;
+	if (src->sched_reset_on_fork)
+		attr.sched_flags |= SCHED_FLAG_RESET_ON_FORK;
+	if (src->se.custom_slice)
+		attr.sched_runtime = src->se.slice;
+#ifdef CONFIG_UCLAMP_TASK
+	if (src->uclamp_req[UCLAMP_MIN].user_defined) {
+		attr.sched_flags |= SCHED_FLAG_UTIL_CLAMP_MIN;
+		attr.sched_util_min = src->uclamp_req[UCLAMP_MIN].value;
+	}
+	if (src->uclamp_req[UCLAMP_MAX].user_defined) {
+		attr.sched_flags |= SCHED_FLAG_UTIL_CLAMP_MAX;
+		attr.sched_util_max = src->uclamp_req[UCLAMP_MAX].value;
+	}
+#endif
+	WARN_ON_ONCE(sched_setattr_nocheck(dst, &attr));
+}
+
+static void thread_handoff_mempolicy(struct task_struct *dst,
+				     struct task_struct *src)
+{
+#ifdef CONFIG_NUMA
+	struct mempolicy *pol = mpol_dup(src->mempolicy);
+
+	if (IS_ERR(pol))
+		return;
+	task_lock(dst);
+	swap(dst->mempolicy, pol);
+	task_unlock(dst);
+	mpol_put(pol);
+#endif
+}
+
+#ifdef CONFIG_BLOCK
+/* ionice'd threads keep their IO priority, the source's ioc may be in use */
+static void thread_handoff_ioprio(struct task_struct *dst,
+				  struct task_struct *src)
+{
+	struct io_context *ioc = src->io_context;
+
+	/* workers share the ioc of the thread that forked them, detach */
+	if (dst->io_context)
+		exit_io_context(dst);
+	if (ioc && ioprio_valid(ioc->ioprio))
+		WARN_ON_ONCE(set_task_ioprio(dst, ioc->ioprio));
+}
+#else
+static void thread_handoff_ioprio(struct task_struct *dst,
+				  struct task_struct *src)
+{
+}
+#endif
+
+#ifdef CONFIG_CGROUPS
+/* threaded cgroup placement follows the identity, the source stays put */
+static void thread_handoff_cgroup(struct task_struct *dst,
+				  struct task_struct *src)
+{
+	if (rcu_access_pointer(src->cgroups) == rcu_access_pointer(dst->cgroups))
+		return;
+	WARN_ON_ONCE(cgroup_attach_task_all(src, dst));
+}
+#else
+static void thread_handoff_cgroup(struct task_struct *dst,
+				  struct task_struct *src)
+{
+}
+#endif
+
+/*
+ * Adopt the source's creds. Not commit_creds(), the process isn't changing
+ * credentials, an existing identity is just moving between two of its tasks.
+ */
+static void thread_handoff_creds(struct task_struct *dst,
+				 struct task_struct *src)
+{
+	/* neither side changes its own creds while a handoff is in flight */
+	const struct cred *old = rcu_dereference_protected(dst->real_cred, true);
+	const struct cred *new = rcu_dereference_protected(src->real_cred, true);
+
+	WARN_ON_ONCE(rcu_dereference_protected(dst->cred, true) != old);
+	if (new == old)
+		return;
+
+	get_cred_many(new, 2);
+	if (new->user != old->user)
+		inc_rlimit_ucounts(new->ucounts, UCOUNT_RLIMIT_NPROC, 1);
+	rcu_assign_pointer(dst->real_cred, new);
+	rcu_assign_pointer(dst->cred, new);
+	if (new->user != old->user)
+		dec_rlimit_ucounts(old->ucounts, UCOUNT_RLIMIT_NPROC, 1);
+	put_cred_many(old, 2);
+}
+
+/* the user requested affinity follows, the effective mask derives from it */
+static void thread_handoff_affinity(struct task_struct *dst,
+				    struct task_struct *src)
+{
+	/* dup_user_cpus_ptr() wants no user mask, nothing can race us here */
+	release_user_cpus_ptr(dst);
+	dup_user_cpus_ptr(dst, src, NUMA_NO_NODE);
+	set_cpus_allowed_ptr(dst, src->cpus_ptr);
+}
+
+/* runs on the destination, the source never looks at the moved state again */
+int thread_handoff_finish(struct task_struct *src,
+			  struct thread_handoff_stats *st)
+{
+	struct task_struct *dst = current;
+	struct sighand_struct *sighand;
+	char comm[TASK_COMM_LEN];
+	bool leader;
+
+	/* the same for both, neither can be mid exec */
+	sighand = rcu_dereference_protected(dst->sighand, true);
+	WARN_ON_ONCE(sighand != rcu_dereference_protected(src->sighand, true));
+
+	/* tid, leadership, and signal state swap in one go */
+	cgroup_threadgroup_change_begin(dst);
+	write_lock_irq(&tasklist_lock);
+	spin_lock(&sighand->siglock);
+	leader = thread_group_leader(src);
+	exchange_tids(dst, src);
+	if (leader)
+		thread_handoff_leader(dst, src);
+	thread_handoff_children(dst, src);
+	thread_handoff_signals(dst, src);
+	spin_unlock(&sighand->siglock);
+	write_unlock_irq(&tasklist_lock);
+	cgroup_threadgroup_change_end(dst);
+	recalc_sigpending();
+
+#ifdef CONFIG_FUTEX
+	dst->futex.robust_list = src->futex.robust_list;
+	src->futex.robust_list = NULL;
+#ifdef CONFIG_COMPAT
+	dst->futex.compat_robust_list = src->futex.compat_robust_list;
+	src->futex.compat_robust_list = NULL;
+#endif
+#endif
+	dst->clear_child_tid = src->clear_child_tid;
+	src->clear_child_tid = NULL;
+
+#ifdef CONFIG_RSEQ
+	scoped_guard(irqsave) {
+		dst->rseq = src->rseq;
+		memset(&src->rseq, 0, sizeof(src->rseq));
+		src->rseq.ids.cpu_id = RSEQ_CPU_ID_UNINITIALIZED;
+	}
+	rseq_force_update();
+#endif
+
+	thread_handoff_creds(dst, src);
+#ifdef CONFIG_AUDIT
+	dst->loginuid = src->loginuid;
+	dst->sessionid = src->sessionid;
+#endif
+
+	dst->personality = src->personality;
+	dst->pdeath_signal = src->pdeath_signal;
+	dst->timer_slack_ns = src->timer_slack_ns;
+	dst->default_timer_slack_ns = src->default_timer_slack_ns;
+	dst->start_time = src->start_time;
+	dst->start_boottime = src->start_boottime;
+	if (task_no_new_privs(src))
+		task_set_no_new_privs(dst);
+	/* prctl driven per-task flags, the source keeps them for its work */
+	dst->flags = (dst->flags & ~THREAD_HANDOFF_PF_FLAGS) |
+		     (src->flags & THREAD_HANDOFF_PF_FLAGS);
+
+	thread_handoff_mempolicy(dst, src);
+	thread_handoff_cgroup(dst, src);
+	thread_handoff_ioprio(dst, src);
+	thread_handoff_stats_add(dst, st);
+
+	thread_handoff_sched(dst, src);
+	thread_handoff_affinity(dst, src);
+
+	get_task_comm(comm, src);
+	set_task_comm(dst, comm);
+
+	return arch_thread_handoff_finish(src, leader);
+}
-- 
2.55.0

