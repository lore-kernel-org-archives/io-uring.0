Received: from mail-yx2-f4.google.com (mail-yx2-f4.google.com [74.125.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E57843F8A1
	for <io-uring@vger.kernel.org>; Thu, 24 Sep 2026 16:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790267346; cv=none; b=tv/CMRHbei4ThZiPOJSrDEQSYJ2Rw6NsJrh/6nGx24n2H2BUwKmKfAfw2IvGpQQUyeRhFCLR4lqol/r1e4hVonsZ059nIcKfDg63cfRZwWOb4JCe7cPyxSFx/271CCPmXnJy06kE6fga60kDqcBrxeNd5gJD3lADlIIUG7+K08o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790267346; c=relaxed/simple;
	bh=5i7b6kMYdGGIjCVVvCX+4u39TdVQraQyiGlv13SzSQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eJ2MzB5gF8781K58yonufelylwWI3HwvfJ/8dA7D9ETdk154RPrMxht0smzZ9O0xkcHvT+VnPYnGPxMC9bcvtVQD3+sZH8DZ8k9NgCN+UUn1YbAgjeaQv1zvWA838qq0uGPWXb4FotbKM8hMxAK6ph+95303f7lcpRNEMo7+wuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZZvGd+/; arc=none smtp.client-ip=74.125.224.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZZvGd+/"
Received: by mail-yx2-f4.google.com with SMTP id 00721157ae682-86785a548ddso15860787b3.1
        for <io-uring@vger.kernel.org>; Thu, 24 Sep 2026 09:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790267342; x=1790872142; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=80D7AHdcV1LtMO3B+vuMbt7RPT9TfvRN+d96Bc2X4eM=;
        b=gZZvGd+/ZyX8nb0Mbf+aM9PzV47otJn+HtzFY2f+Zt3UXdZqe1EIIV+zp48hNUQ+kB
         URbR807o2yDXir/AMrmGNg6y8gF/KdUau0U4GWusIIKZTkdrmB5OJoDNJhfg0GleZH8H
         mEE2vlowi++nZIR0/xFbuBie8ofupTSe+G1XbJKSsOCLkcEKuB1CJWryi2XB6DO1Bqw3
         7nq31nzxFUYZwKzEtrSMGChXjVHQKTgyod0WFfpbi0NOlU6Bmo1kTdbc+YFVu6OSWwtM
         jEVIVXDEs7q76tvweueLu39jZ7mSirhaTQpQUaJHrBhZykaxMSgq/nHFdtVaGXWhWo6U
         7HJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790267342; x=1790872142;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=80D7AHdcV1LtMO3B+vuMbt7RPT9TfvRN+d96Bc2X4eM=;
        b=ZzsJwxrfqLvwbfXHaNYNIxV4xZe3bDIL9xj5lw036kofiaV1y0s9/UwYk26xpiwEbk
         Eneb6YM1FBuyTiBLjFL2ACP9tBDrSP5SES1Xvci2B6A2x7MIDYBl6E/GwzMa3at/g/BL
         CYY8xQtxZzlzRspKsSF9Jr8dXMqtxqOL/TO9oOADwhfR1EHQYuqZsclqMalYdbXlH3z8
         k18NohpX5HFrJ7KXTYajYX08v1exhSDdvRDX3rTdh8VXIY2g4GzUJ1YFtRH+Rpl2DRYN
         9evO7XJbtNin0npwoNO39tVmgAz174p42lE011Kl6q7JTSIMt6NwugvWvGTvDBVGy6hg
         052g==
X-Forwarded-Encrypted: i=1; AKwUvByyv/8OFY/Rx01gGcIMqeAkONg1fHqJoYcqVrPsYtPW+s/CCNemqcwiWxnvvpLmpUwAtIDR42GnCQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kSoNbMu5nbznNG+S+SM3H2xq7TouMSDXp30ehYNsv4dSgGmfjk
	rv2KngI/pOVGQhNhRUHjgzL9RRkcgVgJDweoQkMjG7D1tRDxjm7aW7D6
X-Gm-Gg: AYBFou0Q2htP8TPtpGxy33jvcZDpYQj/VP6pYZMQwX3/6HxSGAvtpeokT0VgKPM9g/2
	D7dOXP9/l9/gH+Kr0GNspuIPme3huqH5VroCyfsF3FEbfSkejS+e3Eygtef/hEI9ZYOsE2+o0WW
	Zgufd6pSTE/8LVMUtgdqMpO3pL2t0wpczPwrvh9dUjjUidafyS11BQ4EWrY83D/QOxQ7AzjcTew
	jn3kXMLqoQSm8Zo3Si7/gdv10Ndp56sPhdwaMicXUXw4BPCUYJGq+tRqocGeghaEQyb4mZIgQIy
	Ta+YSJJoFMtHJXo/VzPCrOHyBOPHERPLThjmpW85HJHIlsvFDcNHkiMSW5+yeZSCj2EA4tFhBG6
	W3hyr5ryY5LOPhLntq3Kg0uhHGenz0nmbAldAoyh8mY8DtNl8s3S1g8muATZUHkv2MVixOadq4u
	SYKu8mm13oMpAzZLj+JUkD8MsYG0PkyUOLqF3msDM2yduRb3Bfl37lZFaeiNHU6aQC
X-Received: by 2002:a05:690c:f08:b0:882:1d1e:89bc with SMTP id 00721157ae682-8a64860b8cemr14894247b3.28.1790267342176;
        Thu, 24 Sep 2026 09:29:02 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:51::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a64e6f2ffbsm10797687b3.3.2026.09.24.09.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:29:01 -0700 (PDT)
Date: Thu, 24 Sep 2026 09:28:53 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, hawk@kernel.org, 
	ilias.apalodimas@linaro.org, asml.silence@gmail.com, axboe@kernel.dk, sdf@fomichev.me, 
	bobbyeshleman@meta.com, almasrymina@google.com, kaiyuanz@google.com, 
	linux-kernel@vger.kernel.org, io-uring@vger.kernel.org
Subject: Re: [PATCH net-next 1/3] net: netmem: add net_iov_area freelist
 helpers
Message-ID: <arVO9NXAZxaNBWtW@devvm7509.cco0.facebook.com>
References: <20260922204348.717198-2-sdf@fomichev.me>
 <179020718794.2160803.10755922661656548396@kernel.org>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179020718794.2160803.10755922661656548396@kernel.org>

On 09/23, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 (1) · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] net/core/devmem.h: the refactor moves `spinlock_t
>   freelist_lock` from the tail of `struct net_devmem_dmabuf_binding`…
> 
> Pre-existing issues:
> - [Medium] In `net_devmem_bind_dmabuf()` (net/core/devmem.c) the per-sg-
>   entry population loop advances `niov_idx` over the whole mapped…
> 
> --
> 
> net: netmem: add net_iov_area freelist helpers
> 
> This moves the bounded LIFO freelist that io_uring zcrx and devmem each
> maintained into struct net_iov_area, and adds net_iov_area_pop() and
> net_iov_area_push() helpers. The freelist now stores u32 indices instead of
> pointers, and devmem rejects areas with more than U32_MAX entries before
> narrowing num_niovs to u32.
> 
> > diff --git a/include/net/netmem.h b/include/net/netmem.h
> > index bccacd21b6c37..da885d95ea63b 100644
> > --- a/include/net/netmem.h
> > +++ b/include/net/netmem.h
> > @@ -101,10 +101,15 @@ struct net_iov {
> >  struct net_iov_area {
> >  	/* Array of net_iovs for this area. */
> >  	struct net_iov *niovs;
> > -	size_t num_niovs;
> > +
> > +	/* Stack of free net_iov indices. */
> > +	u32 *freelist;
> >  
> >  	/* Offset into the dma-buf where this chunk starts.  */
> >  	unsigned long base_virtual;
> > +
> > +	u32 num_niovs;
> > +	u32 free_count;
> >  };
> >  
> >  static inline struct net_iov_area *net_iov_owner(const struct net_iov *niov)
> > @@ -117,6 +122,27 @@ static inline unsigned int net_iov_idx(const struct net_iov *niov)
> >  	return niov - net_iov_owner(niov)->niovs;
> >  }
> >  
> > +static inline struct net_iov *net_iov_area_pop(struct net_iov_area *area)
> > +{
> > +	u32 idx;
> > +
> > +	if (unlikely(!area->free_count))
> > +		return NULL;
> > +
> > +	idx = area->freelist[--area->free_count];
> > +	return &area->niovs[idx];
> > +}
> > +
> > +static inline void net_iov_area_push(struct net_iov_area *area,
> > +				     struct net_iov *niov)
> > +{
> > +	if (WARN_ON_ONCE(net_iov_owner(niov) != area ||
> > +			 area->free_count >= area->num_niovs))
> > +		return;
> > +
> > +	area->freelist[area->free_count++] = net_iov_idx(niov);
> > +}
> > +
> 
> [ ... io_uring/zcrx.c, io_uring/zcrx.h snipped ... ]
> 
> > diff --git a/net/core/devmem.c b/net/core/devmem.c
> > index a9d86b5a55885..c1c1872b88de2 100644
> > --- a/net/core/devmem.c
> > +++ b/net/core/devmem.c
> 
> [ ... ]
> 
> > @@ -67,12 +67,10 @@ net_devmem_alloc_dmabuf_bulk(struct net_devmem_dmabuf_binding *binding,
> >  
> >  	spin_lock_bh(&binding->freelist_lock);
> >  
> > -	count = min_t(size_t, count, binding->free_count);
> > -	for (i = 0; i < count; i++) {
> > -		struct net_iov *niov = binding->freelist[--binding->free_count];
> > -
> > -		netmems[i] = net_iov_to_netmem(niov);
> > -	}
> > +	count = min(count, binding->area.free_count);
> > +	for (i = 0; i < count; i++)
> > +		netmems[i] =
> > +			net_iov_to_netmem(net_iov_area_pop(&binding->area));
> >  
> >  	spin_unlock_bh(&binding->freelist_lock);
> >  
> > @@ -84,12 +82,7 @@ void net_devmem_free_dmabuf(struct net_iov *niov)
> >  	struct net_devmem_dmabuf_binding *binding = net_devmem_iov_binding(niov);
> >  
> >  	spin_lock_bh(&binding->freelist_lock);
> > -	if (WARN_ON_ONCE(binding->free_count >= binding->area.num_niovs)) {
> > -		spin_unlock_bh(&binding->freelist_lock);
> > -		return;
> > -	}
> > -
> > -	binding->freelist[binding->free_count++] = niov;
> > +	net_iov_area_push(&binding->area, niov);
> >  	spin_unlock_bh(&binding->freelist_lock);
> >  }
> 
> [ ... ]
> 
> > @@ -279,7 +279,7 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
> >  			if (direction == DMA_TO_DEVICE)
> >  				binding->tx_vec[niov_idx] = niov;
> >  			else
> > -				binding->freelist[binding->free_count++] = niov;
> > +				net_iov_area_push(&binding->area, niov);
> >  			dma_addr += niov_size;
> >  		}
> >  	}
> 
> [Severity: Medium]
> This isn't a bug introduced by this patch, but the conversion makes the
> population loop in net_devmem_bind_dmabuf() look better validated than it
> actually is.
> 
> The freelist store is now bounds-checked inside net_iov_area_push(), which
> warns and drops the entry when free_count reaches num_niovs. The two
> sibling writes in the very same iteration are still unbounded:
> 
> 	nr_niovs = len >> niov_shift;
> 	for (i = 0; i < nr_niovs; i++, niov_idx++) {
> 		niov = &binding->area.niovs[niov_idx];
> 		net_iov_init(niov, &binding->area, NET_IOV_DMABUF);
> 		if (net_mp_niov_set_dma_addr(niov, dma_addr)) {
> 			...
> 		}
> 		if (direction == DMA_TO_DEVICE)
> 			binding->tx_vec[niov_idx] = niov;
> 		else
> 			net_iov_area_push(&binding->area, niov);
> 
> niov_idx accumulates across every sg entry and is never compared against
> binding->area.num_niovs, which is derived only from
> dmabuf->size >> niov_shift. The loop checks per-entry alignment
> (IS_ALIGNED(dma_addr, niov_size), IS_ALIGNED(len, niov_size)) but never that
> the summed sg length equals dmabuf->size.

[..]

> Can area.niovs[] and tx_vec[] be written past their ends if an exporter's
> mapped sg_table covers more bytes than dmabuf->size?
> 
> In the other direction, if the mapping is shorter than dmabuf->size, can the
> tail of tx_vec be dereferenced as struct net_iov *? It is allocated with
> kvmalloc_objs() and never zeroed:
> 
> 	binding->tx_vec = kvmalloc_objs(struct net_iov *,
> 					binding->area.num_niovs);
> 
> I could not construct this with an in-tree exporter (udmabuf, dma-heaps and
> DRM PRIME all map exactly the object size), and I did not find an explicit
> dma-buf API guarantee that the mapped sg length equals dmabuf->size either.
> Would it be worth bounding niov_idx against area.num_niovs, or zeroing
> tx_vec, while the push side is being touched here?

"I could not construct this with an in-tree exporter" - the arrays
are sized such that the niovs should fit.

> This is still the case at the end of the series (3ee6ae62e2d2): the later
> patch "net: devmem: use memory provider helpers for net_iovs" zeroes
> area.niovs but leaves tx_vec unzeroed and niov_idx unbounded.
> 
> > diff --git a/net/core/devmem.h b/net/core/devmem.h
> > index f71d9a2bcb3d3..5edb763b89b26 100644
> > --- a/net/core/devmem.h
> > +++ b/net/core/devmem.h
> > @@ -17,6 +17,9 @@ struct netlink_ext_ack;
> >  
> >  struct net_devmem_dmabuf_binding {
> >  	struct net_iov_area area;
> > +	/* Protects area.freelist and area.free_count. */
> > +	spinlock_t freelist_lock;
> > +
> >  	struct dma_buf *dmabuf;
> >  	struct dma_buf_attachment *attachment;
> >  	struct sg_table *sgt;
> > @@ -57,10 +60,6 @@ struct net_devmem_dmabuf_binding {
> >  	/* rxq's this binding is active on. */
> >  	struct xarray bound_rxqs;
> >  
> > -	spinlock_t freelist_lock ____cacheline_aligned_in_smp;
> > -	size_t free_count;
> > -	struct net_iov **freelist;
> > -
> 
> [Severity: Medium]
> The ____cacheline_aligned_in_smp annotation on freelist_lock is dropped
> here, and the lock moves from the tail of the binding to right after the
> embedded struct net_iov_area. Was that intentional?
> 
> With the new area layout (niovs at 0, freelist at 8, base_virtual at 16,
> num_niovs at 24, free_count at 28) the write-hot lock word and free_count
> end up in the same 64-byte line as the read-mostly area.niovs and
> area.base_virtual.
> 
> The writers dirty that line on every allocation and release:
> 
> net/core/devmem.c:net_devmem_alloc_dmabuf_bulk() {
> 	spin_lock_bh(&binding->freelist_lock);
> 	count = min(count, binding->area.free_count);
> 	...
> }
> 
> net/core/devmem.c:net_devmem_free_dmabuf() {
> 	spin_lock_bh(&binding->freelist_lock);
> 	net_iov_area_push(&binding->area, niov);
> 	...
> }
> 
> while the receive path reads the same line per fragment, via
> net_iov_idx() -> net_iov_owner(niov)->niovs and
> net_devmem_iov_virtual_addr() -> net_iov_owner(niov)->base_virtual.
> 
> In the common devmem setup, where page pool refill/release runs on a
> different core than the recvmsg() consumer, does this re-introduce the false
> sharing the removed annotation was there to prevent?
> 
> The commit message says:
> 
>     Keep devmem's area adjacent to its lock.
> 
> but it does not mention removing the SMP cacheline isolation, and no numbers
> are given. Annotating freelist_lock (or the lock plus free_count pair)
> ____cacheline_aligned_in_smp again would keep the refactor intact.
> 
> I checked the end of the series (3ee6ae62e2d2) and net/core/devmem.h still
> declares the lock right after the area with no ____cacheline_aligned_in_smp,
> so nothing later restores it.

Yes, this is all intentional. The lock and the freelist are used together.
