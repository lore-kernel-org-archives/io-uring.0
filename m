Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B3F472543
	for <io-uring@vger.kernel.org>; Mon, 31 Aug 2026 15:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788191091; cv=none; b=kHp0vr5Zy/UqBkmlRMdctXepyFNZ4uHF64oKTh4vMv458ux/4dLFgg8d2yBJY/lKPM0PvmeIUCH2mwAEwltKEOlS96rHrisC+ZwRcN733LT8adwNfFdZOby4Q0bOTnY99stQbAbMK7lWj9nRw7/eHwSSVRdbKW4T11f7PRawBiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788191091; c=relaxed/simple;
	bh=mN2iX8Z5zX5qtBCnaXzCxjsKWUiQDrZ48Y99zlVkxio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TqVZ8XEtHo4Py5laJ8ZPMYL8bT4PlGI362rPG5lxCzxvOlHIrJ9yEbtiZeexBFo6XAVkfHGm3Q2v8s/+KEaiMXdjkHnrMkwWl7J4PO2ZDlfivsOcvZxdWM7jlf86dSt97uZOtrbnfT3kDGz9BjBIEtJ9DZNPLv8EWTcuf/j/EI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2QoyW8s3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OGYc9YLf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cX9Czu4r; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yfJc8ozC; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2QoyW8s3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OGYc9YLf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cX9Czu4r";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yfJc8ozC"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6C22F226D3;
	Mon, 31 Aug 2026 15:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788191083; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MruqvTvGmsky1Hcwgom4mOLdCN1z/IAud4ovvSmFkMM=;
	b=2QoyW8s3gi2p6YFKazfc72pkjugq3bv46ex1qz8Wqw9dCwE356bXzhkYiLyn+Y4Spb2M3p
	v7wgyF4dKSnldQorqtc9jqZec0GjMZfuCfYYC3AQCt1cNfqdO4w4r9OLNcA7bPcKBGKIkK
	nm89b3yeIERvO3yWQ+2hGktJd+ov7JQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788191083;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MruqvTvGmsky1Hcwgom4mOLdCN1z/IAud4ovvSmFkMM=;
	b=OGYc9YLfRS9hi5waZB2S0xChLdNmP4NqSeKITviHy+0HmXTWktKZ5+WcZgxENjG7svMent
	LyF8SreWpYU+JqAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788191079; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MruqvTvGmsky1Hcwgom4mOLdCN1z/IAud4ovvSmFkMM=;
	b=cX9Czu4rVHCXo0ZHZKo/7ejJNE0WzhcedBLtjBteXDMpETxoEV0+0VZwQ+NHgl3/FAqAGP
	s99INl96SIHg1pnHAPNlnn//TOaxIS4GneINCKVnEM8sBvj51Ynb21Vhj03GxcHg6DdwYl
	jeKatqKg3j3+zuwuiLFI7XhAzP6QjXM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788191079;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MruqvTvGmsky1Hcwgom4mOLdCN1z/IAud4ovvSmFkMM=;
	b=yfJc8ozC+6bYja93L7AtYvhm4zTWaGFFhnmZpQASgqRT1yWG4OsBYmpIGsK923cyJrTU/2
	FYUhEIHUKpkQL5AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D37D3136B2;
	Mon, 31 Aug 2026 15:44:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FdICHGahlWpjSAAAD6G6ig
	(envelope-from <krisman@suse.de>); Mon, 31 Aug 2026 15:44:38 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	Gabriel Krisman Bertazi <krisman@suse.de>
Subject: [RESEND PATCH liburing 1/2] man: Fix FUTEX_WAIT/FUTEX_WAKE explanation
Date: Mon, 31 Aug 2026 12:44:25 -0300
Message-ID: <20260831154426.115944-2-krisman@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831154426.115944-1-krisman@suse.de>
References: <20260831154426.115944-1-krisman@suse.de>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Score: -6.80
X-Spam-Flag: NO
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.994];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]

The description of the futex_wait parameters is incorrect when
explaining the futex value.  Correct it and rewrite the rest of the
futex operations description to make them clearer.

Closes: https://github.com/axboe/liburing/issues/1625
Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
---
 man/io_uring_enter.2 | 39 ++++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/man/io_uring_enter.2 b/man/io_uring_enter.2
index 7b99335e..b2e93f43 100644
--- a/man/io_uring_enter.2
+++ b/man/io_uring_enter.2
@@ -1538,20 +1538,19 @@ system call.
 .I addr
 must hold a pointer to the futex,
 .I addr2
-must hold the value to which the futex has to be changed so this caller to
-.BR futex_wait (2)
-can be woken by a call to
-.BR futex_wake (2),
+must hold the value of the futex word read by the application when
+submitting the operation.  The kernel will only put the task to sleep
+and wait on the futex if, at the time of queueing, the futex word still
+matches this value.
 .I addr3
-must hold the bitmask of this
+must hold a bitmask of this
 .BR futex_wait (2)
-caller.
-For a caller of
-.BR futex_wake (2)
-to wake a waiter additionally the bitmask of the waiter and waker must have
-at least one set bit in common.
+caller, which will be used as a key by the kernel when
+deciding which callers to wake up.
 .I fd
-must contain additional flags passed in.
+may contain additional flags following the
+.B futex2
+interface flags.
 
 Available since 6.7.
 
@@ -1561,17 +1560,19 @@ Issues the equivalent of the
 .BR futex_wake (2)
 system call.
 .I addr
-must hold a pointer to the futex,
+must hold a pointer to the futex to be awaken,
 .I addr2
-must hold the maximum number of waiters waiting on this futex to wake,
+must hold the maximum number of waiters to be awaken by this call,
 .I addr3
-must hold the bitmask of this
-.BR futex_wake (2)
-call.
-To wake a waiter additionally the bitmask of the waiter and waker must have
-at least one set bit in common.
+must hold a bitmask identifying which callers to wake.
+A waker will be waken if at least one bit of the bitmask matches,
+subject to the limit of waiters set by
+.IR addr2 .
 .I fd
-must contain additional flags passed in.
+may contain additional flags following
+the
+.B futex2
+interface flags.
 
 Available since 6.7.
 
-- 
2.55.0

