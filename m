Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A292EACEF
	for <io-uring@vger.kernel.org>; Thu, 13 Aug 2026 00:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786581652; cv=none; b=EGMB89pNJvfnt2hVDUsBaun0CRbz8+6oO22yxSaXqO01r1WjJQYK9odRPPblf33vFveH7RHSQgWyHrZ7/GqbKlNKR6d2ouL1zRFQvToCuXUae8tGJzoLJsSiiHbOLiZ03cs2YyInB2DuRBZgf+taLG9n9FlhtTwX8Pgux6GblFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786581652; c=relaxed/simple;
	bh=7scyib0t1HAuqgDF1JoaofIBvWirrY3/qIX72gWFijY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rbfMR8yRgagM3AbiKnERPzhanJEJ0f8yMs1GZ1quQbLee/FClj2IkYg1rwP72HpvWzAxMjjUZhH5iU4AWLfHUOiia6mKiDFvZmid/dRiD4MRyet8VGfk4dCSeGh+M5Oqio33Z6NTIEXyFLVTljoOAMCA2WnODEDbhPksy81H4Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YDrxmRz3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/RwMiXPz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iTsH58+e; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=z1opHDWe; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YDrxmRz3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/RwMiXPz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iTsH58+e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z1opHDWe"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DDCA63E64;
	Thu, 13 Aug 2026 00:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786581645; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FMkO/jFLhGdGw8P/kpzrE6cT60xng4W4PJqr9CfgFkk=;
	b=YDrxmRz3zZPIGMhlJs9sBG00zPLN6tflVI5TKhZxghiojiWV6RmgwFlBSJZcEEHhperq+g
	V3ovmE4RaRDaFftNOubuEO5DNaklV3DaatHBXLJOHIOK2P8YWVTkgJUsCC1ZD8RSRqMwAz
	Esv6HzE4+2cUpwm0+/GyuQ+d943ONz4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786581645;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FMkO/jFLhGdGw8P/kpzrE6cT60xng4W4PJqr9CfgFkk=;
	b=/RwMiXPzS/HnAVmSLF9e+7xbYnLwx4nYrLMgTiBd5NeIw2d90yNlao0jZLSKJLHFspzTRv
	70lwpMSgKE4LXQAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786581640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FMkO/jFLhGdGw8P/kpzrE6cT60xng4W4PJqr9CfgFkk=;
	b=iTsH58+eYMyG+w1q9YzfFacMXY9T7hyLfA7nuENVxaqj7htxx7OOQSFASOqakJ++gCdB19
	AW3hGB/S6bXYhaKfnIW5vMEEVN+KwXJuC3mGtBLdyQ1u6pdUxNYFKKHo3bZl8FbbSm6P/3
	j7xSkuaOvl0IIU/flf1OQ1qo2Rzfv5c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786581640;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FMkO/jFLhGdGw8P/kpzrE6cT60xng4W4PJqr9CfgFkk=;
	b=z1opHDWePh0v8ErIEdCjWcKeTEQ1Q1CSf2rIJpuKQAfMGBVCU0XKN+/Wr2I3xF5y+8qF5K
	YVtUirth9BzQovDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 88E6B77B3D;
	Thu, 13 Aug 2026 00:40:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id s8viFIgSfWq4UgAAD6G6ig
	(envelope-from <krisman@suse.de>); Thu, 13 Aug 2026 00:40:40 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	Gabriel Krisman Bertazi <krisman@suse.de>
Subject: [PATCH 2/3] io_uring/net: Drop custom iov copy in io_msg_copy_hdr
Date: Wed, 12 Aug 2026 20:40:21 -0400
Message-ID: <20260813004022.3514537-3-krisman@suse.de>
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
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]

Similar to commit f4eaf8eda89e ("io_uring/rsrc: Drop io_copy_iov in
favor of iovec API"), avoid the custom copy of a single iovec and just
rely on the iovec api.  This lets the compat and native paths share the
buffer-select length lookup

Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
---
 io_uring/net.c | 69 ++++++++++++++------------------------------------
 1 file changed, 19 insertions(+), 50 deletions(-)

diff --git a/io_uring/net.c b/io_uring/net.c
index a74d15f7b7d2..f476399e1d63 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -236,39 +236,6 @@ static int io_net_import_vec(struct io_kiocb *req, struct io_async_msghdr *iomsg
 	return 0;
 }
 
-static int io_compat_msg_copy_hdr(struct io_kiocb *req,
-				  struct io_async_msghdr *iomsg,
-				  struct compat_msghdr *msg, int ddir,
-				  struct sockaddr __user **save_addr)
-{
-	struct io_sr_msg *sr = io_kiocb_to_cmd(req, struct io_sr_msg);
-	struct compat_iovec __user *uiov;
-	int ret;
-
-	if (copy_from_user(msg, sr->umsg_compat, sizeof(*msg)))
-		return -EFAULT;
-
-	ret = __get_compat_msghdr(&iomsg->msg, msg, save_addr);
-	if (ret)
-		return ret;
-
-	uiov = compat_ptr(msg->msg_iov);
-	if (req->flags & REQ_F_BUFFER_SELECT) {
-		if (msg->msg_iovlen == 0) {
-			sr->len = 0;
-		} else if (msg->msg_iovlen > 1) {
-			return -EINVAL;
-		} else {
-			struct compat_iovec tmp_iov;
-
-			if (copy_from_user(&tmp_iov, uiov, sizeof(tmp_iov)))
-				return -EFAULT;
-			sr->len = tmp_iov.iov_len;
-		}
-	}
-	return 0;
-}
-
 static int io_copy_msghdr_from_user(struct user_msghdr *msg,
 				    struct user_msghdr __user *umsg)
 {
@@ -292,7 +259,6 @@ static int io_msg_copy_hdr(struct io_kiocb *req, struct io_async_msghdr *iomsg,
 			   struct sockaddr __user **save_addr)
 {
 	struct io_sr_msg *sr = io_kiocb_to_cmd(req, struct io_sr_msg);
-	struct user_msghdr __user *umsg = sr->umsg;
 	int ret;
 
 	iomsg->msg.msg_name = &iomsg->addr;
@@ -301,7 +267,10 @@ static int io_msg_copy_hdr(struct io_kiocb *req, struct io_async_msghdr *iomsg,
 	if (io_is_compat(req->ctx)) {
 		struct compat_msghdr cmsg;
 
-		ret = io_compat_msg_copy_hdr(req, iomsg, &cmsg, ddir, save_addr);
+		if (copy_from_user(&cmsg, sr->umsg_compat, sizeof(cmsg)))
+			return -EFAULT;
+
+		ret = __get_compat_msghdr(&iomsg->msg, &cmsg, save_addr);
 		if (ret)
 			return ret;
 
@@ -310,18 +279,17 @@ static int io_msg_copy_hdr(struct io_kiocb *req, struct io_async_msghdr *iomsg,
 		msg->msg_controllen = cmsg.msg_controllen;
 		msg->msg_iov = compat_ptr(cmsg.msg_iov);
 		msg->msg_iovlen = cmsg.msg_iovlen;
-		return 0;
-	}
-
-	ret = io_copy_msghdr_from_user(msg, umsg);
-	if (unlikely(ret))
-		return ret;
+	} else {
+		ret = io_copy_msghdr_from_user(msg, sr->umsg);
+		if (unlikely(ret))
+			return ret;
 
-	msg->msg_flags = 0;
+		msg->msg_flags = 0;
 
-	ret = __copy_msghdr(&iomsg->msg, msg, save_addr);
-	if (ret)
-		return ret;
+		ret = __copy_msghdr(&iomsg->msg, msg, save_addr);
+		if (ret)
+			return ret;
+	}
 
 	if (req->flags & REQ_F_BUFFER_SELECT) {
 		if (msg->msg_iovlen == 0) {
@@ -329,12 +297,13 @@ static int io_msg_copy_hdr(struct io_kiocb *req, struct io_async_msghdr *iomsg,
 		} else if (msg->msg_iovlen > 1) {
 			return -EINVAL;
 		} else {
-			struct iovec __user *uiov = msg->msg_iov;
-			struct iovec tmp_iov;
+			struct iovec fast_iov, *iov;
 
-			if (copy_from_user(&tmp_iov, uiov, sizeof(tmp_iov)))
-				return -EFAULT;
-			sr->len = tmp_iov.iov_len;
+			iov = iovec_from_user(msg->msg_iov, 1, 1, &fast_iov,
+					      io_is_compat(req->ctx));
+			if (IS_ERR(iov))
+				return PTR_ERR(iov);
+			sr->len = iov->iov_len;
 		}
 	}
 	return 0;
-- 
2.55.0

