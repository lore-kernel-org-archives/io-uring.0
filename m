Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAA23C9EF1
	for <io-uring@vger.kernel.org>; Thu,  1 Oct 2026 18:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790880910; cv=none; b=M39AE+T7BPGfzrXFYbn0yTiLaU9wUyHXi3gH09QU7hsMw608yARtbbtwiaAr9MvAHISBJ+smGT3tlRffui8D9yISMpFFUH4ehF83tGke6OWbDFJ12iwc+ClYNbjtwC5TEYuWS+HC8XRdhDCLOyesu/bvv3Ijc+dV7QAiBDmsFLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790880910; c=relaxed/simple;
	bh=CtVLaNZEoAUBrGMxb/yN82shlHq7vAzvAracuRDWXYE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=U5iYK3fhRsxYMMGX894aovY1IqngrqWDY9hLjYY/WSFdUF5CWpxQ4ESRndKCE303exARrBDAO4ZfRawLg/C4W7JOBhys9GzIl5FRPyf4QgDmG/GYzlISI+7hb8REMJpx4+WP/ZxLq4lAZkYmkwbvJTe4lnxgVYk1Mc7P8ojfo/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krisman.be; spf=pass smtp.mailfrom=krisman.be; dkim=pass (2048-bit key) header.d=krisman.be header.i=@krisman.be header.b=LctrB9da; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krisman.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krisman.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=krisman.be header.i=@krisman.be header.b="LctrB9da"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hwh1N5FmGzKpDj;
	Thu, 01 Oct 2026 20:55:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=krisman.be; s=MBO0001;
	t=1790880904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KmuKw3BfJcLmKjc/Qbv2EdrB9E51AGrks3rrAEH1UJI=;
	b=LctrB9da5YGjq0vBkEjzbKQhL85bh40b8EqmdDX8sji1EjT2tfjUMCXyED9g9agxRhtCV7
	vVLTPh5QgIigWVmvnWl65zDKLuHJMHM5tx11fdisrRruFyX+/7+XSWNV6uYpH+HQOBCR4s
	GKoqwp+FwwmTUbMw2SmCXIA6A7i28n4n4GR4qRTRJW8qHhZr3IL2VN4WPuz1HGWy5r6F+1
	oexzQrIyQnq1w/g0VMt7Gfa64/OvGb8bUXp0hyU8DXHY6HXFeb02LPaf4MGCDb6UEH1Xmj
	IQf8gNHXWedr4D7DeA4kB3GOmblCAAFrmCb3raIU8OfgxdVvP008rAv3KTltDg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of gabriel@krisman.be designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=gabriel@krisman.be
From: Gabriel Krisman Bertazi <gabriel@krisman.be>
To: David Wei <dw@davidwei.uk>, io-uring@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>
Subject: Re: [PATCH] io_uring/memmap: fix non-compound alloc fallback with
 memcg accounting
In-Reply-To: <20261001181752.537767-1-dw@davidwei.uk>
References: <20261001181752.537767-1-dw@davidwei.uk>
Date: Thu, 01 Oct 2026 14:55:00 -0400
Message-ID: <87h5j5w8sb.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 4hwh1N5FmGzKpDj

David Wei <dw@davidwei.uk> writes:

> io_region_allocate_pages() first tries io_mem_alloc_compound(). If that
> fails, it uses alloc_pages_bulk_node() to allocate separate pages.
>
> The bulk allocator does not support memcg accounting. __GFP_ACCOUNT is
> unconditionally supplied, so when memcg_kmem_online() is true, it only
> allocates one page. For a multi-page request, io_uring treats this short
> result as failure and returns ENOMEM, even when the memcg has enough
> space for all pages.
>
> When this happens, fill the rest of the request with order 0 allocations
> via alloc_page(), which support memcg accounting. This maintains the
> existing fast path, while fixing the incorrect ENOMEM return when memcg
> is used.
>
> Signed-off-by: David Wei <dw@davidwei.uk>
> ---
>  io_uring/memmap.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/io_uring/memmap.c b/io_uring/memmap.c
> index cb3db32e8255..cc8ac129a0c7 100644
> --- a/io_uring/memmap.c
> +++ b/io_uring/memmap.c
> @@ -183,6 +183,7 @@ static int io_region_allocate_pages(struct io_mapped_region *mr,
>  	size_t size = io_region_size(mr);
>  	unsigned long nr_allocated;
>  	struct page **pages;
> +	struct page *page;
>  
>  	pages = kvmalloc_objs(*pages, mr->nr_pages, gfp);
>  	if (!pages)
> @@ -195,6 +196,13 @@ static int io_region_allocate_pages(struct io_mapped_region *mr,
>  
>  	nr_allocated = alloc_pages_bulk_node(gfp, NUMA_NO_NODE,
>  					     mr->nr_pages, pages);
> +	while (nr_allocated < mr->nr_pages) {
> +		page = alloc_page(gfp);
> +		if (!page)
> +			break;
> +
> +		pages[nr_allocated++] = page;
> +	}

FWIW, I looked at this recently and really think this should be the
alloc_pages_bulk_/kmem_alloc_bulk* actual semantics.  But that is a
bigger sell and I only found io_uring would actually benefit from it.

Feel free to add:

Reviewed-by: Gabriel Krisman Bertazi <krisman@suse.de>

Perhaps also

Fixes: 1e21df691ffa ("io_uring/memmap: implement kernel allocated regions")



>  	if (nr_allocated != mr->nr_pages) {
>  		if (nr_allocated)
>  			release_pages(pages, nr_allocated);
> -- 
> 2.53.0-Meta
>

-- 
Gabriel Krisman Bertazi
