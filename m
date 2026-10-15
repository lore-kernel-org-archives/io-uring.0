Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CE742E004
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092730; cv=none; b=hDoefBibUETO7gKnOSPE6qTjq1XSwj853gxJD+ysTN7tAgIaYaf4TRaKqTweYS9K1jE+AzUWwa0anLvXIoCvzQqnJVzMtREv8knM69D29XaL/rOaMMTKnOkDQbTDw/7VLhfeM1IrMaCZ2we/a5sZw1S44pG6lNyXMbQ8t6IneMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092730; c=relaxed/simple;
	bh=cjeB5DLvrFjLadAYSFw1F5bPOeX3vZ+Yn88rvo55u6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FfeZGY83JOpLrQuN6KdoDnB3zRaTrgPvo+uZyJFyKNPtjhaY32X8PzzfHpZTzXEVO6Duppc1qSdACsyKggq7afX9Atgp5xkYgWm96/fvLtC65WgSaZgU0uC7yeeNv0I5/ER/oTn9MoBTZyOYNqlpfYFyrfVQlWc/6OK/fEa9jqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=Y19i6PQM; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="Y19i6PQM"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-9178510f3bdso72226926d6.2
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092728; x=1792697528; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FaTMaQtEscfPB4IN6//LykvaiDhscU19kwbDe9DDSaU=;
        b=Y19i6PQMEN7OfXLcd52SpfdbrmOFSx9Hdmy2mvHzQ/hjRn5anybgS+Pkab2ZZrc2Qx
         3P/hjSTjUoJK/JN00s1tv7D/R5sDL2eHsWN9kqQ1IeMteSo4Aatrv4/oXanL2di26IIk
         o7+NN9iBYPrNgdfhobGDzOCqs4FyOqmEGr0KADKkwBu5V81L6peznaCVc7dFCxAN0iQq
         FbiXgwYLXhuOPrIygippsTbRxwmcyc2SKUVDy02iptDKizLSbWeT58BdO1bbAxzYrJrU
         4P8dLr9qlZTEqIeeLpeaBXHZKrxS3eZY73/gIhDkE0oG85UD+7tKrzLY5ywu82ssA0gG
         03Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092728; x=1792697528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FaTMaQtEscfPB4IN6//LykvaiDhscU19kwbDe9DDSaU=;
        b=xpaR2O/At8/t/kdfU3Fx3tUWSWbvAmFcXE5H3hQUyG3kzEyYfnoj49cbpesjnlLQOp
         asew8Gbs8S05PFUEG6u/36aeM9VL7Al03KXgKKLM5gAwOZ2qkezWPi8tSLUIXzrGQqCY
         kLflzby9WrWjFWVNDD0FlVsWTtwv9cBd7MX075m6rdaddSF0Q5OLER+u/H9ZdPyQNjZ0
         t37wI8H2VPMvTw+K67OKYOryqFUGNqTImxSjqJsSy/VyLsxQrIXjp32YBa9j4r6mjuUr
         +bysJpoAnmtxefVMRGeEmLeI562VGaa1iE7BZjy7lAI5nbZI8K+hmu1bgyc/gYZqKh2b
         08iw==
X-Gm-Message-State: AFq9FYIYsBht5DK0JuYVSWXy5YeqVz8PgneTD+8e06z4nG2VXO/6ymBB
	JUp/wzR4675R1EqwFBTJpCYakX/ndZf/OKxSmtxpJZHr/IkMTRF701JPyidqY7o/yEuaK/KCdp6
	KBefg
X-Gm-Gg: AYBFou0F116dlp7Rqa8DOXQhZOC5KGINt7G0uRJy2CBatJvG2doFS9n0SqDAbNZ3cPW
	6tEzwyLIS0htpveqL/hn26zMDhYegkNZSbk49aO0G6CZTTc13S56IcMyExbkadyY1oxcqrFuDyo
	4Zk3TegyOiNfCoBka4FY1fN66H7JTiUEhLNVHXTeF7FHkRSGxWBY+/eZEYV05jo1WQG+dO4i843
	MmT+7Ku1bzPrGCvKvR/77FB6vp4omRNqy9FCbh1HsnC+V+OYkiHmh1J6o4rTOnbuyzermM0IrQc
	zkq7g1XaYV/dOeBTXiZXqGDMEeB2L8lMI3qffrjJoou0srvC/ijWKwv5BXNQGYrSUYLkfnYHXNH
	zIGULV9eHcLLxTRZxgNmZ8UeyAMDcObX0+sx0aP6ctJwzVyNH7rKs3EIAhsWoTAzm5vK6bnl8gl
	tDj3A4h6h3rFq/W8E70lpSL3KMZajUvlqBi9fwVSz9v5z7p8orPRk2jj6Spkq+6UfyLbiv5PBdu
	gvRG/mFEIm5ATA=
X-Received: by 2002:a05:620a:27c2:b0:93e:fc02:e8d4 with SMTP id af79cd13be357-93efc03069fmr1406960285a.27.1792092727983;
        Thu, 15 Oct 2026 12:32:07 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a1690fdsm13411285a.11.2026.10.15.12.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:32:07 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:30:53 +0000
Subject: [PATCH 29/43] io_uring/timeout: don't skip over reached sequences
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-29-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092659; l=3885;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=cjeB5DLvrFjLadAYSFw1F5bPOeX3vZ+Yn88rvo55u6s=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLBPoMrbikRpUJmuVsm3J3dghqHSjjQkGd78Fu2/0v2C9mJ0z9FbzqbyBjrQpyI/ZfM5DYfNIeW
 okwG23bfTEQ0=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

io_flush_timeouts() copes with the wrap of the CQ sequence by looking at
the distance from ->cq_last_tm_flush. That relies on the target of each
pending timeout being at or ahead of the last flush.

io_timeout() breaks that. It sets ->cq_last_tm_flush to the current
sequence, on the assumption that nothing has been posted since the last
flush. That isn't true. A multishot request posts its CQEs right when it
is issued or retried, but they are committed, and the timeouts flushed,
at the end of the submission or task_work run:

  X: IORING_OP_TIMEOUT, off == 1       target_seq == N + 1
  io_submit_sqes()
    multishot recv, posts two CQEs     sequence == N + 2
    Y: IORING_OP_TIMEOUT, off == 100   ->cq_last_tm_flush = N + 2
  io_flush_timeouts()
    X: events_needed = N + 1 - (N + 2) // 0xffffffff
       events_got = 0                  // not yet

X isn't completed although the completions it was waiting for have
happened, only its timer can end it now. And as the list is sorted and
the walk ends at the first timeout that isn't due, it gets in the way of
the ones behind it. The insertion sort has the same problem, it measures
the distance of the pending targets from the current sequence.

->cq_last_tm_flush only needs to be brought up to date if no timeout is
waiting for a sequence, as io_flush_timeouts() isn't called before the
first one is set up. Otherwise it is current enough. Timeouts with a
sequence come first in the list, so looking at the first entry will do.
Use the last flush as the base for the insertion sort as well.

Fixes: f010505b78a4 ("io_uring: flush timeouts that should already have expired")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/timeout.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/io_uring/timeout.c b/io_uring/timeout.c
index 9c239c0a1715..8b65ba20e143 100644
--- a/io_uring/timeout.c
+++ b/io_uring/timeout.c
@@ -645,8 +645,9 @@ int io_timeout(struct io_kiocb *req, unsigned int issue_flags)
 	struct io_timeout *timeout = io_kiocb_to_cmd(req, struct io_timeout);
 	struct io_ring_ctx *ctx = req->ctx;
 	struct io_timeout_data *data = req->async_data;
+	struct io_timeout *first;
 	struct list_head *entry;
-	u32 tail, off = timeout->off;
+	u32 tail, base, off = timeout->off;
 
 	raw_spin_lock_irq(&ctx->timeout_lock);
 
@@ -663,11 +664,17 @@ int io_timeout(struct io_kiocb *req, unsigned int issue_flags)
 	tail = data_race(ctx->cached_cq_tail) - atomic_read(&ctx->cq_timeouts);
 	timeout->target_seq = tail + off;
 
-	/* Update the last seq here in case io_flush_timeouts() hasn't.
-	 * This is safe because ->completion_lock is held, and submissions
-	 * and completions are never mixed in the same ->completion_lock section.
+	/*
+	 * Update the last seq here in case io_flush_timeouts() hasn't, it only
+	 * gets called once sequences are in use. Leave it alone if there are
+	 * timeouts waiting for one. CQEs may have been posted since the last
+	 * flush, and a target that has been reached must not fall behind it.
 	 */
-	ctx->cq_last_tm_flush = tail;
+	first = list_first_entry_or_null(&ctx->timeout_list, struct io_timeout,
+					 list);
+	if (!first || io_is_timeout_noseq(cmd_to_io_kiocb(first)))
+		ctx->cq_last_tm_flush = tail;
+	base = ctx->cq_last_tm_flush;
 
 	/*
 	 * Insertion sort, ensuring the first entry in the list is always
@@ -679,8 +686,8 @@ int io_timeout(struct io_kiocb *req, unsigned int issue_flags)
 
 		if (io_is_timeout_noseq(nxt))
 			continue;
-		/* nxt.seq is behind @tail, otherwise would've been completed */
-		if (off >= nextt->target_seq - tail)
+		/* no target is behind the last flush, see io_flush_timeouts() */
+		if (timeout->target_seq - base >= nextt->target_seq - base)
 			break;
 	}
 add:

-- 
2.55.0

