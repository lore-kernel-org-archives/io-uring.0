Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144C840D593
	for <io-uring@vger.kernel.org>; Thu, 11 Jun 2026 01:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781140982; cv=none; b=dox/HqCd5BYMFrXAAjrJd4baGLhHmwx2SInCEuwAQPUvxE6lqFkuXlHkeKKSeplipl5FVRxzZvS3g6VnJXIul1nx3DWgxMNMEEvA636PoSgqNM/jxIvCAcR/0tV5FTNPkUcl0Td6Qzb3E0orFMDLuCcbvwfhwrDSsplhWNzzkBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781140982; c=relaxed/simple;
	bh=54E5soerW4WFvKqnvrtiTFY188BHz9ASyX/StPeL3Eg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qkpWsdpXmGYNUbE3CQwThTJgixCf8z0RNSe5jzZOQO7dUDZSEbZfJ1X4buJ/nKL5UH2lBpmhK4lg9sTimbclgxZvKe0PkB2HTowuiM5bLc9JSQ187FSq2PYnW1ymLgEUhnYt2NvW7CKOsQYHtOvEqQP4mASKFo1J+ASqNWZYlOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=T8NM6Gi8; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="T8NM6Gi8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=LG
	4aYjWV+6uAVkyULemzAIzmBdM3t7+4VuvjTO5Z6F0=; b=T8NM6Gi8ZMub/DND07
	sdABvVEI5rzIAX0pkzRYR/MLVYKCePWnLXOUMHMsyReu1zyw/IvC2kOrOocOBmmv
	2NKjs3ehRuegEslj9QJpbsnzPd41aSbiMEl7zLGGVrGHNAEsd939jlCt1dLUpZc1
	URW3FTpd39p3Abb9642xSK3aQ=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDH773gDSpqbsY_Bg--.28099S4;
	Thu, 11 Jun 2026 09:22:44 +0800 (CST)
From: Yang Xiuwei <yangxiuwei@kylinos.cn>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	Yang Xiuwei <yangxiuwei@kylinos.cn>
Subject: [PATCH 2/2] io_uring/timeout: cancel pending link timeouts from ltimeout_list
Date: Thu, 11 Jun 2026 09:22:36 +0800
Message-Id: <20260611012236.3020181-3-yangxiuwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260611012236.3020181-1-yangxiuwei@kylinos.cn>
References: <20260611012236.3020181-1-yangxiuwei@kylinos.cn>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgDH773gDSpqbsY_Bg--.28099S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFWrCF4xXw43tF15tr4DCFg_yoW8Kr18pF
	Z093s8Xry8Xr42ga4fJF4DCF4a9F10kr47Ar9xWrWvyrn7Xrs2gr48t3sYqFy7Jr1kAr43
	XF40gFW5ur4UZrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j1tCwUUUUU=
Sender: yangxiuwei2025@163.com
X-CM-SenderInfo: p1dqw55lxzvxisqskqqrwthudrp/xtbC6gShMmoqDeSrhgAA35

TIMEOUT_REMOVE and IORING_OP_ASYNC_CANCEL look up pending timeouts via
io_timeout_cancel(), but that path only scans timeout_list. Pending
link timeouts live on ltimeout_list instead, so cancel/remove by
user_data returns -ENOENT.

Fall back to ltimeout_list when the initial lookup fails, reusing
__io_disarm_linked_timeout(). Complete the disarmed link timeout via
io_req_queue_tw_complete() rather than io_req_task_queue_fail(), and
clean up the link timeout state on the head request.

Signed-off-by: Yang Xiuwei <yangxiuwei@kylinos.cn>
---
 io_uring/timeout.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/io_uring/timeout.c b/io_uring/timeout.c
index c4dd26cf342d..8ecc9a7f1597 100644
--- a/io_uring/timeout.c
+++ b/io_uring/timeout.c
@@ -348,18 +348,52 @@ static struct io_kiocb *io_timeout_extract(struct io_ring_ctx *ctx,
 	return req;
 }
 
+static struct io_kiocb *io_linked_timeout_cancel(struct io_ring_ctx *ctx,
+						 struct io_cancel_data *cd)
+	__must_hold(&ctx->completion_lock)
+	__must_hold(&ctx->timeout_lock)
+{
+	struct io_timeout *timeout;
+
+	list_for_each_entry(timeout, &ctx->ltimeout_list, list) {
+		struct io_kiocb *link = cmd_to_io_kiocb(timeout);
+		struct io_kiocb *head;
+
+		if (!io_cancel_req_match(link, cd))
+			continue;
+		head = timeout->head;
+		if (!head)
+			return ERR_PTR(-EALREADY);
+		link = __io_disarm_linked_timeout(head, link);
+		if (!link)
+			return ERR_PTR(-EALREADY);
+		head->flags &= ~REQ_F_LINK_TIMEOUT;
+		return link;
+	}
+	return ERR_PTR(-ENOENT);
+}
+
 int io_timeout_cancel(struct io_ring_ctx *ctx, struct io_cancel_data *cd)
 	__must_hold(&ctx->completion_lock)
 {
 	struct io_kiocb *req;
+	bool linked = false;
 
 	raw_spin_lock_irq(&ctx->timeout_lock);
 	req = io_timeout_extract(ctx, cd);
+	if (req == ERR_PTR(-ENOENT)) {
+		req = io_linked_timeout_cancel(ctx, cd);
+		if (!IS_ERR(req))
+			linked = true;
+	}
 	raw_spin_unlock_irq(&ctx->timeout_lock);
 
 	if (IS_ERR(req))
 		return PTR_ERR(req);
-	io_req_task_queue_fail(req, -ECANCELED);
+	if (linked)
+		io_req_queue_tw_complete(req, -ECANCELED);
+	else
+		io_req_task_queue_fail(req, -ECANCELED);
 	return 0;
 }
 
-- 
2.25.1

