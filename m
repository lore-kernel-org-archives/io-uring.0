Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530523;
	b=Zh9i9O2aBHhLGZv+JWSuXoc5SH/oGltYe4/b/BzA9HATw84qyYDC1aGNZTESYtr3fr1K
	 fo3AeAHwAE+uN4B99I8XJePhlSoGdIYQ9P61vuUr8HXIBck88ZfbYR4Ts4eBDCDgIAQ4f
	 hQzjmb9cfM2jTTZ6Q0ChifUAxPUWLjdEX2sNaJOPraV+yEne6yVQAHDBI3icS1ppnJok0
	 Of8JPaQeAMH/KYVnCDsI0D08hSl3ZEEyjJzizYO/UDlsFAoH7RC969mpSR+EDsYxkGs29
	 M92Pg66GOqL5hoM+z3jSxC8t+Tl5kP/vowzbjKWRuBEDduTdKybDfn6qA/8Vwqxo9IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=rN0Ie5yME6hsx7pm+x3UNEKpXeb1k8nlYJCB408a9fM=;
	b=IpdmujSJTAkQUvA0JA+1wH+G9za91psouBu4hadIMYNXOZu+sT5dn6/5FMO65oZ5+Vrk
	 wW0s2IGvqZQ8zB76b6r4QBB8oxecQPqgiSsh4F0M1cXKdhRdrqOvfaZXkwm+Xu5SYQM7b
	 eNCY66TQqL5kHvc7GklobRbUQvObONQQkz/gLA4bRtzOEZr4ARXkgpwM827hIjwx8CeZn
	 4kZmW1+ZWTe7+ojwp/5GMS97QoxAGFQuX6Db3GqBiRWkqVWNm+sTvK7u0KEtlm4oN1Rs+
	 Jz5YfNP9dpCC8okEwfS7QNxCDvuqss5wdjkqra+8HE6U7nBkqkgRLVXXicTBKpxJP6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wS4wsUX6;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1FA606A331
	for <io-uring@vger.kernel.org>; Fri, 13 Nov 2026 00:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F1FA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wS4wsUX6
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36f758312e0so137192eec.0
        for <io-uring@vger.kernel.org>; Thu, 12 Nov 2026 16:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530522; x=1795135322; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rN0Ie5yME6hsx7pm+x3UNEKpXeb1k8nlYJCB408a9fM=;
        b=wS4wsUX6ixKaKqiYjQsFCJYaIJKn2BaV3f3zkmlFUG5frnXleY4I+yDFt5BO59cWXS
         E5JETtLS9PRnKnT4J1LIE09WxVAAseI/wWSe9ZZeOV6x8kziPaEXsCY6VA4BF3ndFAYK
         RWSIBklti8rhZx7Uw73mxUbumVjoZyDIRHpcBnNQhm2oyRlOtVBUnzHH7YKMa/VKxtK6
         XRHkKorE0Qv/+WieykgVMwoTnmMHuUtoJt685pJPRiQLmu8VwLBvHw1reor7fxpobajo
         9lGqkOBDxWRjtpOvgGDO8xvWJO5ml5wtEjHhs/tWxIBi40DGSxddqrSQp+uaaq/lq/0t
         sryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530522; x=1795135322;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rN0Ie5yME6hsx7pm+x3UNEKpXeb1k8nlYJCB408a9fM=;
        b=uV5siNJCTr4AZPlUxiNMF/mDGG+S7UIy1tQkQQ3Uqk3LksISX0b8KbmdF0Zrpn5/W7
         WjJ78BH+QrYSxlakvouPitdZEwwVZS6surSr9aJc1OUWygDCYhOGxycah/Ros+hVSLxq
         IqZHDyO4iJs5oRxqmVI/Slk/aHSqZ/BspuDALxx9qaddcyCw6SADZJB0mctnr6aLF42+
         PH6log2GQfQcv9nDW3KBSx9efNC5dB5OV7g0Bd+DCpruqmG16soWJowK2SS2LYlQCTNq
         3txcREGdfXEKfql0cTs2iDYAVVIIlSnf6dnOQAuDc+lJw6j6+JOXukHC2Oqi2BHPJjil
         i5FA==
X-Forwarded-Encrypted: i=1; AL+hErFfWPTLDbj83C4uX2WTO+DC+D8aosLm6wgcGNigzVUDj18OJ29w+G7rLwHcu57KzbZrOADP1RgWCg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8XlvTuW1zO1AiOqVWPaXqi1ObVS8zoN4kw56Zg02vPiqfH35on
	HsFxycKKvEOYhLHk5WNlJa6CWAKxrI8+BQmgF171KVir+haypA+baX+X
X-Gm-Gg: AYBFou2Z10CQVkohj+yOxGjwghTdeD4wnvdqGX1ZjQ8okW/MbxVszB4YZd9HqDQ/ihi
	j0q3DJymeXYNvO4kffMIe4QmEm+/1BpuAfE2PaVZqIq+LARIZU4FxwzQLaxWUtd5b11W+ZorzaZ
	w/vciH9YUM4pRHpJyHWSJKEg0u8s09pDRfV2VAnfyFBLm2zj2c7xLokL7KzANjgPqqQhbpkbkcK
	BrIrtkhNi/tZ+lLpQgRWwUvHD3qBDrdzfgHQgV5rzfyIAaDkr/9kvvVyeQqGgdH/FnFxMfdOMXI
	BwuH7Q6BA10UbHqQwPCXsWXq4ZS78zS4PY20nPMR2cppLhMq9dnHT4JX59HWwavWDcNHR4VR1Wt
	Vr+XeMTomvHbb7+32d3VIfJZofLiI6uuPJXCqoYPGPsIoT0PwD83lwxJpz+XcQk7qH9CIbj5J9D
	MQyS8OjmFBwt/ZXtdfwGtSLrwolmOZaHtUXxBmbIgUYBzp57SgzYjYseyrZg30EhCFN6IFvsBTb
	60yaSHW6ZOvNNlieE4weEfu0SITIiXZ+3W7qkt/hdFLTXjHCoUuU5oTPzwsDjahpN4vc2XI68gH
	P9CRw7p0SE/wIHT6+myEkhMn
X-Received: by 2002:a05:693c:8852:b0:36a:1452:8dad with SMTP id 5a478bee46e88-37966f32039mr734196eec.20.1794530522135;
        Thu, 12 Nov 2026 16:42:02 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:71::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316f2sm1934134eec.9.2026.11.12.16.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:42:01 -0800 (PST)
Date: Thu, 12 Nov 2026 16:21:27 -0800
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
	io-uring@vger.kernel.org, Mina Almasry <almasrymina@google.com>, 
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, Weiming Shi <bestswngs@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stuart Clark <stuclar@meta.com>
Subject: Re: [PATCH net-next v1 02/11] net: Add memory provider capabilities
Message-ID: <avZXuHWBUTJvJnEu@devvm16445.scu0.facebook.com>
References: <20261110102039.1002605-1-bjorn@kernel.org>
 <20261110102039.1002605-3-bjorn@kernel.org>
 <avOYe27x-AlxmyK9@devvm16445.scu0.facebook.com>
 <87mrrfa6c4.fsf@all.your.base.are.belong.to.us>
 <avTy21_cSnyMdbb5@devvm16445.scu0.facebook.com>
 <87cxsarvwd.fsf@all.your.base.are.belong.to.us>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87cxsarvwd.fsf@all.your.base.are.belong.to.us>

On 11/12, Björn Töpel wrote:
> Stanislav Fomichev <sdf.kernel@gmail.com> writes:
> 
> > On 11/11, Björn Töpel wrote:
> >> Stanislav Fomichev <sdf.kernel@gmail.com> writes:
> >> > On 11/10, Björn Töpel wrote:
> 
> >> >> +	if (static_branch_unlikely(&page_pool_mem_providers) &&
> >> >> +	    WARN_ON_ONCE(!page_pool_supports_frag(pool)))
> >> >> +		return 0;
> >> >>  	if (WARN_ON(size > max_size))
> >> >>  		return 0;
> >> >>  
> >> >
> >> > What's the deal with that? How do we get here?
> >> 
> >> Hey! Thanks for taking a look at the series!
> >> 
> >> An explicit frag call on a whole-buffer provider is a driver bug: UMEM
> >> chunks can be smaller than a page, and RX gives the whole chunk to
> >> userspace.
> >> 
> >> But page_pool_alloc_netmem() also picks frags for small requests, so a
> >> valid call can warn.
> >> 
> >> I think it would be better to make it return a whole buffer and its
> >> actual size. The WARN stays in the frag API, before taking a new buffer?
> >> Wdyt?
> >
> > I see.. Idk, I'd still return 0 here, but without a warn. Not sure
> > we want a warn for any api misuse? Returning no netmem is gonna be enough
> > to debug things? As for the calls from page_pool_alloc_netmem, I'd also
> > handle it explicitly? if (size > max_size || !page_pool_supports_frag) ?
> > But no strong preference, up to you, was mostly trying to understand
> > what we are warning against here :-)
> 
> Yes, page_pool_alloc_netmem() gets the explicit check. Thanks!
> 
> For the frag API I'd keep a WARN_ON_ONCE, like the size check right
> below it. A silent 0 looks like an empty provider: the queue just
> stalls, and nothing points at the driver. With the helper fixed, only an
> explicit frag call on such a pool gets there... Wdyt? I'll probably take
> that route for v2.

I guess, yeah, makes sense, let's return full size and warn. Maybe also
a short comment will help to explain why?
