Received: from out-zbxj-a78.jellyfish.systems (out-zbxj-a78.jellyfish.systems [198.54.127.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40FB3D953C
	for <io-uring@vger.kernel.org>; Sat, 19 Sep 2026 12:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789820606; cv=none; b=BjYBETnxBNOxF9VOoME9V1r8AuENAbKmXX7mzZ9M4ynB/jMgN7DVtQa4SEsm0GYwuspkjRa4T84mTrt4Wmz5VNZKihy3WtsJaK5As9DpHGpDdkJDFUfEZbv3kkkcOucyW8euALcpJZURr6nBcaa5VkwTBC6XwkfG/EvS1dZ/UWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789820606; c=relaxed/simple;
	bh=cLXSs5k1cFfy/QfGk62OOWM3QYmcLFQ/BVComJtg8JM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eG9vcQu18MIXcymNQo86Tk/JUIldnWmV5ExXUvWmbM7xU+VghfHIU47dVb/FghKcvAkpScWkhUmW+TrjPYoUg12hZdPsJIZkrcHG1c6WuhecGjv7VP21TpbPAsiWPo5ULdE6QGELEJuyxbwyjiVIB5EOEkFdbd04cDHgJI/OJQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=ohV8KxiI; arc=none smtp.client-ip=198.54.127.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="ohV8KxiI"
Received: from fedora (unknown [39.144.124.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hn7N864PZz8sX2;
	Sat, 19 Sep 2026 12:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1789819210;
	bh=i8mbmtOC0LIAxCltG3ZjfseHGOVY9Uv3rBMziTX8vIc=;
	h=From:To:Cc:Subject:Date:From;
	b=ohV8KxiIk2dYwMh1LtJdPjTeUDe9TKWSWjiyiNY6Z1JOk2kCYGktBdkE83gi1LKUj
	 /LdG+TPGuiFerGa1GXucd18hQfr7bJNnA/GwhnWEwOUJk2EltnO3a6Kdy6PfhwTl8T
	 IoR37yo9Y1Pu729kjzY75SeMS5Gxs0z+ZBunFwZnpxbkM+Hk3UVkSnx8Eg0untn6wc
	 nZPel1lDXsNoirTwqB7IyzTo7Q41LCT703K/Hv2lUBAWlVonBm5DbM7Q7c3Xssj76B
	 jvOJmLuvSJdqryXuQ1/MSjcQxdvAigNWRLIEMN63KFmLtxyML1dUKGpz5dkFj7kiHz
	 5FGTPjzo4KoDQ==
From: Tianyi Chen <hi@tychen.cc>
To: io-uring@vger.kernel.org
Cc: axboe@kernel.dk
Subject: [PATCH] io_uring/rw: do not infer NOWAIT support from poll readiness
Date: Sat, 19 Sep 2026 19:59:47 +0800
Message-ID: <20260919115948.1269869-1-hi@tychen.cc>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: hi@tychen.cc

A poll-ready file can still block if another reader consumes the data or
a write exceeds the available space. Without FMODE_NOWAIT or O_NONBLOCK,
IOCB_NOWAIT does not prevent this from blocking the ring submitter.

Remove the poll fallback and route unsupported requests to io-wq after
polling, rather than repeatedly retrying them in task work. Downgrade
multishot reads on these files to single-shot completion; files with
nonblocking support keep multishot behavior.

Fixes: f7c913438533 ("io_uring/rw: allow pollable non-blocking attempts for !FMODE_NOWAIT")

Closes: https://github.com/axboe/liburing/issues/1623

Assisted-by: LLM
Signed-off-by: Tianyi Chen <hi@tychen.cc>
---
 io_uring/rw.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/io_uring/rw.c b/io_uring/rw.c
index 432820f86251..0c3585f8d5f0 100644
--- a/io_uring/rw.c
+++ b/io_uring/rw.c
@@ -34,21 +34,6 @@ struct io_rw {
 	rwf_t				flags;
 };
 
-static bool io_file_supports_nowait(struct io_kiocb *req, __poll_t mask)
-{
-	/* If FMODE_NOWAIT is set for a file, we're golden */
-	if (req->flags & REQ_F_SUPPORT_NOWAIT)
-		return true;
-	/* No FMODE_NOWAIT, if we can poll, check the status */
-	if (io_file_can_poll(req)) {
-		struct poll_table_struct pt = { ._key = mask };
-
-		return vfs_poll(req->file, &pt) & mask;
-	}
-	/* No FMODE_NOWAIT support, and file isn't pollable. Tough luck. */
-	return false;
-}
-
 static int io_iov_buffer_select_prep(struct io_kiocb *req)
 {
 	struct iovec __user *uiov;
@@ -859,6 +844,10 @@ static int io_rw_init_file(struct io_kiocb *req, fmode_t mode, int rw_type)
 	if (!(req->flags & REQ_F_FIXED_FILE))
 		req->flags |= io_file_get_flags(file);
 
+	/* Poll readiness cannot guarantee that a read or write will not block. */
+	if (!(req->flags & REQ_F_SUPPORT_NOWAIT))
+		req->flags |= REQ_F_FORCE_ASYNC;
+
 	kiocb->ki_flags = file->f_iocb_flags;
 	ret = kiocb_set_rw_flags(kiocb, rw->flags, rw_type);
 	if (unlikely(ret))
@@ -936,7 +925,7 @@ static int __io_read(struct io_kiocb *req, struct io_br_sel *sel,
 
 	if (force_nonblock) {
 		/* If the file doesn't support async, just async punt */
-		if (unlikely(!io_file_supports_nowait(req, EPOLLIN)))
+		if (unlikely(!(req->flags & REQ_F_SUPPORT_NOWAIT)))
 			return -EAGAIN;
 		kiocb->ki_flags |= IOCB_NOWAIT;
 	} else {
@@ -1055,6 +1044,8 @@ int io_read_mshot(struct io_kiocb *req, unsigned int issue_flags)
 	/* make it sync, multishot doesn't support async execution */
 	rw->kiocb.ki_complete = NULL;
 	ret = __io_read(req, &sel, issue_flags);
+	if (!(req->flags & REQ_F_SUPPORT_NOWAIT))
+		req->flags &= ~REQ_F_APOLL_MULTISHOT;
 
 	/*
 	 * If we get -EAGAIN, recycle our buffer and just let normal poll
@@ -1149,7 +1140,7 @@ int io_write(struct io_kiocb *req, unsigned int issue_flags)
 
 	if (force_nonblock) {
 		/* If the file doesn't support async, just async punt */
-		if (unlikely(!io_file_supports_nowait(req, EPOLLOUT)))
+		if (unlikely(!(req->flags & REQ_F_SUPPORT_NOWAIT)))
 			goto ret_eagain;
 
 		/* Check if we can support NOWAIT. */
-- 
2.55.0

