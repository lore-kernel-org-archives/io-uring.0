Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECE0369D75
	for <io-uring@vger.kernel.org>; Wed,  2 Sep 2026 23:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788390061; cv=none; b=ptQswg89TQwTt9057gMvsLOf6/GPfWYXMWCBqgH50Yk61bijTOF+33xQYZKEKWwxqCcYB/+I7h/+V8w3IKPBNKuB+sSjzVQ29Davo3TwcZFMec7s1dVknVQcJVqoWnsXBJ2R83JbEBtosme3oXupzYr+mTbXgSaSHjJ5JbkGeG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788390061; c=relaxed/simple;
	bh=nFVHJMjGDgtjEfj5J4bukqetQlWb6T9k67SceYLSyDE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jtknbtt2YW8gHfdaUpMpiFn/1ZNrz8NoRXbJJUVstutIS374uXbQIBeaGPjJOTxtfejUfYNLpHFSzsn/oiJRjxYRVM5alyorRGUMc8wazYzoxhljclL+cBYp2BReA4t/U4EHPALjrAbeJgnTsAIPZGE7ILKJFkGJ+yAV1XH5tKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tBw+UnfZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bG3QxS7o; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CPMqSfdz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ONABywKL; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tBw+UnfZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bG3QxS7o";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CPMqSfdz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ONABywKL"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BC9221FB17;
	Wed,  2 Sep 2026 23:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788390050; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=POHuzPGecRvE7UDsVPaiE8Z/P7l9Fvnv+8ZJMjCB5sw=;
	b=tBw+UnfZZ/CGy6BRepHO9MtZeayjThXp1yabNsgiaCsn7kGnJjViH11ztJFcSo8NnqQTEM
	ZRJmIzv4HdroUcUDenYMGGOdNd91DBnP33ZQYVc6QUi7R3MMtsGqAMKeoch1B29X6sVuem
	uB595rxmP8ALKDX8cOHOlaA5Ig73Y1Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788390050;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=POHuzPGecRvE7UDsVPaiE8Z/P7l9Fvnv+8ZJMjCB5sw=;
	b=bG3QxS7obesIk9IBrzH24jNajdkdJLM7e4Ayb3+re7DoVxshQfS8nGE7cHreRyePEBcS7Z
	rEZiezUsIaeWz3CQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788390046; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=POHuzPGecRvE7UDsVPaiE8Z/P7l9Fvnv+8ZJMjCB5sw=;
	b=CPMqSfdzhNGfgtKyRlRsfQsudnNWUxTMagKeTgeQQJ4WPCPc0SjuTDCLyCePXFzSCFYlne
	2lEmMnCA/JlRgLUW5zG7meDpgd8PPFKjeP1ogOSFC0VEd594DO1bnnpw34AtUkaruFEYo7
	0LcnPO/MTUHVufhKkCU/LRpgywkFRHQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788390046;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=POHuzPGecRvE7UDsVPaiE8Z/P7l9Fvnv+8ZJMjCB5sw=;
	b=ONABywKLIQYlZkLx9uVJlnBIQ/RkbY1avjaxiIMFsPiQW4KVB2PfpChk1ZibikTyAwBFR6
	RO8sBU7HWrKdW+BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0F74E136E6;
	Wed,  2 Sep 2026 23:00:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LpHeMZ2qmGqZCgAAD6G6ig
	(envelope-from <krisman@suse.de>); Wed, 02 Sep 2026 23:00:45 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	Gabriel Krisman Bertazi <krisman@suse.de>
Subject: [PATCH 0/2] Fix return with MSG_TUNC overtruncating buffers
Date: Wed,  2 Sep 2026 20:00:39 -0300
Message-ID: <20260902230041.1320658-1-krisman@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.993];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

Jens,

This is an attempt to fix the issue reported at [1].  It works by
splitting the return size (which can be the full size of the packet)
from the value actually commited in the buffer.  Please, let me know
your thoughts.  Patch 1 is a small preparation and patch 2 has the fix.

This was tested for regressions against liburing as well as using the
reproducer from the bug, which I can turn into a proper test case
against liburing.

I sent this before but the submission was botched.  Please take this
version in consideration.

Thanks,

[1]  https://github.com/axboe/liburing/issues/1619

Gabriel Krisman Bertazi (2):
  io_uring/net: let io_recv_buf_select return the length of the buffer
    region
  io_uring/net: don't overconsume buffers when using MSG_TRUNC

 io_uring/net.c | 48 +++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 37 insertions(+), 11 deletions(-)

-- 
2.55.0

