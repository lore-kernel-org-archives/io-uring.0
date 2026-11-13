Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794601761;
	b=yKTY62WUM7Owhvik+oGTu9Dq0p6dQKiqw5dl4MOEwqByRUJNOmgDkSgHfTpaN9kvMP5+
	 hurwgeJRxn28LTyR7UIWKaamcVeVtiv2KO1lybjvbwC2COkgVfc4XCH7wvENo4iV2+a0l
	 Jdna7NB6ybmUFh/V4q/Uq3MPIwYyItcrRcJy+0R28LX7ktRTRp0rIFHEQBfcZLaEaDCWG
	 4FnnvN8Q7aBUFuuOocZShMHCfTxOjWvOUp1IC9/ENJMwE5z0bgFpVdcYJo6KIBZbkmNUQ
	 UzKUT4reI3mzB+J9plL6d2eBy/croDc9kb1SUoZejPP1fdDmykhJUpqinukbc29IpsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Content-Language:To:From:Subject:Content-Type:
	 Content-Transfer-Encoding;
	bh=eGK229zTl2YIYMYm17ryPYIBYFN9VGC2KfrPMFqV8wE=;
	b=g8OkcTrK4lCR5Jvm62SxL4Bqnl2jTTLNHfXExZRn31Tl5o4Wo06emnI95DahSVIEuCg3
	 FAdnD4r77UOE0L51xqKui+Z/2uov/SgdF4seCn5tSl+tSr76qMaWEtigV2TDA37x0fF4p
	 VNTl2Ywb9FbfDKdezSNCDPKCNQY2WTaLwIfC8jhPDT/XZrshGUhBYc54ipSSUv8C5ThNc
	 0REm6gD+rvZDOW9858vMOGm03wRo6YKGC+PWOV84ZHAvuh83P28vcNWLDokSWst4LIHdK
	 ZI2NG7xfrqt/kbeBJoiCJ7uqHXo3dyKLKQ0RHg38QTojExEs300SrLbR2ZR2MY/hTrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AJeLohf5;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34415606A333
	for <io-uring@vger.kernel.org>; Fri, 13 Nov 2026 20:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34415606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AJeLohf5
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b3b4bcbfc9so1314654c88.1
        for <io-uring@vger.kernel.org>; Fri, 13 Nov 2026 12:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794601759; x=1795206559; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eGK229zTl2YIYMYm17ryPYIBYFN9VGC2KfrPMFqV8wE=;
        b=AJeLohf5gcbRoXbPXvX59++uuDF4YnBieFI22p4LMioNj7ap+bSOLxEmdz7N4Qn5+f
         HbTat07fQ/s6Tyg42CdzHi8iH7/oEI/I05EKHVV+5OTFmtPYrY3S9u3dV54f1BfFf6FL
         9iLj/qkUqiF5rshX2+CEOUXIFHY5jL7T0KpFiECr8dlVD8y7pQx62qUoDWcsIqAqKMbh
         mEk2qYKwQuaWkSeoMjmQWjSpAPgwvWzYTgNksIQoTidmcdTGsbt7JZgtGZSQNcw9511B
         BPF71L+wQGV/vqdtye+L1WGWzNN/wXwA0LVdeMXZ1ctygy9eX8EagaagsiIRXcXZHiHM
         9IYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601759; x=1795206559;
        h=content-transfer-encoding:content-type:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGK229zTl2YIYMYm17ryPYIBYFN9VGC2KfrPMFqV8wE=;
        b=Gx6QUS+hEBkVsdoLgB0eiWmuP39BjsCr8pdLuXIpXTj+TA2eAuPLNvEiy1RdL9ic7q
         nzAkPs06x93uuIVpvQSLf1xL5L326n1ktf2KpkvvcWtYpTftkdGz7TDAl+MzUC9FDLs3
         Cd9fj6RSyyVOJ9c83Fkv2AEsQTUdecnNfSRXMVp1jH6dlyCmVezB7+Gsz8S0rgq634LL
         xHq4W7W+5u47RqHlKywtJ/iP8voA85bpIa/7vm76yJIWbPvy9CE98UYpT4l6IGMLsoz7
         rkGNibZFTRvfBdNt3GlYf171Z2kdYlW6/Oct/kRni9FNfUX9L8OkswHzms06Dy8UgaYX
         QTQA==
X-Gm-Message-State: APuU4Z9Oaf/klr1dsmlLmGYQL+jWavszoLPM4i/o2TDnBaIFpmGwF694
	jkxEdxu2DSz3jytGC9vW9NaHaCU/gWtEaTPlLReJz9sGLXTbGuiYsEIdESF0mD45TMI4HhC+cFQ
	wqEaBj/E=
X-Gm-Gg: AYBFou0uOYPHkjkFCIA75utCbhYF4bpwoz0S6d4Tx8UCUT2SirXPZetvlnq+ZBC8YM1
	p4DcQxR3Pf6wZMTBZPOnIOJPfRjMBnzJI/3AfyoAo2zmGR3wyuI9yNUrqxl3mmjI4UyN2DhQovg
	LDcbZS0XAfv5MmJqCrVKo/sRCJemXiB7kcgUOY2iT67HA4JSx1kPhpXiY2EZL8scX15kXCez5F5
	afbtlIJ28KBxaJERkToQIr/2+SqnwM6JiWlgS2yPsoXpTb2unBq5QczOPwsViBHa07nP1FKYlCf
	K77plT1XSPh44Jr+UVHTRBxpN2dy1EL22pcr5XGtjxQKmEsvG7NXk9B8Xo36XanvRDosxyDmQp8
	N9EyAWUODtbHS/IgHk0GWMMYPHj5/YAX0qfEpCqkrsIIcbItmSooC1/FJ1Vhg7cGePoVBPLWO/g
	Q2sh4Xv76Hy/1RiZEgk8WtMY1be76JC7Yzrr8PuN/5/SItV/5OLa3PYwzDAjt69BYGKb+oCaMen
	8eECB4thPUtV8g4FXQ+KmOp9PJ9IOXIE/o7Nk/hd//JI7jwTQhf4dhdep56nZKIZy5UzVuFQMou
	wPme/gS7ShI6R+Ltu/wbhhhiWgdHohIxL8P4QjvRYoEQ2SNfX/V2+Yws6FUeLpq2h/G79eMHHSr
	FRutRBrbzJul0
X-Received: by 2002:a05:7022:ea56:10b0:1b3:aceb:b8dd with SMTP id a92af1059eb24-1b50317aa00mr3572732c88.38.1794601759115;
        Fri, 13 Nov 2026 12:29:19 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795533170csm10023692eec.7.2026.11.13.12.29.18
        for <io-uring@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 12:29:18 -0800 (PST)
Message-ID: <c37d54df-93a6-408e-9ae4-e5d941a16106@kernel.dk>
Date: Fri, 13 Nov 2026 13:29:17 -0700
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: io-uring <io-uring@vger.kernel.org>
From: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] io_uring: don't run canceled local work from a foreign mm on
 release
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Since commit 89baa3154a72 ("io_uring: run cancelations synchronously on
ring release"), the task dropping the last reference to a ring runs the
first cancelation pass itself. For DEFER_TASKRUN, that includes running
the pending local work in cancel mode. That task need not be the one
that submitted the requests, a forked child holding an inherited ring fd
is one example.

Only run canceled local work from a task that shares the mm of the
submitter, or from a kthread like io_ring_exit_work() where such copies
fail.

Reported-by: Yingjie Wang <x-professor@outlook.com>
Fixes: 89baa3154a72 ("io_uring: run cancelations synchronously on ring release")
Signed-off-by: Jens Axboe <axboe@kernel.dk>

---

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 5db57bf675f0..39bb18b96cb9 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -2550,6 +2550,10 @@ static __cold void io_ring_ctx_wait_inflight(struct io_ring_ctx *ctx)
 	/* Only wait if this task has attached to the ring */
 	if (!tctx || !xa_load(&tctx->xa, (unsigned long)ctx))
 		return;
+	/* Requests may sit in local work that only exit work can run */
+	if ((ctx->flags & IORING_SETUP_DEFER_TASKRUN) &&
+	    !io_local_work_cancel_allowed(ctx))
+		return;
 	if (atomic_read(&tctx->in_cancel))
 		return;
 
diff --git a/io_uring/tw.c b/io_uring/tw.c
index 0b5066f97224..b4a9e28ce779 100644
--- a/io_uring/tw.c
+++ b/io_uring/tw.c
@@ -286,10 +286,11 @@ void __cold io_cancel_local_task_work(struct io_ring_ctx *ctx)
 	 * The work list consumer side is serialized by ->uring_lock, see
 	 * __io_run_local_work(). Grab it to guard against racing with normal
 	 * task_work running, as the task may be exiting. The ring is going
-	 * away, run the entries in cancel mode right here - the callers
-	 * provide the same process context the per-ctx fallback work that
-	 * they were previously punted to ran in.
+	 * away, run the entries in cancel mode right here, if allowed.
 	 */
+	if (!io_local_work_cancel_allowed(ctx))
+		return;
+
 	guard(mutex)(&ctx->uring_lock);
 
 	while (!mpscq_empty(&ctx->work_list)) {
diff --git a/io_uring/tw.h b/io_uring/tw.h
index 3ade5ad577fd..6bc69a234f05 100644
--- a/io_uring/tw.h
+++ b/io_uring/tw.h
@@ -88,6 +88,17 @@ static inline int io_run_task_work(void)
 	return ret;
 }
 
+/*
+ * Canceled local work may still copy to user memory. Only run it from a kthread,
+ * where such copies fail, or from a task that shares the mm of the submitter.
+ */
+static inline bool io_local_work_cancel_allowed(struct io_ring_ctx *ctx)
+{
+	struct task_struct *tsk = ctx->submitter_task;
+
+	return !current->mm || (tsk && current->mm == READ_ONCE(tsk->mm));
+}
+
 static inline bool io_local_work_pending(struct io_ring_ctx *ctx)
 {
 	return !mpscq_empty(&ctx->work_list);

-- 
Jens Axboe

