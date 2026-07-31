Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B4F47988C
	for <io-uring@vger.kernel.org>; Fri, 31 Jul 2026 16:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514856; cv=none; b=tK8OhabpXb6HoxUMMfDqLEvrAGEAiO99hhrVMYUWH2OygX383l6e0wFvC92u2Dc1V6ABkJTAnLEKWr/YJiqUcFFWKFuFLRtbo+POCiJn3h15GuuocLMADYNFjJtTg/MMsyfHmEcLANAsK4MKkW7e3kNKP5F/O5aiAReHeso/hzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514856; c=relaxed/simple;
	bh=mN2iX8Z5zX5qtBCnaXzCxjsKWUiQDrZ48Y99zlVkxio=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QYpSloCor7zsAUgfT+lOBbkpG3swePLx+xPShmiz+RiKw31danMGh43xgUnKYFVEBew7+tCnhHV+PQI07h+yo5WkX2ol4aKhCZlbg3tEDrZk3eUmw+pDae6IpRMgFRpDLuyRTwStv4BWWD95bmZPRUBq1aKZ/iQXfP2m/3oDCTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pSj/VEdO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aSJb6N4G; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Xi9hN4Kp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=b6JpNAWz; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pSj/VEdO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aSJb6N4G";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Xi9hN4Kp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="b6JpNAWz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AA2BC4149;
	Fri, 31 Jul 2026 16:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785514846; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=MruqvTvGmsky1Hcwgom4mOLdCN1z/IAud4ovvSmFkMM=;
	b=pSj/VEdOSpchcfuwnWVuH8olMuCI0wdLTiSFGeJDeZyFcuYX8VYx9VXKYd34FG1UE9Ts7m
	AsFl4xp6YzGCZJLjmLNJmudd8dPxhSh7k/bKQdIRV3Cu67649Zfy4VnyIx8oF0BKr+xDfj
	WiDaPWKCtLfxha2mpOaVUcMd2L93lW0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785514846;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=MruqvTvGmsky1Hcwgom4mOLdCN1z/IAud4ovvSmFkMM=;
	b=aSJb6N4GDrXm71IsrLkcvCfjFaWRc8ZJjCkHP/f2grI5L6L5W3gbfQWDgg3p2J1KA1ApOw
	PFj6XJjkrJsJEVCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785514842; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=MruqvTvGmsky1Hcwgom4mOLdCN1z/IAud4ovvSmFkMM=;
	b=Xi9hN4KpLFQC8mvU1I6WjSvtY/vj0WLviZE8HZiDwmnZsmQeFr+z7j5NvKx1idMBQ9m/fp
	Itv4BtEfyu6HXtKbpDNPMW8t+M4Z4Pe/BfqkTR8wpYN4K3iZfV1GWXNsYwrlUDF2hwk3u5
	7mAqhTOnIXplh1puexP57PH/J+A/0jg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785514842;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=MruqvTvGmsky1Hcwgom4mOLdCN1z/IAud4ovvSmFkMM=;
	b=b6JpNAWzBDOuLmccosr9WyJ1t17fnJwjbYhTg7HIUF0iW4ql1gQ0v7gNN8v8Nu9BcQa+t2
	cprt47oD5f5RZOCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5A425779B0;
	Fri, 31 Jul 2026 16:20:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0RUDClrLbGpiawAAD6G6ig
	(envelope-from <krisman@suse.de>); Fri, 31 Jul 2026 16:20:42 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	Gabriel Krisman Bertazi <krisman@suse.de>
Subject: [PATCH liburing] man: Fix FUTEX_WAIT/FUTEX_WAKE explanation
Date: Fri, 31 Jul 2026 12:20:35 -0400
Message-ID: <20260731162035.3882874-1-krisman@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

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

