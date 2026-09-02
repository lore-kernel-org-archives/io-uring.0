Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B729B4A43F5
	for <io-uring@vger.kernel.org>; Wed,  2 Sep 2026 17:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788370058; cv=none; b=K7oz/E2O8lsfDlPJav6g8/4zL373JJwDHXTZHd/ZMZn1guyO9ZsT/3iDeTLHwWko5cgLsyf6zJNJAoSh8h+4SUN5Ns6JmkZ6B4+1fcTFQGLNTxJ8tEaicEOniEDk5wq4oWY5Ej7Bc8vWKLAaLIC0fM75y45Qyf9YuxTfpCbSU7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788370058; c=relaxed/simple;
	bh=WDLN4u4rc9hN1U9JhVD33QIv2VQBEof1gyUxvKpWWrw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g2Dh+i8ULf9kQRSq8A/OJxxMgXdXygHkP/CYe6B7AsVVZKJ6InRjpNbOsCuoJIFSwcuNSwCGhXPk9SWceVZ55eK81i1XATwlzGz+pT5jErdQO0N3h/5qbMboyZu4In2ZDehMLFHidADPgOU5hpfuDciHKAOOPluYmNklwpuN3pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=16a/5f/S; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=g7CsWjos; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=K+JAboXh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4QrfSXbf; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="16a/5f/S";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="g7CsWjos";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="K+JAboXh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4QrfSXbf"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 438F01F7A0;
	Wed,  2 Sep 2026 17:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788370046; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=mTfowp0e/X5ArfHDUv+SbEArFfK3Lbu2un5CD6ORDa4=;
	b=16a/5f/Smgyi7iyFswkHXo7q4lBMX56L5zBgd9Fq0olU+OIMbpXVvani6Hu218TP6dYbLt
	pL0gu43h3k0LihJb5AyYqhf90bg+H8DOH/dGeVlT45y8QLJW7M8z96e1aZ+zP270SDzIPe
	d87yA8QbzUKsoh91WPpW+WSrFj5n1ak=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788370046;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=mTfowp0e/X5ArfHDUv+SbEArFfK3Lbu2un5CD6ORDa4=;
	b=g7CsWjoszKFlMcNuBfSwpOS29VytRpJvpk4HVMYEzmJnp0QXkvqAIgYZsQTpOUwxBQcsa+
	1Ms3ADTC5hNpiwAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=K+JAboXh;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4QrfSXbf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788370042; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=mTfowp0e/X5ArfHDUv+SbEArFfK3Lbu2un5CD6ORDa4=;
	b=K+JAboXhnM4RL82fSlPoJ2AFDdD7AKwL2gQGV9wKw8D97Vi2nqY3lf1YzjBPqUUN3/jOX3
	+6+yBz2BJRlwHkngkX/X1I68isEiYcP/SqmiD7dXXBO6XbMrrJCPwWag6XZ3m2WTuTzXg5
	BB66rfVNDlKvLzzUVYabeGdy/Sg0e9o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788370042;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=mTfowp0e/X5ArfHDUv+SbEArFfK3Lbu2un5CD6ORDa4=;
	b=4QrfSXbfo3ZAljQ+4roxWqd5ayLwbfw+EtzDQYxMxcBtkUcc9hbQhFB2FmslOqGFJaafkA
	qUp58rORjlwZBeAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7997E13515;
	Wed,  2 Sep 2026 17:27:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tIKLOnhcmGouSgAAD6G6ig
	(envelope-from <krisman@suse.de>); Wed, 02 Sep 2026 17:27:20 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	Gabriel Krisman Bertazi <krisman@suse.de>
Subject: [PATCH] io_uring/futex: Recycle ifd on failure
Date: Wed,  2 Sep 2026 14:27:17 -0300
Message-ID: <20260902172717.1073059-1-krisman@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: 438F01F7A0
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email,suse.de:mid];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

The failure path doesn't recycle the ifd on FUTEX_WAIT for no good
reason.  If we move the free above done_unlock, we are even already
holding the submit lock.  Recycle it.

Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
---
 io_uring/futex.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/io_uring/futex.c b/io_uring/futex.c
index eaee14242a3a..6389bd2f0399 100644
--- a/io_uring/futex.c
+++ b/io_uring/futex.c
@@ -321,20 +321,22 @@ int io_futex_wait(struct io_kiocb *req, unsigned int issue_flags)
 
 	ret = futex_wait_setup(iof->uaddr, iof->futex_val, iof->futex_flags,
 			       &ifd->q, NULL, NULL);
-	if (!ret) {
-		hlist_add_head(&req->hash_node, &ctx->futex_list);
-		io_ring_submit_unlock(ctx, issue_flags);
+	if (ret)
+		goto free_async;
 
-		return IOU_ISSUE_SKIP_COMPLETE;
-	}
+	hlist_add_head(&req->hash_node, &ctx->futex_list);
+	io_ring_submit_unlock(ctx, issue_flags);
 
+	return IOU_ISSUE_SKIP_COMPLETE;
+
+free_async:
+	io_cache_free(&ctx->futex_cache, ifd);
+	io_req_async_data_clear(req, 0);
 done_unlock:
 	io_ring_submit_unlock(ctx, issue_flags);
 done:
-	if (ret < 0)
-		req_set_fail(req);
+	req_set_fail(req);
 	io_req_set_res(req, ret, 0);
-	io_req_async_data_free(req);
 	return IOU_COMPLETE;
 }
 
-- 
2.55.0

