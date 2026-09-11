Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF1849B5B3
	for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 15:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141703; cv=none; b=Gk9Lqmf1ZsA/mih8LIuspJAGclqDVGrytpuK7ob6hReZgObRtpX9VKNUKt5oGSt9lUjAZSCFOq4y9Vbx7MR5BfBTz1K5/rnlWFdP8cnfPbwdeQSJK+7/OdDaM3/E8PqThGc+BuOXK/XTUUfFWq1eI+4rJMLGgyZIU5JRcXrMT1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141703; c=relaxed/simple;
	bh=NLmbLNWsUbfCVqPJxPBc+IhJwV94n9TM+yt7NV+lDB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sa9ST/aM3I7MNt5xqa0Pz1M2f7tS2PlrfN8/ftVw/TaL8osdsYQV2Qod+ZTXj7kfoDULHDsUcQaNvuCBQgOiH/w+2cXBaBrbJGrlfF2weSUHrQPX7QqNb/xlwCaxSJ+m8Ngd6hV12pD0JRrw3/MArk+vhMVqgdQLqpaAKIy9jr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=O/P1msQ1; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="O/P1msQ1"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7f6617c7536so690941a34.1
        for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 08:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141700; x=1789746500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zwrLtl9Vhti5Qwhgu5sV6jBGbJKPIWhU2OBksIntyJQ=;
        b=O/P1msQ1qQBjEF2HYXktOo6STOJVBFzB5zckMjcGm7H5tlr7yKEZ4twYabhDaOQqEP
         b2KZmYHMIvz1HPYPvbBkm7qgu/dc66IVTuT6q2+yRdUW9lmEFntr27rYRcwo41atg1cV
         NjQuy1KvUitaXzuN/gC3gX2NTHndVfOpfQu/8ukGCiif6I2kXkLJ8r2WsxB3mvUatm/D
         DCaukZHXMyAhiDTBtc61zIWITD6Vt0345LOKRI8+K8uu5QQKDbp9YQba7FKwDglZ8hzQ
         wHU3E8zpiJiR5GGVPKoM2//at6MDjKUCN4bARiieo5OpxQ+hYbaIc2ecuNN1W++PumZg
         GPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141700; x=1789746500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zwrLtl9Vhti5Qwhgu5sV6jBGbJKPIWhU2OBksIntyJQ=;
        b=PoAZrTDn9LMy0ELcxA14oyh3OlZkLMXHMn8U276vCMcQyCtfBKHEhYT0rXTT/3Bbqh
         sFpA7mJwfKtEl2AfH0fTosPNIflFtxhi9ImY+Lm7nyfDXmHC35qrPbyRtj5H0x9Y+8vh
         eW3T+nuWmOrQ+VCD9TvrjFUSjZHDSTqes3An+XIFb8B4rOclhwcnjFjLZfSXIbihxbfA
         hWHnyULMJBKvcQLooeRzyK59RxDHzZ6CT1+hNZlRUPY6pBIUHpLTjYvADie0zkY+kG1b
         eHBXBeezNwDiNBM0sLc4WxnXPkhalwhoy4C+JID4rvYqfTYfqa3RJVcW29lL4udvxYYQ
         52uw==
X-Gm-Message-State: AFuF++k14JKdfXfJq75VzJeq+0eknAKXHK0JnYqMuqd3NgnS+KujYqvi
	+aYyKwz81GzyioxF80flm7msgAsF8EpypbT1iNLOdgWip1RccPdJPXqbgjb9+CCTfrzK5zLOTLP
	lMeJJvF8=
X-Gm-Gg: AYBFou2hLb98Uw0xbKAfely4sICQw7k9B6FJxV9edmhz7n/ckqQYWZ59t+Refs5rv9q
	4XlRddsihklLg1OOxwjejm4fKucC4a6WM4d4xWC8fjSWwZAaW0Zlqnbxt8qA8GF3Gmo1v3+LTlR
	QawJDXup0p9vwJmb6Tc5I8w+L7AJgkGC0K6ZYLEZcyImFSFpFKGc7vIqduaGCTH6Qv01uO8BOlW
	lTnyFfut9f5abXQTMpQmqKfuzNpWZbHgjkEs+HhRHccscmtag69M0a8gkalnAbNINtgmwehcf2z
	Vlhn6bYNiDTz5ESKoEWu2l3qQXK5jqXwSU5MLXIaOfVkPF5g8aH+cDrw2adnLYuS1/L34YlVZlk
	kmxw1duTdrln+6twbyhSgB/LA6R49UoUHywVrF1XY3qbH38IxPVrgVZLtK6BYbYCKxTCeVpSWEh
	S0mjVN/jAGOPCm7W2sldT/Ryt02ZE3SZTTeoY2MTGCF+gpDv974LaC5ULxJofHNFhtgvcAquotV
	lIwcGYJIi0iPksf6hGIgIrgWjZYRCd6mk/lmYtKSFo=
X-Received: by 2002:a05:6830:442a:b0:7fa:5c68:d049 with SMTP id 46e09a7af769-80401778106mr4053239a34.19.1789141700170;
        Fri, 11 Sep 2026 08:48:20 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f6d1ca4bsm2629478a34.23.2026.09.11.08.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:48:19 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: juanlu@fastmail.com,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 05/10] io_uring/uring_cmd: only cancel requests of the given task
Date: Fri, 11 Sep 2026 09:45:29 -0600
Message-ID: <20260911154811.646705-6-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911154811.646705-1-axboe@kernel.dk>
References: <20260911154811.646705-1-axboe@kernel.dk>
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

