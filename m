Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5D54014A9
	for <io-uring@vger.kernel.org>; Wed, 22 Jul 2026 18:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784744700; cv=none; b=iBD9PxGwf7Al86MG2aI90ROp/lL+otzbMqTDq9N48S5+YSknAQHNhdAX/BFMURTkD297mLUEX9U7EgwwX+UEavvDnZ10c8W6e9JPx/o3nuCejoLYBTS0RNpyT5SfPBxduhiZJavm+UHOtX/+0Km0qLftpWLDI3sofYnVRqG3ptM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784744700; c=relaxed/simple;
	bh=xG610kS4xadmL/xvYd242jlQy2DdtCsCNqaxrxygfQc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JnJVtfanNcUZncU9bU7oCY9AuoEO5PBpOMR/EMy9BKnGVIQmIJX5MRox8rlZWYt2hcmjAHh+/p+yB2v7Vy/zP3Uhaano1mfQUvYOPX2El6FDi4weqwkKeyf59VJQh6LpL8YHrR3lanX2xBMwxOtnV8r6L+DVFJgAEEybPhgevo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vmb3c1kB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OpPBZ83j; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vmb3c1kB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OpPBZ83j; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vmb3c1kB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OpPBZ83j";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vmb3c1kB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OpPBZ83j"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ECFE57AC19;
	Wed, 22 Jul 2026 18:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784744697; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZiBiugqbzHyaAgRk+x5/yjPY/Gi05hBBPGp9knwzbwM=;
	b=vmb3c1kBDtxMrNe0cniaMqIVHOKdwvOMEJCDN0pswOtDSDbp68ByRY+TjxPQJ+pqw8GbDg
	mw2SzQQpQvgYQo4f/1HCcSKWbV9nY7ixtbEF2HkhtWgVmnHO+w+ZR6J74Oa8pBIcY4ukd/
	RrgAi4zj5gT8bBJUNecjaziPWeJilZg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784744697;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZiBiugqbzHyaAgRk+x5/yjPY/Gi05hBBPGp9knwzbwM=;
	b=OpPBZ83jLv/i0kX0ArN9OOuKGMnr6Aq09B4QjPa+P5gBBatUQ66tqhVIMslwR32RAbC6Cp
	9U6E44ocoabZ8HDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vmb3c1kB;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=OpPBZ83j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784744697; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZiBiugqbzHyaAgRk+x5/yjPY/Gi05hBBPGp9knwzbwM=;
	b=vmb3c1kBDtxMrNe0cniaMqIVHOKdwvOMEJCDN0pswOtDSDbp68ByRY+TjxPQJ+pqw8GbDg
	mw2SzQQpQvgYQo4f/1HCcSKWbV9nY7ixtbEF2HkhtWgVmnHO+w+ZR6J74Oa8pBIcY4ukd/
	RrgAi4zj5gT8bBJUNecjaziPWeJilZg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784744697;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZiBiugqbzHyaAgRk+x5/yjPY/Gi05hBBPGp9knwzbwM=;
	b=OpPBZ83jLv/i0kX0ArN9OOuKGMnr6Aq09B4QjPa+P5gBBatUQ66tqhVIMslwR32RAbC6Cp
	9U6E44ocoabZ8HDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC460779B0;
	Wed, 22 Jul 2026 18:24:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6cI2I/gKYWrWUgAAD6G6ig
	(envelope-from <krisman@suse.de>); Wed, 22 Jul 2026 18:24:56 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org
Subject: Re: [PATCH liburing 1/2] test/send_recvmsg: Preserve msghdr until
 op_recvmsg completes
In-Reply-To: <20260722181710.79099-2-krisman@suse.de>
Organization: SUSE
References: <20260722181710.79099-1-krisman@suse.de>
 <20260722181710.79099-2-krisman@suse.de>
Date: Wed, 22 Jul 2026 14:24:55 -0400
Message-ID: <87ik66evbc.fsf@mailhost.krisman.be>
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
X-Rspamd-Queue-Id: ECFE57AC19
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Gabriel Krisman Bertazi <krisman@suse.de> writes:

> msghdr is allocated on the stack at recv_prep, which means it may go out
> of scope before the kernel has a chance to complete the operation.  This
> results in spurious test failures when we reach far enough into recv_fn
> to reuse the stack space before op_recvmsg executes.  I found it easily
> reproducible when compiling with '-O0 -g3' to avoid gcc from optimizing
> further local variables out of the stack.

In hindsight, I should clarify that by 'test failure' I mean a
segmentation fault in the testcase, not a T_EXIT_FAIL. Should have put
that in the commit message.

-- 
Gabriel Krisman Bertazi
