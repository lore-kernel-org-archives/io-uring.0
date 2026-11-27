Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795811105;
	b=iXGXUIpo03u8BoGbJhzYsBTNGLWWtilQzZgwg2YS9V8/a96nQ4cwOtpBQnI2EKSRSafH
	 XLb94V6z+u5motpY2aTRdCHhftMB4kDNoiF1+vVWtiv9ovqR4bJwas3KqayM5lr8IcMd2
	 mD7Tw/TXJtl6YAoOUa6rv34qQmK8i/X9PeUmmItB6P2yPMOdLlIvyt6PKSWwI4jQOzd5G
	 PaU80fP0pqR893Fx52JeinGqEHtYiTiTKBDJcU5NOAUZCHAM/OzybsSMZplIqz8zlI7wE
	 3cwwUmampk7vNuxW4a9+66VD7lrOc3/j/sC4S0pEUxjTsun2cy0ZkMqbtm9UKvMTeMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795811105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=0lc9MOGPDSKIhfD/8I8XAgDnnJUpIx7E8T5SmGUX9bY=;
	b=acVY55OAwTk9NsX1WauJ5kbuNoDjcT34aTfgVoD6q/rncayxpHJf/06gJGGzGRcunXf4
	 kZ03PlqX7jdc2xd7s19PTs7F4qJ1y/DPd6u3GHX09KkfRxXuKn6AWdqnzek8Hr06YuGXm
	 yLh+LwheYX7m/X8yo6qUdkdLX9GSz28TnnxPep+yuqId2iRnA4jkBPtF9jRxqDlUDG1A3
	 Ag3TCD+JQJ1s7NtZqKlMqRkQk4ItBHEHjmoBeHH6WXDVyZKO1SlhILHejq6CyQixBumka
	 zH5VzyXlJRGQh4Wfe09lISzgJ4jEvOB4bkokdgw8MmeqrdIXy7QM0WCDA3F0Hu/fiMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PfFqoSZx;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FCB606A31C
	for <io-uring@vger.kernel.org>; Fri, 27 Nov 2026 20:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1FCB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PfFqoSZx
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1aefd1bf74aso4830399c88.1
        for <io-uring@vger.kernel.org>; Fri, 27 Nov 2026 12:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795811104; x=1796415904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0lc9MOGPDSKIhfD/8I8XAgDnnJUpIx7E8T5SmGUX9bY=;
        b=PfFqoSZxhW+HrfhV3VCqv5REPEcdGiU/tqVO9RlNvg3J++6LreWKZzTliJ4xdq9nbi
         ZYsnZRNCb7k/wkq7qWSTFsHVZXcmyKgvXmuPR8jrelXVgIVOlgP4eLZmzHOwFcvLlo+D
         iBqupQ1A/6t+CMQ4I8tvtoIFhjtnbzEvbyk29F5A51P6QULvbuf/kr0IVtQzKw7keMVh
         OShNlaQbACT164UcX08Su7yeFFwDF3Rkx4k6brE+Q0b5g1PVEsN8gOzjjSTUCCDJSjzb
         PPIEmjZ/3ARte1rQcOBmP44+H/8UD+HeltVUjwRQrpaxVfL42fCm0bNZ4UkrCdVX8frp
         nYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795811104; x=1796415904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0lc9MOGPDSKIhfD/8I8XAgDnnJUpIx7E8T5SmGUX9bY=;
        b=gs8f53K1UCkRhWmDo+lBdHmMaI+vpZit5YyXFEev9xCukv6RgfqyUi/QNEJqzKISKa
         I1H60rxlPbmauGpLMLs8klfuG+arHctLt+MuuTRALL/cD9Ez636jUGDajpZeAf1a0aah
         UW4So434bZb63XSHEnX2Y+fJCOFM0AS3L1RiSiudXCntgFC3SKKt78nkRKcvcXmGimf7
         AUWbv2z51EiRkcNsv2yixp8Bz5XTvUsN2w56VJZXj9GgQ+k8XV3nOPH2rOxQSGAlsniL
         qAQ2Ts1WlJiNx0rl6e++Y6zKCOr3VFEgL5NfQIopGXBsL6n3YbLQLIBBr27seijl02D+
         TCDQ==
X-Gm-Message-State: APuU4Z/ymeoT8k/Y0hO+2BpVx0S2p3TK0YOqHzjZSY0tHWi2t5i7uTUf
	lylufVGHJBySzBN7QJADBr+K0IfasE/AKCpCWU4HmNXUT+nnpdttMj5qi02j2Q==
X-Gm-Gg: AZFdTZdod9BVF2bMHJYWMj+GZ4sG/s/vKApDuWLIM9Gf/JvfeYeJkpjMrtnUQmPEyBs
	he7obarCLDft4yUGL8xyFLllGIZHsfFL47aEw0ejYC/K0jDREuVyUPovKSTx6fyfRVC9muTcZP9
	kDWWk+Yfwc//1XJuHY38xJuZwqlzlSVISx8Dm2YkwH70hnA6qcBCVdcKPcTqfHfY7ANGk6Kb1Np
	jXebc6uS9koXL6zKwYHFArGlVgW7zXjzG0MC95K9fk3irnKu2nk5BiBd8YwoHltjvXhdpWfIyPQ
	TJNYm9GkKIy+L4LCG9kDA+SJZ6QH7/Kaiwn4cSlqjmied8kkZjCXSTCVIe9onCHUMTMWKw+qe07
	lFWMJrkmgvYJFxNWhK7LYGzYwvMAuV2zvbjuPSCWahawNlON9KMxNly1WxP+GKU7mfOSam7xSFV
	SOADLv82a+HubW7hJGhl17id6AfjbSovRqOLu+BFq4+wuHlGCtsDPmXBWbcOlKsY9Z14qgTYGI7
	7ogcMpI9D0CJhvUY/+nevZqU32oFn1Cr2s/tPy0MGwpk+3wrxwK0a2YiCCRDpE2BVn8GeIFwO74
	rxRoLUGo8VMXtTPQFgTW/PZ9zLT8CGnQuJV2XoQkmLUawqylvB2fItUGkLNNidEPkQTL+iWN50F
	2ztS9BIjbOVAl+mewl37K8gLKSTqvOmPilKKFVGNWn30bV6tEGxy/F9sRapwY+bKogTXRZx20HT
	2fl5rr61vqHUgVf/eF8ZE6jLL+iorLvNCvZ0x34LqaX7pF5CqRdsyftCVrKIKBPN4HypC+RSPlF
	ptImLSX+687z589w4HCChiVTuuvVaXrbZXeCAB+xS1k2fPIrAKwEgz+jW5MprPO3B03FkCU9o++
	L5bywwJhC6PD6/NQiaafYUo824fRIqBTnfAM8PE=
X-Received: by 2002:a05:7022:f90b:b0:1b2:6d4d:9d8a with SMTP id a92af1059eb24-1b56f36d5fbmr16292048c88.2.1795811103862;
        Fri, 27 Nov 2026 12:25:03 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:5390:dae0:7063:f08:2b4a:6d9a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b59d8c0cafsm5639009c88.7.2026.11.27.12.25.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 12:25:03 -0800 (PST)
From: Artem Andreenko <miolini@gmail.com>
To: Pavel Begunkov <asml.silence@gmail.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	Artem Andreenko <miolini@gmail.com>
Subject: [RFC PATCH] io_uring/loop: add timeout support for BPF event loops
Date: Fri, 27 Nov 2026 12:25:02 -0800
Message-ID: <20261127202501.14163-2-miolini@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5838; i=miolini@gmail.com; h=from:subject; bh=HyLavzkMZRGZ0+1HQrWXkDxY39dfBKyvrkYSMt0zasE=; b=owJ4nJvAy8zAJebzwOiZnvnNTMbTakkM2ZzP5WalT/Q6G+T47sFbo1vCb7e13UxiK7Nzvup/a vu8TtMlE752TGRhEONisBRTZGlsnb9W//5n75gSN1uYOaxMIEOkRRoYgICFgS83Ma/USMdIz1Tb UM/QSMdAx5iBi1MApvrKU4b/TvM/PiwW/PX/u5RhoZvG7aDFQbdCbhy9K7G80X3e2z/XWxh+sy5 QXczjdMu58duRW473En7LTCluuXacK0iN/x93VOxxTgDQzlRF
X-Developer-Key: i=miolini@gmail.com; a=openpgp; fpr=81859FAD2FDFF34B5C74463D4CE032E62E37D969
Content-Transfer-Encoding: 8bit

Currently io_loop_wait() sleeps unconditionally until lp->cq_wait_idx is
reached, local work arrives, or a signal is pending. This makes it awkward
for BPF loop_step programs to implement adaptive min_wait, batching
deadlines, or periodic ticks without allocating and canceling
IORING_OP_TIMEOUT requests (which also pollute the CQ ring on expiry).

Extend struct iou_loop_params with:
- @flags: input control flags (currently IOU_LOOP_F_TIMEOUT_ABS; unknown
  bits fail the loop with -EINVAL).
- @timeout_ns: optional wait timeout in nanoseconds (0 with
  IOU_LOOP_F_TIMEOUT_ABS unset keeps the existing infinite-wait path).
- @wait_res: read-only output status populated by the kernel (0 on event
  wakeup or no sleep, -ETIME when the wait expired due to @timeout_ns).

Wait expiration uses schedule_hrtimeout_range_clock() against a snapshot
of ctx->clockid taken under uring_lock (with timens_ktime_to_host() for
absolute timestamps), only after checking for pending local work and
ready CQEs so the non-sleeping fast path does no extra clock reads.

Tested on arm64 QEMU with CONFIG_IO_URING_BPF_OPS=y, PROVE_LOCKING, and
DEBUG_ATOMIC_SLEEP covering relative timeouts, early CQE wakeups, future
and already-expired absolute timeouts, wait_res reset across iterations,
and invalid flag rejection.

Signed-off-by: Artem Andreenko <miolini@gmail.com>
---
Tool-assisted content note (per Documentation/process/generated-content.rst):
An AI coding assistant (Google Antigravity / Gemini) assisted with initial
source exploration, drafting the patch/changelog, and writing the standalone
arm64 QEMU BPF test harness. All changes were reviewed, audited for locking
and verifier constraints, built with W=1 (BPF_OPS=y and =n), and runtime-tested
under PROVE_LOCKING and DEBUG_ATOMIC_SLEEP.

Open questions for RFC feedback:
1. Should @timeout_ns / @flags persist across loop_step() calls (matching
   @cq_wait_idx) or be reset to 0 after each wait?
2. Is read-only @wait_res (-ETIME / 0) preferred over a status flag, and
   where would you prefer the selftest to live (tools/testing/selftests/bpf/
   or liburing)?

 io_uring/bpf-ops.c |  2 +-
 io_uring/loop.c    | 36 +++++++++++++++++++++++++++++++++++-
 io_uring/loop.h    | 22 ++++++++++++++++++++++
 3 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/io_uring/bpf-ops.c b/io_uring/bpf-ops.c
index 6c2a587fb..b7cfe7cd6 100644
--- a/io_uring/bpf-ops.c
+++ b/io_uring/bpf-ops.c
@@ -107,7 +107,7 @@ static int bpf_io_btf_struct_access(struct bpf_verifier_log *log,
 	const struct btf_type *t = btf_type_by_id(reg->btf, reg->btf_id);
 
 	if (t == loop_params_type) {
-		if (off + size <= offsetofend(struct iou_loop_params, cq_wait_idx))
+		if (off + size <= offsetofend(struct iou_loop_params, timeout_ns))
 			return SCALAR_VALUE;
 	}
 
diff --git a/io_uring/loop.c b/io_uring/loop.c
index 234045916..a5de19dda 100644
--- a/io_uring/loop.c
+++ b/io_uring/loop.c
@@ -1,4 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+#include <linux/hrtimer.h>
+#include <linux/time_namespace.h>
+
 #include "io_uring.h"
 #include "wait.h"
 #include "loop.h"
@@ -19,6 +22,12 @@ static inline void io_loop_wait_finish(struct io_ring_ctx *ctx)
 static void io_loop_wait(struct io_ring_ctx *ctx, struct iou_loop_params *lp,
 			 unsigned nr_wait)
 {
+	enum hrtimer_mode mode = HRTIMER_MODE_REL;
+	clockid_t clockid = ctx->clockid;
+	bool has_timeout;
+	ktime_t expires;
+	int ret = -EINTR;
+
 	io_cq_wait_arm(ctx, nr_wait);
 
 	if (unlikely(io_local_work_pending(ctx) ||
@@ -28,10 +37,31 @@ static void io_loop_wait(struct io_ring_ctx *ctx, struct iou_loop_params *lp,
 		return;
 	}
 
+	has_timeout = lp->timeout_ns || (lp->flags & IOU_LOOP_F_TIMEOUT_ABS);
+	if (has_timeout) {
+		expires = ns_to_ktime(min_t(u64, lp->timeout_ns, KTIME_MAX));
+		if (lp->flags & IOU_LOOP_F_TIMEOUT_ABS) {
+			expires = timens_ktime_to_host(clockid, expires);
+			if (ktime_compare(io_get_time(ctx), expires) >= 0) {
+				io_loop_wait_finish(ctx);
+				lp->wait_res = -ETIME;
+				return;
+			}
+			mode = HRTIMER_MODE_ABS;
+		}
+	}
+
 	mutex_unlock(&ctx->uring_lock);
-	schedule();
+	if (has_timeout)
+		ret = schedule_hrtimeout_range_clock(&expires, 0, mode,
+						     clockid);
+	else
+		schedule();
 	io_loop_wait_finish(ctx);
 	mutex_lock(&ctx->uring_lock);
+
+	if (!ret)
+		lp->wait_res = -ETIME;
 }
 
 static int __io_run_loop(struct io_ring_ctx *ctx)
@@ -50,6 +80,10 @@ static int __io_run_loop(struct io_ring_ctx *ctx)
 		if (step_res != IOU_LOOP_CONTINUE)
 			return -EINVAL;
 
+		if (unlikely(lp.flags & ~IOU_LOOP_F_MASK))
+			return -EINVAL;
+
+		lp.wait_res = 0;
 		nr_wait = io_loop_nr_cqes(ctx, &lp);
 		if (nr_wait > 0)
 			io_loop_wait(ctx, &lp, nr_wait);
diff --git a/io_uring/loop.h b/io_uring/loop.h
index 4dd4fb3ae..39bacc389 100644
--- a/io_uring/loop.h
+++ b/io_uring/loop.h
@@ -4,12 +4,34 @@
 
 #include <linux/io_uring_types.h>
 
+enum {
+	IOU_LOOP_F_TIMEOUT_ABS		= 1U << 0,
+};
+
+#define IOU_LOOP_F_MASK			IOU_LOOP_F_TIMEOUT_ABS
+
 struct iou_loop_params {
 	/*
 	 * The CQE index to wait for. Only serves as a hint and can still be
 	 * woken up earlier.
 	 */
 	__u32			cq_wait_idx;
+	/*
+	 * Wait control flags (IOU_LOOP_F_*).
+	 */
+	__u32			flags;
+	/*
+	 * Optional wait timeout in nanoseconds. Zero with
+	 * IOU_LOOP_F_TIMEOUT_ABS unset disables the timeout. Persists across
+	 * loop_step() iterations until modified by the BPF program.
+	 */
+	__u64			timeout_ns;
+	/*
+	 * Output status from the previous wait (read-only for BPF):
+	 * 0 if woken by events/work or no wait occurred, -ETIME if the wait
+	 * expired due to @timeout_ns.
+	 */
+	__s32			wait_res;
 };
 
 enum {
-- 
2.54.0 (Apple Git-157)

