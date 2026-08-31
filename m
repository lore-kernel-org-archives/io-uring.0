Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA7847253F
	for <io-uring@vger.kernel.org>; Mon, 31 Aug 2026 15:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788191086; cv=none; b=k8zhVSvEj7+ihzhg+tcJAQLFfYg4HxTSXouIm1FCOI7Q03oPDKEDGmVZO/Q3tjiwF+lTAOrEYjkODSDrTTUeLzgFYiqI/I0nVTyvRYDXlHloMdzcSJu1TO45ytSPYWPgkFJaIpmbzhkMAQolgtCMUjHmZdKHzKsCfNIsowiUHFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788191086; c=relaxed/simple;
	bh=edxrMdAH1sxr8ZP203TMN6KpgTCINL02FHuT98QfzBE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H0p9qBQw8BiNdjJFQPxiI3AxSVYkxLh9TgnEFabZJAyPXRufCt/OzzknrJK/mFDNlJrjf/NTbDhQQtWrlKcRW4MZ2dVzUcXWPhswG41IudVFhdBHmscCzxp4wfsX8xfdfd088FU4dYpHqHXcaN0dz5SquURWldRFtgh2OOZCni4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MQZ7cRqa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5s2Ioxdb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eGCFttcn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oGW6Sl/I; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MQZ7cRqa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5s2Ioxdb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eGCFttcn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oGW6Sl/I"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4F72B21CCD;
	Mon, 31 Aug 2026 15:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788191078; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=o6atVfhv9pQoO4hJZp/jpA4BZLEhvoEHnwBwWL7caws=;
	b=MQZ7cRqaNJUtpiz9TY1A8wcNNxlZa3HYbpqhV09w7K+ZiQ3/egd4+nF99eVfl/4pVNsvdT
	mn9LvWhl+QZ6NlPp+Y0+ZAWZdqH6CV2IqlqkDiy3Oo3+slzsW63AoNgpKCj5DA+LNZuJ77
	IkU9qgv11NUhu8LuFLmzZS1a9uwLu7s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788191078;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=o6atVfhv9pQoO4hJZp/jpA4BZLEhvoEHnwBwWL7caws=;
	b=5s2IoxdbFU4aGKhzvFPSSK15p/aE52jlgvYXrnAVKShjlO1a33aeyP7SbqwxSsO3yw28+K
	Lez7J3nhb0afAgDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788191074; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=o6atVfhv9pQoO4hJZp/jpA4BZLEhvoEHnwBwWL7caws=;
	b=eGCFttcnKJVtLTgc8M0Z6AT8BQAYSAC8igwdu4vzqGQ37ALU7dbbfV08GbV4p+/PDA8ZkW
	bwO4cBH7FscAJ9e5SgAXxVtKmKuvffAl6X+HTyTtC63SgiDWz3g5PILxLe87W1EOOnOmCy
	WgD+X/o8JFHeiEPsynIfhlcEcyHiJ3U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788191074;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=o6atVfhv9pQoO4hJZp/jpA4BZLEhvoEHnwBwWL7caws=;
	b=oGW6Sl/IWn1RORn554plzUWa+i6r3PeobVBGL1AdaJhA/iLwwJmbb+UPcwLF/NuMIKNSsb
	OSs/1SWKfEYf6cDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8E68713694;
	Mon, 31 Aug 2026 15:44:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BgmkA2GhlWpZSAAAD6G6ig
	(envelope-from <krisman@suse.de>); Mon, 31 Aug 2026 15:44:33 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	Gabriel Krisman Bertazi <krisman@suse.de>
Subject: [RESEND PATCH liburing 0/2] man page improvements
Date: Mon, 31 Aug 2026 12:44:24 -0300
Message-ID: <20260831154426.115944-1-krisman@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

A couple fixes to documentation requested on github issues I sent a while ago.

Gabriel Krisman Bertazi (2):
  man: Fix FUTEX_WAIT/FUTEX_WAKE explanation
  man/io_uring_submit*.3: Point to error code documentation

 man/io_uring_enter.2                       | 39 +++++++++++-----------
 man/io_uring_submit.3                      |  7 +++-
 man/io_uring_submit_and_get_events.3       |  7 +++-
 man/io_uring_submit_and_wait.3             |  7 +++-
 man/io_uring_submit_and_wait_min_timeout.3 | 11 +++---
 man/io_uring_submit_and_wait_reg.3         |  7 ++--
 man/io_uring_submit_and_wait_timeout.3     | 15 ++++++---
 7 files changed, 60 insertions(+), 33 deletions(-)

-- 
2.55.0

