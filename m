Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C66395AF0;
	Fri, 25 Sep 2026 19:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790365388; cv=none; b=kMt2aMLblvuZM+1lK499W5oZmTqYOVOKKkuvoiTZ6igs7x0WJjEwqqZQG0WVBlFP4VSs5OPlrRRcR4v70lzlPZgVLxCNjs6mgYIAPkDYrQlqwdzHejsmvpU7gcb411mLONlsXyBF+Zyug4BDklZGkBL5uQ5l1ifd3OEolabnFv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790365388; c=relaxed/simple;
	bh=SJ7IJ7GJ+AoefIfvafr/HiupVw1ODCxgXPBKnuitgss=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=j8aIKzaW1CKOI4JUgehpn2z2w9HeUePPkNhO0uq5RnhRSYyEEZ3YlqfYTNzrzQvUblCTuy43gBD3OA+LcM4JBz9EI74ofaP7iF6anW5B0EW5uNW0oyGA66ApYJ+bHUzYqNwFfaGMg5Bq2SRIE0V2vn30uVy780LV/8egESBz+Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=foQvcMvh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cyc/sPs7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Btj40VuR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hve9HCwY; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="foQvcMvh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cyc/sPs7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Btj40VuR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hve9HCwY"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 55BDA1F388;
	Fri, 25 Sep 2026 19:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790365380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Aehel2drv8Soy4wmnRsMRnnKuR2/R9gych/XhpDwjp0=;
	b=foQvcMvhutQ97LXCyUo/GslCR85heFVvH28oA/9xoyVKyon3tncWFspEheH5BHZcKg9/K9
	kcBM4fsXVFMv2kDQrPB4nURi/nOEPncFm9kV48i9eY9QiXoN/+qHig27bz50dy7/Gvzj2u
	3NyTFPlYiT4ewPpqbZMMTZ/3kyWVHm0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790365380;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Aehel2drv8Soy4wmnRsMRnnKuR2/R9gych/XhpDwjp0=;
	b=cyc/sPs7dWHkZdF+Hd8/pquWtlQ2ABvZMe3MzfbtE6SuHiN10+EXdhRzsmmXBusf9UCg9p
	AsLkgmhM6chjxECg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Btj40VuR;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=hve9HCwY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790365376; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Aehel2drv8Soy4wmnRsMRnnKuR2/R9gych/XhpDwjp0=;
	b=Btj40VuRRP/Ih68p6bSiT+i2PHQXMiDCKaT3wUyT16jO7NObAfj2Rk9PY9n1B0VrtL74mz
	LZFVoPwhB9Aum7SgRzjzt+azvrw5IandxqLMizGwf26ptUqXlbZ3ROcQC2zLIUrPRwi9QX
	amPU6HEZ+li1FnwhErq3MU6h2aK0vIc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790365376;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Aehel2drv8Soy4wmnRsMRnnKuR2/R9gych/XhpDwjp0=;
	b=hve9HCwYWAJjjV7oiHZiIh13uyBjprDZOKVhPvWHwPX7k2Q9otnx8wm++w+2AqqEy15uZ4
	jLs9a0nixz4QDyCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EC84813274;
	Fri, 25 Sep 2026 19:42:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oKrkK7/Otmr2NwAAD6G6ig
	(envelope-from <krisman@suse.de>); Fri, 25 Sep 2026 19:42:55 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Uzair Beg <uzairbeg11@gmail.com>
Cc: io-uring@vger.kernel.org, axboe@kernel.dk, asml.silence@gmail.com,
 lin2530632123@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 3/3] io_uring/rsrc: prefill the node cache when a
 file table is registered empty
In-Reply-To: <20260925163916.524653-1-uzairbeg11@gmail.com>
Organization: SUSE
References: <87fqza1imr.fsf@mailhost.krisman.be>
 <20260925163916.524653-1-uzairbeg11@gmail.com>
Date: Fri, 25 Sep 2026 15:42:46 -0400
Message-ID: <87cxu1yv61.fsf@mailhost.krisman.be>
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
X-Rspamd-Queue-Id: 55BDA1F388
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.dk,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,mailhost.krisman.be:mid]
X-Spam-Flag: NO
X-Spam-Score: -4.51

Uzair Beg <uzairbeg11@gmail.com> writes:

> Gabriel Krisman Bertazi <krisman@suse.de> writes:
>> Does it make
>> sense to pre-allocated up to 192KB in memory for short-lived
>> applications that might use only a couple of those nodes?
>
> As a default, I don't think it does. Would it be acceptable to drop the
> prefill and only let the node cache capacity follow the table size,
> capped?
>
> Nothing would be allocated up front beyond the pointer array,
> so registering a large table and using a few slots costs almost
> nothing, and nodes are only retained up to what the application
> actually had installed. That gives up the first fill result but keeps
> the churn case, and it needs neither the dedicated slab nor the bulk
> refill.
>
> I'll measure that variant and follow up with numbers before posting
> anything. If you would rather the node cache stay at a fixed size,
> that is useful to know too.

The problem with increasing the cache size is that we don't have (and
should not have) a reclaim mechanism for the cached nodes.  By
increasing the cache size arbitrarily for every ring in the system you
are now sitting on a much bigger pile of unreclaimable memory that most
applications are unlikely to need.  I think that would even be
worse as a general solution.

Beyond microbenchmarks, this would only be a "problem" for applications
with a working set that frequently recycles over 128 nodes at a time.
The question remains how well this microbenchmark replicates any
real-world scenarios.  And if 128 is not enough, what would be? To be
fair, this is true for all type of magazine-like caches we have in
io_uring. In addition, you install a fd because you want to do one or
more operations with it, diluting the update cost.  In this case, would
the cost of going to slab for a node update of a working set of >128 fds
be diluted by the other operations, and likely invisible?  If it is
really a problem, I guess I would be ok with the bulk refilling of the
128 nodes at a time when you have an empty cache missing, while keeping
the table the same size.

On another topic... it would be excellent if we could do bulk refill on the
shared slab without a separate a kmem_cache!

Thanks,

-- 
Gabriel Krisman Bertazi
