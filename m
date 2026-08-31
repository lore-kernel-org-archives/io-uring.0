Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E2342BEAA
	for <io-uring@vger.kernel.org>; Mon, 31 Aug 2026 15:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788191105; cv=none; b=GAyK0Wnq1Rckh2aoZztP2jCsIagf4QMsVoqWs4JdM04N6F0XWHZVSxvZVlPezBAbTy9cPf60Egdfz3pSBbW/IFXoeMLE3Nnx2AGp8l6Wv9H9CkItUg7m7dCq7E262J6Hb6soQmY1aeMBKkaVWA24M0MXNahkFLkISrvwv6N9YKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788191105; c=relaxed/simple;
	bh=rbsn9P+gKA+o3Tr+4GZbwEkAXE8EOvtMyy4vULhfehM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uv1d1mEuXZ51dGaTZnnFQRITCqccD7YEthKgJUcM8sQ/w7oQ66xRyH3A/xo56s+tB1LmkSdCNJ9k7K00U2T0ug2JBgJIeaZ2CIBgDNAKO0WyVaS54u7dhSAdoAmq9Ns5IjcHXH4bMtv2eUMBFVMy4kfXZVj3Xv2RLu/JIQShBrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DC11422245;
	Mon, 31 Aug 2026 15:45:00 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 040D213685;
	Mon, 31 Aug 2026 15:44:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MEpUInuhlWrwSAAAD6G6ig
	(envelope-from <krisman@suse.de>); Mon, 31 Aug 2026 15:44:59 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	Gabriel Krisman Bertazi <krisman@suse.de>
Subject: [RESEND PATCH liburing 2/2] man/io_uring_submit*.3: Point to error code documentation
Date: Mon, 31 Aug 2026 12:44:26 -0300
Message-ID: <20260831154426.115944-3-krisman@suse.de>
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
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Queue-Id: DC11422245
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]

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

