Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206068;
	b=sZ0cliVv/yWGjZ3MNAktLDwHO498crPdYKD+vBj0QGiYyIVDG0PEVSwUagFfDTcWjZWA
	 Xsl5m1hkSvzxKs2z056td2ztGb8QUlVAe6j9B7NVmS5lJT+4OOxwSfx6ydZkCeUJnPRxy
	 QsCeUW0ohBX3lJzkUNV8NDxJsMNfm52gwFkNRdEJxqxnT8EVgpC7UZEL66G5jPM2c0yZZ
	 CK7jHq9woAfw6fN8D4VZVMUOadU2MUfJzbRmsT4WGgGc1BbDTm0Xm0ZeYkqe+pF9TVeDf
	 QC570G78nNRYbjtgVG5omNpCGnkSYdSAiUevvcsDWhG/YBykqHMrImwHKd2Mu5xy3ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vRiyrxVkng7E0MgTKiyuvtx6z/1B7RyKSbbnlhlfPf8=;
	b=fbdjiWaW9pGvtq//RtdbSzM+ZJUlFqWXRhxGljGhav7QkxTAeRxudZa5kGQ3tqszA2HT
	 iGvOaZbXIcqnXaFU1L8cJi0N0QMw0V/s2JWctQ2zXK3mSIgJxmTtJ/TlnZ6XsMtrensB9
	 nuwA5rGEj0rzYBvOinTDmaORjx3XuPbKrI+/Z0AoT69tZNvCJKLW99qqSFSOK1/wzb9Ut
	 3Im8jiFIWk8KN3OGxpLOfMZI89SSlZssM7M/7JD58n63J2b7YfpS4CXf8QKc8D2XZUaNV
	 lqTRgJM1ouyc1WXGAu3MiEhq0W9+N4KyRHX4YW/C/L772cMsG9JKatdikNyb4zV1qeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Kz0nSRJM;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391F9606A334
	for <io-uring@vger.kernel.org>; Wed, 28 Oct 2026 16:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 391F9606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Kz0nSRJM
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-843b6f8e2c7so1414052a34.1
        for <io-uring@vger.kernel.org>; Wed, 28 Oct 2026 09:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793206067; x=1793810867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vRiyrxVkng7E0MgTKiyuvtx6z/1B7RyKSbbnlhlfPf8=;
        b=Kz0nSRJMOA7Il4PfnB1xnYIsmoxSHdVO/wIkIljxAPjZvZsiuVsiofUMOEqaug6mN8
         Akbdi/2hAbA7A4yn/WNsQEpr7hPemb661o+iL2MHc+ufum5/KwLhzgNqGk88po4vAKuQ
         08Mv1LrImWzaxv5y+6pW70W0MjW9EHFHO9+pAcCbJMBdUATrPJmxnEsu5Hlga4XxStR3
         ecu0c73LAWKXfzIsIuOwQt4I/bu/p7/3OGxrherCy2ZtazFMoFmOnW7rjNEfD6VYXV1n
         gVrxwYSx6/VxBRQSJ9x2b+xPOALZNXR1hNbWOUelU9BXFwCM2DvsuGLRSHdfjkrejs8/
         RPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206067; x=1793810867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vRiyrxVkng7E0MgTKiyuvtx6z/1B7RyKSbbnlhlfPf8=;
        b=Gn3LJnWlh4IhoEg/ds6JKn2Vs5Mck5keGvf4repsheH9Gfdrc9J29DupwFMwZt2PMv
         DQkqcqOZ/tKlftHFahsffPwP1docEqVbUIesm0EB2PB5VMP2oP1H32J73O4S4hNb7XQc
         1+/Zhcw36T7i+3AugBbphjaH7OeSjKzuPO6Gu4yOSbluGG+vcIxZE7XdGAo50iP4BPF1
         WtCfxcc3Tl79II8N7Jty+aleJxwmRQOMy1ohLVkF8cNWGL2DvOk+b1F4mQy0mKRXhV2I
         zGOP3m7J1gXtYuxkv0yJnpk0sRm5WQe+AoTpKbVYyXVVl/HBWHDcCkexa9rP3EiwR+wc
         NUdw==
X-Gm-Message-State: AFq9FYIvTEOcDu1X0zjKyMXYsBFnpTcrAZUuwlVF/JB2pxwQSCdmQFgZ
	gGUSzu8P8Hl9eZeY7usNNEpuSWLu3CGTdXZxXe6ENYCRPC/LuPlca1Z3jOdEH4znHzXNaJ2d0Bf
	81SFNEE0=
X-Gm-Gg: AYBFou05mDHw9UhPIsPQPFpulGG91r/fML7cIDNkarP/JD7NfJsGUcgGJeplVb7yanV
	PEk0Uftqi3jftCQHzYOC90FFqUEbkfwKXiABjVgjrGMrjMcvysJoTHHyJv8tcjrw3DetJHFkNOY
	JfzDHt3bMbPHrfvA/Eno+V1RaH4Qk5l0sgUdwyzla8PRe+qJWwnDsHjX3O+lR1OcHsDHNfZiC/i
	6rcbynb2QsHYK8m7OUF+IPXOvrvhR4nOkfg8glrMAqEhg3gBgqynZXYcNQWVpeqKwP7TZr3SzbT
	6kGyloc58aIQ2DB5fh1eZlqhZ7J2xp3WKjmxu69WZLTXnFzuGwle5GaCJo6OKZfoWXK//5vxd7F
	spyD+KN1M0ZV3ID5q25kfGklDil+zfIa23LZeahr1Bh6jaWYt6S1mPC/7FSeuFs0yraEwGMwOWZ
	9ItTu4FqLPbEhV9nZjGy4VBU3airXc6V1LXAS7OIhjrLwWCkvIG/WU5y0Ef5T/+u/BEO9BHWUOr
	8VjIRM8jQ86gEiSBnPE386otCV1p5S8ERiiY2GiI9en/agfdawMCUmejOzgG5npIbKJczpgP1bg
	SmiGHqJL4BETNq7Jn4whr4exhMdRpAtVd9IIV8FXq/sH5iXsY8a5k9lzerm/7i3czbxVdc2IwQ=
	=
X-Received: by 2002:a05:6830:4120:b0:826:1ccc:8bb9 with SMTP id 46e09a7af769-85ab7040645mr2606771a34.6.1793206067388;
        Wed, 28 Oct 2026 09:47:47 -0700 (PDT)
Received: from xps16 ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b206f8a41sm2019182a34.25.2026.10.28.09.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:47:46 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: Kyle Zeng <kylebot@openai.com>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 10/10] io_uring: defer foreign io-wq enqueues to task_work
Date: Wed, 28 Oct 2026 10:46:58 -0600
Message-ID: <20261028164732.1264069-11-axboe@kernel.dk>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028164732.1264069-1-axboe@kernel.dk>
References: <20261028164732.1264069-1-axboe@kernel.dk>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kyle Zeng <kylebot@openai.com>

An IOPOLL ring without DEFER_TASKRUN can be reaped by a task other than
the one that submitted the I/O. If a polled request is marked
REQ_F_REISSUE, io_free_batch_list() calls io_queue_iowq() with the
original tctx. Ordinary task exit can tear down tctx->io_wq after
draining only the tracked requests. The live request pins the task, but
not its io-wq, so the foreign task can race io_wq_put_and_exit() and
enqueue through a freed or NULL queue.

Forward foreign userspace enqueues to the owning task before accessing
tctx->io_wq. Use a dedicated task_work callback so reissues still go
straight to io-wq, and fail them if task_work is running in cancellation
mode. Preserve the existing PF_KTHREAD cancellation path. This also
covers the other callers of io_queue_iowq() without changing the
worker-owned enqueue path.

Signed-off-by: Kyle Zeng <kylebot@openai.com>
Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/io_uring.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 615933a6e8ff..03724419c4e1 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -423,6 +423,17 @@ static __always_inline bool io_assign_file(struct io_kiocb *req,
 	return !!req->file;
 }
 
+static void io_req_queue_iowq_tw(struct io_tw_req tw_req, io_tw_token_t tw)
+{
+	struct io_kiocb *req = tw_req.req;
+
+	io_tw_lock(req->ctx, tw);
+	if (unlikely(tw.cancel))
+		io_req_defer_failed(req, -ECANCELED);
+	else
+		io_queue_iowq(req);
+}
+
 void io_queue_iowq(struct io_kiocb *req)
 {
 	struct io_uring_task *tctx = req->tctx;
@@ -430,10 +441,17 @@ void io_queue_iowq(struct io_kiocb *req)
 	BUG_ON(!tctx);
 	lockdep_assert_held(&req->ctx->uring_lock);
 
-	if ((current->flags & PF_KTHREAD) || !tctx->io_wq) {
-		io_req_task_queue_fail(req, -ECANCELED);
+	if (current->flags & PF_KTHREAD)
+		goto cancel;
+
+	/* Only the submitter can safely access its io-wq during task exit. */
+	if (unlikely(current != tctx->task)) {
+		req->io_task_work.func = io_req_queue_iowq_tw;
+		io_req_task_work_add(req);
 		return;
 	}
+	if (!tctx->io_wq)
+		goto cancel;
 
 	/*
 	 * The file is looked up as late as possible, as it may be the result
@@ -462,6 +480,9 @@ void io_queue_iowq(struct io_kiocb *req)
 
 	trace_io_uring_queue_async_work(req, io_wq_is_hashed(&req->work));
 	io_wq_enqueue(tctx->io_wq, &req->work);
+	return;
+cancel:
+	io_req_task_queue_fail(req, -ECANCELED);
 }
 
 unsigned io_linked_nr(struct io_kiocb *req)
-- 
2.56.0

