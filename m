Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCB7459AE9
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092712; cv=none; b=ZpMIhTo3c6uosFd/JuJhn189E485yWSuNL+/rQXi4tN14uWbJmrdy/WsZIDH6VPdRfqWNv6ZO1MsKHEe1ikck8tKYV1jWZjjlvt6Xdto9bsk5lwtuAbViHmcqx/rxeRs+4LWVihe0bntdPz5H8lMrBy7lcFeOes4LswvsIQK/bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092712; c=relaxed/simple;
	bh=hXD1+EVMNREpIAe1fPnkzwMmqbUuQF/UeOeqyiEG1Do=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hyBp6AOKH3+MGabSYyuLplp8aYmnr4ZSpmH3HlPDa+k+7aEyTsHnJW5KVnMxDudxsPip/kB/uCR7o9sE1p9HveNOYxIjZL8wgbBj8rXtt6rDnqvqRJ2qnsZ/R854xOkKavRpumZsh4MmyMH5mOdk0J8QSdfpToQj6Rg8AC3cmUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=NLq9LCfn; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="NLq9LCfn"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5351d76e1baso3672521cf.1
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092708; x=1792697508; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kWD+g/xISYsXuppD1yO8ktogFkL0YB9Z7ZbEcm1gsYk=;
        b=NLq9LCfnA3PipL8AvvO4VDbSDiomgeSZNDufjyteirQzHygqjUs3NJd7WS1IC+QiDz
         fXwCb1zJE3ZjYV5ZWv8Ok2KO53vvNuSXRv3gJkyszi/q1YHzt7EMFP26mXfJODFP5tVE
         TiDsPyvvCVNWP1IjPErJu00hPAgPaFYcr6dYe9dMMBIiCDOar1hCUIlhlBdJc/qNWAk/
         EviajYER+fPthMzbV/9kEfd7Px1OszB3KzX/VTEfi8Bu2aIFCkAxq9ViNOYswZUCUNEt
         3pHLCLIFeCqAFp9gzYKEudNeTxh33pCQ2B1j56J4gLNLA//Xv1PBfsV/Q8de41Zv2m94
         yD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092708; x=1792697508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kWD+g/xISYsXuppD1yO8ktogFkL0YB9Z7ZbEcm1gsYk=;
        b=ElHgXgNHEWzjRr+GFh1Dpdi+EqI+IO7MIYGF1ElKQEHMLD84s3DpuYnY7bQdY7wRRA
         I5317AW1rJTSe4K9q/WZM1s6DjpRex2hyghOkacfGwbxMSlW6jQUh63pk4qosKRZ1Ng7
         mlqqKYd3ICxSdEWqhRDYQaUd+tTCjyXHuOAMgdMLMjmzH+bnlUVj1QuXIm+V1mhcXn6K
         swBOc91Epa19KDCqKuD9C+wbM/+ijr+jpsnQMCX7hQOnDc5XW8avIVoINyAObbvvgs5l
         FoU6HjgfXxB3gEN3QQZJd2Elb6wss6xwRTcSNP4whPC42jtbqF/mD5anc7k/pFvBobzK
         0wYg==
X-Gm-Message-State: AFq9FYIuZULO0Cd67nBVdqDjjvO04aWXyYNSF+0wm+FJnjKXUiU1t6lh
	M0v5XFNNeq6sYKATe9ZDsl5NCi8/JzWet3AanVEBBjsnX8kT+iicnZ+qJYitLCFVli8=
X-Gm-Gg: AYBFou1v+rvPxQJSmoA83YBdu78ntTxpVA00dzhTNsA6/21sxvCsKF3vtR1ZwOWN+AQ
	E1vGdma02hEa6BNle/obOV/9UfdOlLu9K11pNmMnEq0psA9Ymv3InDsSugJxl622IeBAvLzbE+m
	nEUooKvJfUsWd4QwuU4rN5ZG2hSHBzzivAV+ZDEcxNgI1jxHF3kivhnxVreMtxbcrNhyEljZoae
	2OfDwAFv74MZ1Z9QnjzrxeKtflXvbVAgWZD9MUWTXWbracDG1jWERBdCjCgMeUPqApRuuYqdJVl
	nQa9ZVPb0IZPTBIsh20cOjKxCR9/+iCpwtzDbZ6xRmazpSGuGQ+RdJfo4hZWlzYw1tdW4DbmJPq
	QFVb5W418kxE8jpC2l5C1GEYL23fTDiYjHiflzjtqpsyHXzRYkbAo62mv2fvurxiBPLuR7RIHHj
	DI7JFTd0CavI4sZq+YonmhlpPNbdxXTqMPlprcVFhJIzvYkwfYvC3owpVzlL4y+xLD5Dnc9NdiO
	bbKM7/xVLs8JNc=
X-Received: by 2002:a05:622a:e2cb:20b0:533:339f:9f4f with SMTP id d75a77b69052e-5362725be3bmr13866191cf.13.1792092708602;
        Thu, 15 Oct 2026 12:31:48 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.240])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362aa8044dsm1361401cf.30.2026.10.15.12.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:31:47 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:30:44 +0000
Subject: [PATCH 20/43] io_uring/wait: look at all CQ waiters on wake up
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-20-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092658; l=1506;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=hXD1+EVMNREpIAe1fPnkzwMmqbUuQF/UeOeqyiEG1Do=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPF3vMM0N1WeLpvxuv7e2N807lcYNkviPEO/yyvI32RHzBc8wcGTiiQmDkwV/6czcSdDFn8cYFn
 wBkYVxTHl/wQ=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

io_wake_function() returns -1 if the waiter it is called for doesn't have
enough events yet, which makes __wake_up_common() stop walking the wait
queue. That assumes that the waiters behind it can't be satisfied either.
Each waiter has its own target though, computed from the min_complete it
passed in:

  thread A: io_uring_enter(GETEVENTS, min_complete = 10)  // queued first
  thread B: io_uring_enter(GETEVENTS, min_complete = 1)
  one CQE is posted: A isn't woken, and B isn't even considered

B keeps sleeping with the event it asked for sitting in the CQ ring, until
A's demand is met or a timeout or signal ends the wait.

Return 0 to carry on with the next waiter. Only waiters whose condition
is met are woken, like before.

Fixes: bda521624e75 ("io_uring: make CQ ring wakeups be more efficient")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/wait.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/io_uring/wait.c b/io_uring/wait.c
index 5093365e9eb2..38425d4cb7bc 100644
--- a/io_uring/wait.c
+++ b/io_uring/wait.c
@@ -26,7 +26,8 @@ static int io_wake_function(struct wait_queue_entry *curr, unsigned int mode,
 	 */
 	if (io_should_wake(iowq) || io_has_work(iowq->ctx))
 		return autoremove_wake_function(curr, mode, wake_flags, key);
-	return -1;
+	/* keep going, a waiter further down may be content with less */
+	return 0;
 }
 
 int io_run_task_work_sig(struct io_ring_ctx *ctx)

-- 
2.55.0

