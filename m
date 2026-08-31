Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C5B474268
	for <io-uring@vger.kernel.org>; Mon, 31 Aug 2026 15:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788191562; cv=none; b=iJwfpnPsvvSOxpf/q0lsg/gY0OjLFv/m7v/hcCVjh50kPXkfV77guWrTjEjhJWvsadRaS11pNXirqevwk16xHz2ukPKseWBKBUO2sjgQtw26iXGYBUFXfrfKjSiA1xLoi2Y+5NibUx+nWtj+njPURDwjvwhrE+Uh/8cLzsmmjQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788191562; c=relaxed/simple;
	bh=5E2+QXF6dB9TLkd5MsgcERpaUw98IIXAT1Kxgxwnb+I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CudIXihaKTVpt+fLkl4gIgyBbinQIofcVM8f7gq++3WtHeGZROnN1sBQck6AeljP6s+1laCOIOLdpCthIMbRvShwz1tC7u2MASqiClZ8jCWfApGb3H3m0HPD++bjZyjheL+KpCB9z66zTC0u0RoJ/jjO+VsofQNOQKiKRGYUotM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dUz9rBVS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AuKhDceB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nibcEPtc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QoLDTP3C; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dUz9rBVS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AuKhDceB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nibcEPtc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QoLDTP3C"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9125D1FD45;
	Mon, 31 Aug 2026 15:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788191554; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=83ml9LYG9zDL1uBpu5lxY5P4OlgPWkVQwPsHloXDfgA=;
	b=dUz9rBVSi2+RCNMENdEIFzsiwm9XNMzMhrAoo+tV0rn5RqroJiZtbxj5Z6oQTlwB7swsmF
	Y2td6o97CuhQW6xXatyiioehGIV+b05EljM+3uOxLZuSc+ICM9bsh/du+gbB3ZB8iZIGBA
	r/rBghyWcVU6XIwUYtvpWPFoQ1TDCtw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788191554;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=83ml9LYG9zDL1uBpu5lxY5P4OlgPWkVQwPsHloXDfgA=;
	b=AuKhDceBPr7qHMNCewD6q992Z6yodaG7Q/oVpn737eY5uuQSgIhCreCqqEagNGYb0Ai1X7
	NpJ1vh4YvvMNz6Cg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788191550; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=83ml9LYG9zDL1uBpu5lxY5P4OlgPWkVQwPsHloXDfgA=;
	b=nibcEPtc1wF+Fz4q9oeKZfezKIMtVuUpcrdL0XlJGH0d5gvGqlhmkxfV6fNr9hPfWHF5BX
	cmuBJvG88qZKRGfxxkM5D9A0iMCflkl8GdtTo7eDjV8G9byQsrjJEQMi6FVzXVZNCwwfFP
	BZ1JbH3TFRIeN1N9ZPlxWeUk/1HP0f8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788191550;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=83ml9LYG9zDL1uBpu5lxY5P4OlgPWkVQwPsHloXDfgA=;
	b=QoLDTP3CI+v8qlFZnvhGrIQu/XQPomK+zjs/NsTwsDzQb/ff0BPsBMCS1djL9uaq9LO8Vg
	BDxv7Ak49ILjIlAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CADF913694;
	Mon, 31 Aug 2026 15:52:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wFJIDT2jlWomUAAAD6G6ig
	(envelope-from <krisman@suse.de>); Mon, 31 Aug 2026 15:52:29 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	Gabriel Krisman Bertazi <krisman@suse.de>
Subject: [RESEND PATCH liburing 0/2] couple of fixes to tests
Date: Mon, 31 Aug 2026 12:52:20 -0300
Message-ID: <20260831155222.121857-1-krisman@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Score: -2.80
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

Two unrelated fixes that I sent a while ago.  Jiri Slaby reported iowait
sporadic failures and while patch 1 doesn't fix all of them, it makes the test
much more reliable.  Patch 2 is a trivial fix to CI builds.


Gabriel Krisman Bertazi (2):
  test/iowait.t: Skip if system is not quiesced for too long
  test/iopoll: Fix clang CI build failure

 test/iopoll.c |  5 +----
 test/iowait.c | 26 ++++++++++++++++++++------
 2 files changed, 21 insertions(+), 10 deletions(-)

-- 
2.55.0

