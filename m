Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA9548F001
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092700; cv=none; b=RhN4UvPWEm1/YIwAszP97AH2zlCpt6oKrm/MhnDHcSUqG46wKrFjnYjC53gkItSAuivSxiPp3hYQQkCrN528fLPHkkNy6hvHwihXmpw/+MoWVKlhZfQkvb/QeqCue3G9cnocxx7HBWODkaJ58jlMah8NXwwgJ4QY3AsMG4eB6GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092700; c=relaxed/simple;
	bh=HGBK0llTSj+tf+c9fHJdkguh957hwuICmRyXKwuVB+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=staTTp4S35yZsnK1fGlT+fWmNpLb0wJVjsM1oMB9k9ejRBPuxPtPKgx6Q7TwFlowVoqRSsApSrU22vIL/YaFhAhDFNFavO1AYI1H54gx5FXke5W+qiU6UiQHBbFzg+Ih6+HmPgflvuxOpjIdeFOaujn5BquzERzsVo+MsuyrV+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=aSxWI/Jz; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="aSxWI/Jz"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-533778ab0bdso63994741cf.3
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092698; x=1792697498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mPdh0GZSVxpcQOBUgnIeUgj6niHmJJ8A6jXGrVV/UAY=;
        b=aSxWI/JzXBApcnCtSk2/wWjLvkP2kHVoi+YEoYWupgk1F2kaVoxpt0JR4EzJxDZsOX
         Dm/fOE8ejqfAZ5PZDLhm4fkLILy9tCWzszjzH44Ao8udb2oYg7imRlECdU3WQOO4g6lF
         cJBpdIF8Qk0aPpGTz55d0nu1UkWYOUUT+HAKpicCmkhzzg53yNgE6C073yvCxQY/Jmmj
         P/3tbDCq+es99AFbCujVMsaH0SAioVaq51bUViQtfLj3asgZJxqjiieYEEfetBqnmPPr
         /cc7ujKfHLFHe4xVUkfrThLQYnj89iemkmS9Y+oECcdyK7cDgJxZ81ZCtBHdt+YvUvir
         4SfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092698; x=1792697498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mPdh0GZSVxpcQOBUgnIeUgj6niHmJJ8A6jXGrVV/UAY=;
        b=0/k6vDwM6TxkOUuQLbWb4V0Grts81PVz4VEyVktiJbPvUEKeFgRLca71iG1jsffpE4
         bIfVvFC9Cd5sNTkU9Hp9hjcuxdEIebQTALjoXL4ld+y/dFyfsWIg4MFacsk3B9NVBykh
         aJ9i1elpUA7C4Srk/Eo7dN3OUmbzqzij/XY7mLHezReNcUMcZvLUeH/RfJZqOlyIbboM
         /SrY8iJlKHMO1KYXpOnq8dfJ6CRWu00XmYvGVswlM3YVIUKjIzYLgNYksCr+fX5jZggE
         TGCSPk/eV77p0P7QmMd4bhrAyxkvFpFtdCzhxiOeqnNE99INUfdvozAf/8nMA8NoQLjO
         lYyQ==
X-Gm-Message-State: AFq9FYK2cX9BT12smB8I/Vn7Y/XvuhUANnFF7Uq1my29x6xHNsLtVLAe
	W84yua4slWTGJ6OxkeXKXeZacSMoe0DzDw/uEkdrBN/Sny32Rl42QRSFCPOWfgiGCuQ=
X-Gm-Gg: AYBFou2cUOaMOLf/HYkJ80UjYrA08bc5mYGNmxWOeiKAPAo2cpyEVDIPgkj/OfkEEng
	VeRW0U2sbJH+EKngSC5P/EkXYkCuvyLSUPR5kxbu2O85P/FLYmpjhbsmNO2lrqFtZ+CF62Xz6dY
	N4rWih0rRQks1sn2zgLfbhOZ6NS+QMdNEoe0Wn8oSQBqqs5+VowdGr1XFVbD8SNJnw1k5st7/Cl
	nx8ptzEAuXJeAivVNhpx+qeR4MS4yXA+bJsdjF4cj7oe4MjLjUVinSOXlFohbXcROyhBGD14NWz
	s+4WB9bv5skj/+3RFutrAwkFKdJDI6wcjH9cm8RNdJh1GbN11jRYV+yNLj4jbZ65AAfJ4dnnhwK
	8A/hO1KvzwGRm3DlJiLaN87+FfjpDkyuSDrAqS5Q26BJh1wpvOTLSUOhyzHuEuCCA0xaT4JMOB+
	XSSPlFSuullVaTDq2qD0FrRmU51Nx9Pz3IJIZ6mo8ScF/SC1XcRZ2USL0qhmUTxceQE6W4n72PE
	jbc0lq2evdvwKUA
X-Received: by 2002:a05:622a:1804:b0:535:a5f8:a5c4 with SMTP id d75a77b69052e-535a5f8b53amr327593481cf.68.1792092698077;
        Thu, 15 Oct 2026 12:31:38 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362aaaec01sm1354011cf.31.2026.10.15.12.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:31:37 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:30:39 +0000
Subject: [PATCH 15/43] io_uring: don't lose a cancel as io-wq parks a
 request
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-15-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092658; l=4557;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=HGBK0llTSj+tf+c9fHJdkguh957hwuICmRyXKwuVB+E=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGikyKTMZbS3EqgRnE1yoqxhg9tQ8hFy3L8MHcYmFGj8GJPyFrTjdmrz67N7nEWUl5ybiQvqX9S
 oo5LwV2XXkQk=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

IORING_OP_FUTEX_WAIT, IORING_OP_FUTEX_WAITV and IORING_OP_WAITID don't
block. They put the request on a list of the ring, where a wake up or a
cancellation finds it, and return IOU_ISSUE_SKIP_COMPLETE. They do so as
well if they are run by io-wq, e.g. because of IOSQE_ASYNC.

io_wq_submit_work() looks at IO_WQ_WORK_CANCEL once, before it issues the
request. Somebody who wants to cancel the request after that, and before
it is on the list, finds it running:

  io-wq worker                          io_try_cancel()
  io_wq_submit_work()
    IO_WQ_WORK_CANCEL isn't set
                                        io_async_cancel_one()
                                          sets IO_WQ_WORK_CANCEL
                                          signals the worker
                                          = -EALREADY
                                        ...
                                        io_futex_cancel() = -ENOENT
                                        ...
    io_futex_wait()
      adds the request to ->futex_list
    = IOU_ISSUE_SKIP_COMPLETE

Nobody looks at the flag again. IORING_OP_ASYNC_CANCEL returns -EALREADY
and the request stays.

It is the problem that "io_uring/poll: don't lose a cancel as io-wq arms
poll" deals with for poll.

Look at the flag once the request is on the list, and cancel it if it is
set. The lists are searched and the requests are added with ->uring_lock
held, and the flag is set before the search. So either the search finds
the request, or it came first and the flag is seen.

What the canceller is told doesn't change, see the other patch, also for
IORING_ASYNC_CANCEL_ALL and _ANY.

Fixes: 194bb58c6090 ("io_uring: add support for futex wake and wait")
Fixes: 8f350194d5cf ("io_uring: add support for vectored futex waits")
Fixes: f31ecf671ddc ("io_uring: add IORING_OP_WAITID support")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/futex.c    |  4 ++++
 io_uring/io_uring.h | 17 +++++++++++++++++
 io_uring/waitid.c   |  2 ++
 3 files changed, 23 insertions(+)

diff --git a/io_uring/futex.c b/io_uring/futex.c
index eaee14242a3a..64909a2a8c88 100644
--- a/io_uring/futex.c
+++ b/io_uring/futex.c
@@ -283,6 +283,8 @@ int io_futexv_wait(struct io_kiocb *req, unsigned int issue_flags)
 		 */
 		__set_current_state(TASK_RUNNING);
 		hlist_add_head(&req->hash_node, &ctx->futex_list);
+		if (io_wq_cancel_seen(req, issue_flags))
+			__io_futex_cancel(req);
 	} else {
 		iof->futexv_unqueued = 1;
 		if (woken != -1)
@@ -323,6 +325,8 @@ int io_futex_wait(struct io_kiocb *req, unsigned int issue_flags)
 			       &ifd->q, NULL, NULL);
 	if (!ret) {
 		hlist_add_head(&req->hash_node, &ctx->futex_list);
+		if (io_wq_cancel_seen(req, issue_flags))
+			__io_futex_cancel(req);
 		io_ring_submit_unlock(ctx, issue_flags);
 
 		return IOU_ISSUE_SKIP_COMPLETE;
diff --git a/io_uring/io_uring.h b/io_uring/io_uring.h
index c7b340e5d0a8..36d0d67fcb9f 100644
--- a/io_uring/io_uring.h
+++ b/io_uring/io_uring.h
@@ -381,6 +381,23 @@ static inline void io_ring_submit_lock(struct io_ring_ctx *ctx,
 	lockdep_assert_held(&ctx->uring_lock);
 }
 
+/*
+ * For a handler that is run by io-wq and parks the request on a list where
+ * cancellations find it, rather than completing it. Whoever tried to cancel
+ * the request before that found it running. It has flagged the work item,
+ * has searched the list in vain, and won't come back. To be called with
+ * ->uring_lock held, which the search needs as well, once the request is on
+ * the list: if the search came first, the flag is visible.
+ */
+static inline bool io_wq_cancel_seen(struct io_kiocb *req,
+				     unsigned int issue_flags)
+{
+	lockdep_assert_held(&req->ctx->uring_lock);
+
+	return (issue_flags & IO_URING_F_IOWQ) &&
+	       (atomic_read(&req->work.flags) & IO_WQ_WORK_CANCEL);
+}
+
 static inline void io_commit_cqring(struct io_ring_ctx *ctx)
 {
 	/* order cqe stores with ring update */
diff --git a/io_uring/waitid.c b/io_uring/waitid.c
index a91491650440..2ba2369681d0 100644
--- a/io_uring/waitid.c
+++ b/io_uring/waitid.c
@@ -349,6 +349,8 @@ int io_waitid(struct io_kiocb *req, unsigned int issue_flags)
 		 * a waitqueue callback, or if someone cancels it.
 		 */
 		if (!io_waitid_drop_issue_ref(req)) {
+			if (io_wq_cancel_seen(req, issue_flags))
+				__io_waitid_cancel(req, true);
 			io_ring_submit_unlock(ctx, issue_flags);
 			return IOU_ISSUE_SKIP_COMPLETE;
 		}

-- 
2.55.0

