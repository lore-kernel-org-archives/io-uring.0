Received: from oss.cyber.gouv.fr (oss.cyber.gouv.fr [51.159.188.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345CD3AFD1E;
	Fri, 25 Sep 2026 09:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.188.251
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790329868; cv=none; b=fN92wDEDhlkUOYVBlyxmGjXFrKuJu7z0+/hfWjODkpsoJ9QhjPbYiu50gIyT23Ih0DWJocJLvVuOjgTFC1gJhmioTbYWUvaPX4YKCr3B+6eF5CEH4AEyC+4UPufowLKGNjN+CiAfqD98SFxxKf9bkKxwR6oM4lLs+9R/UP622tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790329868; c=relaxed/simple;
	bh=8Ea2qyDzuocvWqgNPPojhP+Xz/Hw5Yl22UHqF5Kk+uc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=E1NBIn/T67OORbmmxqFEvGHJcLGniWpdhKzSTMOKOXpl0JD/jEVzgTPIjl02qSmQj23bmrqk//CFkcS0hEARkB8G5Pcl+tjmAGWvJWt3o7yQ0r6D8QxOSJUMTEYo/NeU0MFYf75tXC2VRXfFNEkyQGCQublPERO9iKG/CMhhEdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr; spf=pass smtp.mailfrom=oss.cyber.gouv.fr; dkim=pass (2048-bit key) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.b=dIHLRlDk; arc=none smtp.client-ip=51.159.188.251
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.b="dIHLRlDk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=oss.cyber.gouv.fr; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Sender:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=zq/hyhQmMZrbMuEIFbsVfsxn+x3o2IhJYdy95BDVoDQ=; b=dIHLRlDkThbrzQWveyfCTJgSRj
	Oq8t6zRdnFQUJQMnOZCY8sNUDwBvHUahwO8n4Fby7Kndm1st0ed9Jxwlsl/hWJ7w51OVqR7IrA+Ch
	8LTQy0Dl8Gt6aZUTg6ogws8dDYsH2U7XOG/cWeDfof1Bpv/+0tZy4Rup3SGCKjv1mSB9A4AN3eY1S
	qy0RTLeC6BiBewbAryrDMYIp5FU57WyLspIX7Ykcaa6aZgpTnB0JC5+FYK9FnEmfY6fXgP0vdJejZ
	RLoWPP0ZJ9iPQKcIabR5AZ26Ii8rktLKW0J/tv7clzuJRultONlG5HdNy7L+i8oWtggo5VqFZbKFq
	88KELfBQ==;
Received: from [151.115.150.205] (port=55642 helo=gepetto..)
	by pf-012.whm.fr-par.scw.cloud with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <Jeremy.Jean@oss.cyber.gouv.fr>)
	id 1xA2a5-0000000EpVQ-1MJG;
	Fri, 25 Sep 2026 11:51:00 +0200
From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Jean?= <Jeremy.Jean@oss.cyber.gouv.fr>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?J=C3=A9r=C3=A9my=20Jean?= <Jeremy.Jean@oss.cyber.gouv.fr>
Subject: [PATCH v2] io_uring/sqpoll: protect task-work publication with RCU
Date: Fri, 25 Sep 2026 09:50:07 +0000
Message-ID: <20260925095006.445872-2-Jeremy.Jean@oss.cyber.gouv.fr>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - pf-012.whm.fr-par.scw.cloud
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oss.cyber.gouv.fr
X-Get-Message-Sender-Via: pf-012.whm.fr-par.scw.cloud: authenticated_id: jeremy.jean@oss.cyber.gouv.fr
X-Authenticated-Sender: pf-012.whm.fr-par.scw.cloud: jeremy.jean@oss.cyber.gouv.fr
X-Source: 
X-Source-Args: 
X-Source-Dir: 

SQPOLL can consume a request immediately after mpscq_push(). If this
drops the final ring reference, ctx and tctx may be freed before
io_req_normal_work_add() finishes using them. KASAN reports:

  BUG: KASAN: slab-use-after-free in io_req_normal_work_add+0x439/0x510
  Read of size 4 at addr ff11000000ca0000 by task repro/55
  (...)
  BUG: KASAN: slab-use-after-free in queue_work_on+0x25/0x70
  Write of size 8 at addr ff11000000c3bd00 by task repro/55

Add guard(rcu)() to io_req_normal_work_add() and wait for RCU readers
when freeing an SQPOLL ring, as done for DEFER_TASKRUN. Save
tctx->task before queueing the request so notification can use the
saved pointer under RCU even if SQPOLL cancellation has freed tctx.

Fixes: af5d68f8892f ("io_uring/sqpoll: manage task_work privately")
Assisted-by: LLM
Signed-off-by: Jérémy Jean <Jeremy.Jean@oss.cyber.gouv.fr>
---
Changes in v2:
- Add guard(rcu)() to io_req_normal_work_add() (Jens Axboe).
- Extend io_ring_exit_work()'s synchronize_rcu() to SQPOLL (Jens Axboe).
- Cache tctx->task before publication for SQPOLL cancellation.

v1: https://lore.kernel.org/all/20260924205056.3759980-2-Jeremy.Jean@oss.cyber.gouv.fr/

 io_uring/io_uring.c | 4 ++--
 io_uring/tw.c       | 7 ++++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 61053421d809..a1e961549468 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -2403,8 +2403,8 @@ static __cold void io_ring_exit_work(struct work_struct *work)
 	spin_lock(&ctx->completion_lock);
 	spin_unlock(&ctx->completion_lock);
 
-	/* pairs with RCU read section in io_req_local_work_add() */
-	if (ctx->flags & IORING_SETUP_DEFER_TASKRUN)
+	/* pairs with RCU read sections in io_req_{local,normal}_work_add() */
+	if (ctx->flags & (IORING_SETUP_DEFER_TASKRUN | IORING_SETUP_SQPOLL))
 		synchronize_rcu();
 
 	io_ring_ctx_free(ctx);
diff --git a/io_uring/tw.c b/io_uring/tw.c
index f573bcc3af6a..0985b6ab6dfe 100644
--- a/io_uring/tw.c
+++ b/io_uring/tw.c
@@ -209,6 +209,10 @@ void io_req_normal_work_add(struct io_kiocb *req)
 {
 	struct io_uring_task *tctx = req->tctx;
 	struct io_ring_ctx *ctx = req->ctx;
+	struct task_struct *task = tctx->task;
+
+	/* pairs with synchronize_rcu() in io_ring_exit_work() */
+	guard(rcu)();
 
 	/* tw run already pending, nothing else to do */
 	if (!mpscq_push(&tctx->task_list, &req->io_task_work.node))
@@ -223,7 +227,8 @@ void io_req_normal_work_add(struct io_kiocb *req)
 
 	/* SQPOLL doesn't need the task_work added, it'll run it itself */
 	if (ctx->flags & IORING_SETUP_SQPOLL) {
-		__set_notify_signal(tctx->task);
+		/* SQPOLL cancellation may have freed tctx after the push. */
+		__set_notify_signal(task);
 		return;
 	}
 
-- 
2.47.3
