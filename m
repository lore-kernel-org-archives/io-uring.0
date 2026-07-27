Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3E85474E
	for <io-uring@vger.kernel.org>; Mon, 27 Jul 2026 00:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785111103; cv=none; b=BgEUqWOK2D5l4Nv9X3/r88M2JvprlJzvEXSOZFnHxz4oeJ50r2enBDB2qSQlcZtxb4BfOTEZXgRgI6Jvsj0c7dGmUUxfLEdfjcoroL+GaiWFqxEPboNTq1Mqn9Jw9WEXbAXwHTSEf4Iggp5hmGyJteZRbM7MJoNpY9BshYgqqp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785111103; c=relaxed/simple;
	bh=CQVyK8rKWL4A+90dEX3HxqP5fyHbai+VnSHecX+/HLM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EMLd68kFOr64w0442PvNdhk8tpZ1+LCR2WSqfyx8ZzqLTlZB4iOqoWX4wA8FYEpoE5sveO1jhthvPjOvQ5fGOMDKVW2dek84AWZjYkDV3DyJpHb5sbUOasBLW6YKlvCr16LRBdiXWqXBWYouYKnRK2DTH3oTJEE3TdFo/lL1bYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VHpnRfBC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TZw9FL8v; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=U5ViiGs5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BF5u8H3c; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VHpnRfBC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TZw9FL8v";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="U5ViiGs5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BF5u8H3c"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E95B5417F;
	Mon, 27 Jul 2026 00:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785111090; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Os4ukqYXAbms1xlSF2PMOV4kInpceqLPNJIIse6GKXg=;
	b=VHpnRfBCrakMu9wrbVV5qohLU1ms28z21RmJvwPmgSmYOxBNBDgAFTGR/gR4WWH/w4XkIS
	Yaz3F/Wl3l6L9K5FcWfmjbEHhjad5b8BwpWfCpBvzeX6/RxBXl9jDUySmpveldCKVf9O0w
	je+U0+2OxZtyKnHJ/oZMqeGZrJIHYAs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785111090;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Os4ukqYXAbms1xlSF2PMOV4kInpceqLPNJIIse6GKXg=;
	b=TZw9FL8vL52rKZFuElfwj/ttRXMWhzuGU8Tlbo1Wq/J7pYQJeWb18luYrCmbXVpkjuM+Rt
	Ao0k/FO1vFUdieBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=U5ViiGs5;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BF5u8H3c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785111085; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Os4ukqYXAbms1xlSF2PMOV4kInpceqLPNJIIse6GKXg=;
	b=U5ViiGs5xWSz6VLiwJikn964wiwn6Fk4lhIKG4/KOguapPf+3HxkkZPyES93Dbu7YfkQKc
	7zGNIi82xk3TzMtrspHiqFkWWbwThsee0/YErZo8gBFqqucdJgr/kLSo78/mGOdDPewo6H
	2IVaq70vQHSVkID3cElLnACPdgg4giM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785111085;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Os4ukqYXAbms1xlSF2PMOV4kInpceqLPNJIIse6GKXg=;
	b=BF5u8H3cbFd3E+Wv+PTJmWQOXuwLy+biSNAasAL1TjoMfj/favEi3o05atP4ZXQJsCGcXq
	otPiu440bwQiycCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 98DFC779B9;
	Mon, 27 Jul 2026 00:11:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +IKuGC2iZmpUGQAAD6G6ig
	(envelope-from <krisman@suse.de>); Mon, 27 Jul 2026 00:11:25 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Jens Axboe <axboe@kernel.dk>, io-uring <io-uring@vger.kernel.org>
Cc: Sung Keum <kambodi127@gmail.com>
Subject: Re: [PATCH] io_uring/net: initialize mshot_len for send
In-Reply-To: <660d1bae-3e03-4ed7-b26b-86e22722e51c@kernel.dk>
Organization: SUSE
References: <660d1bae-3e03-4ed7-b26b-86e22722e51c@kernel.dk>
Date: Sun, 26 Jul 2026 20:11:23 -0400
Message-ID: <87y0excmvo.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Spam-Level: 
X-Rspamd-Queue-Id: E95B5417F
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

Jens Axboe <axboe@kernel.dk> writes:

> Commit:
>
> 6a8afb9fff64 ("io_uring/net: allow multishot receive per-invocation cap")
>
> changed how io_mshot_prep_retry() set sr->len, and added the same
> initialization in io_mshot_prep_retry(). But it neglected to touch the
> send path, which may also uses the mshot retry path. Ensure that
> sr->mshot_len always gets initialized correctly.
>
> Fixes: 6a8afb9fff64 ("io_uring/net: allow multishot receive per-invocation cap")
> Cc: stable@vger.kernel.org
> Reported-by: Sung Keum <kambodi127@gmail.com>
> Signed-off-by: Jens Axboe <axboe@kernel.dk>
>

Reviewed-by: Gabriel Krisman Bertazi <krisman@suse.de>

-- 
Gabriel Krisman Bertazi
