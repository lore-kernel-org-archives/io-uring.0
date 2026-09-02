Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE75F4AFE09
	for <io-uring@vger.kernel.org>; Wed,  2 Sep 2026 22:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788388922; cv=none; b=g70mHmYubQLTY2nm6rCIbpJkncYA13fmglEqc+HQKILYP0zL0Poh8jXI+iZVkhFvCsRSzVV9HG5Q+jo4J8hc8BBlqugjX8F/gTQMc/9un78u0mOtJOTAVyPJkbrClK9VpDN1c4iX26T/g9RXbW8rSwLXmXTP2pDDdcYx8Bhn9A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788388922; c=relaxed/simple;
	bh=J8UBHzfFwYm3BVIYlynoze/y6tinKIDzOO8DXUOUzjw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kK8jaaz9hsjLc5vws2BDiEU4zEl8mHWSxDmB14Wm+k61nHnVLp5wga+3jooPdnUxZOHDDxu7yOPXBtl+CYMMkhaXi47uFpynndEL5doZVbz4Ihu3/f+9dqANxX4BYHyJa0p/Ve1DxEauC82RJ1zI0H9XLgk8KkcFqNVAidefQ0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PyakWI26; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pBkaaihM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=losQW4fF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rgCsVabc; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PyakWI26";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pBkaaihM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="losQW4fF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rgCsVabc"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1A4A91FAB1;
	Wed,  2 Sep 2026 22:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788388905; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G4BXTeuwXuB50gyleE+gvE5rU5OPpGWaSYOx/TRoMO4=;
	b=PyakWI26AzWlJNtcHn+cNTlaR+kO6JdTgEGpOSUjJXXg9Z0sXoYqLruU0sGPLe4s0YolUV
	A5fC9onye5W+AwpXfHcM/HIICYGOB1AxVazwwFa4+O7g4GbHEHi3ygdqirm4jHSl4qNBqw
	AZbn4O6b2joG0XZ5pbfMUUvnrp1wgVM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788388905;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G4BXTeuwXuB50gyleE+gvE5rU5OPpGWaSYOx/TRoMO4=;
	b=pBkaaihMFLp+/bGuDuSG8oYXz2o9VI86Qpced2DrmmpYOIqAAo7Jn6EZf3eti07U38OHyl
	tbLxLSj1b2LW2fBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=losQW4fF;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rgCsVabc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788388901; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G4BXTeuwXuB50gyleE+gvE5rU5OPpGWaSYOx/TRoMO4=;
	b=losQW4fFVOdP9pv86v3JDHAkX9T8cIsASeZASy7LIM+fD2aMPG4KnryfGm36M0mePfKB4L
	BwY2iwtTzZBZ0s9lGzeIw4e2CXXhgHpTXBtN+jCi9xamXsA+bx30ExlmcD1eEQUsvbe72G
	R1+5pMLbn81ShoMyHhNamfU4RmDiGE0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788388901;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G4BXTeuwXuB50gyleE+gvE5rU5OPpGWaSYOx/TRoMO4=;
	b=rgCsVabcqorWxAx5dawTQvgLfa34HKfz9IyPAIvnZG+wuGSRxoxr+vQbiAd5Qaefe+poU6
	2Wj8pFbBVM6sm1AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 796FD136E6;
	Wed,  2 Sep 2026 22:41:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FJz8DySmmGqodgAAD6G6ig
	(envelope-from <krisman@suse.de>); Wed, 02 Sep 2026 22:41:40 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org
Subject: Re: [PATCH] io_uring/futex: Recycle ifd on failure
In-Reply-To: <79a23f41-0263-435e-91c7-477d742c95f9@kernel.dk>
Organization: SUSE
References: <20260902172717.1073059-1-krisman@suse.de>
 <79a23f41-0263-435e-91c7-477d742c95f9@kernel.dk>
Date: Wed, 02 Sep 2026 19:41:37 -0300
Message-ID: <87tso75l9a.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 1A4A91FAB1
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,kernel.dk:email];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -4.51

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
various objects.  I'll send those as part of a larger series.

-- 
Gabriel Krisman Bertazi
