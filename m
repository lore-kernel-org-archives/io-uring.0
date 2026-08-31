Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B44E46EC9D
	for <io-uring@vger.kernel.org>; Mon, 31 Aug 2026 15:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788191575; cv=none; b=GGQmBEt/GdYGC/c0Qm2KbHNb/3ultp1qieanb8Kd9vybBtVnf1mJ+ABTy4G0wdYrYVuPk6FauG6pZ3emYX+abV9jEQVkuQReDBlafF/9Fnhk4bTcCn9IeOLkcTwdVZJzeDsvZcLvSwmitWveRNDOj/dhaVbIVkMW8E8LNTTrbxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788191575; c=relaxed/simple;
	bh=hNkiJ1XSfEGDoIubib3uL9W9xZgVukxGrsXk1Wixof0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TEbCYdwDfEcPnUIqeWicGWtq6Y03lpAL6njbVBghk8sw90F5+x/s0xQVjel++gBfbMMgqLHp7MxZadKTPKSOvlKfHvDQ+4jI6UPDx+UOCvppnHIz0Ldi+YFv8JQT/jCaGlWldJgaN012BdEPbNBY8SHB7WGb2kR6LNN3MsFWsm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Il/1DPgU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TOT3LXOP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D9OhfTOv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=odmiCWJk; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Il/1DPgU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TOT3LXOP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D9OhfTOv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="odmiCWJk"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1E65822499;
	Mon, 31 Aug 2026 15:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788191568; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6EXdkkmCpYVPv+s9iWsqCTrxdenVceCYv61CyWTIbjg=;
	b=Il/1DPgUgA8nM54wpDGCHrRkUktg3SfVkKcPLiuVV2PNJKSK/s3nRoaCfI81FWztk7MW4E
	FYEord7YI12WFGpBKjwV+K88rb/A0c2XDHdQPGlqlSrWNuoby3l3Qm5Gt3JJPZX1fYSGd5
	neVVoJEBpONQskCr5CkqGsAws2/Soc0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788191568;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6EXdkkmCpYVPv+s9iWsqCTrxdenVceCYv61CyWTIbjg=;
	b=TOT3LXOPIuhKbhFcIxKRd0AScJavzlUhpmFTuK7FCmQQ/jQsblrjcm7atRztXCRWga+NOO
	DdTBmrA9XVxqHoDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788191564; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6EXdkkmCpYVPv+s9iWsqCTrxdenVceCYv61CyWTIbjg=;
	b=D9OhfTOvveBnlyazcZd/IZtFRX70HxIpuSQvnKyQaTTKDRXmkkRd6z94qHlW62JZpspxUb
	tJQeXjJZIB3+b70mF93GBrq0+Q9WAEGW2d+DQT6+apH4ZeMmWO3bQddTjjHtZgEftiPO4Z
	8Yqym2kSNzvAzU1eV6NW6AKyhXk8Mwc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788191564;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6EXdkkmCpYVPv+s9iWsqCTrxdenVceCYv61CyWTIbjg=;
	b=odmiCWJkwbdLlV2XpA5S0sJlFCdqVcPQmRS5mqgoc+Wl8Zh6AnjcklhfA3bQAWGH8mijnZ
	4naL47ppfuRZ0VCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5D74B13694;
	Mon, 31 Aug 2026 15:52:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Wpz0BEujlWo6UAAAD6G6ig
	(envelope-from <krisman@suse.de>); Mon, 31 Aug 2026 15:52:43 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	Gabriel Krisman Bertazi <krisman@suse.de>
Subject: [RESEND PATCH liburing 1/2] test/iowait.t: Skip if system is not quiesced for too long
Date: Mon, 31 Aug 2026 12:52:21 -0300
Message-ID: <20260831155222.121857-2-krisman@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831155222.121857-1-krisman@suse.de>
References: <20260831155222.121857-1-krisman@suse.de>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spam-Level: 
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

iowait.t reads the system-wide iowait metric, which is unreliable if the
cpu is busy with other tasks.  Identify this scenario by checking the
user+sys time, and retry to avoid spurious failures.

Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
---
 test/iowait.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/test/iowait.c b/test/iowait.c
index 542510c1..610fa4ea 100644
--- a/test/iowait.c
+++ b/test/iowait.c
@@ -11,7 +11,7 @@
 #include "liburing.h"
 #include "helpers.h"
 
-static int get_iowait(int cpu)
+static int get_iowait(int cpu, int *cpu_time)
 {
 	char cpu_buf[32], this_cpu[32];
 	int user, nice, system, idle, iowait, ret;
@@ -33,6 +33,7 @@ static int get_iowait(int cpu)
 			continue;
 		if (strncmp(cpu_buf, this_cpu, strlen(this_cpu)))
 			continue;
+		*cpu_time = user + system;
 		ret = iowait;
 		break;
 	} while (1);
@@ -45,14 +46,20 @@ static int test(struct io_uring *ring, int with_iowait, int cpu)
 {
 	struct io_uring_sqe *sqe;
 	struct io_uring_cqe *cqe;
-	int iowait_pre, iowait_post;
+	int iowait_pre, iowait_post, cputime_pre, cputime_post;
 	struct __kernel_timespec ts;
-	int ret, fds[2], diff;
+	int ret, fds[2], diff, diff_cputime, retry = 5;
 	char buf[32];
 
 	if (!(ring->features & IORING_FEAT_NO_IOWAIT))
 		return T_EXIT_SKIP;
 
+retry:
+	if (retry < 0) {
+		fprintf(stderr,
+			"System is not quiesced for too long. skipping\n");
+		return T_EXIT_SKIP;
+	}
 	if (pipe(fds) < 0) {
 		perror("pipe");
 		return T_EXIT_FAIL;
@@ -70,14 +77,15 @@ static int test(struct io_uring *ring, int with_iowait, int cpu)
 
 	ts.tv_sec = 1;
 	ts.tv_nsec = 0;
-	iowait_pre = get_iowait(cpu);
+	iowait_pre = get_iowait(cpu, &cputime_pre);
 	ret = io_uring_wait_cqe_timeout(ring, &cqe, &ts);
 	if (ret != -ETIME) {
 		fprintf(stderr, "Unexpected wait ret: %d\n", ret);
 		return T_EXIT_FAIL;
 	}
-	iowait_post = get_iowait(cpu);
+	iowait_post = get_iowait(cpu, &cputime_post);
 	diff = iowait_post - iowait_pre;
+	diff_cputime = cputime_post - cputime_pre;
 
 	close(fds[0]);
 	close(fds[1]);
@@ -91,7 +99,13 @@ static int test(struct io_uring *ring, int with_iowait, int cpu)
 
 	if (with_iowait) {
 		if (diff < 50) {
-			fprintf(stderr, "iowait diff too small: %d\n", diff);
+			if (diff_cputime > 10) {
+				/* System is not quiesced. iowait is unreliable. */
+				retry--;
+				sleep(2);
+				goto retry;
+			}
+			fprintf(stderr, "iowait diff too small: %d (u=%d)\n", diff, diff_cputime);
 			return T_EXIT_FAIL;
 		}
 	} else {
-- 
2.55.0

