Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF4C3BB48
	for <io-uring@vger.kernel.org>; Sat, 18 Jul 2026 02:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784341940; cv=none; b=GqKed1s6FYjxXHS4e6cAyUSZVL7mHt4xAFlKyHgD26Z32y61PvjhIQB16cCLBEkutm5PipY9UcoSyJyh3w6u+4k/7m2kg7eDBc6tCo6dMyAgQKYuCrr49FukHKS9gBEc1tXZrbZWWBfglwPKDmIEf97PY5uMifHkxB+7pSgcL1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784341940; c=relaxed/simple;
	bh=UBjifAaVdgaT4nCXd1LiSyxfY9xp/GZMgtvgu4cCe4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pf1VnamAYxlxdZOwL4Z0hzAevIrg09z6iLpeaiWuLR+kKj60HFn2uT+imxit7AxSj8yLWaFp8rwDnxkP6wQvah5sZDTQzHVDDkvoBCeaei0SEB01DalBe7Zc9M+zeirDr4r6Xpu14firEPBSXarrvhQMxA8EW/FYxx5szGr1wG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URxc2JVG; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URxc2JVG"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so8302292a91.0
        for <io-uring@vger.kernel.org>; Fri, 17 Jul 2026 19:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784341939; x=1784946739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6djaaK+pE6EqghcKFOgCVIbFFjhVtYMXvoV9CzqERQc=;
        b=URxc2JVGQ9bW4xpTQWaChTDrfEp3ty/BTnG+4Grn0PfDI5j1BapQLNimjdl4dADmsn
         wGhnifN1NrgWgGFokQoPOrAEfEkIo1iKGdcAonsAdDZLT0dlwvGq+Fl2dRdBgLD6Das+
         brBzta+beggt+ExBLVbTYRQQvugNpozKb6YLwrYBHzEjEk6T0YLFE6jon3IEE8QDbp4J
         05jAPt3Tt6bFC08FJwf0IJpMHKWCDMq8MfHKaep8sQEIv6C09KW0CI99ZBkHNIyJQh2Z
         q7njmvcV8ISODcoB6snT7jkbyV53VBN8Kqn/K82zXgL7H5Ga2fOeTYX9Kb9UHlKXCzgG
         H3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784341939; x=1784946739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6djaaK+pE6EqghcKFOgCVIbFFjhVtYMXvoV9CzqERQc=;
        b=DWEsy4RNygzD/StoTYqbB/3by9YFL1m52yU/kO7WARBAhrE8jQLnQ1SNsW4Gbhx3DY
         Ny5LKlHDTXRH0PIBXOvzPCBuH/w6rjLnQXzkt2dzdl0VSto7v+nFzQCL/g2obKxRfADf
         CHXsHaMkLRzRhWQdKoiKLXy4eRWo8eU5ZzMcWJBnKlljxSCuPZMS6g5lNoCMmNY+Dxi1
         XDzpawgQtMgsJiFbmq6FPRW1dds5FUuLil+ysHDngprrGGOPnOxFq/lV3WziZEq+sZBP
         C91TueqBeC8u7DyfOAgQTbIcqAmI4kE54UV//gMU0KflEBq2joCDRmkoto7wKE3U7EUs
         kp4g==
X-Forwarded-Encrypted: i=1; AHgh+RrH48mi2vxZ53WjEz1+7LYPs1Mtl5CuAUbhtKj5J1Cso0sYUOJgBoHNRoWlKF6d37LdxpHswAcE5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFgWFz+vG26SL+PtJs9p4N7rZojzCda7kXF0tfI6wud+c0nXBa
	EVOoAUCjjtPLMgsrsRUAoHovetAKCQBFo3Q7ZOj2I2HBhwv+8TvPElFZ58VxHg==
X-Gm-Gg: AfdE7cmWZT1/yu6FuUz6H8eUq7x8nES7j0okeuK6mzd4thOESj5skaugZYE8u5vLMrs
	8n6Q0A0OBeHVvDHsPl28MeNOwxM2KH6EWKf4Eqm3/or6CMTOkoHb31KSEeVEctR9sC6P9xuWIjl
	d75EHJNWzDMhy5NS2bcCFLSUIHz2U7umsE6x9SpvlRerBB3Nf/RTvlHq2ySCZtmu14K4YgQGAqv
	X7UyDJFDpvgZd0nUrh1Lu/eUbKZ5249PzujuRJxaX0DJx69ag3rrPNMEeECY1sOdbLew7RMwcts
	nNW/F0Z7xyXK8SvT27I9baJrKN8f+tpF7r5QF4KPUw9dhEIQQTrW2vcbzmCsZjt2+jb1i5VOpce
	YDDwWsgQkybdz8rRxm1r76zyUkuZK+2hP1ugF+GeAPzsCLPcYF7YcNZeHvKpj8fScoDrRYH4V1A
	12M8/WDc8iS1fjVfClXWqImNMsIZ8gURHnV6e79Q8xxOj9bhE+/nZt4lWsq10KJU3vbZ5EfHODi
	rtNEKn38Q==
X-Received: by 2002:a17:90b:5806:b0:381:f7a:2e0d with SMTP id 98e67ed59e1d1-38e4b585280mr5249679a91.33.1784341938431;
        Fri, 17 Jul 2026 19:32:18 -0700 (PDT)
Received: from DESKTOP-4AJO944.tail156a05.ts.net (ppp-49-237-35-39.revip6.asianet.co.th. [49.237.35.39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2de31a7sm9930014c88.15.2026.07.17.19.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 19:32:17 -0700 (PDT)
From: Woraphat Khiaodaeng <worapat.kd2@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Gabriel Krisman Bertazi <krisman@suse.de>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	io-uring@vger.kernel.org,
	Woraphat Khiaodaeng <worapat.kd2@gmail.com>
Subject: [PATCH] test: add io_uring bpf-ops double-registration regression test
Date: Sat, 18 Jul 2026 09:30:41 +0700
Message-ID: <20260718023041.1637-1-worapat.kd2@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87pl0l7g9q.fsf@mailhost.krisman.be>
References: <87pl0l7g9q.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exercise the io_uring BPF struct_ops registration path fixed by the
kernel commit "io_uring/bpf-ops: reject re-registration of an
already-bound ops".

The same io_uring_bpf_ops struct_ops map is registered twice. Between the
two BPF_LINK_CREATEs the ring_fd is repointed at a second ring, so the
second registration targets a different io_ring_ctx whose ->bpf_ops is
NULL and passes the per-ctx check; only the per-map ops->priv guard
rejects it. The test verifies the second registration is refused with
-EBUSY. On a vulnerable kernel it is accepted, the first ctx is orphaned
and its loop_step dangles into the freed struct_ops trampoline.

The test reuses the existing bpf test infrastructure and only checks the
registration result; it never triggers the dangling call.

Signed-off-by: Woraphat Khiaodaeng <worapat.kd2@gmail.com>
---
 test/Makefile                   |   2 +-
 test/bpf-progs/double_reg.bpf.c |  16 ++++
 test/bpf_double_reg.c           | 158 ++++++++++++++++++++++++++++++++
 3 files changed, 175 insertions(+), 1 deletion(-)
 create mode 100644 test/bpf-progs/double_reg.bpf.c
 create mode 100644 test/bpf_double_reg.c

diff --git a/test/Makefile b/test/Makefile
index d88a428..5f6794d 100644
--- a/test/Makefile
+++ b/test/Makefile
@@ -335,7 +335,7 @@ ifdef CONFIG_HAVE_CXX
 endif
 all_targets += sq-full-cpp.t
 
-bpf_test_srcs := bpf_nops.c bpf_cp.c
+bpf_test_srcs := bpf_nops.c bpf_cp.c bpf_double_reg.c
 bpf_progs := $(patsubst bpf_%.c, %.bpf.c, $(bpf_test_srcs))
 bpf_test_targets :=
 
diff --git a/test/bpf-progs/double_reg.bpf.c b/test/bpf-progs/double_reg.bpf.c
new file mode 100644
index 0000000..20617d0
--- /dev/null
+++ b/test/bpf-progs/double_reg.bpf.c
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include "../bpf_defs.h"
+
+char LICENSE[] SEC("license") = "Dual BSD/GPL";
+
+/* Minimal loop_step: the test only exercises registration, never runs it. */
+SEC("struct_ops.s/reg_loop_step")
+int BPF_PROG(reg_loop_step, struct io_ring_ctx *ring, struct iou_loop_params *ls)
+{
+	return IOU_LOOP_STOP;
+}
+
+SEC(".struct_ops.link")
+struct io_uring_bpf_ops reg_ops = {
+	.loop_step = (void *)reg_loop_step,
+};
diff --git a/test/bpf_double_reg.c b/test/bpf_double_reg.c
new file mode 100644
index 0000000..93c3f38
--- /dev/null
+++ b/test/bpf_double_reg.c
@@ -0,0 +1,158 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Regression test for the io_uring BPF struct_ops double-registration UAF.
+ *
+ * The same io_uring_bpf_ops struct_ops map is registered twice. Between the
+ * two BPF_LINK_CREATEs the ring_fd is repointed at a second ring, so the
+ * second registration targets a *different* io_ring_ctx whose ->bpf_ops is
+ * NULL and thus passes the per-ctx guard in io_install_bpf(). Only the
+ * per-map ops->priv guard rejects it. Without that guard the first ctx is
+ * orphaned and its ctx->loop_step dangles into the freed struct_ops
+ * trampoline (use-after-free, called from io_run_loop()).
+ *
+ * The test only checks that the second registration is refused with -EBUSY;
+ * it never triggers the dangling call.
+ */
+#include <linux/stddef.h>
+#include <errno.h>
+#include <string.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <sys/syscall.h>
+#include <bpf/libbpf.h>
+
+#include "liburing.h"
+#include "double_reg.skel.h"
+#include "helpers.h"
+
+#ifndef __NR_io_uring_setup
+#define __NR_io_uring_setup 425
+#endif
+
+#define CQ_ENTRIES 8
+#define SQ_ENTRIES 8
+
+static struct double_reg_bpf *skel;
+
+/* A bare io_ring_ctx fd is all the struct_ops .reg path needs (fget()). */
+static int mk_ring(void)
+{
+	struct io_uring_params p;
+
+	memset(&p, 0, sizeof(p));
+	p.cq_entries = CQ_ENTRIES;
+	p.flags = IORING_SETUP_SINGLE_ISSUER |
+		  IORING_SETUP_DEFER_TASKRUN |
+		  IORING_SETUP_NO_SQARRAY |
+		  IORING_SETUP_CQSIZE |
+		  IORING_SETUP_SQ_REWIND;
+	return (int)syscall(__NR_io_uring_setup, SQ_ENTRIES, &p);
+}
+
+static int test_double_reg(void)
+{
+	struct bpf_link *link1, *link2;
+	int ret, fd_a, fd_b, fd_keep;
+
+	fd_a = mk_ring();
+	if (fd_a < 0) {
+		if (fd_a == -EINVAL)
+			return T_EXIT_SKIP;
+		fprintf(stderr, "io_uring_setup: %d\n", fd_a);
+		return T_EXIT_FAIL;
+	}
+
+	skel = double_reg_bpf__open();
+	if (!skel) {
+		fprintf(stderr, "can't open skeleton\n");
+		return T_EXIT_FAIL;
+	}
+	skel->struct_ops.reg_ops->ring_fd = fd_a;
+
+	ret = double_reg_bpf__load(skel);
+	if (ret) {
+		if (ret == -ESRCH) {
+			printf("io_uring BPF ops are not supported\n");
+			return T_EXIT_SKIP;
+		}
+		if (ret == -EPERM || ret == -EACCES) {
+			printf("no permission to load struct_ops, skip\n");
+			return T_EXIT_SKIP;
+		}
+		fprintf(stderr, "failed to load skeleton: %d\n", ret);
+		return T_EXIT_FAIL;
+	}
+
+	/* reg #1: binds the ops to fd_a's ctx, ops->priv = ctxA */
+	link1 = bpf_map__attach_struct_ops(skel->maps.reg_ops);
+	if (!link1) {
+		fprintf(stderr, "first attach failed: %d\n", errno);
+		return T_EXIT_FAIL;
+	}
+
+	/*
+	 * Keep ctxA alive on another fd, then repoint fd_a at a brand new
+	 * ring (ctxB). ops->ring_fd still holds the integer fd_a, which reg
+	 * re-resolves with fget() on every call.
+	 */
+	fd_keep = dup(fd_a);
+	if (fd_keep < 0) {
+		perror("dup");
+		ret = T_EXIT_FAIL;
+		goto destroy1;
+	}
+	fd_b = mk_ring();
+	if (fd_b < 0) {
+		fprintf(stderr, "second io_uring_setup: %d\n", fd_b);
+		ret = T_EXIT_FAIL;
+		goto close_keep;
+	}
+	if (dup2(fd_b, fd_a) < 0) {
+		perror("dup2");
+		ret = T_EXIT_FAIL;
+		goto close_b;
+	}
+
+	/*
+	 * reg #2: reg re-resolves fd_a to ctxB (->bpf_ops == NULL, passes the
+	 * per-ctx check). It must be refused by the per-map ops->priv guard
+	 * with -EBUSY. If it is accepted, ctxA is orphaned and the kernel is
+	 * vulnerable.
+	 */
+	errno = 0;
+	link2 = bpf_map__attach_struct_ops(skel->maps.reg_ops);
+	if (link2) {
+		fprintf(stderr, "second registration was accepted; ctxA is orphaned (vulnerable)\n");
+		bpf_link__destroy(link2);
+		ret = T_EXIT_FAIL;
+	} else if (errno == EBUSY) {
+		ret = T_EXIT_PASS;
+	} else {
+		fprintf(stderr, "second registration failed with %d (%s), expected EBUSY\n",
+			errno, strerror(errno));
+		ret = T_EXIT_FAIL;
+	}
+
+close_b:
+	close(fd_b);
+close_keep:
+	close(fd_keep);
+destroy1:
+	bpf_link__destroy(link1);
+	close(fd_a);
+	return ret;
+}
+
+int main(int argc, char *argv[])
+{
+	int ret;
+
+	if (argc > 1)
+		return T_EXIT_SKIP;
+
+	ret = test_double_reg();
+
+	if (skel)
+		double_reg_bpf__destroy(skel);
+	return ret;
+}
-- 
2.43.0

