Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439268;
	b=R8Ve+3fI8RiR9MZDkKiG5mdTwKZhIs4INqXIAUkExR2mCUMSxfCB5CYhtqIHDgVFEKkj
	 M14Dhb0WNcVbKzcV6n33Xcye+eqzby2SvN4MXYSMJleTah2VX7/CvgOESug48YrEEAHJN
	 /W/Wl9uqHhFzgZKxlftHs7Du9SC384t9FSpsegn1HsD2/tk2kyLcCO8V/3+LBPvg6+1y5
	 jHVPPj63qA/v0/mMPCN79ulsaBRg5w/P4nVxIeuhObCRFoMgYUw6M7rDQPjI/+W2AUSxX
	 KwgQ5uhjMnpB3nsHNLTAiHAIBN5B/fef005Nzew2bs432U+wCrY5/Hp2Qskm8J2V7tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=F43DNKKfhUAoEAOcfO/HFf7w3xTwpvN1c5+q7kJ/AJQ=;
	b=BmVWpp6NPBOtW4sXc48wQXnjRJ9Yk6VSu2UYlxnKb9/KuISVLIxGfjtJOlyYCygKdjfL
	 RouhW2SJuPwoCn5vXI5yrhmShcNVQytjpO1ToqqbDWH0Cb0xwnK0UiSqcSPeXpjNOW8Nl
	 IWA8RYox2B1msImJlQDGq7dqWm/smucdAH/ifapGrMGU+btVyJjlNr7h3OrKP0bY9lZt2
	 vrhhBUoRq22adnfkJxGN4Ax0P5ZBoVp2foREG16NaTdZ4g8OW/PrcKOjF5z3FHYgP9HCA
	 tn4JKn7PWlQM8gfci4FZP57X/ECl0omBa+iFJ7F7lgSZuvVawUJ3e9Y7/jorkqenpUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O0ntajgG;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942E460A3801
	for <io-uring@vger.kernel.org>; Wed, 11 Nov 2026 23:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 942E460A3801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O0ntajgG
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36f758312e0so1644181eec.0
        for <io-uring@vger.kernel.org>; Wed, 11 Nov 2026 15:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794439267; x=1795044067; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F43DNKKfhUAoEAOcfO/HFf7w3xTwpvN1c5+q7kJ/AJQ=;
        b=O0ntajgGNrfKFATlaSWgSLejjNVQgDjxhVsVSDttqGtq5aviS683LBngKpx4uv3XAj
         dDXGAMnqhsJSWt+XdWei6LCeTtI0eQn5Nl+kVt5xLA7YMoToNjUv3RXoZQnXBzmCAAon
         58HWQLnHa7Grvb7KMRM3cEQbiFQWgxyWzConOroVYW5bzGieZJD/P3DhTxaoXAjODtdB
         g8pGGYhCkd+NRGJqXJU/6bLHnDl0nv1mZ9iVzHlkbKadEUNRBQGHmA6oJ1OCXi/IwLID
         e7Vg3qQ2RpyRtzo25N8hBpRXogew+6Y7BNCYMMxSdgjwXmY/3cPgCHBTPC3v80B5QRTi
         7uyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794439267; x=1795044067;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F43DNKKfhUAoEAOcfO/HFf7w3xTwpvN1c5+q7kJ/AJQ=;
        b=gjdjk/hh4+pwTM1yAmvQWHGCUycN7y7IPe3IDzaUvjvwx7aqNMXN7Ih5stggXOE4pP
         R7Q/Klh4Z8UuBfHe4K1xd9SmLC4R9VntFnEJ0UY+J+1ZX92EKnxGUZHQUmXmdSZm7o5t
         CZ0EnszVjIjn2mCigRhy4WEUfiDTI4iMkBUsqj31odjy3mYWuGzfGsgzvpjCjDeePgvo
         uQCTFrWDkfH3dMKOOlTWntLXGeN03F3adHy24DszyuYZzAt4brbh+TLvhP9RnrZLDUKf
         Pc0Nvb3an3nvTc0OJCu7aGxUfEqn/wgdlT99PGpof/QA8+bHxN/Qzgog9sg9/s1pmDn8
         rULA==
X-Forwarded-Encrypted: i=1; AL+hErGUuU1aY4H4FCgKHXLOTPbthLsm+JeDAde0QPY3taQ6FCd1F7oa7kcJ4NZmKxwi1W/ipcDNWhPQ3A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+pKFM2YTPTVMNRaqCtp/00oGzvDUjnSZXyvB/nJAmw36jFg+wO
	jL6r1dvF2Af3anRLujZkWdFyuixC5bcWNU+QM58ImVCiy9Mvyl8RNiUK
X-Gm-Gg: AYBFou2z8vV40W6fQDPTPT2OWdhM9S80lHI+a9pmOJMot0TQJvIO9JCXXNQvmx4y7e+
	dbLHtwNbJPwn7rDuAoK7LFYppMqeGtqFLAGVulEpZCtIrYKav47p3+qlc9wTFhm8oyaunPjgOXh
	3f/t0UEnwMH/C96ZZhIeQTzJoPDUPsOWOj/MiKMai04o9eM9DHk2wSyEmkJpzXH5Do/wi8KNcUJ
	/NeRuE+7VOeeFPaW1NgFvuVTylAQxaa4OeUZe+AC9O2jpH+2JrMKXOYROHrci4LOh9hrrF4oz88
	9ryQj8mwJgnZkLBJmDnDLw1G1wrLdQLPinUP7s9eHcsNR3KneKyUhQtqyiLYIGlDPOLe0h+TGCt
	I1uMC1SoqxBBj8WyvY9bUNPZ7hYkQPUWME95c2jtd6uOq53znVSNp0uAEzVnhWHVVTb9QVeUcFb
	p1e514LFbtOwzXFZmlHaCS2Ajcnmbh2RaHTBeaYV8qDsYFIWGIL9EMLkGcdiUmb6c41LJlA5e3R
	75eh10eDdYSuASF9TMeEzxl598B1sUihodJufvfynjYuQb4RV8M96DCDGhfhf1K/vMnK2QLzFHy
	Rf5Hlk+l2VARTvegTaKoC7xRPz0VZZLMI8XkBGa7nAayrA==
X-Received: by 2002:a05:7300:6dac:b0:36f:4981:da16 with SMTP id 5a478bee46e88-37686754f0cmr6158044eec.25.1794439265724;
        Wed, 11 Nov 2026 15:21:05 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:72::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm19142236eec.11.2026.11.11.15.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 15:21:05 -0800 (PST)
Date: Wed, 11 Nov 2026 15:13:02 -0800
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
Subject: Re: [PATCH net-next v1 06/11] page_pool: Coordinate refill with
 memory providers
Message-ID: <avT2Fj5qjbJkArpg@devvm16445.scu0.facebook.com>
References: <20261110102039.1002605-1-bjorn@kernel.org>
 <20261110102039.1002605-7-bjorn@kernel.org>
 <avOtxBw_grmuDJae@devvm16445.scu0.facebook.com>
 <87tslnrwgt.fsf@all.your.base.are.belong.to.us>
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
In-Reply-To: <87tslnrwgt.fsf@all.your.base.are.belong.to.us>

On 11/11, Björn Töpel wrote:
> Stanislav Fomichev <sdf.kernel@gmail.com> writes:
> 
> > On 11/10, Björn Töpel wrote:
> 
> >> diff --git a/include/net/netdev_rx_queue.h b/include/net/netdev_rx_queue.h
> >> index 989120cbf452..ca12cbf7b825 100644
> >> --- a/include/net/netdev_rx_queue.h
> >> +++ b/include/net/netdev_rx_queue.h
> >> @@ -33,6 +33,12 @@ struct netdev_rx_queue {
> >>  	struct pp_memory_provider_params mp_params;
> >>  	/* stamps the page pools of each queue allocation */
> >>  	u32				mp_gen;
> >> +	/* NAPI of the running queue, for memory provider wakeups. Set while
> >> +	 * mp_armed, and if the provider has a refill_done op. Written under
> >> +	 * the ops lock, read under RCU, see netif_mp_wake().
> >> +	 */
> >> +	struct napi_struct __rcu	*mp_napi;
> >> +	bool				mp_armed;
> >
> > The comment should explain why mp_napi != napi? (I do not understand why)
> 
> Fair. It's the same NAPI, with other rules. napi is the driver's
> association: read under the ops lock, and not cleared when the NAPI is
> deleted. Provider wakeups run without that lock, from socket syscalls
> and ->release_netmem().
> 
> mp_napi is an RCU copy, set only while the device is up and the queue
> isn't restarting, for providers with ->refill_done(). netif_napi_del()
> clears it before its grace period. Setting it also schedules the NAPI
> once, which replays wakeups lost while the queue was stopped. I'll put
> that in the comment.

And all this only to make sure that we are not recycling something from
the old pp into the new one? And reworking existing pointer to change/update
its lifetime is not gonna do it?
