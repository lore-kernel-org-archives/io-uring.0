Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D42C390CB8
	for <io-uring@vger.kernel.org>; Tue,  2 Jun 2026 21:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780437221; cv=none; b=ZUBfrrRPG4eTVlHnc194Vh2E6y7ap/RKScapFJldfLy25SvkP4YhDJUPtKcaqy0TSRZy56JxeIF856lOqEMItS7VdAtPD+p2GS2ZxFd8pB4kEzbWQ2PyorlqX9Vnsv+nF3QRXSTplP066Sd5KxgMizVP6gT/htgDQLP+pmMyhEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780437221; c=relaxed/simple;
	bh=lZmiVlreHFfFUdnfez0yzq5FcPg22VVlInepXe58xvc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QO+rbnkvE5+UdcBvH52vr+9zSNx7BHlPl1nFt3PGL6URwLuhdhepnJPgIGHl7dbAwSdHWCVKPhkMMzFkbZb6P1R7ZUZI7snWZZykUewtQSUoULsB2vaY9kkUiaXopc1AtMgpNuMCKzHVQBwFUn/GvRbUPQCqcqcU/80tb2QLABI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cYOpVO5w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=z7FBcbQL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cYOpVO5w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=z7FBcbQL; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cYOpVO5w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z7FBcbQL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cYOpVO5w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z7FBcbQL"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8A7E66A819;
	Tue,  2 Jun 2026 21:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780437218; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=t497zKpJ9RP89JuMVFrTfv2eopnbEWXvkmOK8hn8BgM=;
	b=cYOpVO5wLA6p/6wwKe0ozgoePiXEP++uU5QAsVE8J90wUqmxi+VYLEb0ur7Pvjg5f5y6eh
	9EZV5ZLdYxmaqi4LXpSyj0TTTa3+MQx0nRLtGlUQ8xS0ScomF4KkboBRa9MJAkIjHsqzqT
	yZybmKWvxjZmlQDNMmpBXCifejc9QCs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780437218;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=t497zKpJ9RP89JuMVFrTfv2eopnbEWXvkmOK8hn8BgM=;
	b=z7FBcbQLXuABLzh7dO8EhpdP4ZZ/A2R8nQcYgaTPVtGE0J5jeB9S9p6id9tN2Np2nUcKMS
	r8OxY2OA2s3QO3DA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780437218; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=t497zKpJ9RP89JuMVFrTfv2eopnbEWXvkmOK8hn8BgM=;
	b=cYOpVO5wLA6p/6wwKe0ozgoePiXEP++uU5QAsVE8J90wUqmxi+VYLEb0ur7Pvjg5f5y6eh
	9EZV5ZLdYxmaqi4LXpSyj0TTTa3+MQx0nRLtGlUQ8xS0ScomF4KkboBRa9MJAkIjHsqzqT
	yZybmKWvxjZmlQDNMmpBXCifejc9QCs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780437218;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=t497zKpJ9RP89JuMVFrTfv2eopnbEWXvkmOK8hn8BgM=;
	b=z7FBcbQLXuABLzh7dO8EhpdP4ZZ/A2R8nQcYgaTPVtGE0J5jeB9S9p6id9tN2Np2nUcKMS
	r8OxY2OA2s3QO3DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3A179779A7;
	Tue,  2 Jun 2026 21:53:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yfcpAuJQH2qGFwAAD6G6ig
	(envelope-from <krisman@suse.de>); Tue, 02 Jun 2026 21:53:38 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	Gabriel Krisman Bertazi <krisman@suse.de>
Subject: [PATCH v2 0/3] trivial cleanups to net operations
Date: Tue,  2 Jun 2026 17:53:23 -0400
Message-ID: <20260602215327.1885109-1-krisman@suse.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.79
X-Spamd-Result: default: False [-2.79 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.19)[-0.974];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 

v2 only touches patch 1 to apply the changes requested by Jens.  More
information on the changelog.

Gabriel Krisman Bertazi (3):
  io_uring/net: Avoid msghdr on op_connect/op_bind async data
  io_uring/net: Remove async_size for OP_LISTEN
  io_uring: Drop wrong comment in OP_NOP

 io_uring/net.c   | 30 ++++++++++++++----------------
 io_uring/nop.c   |  1 -
 io_uring/opdef.c |  5 ++---
 3 files changed, 16 insertions(+), 20 deletions(-)

-- 
2.54.0

