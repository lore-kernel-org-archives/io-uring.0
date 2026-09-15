Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2375743E06D;
	Tue, 15 Sep 2026 17:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494885; cv=none; b=nYntDHNwWW2uxREsdMr4OYMv4QzIWONwxIhRMPeTpA7C2wnajGO8wfd2iEosFr2kk/7m+NEBxe6Q9LE6IeRPYzajWtFn5u09BnRgoS8YV3z806vXEsJi8xjdjg5BmUyWMjc0ELKsHhcE5zWO1HS1Uo5MGvaiyePi8pmD1ROET2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494885; c=relaxed/simple;
	bh=RXdDfsnAh9Y43xO6IL2AwU46pCgw5t7h8LAJLpZUCjk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pVJhBJE8YwR9BpWuMvFV+58alUv+uokKFTfTL31Meh3hV1G3tnjHTsNEWTa4tEca3VQo1W1wkywjrUkItoUG4hbOV6B+Uqf/n5Tj+y4ZjZpqpuuFcwql5BG3fPW5SQLGWFSxUWyRiITKNQVgqvVQIF0jrz2FaVRkLLs3x8Bahs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gDRUkfY7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ta8bvRZh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ObkFmigW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qRqZz2Io; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gDRUkfY7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ta8bvRZh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ObkFmigW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qRqZz2Io"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 897401FE4E;
	Tue, 15 Sep 2026 17:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789494876; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6I57sMoGsWFZJnjcjpdh+dKELHk2w1kaprJaon8kb8w=;
	b=gDRUkfY7oq1zbo4VHNgPTGHD9D3znxB5EcqB5LM4x9yKwnZa+3pKSbBY0vXyj8xs3V3xLT
	egsU1uAVpEc451vDzawJ6xvnpr/DoxZ0TSrH7l5ypNag3juAqgu8lc1qTx+VL5qlHwWmP7
	pZYMr8CpAi7Y5tvMM3qrcG72tsKzAmo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789494876;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6I57sMoGsWFZJnjcjpdh+dKELHk2w1kaprJaon8kb8w=;
	b=Ta8bvRZh+t0WthXlsIkF3NEfTT2fdd3369aVhRpBQ8/hvHJriu80jneUOwhd4cKUXzEX/k
	r8sxqwHowtVVQ/BA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789494872; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6I57sMoGsWFZJnjcjpdh+dKELHk2w1kaprJaon8kb8w=;
	b=ObkFmigWsKjZ22AJq0y88/y1gYD7FydJx2sy3uASM25tGd0aC6WQnn50Xyy07UlCxyGsuJ
	dDBWkfnw6hG/Qy02nlcxntWFaJg3tGkMPITXc7VmbVZNZsmY+mW365k/kAs5/jT3WXThg8
	pIqx1W7IA+eZw0Q/J8sITRT3yUbHBQA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789494872;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6I57sMoGsWFZJnjcjpdh+dKELHk2w1kaprJaon8kb8w=;
	b=qRqZz2IoWiygzEW/51RGsU1YPtNjDRYpfrc4aQP4TBRI2tJ9hZDM/+zY2AzfJRETIzw49K
	Ww2nuej4pWX/RVDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BEE7813693;
	Tue, 15 Sep 2026 17:54:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vz5dE1eGqWrIEAAAD6G6ig
	(envelope-from <krisman@suse.de>); Tue, 15 Sep 2026 17:54:31 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Uzair Beg <uzairbeg11@gmail.com>, io-uring@vger.kernel.org
Cc: axboe@kernel.dk, asml.silence@gmail.com, Chengfeng Lin
 <lin2530632123@gmail.com>, linux-kernel@vger.kernel.org, Uzair Beg
 <uzairbeg11@gmail.com>
Subject: Re: [RFC PATCH 1/3] io_uring/rsrc: allocate io_rsrc_node from a
 dedicated kmem_cache
In-Reply-To: <20260914092049.130079-2-uzairbeg11@gmail.com>
Organization: SUSE
References: <20260914092049.130079-1-uzairbeg11@gmail.com>
 <20260914092049.130079-2-uzairbeg11@gmail.com>
Date: Tue, 15 Sep 2026 14:54:29 -0300
Message-ID: <87jyom1ju2.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.dk,gmail.com,vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,mailhost.krisman.be:mid]
X-Spam-Flag: NO

Uzair Beg <uzairbeg11@gmail.com> writes:

> io_rsrc_node allocations come from the generic kmalloc-32 bucket via
> io_cache_alloc_new(). On a first fill of a sparse fixed file table the
> per-ring node cache is empty by construction, since io_reset_rsrc_node()
> returns early on a NULL slot and nothing is freed back, so every install
> takes an allocator round trip.
>
> Add an optional kmem_cache to io_alloc_cache and use it for the node
> cache. The slab pointer defaults to NULL, so other io_alloc_cache users
> are unchanged and imu_cache keeps using kmalloc, its element size being
> variable. All three free paths honour the slab.
>
> On its own this is neutral on the reported workload. It exists so that
> the following patches can use kmem_cache_alloc_bulk(), which has no
> equivalent for plain kmalloc.
>
> Reported-by: Chengfeng Lin <lin2530632123@gmail.com>
> Closes: https://lore.kernel.org/io-uring/CANGjgdmt0FQ=offsdfn+wEaDxbOFoAa6bi92X_vEo4S6aCZ56A@mail.gmail.com/
> Tested-by: Chengfeng Lin <lin2530632123@gmail.com>
> Signed-off-by: Uzair Beg <uzairbeg11@gmail.com>
> ---
>  include/linux/io_uring_types.h |  1 +
>  io_uring/alloc_cache.c         | 14 +++++++++++---
>  io_uring/alloc_cache.h         |  8 ++++++--
>  io_uring/io_uring.c            |  5 +++++
>  io_uring/io_uring.h            |  1 +
>  io_uring/rsrc.c                |  2 ++
>  6 files changed, 26 insertions(+), 5 deletions(-)
>
> diff --git a/include/linux/io_uring_types.h b/include/linux/io_uring_types.h
> index c2ea6280901..e8d5a585a60 100644
> --- a/include/linux/io_uring_types.h
> +++ b/include/linux/io_uring_types.h
> @@ -253,6 +253,7 @@ struct io_alloc_cache {
>  	unsigned int		max_cached;
>  	unsigned int		elem_size;
>  	unsigned int		init_clear;
> +	struct kmem_cache	*slab;
>  };

Not opposed to having a slab, but I actually think it is
unnecessary.  see patch 2.  If we do that, we actually should delete the
async_size parameter in the opdef, since it is now redundant.  But
see comments in patch 2.

>  
>  struct io_ring_ctx {
> diff --git a/io_uring/alloc_cache.c b/io_uring/alloc_cache.c
> index 58423888b73..a44b82a80f1 100644
> --- a/io_uring/alloc_cache.c
> +++ b/io_uring/alloc_cache.c
> @@ -10,8 +10,12 @@ void io_alloc_cache_free(struct io_alloc_cache *cache,
>  	if (!cache->entries)
>  		return;
>  
> -	while ((entry = io_alloc_cache_get(cache)) != NULL)
> -		free(entry);
> +	while ((entry = io_alloc_cache_get(cache)) != NULL) {
> +		if (cache->slab)
> +			kmem_cache_free(cache->slab, entry);
> +		else
> +			free(entry);
> +	}

FWIW, this is exactly why we have the (*free) callback, you should have a function
for your specific type used as a callback that does the kmem_cache_free
so you don't need the if/else here.

But for a simple kmem_cache_free, kfree works just fine.

-- 
Gabriel Krisman Bertazi
