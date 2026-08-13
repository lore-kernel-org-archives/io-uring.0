Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A081D2EBBA1
	for <io-uring@vger.kernel.org>; Thu, 13 Aug 2026 00:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786581647; cv=none; b=J/dpi/OnzShR5kWq7tQTGBZK7CdF2S/IKxt3MsyAVZ7tJYbuaaYPZa3CtCAmUoy7vOoICCdhHYII2VZ8Ja2/B3bjOX864LinUTXwZAZ4xLNmCm147vGuDoZBkfSx36UN7XxhV1/pBu6KN4wZ62+t88tIB+3Zhx3UeRZQmhOqr7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786581647; c=relaxed/simple;
	bh=tVWP7RBOm09e/LDycCpAuTs3ddwK/VTsoBE7Q8809Ds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hLnk99s9h755SgKFrw+x5l8fWwKufs5Cf527QJMGwH2OIKjk3NXUG3RubWfRIZEPGJiz0IYeFus/zlSxg5sA2/5YWDo5C9DL18p8JPTCHrPNAJq6U7Oh4Pb5ja8qFRnxEfqNkDbNlsQV2qirza397pKkAhJ0InLrw64SdION0yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Hy9NJa0f; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7ApCGjch; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rtXquCTo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DyeiYOxM; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Hy9NJa0f";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7ApCGjch";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rtXquCTo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DyeiYOxM"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 92E3C82682;
	Thu, 13 Aug 2026 00:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786581640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=coIsHuPyIWjPZAGBfWznl6uWK9lLMGu3Sb+3BWdo+Js=;
	b=Hy9NJa0fec8xJF2LlUCAWfIzxzHOIMvL1F0ixvwmSj4RAGtIDN+DSJ60JIzjF/Rzv+47D7
	OsgRBGV9kHZaP+mHVbEK5y+yCzmCw6WhLA/Hn3Cysc1jtXc+cIiF7zYEOJ9Kpotb8g6x/2
	CVNTW3qYSBooGAaU94L2KPlEy3OVta0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786581640;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=coIsHuPyIWjPZAGBfWznl6uWK9lLMGu3Sb+3BWdo+Js=;
	b=7ApCGjchrW0engyj/YiwB0amo/TPl0Ia+aSQbmnrcahvOM+YzaYsYbNkJoDV8LNU0NP4jQ
	9o5Ev3jITLW07ZCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786581636; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=coIsHuPyIWjPZAGBfWznl6uWK9lLMGu3Sb+3BWdo+Js=;
	b=rtXquCTobnPU9nlRqMQq2Newup7C3tfhrCJ9mjOGvlMh/SrfizDP9DVVxWetVdCnI5++py
	+vaixI3EmU5q8O6G5F0OMl+mkG+I8FbR+b+7kjqWvvdp28HiDFvwnEu4wuVdGMGOK0+GKW
	nY3Qfxi8GuZycSL1+5onBDUASKxbuF4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786581636;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=coIsHuPyIWjPZAGBfWznl6uWK9lLMGu3Sb+3BWdo+Js=;
	b=DyeiYOxMq9OeCk9/OlOfCtecq/Yk8fznBe9efexwKSsuRxNsTTLnfkk6RbAkBiA8nUqXuT
	9AOnN5dUrWXYfhCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 55A7477B3B;
	Thu, 13 Aug 2026 00:40:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id F4BLCYQSfWqvUgAAD6G6ig
	(envelope-from <krisman@suse.de>); Thu, 13 Aug 2026 00:40:36 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	Gabriel Krisman Bertazi <krisman@suse.de>
Subject: [PATCH 0/3] Continue iovec api clean up
Date: Wed, 12 Aug 2026 20:40:19 -0400
Message-ID: <20260813004022.3514537-1-krisman@suse.de>
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
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
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

I found the first patch in an old branch and took the opportunity to
find another (i think the last) case where the same pattern of directly
copying the iov existed.

Tested with liburing.

Gabriel Krisman Bertazi (3):
  io_uring/rw: Drop custom iov copy in io_iov_buffer_select_prep
  io_uring/net: Drop custom iov copy in io_msg_copy_hdr
  io_uring/net: Drop ddir argument from io_msg_copy_hdr

 io_uring/net.c | 75 +++++++++++++++-----------------------------------
 io_uring/rw.c  | 24 ++++------------
 2 files changed, 27 insertions(+), 72 deletions(-)

-- 
2.55.0

