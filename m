Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98F119B3CB
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092694; cv=none; b=WyJomfSjrM2W6JFtMMI+obrGFeoltv4BxOmR6UALSXEdcE1TBFbmhWUPLW+u7ZdtN58GPlKrLkO4iHb62/cxn31skrg8QQMAvNxl1xhQjGbv5nnsO2AprJiBPAoXEYllhlhIICoHkEk5VTApSNeoxkHFYXTYaPQWHTomkGsHup8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092694; c=relaxed/simple;
	bh=SdwAIonmihyGKnS/gOkvjE+VhEBVj5nzBV7lkIQCzp4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bUjcDPZ0M7qiqV4WBTJQEuMciKjEWm1D3EmPUwjENTH+lIKexnl6iSJa24vNNUbZSO5ZSx/9wX4v34Tv3YMjhPy++BX0/zB75+d/KmDpSlfuBGxiD0UxKfoiaTaWBKqR0M4UCydMAlc8xyHJ7RJQj2ou+cn7EFtWCtuExJ+jEi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=XfJz+7gf; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="XfJz+7gf"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-93e635220b4so553926485a.1
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092692; x=1792697492; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qntZVLB7a9OgCT5twdnlwpk6Go9Hpd1HSnyBxxpl3Lo=;
        b=XfJz+7gfZxxYQBIpLypU9qJE3yFeTSKHgTSOBie6MyAaB6PtaIYRdCIGvQ9eYgWD01
         IuYN68wAHzExqe23iH37fDnTB8enteYmnNTDeaEuRm328cTNbxoPgIcarnnMvtkKx3Mn
         qoT2w6HYOw6/rROPSi6B0B00jopwYqQDEIfdtnT7hU8hpRd8dzaqMbBmpTb1iEJyWHPE
         f1Dfttp5HdcKnl0d3Prex/d0O8L6FqNhtNI0adJaJU9DmpPgU9rYLJabHOmWJZiYBBt6
         fc52fik4PhcyindllvMdtynbdTJOUJQjk176xlfwhzQ5zKG9tMrfgYbzo5MPuZBPEn9T
         AiJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092692; x=1792697492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qntZVLB7a9OgCT5twdnlwpk6Go9Hpd1HSnyBxxpl3Lo=;
        b=qxVbsvoB+cGkQlMbUAjobC4knTDbCNvTi53EKxbXc7XNX0ZxCZUvLE2HYsO6x4LNN4
         4VynpwQzULgctBZr0CUPQKuNZc2sqxeSEy4iCfgTCdwwsMIs6BPheAqgpGSt18EnTDVV
         afTdnwj25vMS4jIfxTMiXLAHmJ6XF8yiH1NnEloYbmTKVeS60lxUsZ57CetwTuc4j9vy
         X86sdbfkHXiTsA1Dq4d4/xIO0UtgqyLzRi4Q4q8yyXkHdeYWQFiDEjXVvMwvgWr/QP1b
         1QxBRmQsFY567+yAfgMDEfy8qTY3DDJ4neieuZ2ScZ433/C8V98k0yIuFrU6wJJEKFfB
         HFzA==
X-Gm-Message-State: AFq9FYIdU7BUE+b+RdY/VIIy3CLjYvRos34ypn1DA7ADFEP/VnTLjfsK
	gQbaC8hOw06EAjCUgXWS4ysKv2Cud6WxCMMECrbUqxytGgOEmiZ861+GHGBQArxjug9K5uDvVz2
	DeQHz
X-Gm-Gg: AYBFou2i50qLTisGLR6p1ZZUNZBehHELwpQvFrePp3ByMLvCUtmKIm0Jx+BVCE5Ftrg
	6NY87qRYYrhxOnqjeGCTpAcZGY5XIpkF8j1mCj8z2Hubj3RSRcv7hzhp3FTkYRFxYInlELGiDh6
	Eew06C1cM+e7Jw2KMpRie59kVfqHUjDaHRD8k2t2KDn+5A8ycl5iP0IFhkPIPJMkKQydytOci6S
	EZx6xP/H0wLuetFjyFjloQX2ap3sMYzfqTLT05voOnghR6xeVm2wGeLenzi3HOEu0g8Eq8cOwxP
	Mw0f7OR8FqBSMw4ELLsmRRNtFEXK6b8/GYu52GK6FGj2Jy5ZFCVrQBOqqdYWSvCglcE2NHMyPMu
	mDvyT87aLsLBmk4xMqgq8Y3HAeAG2x5cERJxT02zyDrLgpz41WevrWI05RLLMEy4iOdJoTAQKD4
	lOvdTrlic6bzJL9lL2E8oXIaJGuH5WFBiVeVZeiPmE7xwxzt8xZWctDGzxkePrQbSshLolCiCvY
	5X7XfVBLpyTMEg=
X-Received: by 2002:a05:620a:438a:b0:93e:a8c5:1340 with SMTP id af79cd13be357-93ebd25394emr3293442285a.34.1792092692477;
        Thu, 15 Oct 2026 12:31:32 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a1a990fsm11953385a.35.2026.10.15.12.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:31:31 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:30:36 +0000
Subject: [PATCH 12/43] io_uring/io-wq: don't exit with a creation pending
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-12-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092658; l=2923;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=SdwAIonmihyGKnS/gOkvjE+VhEBVj5nzBV7lkIQCzp4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QM96iGWBjlxCOFZJW2rmMJmhYQixl4/U9NczmHGT0l1BjqNks+8z7MAXsMyiUMmx08wI6+sHndt
 SrOtEIKVDqQk=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

A worker that is the last one to go to sleep while work is pending asks
for another worker. io_wq_dec_running() bumps ->nr_running on behalf of
the new worker and queues create_worker_cb() as task_work for the owner
of the io-wq. Until that has run, everybody else takes it that a worker
is running which is going to look after the work list: io_wq_enqueue()
doesn't create one, and other workers that go to sleep don't find
themselves to be the last.

If the worker that made the request exits, io_worker_exit() cancels the
task_work, and io_worker_cancel_cb() drops ->nr_running without a look at
the work list:

worker A                   worker B                 io_wq_enqueue()
blocks, work is pending
  nr_running++
  queues create_worker_cb()
wakes, handles the work
idle timeout, decides to exit
                           picks up work 1
                                                    queues work 2
                                                    B is on the free list
                                                    still: wakes B
                           work 1 blocks
                             nr_running 2 -> 1
io_worker_exit()
  io_worker_cancel_cb()
    nr_running 1 -> 0

Work 2 has to wait for work 1, although there is room for more workers.
It takes an owner that doesn't get around to run its task_work for the
time of the idle timeout, less if the worker exits because its affinity
was changed or the io-wq is marked exit-on-idle.

Let the worker stay around until its request has been dealt with. Only
the worker itself sets ->create_state, so it can't be set behind its
back once it has decided to leave.

Fixes: 1d5f5ea7cb7d ("io-wq: remove worker to owner tw dependency")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/io-wq.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/io_uring/io-wq.c b/io_uring/io-wq.c
index 89b598b724c4..31c7d6fc426b 100644
--- a/io_uring/io-wq.c
+++ b/io_uring/io-wq.c
@@ -765,9 +765,13 @@ static int io_wq_worker(void *data)
 		 * idle-exit, drop the worker as well. This is used to avoid
 		 * keeping io-wq workers around for tasks that no longer have
 		 * any active io_uring instances.
+		 * Not as long as a request of ours for another worker is
+		 * pending, though. It is accounted as a running worker, which
+		 * others rely on, and io_worker_exit() would cancel it.
 		 */
-		if ((last_timeout && (exit_mask || acct->nr_workers > 1)) ||
-		    test_bit(IO_WQ_BIT_EXIT_ON_IDLE, &wq->state)) {
+		if (((last_timeout && (exit_mask || acct->nr_workers > 1)) ||
+		     test_bit(IO_WQ_BIT_EXIT_ON_IDLE, &wq->state)) &&
+		    !test_bit(0, &worker->create_state)) {
 			acct->nr_workers--;
 			if (test_and_clear_bit(IO_WORKER_F_FREE, &worker->flags))
 				hlist_nulls_del_init_rcu(&worker->nulls_node);

-- 
2.55.0

