Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795814406;
	b=ulUv0zsIt4rL2nBODMXZiuBUh5uYNZbA4vi/phDyQxDQsxGbciyUGC9mH8qsuHAHPlsH
	 i4/kwrNHb9N9Qz874PwjKGEIdxkSc9jBAfTiBo9DsGS3uz4meR1oRCtasDRU6eA0LNioY
	 Rnr1qWoUH4IolIj212holydY/nf/5A56x8jiWJvLd8hpG6QjVFx+STdEsqhcKbrgFlctv
	 pMIcbWg1UwMwQLfWMagsBSeTpNMGXonkPzaARdqq0TICHmWv5Hb/6NIe3J5UdZwwpOwho
	 2AF1Ijj33HA9x1O6jGpRoZ8POUhHOOWcANbop/llVxWsaWO5tADNZhsRULxwMrvKK4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795814406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=2dW2z3k8o1pkbKHoHm4iRnTak/JxM+/ZqXOdEFc9om0=;
	b=Ec62tdr2DRSBnI2Q5JIxLNWnToF8gKCS+gxtaVxUJAyRQt6a+yidjn7v0NVdu0ByBQV8
	 AS/2Ek04Hz1LueAgC8wGSr9qzUkHXTjB6cmT7Ud+gEW64sM1HW6yBl07sX8q1L5SSFqEP
	 Wd7Mv2QNSUg/FhM74XiyTgErlR54rAUXgEWI7r7xwlWUr2tJBbfbFxVSg/5ggZGIy/2Iq
	 OFVrprBwQCO/qBdrDiiLMOdO/RiemqmZ7Ut2DeoNzzVOXwKpdM4VssNV3XBdS8wWMnzh4
	 1jD9wj8sSITh7WzELY4pu24+9uz2MCn+7Qegga70hav8B8j8XfDSknOWUwhxVFhWbVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qW5rj8M5;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD309606A323
	for <io-uring@vger.kernel.org>; Fri, 27 Nov 2026 21:20:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD309606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qW5rj8M5
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-386d1859e1cso2718145eec.0
        for <io-uring@vger.kernel.org>; Fri, 27 Nov 2026 13:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795814405; x=1796419205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2dW2z3k8o1pkbKHoHm4iRnTak/JxM+/ZqXOdEFc9om0=;
        b=qW5rj8M59qNlV7SRFSa4eGjbtsrG8OMWVe8/cLmSi+mh6Z/0L7MWwZRTq5ESeQyEYI
         EeX4O3y5BCUZOkXXlD0ifHDAprVFsRUzq/siCI6NOtDuh3ISeYYMBq6O4hKmpVOH+xQi
         U5/GHwhxPjT2teYQ79RNaKHhx3EoLSW92id6vxrCIHgxOxpfR44FjX9xSfweVDhJBkwS
         yAiV2sYyE4KoWhf8jvwqVtC+9xvQj2amaQ+noRMTtnP+dONsnoTFYL/07ple0KRKUHbg
         /kXAkkM032Jo84pplXdf9Fte9pcq782DSTOjBrZq+X8H4vLHthKOFTMTJxcCwr4xsasv
         mBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795814405; x=1796419205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2dW2z3k8o1pkbKHoHm4iRnTak/JxM+/ZqXOdEFc9om0=;
        b=SmtHZ5rKaYCUEQ01AcyywKrFFKwLMevq5qgEzV6IbXJ4v6TFyQb7QBRNNzfNwiOwEo
         dovmn8I3tg4WW5B/p0Ry18bmx5TsxfSiHY+iPhUR0OT1tWf/N7eGmW2ucAgJLcB8mpkm
         42K2stxNfmbtsqYoGmOdatHdzU0sUtKXp7mLVtbH+dJwZIBbHEzHTW2ppQPWtB6U5M9C
         Oc5hbk7ZzicQ2sxrPNutAo35uGjJEuDHyzFzeZfVDgLxHLpeBerxFGlb/J0NR1NZl0dv
         O7AgI1U+iUTyIeZHUs4lfwZ0mZGjIYou9RgzcRXG5/WLQLaetmjJoxDoUOHgeKuTKVMC
         xvhw==
X-Gm-Message-State: APuU4Z9XBWZ6VoRZ4wK5nV2PZTmHDS12eMI3FC6pGHobnEH/s9LrHf1R
	lPN4gDZ+/4/cUtz53VoL34pCz5i/u9lLOtshZmDd4DuPSuYlZCohaAvv
X-Gm-Gg: AZFdTZe+539XGJYgfbU/nFxkJ2V9g8vWxOskymAqUHL0LvRmVtWgmU3Jr2aPqcDU+mY
	zeVo6vLFuHuMMIaZIX3qK5eB7e4tpj/wjWziJem1pms/SZGyrQm7jChNaidMFTLkSffnyvzPzHS
	cNRZVnD72pcY4putIFJ9qMJM2qReINmI3wIXUrz9fLpUP9Ys80l3+W4LNVa6y3L0MOaMwTSrlCW
	TAsOv55o2Tp1MgI+J9mh3LQdiRrL2+v0Lrdq1cvqsJ/uJHXvv7MmgAdOj+JKRvsvOfxpykQjS+Q
	4xdhy05HJHBXJruOVnx/QX0RDNrejvTVw2+mXZ2WDqTmFxiVQAWVgn8ssbbMl9crFcW1NhNSnpW
	Vvo3uOuWDyACJ4Hf6VodpTokYHzd4SyDI584iHwjmBw49fHB68H8JdpuNatzJsTAbxzJClHwWZ6
	kgAVrvne/bOsGX7JkhVV0XsAyQPXgek5+Qm3D8C6FgLchYr2WDCsm9wUcXSBnTz2T4mYpW1fY4U
	Ry/dH5IZzmF00y58ywK0ossQ5eg6t0EL9awajx6Jnmo3SSnPZXH6Vi6lH322LYeEp5ZfXC05cYi
	f3rGzIEZWhunIHrLt39GROLemig55px7oHejJFIj7nju4qYagh8wtGRQ6n9xgxzGuyyAkmYufOC
	TKWqcD2gKzMmCmlKPnz8fC/hIWgpqUolSTNaGUtVUFsa+fklNE4K+s7pnJ1FexxexM4YOqDTlNV
	3pRFPl+G4fHOwqhZHi5fE4vONIPFBuKPg7k9xemaTqMAbccHvcCHRYdi8PSeMfiqbZq/Hm1Fiqs
	LCJ3u4KuUPfIsZKHbV50eXZjD6wTIEoN0ce4wOSdraobBL3h3vRbWa8hBXImsEbrFbTKjKtNJTY
	h35zfUOA/1Q35n26Ww==
X-Received: by 2002:a05:7301:4283:b0:386:96fb:28c with SMTP id 5a478bee46e88-38696fb2022mr25297272eec.18.1795814404866;
        Fri, 27 Nov 2026 13:20:04 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:5390:dae0:7063:f08:2b4a:6d9a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm73804236eec.15.2026.11.27.13.20.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 13:20:04 -0800 (PST)
From: Artem Andreenko <miolini@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Pavel Begunkov <asml.silence@gmail.com>
Cc: io-uring@vger.kernel.org,
	Artem Andreenko <miolini@gmail.com>
Subject: [RFC PATCH 1/2] io_uring: snapshot clockid per wait and drop clock_offset
Date: Fri, 27 Nov 2026 13:20:03 -0800
Message-ID: <20261127212001.18516-5-miolini@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261127212001.18516-4-miolini@gmail.com>
References: <20261127212001.18516-4-miolini@gmail.com>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5459; i=miolini@gmail.com; h=from:subject; bh=XCF5x6HVbQ5rMT3PUK9K7x3wg71hGhFOVX+mdSjN99Q=; b=owJ4nJvAy8zAJebzwOiZnvnNTMbTakkM2ZxfGMsepyz3bV+zbtHZg7Ha38KT/rTtn3rxR/qmd H92bxPt5Uc7JrIwiHExWIopsjS2zl+rf/+zd0yJmy3MHFYmkCHSIg0MQMDCwJebmFdqpGOkZ6pt qGdopGOgY8zAxSkAU907nZGh78dy96uvHcSajho6B2qelZkxe5XLo3tpauHLu1yW3214xPC/tsL n8KoPu5eXCdxftszn+e4l5hxBSzhuXmvkKGrgYijmBAAlLFEg
X-Developer-Key: i=miolini@gmail.com; a=openpgp; fpr=81859FAD2FDFF34B5C74463D4CE032E62E37D969
Content-Transfer-Encoding: 8bit

io_register_clock() updates ctx->clock_offset and ctx->clockid under
ctx->uring_lock, while io_cqring_wait() and __io_napi_busy_loop() read
them without holding uring_lock. A concurrent IORING_REGISTER_CLOCK call
can cause a waiter to observe mismatched clockid and clock_offset values
or switch clocks mid-wait.

Since the timekeeper offset is a direct 1:1 function of ctx->clockid,
drop ctx->clock_offset from struct io_ring_ctx, pass clockid directly to
io_get_time(), update ctx->clockid with WRITE_ONCE(), and snapshot
iowq.clockid = READ_ONCE(ctx->clockid) once per io_cqring_wait() cycle so
start_time, timens conversion, NAPI busy polling, and hrtimer setup all
use a consistent clock.

Signed-off-by: Artem Andreenko <miolini@gmail.com>
---
 include/linux/io_uring_types.h |  1 -
 io_uring/io_uring.c            |  1 -
 io_uring/io_uring.h            | 11 +++++++----
 io_uring/napi.c                |  3 ++-
 io_uring/register.c            |  5 +----
 io_uring/wait.c                |  9 +++++----
 6 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/include/linux/io_uring_types.h b/include/linux/io_uring_types.h
index 1468bcb02..3ffece450 100644
--- a/include/linux/io_uring_types.h
+++ b/include/linux/io_uring_types.h
@@ -347,7 +347,6 @@ struct io_ring_ctx {
 		struct percpu_ref	refs;
 
 		clockid_t		clockid;
-		enum tk_offsets		clock_offset;
 
 		enum task_work_notify_mode	notify_method;
 		unsigned			sq_thread_idle;
diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index be5a4f950..e44bf416b 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -3252,7 +3252,6 @@ static __cold int io_uring_create(struct io_ctx_config *config)
 		return -ENOMEM;
 
 	ctx->clockid = CLOCK_MONOTONIC;
-	ctx->clock_offset = 0;
 
 	if (!(ctx->flags & IORING_SETUP_NO_SQARRAY))
 		static_branch_deferred_inc(&io_key_has_sqarray);
diff --git a/io_uring/io_uring.h b/io_uring/io_uring.h
index c8592f4ef..b2808222e 100644
--- a/io_uring/io_uring.h
+++ b/io_uring/io_uring.h
@@ -134,6 +134,7 @@ struct io_wait_queue {
 	unsigned cq_min_tail;
 	unsigned nr_timeouts;
 	int hit_timeout;
+	clockid_t clockid;
 	ktime_t min_timeout;
 	ktime_t timeout;
 	struct hrtimer t;
@@ -578,12 +579,14 @@ static inline bool io_is_uring_cmd(const struct io_kiocb *req)
 	       req->opcode == IORING_OP_URING_CMD128;
 }
 
-static inline ktime_t io_get_time(struct io_ring_ctx *ctx)
+static inline ktime_t io_get_time(clockid_t clockid)
 {
-	if (ctx->clockid == CLOCK_MONOTONIC)
+	switch (clockid) {
+	case CLOCK_BOOTTIME:
+		return ktime_get_boottime();
+	default:
 		return ktime_get();
-
-	return ktime_get_with_offset(ctx->clock_offset);
+	}
 }
 
 enum {
diff --git a/io_uring/napi.c b/io_uring/napi.c
index 0724c6087..2871b416a 100644
--- a/io_uring/napi.c
+++ b/io_uring/napi.c
@@ -367,7 +367,8 @@ void __io_napi_busy_loop(struct io_ring_ctx *ctx, struct io_wait_queue *iowq)
 
 	iowq->napi_busy_poll_dt = READ_ONCE(ctx->napi_busy_poll_dt);
 	if (iowq->timeout != KTIME_MAX) {
-		ktime_t dt = ktime_sub(iowq->timeout, io_get_time(ctx));
+		ktime_t dt = ktime_sub(iowq->timeout,
+				       io_get_time(iowq->clockid));
 
 		/* an absolute timeout may have passed already */
 		dt = max_t(ktime_t, dt, 0);
diff --git a/io_uring/register.c b/io_uring/register.c
index 62f492e64..802cfd6a9 100644
--- a/io_uring/register.c
+++ b/io_uring/register.c
@@ -452,16 +452,13 @@ static int io_register_clock(struct io_ring_ctx *ctx,
 
 	switch (reg.clockid) {
 	case CLOCK_MONOTONIC:
-		ctx->clock_offset = 0;
-		break;
 	case CLOCK_BOOTTIME:
-		ctx->clock_offset = TK_OFFS_BOOT;
 		break;
 	default:
 		return -EINVAL;
 	}
 
-	ctx->clockid = reg.clockid;
+	WRITE_ONCE(ctx->clockid, reg.clockid);
 	return 0;
 }
 
diff --git a/io_uring/wait.c b/io_uring/wait.c
index 367d49d63..584f98b1a 100644
--- a/io_uring/wait.c
+++ b/io_uring/wait.c
@@ -170,7 +170,7 @@ static int __io_cqring_wait_schedule(struct io_ring_ctx *ctx,
 	 * only fire to return -ETIME. NAPI busy polling gets here like that.
 	 */
 	if (iowq->timeout != KTIME_MAX &&
-	    ktime_compare(io_get_time(ctx), iowq->timeout) >= 0)
+	    ktime_compare(io_get_time(iowq->clockid), iowq->timeout) >= 0)
 		return -ETIME;
 
 	/*
@@ -181,7 +181,7 @@ static int __io_cqring_wait_schedule(struct io_ring_ctx *ctx,
 	if (ext_arg->iowait && current_pending_io())
 		current->in_iowait = 1;
 	if (iowq->timeout != KTIME_MAX || iowq->min_timeout)
-		ret = io_cqring_schedule_timeout(iowq, ctx->clockid, start_time);
+		ret = io_cqring_schedule_timeout(iowq, iowq->clockid, start_time);
 	else
 		schedule();
 	current->in_iowait = 0;
@@ -250,14 +250,15 @@ int io_cqring_wait(struct io_ring_ctx *ctx, int min_events, u32 flags,
 	rings = NULL;
 	iowq.nr_timeouts = atomic_read(&ctx->cq_timeouts);
 	iowq.hit_timeout = 0;
+	iowq.clockid = READ_ONCE(ctx->clockid);
 	iowq.min_timeout = ext_arg->min_time;
 	iowq.timeout = KTIME_MAX;
-	start_time = io_get_time(ctx);
+	start_time = io_get_time(iowq.clockid);
 
 	if (ext_arg->ts_set) {
 		iowq.timeout = timespec64_to_ktime(ext_arg->ts);
 		if (flags & IORING_ENTER_ABS_TIMER)
-			iowq.timeout = timens_ktime_to_host(ctx->clockid,
+			iowq.timeout = timens_ktime_to_host(iowq.clockid,
 							    iowq.timeout);
 		else
 			iowq.timeout = ktime_add(iowq.timeout, start_time);
-- 
2.54.0 (Apple Git-157)

