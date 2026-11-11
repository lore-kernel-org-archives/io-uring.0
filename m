Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794433556;
	b=gQOSfFqhQ97ik107JD72jB0neeRWdIZ/3m4lls5HwfS1Sr/aqT4l11+PSCdbFktLsis7
	 C9KrIgljIRzcXHeCbQPIF2TEFXEpAU4+i2OWNpSYzXmTdUYIYZPL+YvZE/2dIBAu4VwYm
	 1qk5hzchofmimKZxe2axtVU40x0WgD56JhgdO86P7g0IeUKDscyE+Lkv6ecyfktGuvL6s
	 8u2UiDkAH3NVK6xYmhAledmRjDS5B8+zdywC+7MZIeRsHU1zIZuyE04HrS1z7pBWJFyi/
	 G+7j9eBJCWEHfD5yfNGB2ukhFyPyQi6fSEnFoFMtSfZWrs4i89XXUHdZDkyra5P9VVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794433556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=uLiiTa/Gb7h1TxDGjxBpe1u+WEWowZlfNkmPxqWemd0=;
	b=00awxiZtQ208yiULZBtSmL4oe7seiFOrcy54pwgYahLM8dnBhHK+UhxCqMqKPQ8XlX7y
	 Xk7jfgAWre/F8Oz7vI90nOsBwc7ch4FcGtmBRIWPd4nGXWMAABtQ+teEtn9hlnqIuOdcE
	 lzOqaUJ5ZxXjtFd6uYtZHcfJmr1/+sCBmqo0+0Ua/90sAhAY75m53CiIBpRnTnB2GTgmz
	 V47zRj4AIjEY5v1gKnWhYjsXv2wX7rcesv9QSEzJT8J1bkKiDyY1YpksWBn16YsumppmY
	 bRAAgJtQLOEL5TxuSzA6JV8kbpsOEQgQ3fGL8cNiYWjvjULcDX9BZjKC1tpyVeo0cig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q3o1yGAM;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76750606A32A
	for <io-uring@vger.kernel.org>; Wed, 11 Nov 2026 21:45:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76750606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q3o1yGAM
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36f8cdd30beso6509842eec.1
        for <io-uring@vger.kernel.org>; Wed, 11 Nov 2026 13:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794433554; x=1795038354; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uLiiTa/Gb7h1TxDGjxBpe1u+WEWowZlfNkmPxqWemd0=;
        b=Q3o1yGAMmIMBrIgCVDWk5ZLj3xdQII6hHVqnmtuQqxF30ztQZShfrSaWGPDsxxdTqZ
         NF7wxW4425xwPino3SFafvANsRF6RpeNzwzIY8MrQ8robbnXnI+4LZskJxLaAMM3AMB9
         sQG6Cn9vcAEToQ9Qyqeg2tccYh/hkxtK41BaGgXRj4cOHu3iXLo/F3oVJixljU9STury
         0X1RK0TMK2Qi4v6SRrnM/YApgfD3gpxY8f4LfgMaXRuoog4bqcIwbS0tGnEw0nx4+0XM
         GqGAwjlevoWNUoYT0pKtPnd4QuhU8e77GwG+nJzG3ZpPjjUpkqi+Wocl1zaTpYoPtW38
         fX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794433554; x=1795038354;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uLiiTa/Gb7h1TxDGjxBpe1u+WEWowZlfNkmPxqWemd0=;
        b=wB+UAFA9+bWvM+SO1U44ofqT/QT0SysnxhMaY/4CmDfMinn6Gj6e2N7d+vTStvxoSq
         +brpZDRkSSh4TxvA1q/r2Y3730WSbf1AH8SXJj03roBCPwvaQ7QHWfYLb7FnmCqMGlAf
         8wBdu/FvTm4X8KyM/pQM91vyGb6n1ISWulJgYwGQJXe35jVD6aUxRZ+S9peihJXiVAb3
         wYTOFJm17SPqKdtbu0boQMff2y4aEp1cXSfW2m5TbL9jUtg6Vf4yBiQfjmGCk8KSmJeA
         9rYDP8DwlvuhkjV2c+8RFIP7kz2RkFRMP21PqScfh4ts4Bw2CZlYJmZdK+5iq6q8NgM5
         Y1SQ==
X-Forwarded-Encrypted: i=1; AL+hErH50nNh+IQ1kdedfR56Ra6+mIJglfUPylBhHLrRS0Xe2rFwfiEEixSb2dGqWc0x6Tk8ionXIZxJbA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+L9QwIjr97wXZJRZqggwpmeXMwu0D5SlzR+wYdQyMbkFVdO8Bx
	bQeoP7vwGmID54HKE/XKkkxnDjPsZJnhrORjJ8rgSRr/Lq4ViIMqc1f9
X-Gm-Gg: AYBFou1ZRJMvz0BQ8Jaq/m1VBZbimwLm02g6iCSc2Or/rDFPlWJP5rqAyTlCPWyYV0u
	REMrsHB3hgfwwo0U9c/6GwbXSMR4ek3yJpw8C/24iCEtmMAUzd0Hl6Vz6lfT1QaI4X0/rV3bYQl
	sYcKNg9SJ+Fm0rgngHtmKqzmdDSfQk6vBzSc0zWvWcjjikyjHR/522AlxNNGbw2ub99GV5ordQy
	LxzDqS0u9FAJjRS0iQtyoCeBFs4hRh/UByEbDEAo6NIocjXeb3sBfXJa2WpEk2EMqStE+K7/c+D
	aoZomOmxBGnWaaO4EILp78rBVdQwcBpN/+pOVVUMoIFgq9eAZgMOpSXhckQUf3x4Bz+ejnQaYFO
	aErr5TS9H25M/x2tY3p9Wc8SYXFNUgLcz+1h4pedQ6T425s805rvTEzSUG5HONfsZnkfg7tm/U1
	YQgoBSSOvM17YJlRH5MrYdgxP833t+HJX6IPy8h9Oh9e74YBEhUllx2KF+vbLiYckTfpDqzv8hO
	bn/pE26ZM3Ny6TTr5s+sRoBEv/XtpFLMrrXQU4xI+KRQBZMG/dZemYK+RzWyhdy5FgGNlqzvWK6
	grRO90aUeqUgM8KqYv5ZThQSNGr3z13m6/9Zv0dW9l8ChovfipB47RV5kdx7bEDeLYe0hrdIyyi
	+L9/z2474mP8tZ/tqgsOjwScDSvSW0jioReRoUw==
X-Received: by 2002:a05:7301:3f19:b0:36f:3da8:dbc8 with SMTP id 5a478bee46e88-37686d31fa8mr5532433eec.31.1794433554164;
        Wed, 11 Nov 2026 13:45:54 -0800 (PST)
Received: from ?IPV6:2a03:83e0:1151:15:c24:4ad9:f660:1904? ([2620:10d:c090:500::6:1f95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9e03sm38006432eec.23.2026.11.11.13.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 13:45:53 -0800 (PST)
Message-ID: <f9979d3b-2a6a-4fa4-ad4d-10e5d4958678@gmail.com>
Date: Wed, 11 Nov 2026 13:45:51 -0800
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v1 10/11] eth: fbnic: Support RX buffers it
 cannot split
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Stanislav Fomichev <sdf@fomichev.me>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Alexander Duyck <alexanderduyck@fb.com>,
 kernel-team@meta.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>, netdev@vger.kernel.org,
 bpf@vger.kernel.org, io-uring@vger.kernel.org,
 Mina Almasry <almasrymina@google.com>
Cc: "Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
 Weiming Shi <bestswngs@gmail.com>, Nikolay Aleksandrov
 <razor@blackwall.org>, David Wei <dw@davidwei.uk>,
 Alexander Lobakin <aleksander.lobakin@intel.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stuart Clark <stuclar@meta.com>
References: <20261110102039.1002605-1-bjorn@kernel.org>
 <20261110102039.1002605-11-bjorn@kernel.org>
Content-Language: en-US
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
In-Reply-To: <20261110102039.1002605-11-bjorn@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/10/26 2:20 AM, Björn Töpel wrote:
> fbnic packs several headers, and several payloads, into one page. A
> provider without MP_CAP_FRAG needs one descriptor per buffer. Give
> such a buffer a single reference, program the queue so each header and
> payload takes a buffer of its own, and drop packets that break this.
> 
> Header split is now set per queue, so link up changes only the drop
> mode.
> 
> Signed-off-by: Björn Töpel <bjorn@kernel.org>
> ---
>  drivers/net/ethernet/meta/fbnic/fbnic_txrx.c | 119 ++++++++++++++++---
>  drivers/net/ethernet/meta/fbnic/fbnic_txrx.h |   2 +
>  2 files changed, 102 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
> index bfaa284e497e..d96c957d6fba 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
> @@ -761,8 +761,14 @@ static void fbnic_page_pool_init(struct fbnic_ring *ring, unsigned int idx,
>  {
>  	struct fbnic_rx_buf *rx_buf = &ring->rx_buf[idx];
>  
> -	page_pool_fragment_netmem(netmem, FBNIC_PAGECNT_BIAS_MAX);
> -	rx_buf->pagecnt_bias = FBNIC_PAGECNT_BIAS_MAX;
> +	/* A whole buffer has one reference. The packet takes it, so the buffer
> +	 * may be reused before its BDQ entry is cleaned.
> +	 */
> +	rx_buf->pagecnt_bias = 1;
> +	if (page_pool_supports_frag(ring->page_pool)) {
> +		page_pool_fragment_netmem(netmem, FBNIC_PAGECNT_BIAS_MAX);
> +		rx_buf->pagecnt_bias = FBNIC_PAGECNT_BIAS_MAX;
> +	}
>  	rx_buf->netmem = netmem;
>  }
>  
> @@ -792,7 +798,8 @@ static void fbnic_page_pool_drain(struct fbnic_ring *ring, unsigned int idx,
>  	struct fbnic_rx_buf *rx_buf = &ring->rx_buf[idx];
>  	netmem_ref netmem = rx_buf->netmem;
>  
> -	if (!page_pool_unref_netmem(netmem, rx_buf->pagecnt_bias))
> +	if (rx_buf->pagecnt_bias &&
> +	    !page_pool_unref_netmem(netmem, rx_buf->pagecnt_bias))
>  		page_pool_put_unrefed_netmem(ring->page_pool, netmem, -1,
>  					     !!budget);
>  
> @@ -993,6 +1000,19 @@ static unsigned int fbnic_hdr_pg_end(unsigned int pg_off, unsigned int len)
>  	return ALIGN(pg_off, 128) - FBNIC_RX_HROOM;
>  }
>  
> +/* A buffer that cannot be split has one reference and takes one descriptor */
> +static bool fbnic_bd_one_desc(struct fbnic_napi_vector *nv,
> +			      const struct fbnic_ring *bdq, unsigned int idx,
> +			      bool ok)
> +{
> +	if (likely(page_pool_supports_frag(bdq->page_pool) ||
> +		   (bdq->rx_buf[idx].pagecnt_bias == 1 && ok)))
> +		return true;
> +
> +	netdev_err_once(nv->napi.dev, "Bad descriptor for a whole RX buffer\n");
> +	return false;
> +}
> +
>  static void fbnic_pkt_prepare(struct fbnic_napi_vector *nv, u64 rcd,
>  			      struct fbnic_pkt_buff *pkt,
>  			      struct fbnic_q_triad *qt)
> @@ -1007,6 +1027,17 @@ static void fbnic_pkt_prepare(struct fbnic_napi_vector *nv, u64 rcd,
>  	/* data_hard_start should always be NULL when this is called */
>  	WARN_ON_ONCE(pkt->buff.data_hard_start);
>  
> +	/* MAX_HDR leaves no room for a second header in a whole buffer, so
> +	 * the device closes it, with PAGE_FIN, after the first.
> +	 */
> +	pkt->add_frag_failed = false;
> +	if (unlikely(!fbnic_bd_one_desc(nv, &qt->sub0, hdr_pg_idx,
> +					FIELD_GET(FBNIC_RCD_AL_PAGE_FIN,
> +						  rcd)))) {
> +		pkt->add_frag_failed = true;
> +		return;
> +	}
> +
>  	netmem = fbnic_page_pool_get_head(qt, hdr_pg_idx);
>  	pkt->head = netmem;
>  
> @@ -1032,7 +1063,6 @@ static void fbnic_pkt_prepare(struct fbnic_napi_vector *nv, u64 rcd,
>  			 len - FBNIC_RX_PAD, true);
>  
>  	pkt->hwtstamp = 0;
> -	pkt->add_frag_failed = false;
>  }
>  
>  static void fbnic_add_rx_frag(struct fbnic_napi_vector *nv, u64 rcd,
> @@ -1046,8 +1076,20 @@ static void fbnic_add_rx_frag(struct fbnic_napi_vector *nv, u64 rcd,
>  	netmem_ref netmem;
>  	bool added;
>  
> +	if (unlikely(!fbnic_bd_one_desc(nv, &qt->sub1, pg_idx, !pg_off))) {
> +		pkt->add_frag_failed = true;
> +		return;
> +	}
> +
>  	netmem = fbnic_page_pool_get_data(qt, pg_idx);
>  
> +	/* Without a header buffer, the packet is dropped. */
> +	if (unlikely(!pkt->buff.data_hard_start)) {
> +		page_pool_put_full_netmem(qt->sub1.page_pool, netmem, true);
> +		pkt->add_frag_failed = true;
> +		return;
> +	}
> +

How would we get in this state? Does the device need to misbehave and skip
the header descriptor?

