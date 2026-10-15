Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9EA3F7895
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092677; cv=none; b=kihiYgASLOw8GpALgb9kiVoRJDtwatm9cliWo0XkhWYDepqXS7wu2TZUAhExXsoXdnDfoTQ6VEaVaNUaBA+U0J68EnxuehY+tq6rMICJmlpYn1rkzbFF4oayReTzLmjcqRHADFuwKaAl0FkUMdleaXMop2NrKNqHtUeoSVYPUv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092677; c=relaxed/simple;
	bh=rzg3cpWmttmXe+lpJPc12/X3DQPWSNDiPoZJA6AcxjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DbpMEaF4bimf9sKcwXNMcni407xRD9F4GyFx5bfUeIoTj11MPpw+tyGd8IvsYFGULAfZodVsIKOs7kZu2rub1huf/ztEOhOU0GDTQf6tN8jZEvmC8TiNS1+OnUsz8ZnGfS88Twt+zvNPz226QE2trMFD6iMdZv0vMlKeeIertDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=gAJ6SZTR; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="gAJ6SZTR"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-917a6dccc60so4022806d6.0
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092675; x=1792697475; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Nn+i0Mp+g1rfJ7U0UGMOdjUkIo3+jMqcRlB1ae15Dw=;
        b=gAJ6SZTRIVkQ2nHgVhqhpFVolFucLz2MXEDHPm2l7Wfs7jUX4crG0SpW/2WYMLaBxq
         Ti5ctOlQOW8NilAERXz+JVbd5WId19QAkWjWp7qrg6Q2KU7oTRE79SDRJmZg9zyhO/Ys
         Co1pCmZxC98eqksnGLADHrETeuO/n1YRI8Ev3vLIJzaJtbsLZl9cUNT7LpS7ianQCY2T
         riwxNW5N/p2UYQ+6St3GbIRZICy/YNV2aZ5bt1cUOEhWzQxTQlFHjp4Vm3in/eoKrPt7
         SZB9pMrycapn1eJ4EIufNRXU7Vo/X64bqoVWuhA1kC5F7JlNdXBsEQ5Y9E58Sn9SE4di
         /XHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092675; x=1792697475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Nn+i0Mp+g1rfJ7U0UGMOdjUkIo3+jMqcRlB1ae15Dw=;
        b=KCbC7oGNnbgRIVp8TF6FGxy/q4U/aO2pQrZ05GjMBSgXXY//4l6/Er9gyoCJFykZsV
         XtT0cEzWvecKFT9UBnI1Whf/rKP1GbeCfTdSyZH9u/8PBPrGkTfMafsRtcCjG5wgEZCJ
         G2KaV687OMQoY8arP5nZCMQPwU455ykIsQCF+pXLN91OT7bKeYf3H8e2Yydq+DUiwLNF
         jPD62a6JuE9QzstD6aCSVepUh6ZQJSwtQoVaaqqygUQHVynybF77AUhbNVnPZ9svpwDb
         68+lJgncISoXXDG/SxEk8kTL/1cKn9Tx7LGpjji663Z4OjC/wpwifhOFv/QhL87VQAaz
         tDPg==
X-Gm-Message-State: AFq9FYK0KJv1kMkrW6w6IWw0ek7RjtXPw5IOnPlPVWvdKbAFb1M2OD3O
	LhLHD3vhw7OnBprKMtskPa7NXplgqYIuDY8Zc2P5bJlXstq5TOeQ/akbO+K/fRNB4WARq1ZdWVg
	k9qIQ
X-Gm-Gg: AYBFou1VGDq4lAMFc9hqogzeo52Go2nhda+rJBce4xONZYwwyaAmkXoAz7H66dIQ4nH
	ocgmoPerCRPyLhDW23z02tEpZi7tfpZJTlwMNKRAHBkTrJnULLgPdLnDRhRuLH+rNZHwihxA5GZ
	Cp7w5rYYhA0boevFoNGcyPO7hmSE82CUvGhabzxSDsTM+3KLiXBGgeDnBHLMKIBAPzC7I7vZpp+
	vhWcCEEfj4DGV47Zwk1jxd6ED8XO8itUkvX+UX/25//2W6KiFhptcG+Htc88eew2DbRqEu85THy
	CS3uOp0rn5+gafUqUtePUWD0g+daWka1i5e5qV3yZy32yfkD+YTLqO7cDVlVAXLrT/hKbWymtjg
	CSA9fjv/XPKZzd3P7xI05ERCt3vL9IVSCBLPRqRMBaDxtwCykbktVh/5I+tsCxWvFGHvUEXGd1h
	sBtSFAMUSezRke8IuxcSEafxtMqEqwopKjzZ4258rhT0i2hH07AgJt+V9YsWOEyW9VaEdUaRK83
	h0aJJxAD9HxtsY=
X-Received: by 2002:a05:6214:628:b0:914:40f4:d4b9 with SMTP id 6a1803df08f44-91bc91d3159mr19437296d6.12.1792092675442;
        Thu, 15 Oct 2026 12:31:15 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.241])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb5a794sm3367686d6.39.2026.10.15.12.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:31:14 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:30:27 +0000
Subject: [PATCH 03/43] io_uring/wait: don't spin on a stuck overflow list
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-3-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092657; l=2324;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=rzg3cpWmttmXe+lpJPc12/X3DQPWSNDiPoZJA6AcxjM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKwNwPLyWE7FqZt6WQEQzDJBmKdhhs9KhO1WXVj8LWi9b0L+93XKLW0+5+hIKZePYZmCvBJmlUn
 rqgaxpi6ZnAU=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

As long as IO_CHECK_CQ_OVERFLOW_BIT is set, io_cqring_wait_schedule()
returns right away, before it gets to look at signals or arms the timeout,
for io_cqring_wait() to flush the overflow list. If that doesn't empty the
list, and the CQ ring doesn't hold the number of events the caller wants,
the loop starts over, with the same result. The task spins in the kernel,
and can't be killed.

The assumption is that this can't happen: if CQEs can't be flushed, the
ring is full, and min_events is capped to the size of the ring. But:

- With IORING_SETUP_CQE_MIXED a 32b CQE needs two contiguous entries. It
  is stuck on the list if a single one is free, and then the ring holds
  less than cq_entries events. A single threaded application that asks
  for as many events as the ring has entries never gets out of
  io_uring_enter().

- Whether the ring is full is up to the CQ head, which the application
  can write to. While one thread waits for events on an empty ring,
  another one can move the head back so that the ring looks full and
  have a CQE overflow. The waiter can't be stopped any more, not even by
  SIGKILL.

Only the application can make room in the CQ ring. Return to it if the
list could not be flushed.

Fixes: 3fcf19d592d5 ("io_uring: parse check_cq out of wq waiting")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/wait.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/io_uring/wait.c b/io_uring/wait.c
index a48523c2f356..e03b40d9c141 100644
--- a/io_uring/wait.c
+++ b/io_uring/wait.c
@@ -291,9 +291,18 @@ int io_cqring_wait(struct io_ring_ctx *ctx, int min_events, u32 flags,
 
 		check_cq = READ_ONCE(ctx->check_cq);
 		if (unlikely(check_cq)) {
-			/* let the caller flush overflows, retry */
-			if (check_cq & BIT(IO_CHECK_CQ_OVERFLOW_BIT))
+			if (check_cq & BIT(IO_CHECK_CQ_OVERFLOW_BIT)) {
 				io_cqring_do_overflow_flush(ctx);
+				/*
+				 * No room for what has overflown. It takes the
+				 * application to change that, so return to it.
+				 */
+				if (test_bit(IO_CHECK_CQ_OVERFLOW_BIT,
+					     &ctx->check_cq)) {
+					ret = 0;
+					break;
+				}
+			}
 			if (check_cq & BIT(IO_CHECK_CQ_DROPPED_BIT)) {
 				ret = -EBADR;
 				break;

-- 
2.55.0

