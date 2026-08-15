Received: from mail-oo1-f66.google.com (mail-oo1-f66.google.com [209.85.161.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC21429DB64
	for <io-uring@vger.kernel.org>; Sat, 15 Aug 2026 23:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786834992; cv=none; b=XHJd8o8bl2Mm264kUmSwaNCRitlBlOLLO3RlBLGPNm5XPGAr6QfJ7YtBOpMBTgUhdbBdcfkZ/V8uvC0is9c2pLxJmBEYthXy7QrUl5xF18qr4NmEnBw9bus7MH8JyV7iLvY58+X10IihqEYLQDPH5czebmPo7UztSISBe1fe8E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786834992; c=relaxed/simple;
	bh=1u589KDy9iLZXXOe1JKvvvwI8wyTr4HxLVr/ufE4kkQ=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=K3+i5GK2s+o4OenJVTHbmnWhk9z3TPFGELtc5Bd5zWPEi9UlxEEW9bytyinYQFk35l+M7fKhf9NNGEl9z/1xEZhl+eUsV3+7ci3LwCMrkM574UN/6OUbTPHLXs1RYwLVWLmGJULNElWJjdqJ/+1UTFHXrM/3wRABuvKkGjv299Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=G8ianWbG; arc=none smtp.client-ip=209.85.161.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="G8ianWbG"
Received: by mail-oo1-f66.google.com with SMTP id 006d021491bc7-6ae50ba83efso1972269eaf.0
        for <io-uring@vger.kernel.org>; Sat, 15 Aug 2026 16:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1786834988; x=1787439788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OI4a7QilWb+W8fgaJKbOg+RL9+3+DpchYhViLPBMiv0=;
        b=G8ianWbGrTqO7zv2V+CsCAyYrnGNMtxVpiNRypgMH/ZPYrK/QkjH2W6KDmzJzZWOS7
         cJOJFOYqqHCizqJl7WDu0DrgduT9iJaA9itkvLhB8MpdKU2noNarDZjsnJ2ityLsGpgb
         PMOUSeA+FcKtsktaPiEjtS3ZDbYOG6p8hnbur/+Pb+acvy5UmPlcdu7kX4AG8C+0bPmv
         n4PRhnvElB2mmOeBkpx7B3NERtcJwM09vvpP6iX74aPhcGGcl8iHcPcsw2+1LNEgLCtt
         aje0VVwYhH3OT0fTBr6+JcS2br1ulsncT0ZNIHGvmPe5FZWfvFbwQe/21mBk4CmAd5j/
         ugiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786834988; x=1787439788;
        h=content-transfer-encoding:content-type:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OI4a7QilWb+W8fgaJKbOg+RL9+3+DpchYhViLPBMiv0=;
        b=FwiDu+/WRDkSu+uf7Pkk1yga7t815Q5EWaWcofONHIybZKkG8d2MFyexRz9dynyPSF
         /lVEkMlIxYPNYFxqEjnkM4Z8QwVkutrysZuxzVee/Lya/zo2VPVNl1nfeRUOpaMxcses
         olq09M+UGA5lmbjTu1lzFDnsT8QIGHLITKItppWLeEYjRjiIIGzx3nkWKP3y4+e6SUAd
         vR5NmGa9WSNDhRXH/Kwu+L2e/IQWypnPabmMBs4ijWOp7MboD/2syvkugHQaY9emZPox
         0rZtNXUASSOvJ1e3G+Za2CMqspPQo87ed+sfTgHyccGvjUnuXbqiPAGhMdtDXi5JgFXE
         +irA==
X-Gm-Message-State: AOJu0YxhiJEJ2n0h1GWtiMqIt6txbtqbw3Si/OhhjmVAOpF23YlTPODk
	E26ydVxZXByz/OpmheBAR2Ftq7GxdexgPVQDZ0uiKCTaezNFI6BWV8DsDGDhesxV85wniqYhE/h
	k9Z2HMf7sfPcg
X-Gm-Gg: AR+sD132WWMjz5guYOCSCzV+pqfTRDbtOvqpXTOYKkP99c3fcWpUpkUFsKTFmlojNlj
	+SaqDe7737wo4msestxw4eElVXwKasbT/el7a0DTuKSmMT4Jv648UkDN+coWzOOAsTdGFyFyzQX
	VhyWy8YUpnxaipMf9kSDjn3lOs+43bRmtr77sUG7sESvPFCaUQC+QIwOWoMcW7lV5m8qqtwwerV
	KOmmInO77aBaKTC0UISiNIEZhhF/1PGSbJhm4XTU5Hitkze1Rj5pqWosqO/d4qLLJ8b/PEoY+c2
	HJxMwWFEYVK0PZ1EhAAoKFhDKiSR7W577fkbyARLSI+l3pc4LYrq9C07YerlUMQOExusJwtkeyW
	9FYDflv/DqmxAAURqABjThy3jZJLNSpQwldyZ3r5AJtPUwzieFyIExnRnlW0lkK0qXaF3hFu8Db
	Joz3OjYXHyc1CE3TR5AXAfTLXb1jVU+RXkVZGS+DhwhIVNMNJ2I36bT60GUZ+WgePLF1mfUaCkB
	rKu39zmcs6g17zi5pYMyfF3haAtEAE6HhCy2vtQ5GtprWzHATSx
X-Received: by 2002:a05:6820:f02d:b0:6b0:594c:32a7 with SMTP id 006d021491bc7-6b0c5cc53b3mr14357365eaf.20.1786834988203;
        Sat, 15 Aug 2026 16:03:08 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45e8f976bfesm6034034fac.8.2026.08.15.16.03.06
        for <io-uring@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Aug 2026 16:03:07 -0700 (PDT)
Message-ID: <68c3dc59-5c30-4935-abfd-7946fdc5832f@kernel.dk>
Date: Sat, 15 Aug 2026 17:03:06 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: io-uring <io-uring@vger.kernel.org>
From: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] io_uring: defer eventfd signaling when queued from a wakeup
 handler
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

io_req_local_work_add() signals the CQ ring eventfd inline when it is the
one to push the first entry onto ->work_list. For DEFER_TASKRUN rings that
add is frequently done from a waitqueue wakeup handler, where an
arbitrary waitqueue lock is held.

eventfd_signal_mask() only refuses to recurse when current->in_eventfd
is set, but that bit is set by eventfd_signal_mask() itself. If the wake
chain starts somewhere else, signal goes out inline and can feed back
into epoll.

Add IOU_F_TWQ_IN_WAKE, set it on the task_work add done from the three
waitqueue callbacks, and use it to force io_eventfd_signal() down the
existing call_rcu_hurry() deferral instead of signaling inline.

Fixes: 21a091b970cd ("io_uring: signal registered eventfd to process deferred task work")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/all/20260813133843.2933127-1-4ncienth@gmail.com/
Signed-off-by: Jens Axboe <axboe@kernel.dk>

---

diff --git a/include/linux/io_uring_types.h b/include/linux/io_uring_types.h
index a2c623a67a25..f6e90cc64a1f 100644
--- a/include/linux/io_uring_types.h
+++ b/include/linux/io_uring_types.h
@@ -20,6 +20,14 @@ enum {
 	 * It's also ignored unless IORING_SETUP_DEFER_TASKRUN is set.
 	 */
 	IOU_F_TWQ_LAZY_WAKE			= 1,
+
+	/*
+	 * Set when task_work is queued from a waitqueue wakeup handler, where
+	 * an arbitrary provider waitqueue lock is held. Signaling the CQ ring
+	 * eventfd inline from there can recurse back into that lock through
+	 * epoll, so the eventfd signal must be deferred.
+	 */
+	IOU_F_TWQ_IN_WAKE			= 2,
 };
 
 enum io_uring_cmd_flags {
diff --git a/io_uring/eventfd.c b/io_uring/eventfd.c
index d656cc2a0b9b..63fe6e5d79ba 100644
--- a/io_uring/eventfd.c
+++ b/io_uring/eventfd.c
@@ -51,9 +51,9 @@ static void io_eventfd_do_signal(struct rcu_head *rcu)
 /*
  * Returns true if the caller should put the ev_fd reference, false if not.
  */
-static bool __io_eventfd_signal(struct io_ev_fd *ev_fd)
+static bool __io_eventfd_signal(struct io_ev_fd *ev_fd, bool defer)
 {
-	if (eventfd_signal_allowed()) {
+	if (!defer && eventfd_signal_allowed()) {
 		eventfd_signal_mask(ev_fd->cq_ev_fd, EPOLL_URING_WAKE);
 		return true;
 	}
@@ -73,7 +73,7 @@ static bool io_eventfd_trigger(struct io_ev_fd *ev_fd)
 	return !ev_fd->eventfd_async || io_wq_current_is_worker();
 }
 
-void io_eventfd_signal(struct io_ring_ctx *ctx, bool cqe_event)
+void io_eventfd_signal(struct io_ring_ctx *ctx, bool cqe_event, bool defer)
 {
 	bool skip = false;
 	struct io_ev_fd *ev_fd;
@@ -113,7 +113,7 @@ void io_eventfd_signal(struct io_ring_ctx *ctx, bool cqe_event)
 		spin_unlock(&ctx->completion_lock);
 	}
 
-	if (skip || __io_eventfd_signal(ev_fd))
+	if (skip || __io_eventfd_signal(ev_fd, defer))
 		io_eventfd_put(ev_fd);
 }
 
diff --git a/io_uring/eventfd.h b/io_uring/eventfd.h
index 400eda4a4165..e965d80d9fdc 100644
--- a/io_uring/eventfd.h
+++ b/io_uring/eventfd.h
@@ -5,4 +5,4 @@ int io_eventfd_register(struct io_ring_ctx *ctx, void __user *arg,
 			unsigned int eventfd_async);
 int io_eventfd_unregister(struct io_ring_ctx *ctx);
 
-void io_eventfd_signal(struct io_ring_ctx *ctx, bool cqe_event);
+void io_eventfd_signal(struct io_ring_ctx *ctx, bool cqe_event, bool defer);
diff --git a/io_uring/futex.c b/io_uring/futex.c
index f0d80a444f45..eaee14242a3a 100644
--- a/io_uring/futex.c
+++ b/io_uring/futex.c
@@ -181,7 +181,7 @@ static void io_futex_wakev_fn(struct wake_q_head *wake_q, struct futex_q *q)
 
 	io_req_set_res(req, 0, 0);
 	req->io_task_work.func = io_futexv_complete;
-	io_req_task_work_add(req);
+	__io_req_task_work_add(req, IOU_F_TWQ_IN_WAKE);
 }
 
 int io_futexv_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
@@ -237,7 +237,7 @@ static void io_futex_wake_fn(struct wake_q_head *wake_q, struct futex_q *q)
 
 	io_req_set_res(req, 0, 0);
 	req->io_task_work.func = io_futex_complete;
-	io_req_task_work_add(req);
+	__io_req_task_work_add(req, IOU_F_TWQ_IN_WAKE);
 }
 
 int io_futexv_wait(struct io_kiocb *req, unsigned int issue_flags)
diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 4c83a94b4bdc..76f049e29aa2 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -475,7 +475,7 @@ void __io_commit_cqring_flush(struct io_ring_ctx *ctx)
 	if (ctx->int_flags & IO_RING_F_OFF_TIMEOUT_USED)
 		io_flush_timeouts(ctx);
 	if (ctx->int_flags & IO_RING_F_HAS_EVFD)
-		io_eventfd_signal(ctx, true);
+		io_eventfd_signal(ctx, true, false);
 }
 
 static inline void __io_cq_lock(struct io_ring_ctx *ctx)
diff --git a/io_uring/poll.c b/io_uring/poll.c
index 0204affdc308..5447a7c24dce 100644
--- a/io_uring/poll.c
+++ b/io_uring/poll.c
@@ -208,9 +208,9 @@ enum {
 	IOU_POLL_REQUEUE = 4,
 };
 
-static void __io_poll_execute(struct io_kiocb *req, int mask)
+static void __io_poll_execute(struct io_kiocb *req, int mask, unsigned tw_flags)
 {
-	unsigned flags = 0;
+	unsigned flags = tw_flags;
 
 	io_req_set_res(req, mask, 0);
 	req->io_task_work.func = io_poll_task_func;
@@ -218,14 +218,15 @@ static void __io_poll_execute(struct io_kiocb *req, int mask)
 	trace_io_uring_task_add(req, mask);
 
 	if (!(req->flags & REQ_F_POLL_NO_LAZY))
-		flags = IOU_F_TWQ_LAZY_WAKE;
+		flags |= IOU_F_TWQ_LAZY_WAKE;
 	__io_req_task_work_add(req, flags);
 }
 
-static inline void io_poll_execute(struct io_kiocb *req, int res)
+static inline void io_poll_execute(struct io_kiocb *req, int res,
+				   unsigned tw_flags)
 {
 	if (io_poll_get_ownership(req))
-		__io_poll_execute(req, res);
+		__io_poll_execute(req, res, tw_flags);
 }
 
 /*
@@ -344,7 +345,7 @@ void io_poll_task_func(struct io_tw_req tw_req, io_tw_token_t tw)
 	if (ret == IOU_POLL_NO_ACTION) {
 		return;
 	} else if (ret == IOU_POLL_REQUEUE) {
-		__io_poll_execute(req, 0);
+		__io_poll_execute(req, 0, 0);
 		return;
 	}
 	io_poll_remove_entries(req);
@@ -383,7 +384,7 @@ static void io_poll_cancel_req(struct io_kiocb *req)
 {
 	io_poll_mark_cancelled(req);
 	/* kick tw, which should complete the request */
-	io_poll_execute(req, 0);
+	io_poll_execute(req, 0, 0);
 }
 
 #define IO_ASYNC_POLL_COMMON	(EPOLLONESHOT | EPOLLPRI)
@@ -392,7 +393,7 @@ static __cold int io_pollfree_wake(struct io_kiocb *req, struct io_poll *poll)
 {
 	io_poll_mark_cancelled(req);
 	/* we have to kick tw in case it's not already */
-	io_poll_execute(req, 0);
+	io_poll_execute(req, 0, IOU_F_TWQ_IN_WAKE);
 	io_poll_remove_waitq(poll);
 	return 1;
 }
@@ -430,7 +431,7 @@ static int io_poll_wake(struct wait_queue_entry *wait, unsigned mode, int sync,
 			else
 				req->flags &= ~REQ_F_SINGLE_POLL;
 		}
-		__io_poll_execute(req, mask);
+		__io_poll_execute(req, mask, IOU_F_TWQ_IN_WAKE);
 	}
 	return 1;
 }
@@ -618,7 +619,7 @@ static int __io_arm_poll_handler(struct io_kiocb *req,
 
 	if (mask && (poll->events & EPOLLET) &&
 	    io_poll_can_finish_inline(req, ipt)) {
-		__io_poll_execute(req, mask);
+		__io_poll_execute(req, mask, 0);
 		return 0;
 	}
 	io_napi_add(req);
@@ -629,7 +630,7 @@ static int __io_arm_poll_handler(struct io_kiocb *req,
 		 * poll was waken up, queue up a tw, it'll deal with it.
 		 */
 		if (atomic_cmpxchg(&req->poll_refs, 1, 0) != 1)
-			__io_poll_execute(req, 0);
+			__io_poll_execute(req, 0, 0);
 	}
 	return 0;
 }
diff --git a/io_uring/tw.c b/io_uring/tw.c
index a4c872870d81..bf4e5aa5c2e7 100644
--- a/io_uring/tw.c
+++ b/io_uring/tw.c
@@ -170,7 +170,7 @@ void io_req_local_work_add(struct io_kiocb *req, unsigned flags)
 	if (mpscq_push(&ctx->work_list, &req->io_task_work.node)) {
 		io_ctx_mark_taskrun(ctx);
 		if (data_race(ctx->int_flags) & IO_RING_F_HAS_EVFD)
-			io_eventfd_signal(ctx, false);
+			io_eventfd_signal(ctx, false, flags & IOU_F_TWQ_IN_WAKE);
 	}
 
 	/*
diff --git a/io_uring/waitid.c b/io_uring/waitid.c
index 32f68fd7fcdd..76af129ba8ca 100644
--- a/io_uring/waitid.c
+++ b/io_uring/waitid.c
@@ -253,7 +253,7 @@ static int io_waitid_wait(struct wait_queue_entry *wait, unsigned mode,
 		return 1;
 
 	req->io_task_work.func = io_waitid_cb;
-	io_req_task_work_add(req);
+	__io_req_task_work_add(req, IOU_F_TWQ_IN_WAKE);
 	return 1;
 }
 
-- 
Jens Axboe

