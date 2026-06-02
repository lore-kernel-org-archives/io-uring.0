Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D399B175A79
	for <io-uring@vger.kernel.org>; Tue,  2 Jun 2026 20:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780430624; cv=none; b=nihE1bdf/yGRpYP+wpgSsW4zF+bnt7hGep7LGJbt/uP4xcw7daFmuu/1RG4zcU+BILfL2nUmd6sB1DYM/J5T4oNAmyQeV+fYWjSyc4psSBDgjq1DX9PVOUlfeO/0g5gCSuUt3xitgcmM3SHBsKB7F6KdU5syaGxt24SYoSk907M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780430624; c=relaxed/simple;
	bh=hzib2oODrLpyy2S2nfIa8ghwFwovuGPiVm8xyHAHCnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cAMbmSPxwcas0pwH//sb0J62FhdhWJnhKRSKGrziroPMmTbIP3YRHHi+0ZzxEqa6OUJbku4J59qaQfrPT+1SCp13m+HvdoOjuzegfOZXrdvChtVIJS19U2df50fe8xzvzq9Dl/MYriB4osxN3staGUXmfJ5kv+GtHgjm2J4pOOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JHnuP2x8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZBjTIke7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JHnuP2x8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZBjTIke7; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JHnuP2x8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZBjTIke7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JHnuP2x8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZBjTIke7"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B75746AA7C;
	Tue,  2 Jun 2026 20:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780430617; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nmhT/91e2dtpX4XcDRUREJ+v6Ypghhrk9gUNmRUcC4c=;
	b=JHnuP2x8Tn/Pi+9nYXB0zsV1G6OUEaA7XeXzctD8bROZ88+ctkbCHRm1xY+MAizS8ix7AM
	gpoyWt6BLAOcQbgeNTmFs50NCkn+/aKGcmygJrDZ8ET3kOXS8uVPJw7mxyigvT36EizU2b
	n2vXl160DNS8IR/SOODTMGejVOb8r30=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780430617;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nmhT/91e2dtpX4XcDRUREJ+v6Ypghhrk9gUNmRUcC4c=;
	b=ZBjTIke7UPm4hk/wr4KHSI5HlkEi5ySOxeo59chmbuDwvAevcah6RANBNf0Pr2d1m3jPXq
	x7tns/dj4EgN/2Cw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780430617; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nmhT/91e2dtpX4XcDRUREJ+v6Ypghhrk9gUNmRUcC4c=;
	b=JHnuP2x8Tn/Pi+9nYXB0zsV1G6OUEaA7XeXzctD8bROZ88+ctkbCHRm1xY+MAizS8ix7AM
	gpoyWt6BLAOcQbgeNTmFs50NCkn+/aKGcmygJrDZ8ET3kOXS8uVPJw7mxyigvT36EizU2b
	n2vXl160DNS8IR/SOODTMGejVOb8r30=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780430617;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nmhT/91e2dtpX4XcDRUREJ+v6Ypghhrk9gUNmRUcC4c=;
	b=ZBjTIke7UPm4hk/wr4KHSI5HlkEi5ySOxeo59chmbuDwvAevcah6RANBNf0Pr2d1m3jPXq
	x7tns/dj4EgN/2Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7C38B779A7;
	Tue,  2 Jun 2026 20:03:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +crAFxk3H2qjMgAAD6G6ig
	(envelope-from <krisman@suse.de>); Tue, 02 Jun 2026 20:03:37 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	Gabriel Krisman Bertazi <krisman@suse.de>
Subject: [PATCH 2/3] io_uring: Remove async_size for OP_LISTEN
Date: Tue,  2 Jun 2026 16:03:14 -0400
Message-ID: <20260602200315.1761983-3-krisman@suse.de>
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
X-Spam-Flag: NO
X-Spam-Score: -6.79
X-Spamd-Result: default: False [-6.79 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.19)[-0.972];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 

OP_LISTEN does not use async_data.  Remove it.

Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
---
 io_uring/opdef.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/io_uring/opdef.c b/io_uring/opdef.c
index ffa28224cc8f..a6215ee95a3f 100644
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

