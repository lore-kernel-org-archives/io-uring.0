Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D4A4119F7
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092736; cv=none; b=cCQzGFQlYDhD/VFi/sHR5wOqZu0rJTAWCJwgb/LzNZjWw8cDPyVCGMJ01NAmRVIZU8LzGs9USdKqW+KJHv3XU8ERPqrEQpab71y6y6uPLR+CNGi3EFvwHDBOevU96bRI94vMQFF8nFcKzoOkauNJWlkpquP58TTlkJm7wkFQtz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092736; c=relaxed/simple;
	bh=lqmlMmEBPkZF0Rv5sg755j3kgP/ZlwR+KpHwawl4AVQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I6wF4f6sjqD70A/BwPPCOTfC6O04cMpGc4/uY2B6UlZlR85kIE3zFjuCetUYSzRzpQdwqLSnqvKdC+QIC3vqSNDJy12CAzgV965mDiVUOzh2UgLn60gULkLt1muvkGoLusFxVDdI4wAvYZmqlYlcuXoqz3F/n5PfmdC7sniZF0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=YYy5XUEL; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="YYy5XUEL"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93e027da22eso383188285a.0
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092734; x=1792697534; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gk0iqUpR2XRKXgySenUlLFdo4W52E851tpTlzvTBFIw=;
        b=YYy5XUELyOuppVPQ53YwxgfLvkyUuLVjFoVAbgzkltLYo1AvKFoLjSW7r0i235Di6j
         NlgSjcTMcbnuVyCgdPD5Lyn1Lnih6dd/WwKYBfYb0dWrNH9eigC2THJ5v4UFVfjkeAhG
         zBSRjg3g2cOFUP97e1XF9uGeBtc5xljXR8Mp25MM/HR3U9tJgVfdTMst/OaLExfrE+Vo
         JIw5JslhrKhzwySaacYtlzwB8oZmfK0jbhn4XS9ekbqSSUJoDrbSqUc1BeKZi4csLGYJ
         /ZGiixowtHFB08AmSrMCyDszIWt9bf28dJ8y9nvcf8bsTrq6ybMfOhjY9E6kmNCGhY36
         +8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092734; x=1792697534;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gk0iqUpR2XRKXgySenUlLFdo4W52E851tpTlzvTBFIw=;
        b=bHNFTTni6W4qV/y4j+t1+YBQ5rhJQ8GOWfiCZfO0oj2CpOFjcgPqJWFGR6pFUHjeqO
         XouDBV2KTlOU27p42cp7CNoRTsc25NF02BgnQtnilafWjYEuAqygfCVozuKPXCzLeG1V
         NiYH2zJxBIfoAyN8mOouUWHHOhZRrvCyxTB1XU9AOGNdq4RT24h3chziChtWhCcBgLoc
         KZf1H4vnLlk/joxxSMaN9zYgveifHyZ3Lz7O72W6Q8kZm+46md8aYiCi1xZCtD/LXCfR
         fwNWRmC3aVEKKxGYilmn5zN8i7Fnfxb43LTUOL427Phua6qOnWTSZzBCNrtccXmFYI4j
         FdxQ==
X-Gm-Message-State: AFq9FYKvdSH3WAIwI3xLpL1v0OfXAnk51AvJc90DjyGKq+M6H/+j7iZq
	FKTyhk1lkvVfg+4aZc1LbCRrdGABdQjqMlC+htpuSW3Q9y25tfnz5rwXiSo/iJ6YkvxEdAPtTO/
	Z4J5b
X-Gm-Gg: AYBFou30RsT/F1BrvOG3032KYnkFaxok6WyMLr/VnuOSOD0AtAEuftjt+9T5PUVlqGQ
	qN+upaRvx4eL7rZg+q3sLFdonP5UEnpc25J9+C8xt/GOuViguqW8ZW1JsuTSIkTW2+rqfmpdciI
	qOSPG4jPAXEDyYKWH/hLK4Xwjol0cs78bzUPyVAKYRhFKDQLQaiwq2uZUHEf01SrjjRnXx4T+4z
	a4lCUVw+tDeiMj2QUht1NnLAVLaDvMWsOwK/kAieiLmrzlWEtC9KODp5/T6Hv4QPqP0qVqfEkt5
	soGIe3v08sldZ3NcXbc12NhDRT3P2Jfq7U0TvrTJrEDGB8jL6T6KS7D9j0GKZYHUQJXp4WeN95d
	YvwwWHLRDIormX9h+3rYRb4TZNtp1OyO8z6bOW8xwMdpbMIDpiQPWgMLZZR7R1Tj9Fj1cRvRA5R
	xHnHqpvrZ0M64FDv2j8ty9kacY57/ZrjC7q1NYi2KSE+1N+7g4GrqyhEHDyz/RcoHMDrzPaWodj
	ZcpUCRQ3o6z9aI=
X-Received: by 2002:a05:620a:800d:b0:93f:12d4:67cb with SMTP id af79cd13be357-93f12d474afmr379287485a.80.1792092734398;
        Thu, 15 Oct 2026 12:32:14 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.245])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a16950dsm13224785a.15.2026.10.15.12.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:32:13 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:30:56 +0000
Subject: [PATCH 32/43] io_uring/wait: no early -ETIME if min_wait finds
 work
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-32-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092659; l=2136;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=lqmlMmEBPkZF0Rv5sg755j3kgP/ZlwR+KpHwawl4AVQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QE7K5D0wSqpda/cBvXpBcXv2yf1RZlprXuGa5xE7jle2WYb1gV2x/n1hUUHHslTbAoGDA717tPt
 KOXaWcxMMNQg=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

When the min wait time is over and there is work to run, which for
DEFER_TASKRUN includes task_work that was queued lazily and didn't wake
the waiter, io_cqring_min_timer_wakeup() ends the wait via
io_cqring_timer_wakeup(). That flags it as timed out. io_cqring_wait()
runs the work, leaves the loop, and returns 0 if the CQ ring holds
something.

Running task_work doesn't have to result in a CQE, though. A poll wake up
can turn out to be spurious, for instance if somebody else has read the
data by the time the request is retried. The application then gets -ETIME
once the min wait time has passed, no matter how far away the timeout it
asked for is.

Wake the task without declaring a timeout. From now on a single CQE
satisfies the wait, like in the case where the timer is switched over to
the normal timeout. If running the work doesn't post one, the loop in
io_cqring_wait() goes back to sleep with the normal timeout.

Fixes: 1100c4a2656d ("io_uring: add support for batch wait timeout")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/wait.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/io_uring/wait.c b/io_uring/wait.c
index 38425d4cb7bc..b7a0292767c7 100644
--- a/io_uring/wait.c
+++ b/io_uring/wait.c
@@ -77,9 +77,16 @@ static enum hrtimer_restart io_cqring_min_timer_wakeup(struct hrtimer *timer)
 	if (iowq->timeout == KTIME_MAX ||
 	    ktime_compare(iowq->min_timeout, iowq->timeout) >= 0)
 		goto out_wake;
-	/* work we may need to run, wake function will see if we need to wake */
-	if (io_has_work(ctx))
-		goto out_wake;
+	/*
+	 * Work we need to run. It isn't known if that is going to post a CQE,
+	 * so this isn't a timeout. Carry on with the normal one if it doesn't.
+	 */
+	if (io_has_work(ctx)) {
+		iowq->min_timeout = 0;
+		iowq->cq_tail = iowq->cq_min_tail + 1;
+		wake_up_process(iowq->wq.private);
+		return HRTIMER_NORESTART;
+	}
 	/* got events since we started waiting, min timeout is done */
 	scoped_guard(rcu) {
 		struct io_rings *rings = io_get_rings(ctx);

-- 
2.55.0

