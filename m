Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C397314B6A
	for <io-uring@vger.kernel.org>; Tue,  2 Jun 2026 21:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780437234; cv=none; b=N78PlnX1exTs+cFLhkeJhLrLi6TBJ8kwcKOWpqN4yL81JLCsK5TugDeVNrZe21DGW8txulTkPYMBSDJfZ7iVEwiT8s7SwaU+6EYDv+cqp0cT10JliV9G3dRkFv+0YLqiDcJe25kLPhkIoYo75oJm9G6Jd3lww05pHe9bICdyORM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780437234; c=relaxed/simple;
	bh=Y+X6fOM95nwV7ctxACsRwy0M7AXnpZBqtwb2pwwt/FE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ScATGDb/GT7N2qlRtwG6s13vUUiY+mad8w4FvnF2WCcopPyW4Ew2ZcWZIR7v5x02KToTZFd0QGg9SfZtsflCt5hERDrXAJFFdeyO7+wd+VGe/xjnPBlkrxIJJr3pzka2EBIDA9UwYyXfIlQTzsgryDy3qW6ueCduJBBmjs2dQHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4319A67442;
	Tue,  2 Jun 2026 21:53:47 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E6542779A7;
	Tue,  2 Jun 2026 21:53:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CoQCLOpQH2oRGAAAD6G6ig
	(envelope-from <krisman@suse.de>); Tue, 02 Jun 2026 21:53:46 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	Gabriel Krisman Bertazi <krisman@suse.de>
Subject: [PATCH v2 2/3] io_uring/net: Remove async_size for OP_LISTEN
Date: Tue,  2 Jun 2026 17:53:25 -0400
Message-ID: <20260602215327.1885109-3-krisman@suse.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602215327.1885109-1-krisman@suse.de>
References: <20260602215327.1885109-1-krisman@suse.de>
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
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 4319A67442
X-Rspamd-Action: no action

OP_LISTEN does not use async_data.  Remove it.

Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
---
 io_uring/opdef.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/io_uring/opdef.c b/io_uring/opdef.c
index 517bad015505..88a45c7d897f 100644
--- a/io_uring/opdef.c
+++ b/io_uring/opdef.c
@@ -515,7 +515,6 @@ const struct io_issue_def io_issue_defs[] = {
 		.needs_file		= 1,
 		.prep			= io_listen_prep,
 		.issue			= io_listen,
-		.async_size		= sizeof(struct io_async_msghdr),
 #else
 		.prep			= io_eopnotsupp_prep,
 #endif
-- 
2.54.0

