Received: from oss.cyber.gouv.fr (oss.cyber.gouv.fr [51.159.188.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77284BC010;
	Thu, 24 Sep 2026 20:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.188.251
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790283217; cv=none; b=jg9YtOrkACADWmU3LJy0+L1i419rDz4zXwdCyeoa8wdGkt7Y1XNJ8dTAOvl5ukLqdgTslAzaS9H8dwe+NROgE0uf95Vj6HX3juteQrPn2KXArchXn07VtTRxPrD6I+8BDVpwy5Ba8SpUnvnQHpG41ZQoFIIZsUx+ciP3n43ZqnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790283217; c=relaxed/simple;
	bh=PP6huQE6i0Cw71fIBSGOIjwOvUShfn7NEj4Oci31DIg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=imsDwmg3xUqMDdwt/kVqXKyT8f7DdKOARxAkg9s8dqkvEFSstmCH/ggm3TzdYC/QkOLUwVUEMeBGPgZ5oKAXX26rW7QH7OMsNGMdHSMp4xoQqID5acbXtbBppJR+efCWh+bUvrAM6e0VbiimrnZCVCj90JQ5Qe+5lxx3/uMFvl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr; spf=pass smtp.mailfrom=oss.cyber.gouv.fr; dkim=pass (2048-bit key) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.b=EgF5U1qR; arc=none smtp.client-ip=51.159.188.251
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.b="EgF5U1qR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=oss.cyber.gouv.fr; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Sender:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=7Mf0AHVyhRsT7RC43GpKt8LCS8CINuxBAYo22Aqq6K8=; b=EgF5U1qRc+2MV/W3Ms8CKHPxEV
	WGNiAnF4CeB8Yw8g/yB8RJ9jjWxzYHNadYPum0wUrAOOn+PQ7VFtKgvniWjqBdewJa8uNf4CLlpVk
	YwXw6TN78MbOIhkzp5jiBQ+ZbNZNzW+o5J1f4QrF1XIe1045Z4Gdheb9r2NlV6IGPfjP9bqf0jVka
	S1jzLyqIeuvg5fX+IxJvedw94kZrCnA8ANwcdj7+4dwRYCQibXXk3HiL/5FbvOQ/jp21VseqRIzPS
	lm0dnD2xU0XXjorAA/6NTG9SB2kdZZbYWoYBodH/Sq+IVHPTKw35gtUIdqMQOgfYNSEICKAcnIXNG
	kQIT+71A==;
Received: from [151.115.150.205] (port=42744 helo=gepetto..)
	by pf-012.whm.fr-par.scw.cloud with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <Jeremy.Jean@oss.cyber.gouv.fr>)
	id 1x9qRc-0000000Ga2g-1VSZ;
	Thu, 24 Sep 2026 22:53:28 +0200
From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Jean?= <Jeremy.Jean@oss.cyber.gouv.fr>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?J=C3=A9r=C3=A9my=20Jean?= <Jeremy.Jean@oss.cyber.gouv.fr>
Subject: [PATCH] io_uring/sqpoll: pin task across task-work publication
Date: Thu, 24 Sep 2026 20:50:57 +0000
Message-ID: <20260924205056.3759980-2-Jeremy.Jean@oss.cyber.gouv.fr>
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

Handle SQPOLL before publication. Pin tctx->task, publish the request,
then use only the pinned task so the publication tail cannot dereference
freed contexts.

Fixes: af5d68f8892f ("io_uring/sqpoll: manage task_work privately")
Assisted-by: LLM
Signed-off-by: Jérémy Jean <Jeremy.Jean@oss.cyber.gouv.fr>
---
 io_uring/tw.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/io_uring/tw.c b/io_uring/tw.c
index f573bcc3af6a..2e37a3fd7a33 100644
--- a/io_uring/tw.c
+++ b/io_uring/tw.c
@@ -210,6 +210,19 @@ void io_req_normal_work_add(struct io_kiocb *req)
 	struct io_uring_task *tctx = req->tctx;
 	struct io_ring_ctx *ctx = req->ctx;
 
+	/* SQPOLL may consume and retire the request immediately after push. */
+	if (ctx->flags & IORING_SETUP_SQPOLL) {
+		struct task_struct *task = tctx->task;
+		bool first;
+
+		get_task_struct(task);
+		first = mpscq_push(&tctx->task_list, &req->io_task_work.node);
+		if (first)
+			__set_notify_signal(task);
+		put_task_struct(task);
+		return;
+	}
+
 	/* tw run already pending, nothing else to do */
 	if (!mpscq_push(&tctx->task_list, &req->io_task_work.node))
 		return;
@@ -221,12 +234,6 @@ void io_req_normal_work_add(struct io_kiocb *req)
 	if (ctx->flags & IORING_SETUP_TASKRUN_FLAG)
 		atomic_or(IORING_SQ_TASKRUN, &ctx->rings->sq_flags);
 
-	/* SQPOLL doesn't need the task_work added, it'll run it itself */
-	if (ctx->flags & IORING_SETUP_SQPOLL) {
-		__set_notify_signal(tctx->task);
-		return;
-	}
-
 	if (likely(!task_work_add(tctx->task, &tctx->task_work, ctx->notify_method)))
 		return;
 
-- 
2.47.3

