Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CEB299943
	for <io-uring@vger.kernel.org>; Thu, 13 Aug 2026 00:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786581646; cv=none; b=QH2zJ93QaMPRqqu3130yeipXsXsUXV3ViTKXyRSTL4cnA59gGwLfM0Q4j4IPZaEhgUQa7LcVhss3I6Mo55PNvAPzcW0qzuS/dRWaF/32ss9wxCJiZDp+raVuYGZQuZN7ViZ0A5mFIZ8O7qhYw6VQwle+LeXkwRcKU9O5HqPNIis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786581646; c=relaxed/simple;
	bh=CxLCc4lIzodSxXEzGAF3FD17WhmYrKcgpkfvShgfNaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FcNZ1KirNVRsiAZkebWHO15wjL0ZccSG7ZC/bNSW+WAZUV6O1MKKF2gdLwp58suO7Yk1rVpUCLcmlIf0ptlP6p54J/0rQ0zgnkkWfx7hGU0zyNor1hzSW0ONmtMdnyDFp40eFjaZcHa4XRXJ5E6sgP4W7Mjm4w32etGAaWe5hA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qpcaXI11; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=csz47Z48; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qpcaXI11";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="csz47Z48"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8515782687;
	Thu, 13 Aug 2026 00:40:38 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786581638; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6KyzpBpe8a4teg8w31ciQ4GyId1HMvAVvA5OuxVqdn4=;
	b=qpcaXI11lnE5DHxQZutQQpYEYaJuElF0M09sZdg3AdW06OrFymcQrLU38MCPe7A/CqGQnk
	ODNlXAwplyNsPnOg7m3O25lfAB8ZWz3Du5XmyCpAvvV492o2lsuApxb//ehtxOOQsmv/Kc
	YesoRWYPkrW1ShiFPX0m4focfFhFglw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786581638;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6KyzpBpe8a4teg8w31ciQ4GyId1HMvAVvA5OuxVqdn4=;
	b=csz47Z48qoFB4NnMu2MR/RxYLJNFWzRrB/3Ok0qWrFN1KDcXH9XxvNJFX77aAIwtYiWjhP
	tR2Asp8q9yyCpACw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 30C3377B3C;
	Thu, 13 Aug 2026 00:40:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LRh7BYYSfWqzUgAAD6G6ig
	(envelope-from <krisman@suse.de>); Thu, 13 Aug 2026 00:40:38 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	Gabriel Krisman Bertazi <krisman@suse.de>
Subject: [PATCH 1/3] io_uring/rw: Drop custom iov copy in io_iov_buffer_select_prep
Date: Wed, 12 Aug 2026 20:40:20 -0400
Message-ID: <20260813004022.3514537-2-krisman@suse.de>
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
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 8515782687
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

Similar to commit f4eaf8eda89e ("io_uring/rsrc: Drop io_copy_iov in
favor of iovec API"), avoid custom copy and just rely on the iovec api.

Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
---
 io_uring/rw.c | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/io_uring/rw.c b/io_uring/rw.c
index 95038cfda615..95106dd1d7eb 100644
--- a/io_uring/rw.c
+++ b/io_uring/rw.c
@@ -9,7 +9,6 @@
 #include <linux/fsnotify.h>
 #include <linux/poll.h>
 #include <linux/nospec.h>
-#include <linux/compat.h>
 #include <linux/io_uring/cmd.h>
 #include <linux/indirect_call_wrapper.h>
 
@@ -50,33 +49,20 @@ static bool io_file_supports_nowait(struct io_kiocb *req, __poll_t mask)
 	return false;
 }
 
-static int io_iov_compat_buffer_select_prep(struct io_rw *rw)
-{
-	struct compat_iovec __user *uiov = u64_to_user_ptr(rw->addr);
-	struct compat_iovec iov;
-
-	if (copy_from_user(&iov, uiov, sizeof(iov)))
-		return -EFAULT;
-	rw->len = iov.iov_len;
-	return 0;
-}
-
 static int io_iov_buffer_select_prep(struct io_kiocb *req)
 {
 	struct iovec __user *uiov;
-	struct iovec iov;
+	struct iovec fast_iov, *iov;
 	struct io_rw *rw = io_kiocb_to_cmd(req, struct io_rw);
 
 	if (rw->len != 1)
 		return -EINVAL;
 
-	if (io_is_compat(req->ctx))
-		return io_iov_compat_buffer_select_prep(rw);
-
 	uiov = u64_to_user_ptr(rw->addr);
-	if (copy_from_user(&iov, uiov, sizeof(*uiov)))
-		return -EFAULT;
-	rw->len = iov.iov_len;
+	iov = iovec_from_user(uiov, 1, 1, &fast_iov, io_is_compat(req->ctx));
+	if (IS_ERR(iov))
+		return PTR_ERR(iov);
+	rw->len = iov->iov_len;
 	return 0;
 }
 
-- 
2.55.0

