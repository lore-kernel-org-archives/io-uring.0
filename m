Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528BF4B0C9A
	for <io-uring@vger.kernel.org>; Wed,  2 Sep 2026 22:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788388895; cv=none; b=TKSkGWFuzQQt4xq+TNjKpoMPQSK1SYL0ClyVrraPZMow7kAgDN01yvVeSBLowS4R+geHz+xPTvq1MAKhurR8+DmDkLvfA9J/XH5di9JLCWL36QqD7QNvyCxso1TJBicg7dMoM8syU7mx3Wyi0i6dDgUJQkOasRKvTTls9R0JbOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788388895; c=relaxed/simple;
	bh=XUOAMYkxnKfwQcAn7EQZZXUoyiwi/O/pJRIyIhXSWys=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Eu7Mc3yecELCPs3MBTLaNRZxrkg6fvgQNzxyPcZSCHq4QZnQCw2jJ8tXbH7ObkmZ+lnT8GFulVUWrJm1HTZyGF+OxLqCgy9z+UNrK/X4WGvsX+PYTKAbl35aMcfu+2UN8K8mXeYGXUCvP4v17WC1QYbz2r8d+eih1oPJeDVg8LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pfSA8b20; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hTaVQCRn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dhitXCHn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=durtZfBY; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pfSA8b20";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hTaVQCRn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dhitXCHn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="durtZfBY"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7E70121D62;
	Wed,  2 Sep 2026 22:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788388884; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vZAQLpEqi5pK7+tx+m3Nmv84bnUTO8ibxpjlJsEANeE=;
	b=pfSA8b20Ke9LzfL5BArjTSNz40qdVLRvNmMmyhMoMOb9Q24cUHhLYL7lMjo5g0WLCWFxNB
	eCQLOyB8ISwuEclCXCrVWCIhhCNvgtM2HNc4lGo4qoTOncFYn665B2ihkLpEhHH0AcH1Kh
	JpsMg98O8tR0LYxvtuHrqPpR01Ll9pE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788388884;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vZAQLpEqi5pK7+tx+m3Nmv84bnUTO8ibxpjlJsEANeE=;
	b=hTaVQCRn7TADvb1HF3OWRCypFuvV3ejLo8MOB6YgZAyTjL7fH0QJY1s7EqwdNqKHxizSGc
	ob3za2p5mobX/gDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dhitXCHn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=durtZfBY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788388880; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vZAQLpEqi5pK7+tx+m3Nmv84bnUTO8ibxpjlJsEANeE=;
	b=dhitXCHnYwuGXRqPTMgY8A25w+h16+nddINt6W9POFtnC6aUi94E50uskoScG4AWtlVI8v
	+XaeKYthS5QHXsqfcvAizcXbDkjQmT7zVD24QPenoh3+ldIXIQWPqQc8N4B7ExJ1zUixTt
	dcKVqGw4gEbiS4kZfHS0EAS1hz/CI8Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788388880;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vZAQLpEqi5pK7+tx+m3Nmv84bnUTO8ibxpjlJsEANeE=;
	b=durtZfBYBFUazgS2e5mUJxJwEqPGy0Hs8nLlsqoF34g1Fu8dhXZWBYCyMg++rtWNv+dojV
	g+ZoTmbcu4a1QeDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C1CA9136E6;
	Wed,  2 Sep 2026 22:41:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id N+QrHQ+mmGp7dgAAD6G6ig
	(envelope-from <krisman@suse.de>); Wed, 02 Sep 2026 22:41:19 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org
Subject: Re: [PATCH] io_uring/futex: Recycle ifd on failure
In-Reply-To: <79a23f41-0263-435e-91c7-477d742c95f9@kernel.dk>
Organization: SUSE
References: <20260902172717.1073059-1-krisman@suse.de>
 <79a23f41-0263-435e-91c7-477d742c95f9@kernel.dk>
Date: Wed, 02 Sep 2026 19:41:16 -0300
Message-ID: <87v78n5l9v.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Score: -4.51
X-Rspamd-Queue-Id: 7E70121D62
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kernel.dk:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

Jens Axboe <axboe@kernel.dk> writes:

> On 9/2/26 11:27 AM, Gabriel Krisman Bertazi wrote:
>> The failure path doesn't recycle the ifd on FUTEX_WAIT for no good
>> reason.  If we move the free above done_unlock, we are even already
>> holding the submit lock.  Recycle it.
>
> Does it matter? For performance, it should not, unless you have a
> benchmark that deliberately ends up with futex_wait_setup() failing.
> Any normal/fast path will have all of these succeed.
>
> Is the motivation just to unify the cleanup, or..?

Because recycling is good for the world :)

It is a cleanup.  A todo in my list is recycling objects as much as we
can. for instance, in the generic cleanup path we could be recycling for
various objects.  I'll send it as a larger series.

-- 
Gabriel Krisman Bertazi
