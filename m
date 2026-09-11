Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E14476CDD
	for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 15:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141323; cv=none; b=rJrWRgaLMjy7X4rboHLTk6jHw3UyLYzzKqAErKLe0lXyaW2TyAn7OVWPm6C8hV1Or31K1tEk7YZr6uT8Z2PdRpGpURA3QBOPr57XLqHsIc7xhPlyA8tlAENO5W3dDjyw9trZD4oZq3pEIkyJzAoukzbgyzgDIwKuPr+ErdEOk2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141323; c=relaxed/simple;
	bh=imsgKgY1OaIa8G+gQkSklejkPfoEILr53ZwC+FKcriY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gTo6YV7Stg+cxNBumRjzw+AKJzqeaLKQFcwEWQuoi91ahWMcBMliN144mN59KY5cyrLiihS2iVKQKqI36VJY8aLbymBJzaoDMDJXgS1NSxVdAivI004MrAryTmDu0jGzxdGqNIeBhMG4RsREC35v/2d34pXVTf9GH3EDoDGZ32Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=OYxWRbk/; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="OYxWRbk/"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccde2ad8so702757fac.2
        for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 08:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141319; x=1789746119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BaSkBg1gwRLv4QW0pPStlZCwsjMD0iYU2zavQE68qlw=;
        b=OYxWRbk/7Me8tLmO4K+1EYGEernm3x4ncDAfwqgJ5wsXQk3Sr4R1uR8S8nniNf3SAk
         iTuTZuHzZHx+ZthER4+tbAt3Gfj0vYWv7G2JPI+MjSs2s4Nrsmr47dQnJbRy+O7+oy1I
         s4wKHI+g+TxQITPnCZGOOeNOdoZqh9jHLt9Hg0AWGCwF5kTEvlbGw8eHz2ckvQtE2bvz
         Kp3epyPWkB9bs+jzlKDQrQL2rpPG2grTZDnj/0QmO4iB8+Gk5+gHix2wJRWQ/ig440VP
         mZzQQA3uRfs+W628IUcKvGT1lT/OSAECIP90RMYGMltanqUA2ozTQRagBAl4Ab4unG7m
         f/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141319; x=1789746119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BaSkBg1gwRLv4QW0pPStlZCwsjMD0iYU2zavQE68qlw=;
        b=ZEuiOc4sxzzk0SEKqe1yK2HVViR0XfHYYwNZyHB4xeHnO5nTdbiQ1H756lyzKmw7Va
         bdvoD0EVnBfo9oDdqrhBLPvMbWswtuK9mz/6okhz+0qC9VqHpaWI32beXmGj3fgLPhTJ
         Hgc/1tmKrfliRgMQDtUAxq6QKNszzr/9GEQ5QS9YH34O718yOrq1un2ZcmUTA5xvrVF4
         ipuVfp6lxxJsZ9JKL3cvtu9xGOAa7pxCmiL86K3hOUb3ioVggTuSdQiMG5kEyO2NlyNN
         jaNV7JChhbYOKWuxVZF5+h+Xrx3Q194MErwTLUaLV7jfpvLdz3+rHstHJhNYefq3a2oS
         qMdg==
X-Gm-Message-State: AFuF++kqcPjPVIaBzshfMyOWgrFrCkKv1DNaWgUoXIQeHzaXGNOiRqQi
	0LUTqQGJuGePwpMRISQ7LivVopervXlr6NH+6HXxmorevrAvkPzZjf7RKr73pSMBPrMCFMHkIE0
	OO027rSs=
X-Gm-Gg: AYBFou0UjmVBHsHQxeDnv0LC0NR7ebJ9GxRdTTlrDrXMeG9E0WpjR6dIRCu0jUPWVzr
	sHFl/mreWbgVxd3mccPsy4pqGRP+DQYdqLMw3JaEhDqvM2MToXNRq9/PMyJooOpmwL1xtPdzaID
	ad0Yk6pG8Ff8td93t56LFnWQ4E9vsYkNur6VQOogW70b+J1DA55y4IM7xymP7eZBNZ4lNYcPYH3
	6vr2rGQkIbc5kSv0LV1JjpOkNH14bIVFA++2r/HIAmAAipc/bm9s37lGz02IrBou276P7aG/Ngr
	cO8qgftpnBX6+jmmJqkIea40sdU8C8Groo3AEVXdw38s1Wz1LlRK+VY+WRB2VpC5t2CbWDj8eku
	XAxnUGY7D9Tieoyf7+8oWPnNPnZHZw0mrYtcllqjaH645zdoNBy9EDpoqyF3Wi7gBY3X5pXuCej
	9VMRAhnTlDmewxBzBvXljIxj1aQu0Fi4+VMfOx/EGbV+hnpoeSIVmTIMO/2kv5ODYmmMZ7/isZK
	bCChHWDr/3Oa/ax1rm77oEgYvvgHm0QOKHip8yNVb3E
X-Received: by 2002:a05:6820:571c:20b0:6b6:4f90:a62a with SMTP id 006d021491bc7-6c0ba8280bbmr4922795eaf.11.1789141319190;
        Fri, 11 Sep 2026 08:41:59 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c09690af1dsm2802199eaf.1.2026.09.11.08.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:41:58 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 03/15] arm64: implement thread identity handoff
Date: Fri, 11 Sep 2026 09:40:53 -0600
Message-ID: <20260911154148.644489-4-axboe@kernel.dk>
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

Implement the arch_thread_handoff_*() hooks and select
ARCH_HAS_THREAD_HANDOFF.

The source is inside a syscall, so only the FPSIMD view of the vector
registers needs to move. Tasks with SME streaming mode or ZA enabled,
compat tasks, tasks with a guarded control stack and tasks trapping
counter-timer access are refused.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 arch/arm64/Kconfig          |   1 +
 arch/arm64/kernel/process.c | 109 ++++++++++++++++++++++++++++++++++++
 2 files changed, 110 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b5a51b0ef944..a919570c80cd 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -46,6 +46,7 @@ config ARM64
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_HW_PTE_YOUNG
 	select ARCH_HAS_SETUP_DMA_OPS
+	select ARCH_HAS_THREAD_HANDOFF
 	select ARCH_HAS_SET_DIRECT_MAP
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_FORCE_DMA_UNENCRYPTED
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 581f80e9b9b7..e669a2717106 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -11,6 +11,7 @@
 #include <linux/elf.h>
 #include <linux/export.h>
 #include <linux/sched.h>
+#include <linux/thread_handoff.h>
 #include <linux/sched/debug.h>
 #include <linux/sched/task.h>
 #include <linux/sched/task_stack.h>
@@ -1003,3 +1004,111 @@ int set_tsc_mode(unsigned int val)
 
 	return do_set_tsc_mode(val);
 }
+
+#ifdef CONFIG_THREAD_HANDOFF
+/*
+ * Thread identity handoff. The source is inside a syscall, so only the FPSIMD
+ * view of the vector registers needs to move. SME state is refused.
+ */
+static bool thread_handoff_task_ok(struct task_struct *tsk)
+{
+	if (is_compat_thread(task_thread_info(tsk)))
+		return false;
+	/* the GCS is per-thread and would have to move along */
+	if (task_gcs_el0_enabled(tsk))
+		return false;
+	/* counter-timer trapping doesn't move, see update_cntkctl_el1() */
+	if (test_tsk_thread_flag(tsk, TIF_TSC_SIGSEGV))
+		return false;
+	return true;
+}
+
+bool arch_thread_handoff_allowed(struct task_struct *tsk)
+{
+	return thread_handoff_task_ok(tsk);
+}
+
+bool arch_thread_handoff_compatible(struct task_struct *src,
+				    struct task_struct *dst)
+{
+	return thread_handoff_task_ok(dst);
+}
+
+/* sync the live user state, fpsimd_syscall_enter() guarantees FPSIMD format */
+bool arch_thread_handoff_prepare(void)
+{
+	struct thread_struct *thread = &current->thread;
+
+	fpsimd_preserve_current_state();
+	tls_preserve_current_state();
+	if (system_supports_poe())
+		thread->por_el0 = read_sysreg_s(SYS_POR_EL0);
+
+	if (WARN_ON_ONCE(thread->fp_type != FP_STATE_FPSIMD))
+		return false;
+	/* ZA and streaming mode state doesn't move, for now */
+	if (thread_sm_enabled(thread) || thread_za_enabled(thread))
+		return false;
+	return true;
+}
+
+/* copy the user register state over, load what the return to user won't */
+int arch_thread_handoff_finish(struct task_struct *src, bool leader)
+{
+	struct task_struct *dst = current;
+	struct pt_regs *regs = task_pt_regs(dst);
+	struct frame_record_meta stackframe = regs->stackframe;
+
+	/* the syscall frame, this is what the return to userspace restores */
+	*regs = *task_pt_regs(src);
+	regs->stackframe = stackframe;
+
+	/*
+	 * Marks our FP state foreign so nothing saves over what's copied in
+	 * below, and frees the SVE/SME buffers, the vector lengths may differ.
+	 */
+	fpsimd_flush_thread();
+
+	preempt_disable();
+
+	dst->thread.uw = src->thread.uw;
+	dst->thread.fp_type = FP_STATE_FPSIMD;
+	memcpy(dst->thread.vl, src->thread.vl, sizeof(dst->thread.vl));
+	memcpy(dst->thread.vl_onexec, src->thread.vl_onexec,
+	       sizeof(dst->thread.vl_onexec));
+	dst->thread.svcr = src->thread.svcr;
+	dst->thread.tpidr2_el0 = src->thread.tpidr2_el0;
+	dst->thread.por_el0 = src->thread.por_el0;
+	dst->thread.sctlr_user = src->thread.sctlr_user;
+#ifdef CONFIG_ARM64_MTE
+	dst->thread.mte_ctrl = src->thread.mte_ctrl;
+#endif
+#ifdef CONFIG_ARM64_PTR_AUTH
+	dst->thread.keys_user = src->thread.keys_user;
+#endif
+	update_tsk_thread_flag(dst, TIF_SVE_VL_INHERIT,
+			       test_tsk_thread_flag(src, TIF_SVE_VL_INHERIT));
+	update_tsk_thread_flag(dst, TIF_SME_VL_INHERIT,
+			       test_tsk_thread_flag(src, TIF_SME_VL_INHERIT));
+	update_tsk_thread_flag(dst, TIF_TAGGED_ADDR,
+			       test_tsk_thread_flag(src, TIF_TAGGED_ADDR));
+	update_tsk_thread_flag(dst, TIF_SSBD,
+			       test_tsk_thread_flag(src, TIF_SSBD));
+	if (test_and_clear_tsk_thread_flag(src, TIF_MTE_ASYNC_FAULT))
+		set_tsk_thread_flag(dst, TIF_MTE_ASYNC_FAULT);
+
+	/* load what __switch_to() would have, FPSIMD gets restored on exit */
+	write_sysreg(dst->thread.uw.tp_value, tpidr_el0);
+	if (system_supports_tpidr2())
+		write_sysreg_s(dst->thread.tpidr2_el0, SYS_TPIDR2_EL0);
+	if (system_supports_poe())
+		write_sysreg_s(dst->thread.por_el0, SYS_POR_EL0);
+	contextidr_thread_switch(dst);
+	ptrauth_thread_switch_user(dst);
+	mte_thread_switch(dst);
+	update_sctlr_el1(dst->thread.sctlr_user);
+
+	preempt_enable();
+	return 0;
+}
+#endif
-- 
2.55.0

