Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792457675;
	b=yjLZ7EI8BUEOCoEpG0WnqzvSVhzUoBmxxS4NFoFEqmoeCrq8yqsCdfKuF1YHv0JTDqsR
	 fpddMqlOUHTX3EsyEjo1pnH2pwchEQ+Fiz5wVck7LC2CWHoVg0H88logb6VqNDAxWfALM
	 v3FxiYzyMexLOX61nNVYlI7WBgYFRj0YV5VksP9xc8v71f18eEpO6ckfiYmmEAQvk3pmK
	 1K+G1D4t67fG0CrHvTUpshR/rEpDolM+bSGgOc4rVxBjsS6Xh6t/iph90A+SQFPFGH/5n
	 lXZLAcG/+Jkyc1spIbPyPfxI0a3yWK6REBWwEQtsZyVMSANGimo/qU3ZaE+FiFubwYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792457675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=QZ7Pz6/D14wpEk1Ddz2f2Hy8tiok/YGXHe6Nz544rD4=;
	b=ASCBnAuCi97qiIyihgC5dPLGjLfednyS3mXp1bbnxWgU6MpI02fXHbsvMTv8hCjS0YrS
	 3qGfX+IwadZWVIe6h8v5BHOw+KJYlL0naVSoe1ddtzSSBfom/PoLQOqFEqrRxSSTNP6di
	 jE9yribw6Djegbi75Ayy5T5Dy+x/TOK34hD0fQ9JjHt9l2BvvIPwPewjU3mlJ+JlvmXii
	 d+mRA2ZJ2nqOvDFivIQQEFdA4DybOm6r3vx+cl6XPQbQc7UiLdEEFhb8RWuikwLSw5Msn
	 SDzMZ3AtfoHLSBSYExNU2bNX54dBy+qP0CbTJ+7lqFUZXI7BHYIqq6jO/t2F+CgCkYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=PkMfJZUO;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0217606A31A
	for <io-uring@vger.kernel.org>; Tue, 20 Oct 2026 00:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0217606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=PkMfJZUO
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6df0b02fe91so135083eaf.0
        for <io-uring@vger.kernel.org>; Mon, 19 Oct 2026 17:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792457668; x=1793062468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QZ7Pz6/D14wpEk1Ddz2f2Hy8tiok/YGXHe6Nz544rD4=;
        b=PkMfJZUOFRCxLcMlRL0ZVTWuCLtlBoNPC9FNtc1Iavq5b3XBGwzw0hQlrucBM3w2R/
         MpDcL55XZEkJEsaqs+VKX/LQR+rB6ZPywqquFh4wB0qBym+bFZz+PBkbdQBrix8u4DIx
         xoJX5gtSj7Dn1FNRMpgA/JAY5NUFwsyxd6SvQ3NgyZ8UkY2McGVv3AsJbwCi84oHPO9j
         Z1Mw6ndyCbMtuXYXqpOy6lLKjDxhfEHZvstkZGPW+uvx8+iVwYeohIYPK0dFnfGIDrsZ
         x+t9LyaivIOuH/MY3cJP+vWcY5QMAMYCSIeJaPZu8NE6O3FAy2cKenK1W6zBoIAdtf4w
         7ghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792457668; x=1793062468;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QZ7Pz6/D14wpEk1Ddz2f2Hy8tiok/YGXHe6Nz544rD4=;
        b=emiZJljHft5Ms2LkaV7r6iOad2KTaTFPOr+4yvQGM+QFBUu2Ue3ymXcsd3Edyb9e7/
         xen9XDQkDESecviZmPOKvH8Gnm1LpfS/DRkpnyQZZq+tDVeU25bAa0SyQ/kuR9/ZjBvt
         Y8cB3GuvxUu2NPPE2LXXzDoaK63H2zHSvrRfRc7mJmb2ARj2VfTEz4iPU5+tB46EdheT
         12VytmzLmM1eoHYkLZ/DhO4j98iCushoaLeqICF+Uxfp19e/sAP2IH9kOLNgKKC8fY/F
         Y5YPnENFkcOdv+yAH58CDjYK2L/Ny4w2BrzaIDbNVIAWwWq+I1d+ttYrvMHsoPn9FnpM
         cPYg==
X-Forwarded-Encrypted: i=1; AKwUvByGqmUzpzmE3z2/xoH39cbQV6ynflbhyU7jSgiRdJ5yOdloYOafooCW1sS5s8UVNjWNYa/V0t3DRg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLcMXhjG23qvLqTSqt4ZZFMi8tmvC3b31mRD4RLt5UGRsHBRT4e
	0mGrtZS0flBW0o9JwHCw4NWrZGyL4vuSmO5m/lh5V20wHuMCYjgJ4jKDJxGjPayFUc4=
X-Gm-Gg: AYBFou1WZ+wcHzc1+rHnOYqmHcGnhH4LFZoVqBG4xI4amwKOp8Cxi9wbcSmKMjYnKNc
	jOEo93t2RY9GvxZRukkoS2XoEgrDHH7/vBUad4rktPUAHJul5S0WEH5xeFqrZxlSNujeV/oaZ+D
	k5N0sbecaIBGrdGUYXNLa24e1+eS/LY1paG/S5oPnuy1wkmuChi8txIW2TKfGD3h7GjW/1fTUln
	gy6PAGghfHvyLhHLmC62wzo37qkDk04jgoC07jZRig/O/KZgAD0Hz4q2G7jVUmz3SfYMQcBd27D
	/4TedxbrcSL1Pfz1Vlq6JqCvCs4ksFpFo+i6HgBgVIUTWsSx+IZrA88vz8LKUt9fnzwjnhegwbc
	Kudl36C6xer/UCoX9zHKmc+wwAWOZ5glG2CzSGxZnDNIgXo7TdfZowTshbWskWZLXd9GgpBXmD+
	idN6PpLcJVXwxNWENmoA+QIOt1ISHtP//zsvDPPOabk+XWm2D7ENH7RP5bEcdo7xuoFwPO73IgZ
	dO3FGE4zd3H+lKo84tarmQuKqMhKSF4xN/NqMS0oKPBl+8oj2Wu0FGfAQ==
X-Received: by 2002:a05:6820:2224:b0:6f8:2e98:cfd7 with SMTP id 006d021491bc7-707b9615335mr482415eaf.9.1792457667825;
        Mon, 19 Oct 2026 17:54:27 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a4a00f0asm9634317a34.5.2026.10.19.17.54.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 17:54:27 -0700 (PDT)
Message-ID: <6bc4e237-353b-462f-b388-3844821dd67f@kernel.dk>
Date: Mon, 19 Oct 2026 18:54:25 -0600
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
Subject: Re: [PATCH] io_uring/futex: return a wait's data to the cache when it
 fails to arm
To: Austin Schuh <austin.linux@gmail.com>
Cc: peterz@infradead.org, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261019231243.802569-1-austin.linux@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261019231243.802569-1-austin.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/19/26 5:12 PM, Austin Schuh wrote:
> io_futex_wait() takes its io_futex_data from ctx->futex_cache, and a
> completed wait gives it back in io_futex_complete().  A wait that fails
> to arm kfree()s it instead.
> 
> The usual failure is -EAGAIN from futex_wait_setup(): the futex word no
> longer holds the expected value.  That is routine for a waiter that
> re-arms with the value it last read, since the word changes whenever
> there is something to wake for.  Each such failure takes an object out
> of the cache for good, so the cache drains and from then on waits
> allocate.
> 
> The cache exists so that arming a wait doesn't have to go to the slab
> allocator, and that matters most to the waiters that re-arm the most:
> event loops, often real-time ones.  A kmalloc() or kfree() that misses
> the per-CPU slab takes the node's list_lock, shared with every other
> user of that kmalloc size on the system, and may go on to the page
> allocator.
> 
> On PREEMPT_RT list_lock is a sleeping lock.  A real-time task that
> finds it held waits for the holder, which may be any task on any CPU,
> to get to run and release it.  Priority inheritance boosts the holder
> only up to the waiter's priority, so the waiter still sits behind
> whatever outranks that on the holder's CPU, such as threaded interrupt
> handlers.  Re-arming a futex wait should not depend on any of that.
> 
> Put the data back in the cache on that path too, while the submit lock
> still protects it.
> 
> In an event loop re-arming one IORING_OP_FUTEX_WAIT per message under
> load, 0.39 arms per message failed with -EAGAIN, and io_futex_wait() did
> 0.39 kmalloc()s and kfree()s per message.  With this change, 100,000
> waits that all fail with -EAGAIN do one kmalloc() in total.

Patches like this have been posted before, and my question is
always "is this a common case?"? Reading this:

> Notes:
>     Based on for-7.4/io_uring (5b01d5955ac2).  Built for arm64 with
>     PREEMPT_RT, W=1, no new warnings.  The numbers are from an equivalent
>     change on 6.18.39-rt on a Jetson Orin Nano, counting kmem:kmalloc/kfree
>     by call site with bpftrace while a test loops on IORING_OP_FUTEX_WAIT
>     with a value the futex word doesn't hold.  Happy to turn that into
>     a liburing test if it's useful.

makes me very much think "nope, not at all", as it's a deliberately
failing test case. And yes if you keep issuing failing waits,
then it'll drain the cache. The cache is for the hot FAST path,
which is not an error path.

Hmm?

-- 
Jens Axboe

