Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5496538F633
	for <io-uring@vger.kernel.org>; Wed,  5 Aug 2026 18:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785955978; cv=none; b=mcYYbGl32MxBqel5Bcxi77lE/ooXUqEcB6gq/TVv4Tzqv50gIDtxg0w0CzM/8IQaJ86zdHUXSmCT9QDc3lhPDHYsPm0L9aZGv7ZTwJHxnDQDm+gWr8rBd2SOS/qU5PzKuPZzsou6dSx/b3+rVg4h5CeNSBUa+jDMOsSC9BhGUwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785955978; c=relaxed/simple;
	bh=rbsn9P+gKA+o3Tr+4GZbwEkAXE8EOvtMyy4vULhfehM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qS5/AL1UD7SocdxjaY4PWXyaGBOv5O4y9RNbFgcfaKbKDrS9ERHIicVtEenOf25Sa60Xk+Jiw9u/yiXjVUFVc6A0QvRw4CgJi5l4hQQuvXw/aQKNpx9N6odr91VPaMva9f4qr7wa8TLYL2bpIM0pazbOla3EGnPH6hnSRoNDmw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TOjkINrl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0nNnfzht; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DrWZyvaZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lQNUxJCG; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TOjkINrl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0nNnfzht";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DrWZyvaZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lQNUxJCG"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 806F13DF5;
	Wed,  5 Aug 2026 18:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785955969; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=iyqb/xkjQRl1szGhu91z2+cUbF0QrEb83h4LOLyLHD0=;
	b=TOjkINrlBPJ0cdInjfciG2bWiSbQT4ING2FvzSFhxBnSIohaUci7JHzlXTsuP1IoWOp3JG
	AgDRfgbTmbmkEzVKu5LRf8QYU/WqHdpXByERa7edzR7Fpxj0ImqRlR5ISJ3JNrwTa47EdI
	Kaas/is5axhDTKK0Y6974TE5B+fRpaM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785955969;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=iyqb/xkjQRl1szGhu91z2+cUbF0QrEb83h4LOLyLHD0=;
	b=0nNnfzhtaDnLchIdtDs8fj4OxZJTdKtf8CRGo8JBmcW8tBc1gKWhPqeK90bS4QSDmf7Kci
	qeF1hbI0LeN1a/Dw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785955965; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=iyqb/xkjQRl1szGhu91z2+cUbF0QrEb83h4LOLyLHD0=;
	b=DrWZyvaZkmHT1haT2FWZq25JquG/gYGcmmCSQhY3oUdRhMunlVZc3Qejx+VBG52WPhhUBh
	z5dpQ1WaLWJ9iP0LFKY22B6eNi025dQp0hW/+bTrTXzfSKi8O3uDCK1BZEJldiNnhKtwMT
	y3ROJCLfjTbTYb9VKqbQe5YGALG9Kvw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785955965;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=iyqb/xkjQRl1szGhu91z2+cUbF0QrEb83h4LOLyLHD0=;
	b=lQNUxJCGZHlLFMGvxuzDZG10brSTCZ90wZsxswtSiOBtcu9yH48Nv4DhucrpDwmHJ02om+
	MBOl6AWv1aoa/sDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 45235779C2;
	Wed,  5 Aug 2026 18:52:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id t/G2BH2Gc2rwagAAD6G6ig
	(envelope-from <krisman@suse.de>); Wed, 05 Aug 2026 18:52:45 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	Gabriel Krisman Bertazi <krisman@suse.de>
Subject: [PATCH liburing] man/io_uring_submit*.3: Point to error code documentation
Date: Wed,  5 Aug 2026 14:52:37 -0400
Message-ID: <20260805185237.371164-1-krisman@suse.de>
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

There's an open issue in gh asking about the possible error codes
returned by io_uring_submit.  Add pointers to io_uring_enter(2) in all
io_uring_submit* variants where the error codes are explained in
detail.  The minor exception are _wait_timeout, wait_and_reg and
wait_min_timeout, where there are more error codes to be described.

Closes: https://github.com/axboe/liburing/issues/1511
Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
---
 man/io_uring_submit.3                      |  7 ++++++-
 man/io_uring_submit_and_get_events.3       |  7 ++++++-
 man/io_uring_submit_and_wait.3             |  7 ++++++-
 man/io_uring_submit_and_wait_min_timeout.3 | 11 +++++++----
 man/io_uring_submit_and_wait_reg.3         |  7 +++++--
 man/io_uring_submit_and_wait_timeout.3     | 15 ++++++++++-----
 6 files changed, 40 insertions(+), 14 deletions(-)

diff --git a/man/io_uring_submit.3 b/man/io_uring_submit.3
index c7dbbed2..b78f0e63 100644
--- a/man/io_uring_submit.3
+++ b/man/io_uring_submit.3
@@ -33,6 +33,10 @@ about how many submission queue entries have been successfully submitted, while
 using SQPOLL, the user must fall back to repeatedly submitting a single submission
 queue entry. On failure it returns
 .BR -errno .
+See
+.BR io_uring_enter (2)
+for details on the possible error codes returned by
+.BR io_uring_submit (3) .
 .SH NOTES
 For any request that passes in data in a struct, that data must remain
 valid until the request has been successfully submitted. It need not remain
@@ -48,4 +52,5 @@ mentioning this fact as well, if required for the given command.
 .SH SEE ALSO
 .BR io_uring_get_sqe (3),
 .BR io_uring_submit_and_wait (3),
-.BR io_uring_submit_and_wait_timeout (3)
+.BR io_uring_submit_and_wait_timeout (3),
+.BR io_uring_enter (2)
diff --git a/man/io_uring_submit_and_get_events.3 b/man/io_uring_submit_and_get_events.3
index 9e143d1d..a30d7966 100644
--- a/man/io_uring_submit_and_get_events.3
+++ b/man/io_uring_submit_and_get_events.3
@@ -26,6 +26,11 @@ On success
 .BR io_uring_submit_and_get_events (3)
 returns the number of submitted submission queue entries. On failure it returns
 .BR -errno .
+See
+.BR io_uring_enter (2)
+for details on the possible error codes returned by
+.BR io_uring_submit_and_get_events (3) .
 .SH SEE ALSO
 .BR io_uring_submit (3),
-.BR io_uring_get_events (3)
+.BR io_uring_get_events (3),
+.BR io_uring_enter (2)
diff --git a/man/io_uring_submit_and_wait.3 b/man/io_uring_submit_and_wait.3
index 2351f335..4a642875 100644
--- a/man/io_uring_submit_and_wait.3
+++ b/man/io_uring_submit_and_wait.3
@@ -37,8 +37,13 @@ On success
 .BR io_uring_submit_and_wait (3)
 returns the number of submitted submission queue entries. On failure it returns
 .BR -errno .
+See
+.BR io_uring_enter (2)
+for details on the possible error codes returned by
+.BR io_uring_submit_and_wait (3) .
 .SH SEE ALSO
 .BR io_uring_queue_init_params (3),
 .BR io_uring_get_sqe (3),
 .BR io_uring_submit (3),
-.BR io_uring_submit_and_wait_timeout (3)
+.BR io_uring_submit_and_wait_timeout (3),
+.BR io_uring_enter (2)
diff --git a/man/io_uring_submit_and_wait_min_timeout.3 b/man/io_uring_submit_and_wait_min_timeout.3
index 6a52806f..1812809f 100644
--- a/man/io_uring_submit_and_wait_min_timeout.3
+++ b/man/io_uring_submit_and_wait_min_timeout.3
@@ -106,14 +106,17 @@ returns the number of submitted submission queue entries. On failure it returns
 If the kernel doesn't support this functionality,
 .BR -EINVAL
 will be returned. See note on the feature flag.
-The most common failure case is not receiving a completion within the specified
-timeout,
+See
+.BR io_uring_enter (2)
+for details on the other possible error codes.  In addition to those, this
+function can also return
 .B -ETIME
-is returned in this case.
+if a completion was not received within the specified timeframe.
 .SH SEE ALSO
 .BR io_uring_queue_init_params (3),
 .BR io_uring_get_sqe (3),
 .BR io_uring_submit (3),
 .BR io_uring_submit_and_wait (3),
 .BR io_uring_submit_and_wait_timeout (3),
-.BR io_uring_wait_cqe (3)
+.BR io_uring_wait_cqe (3),
+.BR io_uring_enter (2)
diff --git a/man/io_uring_submit_and_wait_reg.3 b/man/io_uring_submit_and_wait_reg.3
index fc0bd76a..f82e432a 100644
--- a/man/io_uring_submit_and_wait_reg.3
+++ b/man/io_uring_submit_and_wait_reg.3
@@ -56,9 +56,12 @@ If the kernel doesn't support this functionality,
 will be returned. If no events are submitted and the wait operation times
 out, then
 .BR -ETIME
-will be returned.
+will be returned.  Otherwise, see
+.BR io_uring_enter (2)
+for details on the remaining possible error codes.
 
 .SH SEE ALSO
 .BR io_uring_register_region (3) ,
 .BR io_uring_submit_and_wait_min_timeout (3) ,
-.BR io_uring_submit_and_wait_timeout (3)
+.BR io_uring_submit_and_wait_timeout (3) ,
+.BR io_uring_enter (2)
diff --git a/man/io_uring_submit_and_wait_timeout.3 b/man/io_uring_submit_and_wait_timeout.3
index 74611766..20fe03ae 100644
--- a/man/io_uring_submit_and_wait_timeout.3
+++ b/man/io_uring_submit_and_wait_timeout.3
@@ -60,15 +60,20 @@ On success
 .BR io_uring_submit_and_wait_timeout (3)
 returns the number of submitted submission queue entries. On failure it returns
 .BR -errno .
+See
+.BR io_uring_enter (2)
+for details on the possible error codes.  In addition to those, this
+function can also return
+.B -ETIME
+if a completion was not received within the specified timeframe, or
+.B -EAGAIN
+if the queue was full and it couldn't queue the timeout request.
 Note that in earlier versions of the liburing library, the return value was 0
 on success.
-The most common failure case is not receiving a completion within the specified
-timeout,
-.B -ETIME
-is returned in this case.
 .SH SEE ALSO
 .BR io_uring_queue_init_params (3),
 .BR io_uring_get_sqe (3),
 .BR io_uring_submit (3),
 .BR io_uring_submit_and_wait (3),
-.BR io_uring_wait_cqe (3)
+.BR io_uring_wait_cqe (3),
+.BR io_uring_enter (2)
-- 
2.55.0

