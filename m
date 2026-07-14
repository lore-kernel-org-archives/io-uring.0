Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630C9494A10
	for <io-uring@vger.kernel.org>; Tue, 14 Jul 2026 16:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784045735; cv=none; b=crlijX6yGHju7u9LhrEs7QKu6LOGET5DkbXm+mfuO5tbceoZoYgGTv4Xfmm792nAfv7WLqZ0u4lPgYB6qRXKgq6lf4gAO/M3Z2b9FLCwcBxlvD7oUy1BpCgMp/lHdhXhfdl8Q1inF9TKvDoWu9Lk+qKlGcDt3hW5c1bBUPp4tsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784045735; c=relaxed/simple;
	bh=I4CQ65pBH54WLM8RSnGQraY0QfSwJeDB7rTdSfy1WRs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kwC09wI1OzOmdf0ZhN2uPhdFuqviScddlEMJEQAkh6lM2vQsc3ns+C7xHRvyXRnG79Cx3FcXiKW81zN5kR1U8BlQ/znBFh3j4QtM7tWKj8J7dYsygP55zdvRIrkadkBDB77khB1znkYkfZFlsQcRC5sBYW/s0gi9125Svk/s1sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Rl+drM1r; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5K3e2B02; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Rl+drM1r; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5K3e2B02; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Rl+drM1r";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5K3e2B02";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Rl+drM1r";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5K3e2B02"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 724E77628B;
	Tue, 14 Jul 2026 16:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784045732; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=afemb1uTReflIPzeG+G0BdtppEJe6zSdsHUliPdgd4o=;
	b=Rl+drM1r3R8ygdILIskHSNSh0811obZzs3X1GSfDVuHGE6OdEGZMSTFfMj2Y8cj3prY8Vd
	MkS8MmmBDQMCS46kjj5zwhT51HWh9H4g8I47Hb/0sZHOP3SzMvrMS4ycHsR26cTLsOpBuy
	NzGzQkGFSQva3dueGzFUObeakZeXEyI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784045732;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=afemb1uTReflIPzeG+G0BdtppEJe6zSdsHUliPdgd4o=;
	b=5K3e2B02MydPjQIxOGjBE4WLNf2xFvOxglVX1BfD1IXlrttRcHYMKB35sITTtgQJhcSsin
	MqaLd5HYktai/JCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Rl+drM1r;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5K3e2B02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784045732; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=afemb1uTReflIPzeG+G0BdtppEJe6zSdsHUliPdgd4o=;
	b=Rl+drM1r3R8ygdILIskHSNSh0811obZzs3X1GSfDVuHGE6OdEGZMSTFfMj2Y8cj3prY8Vd
	MkS8MmmBDQMCS46kjj5zwhT51HWh9H4g8I47Hb/0sZHOP3SzMvrMS4ycHsR26cTLsOpBuy
	NzGzQkGFSQva3dueGzFUObeakZeXEyI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784045732;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=afemb1uTReflIPzeG+G0BdtppEJe6zSdsHUliPdgd4o=;
	b=5K3e2B02MydPjQIxOGjBE4WLNf2xFvOxglVX1BfD1IXlrttRcHYMKB35sITTtgQJhcSsin
	MqaLd5HYktai/JCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2331C779AE;
	Tue, 14 Jul 2026 16:15:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TGVNOKNgVmqKBwAAD6G6ig
	(envelope-from <krisman@suse.de>); Tue, 14 Jul 2026 16:15:31 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Prateek <kprateek283@gmail.com>, io-uring@vger.kernel.org
Cc: axboe@kernel.dk, Prateek <kprateek283@gmail.com>
Subject: Re: [PATCH 1/2] src/queue: don't swallow -ETIME when SQEs were
 submitted
In-Reply-To: <20260712221049.534729-1-kprateek283@gmail.com>
Organization: SUSE
References: <20260712221049.534729-1-kprateek283@gmail.com>
Date: Tue, 14 Jul 2026 12:15:30 -0400
Message-ID: <87fr1l4kf1.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.dk,gmail.com];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 724E77628B
X-Spam-Score: -4.51

Prateek <kprateek283@gmail.com> writes:

> If _io_uring_get_cqe() submits SQEs and then times out waiting for
> completions, it returns the submit count instead of -ETIME:
>
>   1. The first enter submits the SQEs; because submit > 0 the kernel
>      returns the submit count, not -ETIME, and it is stored in err.
>   2. On the next iteration the has_ts shortcut wants to report -ETIME,
>      but the 'if (!err)' guard sees the non-zero submit count and keeps
>      it, so -ETIME is dropped.
>
> That contradicts io_uring_submit_and_wait_timeout(3) and
> io_uring_wait_cqes(3), which document -ETIME on timeout.
>
> At these two sites (lines 113 and 118) err is only ever 0 or a positive
> submit count. A negative error from __io_uring_peek_cqe() or a prior
> enter breaks out of the loop before reaching here. So the change is
> functionally equivalent to dropping the err condition entirely; we change
> '!err' to 'err >= 0' so -ETIME is successfully synthesized whenever no
> CQE was seen.
>
> The guards were added in 2f61e849 ("src/queue: don't wait twice if
> looping in _io_uring_get_cqe()") to carry the submit count across
> iterations for the partial-completion case (got some CQEs, no error);
> that case still returns the count because both sites remain guarded by
> !cqe.
>
> Signed-off-by: Prateek <kprateek283@gmail.com>


Reviewed-by: Gabriel Krisman Bertazi <krisman@suse.de>

-- 
Gabriel Krisman Bertazi
