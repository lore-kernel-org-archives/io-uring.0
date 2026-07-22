Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D1C4399FA
	for <io-uring@vger.kernel.org>; Wed, 22 Jul 2026 18:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784744247; cv=none; b=qhGF5oQcAGo8Odx1BXn+Rc768BWVmLiNNlf6Aby75JitkEU/kaj+7VX2/xef2McrBv9AKviStJtrRKjYZlgoUG3NCA18dljPSuHzkNLv3bb/4l9GrpV8jOaSbVqtuaaes04hIL3KyUPSe/VlXZ3HhcbdL0/ep93CACJ6IiQi+Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784744247; c=relaxed/simple;
	bh=3qvNX8g4BnLlgw2i0CdcabHwqRgCLjE8WQQGum5vj/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e5c3jfc0P6JJeSKNrv/MYWVzFqx9HVY4f/scogb9g5og7jhWmW7uWRV+E4um70qzH0Hamw1czrUN8LxqZwrN1bbmLH2uRi544/OIMMhgEOJhmLw+N/kq45N/gKmWJVxIaBfXdKzlNke4XbAFFRUWwQyUF3ORuqrydO1wQuayr/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rGFrHZ8E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FfXlfZdB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rGFrHZ8E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FfXlfZdB; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rGFrHZ8E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FfXlfZdB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rGFrHZ8E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FfXlfZdB"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 791EE3E41;
	Wed, 22 Jul 2026 18:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784744243; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wmhtbvxoW7Ui3wik06QP6YEgcbxPcKAH/QeDJmpRSEo=;
	b=rGFrHZ8EJscSvLgEUEZjn+GWALyIdsbOJS0EcAMtki0wBndjuw1nDUCDfEHMvttHGWkexp
	f/CgtBS1WVdIe9tE5tm96mr+JZbC5lZJAexbGtFzFkLErqhIG8sAWmmMnnGu/hm8PRO2+8
	w1QRTcgzkzIEpoNF8RfPeIgqJPra2PQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784744243;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wmhtbvxoW7Ui3wik06QP6YEgcbxPcKAH/QeDJmpRSEo=;
	b=FfXlfZdBK7JrQdmlHQjEoDh5ZQolnc46GZQJfraTPAkdREqZw7ptyP4gQM+VsgTQH5kt3T
	La6QxsQ/zjM4hTAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784744243; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wmhtbvxoW7Ui3wik06QP6YEgcbxPcKAH/QeDJmpRSEo=;
	b=rGFrHZ8EJscSvLgEUEZjn+GWALyIdsbOJS0EcAMtki0wBndjuw1nDUCDfEHMvttHGWkexp
	f/CgtBS1WVdIe9tE5tm96mr+JZbC5lZJAexbGtFzFkLErqhIG8sAWmmMnnGu/hm8PRO2+8
	w1QRTcgzkzIEpoNF8RfPeIgqJPra2PQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784744243;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wmhtbvxoW7Ui3wik06QP6YEgcbxPcKAH/QeDJmpRSEo=;
	b=FfXlfZdBK7JrQdmlHQjEoDh5ZQolnc46GZQJfraTPAkdREqZw7ptyP4gQM+VsgTQH5kt3T
	La6QxsQ/zjM4hTAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3D406779B0;
	Wed, 22 Jul 2026 18:17:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gbq9CDMJYWpcSwAAD6G6ig
	(envelope-from <krisman@suse.de>); Wed, 22 Jul 2026 18:17:23 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	Gabriel Krisman Bertazi <krisman@suse.de>
Subject: [PATCH liburing 1/2] test/send_recvmsg: Preserve msghdr until op_recvmsg completes
Date: Wed, 22 Jul 2026 14:17:09 -0400
Message-ID: <20260722181710.79099-2-krisman@suse.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260722181710.79099-1-krisman@suse.de>
References: <20260722181710.79099-1-krisman@suse.de>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spam-Level: 

msghdr is allocated on the stack at recv_prep, which means it may go out
of scope before the kernel has a chance to complete the operation.  This
results in spurious test failures when we reach far enough into recv_fn
to reuse the stack space before op_recvmsg executes.  I found it easily
reproducible when compiling with '-O0 -g3' to avoid gcc from optimizing
further local variables out of the stack.

Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
---
 test/send_recvmsg.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/test/send_recvmsg.c b/test/send_recvmsg.c
index f2e1efc0..9154b6c0 100644
--- a/test/send_recvmsg.c
+++ b/test/send_recvmsg.c
@@ -32,10 +32,9 @@ static int ud;
 static int no_pbuf_ring;
 
 static int recv_prep(struct io_uring *ring, int *sockfd, struct iovec iov[],
-		     int iov_count, int bgid, int async)
+		     int iov_count, int bgid, int async, struct msghdr *msg)
 {
 	struct sockaddr_in saddr;
-	struct msghdr msg;
 	struct io_uring_sqe *sqe;
 	int ret, val = 1;
 
@@ -66,7 +65,7 @@ static int recv_prep(struct io_uring *ring, int *sockfd, struct iovec iov[],
 		return 1;
 	}
 
-	io_uring_prep_recvmsg(sqe, *sockfd, &msg, 0);
+	io_uring_prep_recvmsg(sqe, *sockfd, msg, 0);
 	if (bgid) {
 		iov->iov_base = NULL;
 		sqe->flags |= IOSQE_BUFFER_SELECT;
@@ -76,10 +75,10 @@ static int recv_prep(struct io_uring *ring, int *sockfd, struct iovec iov[],
 	sqe->user_data = ++ud;
 	if (async)
 		sqe->flags |= IOSQE_ASYNC;
-	memset(&msg, 0, sizeof(msg));
-	msg.msg_namelen = sizeof(struct sockaddr_in);
-	msg.msg_iov = iov;
-	msg.msg_iovlen = iov_count;
+	memset(msg, 0, sizeof(*msg));
+	msg->msg_namelen = sizeof(struct sockaddr_in);
+	msg->msg_iov = iov;
+	msg->msg_iovlen = iov_count;
 
 	ret = io_uring_submit(ring);
 	if (ret <= 0) {
@@ -168,6 +167,7 @@ static void *recv_fn(void *data)
 	struct io_uring_buf_ring *br = NULL;
 	char buf[MAX_MSG + 1];
 	struct iovec iov[MAX_IOV_COUNT];
+	struct msghdr msg;
 	struct io_uring ring;
 	int ret, sockfd;
 
@@ -225,7 +225,7 @@ static void *recv_fn(void *data)
 
 	ret = recv_prep(&ring, &sockfd, iov, rd->iov_count,
 			(rd->buf_ring || rd->buf_select) ? BUF_BGID : 0,
-			rd->async);
+			rd->async, &msg);
 	if (ret) {
 		fprintf(stderr, "recv_prep failed: %d\n", ret);
 		goto err;
-- 
2.54.0

