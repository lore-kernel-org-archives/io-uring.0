Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CF5411F92
	for <io-uring@vger.kernel.org>; Wed, 22 Jul 2026 18:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784744245; cv=none; b=PwuZbw7DnkGp6Pg5d85R6YPIkv2feS6e57XaUqJFU6EVEEXybMfYWAJVKzOe7ncPdAIQ81cHxhfmr94AQt7K1yfejgiOGh1z8Ly3KO0L9nkY4rZ9dWg5/1f44tk6+cz8kfGj86rKpl7pcB15D9BBCA0I1GZwRqmKoMU6dKPHp58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784744245; c=relaxed/simple;
	bh=y4CsPeKcc5gVkdpTxsmKENeGor78GletN75a7gEDjWE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LqryUBNRnYs+jgSbA1RskfHN2TRftPTvWsmA4NKdHGOpc+lN+SdBUAoVtufDrjc5DYNf4dIh027uPZzPJvjy1ZJ+ThcCVcUCOkwTkk7XUOPthWJh3ydckS5WEXCqr+b/jcTCORRER4jy7KwpiJhyZF6wDYWvHrmcqqC0pcmNGF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mdunHma4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DzGackPb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mdunHma4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DzGackPb; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mdunHma4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DzGackPb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mdunHma4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DzGackPb"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 92CAE7ABED;
	Wed, 22 Jul 2026 18:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784744241; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ENvzRMI++xDBxdiLn/6V3FR44DKujsUdjHfJ118pvDE=;
	b=mdunHma4+0lGu8404oGwUQoGbjB1TGa83Cmot36UXwCm3cjUrcxZ5512TwDST6oCH9GK0G
	9MRYDToVrTkoznYqJeoXtpy7KFgVLDjMPaEXntMwEvOdW1GSGMpbR+arUDIUqC5pImfljm
	BA854tgDKMqkxJ2Oe525ezdzwIxA3ek=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784744241;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ENvzRMI++xDBxdiLn/6V3FR44DKujsUdjHfJ118pvDE=;
	b=DzGackPb8puKHHzIKwVQLk063IyxBe01ZMvaOQK4rvTpcaEicYxwADJUIi4UfK3gSzL+9A
	7xYZspbx/oqnDAAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784744241; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ENvzRMI++xDBxdiLn/6V3FR44DKujsUdjHfJ118pvDE=;
	b=mdunHma4+0lGu8404oGwUQoGbjB1TGa83Cmot36UXwCm3cjUrcxZ5512TwDST6oCH9GK0G
	9MRYDToVrTkoznYqJeoXtpy7KFgVLDjMPaEXntMwEvOdW1GSGMpbR+arUDIUqC5pImfljm
	BA854tgDKMqkxJ2Oe525ezdzwIxA3ek=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784744241;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ENvzRMI++xDBxdiLn/6V3FR44DKujsUdjHfJ118pvDE=;
	b=DzGackPb8puKHHzIKwVQLk063IyxBe01ZMvaOQK4rvTpcaEicYxwADJUIi4UfK3gSzL+9A
	7xYZspbx/oqnDAAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4DAD0779B0;
	Wed, 22 Jul 2026 18:17:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AL25BjEJYWpRSwAAD6G6ig
	(envelope-from <krisman@suse.de>); Wed, 22 Jul 2026 18:17:21 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	Gabriel Krisman Bertazi <krisman@suse.de>
Subject: [PATCH liburing 0/2] Fix op_recv stack corruption
Date: Wed, 22 Jul 2026 14:17:08 -0400
Message-ID: <20260722181710.79099-1-krisman@suse.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Jens,

These two tests were failing on my debug infrastructure. It seems gcc
hides the issue with a higher level of optimization, most likely by
smarting out the local variable allocation straight to registers, which
is why we don't observe it more often.  When building with '-O0 -g3', I
could trigger it 100% of time.  Tested with kernel 7.2-rc4.

Gabriel Krisman Bertazi (2):
  test/send_recvmsg: Preserve msghdr until op_recvmsg completes
  test/recv-msgall-stream: Preserve msghdr until op_recvmsg completes

 test/recv-msgall-stream.c | 14 +++++++-------
 test/send_recvmsg.c       | 16 ++++++++--------
 2 files changed, 15 insertions(+), 15 deletions(-)

-- 
2.54.0

