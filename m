Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE94B33343C
	for <io-uring@vger.kernel.org>; Wed,  5 Aug 2026 19:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785958340; cv=none; b=JASx0dADY8RP0CNFIGjAq5/r/BIN+joe5ERn0sFXOZhijXNPnsBDk5CkQaery94g9fTpQCVcOyJ0ndhtrRZvr9aL7KPhU3neJsmoxCGWfCypqXfo1DO9khPF7ODI3UtYS0hnRAAJbHoGbEYidq3lOL9GTobycpMU/HoGuBvNO/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785958340; c=relaxed/simple;
	bh=vfrCXhXMb2devZWvKLJnOMFXKhOSMYIQdcHZWswjbnc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mzsYe5e58G6e0k27pNt3LcmF+D3TVz6ZwUKV1RWay3NGVgSHq/v38kVV/6YbvEL1s6jSWnVxC+/d+98B32+tUPv1jI6NcOgsuka/9SwNGK8EYYS/7RD68ghmou6e7C3YH4grnPiYMQX3ssXk2q25kYzI+KlXka/pNuZbiIe6uA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PDMCHsPz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KaWCB5IX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S8c2RWjn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1JMsEnVs; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PDMCHsPz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KaWCB5IX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S8c2RWjn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1JMsEnVs"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A11A07F75E;
	Wed,  5 Aug 2026 19:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785958332; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=aEQg50sLUDI0QNEghSHitb9bdbC0bF9BOeaRtz1w3uU=;
	b=PDMCHsPz8CpMptuNEnEJuQM+iVBG7RK3X8Plv27sfPRJhZuaF1MiTrtlMOB7WHiZ+f1na7
	82/v3pu2sIz9UL1/bsppaJ6FRn3MWLV6Jp4lUxI9rL7Dx+Cl0IAsi2vPU39PELk8/vak+b
	KqwGgTz6mVE2Ve3SDU3AMZvF0JxPR6k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785958332;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=aEQg50sLUDI0QNEghSHitb9bdbC0bF9BOeaRtz1w3uU=;
	b=KaWCB5IXyFfIpSQMeLPkcygtjodr3q/8jvSKJdjkN3UAdmkOYngVLsF0OQTq4ZmXZMwYO6
	XG9SqgsdLC5M1MBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=S8c2RWjn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=1JMsEnVs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785958328; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=aEQg50sLUDI0QNEghSHitb9bdbC0bF9BOeaRtz1w3uU=;
	b=S8c2RWjn69k07F1kyiEdwDXFS0XTNloYi1E9eccR8LCZFcHNjdmiMVKFmc0FjMeaOYuVA5
	oLaa/Dh/m95VUSKI/FF7wJxPjxwhtD+z7khC7e492Q2ZAcC72yzn96gKoPQhuoKNLHKNsC
	FOvrYTIiMRNNrOj6O+sDj5gRf6D5eSY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785958328;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=aEQg50sLUDI0QNEghSHitb9bdbC0bF9BOeaRtz1w3uU=;
	b=1JMsEnVsXtwFEP8hyAKIsNfmg4EQVu4kWoZJlFqoCIc047qzdn2N/laoJU6RhiCAAGdgpH
	REoLgvuQ/VwyToDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6114D779C3;
	Wed,  5 Aug 2026 19:32:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Y3WiC7iPc2rSEAAAD6G6ig
	(envelope-from <krisman@suse.de>); Wed, 05 Aug 2026 19:32:08 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	Gabriel Krisman Bertazi <krisman@suse.de>
Subject: [PATCH liburing] test/iopoll: Fix clang CI build failure
Date: Wed,  5 Aug 2026 15:31:58 -0400
Message-ID: <20260805193158.400489-1-krisman@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: A11A07F75E
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

Clang CI builds in liburing repo do -Werror,-Wunused-but-set-global when
building with clang.  commit c5eead26 ("test/iopoll: fix over-eager
no_hybrid check") left a lingering variable that was not used, and clang
got smart enough to find for it, causing the build to fail for every
commit ever since.

https://github.com/axboe/liburing/actions/runs/30404555586/job/90427017716
https://github.com/axboe/liburing/actions/runs/30404555586/job/90427017742

Fixes: c5eead26 ("test/iopoll: fix over-eager no_hybrid check")
Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
---
 test/iopoll.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/test/iopoll.c b/test/iopoll.c
index 98230657..d68fde10 100644
--- a/test/iopoll.c
+++ b/test/iopoll.c
@@ -23,7 +23,6 @@
 static struct iovec *vecs;
 static int no_buf_select;
 static int no_iopoll;
-static int no_hybrid;
 
 static int provide_buffers(struct io_uring *ring)
 {
@@ -372,10 +371,8 @@ static int test_io(const char *file, int write, int sqthread, int fixed,
 		return 0;
 	}
 	if (ret != T_SETUP_OK) {
-		if (ring_flags & IORING_SETUP_HYBRID_IOPOLL) {
-			no_hybrid = 1;
+		if (ring_flags & IORING_SETUP_HYBRID_IOPOLL)
 			return 0;
-		}
 		fprintf(stderr, "ring create failed: %d\n", ret);
 		return 1;
 	}
-- 
2.55.0

