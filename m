Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6828C4399EB
	for <io-uring@vger.kernel.org>; Wed, 22 Jul 2026 18:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784744255; cv=none; b=rIVOviWZq75vW5OqFy74jL1uGydQFxc1w5BNCHeROFg210ev0UEVN/0KPFO+yvS2A5SDQO8+0IB5LSV4C2taioxPUe8Zu36SY4ejcGDgyzsPhe6CUCx1fT1e4Q8znPGo/uXcFqTUFvf4DIRUKpzXBkT6KbasCEjQ6YaEp9AGVoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784744255; c=relaxed/simple;
	bh=6H6xirUbGkQOVFlOjyL3cTNGfTpQ+FHgMxs6lynGP+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qyptlrb2NTxmcpWaYgcoA+sTPEkiUMjO8i/QIhOyWIBD3rBetvmCJVIxMtIEiJYUapJBZEZsefVwQJ671RrakvzFWorvLDs+YtTnWZ0L1lBErPzOX+XyIq2sG5tT17Tbdn4gG5i1GQojIjBJgKSDw36945Xd9tN3Sq+VWCnlnFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=l5eC7FU4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=c2lVUwT/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=l5eC7FU4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=c2lVUwT/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="l5eC7FU4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="c2lVUwT/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="l5eC7FU4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="c2lVUwT/"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 576823E42;
	Wed, 22 Jul 2026 18:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784744245; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jGmXDWojXPVXmiv/BdmmmN5Q/tlxJOtELo7PWGkBKBU=;
	b=l5eC7FU4N6G78y0tY3vGOYsn41W4j44x663O4xOLRfcB+tlOqb91x6RN4e9kHBPBw84HNa
	WtsDGDZXau0uv7b8KNkdw02EhGH40zJP9Wy+2eaL2VVSssLqIak+WJjGdlcsKsBWA93+oZ
	f4Fo6ZRRegte76hhGokjbCVsiNVv18k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784744245;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jGmXDWojXPVXmiv/BdmmmN5Q/tlxJOtELo7PWGkBKBU=;
	b=c2lVUwT/eO9HV8NjRn34BBlUsYVaX8vYRZb7BjWjqdYmTdc7gA3MJ+LSeeUEps0ZjNcCoh
	oyZKgxrO/Hoqi3DQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784744245; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jGmXDWojXPVXmiv/BdmmmN5Q/tlxJOtELo7PWGkBKBU=;
	b=l5eC7FU4N6G78y0tY3vGOYsn41W4j44x663O4xOLRfcB+tlOqb91x6RN4e9kHBPBw84HNa
	WtsDGDZXau0uv7b8KNkdw02EhGH40zJP9Wy+2eaL2VVSssLqIak+WJjGdlcsKsBWA93+oZ
	f4Fo6ZRRegte76hhGokjbCVsiNVv18k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784744245;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jGmXDWojXPVXmiv/BdmmmN5Q/tlxJOtELo7PWGkBKBU=;
	b=c2lVUwT/eO9HV8NjRn34BBlUsYVaX8vYRZb7BjWjqdYmTdc7gA3MJ+LSeeUEps0ZjNcCoh
	oyZKgxrO/Hoqi3DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1ACAC779B0;
	Wed, 22 Jul 2026 18:17:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VemLOzQJYWptSwAAD6G6ig
	(envelope-from <krisman@suse.de>); Wed, 22 Jul 2026 18:17:24 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	Gabriel Krisman Bertazi <krisman@suse.de>
Subject: [PATCH liburing 2/2] test/recv-msgall-stream: Preserve msghdr until op_recvmsg completes
Date: Wed, 22 Jul 2026 14:17:10 -0400
Message-ID: <20260722181710.79099-3-krisman@suse.de>
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
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]

msghdr is allocated on the stack at recv_prep, which means it may go out
of scope before the kernel has a chance to complete the operation.  This
results in spurious test failures when we reach far enough into recv_fn
to reuse the stack space before op_recvmsg executes.  I found it easily
reproducible when compiling with '-O0 -g3' to avoid gcc from optimizing
further local variables out of the stack.

Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
---
 test/recv-msgall-stream.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/test/recv-msgall-stream.c b/test/recv-msgall-stream.c
index ff9fd2a2..a056a6e8 100644
--- a/test/recv-msgall-stream.c
+++ b/test/recv-msgall-stream.c
@@ -74,10 +74,9 @@ err:
 }
 
 static int recv_prep(struct io_uring *ring, struct iovec *iov, int *sock,
-		     struct recv_data *rd)
+		     struct recv_data *rd, struct msghdr *msg)
 {
 	struct io_uring_sqe *sqe;
-	struct msghdr msg = { };
 	int sockfd, sockout = -1, ret;
 
 	sockfd = get_conn_sock(rd, &sockout);
@@ -89,10 +88,10 @@ static int recv_prep(struct io_uring *ring, struct iovec *iov, int *sock,
 		io_uring_prep_recv(sqe, sockfd, iov->iov_base, iov->iov_len,
 					MSG_WAITALL);
 	} else {
-		msg.msg_namelen = sizeof(struct sockaddr_in);
-		msg.msg_iov = iov;
-		msg.msg_iovlen = 1;
-		io_uring_prep_recvmsg(sqe, sockfd, &msg, MSG_WAITALL);
+		msg->msg_namelen = sizeof(struct sockaddr_in);
+		msg->msg_iov = iov;
+		msg->msg_iovlen = 1;
+		io_uring_prep_recvmsg(sqe, sockfd, msg, MSG_WAITALL);
 	}
 
 	sqe->user_data = 2;
@@ -198,6 +197,7 @@ static int recv_uring(struct recv_data *rd)
 		.iov_base = buf,
 		.iov_len = sizeof(buf),
 	};
+	struct msghdr msg;
 	struct io_uring_params p = { };
 	struct io_uring ring;
 	int ret, sock = -1, sockout = -1;
@@ -212,7 +212,7 @@ static int recv_uring(struct recv_data *rd)
 		goto err;
 	}
 
-	sock = recv_prep(&ring, &iov, &sockout, rd);
+	sock = recv_prep(&ring, &iov, &sockout, rd, &msg);
 	if (ret) {
 		fprintf(stderr, "recv_prep failed: %d\n", ret);
 		goto err;
-- 
2.54.0

