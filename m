Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B75156CA
	for <io-uring@vger.kernel.org>; Wed,  1 Apr 2026 02:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775010140; cv=none; b=qe/7ZZTF3opWQ0b4m8hn3tUrRTFC98e/A4j8QLwOU5BzD98E/OUucg00kgEYvozMstkiwxO3FOu3uq3okReOdRrUaPRX3CxPSaglQ4PvoHXNVJjhMjTgDlvXdfBLBTbtCt8bLU4XkRJquOh30op9ghYiVQIaK5BNmA1PPr/zhnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775010140; c=relaxed/simple;
	bh=r5ZISc+RT5rZGnEAtsEqmrnINdvO9jLF/ut0cYm2fcM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gcIUEMQaXYjQ1vVgtM476ki6MXbkmO2ulC9YfCp/7O6Li24YMwKfbZPu1ig+F+hVeEDwrVYVZZ/La/bVh9LPKvZMqJ1NcSxjkzXCTIkd8n4h7skiJ7Ltv1jVq7Hqj/Q6l5LoWf9PrF+Yxy34PGF6+WHODB0VEv+c8TA0RIQXkTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=L/nQPwV7; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="L/nQPwV7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=ZI
	zDnkJEWuvDcoEILhGBEIPP38ohtyudrRWB5NbqEpc=; b=L/nQPwV7gKWIa9XKsZ
	HAXDIuCR0WZ7+VILA194EfZmBo3ydadZX8EVUZSJbL5si3ZTZY3QAPjW0mPpBiBC
	quOXli4/a/2n8D3PA/XENv4HP3oemhsyKY9f1PhMjW2f0tIx3d+4ra4rNmVE6V49
	WXKgAzMBW2T0/dEODGyD6aGn4=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wA3CR9Igcxpi86XCg--.477S2;
	Wed, 01 Apr 2026 10:22:00 +0800 (CST)
From: Yang Xiuwei <yangxiuwei@kylinos.cn>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	Yang Xiuwei <yangxiuwei@kylinos.cn>
Subject: [PATCH] io_uring: use local ctx consistently
Date: Wed,  1 Apr 2026 10:21:58 +0800
Message-Id: <20260401022158.2327865-1-yangxiuwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wA3CR9Igcxpi86XCg--.477S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF17ZF17tF15Jw1fuFW7urg_yoW8tF43pF
	WFkas5JFyfZr47Xan7JF48GFW2q3W0vF48G395ArWSyrsxXrnIgF18ta4FkFyUtF4DArWf
	XFnagrZ8Zw1UW37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uk3kNUUUUU=
Sender: yangxiuwei2025@163.com
X-CM-SenderInfo: p1dqw55lxzvxisqskqqrwthudrp/xtbCwggAkGnMgUj+1QAA3d

Use the struct io_ring_ctx *ctx already held in io_buffer_select(),
io_send_zc_prep(), and io_timeout_fn() for submit lock/unlock,
compat checks, and cq_timeouts accounting, instead of repeating
req->ctx.

No functional change.

Signed-off-by: Yang Xiuwei <yangxiuwei@kylinos.cn>
---
 io_uring/kbuf.c    | 4 ++--
 io_uring/net.c     | 2 +-
 io_uring/timeout.c | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/io_uring/kbuf.c b/io_uring/kbuf.c
index 5257b3aad395..8da2ff798170 100644
--- a/io_uring/kbuf.c
+++ b/io_uring/kbuf.c
@@ -230,7 +230,7 @@ struct io_br_sel io_buffer_select(struct io_kiocb *req, size_t *len,
 	struct io_br_sel sel = { };
 	struct io_buffer_list *bl;
 
-	io_ring_submit_lock(req->ctx, issue_flags);
+	io_ring_submit_lock(ctx, issue_flags);
 
 	bl = io_buffer_get_list(ctx, buf_group);
 	if (likely(bl)) {
@@ -239,7 +239,7 @@ struct io_br_sel io_buffer_select(struct io_kiocb *req, size_t *len,
 		else
 			sel.addr = io_provided_buffer_select(req, len, bl);
 	}
-	io_ring_submit_unlock(req->ctx, issue_flags);
+	io_ring_submit_unlock(ctx, issue_flags);
 	return sel;
 }
 
diff --git a/io_uring/net.c b/io_uring/net.c
index d27adbe3f20b..338832488483 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -1366,7 +1366,7 @@ int io_send_zc_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	if (zc->msg_flags & MSG_DONTWAIT)
 		req->flags |= REQ_F_NOWAIT;
 
-	if (io_is_compat(req->ctx))
+	if (io_is_compat(ctx))
 		zc->msg_flags |= MSG_CMSG_COMPAT;
 
 	iomsg = io_msg_alloc_async(req);
diff --git a/io_uring/timeout.c b/io_uring/timeout.c
index cb61d4862fc6..798d88940d14 100644
--- a/io_uring/timeout.c
+++ b/io_uring/timeout.c
@@ -265,8 +265,8 @@ static enum hrtimer_restart io_timeout_fn(struct hrtimer *timer)
 
 	raw_spin_lock_irqsave(&ctx->timeout_lock, flags);
 	list_del_init(&timeout->list);
-	atomic_set(&req->ctx->cq_timeouts,
-		atomic_read(&req->ctx->cq_timeouts) + 1);
+	atomic_set(&ctx->cq_timeouts,
+		atomic_read(&ctx->cq_timeouts) + 1);
 	raw_spin_unlock_irqrestore(&ctx->timeout_lock, flags);
 
 	if (!(data->flags & IORING_TIMEOUT_ETIME_SUCCESS))
-- 
2.25.1

