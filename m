Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA903161A1
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092750; cv=none; b=MZtWqvNojhSGZoKBxHVQ57hjaKAz/kkS7TZi1EgWJHgaAlws9XUEyS0laLYBCNeHKjEBQPcghOqrzGO4WHawevFASTox9guhuxCmsR6hkmhNIvFlKh6IQdyi+xjb5vSZHi2XVjpA2DXh+jb1Xbuw7f83POWd5yhEDFU0FnUvzAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092750; c=relaxed/simple;
	bh=WZjuVD1oAfo/jUiJ3gyrpT9OwzgXIm+J0loY1EadlCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tQTZSG07LeDDHA3MVv2DJ0S3NrzB255uE2JIaWs+0O3S+zefPfl8mOgFjsL6UEWrmWC8WAaypLqxDagZd8oitLvFwmYI2EpwUxVeaSPkOBw7T3qneMQIz6p8KsPkkg5YhPZpeBe2Hci3kAPKSEnZaoXcRYqTq00Dth6HMbSFvrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=OG1LBbLc; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="OG1LBbLc"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93e5c8f53a9so473283185a.3
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092748; x=1792697548; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EHsLLGomkQE1B27wHvQm3Hkh3Z+mQ/vNQRJrEkC4Vgk=;
        b=OG1LBbLcyNE5kRR5bkgkjSElWTwzHDnikmNL7deOEPufhJkd1zjqiOkJrR8AHEaAG0
         BSqFh+S1LCSVrNfvONFGheyvwEauttx0GMcOikpxN9TtJYE52n6ao9jmNwJdqSHlmqGL
         GOtQu1SvT3XvQJ8Q2FMNtDN/1p503CM4FjZ+jSDmJv9JLq75+iaZNMS6w8jCU5RIfF12
         s/svdn+hKBPl1eL3g30fxvZ2r01TLsWFG0Mx+dlQq4xOoPdLOE9rsZIbRTxoVyBUjgxK
         weRghOrSx+dfj1OsPwvZGarnUqM2bmQg9A1yRJ+IjzEE0074X/G+i5kVMn39IH/0WEJh
         82Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092748; x=1792697548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EHsLLGomkQE1B27wHvQm3Hkh3Z+mQ/vNQRJrEkC4Vgk=;
        b=vLsxgTGE1cuxn5CRr1FXW4nig4DktYVIdFs2wnAFXlESjAGCNaf3JHKqSClQiHFWti
         V3C4ChedGIT6Eg35fIAJItv/GfkKkrBN05F0iRyZyynfQ1K2Y1Cdeo00N8iG8MtFTgeO
         MV/3CvW+XQEBDexkS0VuzkVPUglx+vcY/pys1jZprbCpmq2xltxpO1/0A7aRvShd3D9I
         AC0MYlJDzmAsYE9rwwZTkJkEHgutXp8sworJLj30nbY7Ny928ejWnAJwnTpQmFMDo413
         wQUbG7oxlTgr37QZiWtmg4ak9eh/4Pt8kRdbFmM6m78py2agBnGZcaQOS6+AA6DOB+bL
         wJ4g==
X-Gm-Message-State: AFq9FYKSi6pp0M6crD+Od+ZY/Q/4Vi3POXfUfrvpCMXd2gVQ0DQx1SkG
	LmvZ/sz0WJzKwbNLhS0ALIy6XYQJqVHFmYprlrO2kRb53ElcjqMKYQRbMv/WhYRjkCo=
X-Gm-Gg: AYBFou2nmLot4NwqQ36HtB38whZHEK8t2iWF9C/NdPyUXG5/2kpO6bvKKyeFrmy7X7J
	mQSduNNrMDHLCQ2U5QkVCrroQsg+SGel+bp7ivwa8fK773vAzlWxP/8MeIIssdPjo3G9xe0ojVP
	BCHGzTzNTgqeVajukPecVSczvB8bzCAjC+X5PumjHRpO9N31PkiARgAPPe0JU/jxvSDxqFUCDaB
	TW83YasRDDnYctOz7/zmZl4zVauXDm2YDjbyHZ2An9TVn7EkOQ/20WyfqTPPwiMDUC7rfB1uMI/
	TBj5FGgPedUfYyFxHuKR6EOB2MO/S7+2x9B/N1wN6CeAk0HayqtRJ/BoTojckoeA4xU13DrTyVS
	dnU0S2kfWzjhvsoi4kzS3pj0gtjR7rzEgXMQlNy0gUsOOw5fF8hA0w/mKkIvzw8CIVOa/JZcFzm
	A0mzWCoBAanIu8hxWcQABNsfAWq0I7AZaz08Ls0P6RkB6//BmFwZq/xTcHGVPQjbSVFvjH/HYcv
	IFJiPPrP19gZFFahpQWOxn4qQ==
X-Received: by 2002:a05:620a:c50:b0:93a:2d15:f84 with SMTP id af79cd13be357-93ebd250561mr3025851485a.33.1792092748328;
        Thu, 15 Oct 2026 12:32:28 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.241])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a1a8ee1sm12102085a.34.2026.10.15.12.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:32:27 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:31:03 +0000
Subject: [PATCH 39/43] io_uring: don't pass restart error codes to
 userspace
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-39-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092660; l=3897;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=WZjuVD1oAfo/jUiJ3gyrpT9OwzgXIm+J0loY1EadlCQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QOyu7mfI3xCd663p5SJqgs336+od0xOZxnDC4p/KvPGWG73UbbNdc1u0+M9kdq8kFn4Z47nxGf/
 0/FajkjugTQs=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

-ERESTARTSYS and friends are instructions for the system call exit code,
which either restarts the call or turns them into -EINTR. They are not
supposed to be seen by applications. A request isn't a system call,
nobody looks at what it returns before that is put into a CQE.

The read/write and the networking opcodes convert these codes to -EINTR
by hand. The others don't. An io-wq worker that is blocked in the open of
a FIFO, a tty or some other device, or in a splice from an empty pipe,
and that gets interrupted because the request is cancelled, completes it
with -512:

  IORING_OP_OPENAT, IOSQE_ASYNC       // FIFO without a writer
  IORING_OP_ASYNC_CANCEL              // -EALREADY, worker is signalled
  CQE of the open: res == -512

There are more candidates, like whatever a file system or driver returns
from ->flush(), ->fsync(), ->fallocate() or ->uring_cmd(), or breaking a
lease or delegation.

Take care of it in io_issue_sqe(), which all of them go through. The
helper is moved from rw.c as is. The cost is a compare and a branch that
is not taken per request.

Fixes: 15b71abe7b52 ("io_uring: add support for IORING_OP_OPENAT")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/io_uring.c |  5 +++++
 io_uring/io_uring.h | 18 ++++++++++++++++++
 io_uring/rw.c       | 18 ------------------
 3 files changed, 23 insertions(+), 18 deletions(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 7092efc22dd2..2fa720160e8f 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -1457,6 +1457,9 @@ static int io_issue_sqe(struct io_kiocb *req, unsigned int issue_flags)
 	ret = __io_issue_sqe(req, issue_flags, def);
 
 	if (ret == IOU_COMPLETE) {
+		/* not all handlers take care of the internal restart codes */
+		if (unlikely(req->cqe.res <= -ERESTARTSYS))
+			req->cqe.res = io_fixup_restart_res(req->cqe.res);
 		if (issue_flags & IO_URING_F_COMPLETE_DEFER)
 			io_req_complete_defer(req);
 		else
@@ -1471,6 +1474,8 @@ static int io_issue_sqe(struct io_kiocb *req, unsigned int issue_flags)
 		if (req->flags & REQ_F_IOPOLL)
 			io_iopoll_req_issued(req, issue_flags);
 	}
+	if (unlikely(ret <= -ERESTARTSYS))
+		ret = io_fixup_restart_res(ret);
 	return ret;
 }
 
diff --git a/io_uring/io_uring.h b/io_uring/io_uring.h
index 36d0d67fcb9f..203bf019e931 100644
--- a/io_uring/io_uring.h
+++ b/io_uring/io_uring.h
@@ -319,6 +319,24 @@ static __always_inline bool io_fill_cqe_req(struct io_ring_ctx *ctx,
 	return true;
 }
 
+static inline ssize_t io_fixup_restart_res(ssize_t ret)
+{
+	switch (ret) {
+	case -ERESTARTSYS:
+	case -ERESTARTNOINTR:
+	case -ERESTARTNOHAND:
+	case -ERESTART_RESTARTBLOCK:
+		/*
+		 * We can't just restart the syscall, since previously
+		 * submitted sqes may already be in progress. Just fail
+		 * this IO with EINTR.
+		 */
+		return -EINTR;
+	default:
+		return ret;
+	}
+}
+
 static inline void *io_uring_alloc_async_data(struct io_alloc_cache *cache,
 					      struct io_kiocb *req)
 {
diff --git a/io_uring/rw.c b/io_uring/rw.c
index d33b925a848e..a65693e39369 100644
--- a/io_uring/rw.c
+++ b/io_uring/rw.c
@@ -613,24 +613,6 @@ static void io_complete_rw_iopoll(struct kiocb *kiocb, long res)
 	smp_store_release(&req->iopoll_completed, 1);
 }
 
-static inline ssize_t io_fixup_restart_res(ssize_t ret)
-{
-	switch (ret) {
-	case -ERESTARTSYS:
-	case -ERESTARTNOINTR:
-	case -ERESTARTNOHAND:
-	case -ERESTART_RESTARTBLOCK:
-		/*
-		 * We can't just restart the syscall, since previously
-		 * submitted sqes may already be in progress. Just fail
-		 * this IO with EINTR.
-		 */
-		return -EINTR;
-	default:
-		return ret;
-	}
-}
-
 static inline void io_rw_done(struct io_kiocb *req, ssize_t ret)
 {
 	struct io_rw *rw = io_kiocb_to_cmd(req, struct io_rw);

-- 
2.55.0

