Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30F72EACEF
	for <io-uring@vger.kernel.org>; Thu, 13 Aug 2026 00:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786581650; cv=none; b=eUd+qQpmtTIvQNQQ6UWnfqE4FNrPdCUAlNUnpzdFdsvBCcw+J/dxaSDyuHcVF1nuS+oncjE/+InsOBWaikVFDOZudfL9bOzzsciXeEj51jjKq5DBauHR6LCOmVc1QBozLhDK7Rh+m/nODBOnl4Ej3oFojGJ15OIu+2tAb/y4hhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786581650; c=relaxed/simple;
	bh=5Uu/Cz8fMfdy9b0crvm4ZN5xoy/94EjXm0IXHDHfQIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SxBnNPxbpCwKMhTaNVpYTGDhjRxTFWPoxLP6NFD7EslrNFhlWjNble4YFMnJpIwVmQp6Wej6x8Mn1rutUEJn8Yhbu2R9qkeDsU/dNrZDTP5N8labN7ZP4pQ3j0L4DPLTIbWPP6dRAGC1dW2zugq9YDisSg9WeKnh9eujaaud4PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 212CB82680;
	Thu, 13 Aug 2026 00:40:47 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C3FED77B39;
	Thu, 13 Aug 2026 00:40:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Y/ULJI4SfWo8UwAAD6G6ig
	(envelope-from <krisman@suse.de>); Thu, 13 Aug 2026 00:40:46 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	Gabriel Krisman Bertazi <krisman@suse.de>
Subject: [PATCH 3/3] io_uring/net: Drop ddir argument from io_msg_copy_hdr
Date: Wed, 12 Aug 2026 20:40:22 -0400
Message-ID: <20260813004022.3514537-4-krisman@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813004022.3514537-1-krisman@suse.de>
References: <20260813004022.3514537-1-krisman@suse.de>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 212CB82680
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

ddir was only ever forwarded to io_compat_msg_copy_hdr, which
never looked at it.  Drop it.

Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
---
 io_uring/net.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/io_uring/net.c b/io_uring/net.c
index f476399e1d63..3f04aa1054c6 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -255,7 +255,7 @@ static int io_copy_msghdr_from_user(struct user_msghdr *msg,
 }
 
 static int io_msg_copy_hdr(struct io_kiocb *req, struct io_async_msghdr *iomsg,
-			   struct user_msghdr *msg, int ddir,
+			   struct user_msghdr *msg,
 			   struct sockaddr __user **save_addr)
 {
 	struct io_sr_msg *sr = io_kiocb_to_cmd(req, struct io_sr_msg);
@@ -371,7 +371,7 @@ static int io_sendmsg_setup(struct io_kiocb *req, const struct io_uring_sqe *sqe
 
 	sr->flags |= IORING_SEND_VECTORIZED;
 	sr->umsg = u64_to_user_ptr(READ_ONCE(sqe->addr));
-	ret = io_msg_copy_hdr(req, kmsg, &msg, ITER_SOURCE, NULL);
+	ret = io_msg_copy_hdr(req, kmsg, &msg, NULL);
 	if (unlikely(ret))
 		return ret;
 	/* save msg_control as sys_sendmsg() overwrites it */
@@ -730,7 +730,7 @@ static int io_recvmsg_copy_hdr(struct io_kiocb *req,
 	struct user_msghdr msg;
 	int ret;
 
-	ret = io_msg_copy_hdr(req, iomsg, &msg, ITER_DEST, &iomsg->uaddr);
+	ret = io_msg_copy_hdr(req, iomsg, &msg, &iomsg->uaddr);
 	if (unlikely(ret))
 		return ret;
 
-- 
2.55.0

