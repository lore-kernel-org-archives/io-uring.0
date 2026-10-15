Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545A72E06ED
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092679; cv=none; b=InW6N0woYdxctPVgHsVyz6YhVINrOn+iQaBFH0u/79e+h1jed8+dqDdje5RqLcffIWCVB6RIHfO2+PthSDwpfrwhvmzgZRPhjLw/yO3rigkZxUp2zgwfA1lRkwWmgWE2LVohKYLhZJNMWQ9GQ4UjX8eLScQ4D0luzqIh2/cLr8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092679; c=relaxed/simple;
	bh=ialkj54Wqe0R8xV3gTDDXWkhZF0fXKJVZyQUUH1phXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EwxRtPOVc9llqlvx6NjcZAwqDH6kfU0ty8ygPppI4fBA5xcI2xYB81VIUV11p5dsLGQ12c6n5Qw1A2zyGio8mqQQsyELeFJ0gbJ66taZTtrhCXs4qFHbQrEFTZ+1fgRnzu/PYIacVO2UBjWMgKiTgg3tCo7gwx71pfM3cbS8oy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=C0KKZnto; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="C0KKZnto"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-93e7457349eso171523685a.1
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092677; x=1792697477; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IC7Ig3DOtsdvdKP+GjjBvvSjWN7V7EFFkKY219wJPD0=;
        b=C0KKZntoJ2kU28HhSjqZrioZldMtuxwAX2DBoDZUDwHFyUCJ13DYVBP1jsF91aChmH
         HU/AOaKAndTWqMA5tfR4xrrtwkHjyrabX1wYXVZEblkGu10Z+j7vLbHMu24rp1QYEIB5
         xfMQugWBDtzbgmvI9/70y4jclf8d8CGAG85BOVmtxsAehjCqNOp5tQaWpfb1zvjOf8VX
         2p7rzF1CERtzD0KCEOMzrykWCaQSiU7XGyZbl0RcI0MbbtE1HKCVm8AtbTod7cNZ9/6o
         2KHzCb7riTnT4bbqBYJR6h22e/cefb1lS5u6Y8QwnuWKeOTI9+wYydXwkQSQyjjb9Dsg
         QFYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092677; x=1792697477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IC7Ig3DOtsdvdKP+GjjBvvSjWN7V7EFFkKY219wJPD0=;
        b=LZxOblIHCYpjba9LVlZmdYm7ZYUl9/YH9Oc6HYPNJ+a3wx80BTVExDfJwAAsnh1V0k
         8XetrgtM6sXh/iy36epHKSFr9Fk+3KuByzl5GZed5XzZttcJiChOGHq3yVET3s4bp+jR
         /R+U1aeNguNjAa5Mw/SH487005Nz+MuyuQ9IXPY2RKREPT0874XEgYGrAAGoAT3PBuWg
         zMy7kv64NNW1AAJwTEZ3i5Kg+MHBa8Y54sORpP2lsffkiobvzs9TNpmS+EJt4NEuCqBS
         P5lYD/qn/Q2D2LosscbQaKHDLBMheIJLkOWBVeWKIoPdSST45HxRkO2YGsTQvhh7fzKm
         hkWQ==
X-Gm-Message-State: AFq9FYLUQGv7pR5CJtpVvKUE6LI1SHaZKfQXpBVutitecj4A4mnRXsaY
	vTfOwyvPfIeD1rnSXjGvtkf07nJwpRQ8LZ7zwqD4BbFzPqzNDVAqQTXrZveBTytuHlI=
X-Gm-Gg: AYBFou0pZGXyWzYUTqzoZxQuZYwz7b2xhBS29QggSZmdNq7BIaqkjoJulNkuDuMKkU4
	BmK+NrEoAeYnCJ/EyjD9DdAB1001jtQwkgiX9xWTHzh9vUOHNLGHND31depCX3FSf7wL8Vuvsa7
	JO/3PBHAm0xWQB2rp3ylXs7pHEENzZCFIE4sOtbMV8TAAq5/XEOsVB2/A0M4miKqpmNK7qijeBA
	Fw8xij3nOkrBWMzzAu+XHEb2Xalww2fS8FRJvDMiyqPmJFFWXsh4vzycj87PajZa4zbsVl/jbnr
	1QOHHQVVO4W5jVp7op5L+iMvAWqhgqrcqi7Ob9tZP9p9c+8S3W0Pb7YtxBhZi1k8hAg9dxiTcXh
	/WnVfLdfd+BDQ0pIxDvNELyTJF0qaLKdSvNCVQvhXvCX9E+rc10CCyYxG0/q73kb4lya09L+0rM
	mO+flwW3UjUHBDpw1PkYqMyrKNxff6mhaAuk09wxFv4H2EejJ65Rq0GNfTpe/G8UAbxqL96n+HS
	EUk0y398t8MWqKw
X-Received: by 2002:a05:620a:880b:b0:93e:795c:9d07 with SMTP id af79cd13be357-93ebd259754mr3186726485a.35.1792092677026;
        Thu, 15 Oct 2026 12:31:17 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.248])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a0cf9a0sm14756385a.2.2026.10.15.12.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:31:16 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:30:28 +0000
Subject: [PATCH 04/43] io_uring/io-wq: don't lose the signal that ends work
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-4-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092657; l=2870;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=ialkj54Wqe0R8xV3gTDDXWkhZF0fXKJVZyQUUH1phXY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNt39fqQH8opadzcdZXfpgZrV2KgeTmEZWXbvsdk1ztsknyNfygRWR0SPlxiXFBrFm4sDC7qVNw
 aIPDtaEe+KAo=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

When a thread exits, only its tracked requests are cancelled. Then its
io-wq is torn down. io_wq_exit_workers() signals every worker, to get it
out of an interruptible sleep, and waits for all of them to exit. Before
they do, they go through the work that is left. Unbounded work is
cancelled. Bounded work is run, as it is expected to end by itself.

Not all of it does. An open has no file yet, so it counts as bounded, and
the open of a FIFO waits for the other end. That is what the signal is for.
But the workers are signalled once, and a worker that hasn't started the
work by then loses the signal:

  io_wq_exit_workers()               io_worker_handle_work()
    io_wq_worker_wake()
      set TIF_NOTIFY_SIGNAL
                                       io_assign_current_work()
                                         io_run_task_work()
                                           clear TIF_NOTIFY_SIGNAL
                                       io_wq_submit_work()
                                         fifo_open()
                                           wait_for_partner()
    wait_for_completion_timeout()

The thread never gets out of do_exit():

  IORING_OP_OPENAT of a FIFO without a writer, IOSQE_ASYNC
  exit of the thread that has submitted it

hangs in more than 9 of 10 attempts (4 CPUs, KVM), until the process is
killed.

Set TIF_NOTIFY_SIGNAL for bounded work that is started with IO_WQ_BIT_EXIT
set. The bit is set before the workers are signalled, and it is tested
after the flag has been cleared, with clear_notify_signal() providing the
barrier. So either the flag stays, or the bit is seen.

Work that is started while the io-wq exits is treated like work that is
being run at that time: it isn't interrupted unless it waits
interruptibly.

Fixes: afcc4015d1bf ("io-wq: provide an io_wq_put_and_exit() helper")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/io-wq.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/io_uring/io-wq.c b/io_uring/io-wq.c
index 97523ccc7a71..433c003a83e5 100644
--- a/io_uring/io-wq.c
+++ b/io_uring/io-wq.c
@@ -655,9 +655,15 @@ static void io_worker_handle_work(struct io_wq_acct *acct,
 
 			next_hashed = wq_next_work(work);
 
-			if (do_kill &&
-			    (work_flags & IO_WQ_WORK_UNBOUND))
+			/*
+			 * io_wq_exit_workers() signals us once, so that we
+			 * don't sleep for ever. If that was before this work
+			 * became the current one, the signal is gone.
+			 */
+			if (do_kill && (work_flags & IO_WQ_WORK_UNBOUND))
 				atomic_or(IO_WQ_WORK_CANCEL, &work->flags);
+			else if (do_kill)
+				set_notify_signal(current);
 			req = container_of(work, struct io_kiocb, work);
 			kcov_remote_start_common(req->ctx->kcov_handle);
 			io_wq_submit_work(work);

-- 
2.55.0

