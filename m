Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD74F9E8
	for <io-uring@vger.kernel.org>; Mon, 27 Jul 2026 00:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785111141; cv=none; b=kGEyMDzpRv88GTm+bLSE0bLgv2b8i8bDGiZcfHwXTuMO20PPWVkHV8XE54JClb28e7CT7dZ/uLmvQf4tXhR0fAvzcfP6mUuNCjrpjOxKXcTzUJDkpX9NblJ691/X5EG2i4U+SA2dkdrjArppyJJKerlCbiXKGssNLRYFOnJTh2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785111141; c=relaxed/simple;
	bh=eWasTVal4kY8/UqRXzT0g5VNE+QEIsTmERV/2l89Qwk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZYbUO/rKL8zHxHQiw3y8/MQtdbw6YFNHrGDmhiicpBlg3gHYkc0rdjGlOBbcTnp8CBGM4Cm2Hq8kBcPDm44KQY4mBjhO9I15/Wnf7geTqpdo9+sGqfiV8FBaT9ljjlbHuUriYV0dYL3m8n/bes8C61zMe0mqd91vdJnh+UH8RS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=M9O/oOh8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Vwer7Yyh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CUn7fKFs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6TQh8GYF; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M9O/oOh8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Vwer7Yyh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CUn7fKFs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6TQh8GYF"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6E27D7D867;
	Mon, 27 Jul 2026 00:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785111133; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eWasTVal4kY8/UqRXzT0g5VNE+QEIsTmERV/2l89Qwk=;
	b=M9O/oOh8fzNux1yeEsURSL0nNWFkgyQZlg0WXWHQB9zEInrBTUKxZ8xFAZyyWgWYX90SHI
	RB2vlu8BkUNQ7IuKSqaVOyAfquAdU5EjOrVGUtHxcJGTKZhgFf7sBHXqjw7KJusQKYARbn
	18FQb1noU2v1tmj1/umZSyIXSVUMIRw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785111133;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eWasTVal4kY8/UqRXzT0g5VNE+QEIsTmERV/2l89Qwk=;
	b=Vwer7YyhbCngqqjkLGSfORkHTQAFzjGhCzXQ52zXBztz+CpfLQP1UK8iswB3hGP/L3+F2P
	MNsSceFG13nL9EDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CUn7fKFs;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6TQh8GYF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785111129; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eWasTVal4kY8/UqRXzT0g5VNE+QEIsTmERV/2l89Qwk=;
	b=CUn7fKFsz3PPZytXv+pjS9RpUrQnZs1zjWs8xIyMS6xfrXCuggomQB4O+L49gIaRA6UC7r
	x3Am5H3Qz79CPHkrIN9YnacZnbeXVmvv85cXc8WbslJl1NWJ2xlcfd/P2feRmOIhQJEEGo
	MZErBcPUsTILpyte8/3lIqbkeC3nBGE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785111129;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eWasTVal4kY8/UqRXzT0g5VNE+QEIsTmERV/2l89Qwk=;
	b=6TQh8GYFQnYjaYTgGoUNTMoesmwfU9053eSObn6itYi6XxG2RjoZnUwZZV9KRvlDOAXgm+
	0vPe63pTacQYZcAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1EB6F779B9;
	Mon, 27 Jul 2026 00:12:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Q4VJN1iiZmr2GQAAD6G6ig
	(envelope-from <krisman@suse.de>); Mon, 27 Jul 2026 00:12:08 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Jens Axboe <axboe@kernel.dk>, io-uring <io-uring@vger.kernel.org>
Cc: Sung Keum <kambodi127@gmail.com>
Subject: Re: [PATCH] io_uring/kbuf: cap buffer selection length at MAX_RW_COUNT
In-Reply-To: <aa826e79-ddc5-4a82-9863-a5edfdce709f@kernel.dk>
Organization: SUSE
References: <aa826e79-ddc5-4a82-9863-a5edfdce709f@kernel.dk>
Date: Sun, 26 Jul 2026 20:12:07 -0400
Message-ID: <87v7a1cmug.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Score: -4.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 6E27D7D867
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.98%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailhost.krisman.be:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,kernel.dk:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Jens Axboe <axboe@kernel.dk> writes:

> io_ring_buffers_peek() builds an iovec array from provided buffers, and
> that in turn can be handed off to a lower level provider. Be prudent and
> cap the total size to MAX_RW_COUNT, which is the Linux default for how
> much IO do to in a single call.
>
> No bugs here, but it's a good preventative measure to avoid truncation
> issues.
>
> Signed-off-by: Jens Axboe <axboe@kernel.dk>

Reviewed-by: Gabriel Krisman Bertazi <krisman@suse.de>
