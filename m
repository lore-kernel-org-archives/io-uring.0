Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993A6309F09
	for <io-uring@vger.kernel.org>; Mon,  5 Oct 2026 17:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791219726; cv=none; b=aSR/e1lTUkVWcmsFwKQlpR6cwAIoWpqV2IbOmkf0h2/DSgDMA/npgktYh7/R1eUN6uRYXxFR3PsmfXutAGzoPaHma3Zf8kXNeeCT6Ttr+YVuZVBC0jua0G+SMdq7ZBCSEQmCZV4IeH5yQ+7gesPgLJqKG7MiKu6tFYThwiTt8Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791219726; c=relaxed/simple;
	bh=p2r4gcb42xTsxaNA5xPh+LYVuA5ynBc9KIAfNKRT2l0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aGHw9juVXmjKm0DtfHNg3q8QiRoByY+UEpwCV4xNqNd1pTeTvDiueOXm5ZOhRftZLMoXR6M7bHwrF3EtAwnPnbVHpf/uWwXtzP+lU8dIvuLNhr7Ob58cqBYdqCh/yzB+NToYjEYXydyZLn0yq/748I+4DKujZubjsKRVkEnUuOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HD+Ye1YG; arc=none smtp.client-ip=74.125.227.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HD+Ye1YG"
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-3a476ee8669so790171a91.0
        for <io-uring@vger.kernel.org>; Mon, 05 Oct 2026 10:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791219723; x=1791824523; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZsfW1R9N4QPstXuCZT7OiJ7xuKBOf1oZsvEYYuLcZDU=;
        b=HD+Ye1YGzIXiImlWR3zGYVXshBf+UxHvyW7WDosAG2jHVh4LfYnJv7ANuRxbCqS9aO
         2lMPunBqHs7dLxeOQAdlsEnuw7CR3QARePr80Pz8vQe7f9vMhXqZhN+tdAmYzIgsBP9x
         Vo9rJAM4G03+ppu0QNv7DR62GA0fsExz8xWjyPR8M6vbrqyb5RDwagt5rcs+je8xB+86
         qXPRC5HjoJAV59b/KiHMuvnEahkwc9gQNGWhRmr4Z3UmYyEUD6dh+S+mQ68kpn+OPUJI
         wiDWT8B8fzc+5lRXwEJVCOW4DBKFTC4m6cUmX0Gz+4OIjb6d38elRh3kDMTZqCQrOAQt
         FxKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791219723; x=1791824523;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZsfW1R9N4QPstXuCZT7OiJ7xuKBOf1oZsvEYYuLcZDU=;
        b=2Q95ZrCmubBGKgFNJMpf5ZDu57rLlPO87VDY+AxgBwZFT3kSl9bwZT076KtlFXBq+4
         6sOUTNxoUC/Xuay3fdZPPLpWkLYvcrRZs3e/H7WFxswvM/7myCMmi6ygKuxJmX3D5awD
         oYwGc0TZoSKVrQzsTvTPuXZactpJCrVtp1t73nLAqkv9lAskgX2z/d7J/DX0ovMSEyZA
         7J0NWdnad0v8Mf9PnbJg+FcFwK+IlvbWbgvPZp8echxb7lSeO6+HoynHmwBMpJtDgzBa
         t7bQy9QQVnksld8yDb/fTaxZSunV9CF1lYtnbyn62zMMgZb26YZy1skqRk9y4iMCW2ng
         1OOg==
X-Forwarded-Encrypted: i=1; AKwUvByci7nulQAuU+mvrQtkKljf8eqgN6yfrJ7vjjKEq6PxfYpEsNalLT6YZGqstsloOLFZbrWWrW20hA==@vger.kernel.org
X-Gm-Message-State: AFq9FYK3d1Fd+mXche/hbNn9cxmTVcs5Cif+RXXPGdEf7jNR41l3/MsC
	FboiweifdjM+jMfsodA2pbjNa3Kfja6z5RuqpwTanpu2mcHWG9PhYEB8
X-Gm-Gg: AYBFou0d7IdoXqkhFfsdl5KNrBVf+5E4uJ5J4tsBsjH8f+v5av4YtX1GfDaSmLpSWyK
	LikpKRb/dOHbpoTxSO6L0tNf+sDS1pVypWZd10o8uQqaNMRtfrfwuP/q6TlIxP1G744oGzdDr4z
	r4KrrmIWCge2RrbBg0Z/AdM8tuW5UZUj4PFZ9THfjOWnL5WGQ9OSQHdi42fA1K5J0EOVh2Ih6mf
	88GZSKq0VOhpIAsKxe3pDfSYx3P6wsCabKRYN/lrdkcyhvIl35Vmnruv/vf9+rEjfcNgpFQcv5D
	ZXZoOiG8hY20msYb97aTaQJ14gH+aOaSZgQtdCfDKDaH3wN2FKq96Qt8ZkHgvGZuSGok8YMMSpo
	VPY8RrTNrosA9IOpOSC+cTPgDqvM3molnZdQcVZk+ZzFdWpYbUUb04Gl0G5k20RC50FF5hyLr4t
	eIoWg7RgJVv40F93uKqKY/T0+0/RE09+p00FgcNwHq/IPVJ2XUxqsrhTA0mJxJwu4=
X-Received: by 2002:a17:90b:57c6:b0:3a0:c276:1ec0 with SMTP id 98e67ed59e1d1-3a7872b6af0mr6425813a91.28.1791219722834;
        Mon, 05 Oct 2026 10:02:02 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:3::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dd0cd76bsm9240167a91.2.2026.10.05.10.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:02:02 -0700 (PDT)
Date: Mon, 5 Oct 2026 10:01:57 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, netdev@vger.kernel.org, bpf@vger.kernel.org, 
	io-uring@vger.kernel.org, "Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, 
	Weiming Shi <bestswngs@gmail.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	David Wei <dw@davidwei.uk>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mina Almasry <almasrymina@google.com>
Subject: Re: [RFC net-next 06/15] xdp: Track non-page netmem in receive
 buffers
Message-ID: <asPXa7k-_drxXiI0@devvm7509.cco0.facebook.com>
References: <20261002190018.696925-1-bjorn@kernel.org>
 <20261002190018.696925-7-bjorn@kernel.org>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261002190018.696925-7-bjorn@kernel.org>

On 10/02, Björn Töpel wrote:
> A page-pool memory provider can give net_iov buffers, and
> virt_to_page() does not work for them. An xdp_buff holds only the
> data pointer, so code that returns or converts a buffer cannot find
> its net_iov.
> 
> Add NET_IOV_XSK, the net_iov type for AF_XDP. Add the internal flag
> XDP_FLAGS_HAS_NETMEM. When it is set, the xdp_buff holds a netmem
> reference in the union with the devmap TX queue, which only devmap
> egress uses. The flag is cleared when flags are copied to an skb or
> an xdp_frame. xdp_convert_buff_to_frame() sends such a buffer to the
> zero-copy copy path.
> 
> A fragment from a readable net_iov area no longer marks the buffer's
> fragments as unreadable. The skb layer still treats every net_iov as
> unreadable, so such a buffer must be copied before it becomes an
> skb. Later patches in this series do that.
> 
> skb_shared_info holds kernel pointers, so it cannot be in UMEM,
> which userspace can write. A netmem xdp_buff points to a
> skb_shared_info that the RX queue keeps in kernel memory instead.
> xdp_init_buff_from_netmem() sets this up. Page-backed buffers still
> use their tailroom.
> 
> On 64-bit, struct xdp_buff grows from 56 to 64 bytes. struct
> xdp_buff_xsk stays at 128 bytes on x86-64. Where the largest
> alignment is 8 bytes, as on s390, it grows from 120 to 128 bytes, so
> a pool needs 8 more bytes per UMEM chunk. Only helpers that need the
> netmem or the fragment info test the new flag. Page-backed receive
> and return paths do not.
> 
> Signed-off-by: Björn Töpel <bjorn@kernel.org>
> ---
>  include/net/netmem.h |  1 +
>  include/net/xdp.h    | 56 ++++++++++++++++++++++++++++++++++++++++----
>  2 files changed, 52 insertions(+), 5 deletions(-)
> 
> diff --git a/include/net/netmem.h b/include/net/netmem.h
> index e6dff0b01581..76e4fe878863 100644
> --- a/include/net/netmem.h
> +++ b/include/net/netmem.h
> @@ -68,6 +68,7 @@ DECLARE_STATIC_KEY_FALSE(page_pool_mem_providers);
>  enum net_iov_type {
>  	NET_IOV_DMABUF,
>  	NET_IOV_IOURING,
> +	NET_IOV_XSK,
>  };
>  
>  /* A memory descriptor representing abstract networking I/O vectors,
> diff --git a/include/net/xdp.h b/include/net/xdp.h
> index 07231adfb5f8..80931490ca3a 100644
> --- a/include/net/xdp.h
> +++ b/include/net/xdp.h
> @@ -11,6 +11,7 @@
>  #include <linux/netdevice.h>
>  #include <linux/skbuff.h> /* skb_shared_info */
>  
> +#include <net/netmem.h>
>  #include <net/page_pool/types.h>
>  
>  /**
> @@ -81,6 +82,8 @@ enum xdp_buff_flags {
>  	 * XDP program is not attached.
>  	 */
>  	XDP_FLAGS_FRAGS_UNREADABLE	= BIT(2),
> +	/* The txq/netmem union contains a receive netmem reference. */
> +	XDP_FLAGS_HAS_NETMEM		= BIT(3),
>  };
>  
>  struct xdp_buff {
> @@ -89,7 +92,12 @@ struct xdp_buff {
>  	void *data_meta;
>  	void *data_hard_start;
>  	struct xdp_rxq_info *rxq;
> -	struct xdp_txq_info *txq;
> +	union {
> +		/* Valid for DEVMAP egress programs. */
> +		struct xdp_txq_info *txq;
> +		/* Valid for receive buffers backed by non-page netmem. */
> +		netmem_ref netmem;
> +	};
>  
>  	union {
>  		struct {
> @@ -104,6 +112,8 @@ struct xdp_buff {
>  		u64 frame_sz_flags_init;
>  #endif
>  	};
> +	/* Kernel-owned fragment metadata for non-page netmem. */
> +	struct skb_shared_info *sinfo;
>  };
>  
>  static __always_inline void xdp_reinit_buff(struct xdp_buff *xdp)
> @@ -138,7 +148,7 @@ static __always_inline void xdp_buff_set_frag_unreadable(struct xdp_buff *xdp)
>  
>  static __always_inline u32 xdp_buff_get_skb_flags(const struct xdp_buff *xdp)
>  {
> -	return xdp->flags;
> +	return xdp->flags & ~XDP_FLAGS_HAS_NETMEM;
>  }
>  
>  static __always_inline void xdp_buff_clear_frag_pfmemalloc(struct xdp_buff *xdp)
> @@ -150,6 +160,10 @@ static __always_inline void
>  xdp_init_buff(struct xdp_buff *xdp, u32 frame_sz, struct xdp_rxq_info *rxq)
>  {
>  	xdp->rxq = rxq;
> +	/* Do not initialize the txq/netmem union here. DEVMAP generic XDP
> +	 * sets txq before this helper is called; receive drivers set netmem
> +	 * explicitly.
> +	 */
>  
>  #ifdef __LITTLE_ENDIAN
>  	/*
> @@ -176,6 +190,33 @@ xdp_prepare_buff(struct xdp_buff *xdp, unsigned char *hard_start,
>  	xdp->data_meta = meta_valid ? data : data + 1;
>  }
>  
> +static __always_inline bool xdp_buff_has_netmem(const struct xdp_buff *xdp)
> +{
> +	return !!(xdp->flags & XDP_FLAGS_HAS_NETMEM);
> +}
> +

[..]

> +static __always_inline netmem_ref
> +xdp_buff_get_netmem(const struct xdp_buff *xdp)
> +{
> +	if (xdp_buff_has_netmem(xdp))
> +		return xdp->netmem;
> +
> +	return virt_to_netmem(xdp->data);
> +}

You keep adding methods that are not used in the patch where they are added.
I keep getting confused :-p

For virt_to_netmem, maybe a meta question: does xsk pool need a treatment
similar to the socket path? Where we did s/page/netmem_ref/ ? Then might
be less reasons to special case?
