Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E960049C4CC
	for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 15:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141702; cv=none; b=CV+4NEIf/0at4ijmyvTKjk7N3evYg5p9GOm5nq2nFOrTGLGWggNuFoduOPFaWGHZw/fXJTkgIiJuO2TFT49lR3keBDG8yGolCQXJIHW8eZqYtPZ+gi9A9XQnM6y0xMMh+ExENuGHZHXkCz6tkpRdkiMeWJCgXHd2gifbXScV2OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141702; c=relaxed/simple;
	bh=7SpAwQjwujAylQXlqBaEuU6VNEPc8MNsLy+VDg/vdlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LvP0p7/v/LPkLl3AtryFBDG9ui9zSCRzdUuNPRp3IcQR4nh+P/oAKMYl5yOMc51DaKuyL46SQYpgpm3urMZTjWFMFceJFKkc9E79F1ufgnXwKlyCJn1gno4/Ju5pBHQi32DqydeDLyfGJ7v3eK/GNTWIbO6gsBU9HvnUHgIr2wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=05n265R3; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="05n265R3"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7f4df360cc9so1133109a34.1
        for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 08:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141699; x=1789746499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OwOLrB12o96JVHWcH+QfjnWOLuMMu1CVtQCDuiyuWP8=;
        b=05n265R3wZfNYsl0lsgK61Ze6N6vNfSI0IuSYgzfyglKeZWLDOtmmbOxYphsL/2jKG
         Wxl/v9nRFQVnl4l0JGrIYh9lqx9nknFTh/gFZd6/LVuTneALbn7eVsClIDRa+FVwZTt7
         2MAYQ3krwbJsAsarCcDUhqyVQBwnxqBQrZjUD3EKgwV1S6jPSPI6hqUuZ48vYfG8Oh1N
         L3lp9qY61PhX1BsovnCfjr/y69XOIMgxFAW0fzR/SMhUmz5AZxVowUVQYigIYgrpIWBx
         5EahDz2SbwPpWyKcAmpPF6pKs91yTK5egaIrz2Gkg/e6dX04k0hBqzLxGg+wKVqgGmoh
         ZR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141699; x=1789746499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OwOLrB12o96JVHWcH+QfjnWOLuMMu1CVtQCDuiyuWP8=;
        b=pczNHwVbofjcoSBJCyXA4XLFtz6txCICkHD2FwhhzsExS13H1rimQ+xglK5Qfs8FAy
         vhUcQ7onhudXA624jXXZQPCpO+F8QfuUBOkmQQ5pAtpKeJavG7wd2vMXOYg9IWLriBlA
         pM1g5JdSvxtV7ucA5HcHdhSeCgeC5QhPqJLiiMhp+9TOJA1XawPtghY5ZQ3vIu5UI1uy
         BJYIfy7iTdY3021P1tNLZNRSbLQ8wCVdcbuhUE5ui0zemb9wmCunNTra6vMGK0OCUAcc
         gyWSB/Yuq2GVxtCIpPg+8qPM02VrXANU9IrWCl8voB2FIDB0FoIXSPc3UgtdMBqYL/+p
         KpuA==
X-Gm-Message-State: AFuF++mNN1bxWDDinxHDEWW1n3BCf8pQLEFX1/Pb08FH/09pxNvZEEW1
	2yh1DHIQwF29M0ot/by7qFhBEMRl1+YyVjI2xsgY568pzRXkWFjhCh/3hAuKy1q3DiRRH+EjxXX
	FWdPAlbk=
X-Gm-Gg: AYBFou091q+3O1yW9Gg5mDYkFGV9wd98BiH0mpkTqdgotUq7TZcs7owCZXz7hQT+hKI
	setEhozAQ/LKB4QpOJz5RCZSnLuaf6miBKGYhfUvv56Ub6BwPqPo6ZJqxx2iFULmmbfiCEdqQA4
	y6Z3SfDiGgOjF7Q5vMFSljVHr7qOKe7mkci4rPPr86UeOsvm3/iemOs0N0gnqZRvbeROQfdkGYc
	UYA+4MIW6Jus4DdhAtn2tNUn6ENDUsYw7AR2FQqhYoPLQuF0cAHvyM56BRFvXv6EPziUukpZueh
	wfYD85K+YZctyEDVOIolM8O1dyNv80Quc7Sx6oFX2LdXZxSim3YCjFDCXVKWJKfxPs7CBBS1h6f
	sxE3+iHeQWZUUsopgmJZdAIECg+oxr3Ejd6ubxj691iA6fEYQmIHzv0djKfhugHThXElU3qRZia
	G7cUghCzyr5X/bd8Em0jsXeB9HleQVQyFRxRBAwTgahawao83JftflWlkapcKZFLR+vyi5I3mbE
	9rwUlkYMuj+wWAIh44LtxYICtS7qF8iieJoiVfK910=
X-Received: by 2002:a05:6830:4494:b0:803:13e1:f4a1 with SMTP id 46e09a7af769-80313e1f4c5mr4477898a34.5.1789141698617;
        Fri, 11 Sep 2026 08:48:18 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f6d1ca4bsm2629478a34.23.2026.09.11.08.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:48:17 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: juanlu@fastmail.com,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 04/10] io_uring: put request files before posting the completions
Date: Fri, 11 Sep 2026 09:45:28 -0600
Message-ID: <20260911154811.646705-5-axboe@kernel.dk>
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

The batch flush posts the CQEs first and drops the files afterwards,
with a plain fput() that defers the release to task_work. For the
submitting task that runs on the way back to userspace, but with SQPOLL
the sqpoll thread only gets to it after the io_uring task_work is done.
Userspace sees the CQE in between, and closing the file and exec'ing
it fails with ETXTBSY as the request still holds it.

Drop the files synchronously before the CQEs are posted, for requests
that the flush is about to free. Ring files stay deferred, releasing
one takes its uring_lock and may wait on its requests.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/io_uring.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 69f1b3f4c4a1..9ad1962c8dd8 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -907,11 +907,8 @@ bool io_req_post_cqe32(struct io_kiocb *req, struct io_uring_cqe cqe[2])
 	return posted;
 }
 
-/*
- * Drop any io-wq request with a file upfront, otherwise it gets deferred to
- * much later post CQE posting.
- */
-static void io_req_put_file_iowq(struct io_kiocb *req, bool sync)
+/* drop the request file before the CQE is posted, not deferred after it */
+static void io_req_put_file(struct io_kiocb *req, bool sync)
 {
 	struct file *file = req->file;
 
@@ -919,7 +916,8 @@ static void io_req_put_file_iowq(struct io_kiocb *req, bool sync)
 		return;
 
 	WRITE_ONCE(req->file, NULL);
-	if (sync)
+	/* releasing a ring may wait on other rings, keep that deferred */
+	if (sync && !io_is_uring_fops(file))
 		__fput_sync(file);
 	else
 		fput(file);
@@ -937,7 +935,7 @@ static void io_req_complete_post(struct io_kiocb *req, unsigned issue_flags)
 	if (WARN_ON_ONCE(!(issue_flags & IO_URING_F_IOWQ)))
 		return;
 
-	io_req_put_file_iowq(req, true);
+	io_req_put_file(req, true);
 
 	/*
 	 * Handle special CQ sync cases via task_work. DEFER_TASKRUN requires
@@ -1152,6 +1150,19 @@ void __io_submit_flush_completions(struct io_ring_ctx *ctx)
 	struct io_submit_state *state = &ctx->submit_state;
 	struct io_wq_work_node *node;
 
+	/*
+	 * Drop the files before the CQEs are posted, so they're released by
+	 * the time the completions are visible. Not for requests that are
+	 * requeued or still referenced, those aren't freed below.
+	 */
+	__wq_list_for_each(node, &state->compl_reqs) {
+		struct io_kiocb *req = container_of(node, struct io_kiocb,
+					    comp_list);
+
+		if (!io_req_shared(req))
+			io_req_put_file(req, true);
+	}
+
 	__io_cq_lock(ctx);
 	__wq_list_for_each(node, &state->compl_reqs) {
 		struct io_kiocb *req = container_of(node, struct io_kiocb,
@@ -1505,7 +1516,7 @@ void io_wq_submit_work(struct io_wq_work *work)
 	/* either cancelled or io-wq is dying, so don't touch tctx->iowq */
 	if (atomic_read(&work->flags) & IO_WQ_WORK_CANCEL) {
 fail:
-		io_req_put_file_iowq(req, false);
+		io_req_put_file(req, false);
 		io_req_task_queue_fail(req, err);
 		return;
 	}
@@ -1582,7 +1593,7 @@ void io_wq_submit_work(struct io_wq_work *work)
 
 	/* avoid locking problems by failing it from a clean context */
 	if (ret) {
-		io_req_put_file_iowq(req, true);
+		io_req_put_file(req, true);
 		io_req_task_queue_fail(req, ret);
 	}
 }
-- 
2.55.0

