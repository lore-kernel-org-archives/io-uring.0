Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794260279;
	b=WMESB4olIyZqHxXczun+xdECzc0H1MoJ/3vX/QIQ0hDPPICbUg3RSFQk5QXxjhROhbEG
	 tIJltRZnUj2PDnkFDttJEYUwZKfC7E5te18NadS6x/s1/oYkEM8/w76Bt9anzdF01wyHn
	 qkCR2cdPn+69wXMxHhoplF0O7O7LuFnx9bmP9gRYFjR/w4m+87tteGRmZrMufLxCjmjD0
	 ab3IGW/dl5x+i/zZ4u5E/3xqFtuomuB12KUIGKre/du0jdm4QjggPJdkhUH6WvhNwmREG
	 JnGeKwQAQMFGjtFAGKeGj5ALzvJ5kA8VYImLeOQqUpgylTnNWDBcUb10pRtqSI4iVtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794260279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=5+NNiazwIaEbbCVZzcc1IxAFMA7hNsXcy22efoQtKmc=;
	b=rOlEJBjlZD55goK/tR58CW7Pi6ILrx/m1xojkpN5D8PvMHTroKUaSrmme71T54GFnNOx
	 NgoS9d+Fk0hO/VpzVFn8JJpVpLeviiRBnGj9Vgju4aZ5e4Y71/aG1LnZ1RlFIYbZoieaE
	 JzUZjAJgJ7x9TCXuB9zEHIDYjnoXuugdacPFx4NtxhWKFFuhpMESEGZ4OnHPKpQDv9/IX
	 UyUR+dOOuGwi1Og7m1xbIrTTqX55xU9kESdHr8bqYXNFBePOmZsLsUiRe4BtCbiDyM0hO
	 xlzZJbc39z/RcffokgQN+XyGouA9JKVghYqUJMgYnictZMtrJ2E1eOr2bsy+heZ6Z8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=V85JAZrI;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09FA606A31C
	for <io-uring@vger.kernel.org>; Mon,  9 Nov 2026 21:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D09FA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=V85JAZrI
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso617346a12.0
        for <io-uring@vger.kernel.org>; Mon, 09 Nov 2026 13:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794260277; x=1794865077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5+NNiazwIaEbbCVZzcc1IxAFMA7hNsXcy22efoQtKmc=;
        b=V85JAZrIMeISyb08Dg/YBa9AzHq0E/dJ0uYVQWP4dU5WADoJOtfd/L1offq8qRFpnY
         jxzWq6kXCuHgyTpOpVaLaRCizpnzG6i5ESIxvQGHApFVIxYtuL/sAl9EjFsBK/MRVXrg
         opOLW2KfHU7xIwu9dlIyd4SXk7AdGTIVFRXZ2uqkGZL9FMidPVeFPUhpkkbrxzB+lzOk
         o3ljkPFDRgW0dY985usOnQY1hTOaOnqEV/eOZLlA5CmlYkneSWYUQxn0qAdE8YcawTBL
         7Lr9FZUcBHSmXX5VuiCisfSMwqjHsf8aUazvL/xPTTIbDehTHrAB9Nnwf1JzmvrQdCKx
         bN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794260277; x=1794865077;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5+NNiazwIaEbbCVZzcc1IxAFMA7hNsXcy22efoQtKmc=;
        b=B0JSJdaZguTd20QsA+v7tXEdnep6ycUTlfDtvTv9xfVlTxxFmK7d0ROca0/WiRnKZt
         rM4sIj5OJ9DJIR7m9lrxZQgO8vACNUQB+om9cpq/RTr835mgKYKKI45bwe2Xj/2xOGaS
         AwN2qr+6U6wbWiWSByNQFYqcSfwVkxxiexm6ACmVAeaDM/JTR4XRVEb0j7cevb+YrNa3
         YcLlFyGjIrTblW4+wkihSQQec8P1ICIU+Mf+ne986GZJxDio8f3LBK6DGEMTYG2OQ9hL
         BFG2p8IVN8NNyj/5LKE2l0rKpoLqrGpEEoCNe2INV+VP0TkmhblCq3dhE9keMRTJFR5D
         bfkw==
X-Gm-Message-State: APuU4Z+/76TLM++mZc1jv3t8MVFQc973Xqj225s1ilm0Sje3x0rw33W0
	novcZ/PakgE8i1+/2fW81uCv481GduJMyJNt0s7dcTk3Gb3okiWV4rfil+jNoz5mETQ=
X-Gm-Gg: AYBFou2jLfCKb+4OVtAwazq/k8maPLRYwaFKAT9b5LTWo2wa3wIsAHqVwkqEd25cO1+
	2oyQSxLovoIdcWvbfHuMZrfMvqULmay9AbJ7TuxrqtrX3XXu/GD/+aXbQGwDBpYwFyvNFkiFsbl
	TwnnPz5pZWWt3tloIM/+MRv8g9aTZVWV6BrnfMLVa+M+bhc03pvK7UU/5mGHcbPLQgu6ubGXjEf
	B3pD58FkNnNWpgBFGBwdvK7wYyHy+I1cUBnPAME2/iKzsWVtAdpczNf6LcxwqC/WG1P67t5RL5P
	0QtmuepM+O9LOTyfmuPYwL5cim69K08aebqvEp0Ay/6BLqxL8nbuVjy+4ksQNZYiUxQbZpttldo
	TnUU1wXwk73auebxNt38lzY/ijp+RNE6JMT2oAXHokmmXDlNkuzyKS23zt0eii8/uKd6CoQzrbw
	YmSSkMoXvUE3eoo4MN2mgZyGSClVIylU2FG9nOBNffeJz2hb+NpGLUAbr3VE5g6AWVQ/FgRfzrA
	vFXtkx+VOa0ZdmkYzE8C1TPMr3JpI8qjWfP/hJhO8/K+9d+VhZXmD/Vdso0gLIGx/F3BvcoqxSv
	nNLMSk6qGPoGPjomLO2puecDRt3HB9O6mx7RYiZbRrn9l44QCjxhtH4tBwmqLoGpAVS5VzhGt3B
	0pYOixPwrvbw=
X-Received: by 2002:a17:90b:5283:b0:3a4:b74a:795c with SMTP id 98e67ed59e1d1-3b166cdecb6mr871492a91.16.1794260277070;
        Mon, 09 Nov 2026 13:37:57 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1676d83absm1022071a91.7.2026.11.09.13.37.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 13:37:56 -0800 (PST)
Message-ID: <628e574b-9d79-4997-a147-51ccbd11e35d@kernel.dk>
Date: Mon, 9 Nov 2026 14:37:55 -0700
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
Subject: Re: [PATCH 0/4] io_uring: improve alloc_cache branch prediction
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261103211031.592745-1-csander@purestorage.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261103211031.592745-1-csander@purestorage.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/3/26 2:10 PM, Caleb Sander Mateos wrote:
> A call to io_uring_alloc_async_data() that provides a struct io_alloc_cache
> currently has 2 unnecessary NULL checks in the fast path:
> - Of the struct io_alloc_cache *, even though it points to a struct io_ring_ctx
>   field
> - Of the void * entry popped from the cache, even though all cache entries are
>   non-NULL
> The compiler also incorrectly assumes the success path in io_alloc_cache_get()
> is the unlikely one because it's written as an early return.
> 
> Avoid the first NULL check by splitting io_uring_alloc_async_data()'s cache
> logic to a separate function io_uring_alloc_cached_async_data() that uses the
> cache unconditionally. Avoid the second by returning a separate success bool
> from io_cache_alloc() instead of checking the NULL-ness of the returned entry.
> Also mark io_alloc_cache_get() and io_alloc_cache_put()'s success paths as
> likely so the compiler can avoid jumps in the fast path.
> 
> The final commit is a small code simplification in io_futex_wait() noticed while
> touching the neighboring io_cache_alloc() call.

I hand-applied this, as it needed changes for the post-7.3 trees.
Patch 3 is somewhat marginal I'd say in terms of rewards for the
churn, but churn is cheap these days...

Anyway, check the end result, please.

-- 
Jens Axboe

