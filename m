Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBADF3B1B4
	for <io-uring@vger.kernel.org>; Wed,  9 Sep 2026 01:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788916160; cv=none; b=T0FKLla+Jxb8fWHVW6iQMDLDeK2WYJNffnBFiStkMVeHzxy+sZP9X21QjbcR0WGd8DKzrDjOo4hgnl5dsAibWromoReTNwmv0D4gs7I7B+MU1nGpZufEMbGcMo4G7HI9ayNL3Z+r/A5Q3hqcPAThpSg3HQQFuObWYXXP4OZ4OGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788916160; c=relaxed/simple;
	bh=gXHIURS8uzHDyphzIvg+HUiTWpMD73ienyahsCb1Zs4=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=VsUQIrjLrkdtU8LKEDeAULPGlJxmdopj6toVSXKpgrQ5l3zOYvNYtTtVwUASXAFF2e6YqpHmPLU1lNuJdI11I/MEVVMXsPvBdGrGgdbZYgkxyqzIu3yff+7w5GL3AB3eTDu1oeSW8IUfNOcJEcQBgEnn0uNOl14Zs0paAVOinFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=d7KsUpy8; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="d7KsUpy8"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4b28d9537bcso3627717b6e.0
        for <io-uring@vger.kernel.org>; Tue, 08 Sep 2026 18:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1788916154; x=1789520954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wi1Z/fFU3Xj9zHEsPg9TH255ZjqWv+BiKQ7g+JBjtCU=;
        b=d7KsUpy8NSc78geDMREHCLU8YF54lDSv3BVNjLZNPNnTi5SxGqYNrMVE3Ikna5YH1y
         r+Vqg+bwxOpH/z1ExpN5MLCT9TLHOSfvS1DbnBF2OmHYOlDTD/8+qRm/LuWWH0AEukJ6
         EeE5LPopWHravq+3zGqTtJ6nARZApDUQJvafxVyI8WtCI6oj0PKW/lswI/8KYnOXdm5N
         p3MED2MfWNhHSX72w7/FsATrl8kDX+zCl1vqoFGH47VhF4StWnFtDSvyjSxGbz5bqypG
         U1RaJKscF+dcwxgy4RpueWXmTwhTcxLGT6NvwfXYxwwaszAVbVLgZMgrMgKRfmrpo2ww
         2DNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788916154; x=1789520954;
        h=content-transfer-encoding:content-type:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wi1Z/fFU3Xj9zHEsPg9TH255ZjqWv+BiKQ7g+JBjtCU=;
        b=GYmIO4kxx5CwvrvQiWl0DNAoCToZGAvtu9ILEWNQwgcbHin3oVgDIPYELsjiGkvOY1
         ZjGydxInzSwEDBYohclkWR6RvMETk3W0pFEUYE/BcYLB1yEXQSudJQLPeJ2pimCKu+4o
         1d0T2tCNdnVpft4uJpD65l5+KUte5eR0rXfpm4n/shLq3DQ1BDKQaSYhcyFtMC4obT56
         OYgw4fUnPC5XA8vEwMrd7KtYsY3kQjjzlBbXtXikKd1ZIoNfSD67PN904A4QAIjJH7vV
         YabPqQeV0EXNTRHFxrEll0Z8VExHg3TzyrauqBF9cssQKUVM049zqwHTX4/CHHbRSnni
         iAdw==
X-Gm-Message-State: AFuF++nAL6QxeTn0qCR+qEBvAz1a9a858PvTJWRA4wk/bpkC3ct69Tbb
	BS9syQBi0RHbiO81xQAXOdT0X9ewsh/K9NHQTBNWJrdNitWhXwcaR2PbYRmYY3rYBh7xImt/449
	edlmDVRE=
X-Gm-Gg: AYBFou05vjpmrmfSaUwUGk0ZAWls+pVuFVB2hG8DCqbVZ/A8wq5lp8gmXYPyCV9q3Vr
	g1C5JNN0dJHEQRN9erE/uoVm8Ux0tkpdsHC9q6Bti3l9nr7+CbcLDP7N6yaHrZZ2GUb1KHVOzTe
	Ak144tbOL+QXGTkm/WivX8pnldR6+ZmrDFTUfhimxEHUvcNjAVuHIbswBRWpODH8TR2cXgqcZR2
	2/p5u6QqnhPB5zNJtNiEJKVoM4sFk8qkL19kMNIHwBM0jGzuH++SNepUzjkA/dl0IIb1ThzY+uQ
	+wIzQde40Zewcl6UQeSdLSar4EuUz/p7BX2/Fvkoa/kAVwSIKDU/q5ekw7F8F8fhHCexdIN6/SX
	FaPdY259zogS+DepIe5UDByzLDb3nSYTH8v9pjtdgRdum0zYFYj88KzG8v4d6oSECn8xS4tMvX6
	CEuXFRcdVADLB4xjyP22SVxDNbe2K0bjLvD0BsH67LUuvpxxxYI9Winkb9bW9gcLmsOB4EBUjrd
	pvXQP0CJm2Ojr2+6yW2t7MrZjdCJI+yVpxMuPbYwDdW3t300eI7byHEiQ==
X-Received: by 2002:a05:6808:c2b7:b0:495:f697:92d9 with SMTP id 5614622812f47-4b7dcb8fa95mr14754632b6e.7.1788916153964;
        Tue, 08 Sep 2026 18:09:13 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-475523d1dc5sm14057832fac.2.2026.09.08.18.09.11
        for <io-uring@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 18:09:12 -0700 (PDT)
Message-ID: <30fdc8f9-f50e-46b6-b876-20e4f59c744f@kernel.dk>
Date: Tue, 8 Sep 2026 19:09:11 -0600
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
Subject: [PATCH] io_uring/rw: end write accounting from ->ki_complete
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Commit b000145e9907 moved both the fsnotify calls and the write
accounting out of the kiocb completion handler and into the
io_req_rw_complete() task_work. However, only the fsnotify part actually
needed to move as it may sleep. Ending the write accounting is just a
percpu_up_read() on the superblock writers sem.

Deferring it is a problem, because it makes dropping SB_FREEZE_WRITE
protection depend on the ring owner getting to running task_work. But
the task may be blocked in freeze_super(), causing it to never get to
that:

  task                             io-wq worker
  --------------------------------------------------------------
  io_write()
    io_kiocb_start_write()         (takes sb_writers, hidden from
                                    lockdep by __sb_writers_release)
    write_iter() -> -EIOCBQUEUED
  ioctl(FS_IOC_SHUTDOWN)
    bdev_freeze()
      freeze_super()
        percpu_down_write()        <- waits for the reader above
                                   io_write()
                                     kiocb_start_write()
                                       percpu_down_read()  <- queued
                                                              behind the
                                                              writer
  <bio completes>
    io_complete_rw()
      queues io_req_rw_complete()  <- never runs, task is in D state

End the write from io_complete_rw() instead, and leave only the fsnotify
calls in task_work.

Reported-by: syzbot+2eb3d983669d3e49d4fa@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
Fixes: b000145e9907 ("io_uring/rw: defer fsnotify calls to task context")
Signed-off-by: Jens Axboe <axboe@kernel.dk>

---

diff --git a/io_uring/rw.c b/io_uring/rw.c
index 95106dd1d7eb..3e22f294bdf2 100644
--- a/io_uring/rw.c
+++ b/io_uring/rw.c
@@ -517,20 +517,25 @@ static void io_req_end_write(struct io_kiocb *req)
 	}
 }
 
-/*
- * Trigger the notifications after having done some IO, and finish the write
- * accounting, if any.
- */
-static void io_req_io_end(struct io_kiocb *req)
+/* Trigger the notifications after having done some IO. */
+static void io_req_io_notify(struct io_kiocb *req)
 {
 	struct io_rw *rw = io_kiocb_to_cmd(req, struct io_rw);
 
-	if (rw->kiocb.ki_flags & IOCB_WRITE) {
-		io_req_end_write(req);
+	if (rw->kiocb.ki_flags & IOCB_WRITE)
 		fsnotify_modify(req->file);
-	} else {
+	else
 		fsnotify_access(req->file);
-	}
+}
+
+/* Finish write accounting and notify, for inline completions only. */
+static void io_req_io_end(struct io_kiocb *req)
+{
+	struct io_rw *rw = io_kiocb_to_cmd(req, struct io_rw);
+
+	if (rw->kiocb.ki_flags & IOCB_WRITE)
+		io_req_end_write(req);
+	io_req_io_notify(req);
 }
 
 static void __io_complete_rw_common(struct io_kiocb *req, long res)
@@ -563,7 +568,7 @@ void io_req_rw_complete(struct io_tw_req tw_req, io_tw_token_t tw)
 {
 	struct io_kiocb *req = tw_req.req;
 
-	io_req_io_end(req);
+	io_req_io_notify(req);
 
 	if (req->flags & (REQ_F_BUFFER_SELECTED|REQ_F_BUFFER_RING))
 		req->cqe.flags |= io_put_kbuf(req, max(req->cqe.res, 0), NULL);
@@ -577,6 +582,10 @@ static void io_complete_rw(struct kiocb *kiocb, long res)
 	struct io_rw *rw = container_of(kiocb, struct io_rw, kiocb);
 	struct io_kiocb *req = cmd_to_io_kiocb(rw);
 
+	/* ring owner may block in freeze_super() before task_work runs */
+	if (kiocb->ki_flags & IOCB_WRITE)
+		io_req_end_write(req);
+
 	__io_complete_rw_common(req, res);
 	io_req_set_res(req, io_fixup_rw_res(req, res), 0);
 	req->io_task_work.func = io_req_rw_complete;

-- 
Jens Axboe

