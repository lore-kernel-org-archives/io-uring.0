Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142A2288C96
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092691; cv=none; b=ZnxI7VaUqTTZ1mvX5xemthBVlwO1DkGndHIOGJ1ggLrD4G/pm3bIaZqpUg/u+qR5tdi4dq3SVRcKt4rOI40sRdb8Y5dCOOd3hBVBOkeOpXu483gFD5667RgRMgdyv7+JZrybPHarhbfGHSTj03nvwmNHu2HpVhT6OwKhLtMDQ6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092691; c=relaxed/simple;
	bh=i1LfJ/0zsV+ReE3cmri3G3mbNaJQM2euLn2agM2CCmo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i/DseZu5NRf+KcL8VyJlDlq0mOwbmXS32q9cAEMJ9YrInODOW2NDp2rTNjFZDrG9eRTwql3STORpoHdKvUIPCL/FB9ywbCjHnJ8CvDeb7DEqpi/QmXotSZKDrbfKFTH/rIaCBrc94ah9CzUR3hjjKB49M2pDdzrkVcoTJx1cfYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=E5WpTfRv; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="E5WpTfRv"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5338f65913dso20131951cf.2
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092689; x=1792697489; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Nbg685FjMGt7IjmUA15YsBYP7Upia0Zit7BoeycG98=;
        b=E5WpTfRvftlA7PeMSuZcPR8z9Ptiz3u3We3gF5GyLH2fhcc8Y4JZInGc5I6UZcOg3G
         AyOvR9RSs4pBwfG04JRw7UQTJ9eZGvVq5aVleWEbcIad9MeHDTIbOiXAxXhtQQ0kHJKf
         /02IFIeOu6NxZNbdn9pDZBqjcz9o8tQ0T948ThRJ1KdIgVgAq0Dj5QVd6agqmrvsjew+
         z/fastmlLvw4q5rXysx/rrf02obwKabBJuzyuhDk9rKamL4xBARcEbxqraG4xLeJFUp1
         +G/Q2Q+dX9i+lSwxu6WS43XHeLMmg3svZrezl8sOlNoXwfaysuG1lA41XCmY6DpENs2s
         KMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092689; x=1792697489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Nbg685FjMGt7IjmUA15YsBYP7Upia0Zit7BoeycG98=;
        b=KI7gEICbjR/mhNjmORFMH831S0u6iJSH29SjQAqyIEf8LfvFRORun6vJVxdqN65W88
         bSgVd7hNtzOpH8TpkBKgJVHAt0coX8of21eGhaZYZSjZxTlDZ6BPXQq2U1Pl5NH+Vuwc
         sm+NxXYYa3EdeqM7A3FsJw4GYEVhmmwHQP5Xnuo1RvUcXqH4Vig2OR8MsjZ5TARuXNWT
         MhiJXQtsGg060ZxrjLkFwgB46P29xrV4OrkY9reXcLXaI4B/ikn+iZ0OB8U08y7ipMf7
         qKNRnLwjJ+P5+Sa/ndOdlFIl1LsnZoV+iR78dRvs12hZ1/ZOqrJ/oSIzFvxMzys3xfk1
         sN5Q==
X-Gm-Message-State: AFq9FYKa55yQe/qxQjtfvRERP+4S0wqqYtt6S9Ti/VBk+hVy7h4kDPcm
	pAC2VlwFIvgkCYRfGT2T6KCehJ1wFYy8Kz82clJ6Dpe4ermTh4uBOzvrunwO8niyrdY=
X-Gm-Gg: AYBFou36ZYRIAHdt+RI7OSDG3Pjtj5jPUUkTAqr2LyZWCHDAqup5/yTQ08NqdH98Z79
	xkJsioh9IfFKeSo50icy6xrKDi61YivofkEFI0Fb4YEtlmrm5DFw2dThWQzuYU0V97rsChI4ods
	fTl6qXpOtfHsvE7tYyGDoDBSkUBQbMq2bqM63yuZTj3juPIpWQQg+XWIIFoI3xUA7N8cIR/YjtY
	dGa1mrRoej2fZlg5yo+Qw161dnaKhfEgMI/4Mo46lEJ+dw+VYwjzXH2pJLUm+J3/XhQWNtMVzJh
	JKNVI1OUuTXDRftrmst10YzizAgtuixiUxrXSqf9Q/dM9Ic09+UdjtyWzxOAwQHX7Xuo0te0s4V
	0quKgvEWIrlsn/9l6uqLXLEa3/oY1x4a9iB+AoCLg6UhEIHHatq3REKCpEYQ9AjW2ke9rGWu1Nf
	7HXgR50mVmXO/Hu/DzpTEmaEs6iV67yPxvd5AbyLZAuXYZcsSuDAgvAEDGMhqIZm7RvNFHO0vaS
	yaCBDo38wfUhPM=
X-Received: by 2002:a05:622a:5294:b0:533:3868:1f79 with SMTP id d75a77b69052e-5359fdb667dmr322299211cf.45.1792092688926;
        Thu, 15 Oct 2026 12:31:28 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.253])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbade61csm3377536d6.26.2026.10.15.12.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:31:28 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:30:34 +0000
Subject: [PATCH 10/43] io_uring/io-wq: don't go to sleep on pending work
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-10-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092658; l=3219;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=i1LfJ/0zsV+ReE3cmri3G3mbNaJQM2euLn2agM2CCmo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QA3JlPgLPKwcGNoIAHfE20Ty0l7fcYEHPxk1386s9lMfdBDZMsPLV3/yHXVQA4jnpbIMA+f0O2W
 814/JqZz43gQ=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

io_wq_enqueue() wakes a worker off the free list. If there is none it
creates one, unless ->nr_running says that a worker is running. That
relies on whoever takes ->nr_running to zero to check for pending work,
which io_wq_dec_running() no longer does for a worker without
->cur_work, on the grounds that an idle worker is either woken right
away or someone else has created a worker. Neither has to be the case:

worker A (idle)          worker B (idle)          io_wq_enqueue()
                         woken for work 1
woken (e.g. timeout)     takes work 1
work list is empty
                                                  queues work 2
                                                  B is first on the free
                                                  list: wake_up_process(B)
                         leaves the free list
                         work 1 blocks
                           nr_running 2 -> 1
schedule_timeout()
  nr_running 1 -> 0
  ->cur_work == NULL

Work 2 isn't looked at until work 1 is done or A's idle timeout fires,
five seconds later. ->cur_work is also NULL while a worker blocks on
->uring_lock in io_wq_free_work(), with the same result if it was the
only one running.

Let the idle worker leave ->nr_running by itself before it takes its last
look at the work list. Both that and queueing work are done under
acct->lock, so either the worker sees the work, or the enqueue side sees
that it can't count on this worker. This doesn't bring back the request
for a new worker which the check was meant to avoid, and as idle workers
don't get to io_wq_dec_running() any more, the check can go.

Fixes: 8343cae362e1 ("io_uring/io-wq: ignore non-busy worker going to sleep")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/io-wq.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/io_uring/io-wq.c b/io_uring/io-wq.c
index a5b3d2ba48bf..a3a650813629 100644
--- a/io_uring/io-wq.c
+++ b/io_uring/io-wq.c
@@ -467,11 +467,9 @@ static void io_wq_dec_running(struct io_worker *worker)
 
 	if (!atomic_dec_and_test(&acct->nr_running))
 		return;
-	if (!worker->cur_work)
-		return;
 	if (!io_acct_run_queue(acct))
 		return;
-	if (io_wq_hash_defer(worker->cur_work, acct)) {
+	if (worker->cur_work && io_wq_hash_defer(worker->cur_work, acct)) {
 		raw_spin_unlock(&acct->lock);
 		return;
 	}
@@ -751,6 +749,19 @@ static int io_wq_worker(void *data)
 		raw_spin_unlock(&acct->workers_lock);
 		if (io_run_task_work())
 			continue;
+		/*
+		 * io_wq_enqueue() leaves new work to us for as long as we are
+		 * accounted as running. Get out of ->nr_running before taking
+		 * the last look at the work list, rather than when scheduling
+		 * out. No need to ask for another worker then, we can do it.
+		 */
+		clear_bit(IO_WORKER_F_RUNNING, &worker->flags);
+		atomic_dec(&acct->nr_running);
+		if (io_acct_run_queue(acct)) {
+			io_wq_worker_running(current);
+			io_worker_handle_work(acct, worker);
+			continue;
+		}
 		ret = schedule_timeout(WORKER_IDLE_TIMEOUT);
 		if (signal_pending(current)) {
 			struct ksignal ksig;

-- 
2.55.0

