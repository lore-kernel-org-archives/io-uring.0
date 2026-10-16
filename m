Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B047478
	for <io-uring@vger.kernel.org>; Fri, 16 Oct 2026 00:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792110439; cv=none; b=H9PQDmWlQCBedUzdbO6GnfkC3GeED0Y3FRGoq7+A/rEoOKUO5kbue7Qg6T7bUyynoIkgTDLz/dxtEGDQGluR5Jpp2NvTZGJZ9lztRbVzuJY7QNyp6FKVc20P2QfFQi1qnDydvLRMAqLGA/HW4KJ34u7l0bbmjwpQu8HeW867qR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792110439; c=relaxed/simple;
	bh=APl9DDF+W9jBr0HBuEE/fLQUrk73sq0BPWbEkkfmAXA=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=kslOYxUkp88rLyvargO+GxROM+s9SrPvaXfBRgHcg0u8DRaUmxOjCo7oB8MOYrkrNmDkh5Yt8pPPzVZ+Q+hDye3ISk3kxzT1+NcXpKtJqZmouPEQJFtN9dOeCm0YHzxs5yH0zA6Yov81rbS03CFM9MS1mMHwydW7ii7dNaeJ0ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=FIRwk29Q; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="FIRwk29Q"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso4324283eaf.1
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 17:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792110436; x=1792715236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xH6t8tXOE4wpcCllUqaFZTAcAEf9vS3IVUzuJ/SJz9U=;
        b=FIRwk29QgxsLD5/BfmAGCASXBVUQENXZ8MSk2KdUFQSL8nj1rNowppbpz+2t3z6Ocu
         QGEgbecaq/NIm8vio2slb2EWwEwczjViDgIZewyV1XwFOk+RWP2b/Oub8m7tnupR1kI8
         OGwRz1bf9T84/fw4WgOsbfS3uQsUp2F5GkM4UvG2PP5R1KAQOlFuMjVt084p+4MEZ6VR
         FPMoJzG/2Fuvqgw9BMOBDAowi6CWn7X17MhBtSBHZkYnA/toVOuw3njHRNTDQ/VdZGRW
         hDA7I3X3UuEpTjLW6r/E77j6zoxWb0NnVMcZvveZvURegXC6wSJnyH8x5I9kbhZd+1Ne
         ZCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792110436; x=1792715236;
        h=content-transfer-encoding:content-type:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xH6t8tXOE4wpcCllUqaFZTAcAEf9vS3IVUzuJ/SJz9U=;
        b=EDb7VxNFCgApfwhv5ph6hCBrXqBQCbSCtcn9z3TboZ4cRxF57AxsMta3qgSM0THaJA
         ZbRTroqpCdd2myvJPeX1awTE/nnsR04WhKNx7GBbYO798h4c6OH3V8cyZ8/8UjY6tiT1
         Yn/k3dXWMHrZXgcoxsjazJ6cnMB7gieyHhodlsdEoOPXCAEGGUMiz+9GVdE+3p4JBgmY
         393n3DAyFMWML3aEpO/C9gQAFyfjil9Kf4qLaT9FM2eBaGyKRVXCZfjwURFc3FTRJH0d
         incwF6JwDeBiwAeIZaAVwCgq1rRMr1+joBUoEfYKtt3cr+i4GgUAe+1pTa7EAHt2fxPP
         1HXg==
X-Gm-Message-State: AFq9FYJnI2wsKXgdnjqYc/9NTGlxSCo3moSZh8OHkrB5DldCfDGxMKTu
	gg80hIMjig+iQXYjlY7KAnUkGYiI+pC/MhoR6w0zFWDF5kHv9VbG6la+5ENOjLHDwqssk2Z1EGB
	LdWFBP2I=
X-Gm-Gg: AYBFou0wU0JvcQ6csh9x7igzFN4zKmT9qgqgQUDgMIkzpHckkygT0y895Z2LvRs0ljb
	UIm0gGP8XmSDBSI8B5aaLzVOPX/I4UVrX0dPGwL6NxzBHVmeHMvPTX4ZZoQORic5tJTqKaxNH82
	3zeqUFlaB/Jqv885XWz7nQh8W7wjT23JgwXoY8A/OkZGdzDudod6PViEY7ItNUUdJ/M9+YxFxPl
	IZZ4p/SnSCmIXkKhlig3FXo15ZM85D04pbhjKI81AGcU+CaZeTKLy4n/f7krOewk8honA1mfJGA
	QSkeED++E0xpSN8qKCbr+vFLv5e5V0sWb+X2Zb6Cp1fjJh9kq5nvE8Rf/cSao/3Qu3qgNx/2zYF
	oiFtbsuflLGYHM7pdWQWDDcOXkN8ue9ojBQXqkB17VdCCWFHGmo+305QyGRNnHqlauZ86U1UHw2
	O1PYsNrT0vM+2ZweXlZQaXV4NkuVnRc8RWwMLY/iJJTqQkWm3/mm7ceo1eqXHAVDOdNiumK0k0m
	mJeT6XrqLFTtpjiA7V2MuhLABZyhyG2uEMWJgwS4qeKNUhO0hEiBtlAog==
X-Received: by 2002:a05:6820:61b:b0:6fd:1f44:833 with SMTP id 006d021491bc7-6fd1f4408ccmr5027557eaf.42.1792110435626;
        Thu, 15 Oct 2026 17:27:15 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-701833928f6sm614147eaf.0.2026.10.15.17.27.13
        for <io-uring@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 17:27:14 -0700 (PDT)
Message-ID: <d0d8044c-3e8d-4c0f-849d-061ecae052ed@kernel.dk>
Date: Thu, 15 Oct 2026 18:27:12 -0600
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
Subject: [PATCH] io_uring/timeout: don't lose a cancel as io-wq arms a timeout
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

An IORING_OP_TIMEOUT run by io-wq, because of IOSQE_ASYNC, has the same
problem as poll, futex and waitid. io_wq_submit_work() looks at
IO_WQ_WORK_CANCEL once, before it issues the request. A cancel in between
flags the work, gets -EALREADY, and searches ->timeout_list in vain,
while the worker then adds the request and starts the timer:

  io-wq worker                          io_try_cancel()
  io_wq_submit_work()
    IO_WQ_WORK_CANCEL isn't set
                                        io_async_cancel_one()
                                          sets IO_WQ_WORK_CANCEL
                                          = -EALREADY
                                        io_timeout_cancel() = -ENOENT
    io_timeout()
      adds the request to ->timeout_list
      hrtimer_start()
    = IOU_ISSUE_SKIP_COMPLETE

Nobody looks at the flag again, and the timeout runs its course. At ring
exit, io_uring_try_cancel_requests() cancels io-wq work and then kills
the timeouts the same way, so an exiting task can get stuck for the full
duration of such a timeout.
    
Look at the flag under ->timeout_lock, which the search takes as well,
and fail the request if it is set. If the search came first, the flag is
visible. If it comes later, it finds the request on the list.

Fixes: ce35a47a3a02 ("io_uring: add IOSQE_ASYNC")
Signed-off-by: Jens Axboe <axboe@kernel.dk>

---

diff --git a/io_uring/io_uring.h b/io_uring/io_uring.h
index 203bf019e931..32247529076c 100644
--- a/io_uring/io_uring.h
+++ b/io_uring/io_uring.h
@@ -404,16 +404,22 @@ static inline void io_ring_submit_lock(struct io_ring_ctx *ctx,
  * cancellations find it, rather than completing it. Whoever tried to cancel
  * the request before that found it running. It has flagged the work item,
  * has searched the list in vain, and won't come back. To be called with
- * ->uring_lock held, which the search needs as well, once the request is on
- * the list: if the search came first, the flag is visible.
+ * the lock the search takes held: if the search came first, the flag is
+ * visible. For most lists that is ->uring_lock, timeouts use ->timeout_lock.
  */
+static inline bool __io_wq_cancel_seen(struct io_kiocb *req,
+				       unsigned int issue_flags)
+{
+	return (issue_flags & IO_URING_F_IOWQ) &&
+	       (atomic_read(&req->work.flags) & IO_WQ_WORK_CANCEL);
+}
+
 static inline bool io_wq_cancel_seen(struct io_kiocb *req,
 				     unsigned int issue_flags)
 {
 	lockdep_assert_held(&req->ctx->uring_lock);
 
-	return (issue_flags & IO_URING_F_IOWQ) &&
-	       (atomic_read(&req->work.flags) & IO_WQ_WORK_CANCEL);
+	return __io_wq_cancel_seen(req, issue_flags);
 }
 
 static inline void io_commit_cqring(struct io_ring_ctx *ctx)
diff --git a/io_uring/timeout.c b/io_uring/timeout.c
index c92d1363df81..8a2108aa14ae 100644
--- a/io_uring/timeout.c
+++ b/io_uring/timeout.c
@@ -687,6 +687,13 @@ int io_timeout(struct io_kiocb *req, unsigned int issue_flags)
 
 	raw_spin_lock_irq(&ctx->timeout_lock);
 
+	/* the list is searched under ->timeout_lock, see io_wq_cancel_seen() */
+	if (__io_wq_cancel_seen(req, issue_flags)) {
+		raw_spin_unlock_irq(&ctx->timeout_lock);
+		io_req_task_queue_fail(req, -ECANCELED);
+		return IOU_ISSUE_SKIP_COMPLETE;
+	}
+
 	/*
 	 * sqe->off holds how many events that need to occur for this
 	 * timeout event to be satisfied. If it isn't set, then this is

-- 
Jens Axboe

