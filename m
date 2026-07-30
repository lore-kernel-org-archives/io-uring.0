Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482503A4267
	for <io-uring@vger.kernel.org>; Thu, 30 Jul 2026 18:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785437708; cv=pass; b=qr7aFRICBq+wi5UkO2MK7n2v/zhq2NoET6SxJlecIgMNawKSmsZjPmkdl8pM5blIK4GqMdADFKeE0cmVvq/y6Iz2gEFArS49pPNq9piFSs2iAxfd4bQ+5YPNo7/ukw2LVfXQDy/C6B3G/+QhFkVqmBPi3AMfkXtJtRfwFnETfH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785437708; c=relaxed/simple;
	bh=5YXmCpAaOk6QqxLkbcXfgNTAO2qfKu1DivCGNjzW1Hk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=rcI8Vb8uQePzs/GNNzIjNLCWPF53qDaTKSDyzaS1H98vsXXfl/MRrGQwBENjVgxeGk5nLEubWBd0czkuVT11ew+KO7WLX72tjNEDwi0WC5gd58WavUAsiwY+a3Npixefgm3yM1gpKaU4Wavrgh4xsBq0Jyw5VfVFWcgnQGIs400=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DkxjuprI; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DkxjuprI"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-69fdfd98eb8so25773a12.0
        for <io-uring@vger.kernel.org>; Thu, 30 Jul 2026 11:55:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785437701; cv=none;
        d=google.com; s=arc-20260327;
        b=L09clRjaUKR8Sr6twSZeooxi7EvliKaKuHmQtwbRN4xtED5KmfLKWmomgHbQUPpYZZ
         nBCepXzZ7A0ZFLcK83CQEd7IoOfX2QaC0CbtZmjwJr588o8Bs6zkJOAjcgJ8d093YK0T
         /IE43A+LtRFdMYIQg9k1VrSGuM7lW7Dkkbo5Dn9fpMUnzmmFNO1i25z68iaPYAdw7J5A
         oBkx0szZj/tQWQCJzOeqU1DRN/hH/t0M9JksiV+/+1fytyGHQqrgM2h/VSWSLXujQ+pM
         Os5+P1W7EwoHyRTamucd3Qx2/0KKJw18wN1vep4r+0ZQ3Ryj95p/HYllC/VlZ1zUdK0u
         /M+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=5YXmCpAaOk6QqxLkbcXfgNTAO2qfKu1DivCGNjzW1Hk=;
        fh=FDVRB7+meIoTEXlnmHY8/0cNJ3RuXpMoBdTxpkiNQ1g=;
        b=oZV7oKZdghrg3t+tyfacwvIRObf5HS2XPped3zuSYIMXUb/Nw+lFrd5Ii77rssMWHW
         PJ6UllD3QQ3bu3VIOf60KnqRDgNPI+dmYV2e4ylnUZVRpW1n+LhGYom+SqgQtgAcjAmH
         fI3qhER5KYtqLNF/Llz4hPoE0+/XUXJMMXycNSKE9Fhu9nda6+QphX16uVb31YCplXDq
         zNBOQxH+E/RoY+cyvoXjvnFY4qtydTB3LuBvM3HYmo7mgFr/iPEKOY6bfsV2ybCAFvSU
         yKk+lo04fGmHecwUGbJWP6PC7GXY/fZOOs20iTGvP03NkD8IZUJjBH+h+JKN8121kVNx
         ed0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785437701; x=1786042501; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5YXmCpAaOk6QqxLkbcXfgNTAO2qfKu1DivCGNjzW1Hk=;
        b=DkxjuprIVabGM0Pmd9TNb4byitvThIHjYVVvEeLbQ8xKafvCXMcvQ9KS8zpdgKsWSt
         ejg2DdTv1u4LKROoCAFrM0+KcLyJ49585Vkbc1I7OYe3C5ufasNcyBzSgzBml9PYzKFc
         UbHedi866vi46oBoc7ZBbxJrBowZoXAHxYPIMOoMosgW5qIQKuV3W2HlmmalzYjN+qsM
         v120GNqWsoL8qOoImjNbqtMbgnL8ncq3hIXTdihZPz4QAU0F03+hVY0Tw9tYYJiKMqmc
         5+OouL2K1CZYHEZM9kEGGsuXvABg+WpoVGSD2/Z2hz5MHtnutmR1yyCAMacM5KnHz6u/
         EYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785437701; x=1786042501;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5YXmCpAaOk6QqxLkbcXfgNTAO2qfKu1DivCGNjzW1Hk=;
        b=n6hZmZEgj4SOBybW+2NaByrVC8R/WJQnka+ezfoPa84WCsGAAR1P7zcAfznbkBe01E
         Vok/tMmeM0Ck6OK3KqWMuEkpHVQ3bw32wXgO9HDjYQGLvXA9V7mik+9nLj+PqAa0InTK
         HtOeHAxwrJuFf8LK/zhaIVEVhZAopgckfgToayOeTqcbWSHc3RiTLm/FIrIbpUCgytHQ
         huVcZqKQpx3IXVTXD4nEV2cqtyHdDSMc/h4auzoJb2nkmmn9l5CcrLbrpC4YV7G57fkP
         M/iZVBqqvK5erGPwoWEQHnw3dbD5q5CI7SS6O5t1j6C/dZ3Cf4z1zaacWbDBD7Dudfst
         N1XA==
X-Gm-Message-State: AOJu0YxC5BZ8Xk29EmaMQJaOowquuOB6yNzcF/ClehEVHGEpVKhfQ9fL
	VuMewTzSXd+bp4Ij2+X5lzSVBaAP7LQr2kNjWlGrQM/Ksz5qVf8/B8logHFKJUcVrquCLkv04zx
	Bgj4iDUkjGAtywhofeFZDlxQWnvStcikzjNXwnYs=
X-Gm-Gg: AR+sD13x1SzP8wbGaNEo68MP+Rz5GoniIfev6Z35LdVZlO94OgKinKqsfoBqaFVAqdH
	aXrMSEwXmAePD4YdVnSzIwVN20GAy5ICrj9A07c9skW8Kp059y0imuCRvknwKNUyukxgY1NRxYf
	nnznPvGeuJ8/pG+w5KE2obwX79xjhgUyXPgrkks4FOSJbX5KLUdU20utB9ygdxUCngaXzwGAlb8
	RW2sSiLGXanpR3fGZIiKbOfU/Y2GMqcCK/M6oslua/v+GSoT/OUi4LU7aY/+rRhD3Y0I8YqzOoD
	xEvwjQEA6mcjc3vwHts45GYfD8UgKwS2xzD4RTPKc/ppGFbuBxlieKI8+rlUZMunjJFGx+p+gEd
	LvLyF0O1+AwCMkWL9bT6jWu8pvA4ItWbRRulMgLrqr/cuAl4FW+yC8iDo+SQ=
X-Received: by 2002:a05:6402:2805:b0:69e:1246:a86a with SMTP id
 4fb4d7f45d1cf-6a090cbeb64mr779286a12.0.1785437700643; Thu, 30 Jul 2026
 11:55:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?7J206rec66+8?= <fyonglkm@gmail.com>
Date: Fri, 31 Jul 2026 03:54:47 +0900
X-Gm-Features: AUfX_mxRSKjjiZPlc1kaCHXfAg1QgCrse_BpBVLA3MojYAUdSflKJIFh2zzYrJk
Message-ID: <CAPLyb-a7bWCq0GzyOcztLm3-7H0GOP64JynosfO9k+yHy7diPw@mail.gmail.com>
Subject: [PATCH] io_uring: preserve task restrictions across exec
To: io-uring@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Per-task restrictions apply to all rings created by a task. Once
installed, they should not be dropped across exec. For a task that has
used io_uring, the exec cancellation path calls __io_uring_free().
This frees both the task context and the per-task restriction, so a
ring created after exec is unrestricted. Split task context cleanup
into io_uring_free_tctx(), and use it from the exec cancellation path.
Keep __io_uring_free() for final task cleanup, where both the context
and restriction are released. Fixes: ed82f35b926b ("io_uring: allow
registration of per-task restrictions") Cc: stable@vger.kernel.org #
7.1+ Signed-off-by: Kyumin Lee <fyonglkm@gmail.com> ---
io_uring/cancel.c | 2 +- io_uring/tctx.c | 7 ++++++- io_uring/tctx.h |
1 + 3 files changed, 8 insertions(+), 2 deletions(-) diff --git
a/io_uring/cancel.c b/io_uring/cancel.c index
8c6fa6f367e4f..7d7820eab878b 100644 --- a/io_uring/cancel.c +++
b/io_uring/cancel.c @@ -660,6 +660,6 @@ __cold void
io_uring_cancel_generic(bool cancel_all, struct io_sq_data *sqd) */
atomic_dec(&tctx->in_cancel); /* for exec all current's requests
should be gone, kill tctx */ - __io_uring_free(current); +
io_uring_free_tctx(current); } } diff --git a/io_uring/tctx.c
b/io_uring/tctx.c index cc3bf2b3bdbc9..466b7300e208e 100644 ---
a/io_uring/tctx.c +++ b/io_uring/tctx.c @@ -43,7 +43,7 @@ static
struct io_wq *io_init_wq_offload(struct io_ring_ctx *ctx, return
io_wq_create(concurrency, &data); } -void __io_uring_free(struct
task_struct *tsk) +void io_uring_free_tctx(struct task_struct *tsk) {
struct io_uring_task *tctx = tsk->io_uring; struct io_tctx_node *node;
@@ -67,6 +67,11 @@ void __io_uring_free(struct task_struct *tsk)
kfree(tctx); tsk->io_uring = NULL; } +} + +void __io_uring_free(struct
task_struct *tsk) +{ + io_uring_free_tctx(tsk); if
(tsk->io_uring_restrict) { io_put_bpf_filters(tsk->io_uring_restrict);
kfree(tsk->io_uring_restrict); diff --git a/io_uring/tctx.h
b/io_uring/tctx.h index 2310d2a0c46d9..76ad1ad4594ef 100644 ---
a/io_uring/tctx.h +++ b/io_uring/tctx.h @@ -12,6 +12,7 @@ void
io_uring_del_tctx_node(unsigned long index); int
__io_uring_add_tctx_node(struct io_ring_ctx *ctx); int
__io_uring_add_tctx_node_from_submit(struct io_ring_ctx *ctx); void
io_uring_clean_tctx(struct io_uring_task *tctx); +void
io_uring_free_tctx(struct task_struct *tsk); void
io_uring_unreg_ringfd(void); int io_ringfd_register(struct io_ring_ctx
*ctx, void __user *__arg,
