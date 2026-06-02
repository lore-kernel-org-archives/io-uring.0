Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5CD175A79
	for <io-uring@vger.kernel.org>; Tue,  2 Jun 2026 20:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780430611; cv=none; b=FxHyghlRR5pwPAPUyJ5cJXKL10ATDS8h/VQq9Nab/zKkfVLyV6a3n9JSrdC6GRANkzZofmboMotaXXUibjVmjvs1s+fF7Wh8kRZW3cizZl16FzGoTu+BrFAHesgIH/R+XMxI7nvhNS85wN3r7e+12mb9cPbKsS+3VwVSOC0C7XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780430611; c=relaxed/simple;
	bh=H8om9NmZJXaIEx1Vmi26eCcpd0CSnDOckiSh1WGIL/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S99LPYow3leG6v/C0LSMfNpD/hv5SzgW3X7t4Ayloufoq40brS8YOP0/fGVSkTJ3gMiHiZibpQps24hi3UtpCx2iHoAgfj/kMhy4F212Q8MWn37k1uGZk5GUCij94h9ItxsOVkqK0tI54eUPoOWtgLJj853ns0VB1NnZ32h23bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uD1b7mnO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=E4b63943; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uD1b7mnO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=E4b63943; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uD1b7mnO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="E4b63943";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uD1b7mnO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="E4b63943"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BBA9A6AA7C;
	Tue,  2 Jun 2026 20:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780430608; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Nx04XYNRaxN3FBRGiXr2vjB8O5Hdpp8SjFI+UstssoA=;
	b=uD1b7mnO1Y391dvA+DpWEicxzarAPiO9ql72ufesk9M6bSI5AjAkSwZENuYEB6zLYZl6uT
	bpf2N3zl4KV+89ah6Lgxp7qMvtPdf85iS4iRzFFkzzjHWZwZ2pTUaDKptdzSO+WqxGR+aM
	74Dctsj55XeUw1pBwekt7Ab5bjGVFdU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780430608;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Nx04XYNRaxN3FBRGiXr2vjB8O5Hdpp8SjFI+UstssoA=;
	b=E4b63943xg/4y7Wt98hdICdmmqENeD7TWdv4v4G23rhcNdgSqDH3N6OqqN/pTHGd1Alpml
	oOLYIJHSpjHjkPAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780430608; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Nx04XYNRaxN3FBRGiXr2vjB8O5Hdpp8SjFI+UstssoA=;
	b=uD1b7mnO1Y391dvA+DpWEicxzarAPiO9ql72ufesk9M6bSI5AjAkSwZENuYEB6zLYZl6uT
	bpf2N3zl4KV+89ah6Lgxp7qMvtPdf85iS4iRzFFkzzjHWZwZ2pTUaDKptdzSO+WqxGR+aM
	74Dctsj55XeUw1pBwekt7Ab5bjGVFdU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780430608;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Nx04XYNRaxN3FBRGiXr2vjB8O5Hdpp8SjFI+UstssoA=;
	b=E4b63943xg/4y7Wt98hdICdmmqENeD7TWdv4v4G23rhcNdgSqDH3N6OqqN/pTHGd1Alpml
	oOLYIJHSpjHjkPAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6A5E7779A7;
	Tue,  2 Jun 2026 20:03:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hrVkDhA3H2pDMgAAD6G6ig
	(envelope-from <krisman@suse.de>); Tue, 02 Jun 2026 20:03:28 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	Gabriel Krisman Bertazi <krisman@suse.de>
Subject: [PATCH 0/3] trivial cleanups to net operations
Date: Tue,  2 Jun 2026 16:03:12 -0400
Message-ID: <20260602200315.1761983-1-krisman@suse.de>
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
	NEURAL_HAM_SHORT(-0.19)[-0.973];
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




Gabriel Krisman Bertazi (3):
  io_uring: Avoid msghdr on op_connect/op_bind async data
  io_uring: Remove async_size for OP_LISTEN
  io_uring: Drop wrong comment in OP_NOP

 io_uring/net.c   | 15 +++++++--------
 io_uring/net.h   |  4 ++++
 io_uring/nop.c   |  1 -
 io_uring/opdef.c |  5 ++---
 4 files changed, 13 insertions(+), 12 deletions(-)

-- 
2.54.0

