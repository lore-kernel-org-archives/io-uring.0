Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C887040F758
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092683; cv=none; b=SZo1bwpACabiXrTayOp8zH6OimFjdQtsKoUYRmumwk1t9HQHppWqk9bXSFzUZvdVPQMNaWk7VO4qFSiynWJXXOoBb0tarApl06DIu17ktK7TnEItnU4HrvdtjsWVoje+DMow76CGyIU7qzCqSJIBRFlH3+M0P1PbgLp6j0AK+R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092683; c=relaxed/simple;
	bh=qCNCZseeVD7a/VkrF3NLAlPxM8NuXZ7Yl3trCHUzRCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rOmgr5VinFGdE0kjfX3ULR01FIHldOxotN7jsV038oGL6Isl3sRfrGtguOJj+RmMyRXHU3HCdD1AMdnPzL59Qmt3T8VqNmuQTM71SulLjn9OSCVx46/D6ZWC/m+3AKmqUr/WLY5q5mANQKtQX+2dFLNdqorbfCCptChAnd1RS7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=BwC7MAeY; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="BwC7MAeY"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-917a707f37eso70487666d6.0
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092681; x=1792697481; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xO6P6qCGHcINr3Bh7XSDBeKniErzBcnywD6mINc+Jgs=;
        b=BwC7MAeYeQWYZ+NKsaWbbE+1XO++h8aVlrYx+Uf9YbEVLeEuAQn5j72C9FIr4JBJlZ
         cPlOTbTfXBoYR51elW+zJDQhWKtA/sdW5rZDWLVxAN9UQKWjKxU0MEvjuSYoohWnD7RV
         mzOsWiYxLm8lO+gpRD1KgW6hWXenp0hPT35O8EmkxJlzDVaXVa+N0W5QZRIo5VOWG1a3
         WhoCikl6SyLSwF1kfvedq8e3ML0O4lHbnUjjr68xxCU82Y8Y8WdS/tWh/yBIyG7TXm/Q
         91mZ82EdSgEKXrlWpONXWMG1woH4qhg09g8Yi9ZzmSpqY6jDGt0xIb0wCBlUlpO7eTyh
         KZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092681; x=1792697481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xO6P6qCGHcINr3Bh7XSDBeKniErzBcnywD6mINc+Jgs=;
        b=oow+9X6vrANE4Af+Dv9zI1nLLLdaPKDaMTtbCSZ9NTBKq0UIVe+CnQDkeeSuntr36a
         /r1dhtDCIPC6QB+9zccQcpgAduOphHE1ctzdBFSVrwRE7i5vvjI4kEeEqG0rrSIbIavz
         LTqt2FjfJiHCA1dlbBvF06uuxaD+LmgqsztH7oSDTFStGUWx+fRfhPAsJbbcE3iBUhST
         hdMn1ojPKeXU3tlJIqP2JAEtNdJbWm7hHE9Sgp9cFK7QLEF1jMMIt8hDqnR+8YOKvIHn
         IDpxK6p6An0SjlKhYAdmSH2wW/0JKdj8J+FiOiHGOd3Li8L2W25rYcrY3Gvx6iUlBaVm
         TuHw==
X-Gm-Message-State: AFq9FYLHuozdxZwZ3gofTHfRH7OgNQV0ZKbJBlF2teXYzPKO6hYFSBNn
	W4V1yWgDdHjk+yCksM7Nktd8QCex+2jYprH+4wR/6FUvNXUaU3S0vgSX3fUTmiDXkyo=
X-Gm-Gg: AYBFou2UbsfTG++jOm7K0eXqhk1KjaW/ORhUvLuRFkEaL/x/jxbXxP5fa6ngH0OamKI
	Q2QNwYYHmSc9LT6Uinh3ljM5upGULI9r6I833Up8g4f0IFjGpbwFYkUjWmPClsn/gdXo1z0H3Wr
	BRJED4Rovd65jbp0Kw5rpI1mEXAnPl/KsCUH5/cEinagijN2Uvy5kQ/Y7h3qButFwv+nk/bekjI
	AIEvieiMCKCLwLVW9s0K+nHH+LlhhnH2jrNoNBn+m2c29KUoWqnGAmtqfYlA9rmi5uskmhoM3lF
	yoqPdgaKE3tHndIUFtI8Mdi0QM0SFvSti29e7OMOrvHz6JVeTdj1QVJgLdvABFwdTsdp+LFHZgF
	aFiDqc9iUQLFTN7wDM/ihRFRZhJTkI5b6danB8JeS2aJt9QSA4YWrIVPe6zlSt5Y7RjeLNZS3Od
	51+L+S03cateMybkm704TFCiUG1kWmIGy1qflhltLCkezLJEW9PWfkoIzk2n42LthRo1ex6kARS
	Y+9Yd/HCRk1SRo=
X-Received: by 2002:a05:620a:6844:b0:93c:6963:ff3b with SMTP id af79cd13be357-93ebd2634c9mr3132583785a.42.1792092680556;
        Thu, 15 Oct 2026 12:31:20 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.247])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a1cb631sm11643785a.45.2026.10.15.12.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:31:19 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:30:30 +0000
Subject: [PATCH 06/43] io_uring: don't flood a cancelling task with
 task_work
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-6-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092657; l=3209;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=qCNCZseeVD7a/VkrF3NLAlPxM8NuXZ7Yl3trCHUzRCY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNaS3ZG6Wbx+crOe0piqBaXNMx7F3QMrm+hfdtTaQKFYXuuYgdlRjd9VGnPuieGCGyf02tlSUOD
 duz7mmQ3xHgk=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

io_ring_exit_work() asks each task which has used the ring to remove its
tctx node, by task_work, and repeats that until the list is empty.
io_tctx_exit_cb() doesn't touch the node while the task is in
io_uring_cancel_generic(), which removes all the nodes at its end. So the
work item queues the callback again as soon as it has completed, for
nothing.

That is more than a waste of time. task_work_run() only returns when it
finds the list empty. If the rings are released from inside the
cancellation, because requests of other rings held the last references to
their files, up to 64 work items keep sending callbacks to the one task
which is running them. It never finds the list empty, never gets back to
the cancellation, the nodes stay, and so it goes on: a task with 60 pairs
of rings which poll each other ran 280000 callbacks in 5 seconds, 20
seconds after exit_group(). It ends when all the senders happen to be late
at the same time. Until then the task keeps a CPU and the work items busy.

An exiting task can't be killed meanwhile. execve() cancels the requests in
the same way, so a live task can get stuck there as well, for minutes. If
it takes more than five, the work items run into the
WARN_ON_ONCE(time_after(jiffies, timeout)) of io_ring_exit_work(). No
privilege is needed for any of this.

If the callback has met a task in cancellation, wait a little before it is
sent again. Nobody has to wake the work item up for that: either the node
is gone by then, or it is the turn of the next round.

Fixes: d56d938b4bef ("io_uring: do ctx initiated file note removal")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/io_uring.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 464d9616234c..a5fd1845a1d5 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -2348,6 +2348,7 @@ struct io_tctx_exit {
 	struct callback_head		task_work;
 	struct completion		completion;
 	struct io_ring_ctx		*ctx;
+	bool				in_cancel;
 };
 
 static __cold void io_tctx_exit_cb(struct callback_head *cb)
@@ -2362,7 +2363,8 @@ static __cold void io_tctx_exit_cb(struct callback_head *cb)
 	 * tctx can be NULL if the queueing of this task_work raced with
 	 * work cancelation off the exec path.
 	 */
-	if (tctx && !atomic_read(&tctx->in_cancel))
+	work->in_cancel = tctx && atomic_read(&tctx->in_cancel);
+	if (tctx && !work->in_cancel)
 		io_uring_del_tctx_node((unsigned long)work->ctx);
 	complete(&work->completion);
 }
@@ -2530,6 +2532,14 @@ static __cold void io_ring_exit_work(struct work_struct *work)
 		 * wait is marked as interruptible.
 		 */
 		wait_for_completion_interruptible(&exit.completion);
+		/*
+		 * The task removes the node when it is done with its
+		 * cancellation. Give it the time for that: it doesn't get back
+		 * to it as long as it finds new task_work each time it has run
+		 * the old one, and we may be one of many who send it.
+		 */
+		if (exit.in_cancel)
+			schedule_timeout_idle(HZ / 20);
 		mutex_lock(&ctx->uring_lock);
 		mutex_lock(&ctx->tctx_lock);
 	}

-- 
2.55.0

