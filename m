Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6094541E70;
	Tue, 22 Sep 2026 22:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790114759; cv=none; b=BkHukWw+1U03uGR7WQAWAy5FC9y4C54yireOhDGfR4/dmb4RQv9+iqCGgpSQFuvs3GpJI3o5oZuqP7gXfyzCzWKZowmFSxi5LqLE3aiixqy+4lvVVPnqcXPzyiQfMv8T8mwCsx/KLAW+BLxZMJ/1xOmfbqNK/kc6zQoKkzyJ5Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790114759; c=relaxed/simple;
	bh=RApttsCvYha03Lnki3mshCe/2wDbnmPkj501A898CtY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dWaU68J6pc5dsPQYkbx2X235irpAKHiJbxmaevDSjP0GIGP4UwnGQzPpyYpmFoh2Fy3Vw0rvXmE5az9/tWEMRih09QHARhEoaRWb7Z57EOkJ87eoqRlH+rk1c938ftUr6Faf4iVaoV9tyn1VL1pkohHI8mRNOiDcqNCvj1XipMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HgT3p/Q5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/jO71TvP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=quCjMDIb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9pk6tom4; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HgT3p/Q5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/jO71TvP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="quCjMDIb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9pk6tom4"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1C68C21DB8;
	Tue, 22 Sep 2026 22:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790114742; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/idt+sdxH5E3LRbrlK4aNJgvUW7z3jw27sNns8vVE/U=;
	b=HgT3p/Q5sqm61XXBpEUIgzzB7Ls/zQyb5MZzk24R0tXGY7WjBkvGSq75TjW6sUUDkNDcdK
	PaUN25psfhIuXOh36xvLrn6z3i8vdBUGQUCATIlQUpbyK+8LpvWsvI2ew8CGYOAqKFQ3AS
	n1eIzUhY7LKB/sX7GfExaqpz5NzSPow=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790114742;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/idt+sdxH5E3LRbrlK4aNJgvUW7z3jw27sNns8vVE/U=;
	b=/jO71TvPWzmtdAT/UkMKZV0GrG3c9HZgCHe/zEOPcNgUIe8bT1NV0hfCB4YaCtG3HCbYHy
	pN3xLd8QC0ga0MCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790114738; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/idt+sdxH5E3LRbrlK4aNJgvUW7z3jw27sNns8vVE/U=;
	b=quCjMDIbpkNxr60txU8UnKbZsy/fG9P2YANt1iziCXL5FS5k6o4Cc/MabAfPuIjGNUego8
	b0HDvxEBONkrkpotZ8iq+usyuoohMW6dYo6+vh5bQq1OyHWaCU5b3wzjoudTJdx/0qSjkt
	0gd6XMMhXysYwn2qMsbAIJOlSKQ+q/8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790114738;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/idt+sdxH5E3LRbrlK4aNJgvUW7z3jw27sNns8vVE/U=;
	b=9pk6tom4Muc/Koaljtd1EOywH7TPs3I1JanAL5Z6PVIuSV3CwdiVj/v6Y7BiYRtZ3l6AH2
	iGd2dLUEKE6Y97CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8F256132D3;
	Tue, 22 Sep 2026 22:05:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9zMiDrH7smp9HQAAD6G6ig
	(envelope-from <krisman@suse.de>); Tue, 22 Sep 2026 22:05:37 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 tglx@kernel.org, mingo@redhat.com, peterz@infradead.org
Subject: Re: [RFC PATCH 00/15] io_uring: thread identity handoff for
 blocking inline issue
In-Reply-To: <54310fb2-d4b0-4b97-bc07-68e27e462b29@kernel.dk>
Organization: SUSE
References: <20260911154148.644489-1-axboe@kernel.dk>
 <87tsnv1ynh.fsf@mailhost.krisman.be>
 <54310fb2-d4b0-4b97-bc07-68e27e462b29@kernel.dk>
Date: Tue, 22 Sep 2026 18:05:35 -0400
Message-ID: <871pal0wnk.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Level: 
X-Spam-Score: -4.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[]

Jens Axboe <axboe@kernel.dk> writes:

> On 9/11/26 11:33 AM, Gabriel Krisman Bertazi wrote:
>> It has the downside of still requiring fixes to every path and we need
>> to handle every new case that comes by, but it is much cleaner than
>> plumbing a nonblock flag several layers down the stack across each
>> subsystem or having subsystem-specific details in io_uring, which is
>> what we have today.  On the upper side, it is much less complex than
>> your approach. It also allow us to just back off during memory
>> allocations that would block, solving the memory allocations anywhere in
>> the submission path, not only inside ->issue(), which we discussed
>> recently on discord.
>
> I think you'll find it'll be a lot MORE complicated than my approach!
> Backing out error handling is going to be impossible in some cases,
> think file systems for example. How would those cases be handled?

I understand there are many cases where it would be impossible, most, if
not all of them, involving FS.  But I naively imagine we could back-off
those early, before we get to the critical session, without even trying
the nonblock approach, similar to what we do now, and punt to the io-wq,
which is not going away anyway.  What I'd like to solve is drop the
logic of other parts of the kernel that we need to keep in the io_uring
layer, such as which network protocols will block and which won't.

It is a hard sell, yes. And it does gives off vibes of re-editing the
PF_MEMALLOC_NORECLAIM controversy. Long term, though, it would be much
better for the kernel that can reliably handle failure and back-off than
keep going, including for predictable performance.

-- 
Gabriel Krisman Bertazi
