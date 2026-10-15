Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B774119F7
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092757; cv=none; b=jcw4gah1gAvHTEQmA0t7/PIkBj8CTWbxFG5bIERn5FnZW+iaGTJtez6y2QHLPMoEga+wjYJb1gavFTSl4NLbnE1Ff5gQgokkVNQEYl7+Udq4KNiIVXEPbwT5LpuEJKYyX7kzZshHr4UnhT0TwXyEiOA4ipXIJFehmCE+l9G5vRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092757; c=relaxed/simple;
	bh=awPBS09rR7L5Nw8cDANPo2/Zl/+LnAfGL2Qcs47Fggw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BdP68PVmu+sXbzGi0SuRUeXoZrftXJz+y0mcNpmExLCOB65SXTDr8KUatTIw+uJMUy7u+kLFCUzBI916Aguy5uiIAOm9BFO1j47NjpmkmKwjo2ZtJwYPEQwmblps6TdPBVxrRTArGGFWRR4EV4qRPoULYOQ6aA26e6uPMcac+CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=JB5NPqBh; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="JB5NPqBh"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-917a6dccc60so4034586d6.0
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092755; x=1792697555; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZutOX6m8+NxIbVhC43ysCGcpt7XNqks5o6Fl2lBslY=;
        b=JB5NPqBhjADe2+SvfmgUQquSDeF/BKqftlcf1Qd47z3ul7U+EPyuYpfmX+ERNDqjpM
         DiYefL34bPkMrUh0jb2nOE3gJ6/+1MAVUX7yWFgB6FfjQJfGoSlWur3xCBt3vqAMFpaK
         ACTGMhpKOPAZ3eisLP7/OZg1x9xVNlU8wFBg1k8+M7GXvaxPzL3BRW7RRLDUxnyicST/
         RatxGlkgEyP4h5pJNn4ehr6FBczDcHeMYmvJe4KQca7YtFSJ9Y/3E2oK2Wgy/LLaV71x
         GyPtF88+SF93djMxnC0GeCpgIOcjhsm50HEXedHKLNihV+c3hQbc1JR/yzcztsUKjaP7
         aW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092755; x=1792697555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BZutOX6m8+NxIbVhC43ysCGcpt7XNqks5o6Fl2lBslY=;
        b=y5/yae+D79T0+D7Y8DT9KX0i/6ImSEZlNaF6LLLADX0r91LfpnoDqwq7E6wKM3U1DX
         2WtQlC64FpacM2ctQW/1DpPwc4GikY3yC0I+jMnD5ZOgx2vVjjUkFKTxC3lEKC/nvaeZ
         nHytMtLfPsXsEX7t23e2spcv4Uazu0mov9V5aP3dDIgvGbnE1+EsoMDnC30TjZ/4rihB
         sFxscaKzahDG62FDBHzg47jaojL+UTBiQBTxJZI+8iBYynCqBPxTrQnUVTgSxqVMhNpb
         GP4Z1M7miBtfz2fH2OL61qE881uz3OSqzud9TtuA+sUFlCWJGBLnfZOUJfIpSRTkt59Q
         MZJQ==
X-Gm-Message-State: AFq9FYIczZ+r7jc/LDDIIrxsSEmCJnAbK864RviUKzL4tIs6e6+LQExr
	RWmxI0IRAqBX8jTkWg+4MMxlZENkIsfJ3MK0s2A4DUVyLO4ZRbJwWmIM3YZbQCISCEM=
X-Gm-Gg: AYBFou2dqXTqDyRmagHpbYnuegJaychnYJnO1AEZhZQS0GLsh82sUXzXeIGd98unOOu
	CfvxpHz2f4Mil6xzsr98qGX+zWPA5jEWE/ZCyGodG9gUKnWxTL18zY2OpVTPf5X5UuWb1FAKkoi
	Opwh9B24TReqB5MF5b1XPrN3gTFiFRLioaHa8L6vn0DqPwnu3dhF5GhQsjyakxubpPr9WMU2gJ4
	xfkD8aJmiwTRJXnFT/L7IJakZ99r/nBq1Mwq3joE269YBtgS3ntTybB9VeBhFiPgm9gCm1qBq5B
	f3jlRc3Sue/VwTC8rvmTirqf1IyFleNpJ2VbQRWb1AMhbePI3EtMU/h9XPtfcHyC7vV7IuNk0ov
	p66q5LyAXHIoPXh7eJz0lTOMpnQ3IlgnjDmzzD0Z6z+6/x8TwtisHZTjhqyACoTmg/cGEdyWji2
	GyAQL3NPawGKS2gOHouw+aupZUHkSyAdMPTTZzCW0kt5TIbwSGSd1t1S6edR2K/a2GHT7sAmiv5
	wO4OOmNwOP3wS3N
X-Received: by 2002:a05:6214:20a4:b0:919:89f4:64f9 with SMTP id 6a1803df08f44-91bc96b0727mr19089226d6.27.1792092755175;
        Thu, 15 Oct 2026 12:32:35 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.255])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcc47bccasm2264276d6.20.2026.10.15.12.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:32:34 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:31:07 +0000
Subject: [PATCH 43/43] io_uring: look up the file before queueing to io-wq
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-43-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092660; l=5272;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=awPBS09rR7L5Nw8cDANPo2/Zl/+LnAfGL2Qcs47Fggw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGQbo6pAEjtYwBnmgWHkpdQ25A1grGIA405L4qoRy3nH1/9Pum/9QmoPqW9LrNYqFg/578caYjA
 b35jw2DU7bAg=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

io_prep_async_work() decides by the file of a request what kind of work
it is for io-wq. I/O on regular files and block devices is bounded work,
limited to min(SQ entries, 4 * CPUs) workers, for anything else that may
block indefinitely the limit is RLIMIT_NPROC. Writes to a regular file
are hashed by the inode, so that they are run one after the other instead
of having a bunch of workers fight for the inode lock.

Since the file is only assigned when a request is issued, a request that
is queued without an attempt to issue it, REQ_F_FORCE_ASYNC, doesn't have
one at that point. io_prep_async_work() takes that for "not a regular
file or block device":

- Reads and writes end up as unbound work. 32 reads with IOSQE_ASYNC from
  a slow block device on a ring with 4 SQ entries get 32 workers, not 4.
- Writes aren't hashed. Four buffered writes to one file get four
  workers, three of which do nothing but wait for the lock.

The late assignment is for the benefit of links, where a request may use
a fixed file that one of its predecessors installs. By the time a request
gets to io_queue_iowq() these are done, it is as good as issued. Assign
the file there.

io_assign_file() moves up and is forced inline. With a third caller the
compiler may stop inlining it, and every request that is issued would
pay for a call.

IORING_OP_SPLICE is left as it is, unbound and not hashed. The file of
the request is where it writes to, which says nothing about how long it
takes: a splice from an empty pipe or a socket into a regular file waits
for its input. As bounded work, four of these on a ring with 4 SQ entries
keep all other bounded work of the task from running, and as hashed work
one of them blocks all writes to that file.

REQ_F_FORCE_ASYNC is not only set for IOSQE_ASYNC. What changes, and
brings back what was the case before the file assignment was deferred:

- Requests with IOSQE_ASYNC or IOSQE_IO_DRAIN, and all requests that are
  submitted while a drain is active: reads and writes on regular files
  and block devices count against the limit for bounded workers, including
  the one set with IORING_REGISTER_IOWQ_MAX_WORKERS, so fewer of them run
  at the same time.
- Of these, writes to one regular file are run one at a time, unless they
  are O_DIRECT and the filesystem has FOP_DIO_PARALLEL_WRITE. On a ring
  with IORING_SETUP_IOPOLL that goes for reads as well.
- IORING_OP_FALLOCATE and IORING_OP_FTRUNCATE, which always go to io-wq,
  are run one at a time per file, and in turn with these writes.
- The descriptor or the fixed file slot is looked up when the request is
  queued, not when a worker gets around to it, so closing or replacing it
  in between no longer has an effect on the request.

Fixes: 6bf9c47a3989 ("io_uring: defer file assignment")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/io_uring.c | 43 +++++++++++++++++++++++++++++--------------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 2fa720160e8f..e6569c204917 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -407,17 +407,46 @@ static void io_prep_async_link(struct io_kiocb *req)
 	}
 }
 
+/* Called for every request that is issued: keep it inline */
+static __always_inline bool io_assign_file(struct io_kiocb *req,
+					   const struct io_issue_def *def,
+					   unsigned int issue_flags)
+{
+	if (req->file || !def->needs_file)
+		return true;
+
+	if (req->flags & REQ_F_FIXED_FILE)
+		req->file = io_file_get_fixed(req, req->cqe.fd, issue_flags);
+	else
+		req->file = io_file_get_normal(req, req->cqe.fd);
+
+	return !!req->file;
+}
+
 void io_queue_iowq(struct io_kiocb *req)
 {
 	struct io_uring_task *tctx = req->tctx;
 
 	BUG_ON(!tctx);
+	lockdep_assert_held(&req->ctx->uring_lock);
 
 	if ((current->flags & PF_KTHREAD) || !tctx->io_wq) {
 		io_req_task_queue_fail(req, -ECANCELED);
 		return;
 	}
 
+	/*
+	 * The file is looked up as late as possible, as it may be the result
+	 * of an earlier request of the link. This one is up now, and what kind
+	 * of work it is depends on the file. If that fails, leave the error
+	 * handling to the worker.
+	 *
+	 * Not for a splice: whatever it writes to, it may wait for its input
+	 * for ever. It has to remain unbound work that isn't hashed.
+	 */
+	if (req->opcode != IORING_OP_SPLICE)
+		io_assign_file(req, &io_issue_defs[req->opcode], 0);
+
 	/* init ->work of the whole link before punting */
 	io_prep_async_link(req);
 
@@ -1397,20 +1426,6 @@ static __cold void io_drain_req(struct io_kiocb *req)
 		ctx->int_flags &= ~IO_RING_F_DRAIN_ACTIVE;
 }
 
-static bool io_assign_file(struct io_kiocb *req, const struct io_issue_def *def,
-			   unsigned int issue_flags)
-{
-	if (req->file || !def->needs_file)
-		return true;
-
-	if (req->flags & REQ_F_FIXED_FILE)
-		req->file = io_file_get_fixed(req, req->cqe.fd, issue_flags);
-	else
-		req->file = io_file_get_normal(req, req->cqe.fd);
-
-	return !!req->file;
-}
-
 #define REQ_ISSUE_SLOW_FLAGS	(REQ_F_CREDS | REQ_F_ARM_LTIMEOUT)
 
 static inline int __io_issue_sqe(struct io_kiocb *req,

-- 
2.55.0

