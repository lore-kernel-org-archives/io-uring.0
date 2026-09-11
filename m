Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77FD459AE1
	for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 15:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141324; cv=none; b=QHdiYnLuY2N88VLBwvtun+L9ik0b+lQ45kNjoRpeJCl3G+pEj6eU7e0KHFAfrgG7hKuBjVJntQash2JDJ15oxCqsAlrjVxcPd6vNzebk51r27zCDBmae8D4QFLNHK8T1m5ye8BQh4RVDqMliKKBFcbsQBS/WU2d4wShZrGHkJOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141324; c=relaxed/simple;
	bh=WoQD+GEr/rVa5dRIa/E9lO9G5gP37D3TEnDGbuP6Hvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vahk16OuY7wnuGK3JfwFfFWOxBbczN6O++3Icyd32hWRcwo8SUjLMZrx6aFw+beFqb2FGGrP1BG4IZ7oBhzXghCzDgT1nRC8DzGkte00V+5mulNQBW03mrEZLTucUv3XV0vGCl4Snkw8b8gFAccAxo+BqExyTwtupHjvdLempdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=UG8smZmZ; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="UG8smZmZ"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4c2e2480eddso1251192b6e.3
        for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 08:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141320; x=1789746120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vd+hpYguRm0/LXSau2U/e2KAtn148hROAqJ+zClJj0g=;
        b=UG8smZmZ1hZ/C+Tjnt3eyuLFAG0SkuIw265DY6JXitZdILCc7DGsVbPFGjw51VWSde
         xdPxOJscTS85eAroDCSHHkVhikuCCBObLPefq4DPvEAfVuZaRo9Lt7eL2SK/JGGewW1C
         Vkyj2F8aYk4mOQ99v0UYA3QNg4A0Pcys+AWgI75CLlh6PWznJTcf0j52RAZpb3JsRcoy
         q/CQtRlJFuYM7YliAYtshooKifCLbqPSOAzRUpG952l//XNNffj7/jCxI+vIJ1P4NwTS
         wzMsPqcZZirbI6z3UFif9fc8bx0XQnFIYjsY1vLmC9SEnIZJpcfo5JXYYH53QHJSNzWl
         Brhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141320; x=1789746120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vd+hpYguRm0/LXSau2U/e2KAtn148hROAqJ+zClJj0g=;
        b=qxqdOBxU73d+2z/naDEyMbjAl0W5uTwfKxi6Wj2WN7ZrxYN7C2TkAOv9zg/EmY27yA
         TEaHPjkFJVIsuV4KxkllQJ1vGo+SeBbo8M4USoINUzPui7BTakaFuj8BXIUdHdCprZ9g
         ZjGJjDaD7C1EidB28S0KBta+/jH3mMHRe1ZDQ/PTJhSq+QhiGmA6xN4zq7H0RI+h/3Q9
         OnwycDp/GFAcHf/3JPxwkEORUrvCh9R1djD1SZQWIOqPYjUl0ZjOS4vLYk5Ry20u2Rsm
         Cu5yZrfecIBsxTPErtlg7XObY1Kn022GxdnWeXT1jLKV+Y+5P5UJkPc3ODc9sCnDfO8e
         4NFA==
X-Gm-Message-State: AFuF++nQ+TPllLIHiQPn529jp5LA+HZXfeLkS/7tjWQQyRDQsshcUWfs
	N5Er1mPRV6IEMaIiewMt/LSoyM6nU6ZcI7I5q/YIHT2XVSs0pin/gRvrWKfgpVJGVGltl+cqNJy
	NbUjUWyY=
X-Gm-Gg: AYBFou2SbbWXpeYi//YMeZNHou3VjaV0ZpBhkSyg8NMSc1SxO5zswoPrj4twAGRvQzW
	Rbem1HoFQUNBlwO9s/ojYrQ/92i2z46yxncm6aHrDgzGawVDzX+OKSexp03aCwAUruFSifSw7d3
	TqS9BksxtfFLzvWRxwHcsadrmIQutyXRHuyYio+1badJcl4MtENC+4/xNEQ1UhM1s6ByoezZwUg
	z9P8jOsLIY4tmt7QzGsiKY/nkav70729JWQ9k/ctC6/jt8SOnaO81KEu5QahaWHQ3Cvrmdbiz8Q
	mJf8FAlQ/6esGkYRiWar1a87VqXxULju02SgY3Akr9biElrV2mgNNqpF4ny5A5/lOSh331yosA+
	xFP/Phe0y+vlejAOSHkzfRSQ43KsmhKvXGDI/gIOZv6CBNoAztXJjya6JWS3YbCybzvVu1rqZpJ
	LZK6TgB4gR57SqEXaw6iHDKBOMDzKg0iiIkibX5pwMG75AMl7s0nHnlIwIFnVF2ntsLVXajbdGN
	OPFPj/l9KHbTCQyHWNrv6kjXymtw4zyHdqbFmrKYCgN
X-Received: by 2002:a05:6820:491a:b0:6b7:46fc:1d3 with SMTP id 006d021491bc7-6c0bd587be9mr2976582eaf.50.1789141320381;
        Fri, 11 Sep 2026 08:42:00 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c09690af1dsm2802199eaf.1.2026.09.11.08.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:41:59 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 04/15] x86: implement thread identity handoff
Date: Fri, 11 Sep 2026 09:40:54 -0600
Message-ID: <20260911154148.644489-5-axboe@kernel.dk>
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

Implement the arch_thread_handoff_*() hooks for 64-bit x86 and select
ARCH_HAS_THREAD_HANDOFF.

Prepare saves FS/GS, PKRU and the FPU state. Finish copies the syscall
pt_regs, fault info and FPU image over, and loads what __switch_to()
would have. Refused are 32-bit tasks, I/O bitmaps and emulated iopl,
per-thread speculation and CPUID/TSC controls, user shadow stacks and
non-default sized fpstates.

ret_from_fork() now returns what the thread function returns in
regs->ax rather than 0. A kernel thread returning from kernel_execve()
returns 0 anyway, an io-wq worker that got handed a user identity
returns the result of the syscall it took over.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 arch/x86/Kconfig             |   1 +
 arch/x86/kernel/process.c    |  10 +--
 arch/x86/kernel/process_64.c | 139 +++++++++++++++++++++++++++++++++++
 3 files changed, 145 insertions(+), 5 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 15fd9ec5ecac..4f53859d0228 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -109,6 +109,7 @@ config X86
 	select ARCH_HAS_STRICT_MODULE_RWX
 	select ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
 	select ARCH_HAS_SYSCALL_WRAPPER
+	select ARCH_HAS_THREAD_HANDOFF		if X86_64
 	select ARCH_HAS_UBSAN
 	select ARCH_HAS_DEBUG_WX
 	select ARCH_HAS_ZONE_DMA_SET if EXPERT
diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index 346c438ac880..ed52af862392 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -155,13 +155,13 @@ __visible void ret_from_fork(struct task_struct *prev, struct pt_regs *regs,
 
 	/* Is this a kernel thread? */
 	if (unlikely(fn)) {
-		fn(fn_arg);
+		long ret = fn(fn_arg);
+
 		/*
-		 * A kernel thread is allowed to return here after successfully
-		 * calling kernel_execve().  Exit to userspace to complete the
-		 * execve() syscall.
+		 * A kernel thread returning from kernel_execve(), or an io-wq
+		 * worker returning the result of a syscall it took over.
 		 */
-		regs->ax = 0;
+		regs->ax = ret;
 	}
 
 	syscall_exit_to_user_mode(regs);
diff --git a/arch/x86/kernel/process_64.c b/arch/x86/kernel/process_64.c
index 2bce7b3f97ed..0f07e9a6bb02 100644
--- a/arch/x86/kernel/process_64.c
+++ b/arch/x86/kernel/process_64.c
@@ -41,10 +41,12 @@
 #include <linux/ftrace.h>
 #include <linux/syscalls.h>
 #include <linux/iommu.h>
+#include <linux/thread_handoff.h>
 
 #include <asm/processor.h>
 #include <asm/pkru.h>
 #include <asm/fpu/sched.h>
+#include <asm/fpu/xstate.h>
 #include <asm/mmu_context.h>
 #include <asm/prctl.h>
 #include <asm/desc.h>
@@ -980,3 +982,140 @@ long do_arch_prctl_64(struct task_struct *task, int option, unsigned long arg2)
 
 	return ret;
 }
+
+#ifdef CONFIG_THREAD_HANDOFF
+/* Thread identity handoff, see include/linux/thread_handoff.h */
+
+/* prctl driven per-thread controls that __switch_to_xtra() applies */
+#define THREAD_HANDOFF_TIF_MATCH \
+	(_TIF_SSBD | _TIF_SPEC_IB | _TIF_NOCPUID | _TIF_NOTSC)
+
+/* state bound to the task that neither side may have */
+static bool thread_handoff_task_ok(struct task_struct *tsk)
+{
+	/* I/O permissions, the bitmap hangs off the task */
+	if (test_tsk_thread_flag(tsk, TIF_IO_BITMAP) || tsk->thread.iopl_emul)
+		return false;
+#ifdef CONFIG_X86_USER_SHADOW_STACK
+	/* the shadow stack is per-thread and would have to move along */
+	if (tsk->thread.features & ARCH_SHSTK_SHSTK)
+		return false;
+#endif
+	/* only the default sized FPU state gets copied over, no AMX */
+	if (x86_task_fpu(tsk)->fpstate->is_valloc)
+		return false;
+	return true;
+}
+
+bool arch_thread_handoff_allowed(struct task_struct *tsk)
+{
+	/* 64-bit tasks only */
+	if (test_tsk_thread_flag(tsk, TIF_ADDR32))
+		return false;
+	return thread_handoff_task_ok(tsk);
+}
+
+bool arch_thread_handoff_compatible(struct task_struct *src,
+				    struct task_struct *dst)
+{
+	/* these don't move, must match. They're usually applied process wide */
+	if ((read_task_thread_flags(src) ^ read_task_thread_flags(dst)) &
+	    THREAD_HANDOFF_TIF_MATCH)
+		return false;
+	return thread_handoff_task_ok(dst);
+}
+
+/*
+ * Sync the live user register state. TIF_NEED_FPU_LOAD makes the in-memory
+ * FPU image final, later context switches won't write it again.
+ */
+bool arch_thread_handoff_prepare(void)
+{
+	current_save_fsgs();
+	/* thread.pkru is only valid when scheduled out, make it so */
+	if (cpu_feature_enabled(X86_FEATURE_OSPKE))
+		current->thread.pkru = read_pkru();
+	fpregs_lock();
+	if (!test_thread_flag(TIF_NEED_FPU_LOAD)) {
+		save_fpregs_to_fpstate(x86_task_fpu(current));
+		set_thread_flag(TIF_NEED_FPU_LOAD);
+	}
+	fpregs_unlock();
+	return true;
+}
+
+/* copy the user register state over, load what __switch_to() would have */
+int arch_thread_handoff_finish(struct task_struct *src, bool leader)
+{
+	struct task_struct *dst = current;
+	struct thread_struct *t = &dst->thread, *s = &src->thread;
+	struct fpu *dst_fpu = x86_task_fpu(dst), *src_fpu = x86_task_fpu(src);
+	struct thread_struct prev;
+
+	/* the syscall frame, this is what the return to userspace restores */
+	*task_pt_regs(dst) = *task_pt_regs(src);
+
+	/* fault info, in case a signal for it is pending */
+	t->cr2 = s->cr2;
+	t->trap_nr = s->trap_nr;
+	t->error_code = s->error_code;
+
+	/*
+	 * Dynamic xstate permissions are a property of the process but live
+	 * in the group leader's struct fpu, see xstate_get_group_perm().
+	 */
+	if (leader && fpu_state_size_dynamic()) {
+		struct sighand_struct *sighand;
+
+		sighand = rcu_dereference_protected(dst->sighand, true);
+		spin_lock_irq(&sighand->siglock);
+		dst_fpu->perm = src_fpu->perm;
+		dst_fpu->guest_perm = src_fpu->guest_perm;
+		spin_unlock_irq(&sighand->siglock);
+	}
+
+	/* both sides have the default sized fpstate, reload on the way out */
+	fpregs_lock();
+	memcpy(&dst_fpu->fpstate->regs, &src_fpu->fpstate->regs,
+	       src_fpu->fpstate->size);
+	dst_fpu->last_cpu = -1;
+	set_thread_flag(TIF_NEED_FPU_LOAD);
+	fpregs_unlock();
+
+	preempt_disable();
+
+	memcpy(t->tls_array, s->tls_array, sizeof(t->tls_array));
+	load_TLS(t, smp_processor_id());
+
+	savesegment(es, t->es);
+	if (unlikely(t->es | s->es))
+		loadsegment(es, s->es);
+	t->es = s->es;
+	savesegment(ds, t->ds);
+	if (unlikely(t->ds | s->ds))
+		loadsegment(ds, s->ds);
+	t->ds = s->ds;
+
+	/* FS/GS, the legacy load path needs to know what the CPU holds now */
+	local_irq_disable();
+	save_fsgs(dst);
+	prev.fsindex = t->fsindex;
+	prev.fsbase = t->fsbase;
+	prev.gsindex = t->gsindex;
+	prev.gsbase = t->gsbase;
+	t->fsindex = s->fsindex;
+	t->fsbase = s->fsbase;
+	t->gsindex = s->gsindex;
+	t->gsbase = s->gsbase;
+	x86_fsgsbase_load(&prev, t);
+	local_irq_enable();
+
+	if (cpu_feature_enabled(X86_FEATURE_OSPKE)) {
+		t->pkru = s->pkru;
+		write_pkru(t->pkru);
+	}
+
+	preempt_enable();
+	return 0;
+}
+#endif
-- 
2.55.0

