Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285CD577E3C
	for <io-uring@vger.kernel.org>; Wed,  9 Sep 2026 14:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963021; cv=none; b=X3fQpei3GP48f4qWLRUB4a3pjJuoILOch7ab+glZBuDh+sEb+DndAewpeCajMLyvef33+vi+rUNupDD2jux3grK3Zkj/JdR7nyDmN0PGCgBUabGzFXRfav7LjQnMjDC98rYtSnhR0VIXPqwMXzDd1PHGL6iFI4Jof/npn1FAXKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963021; c=relaxed/simple;
	bh=NLmbLNWsUbfCVqPJxPBc+IhJwV94n9TM+yt7NV+lDB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k1hg49qHq1lSK84Zg/bTd4KejHMWqVVtygT+ImfnlviBRSSk1F/7SGM7Ozf7F64jYLgNa8WMTXJIwfw1Q7ogMPAbfgnjy4q367kl9W/R1mFPlZTU55NLMPXFMxl7w6EVasG6BJdi95u1Jyz/MYGn/igWkq5TPP3X9BxNu7pUsIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=ScKtT3k3; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="ScKtT3k3"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-47b5043f191so608051fac.3
        for <io-uring@vger.kernel.org>; Wed, 09 Sep 2026 07:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1788963018; x=1789567818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zwrLtl9Vhti5Qwhgu5sV6jBGbJKPIWhU2OBksIntyJQ=;
        b=ScKtT3k3hHkOzqSLlAHW5mRrrTZuDRUoss2XogDs+hb2DgejekHo2MdaZXbkvUzB/Q
         UFgMis8sg8qp9iMbM7POqfQihBTgDAJt/z/mCuBG3xUCUbLGMxrcqYxS9cEbZRtzx6Km
         d6I9ud2gRagbGWwtoN53qYTOivAuEgau6Bx2j2beZpyUeUs5u7Hp++YgGBrzRiJZY1hf
         UCFr0l1iLNTKXhux7TMuzLGL4CbFSqMGwoBD0WNC7g9lS0U+RBpqwmSig68JCkUKLa+7
         w1r0ZOARW32c1lmidPIJ11/Xqw0H9aI1cbNoEmjIw7xuFoue1oiAlshY5mzW5bTXkywx
         0LQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963018; x=1789567818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zwrLtl9Vhti5Qwhgu5sV6jBGbJKPIWhU2OBksIntyJQ=;
        b=ejalM45ZV54F+prn/qAL53MLUaknhWrZZaNVn3hWnFOLdToLEZnvTsuU/e1KAc/OwW
         QPizVALWRe5LSkGOgt4rSWdMDM/MJ62646Wx5DpGOL8ZS/pr4HIKRJh1PHsXbPqwLfwY
         EJavXqE544jVNy0BZwCEsnlNGgsb5fuirONHkCEfv/DxnyQxeSC+1vbs1lR1dwsqtFYd
         65gQvJBUyOtlbLiuV3qTmqcgrHjofgZyqYo70jGqS0mwdFpwcYFgr2q8PvN8x8n+Q6QT
         DR5l9SgI2ZYWRzZ5kpXEqDXtjgKW9J2IvunOnOdkH53RHHUy5Vytp8T4Z855x1acAC1I
         jcWg==
X-Gm-Message-State: AFuF++mqYHfaskJO5EUsf3bKWGplkepQTDgGXEiRu4VZvPSwUC94vLEd
	jIDkK/6E7VFTSinlqVSM/VHwXk9A20P+UzRDkdzbgWFTsxurf+PEKwUM+GKCuS7nQyLTPbGIFDU
	0WRzxoyI=
X-Gm-Gg: AYBFou3V4JKv4IEgxvajQPXjRqa8ycl+oLy5ynxzHosVjW5QvrXgR5NEbhaIEbhb7Qi
	mWwL0JV5dgUYCHC9eGyHJCjp0Rj4SRuFe9/DfZQ6INziICirKC2JJUJFnhX5ql0MmZ+4+C/ajAD
	PySCBGvxzNOJZbjQ5bCrPOa5b1nvBTaRy6+943nZ2RemLfPqk4l5pxT9sbdcilWbNqGf/+r8ewS
	AI/PZ0pTZNQOq21+gno3P4hmHzqDa+L9FSQYGRRaOHTlgjMA+mU2jPdBhwmx+Uze3keebD9ancs
	R3upESK4JgCf6CRqJGP9WhZtvqfuQMnwVgq+FfOrLzj7+H9bb38xl3WTDgqOsCBSBLv03KIzf5a
	VD4cQn0BovNR48WB37OoD2MEMboI92Qj/xlyEoRtcNgPgI6j7Da6SPVmTpFuwKz7R6N8MhxcbwE
	ZVVjU8HomgOQrGJYWWgiSZpmXanqHKcx3R8qXa34Fywnobqerdxr+N8Spetrvs42gEwiczQHnNA
	agewJkssIp+UF7P1RO9VTSnaBTWPWOxYHvtSsiGI9x6
X-Received: by 2002:a05:6870:a711:b0:45e:4deb:92e7 with SMTP id 586e51a60fabf-47b4a429221mr6798752fac.10.1788963017904;
        Wed, 09 Sep 2026 07:10:17 -0700 (PDT)
Received: from m2max ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47a7585b25esm5406514fac.11.2026.09.09.07.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:10:15 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: juanlu@fastmail.com,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 1/7] io_uring/uring_cmd: only cancel requests of the given task
Date: Wed,  9 Sep 2026 08:06:11 -0600
Message-ID: <20260909141010.21064-2-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909141010.21064-1-axboe@kernel.dk>
References: <20260909141010.21064-1-axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

io_uring_try_cancel_uring_cmd() ignores the task it is asked to cancel
on behalf of as soon as cancel_all is true, and cancels every cancelable
command on the ring instead. That differs from how other requests are
matched, where a valid task always restricts matching to that task's
requests and cancel_all simply lifts the REQ_F_INFLIGHT restriction.

So far the only caller passing both a task and cancel_all is exec, where
tearing down another task's commands on a shared ring is somewhat
impolite. The exit path is about to do the same for every exiting
process though, so bring it in line. Match on the task if one is given,
and cancel everything only for ring teardown, which passes NULL. This
leaves cancel_all as useless, hence drop it.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/cancel.c    | 2 +-
 io_uring/uring_cmd.c | 4 ++--
 io_uring/uring_cmd.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/io_uring/cancel.c b/io_uring/cancel.c
index 7d7820eab878..5ee94246c43c 100644
--- a/io_uring/cancel.c
+++ b/io_uring/cancel.c
@@ -560,7 +560,7 @@ __cold bool io_uring_try_cancel_requests(struct io_ring_ctx *ctx,
 	ret |= io_poll_remove_all(ctx, tctx, cancel_all);
 	ret |= io_waitid_remove_all(ctx, tctx, cancel_all);
 	ret |= io_futex_remove_all(ctx, tctx, cancel_all);
-	ret |= io_uring_try_cancel_uring_cmd(ctx, tctx, cancel_all);
+	ret |= io_uring_try_cancel_uring_cmd(ctx, tctx);
 	ret |= io_kill_timeouts(ctx, tctx, cancel_all);
 	mutex_unlock(&ctx->uring_lock);
 	if (tctx)
diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
index 726a659f38c3..28a87480626c 100644
--- a/io_uring/uring_cmd.c
+++ b/io_uring/uring_cmd.c
@@ -49,7 +49,7 @@ void io_uring_cmd_cleanup(struct io_kiocb *req)
 }
 
 bool io_uring_try_cancel_uring_cmd(struct io_ring_ctx *ctx,
-				   struct io_uring_task *tctx, bool cancel_all)
+				   struct io_uring_task *tctx)
 {
 	struct hlist_node *tmp;
 	struct io_kiocb *req;
@@ -63,7 +63,7 @@ bool io_uring_try_cancel_uring_cmd(struct io_ring_ctx *ctx,
 				struct io_uring_cmd);
 		struct file *file = req->file;
 
-		if (!cancel_all && req->tctx != tctx)
+		if (tctx && req->tctx != tctx)
 			continue;
 
 		if (cmd->flags & IORING_URING_CMD_CANCELABLE) {
diff --git a/io_uring/uring_cmd.h b/io_uring/uring_cmd.h
index 041aef8a8aa3..a5cb3f2ee1c5 100644
--- a/io_uring/uring_cmd.h
+++ b/io_uring/uring_cmd.h
@@ -14,7 +14,7 @@ void io_uring_cmd_sqe_copy(struct io_kiocb *req);
 void io_uring_cmd_cleanup(struct io_kiocb *req);
 
 bool io_uring_try_cancel_uring_cmd(struct io_ring_ctx *ctx,
-				   struct io_uring_task *tctx, bool cancel_all);
+				   struct io_uring_task *tctx);
 
 bool io_uring_cmd_post_mshot_cqe32(struct io_uring_cmd *cmd,
 				   unsigned int issue_flags,
-- 
2.55.0

