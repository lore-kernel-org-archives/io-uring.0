Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8353D409272;
	Tue, 15 Sep 2026 18:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789496454; cv=none; b=ooSIgDPcQbpCkglp2fZABGBQ3tqFcNBCqDbnb2B+CeJUE4TFEtHcttJ8/eaNDOMo1BcB1PlfOvkaS/gHPyRO1pW1COuT2lxg5YuESn4Dn/Eawz4ePhWQ+FavqeRibgB44XLQIgB9NeaG5CHOxBJJmbsNFHJtM1qJX9pTnzSy2ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789496454; c=relaxed/simple;
	bh=bUmrp4GMLhXBGeleLZrHVx7c+JGCTJyLNnPC/BQsLzE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pLilLhSxGb4WTCYz8LaLzhsDSyadW/Bvs0UtyUQ9XHcmcQn7BE1avho+4mi96cBg6NopR/upb48a+yObZHw/LuM75MhbVa3Aq+UYmZwmfQP04iLgLYcox8U+ZvtV6zpRS0+SjPezxG5koaGu+8OwjhMHISJ2yyJWP3ww9RTX5pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iXeHV6TB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vvWIZq4b; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AczWsRjm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+V7M2w5K; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iXeHV6TB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vvWIZq4b";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AczWsRjm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+V7M2w5K"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A148221D55;
	Tue, 15 Sep 2026 18:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789496439; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5NTtuDsAp7E0C/BNPsxexNUQFN9km0Q5v2MuuXnv6ss=;
	b=iXeHV6TBSmL9A6lMnYEyc2pDyim17mGDAIpsaYmOf0w9bgOc3TVoIWlPEDzqSNFrn1OFYZ
	wsye4NzqKKlJ7KaHmmWPe4W4d6jIMyaj5ubduVwHqV8leFp4oOsmhIzljPbfWd+IungLwg
	D/kly99MUmcgMVdD6OqahuQbphpU64M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789496439;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5NTtuDsAp7E0C/BNPsxexNUQFN9km0Q5v2MuuXnv6ss=;
	b=vvWIZq4bcidZiZ9beD4pKcfg9O5PH6nd0O/PnotI09pEQLYKCmu4l8i0pr0M7y+yDQ3+iK
	gfJOcErAqAPU0RBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789496435; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5NTtuDsAp7E0C/BNPsxexNUQFN9km0Q5v2MuuXnv6ss=;
	b=AczWsRjmuPaS5wvUMta/0QT8Vd+XnpRW8vzkd2pRbrFmjl8ii39XEV9H6UjS/npER7x1yh
	l3JPOJpnK9mifa9QEnjiVgIFStx/H9h7HDkem9SBEkgOZsooWMyuH9wy4qNIfO5T6y/hO1
	rKJwvFr9e6EYU7xCnwgZg0GyNhxOfYU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789496435;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5NTtuDsAp7E0C/BNPsxexNUQFN9km0Q5v2MuuXnv6ss=;
	b=+V7M2w5KV1obVNkkCrtmW1nyDYDMyOctOF2m30q4pSGzYgvhF4D9x2YPbjMxN/FfE6V8Pq
	Ok1+nScUzm66hRAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0660713432;
	Tue, 15 Sep 2026 18:20:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mpBZI3KMqWqeKwAAD6G6ig
	(envelope-from <krisman@suse.de>); Tue, 15 Sep 2026 18:20:34 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Uzair Beg <uzairbeg11@gmail.com>, io-uring@vger.kernel.org
Cc: axboe@kernel.dk, asml.silence@gmail.com, Chengfeng Lin
 <lin2530632123@gmail.com>, linux-kernel@vger.kernel.org, Uzair Beg
 <uzairbeg11@gmail.com>
Subject: Re: [RFC PATCH 3/3] io_uring/rsrc: prefill the node cache when a
 file table is registered empty
In-Reply-To: <20260914092049.130079-4-uzairbeg11@gmail.com>
Organization: SUSE
References: <20260914092049.130079-1-uzairbeg11@gmail.com>
 <20260914092049.130079-4-uzairbeg11@gmail.com>
Date: Tue, 15 Sep 2026 15:20:28 -0300
Message-ID: <87fqza1imr.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Level: 
X-Spam-Score: -2.80
X-Spam-Flag: NO
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailhost.krisman.be:mid,imap1.dmz-prg2.suse.org:helo]

Uzair Beg <uzairbeg11@gmail.com> writes:

> Registering a sparse fixed file table allocates no nodes at
> registration time; each node is allocated later, on the install path,
> where MSG_RING SEND_FD pays for it. Bare-metal measurement of the
> 4,096-slot first fill shows the cost is not the allocator call
> (bulk refill was neutral) nor fresh slab pages (priming the slab was
> neutral), but the per-object SLUB allocation path itself. The only way
> to take it off the install path is to not allocate there.
>
> When a sparse table of N slots is registered, grow the per-ring node
> cache to min(N, IO_ALLOC_CACHE_PREFILL_MAX) and bulk-fill it, so the
> subsequent installs hit the cache. Prefill is best-effort: on any
> failure the cache is left in a valid state (a successfully grown
> pointer array is retained) and registration proceeds unchanged.
> Non-sparse registrations are untouched, since they allocate every node
> inline anyway.

I'm unconvinced this is the right approach.  This is only relevant for
initialization overhead: once the ring is in operation, the overhead is
gone because nodes are recycled.  So this will really benefit
short-lived applications that create large tables, something that I
suspect is rare outside of artificial benchmarks.  On the other hand,
people are creating sparse but arbitrarily large tables.  Does it make
sense to pre-allocated up to 192KB in memory for short-lived
applications that might use only a couple of those nodes?

> On the reported 4,096-slot first fill this is 9.8% faster than
> unpatched. Because the enlarged cache also retains nodes released by
> FILES_UPDATE, a same-ring remove-and-refill of 4,096 files is 18.8%
> faster. The cost is moved to registration rather than removed: a
> one-shot register-then-fill is unchanged overall, and a program that
> registers many slots and installs few pays for nodes it never uses.
> Whether that trade is acceptable, or should be behind a registration
> flag, is the question this patch is intended to raise.
>
> The stash loop from the bulk refill path is factored into a helper so
> both callers share it.
>
> Reported-by: Chengfeng Lin <lin2530632123@gmail.com>
> Closes: https://lore.kernel.org/io-uring/CANGjgdmt0FQ=offsdfn+wEaDxbOFoAa6bi92X_vEo4S6aCZ56A@mail.gmail.com/
> Tested-by: Chengfeng Lin <lin2530632123@gmail.com>
> Co-developed-by: Chengfeng Lin <lin2530632123@gmail.com>
> Signed-off-by: Chengfeng Lin <lin2530632123@gmail.com>
> Signed-off-by: Uzair Beg <uzairbeg11@gmail.com>
> ---
>  io_uring/alloc_cache.c | 58 ++++++++++++++++++++++++++++++++++--------
>  io_uring/alloc_cache.h |  2 ++
>  io_uring/rsrc.c        |  4 +++
>  3 files changed, 54 insertions(+), 10 deletions(-)
>
> diff --git a/io_uring/alloc_cache.c b/io_uring/alloc_cache.c
> index cba0e6c5d66..2c6e09313d2 100644
> --- a/io_uring/alloc_cache.c
> +++ b/io_uring/alloc_cache.c
> @@ -38,6 +38,22 @@ bool io_alloc_cache_init(struct io_alloc_cache *cache,
>  	return false;
>  }
>  
> +static void io_cache_stash(struct io_alloc_cache *cache, void **slot,
> +			   unsigned int nr)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < nr; i++) {
> +		if (cache->init_clear)
> +			memset(slot[i], 0, cache->init_clear);
> +		if (unlikely(!kasan_mempool_poison_object(slot[i])))
> +			break;
> +		cache->nr_cached++;
> +	}
> +	for (; i < nr; i++)
> +		kmem_cache_free(cache->slab, slot[i]);
> +}
> +
>  void *io_cache_alloc_new(struct io_alloc_cache *cache, gfp_t gfp)
>  {
>  	void *obj;
> @@ -45,7 +61,7 @@ void *io_cache_alloc_new(struct io_alloc_cache *cache, gfp_t gfp)
>  	if (cache->slab) {
>  		unsigned int room = cache->max_cached - cache->nr_cached;
>  		void **slot = &cache->entries[cache->nr_cached];
> -		unsigned int batch, got, i;
> +		unsigned int batch, got;
>  
>  		if (unlikely(!room))
>  			return kmem_cache_alloc(cache->slab, gfp);
> @@ -57,15 +73,7 @@ void *io_cache_alloc_new(struct io_alloc_cache *cache, gfp_t gfp)
>  
>  		/* return one object, stash the rest in the cache */
>  		obj = slot[got - 1];
> -		for (i = 0; i < got - 1; i++) {
> -			if (cache->init_clear)
> -				memset(slot[i], 0, cache->init_clear);
> -			if (unlikely(!kasan_mempool_poison_object(slot[i])))
> -				break;
> -			cache->nr_cached++;
> -		}
> -		for (; i < got - 1; i++)
> -			kmem_cache_free(cache->slab, slot[i]);
> +		io_cache_stash(cache, slot, got - 1);
>  	} else {
>  		obj = kmalloc(cache->elem_size, gfp);
>  	}
> @@ -73,3 +81,33 @@ void *io_cache_alloc_new(struct io_alloc_cache *cache, gfp_t gfp)
>  		memset(obj, 0, cache->init_clear);
>  	return obj;
>  }
> +
> +void io_alloc_cache_prefill(struct io_alloc_cache *cache, unsigned int nr)
> +{
> +	gfp_t gfp = GFP_KERNEL | __GFP_NOWARN;
> +	unsigned int got;
> +	void **entries;
> +
> +	if (!cache->slab || !cache->entries)
> +		return;
> +
> +	nr = min_t(unsigned int, nr, IO_ALLOC_CACHE_PREFILL_MAX);
> +	if (nr <= cache->nr_cached)
> +		return;
> +
> +	if (nr > cache->max_cached) {
> +		entries = kvmalloc_array(nr, sizeof(void *), gfp);
> +		if (!entries)
> +			return;
> +		memcpy(entries, cache->entries,
> +		       cache->nr_cached * sizeof(void *));
> +		kvfree(cache->entries);
> +		cache->entries = entries;
> +		cache->max_cached = nr;
> +	}
> +
> +	got = kmem_cache_alloc_bulk(cache->slab, gfp, nr - cache->nr_cached,
> +				    &cache->entries[cache->nr_cached]);
> +	if (got)
> +		io_cache_stash(cache, &cache->entries[cache->nr_cached], got);
> +}
> diff --git a/io_uring/alloc_cache.h b/io_uring/alloc_cache.h
> index 82d552c7517..ca6af52dd7d 100644
> --- a/io_uring/alloc_cache.h
> +++ b/io_uring/alloc_cache.h
> @@ -8,6 +8,7 @@
>   */
>  #define IO_ALLOC_CACHE_MAX	128
>  #define IO_ALLOC_CACHE_REFILL	32
> +#define IO_ALLOC_CACHE_PREFILL_MAX	4096
>  
>  void io_alloc_cache_free(struct io_alloc_cache *cache,
>  			 void (*free)(const void *));
> @@ -16,6 +17,7 @@ bool io_alloc_cache_init(struct io_alloc_cache *cache,
>  			 unsigned int init_bytes);
>  
>  void *io_cache_alloc_new(struct io_alloc_cache *cache, gfp_t gfp);
> +void io_alloc_cache_prefill(struct io_alloc_cache *cache, unsigned int nr);
>  
>  static inline bool io_alloc_cache_put(struct io_alloc_cache *cache,
>  				      void *entry)
> diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
> index 6413682ebe4..b7f78b6b514 100644
> --- a/io_uring/rsrc.c
> +++ b/io_uring/rsrc.c
> @@ -560,6 +560,10 @@ int io_sqe_files_register(struct io_ring_ctx *ctx, void __user *arg,
>  	if (!io_alloc_file_tables(ctx, &ctx->file_table, nr_args))
>  		return -ENOMEM;
>  
> +	/* sparse table: nodes are installed later, so cache them now */
> +	if (!fds)
> +		io_alloc_cache_prefill(&ctx->node_cache, nr_args);
> +
>  	for (i = 0; i < nr_args; i++) {
>  		struct io_rsrc_node *node;
>  		u64 tag = 0;
> -- 
> 2.43.0
>

-- 
Gabriel Krisman Bertazi
