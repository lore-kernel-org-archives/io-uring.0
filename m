Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CBE49EC5F
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092687; cv=none; b=PTipVA9p56+ffHSh+6xcKoEpS+rIekPJ6HAgJjzw7gfb55uskg3XTHCC+cdnVp8hzvcMQ6fG4oip6uNqzDd0gcp32yJDFx5P+0hJz1cb/fDlPusUyhS+Zi8xFTj7iNFvih6AtLHak9R0DHu/fUW3aH4giXu3vdbdJRHCcwJo5kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092687; c=relaxed/simple;
	bh=7lYNCh00ekNcNxHr/jRFW5ZIJsaSkyurw873IjkIypY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dvkx+FBTrUd6ibGhGWoQK8YNMDrxF40T7yWkWGlBLbm6Hx5wBbAzdyrk+PUV0XxsC5fbn7K9T6aCVW+Af8xnIBmZ5gsX5g7eXeWtyOtdtb/zk5cQ2FZrNIBCOj38qaCvq0QXlVfXyAKhuxOi+Mt26kgGdvmYlueSHX60dh3oOUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=LamX488d; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="LamX488d"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-9144e8021d3so22985056d6.3
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092685; x=1792697485; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P2cPBpqNqC/6Le6Hgn2bA/PV0IFRPSub1xBxW92Srj4=;
        b=LamX488dJYNJAUh5G2B31gNBYIoPYZ5sqXgyCasGaQvnQZTYgJSYaBZVh6xaewKs54
         k8qwl455U+6R5SV2sRkPQibrRmu13fsF0mLrvD8w1+0Kp7/yaSvfhrVzWmNKlKWIpfdW
         +Y6lDQ3fxRguY78OE//H2TREv6BbHG2owLZjQEyklOQKLkSQIZWxiYR34KF5T36krog1
         ou9LzWbk4Arvq6Y1uvhuieMeoxTWpenHo0AToQecdZXgyqJSsj0gJKau0gHPJL8Dj86W
         3ComOVWONuL2XszNtDNDYT3jjh9hKu4dYLvAGpfcb4pTrQSIG759jAHNLcrojq2UeAcf
         Inzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092685; x=1792697485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P2cPBpqNqC/6Le6Hgn2bA/PV0IFRPSub1xBxW92Srj4=;
        b=IXW8j67cAV1xCB2LTfPHiFxDvV/xKEUcheW5fRB+bZYriJeyv2uzgfYAlSdDJu6KUg
         etiMV4NrnwaoPbT+bLwEwSA41pcI5VqavhPR1YnDsKdpQhIB70KsiX7HEweWa3Pwkf2C
         Eckeo9F5WsDHuQzZK3s0L6ON1PNJ8VuWOE/+MkCr3ivaE5524+qLYSJsLSlZcEUPs/25
         drWG2qo1fQ0iF5eaOxHGR/mEQ1+2/8/FuC9KBVf0Q1aHueK7yv5sgMgi93ElOvnOFtkt
         n0CjcpnD177sov+uQOHG+b8zpBnFP2pO89HqZkQlZbqtLrcRs87Gh0XK4kgL0TO6D2AZ
         s2dQ==
X-Gm-Message-State: AFq9FYLPkaVs8TlinySUruiOxKa4bouzf3maDE6UKnOk6KnvFGoatlLX
	St0tCgC9J8DBRtkyG5gSPx6R29bxJ9vEeKm5+7xU8tqeIUhDjrMjsCJJhK1xv9qlpI1ecQ45geS
	QIPo9
X-Gm-Gg: AYBFou26f4/9/jW/Ldn54tMvLxZ7E7Xrlaf4O0QZKiO30C8OdvNKWB/oW7X9Aw73bRp
	FWy2kp/fTGU1tmZCzldyBizQfdH84/K/oZTb4LW6g/HItDkVag/JBQDlpUIM0v7yD0qzweUcrHJ
	mIxYr+bxqushNCSN024oOgLalhL2usgGQc2wO4O1qgCs+8NsyS+RTQ5uSmR5sxpWk5dEj/BFjWw
	BgvX/CWsPbABxO2S0pAF2fQm1RPgTTxPkT2SParSeHcBXHAvI0hbhcOpByAM/y4cDQBRl9CdGpw
	hh1yyAFXuRjibWch5WNCSpRwVBw3Z+xQhnMAb7IzhNuhb5iEhTOan0QS4ueab1z4tp4Cxx3Ziq5
	7kov3iDCBVCz/OWah5tMFFGXkrS6aeFcLLJx9K/vvO9vt9LDa4AFKI2QZo5Q4qV6DXJ3FYrZ7dc
	xySa0HRnK4mF5N5Gxo00+qjDBs0PtDOjCda0CPIix4ftTCFEfgEoepPvK+wHWoNLCtOhqsdUDpt
	LMfZ1ME+Tk2q6M=
X-Received: by 2002:a05:6214:238e:b0:917:fadc:2f21 with SMTP id 6a1803df08f44-91b557bd048mr320163296d6.41.1792092685059;
        Thu, 15 Oct 2026 12:31:25 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.249])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb233d2sm3271206d6.32.2026.10.15.12.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:31:24 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:30:32 +0000
Subject: [PATCH 08/43] io_uring/cancel: rearm local work wake up before
 sleep
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-8-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092658; l=2731;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=7lYNCh00ekNcNxHr/jRFW5ZIJsaSkyurw873IjkIypY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJIya71qLMYaBm8nBUpp7t4zhL3VGaA44LwzYi2XC9b8lrOEcv10Ns3A5EAy6UEj6ZCtxQApRZD
 7KXORcamb4QE=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

io_uring_try_cancel_requests() sets ->cq_wait_nr to 1 so that the next
io_req_local_work_add() wakes the cancelling task. The add that takes the
count to zero is the only one that wakes, later ones see a count <= 0 and
return. io_uring_cancel_generic() however only becomes
TASK_INTERRUPTIBLE much later, so the one wake up can be spent on a
running task. That is fine as long as the entry of that add is still
queued, as the io_local_work_pending() check then skips the sleep. It is
not if the add was delayed after queueing its entry:

CPU0 (submitter in exec or exit)      CPU1 (io_req_local_work_add)
                                      mpscq_push(req A)
io_uring_try_cancel_requests()
  io_run_local_work()  // runs req A
io_uring_try_cancel_requests()
  atomic_set(&ctx->cq_wait_nr, 1)
                                      atomic_read(&ctx->cq_wait_nr) == 1
                                      count taken, wake_up_state()
                                        // task is running, no-op
prepare_to_wait(TASK_INTERRUPTIBLE)
io_local_work_pending() == false
schedule()
                                      mpscq_push(req B)
                                      cq_wait_nr <= 0, return

Only the sleeping task can run req B, so it is stuck in execve() until a
signal happens to wake it. An exiting task doesn't even get that.

Arm the count again once the task state is set and before the work list
is checked, for the rings whose local work this task is the one to run.

Fixes: d46ab2c98aba ("io_uring: switch local task_work to a mpscq")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/cancel.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/io_uring/cancel.c b/io_uring/cancel.c
index 9a92a6aa2bcc..64eb4a993c00 100644
--- a/io_uring/cancel.c
+++ b/io_uring/cancel.c
@@ -694,8 +694,18 @@ __cold void io_uring_cancel_generic(bool cancel_all, struct io_sq_data *sqd)
 		io_uring_drop_tctx_refs(current);
 		/* only skip the sleep for local work this task may run */
 		xa_for_each(&tctx->xa, index, node) {
-			if (io_local_work_pending(node->ctx) &&
-			    io_allowed_defer_tw_run(node->ctx))
+			if (!(node->ctx->flags & IORING_SETUP_DEFER_TASKRUN) ||
+			    !io_allowed_defer_tw_run(node->ctx))
+				continue;
+			/*
+			 * The wake up io_uring_try_cancel_requests() asked for
+			 * may have been issued while we were still running. Ask
+			 * again now that it can't be missed.
+			 */
+			atomic_set(&node->ctx->cq_wait_nr, 1);
+			/* pairs with the xchg() in mpscq_push() */
+			smp_mb();
+			if (io_local_work_pending(node->ctx))
 				goto end_wait;
 		}
 		/*

-- 
2.55.0

