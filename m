Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F810175A79
	for <io-uring@vger.kernel.org>; Tue,  2 Jun 2026 20:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780430629; cv=none; b=Llj5RBhmxAn07iY4r3RVidXlwfPwzS77jcn+/VbG8q/G5uhQyc9xQsnFKMGoHPwefORpQDIgxxMXbBxWX2WHOddr+rWrPleXkpCGVTMrZxVLso6KlkozAsEP7KqX5nwlNMu322J4PQ/gg3g/2IPExe6TzlYNdhrWkd6WfgGUgtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780430629; c=relaxed/simple;
	bh=R5gwii5RVk/H0GV+l35NWEYBQt/js2E4ZdJkNFZ7PWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cedgmPsDh8t6gUMyhvyBu0Yqcvi9iFHoBgLFiixPV4eF3hl95S1odYpmc9YR69fKJZhATI/Vu+lXPmJPe32+dNAANPPgSc74x9Cm3ZrA+Z+BV3+DKgS+jOxfzfHji18QU5H6j++Vcbn3ky4P9dcCld7nRKj2yXpE/Dgjqb39ASc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 962856AD0F;
	Tue,  2 Jun 2026 20:03:39 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5AA3B779A7;
	Tue,  2 Jun 2026 20:03:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6PuXDxs3H2qsMgAAD6G6ig
	(envelope-from <krisman@suse.de>); Tue, 02 Jun 2026 20:03:39 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	Gabriel Krisman Bertazi <krisman@suse.de>
Subject: [PATCH 3/3] io_uring: Drop wrong comment in OP_NOP
Date: Tue,  2 Jun 2026 16:03:15 -0400
Message-ID: <20260602200315.1761983-4-krisman@suse.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602200315.1761983-1-krisman@suse.de>
References: <20260602200315.1761983-1-krisman@suse.de>
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
X-Rspamd-Queue-Id: 962856AD0F
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]

This was copy-pasted from io_rw, where the comment actually makes sense.
Here, we don't have struct kiocb.  Drop the comment.

Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
---
 io_uring/nop.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/io_uring/nop.c b/io_uring/nop.c
index 3caf07878f8a..e3333b5ed4e0 100644
--- a/io_uring/nop.c
+++ b/io_uring/nop.c
@@ -12,7 +12,6 @@
 #include "nop.h"
 
 struct io_nop {
-	/* NOTE: kiocb has the file as the first member, so don't do it here */
 	struct file     *file;
 	int             result;
 	int		fd;
-- 
2.54.0

