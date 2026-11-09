Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794260292;
	b=Vcy4orvEZW1uKUZd+svAVVS9vMUq4D9ssdY4Qs7+b0DyFwnb6HzGnbMIEujpowJzzdVH
	 Me7rXHm7dItDQvz1TyXCVMwnBqKJ0xpz9lEN9W/h6BM5LlhTIy+JvJ9O9N1DKIQy1HIPl
	 dRxTs+zos5mwrOVbrWdTIOoH/l2QNiWMGjaSW0OcDDHx88wEUSMmxBxCYK6NNuDYfNM3i
	 CR8Pag7peeEZILNDEspYo/tg65R0dZVzkHO7WAwGYiYRvl0SRYj85ec5BBgRIY9qTEeBw
	 ZjkCjXrAbbG06vP96thBJqytBCNZEPK4M/CBnem9QIKr0HDRGK4UYmRHQ/8PZUaHQtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794260292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=YNEvUZEqZIDnSORqnBcviTGCY1xg9Q2qeRZLzfoHA6g=;
	b=I6v2/OR1lcMbs9OWXU7hC6dN3BSLBXbXdJIAXmspu+9FRHc6lUUT4tPrcFHmXgWlicR+
	 +WS2a6m3FoNSrccPH2FlZcvqDucXoGJMDSHRRM0o4eIMiZL2p7eCRyJjEkdjwmXekmbxR
	 t2JFWKvCsJQNRMFToslm0yq0vFj8ZHIk60UZXWjle7n2Fi8KSLshotQHhnkBfgKqqdvG5
	 l0y81UjiIpHstTiEBnJhjx2XO9i2TjEWUi+kXZfsmyzGC671f2XyVpeKMNsndz/ycTpip
	 sAK91HB7Vs41EBRsrYg8O9inwqfARNUKpdKf6Q5lJV3JWfX9cFZHYflte+MdRDqh05g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OmRE7iJ8;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9190B606A31C
	for <io-uring@vger.kernel.org>; Mon,  9 Nov 2026 21:38:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9190B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OmRE7iJ8
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e9d7791b00so11592935ad.0
        for <io-uring@vger.kernel.org>; Mon, 09 Nov 2026 13:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794260291; x=1794865091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YNEvUZEqZIDnSORqnBcviTGCY1xg9Q2qeRZLzfoHA6g=;
        b=OmRE7iJ8GchwzEl+lpjoRy945h+CAdg5qgHqtLYnp7up2SRzATrr69XR+jA+S6sGYQ
         LzI9lvChaXl3ZQ7IwP0tGDe/HfNPmEKRb+rvnckTjZj6m0OjLZm2RGrHOegwfetLzoUo
         jk07+FS6uM0zuUMUykRO88eIOu9UmqCorktI2y2/bf3GW9r6Y6Us8JweLw8nctgF4BAN
         ouRy0ZKuKu3PzBWWa2xfhMG1Ct4wcWqp6XBMl9E8QuSGa2+gVIlSwoB55IfIC2YRlpAc
         VQh7/KVZPGKCcJ7KoGl0MSlU8uzzIoVlhaI17E/Sij+44yUprA1EmkliMpunzoVshJnK
         j1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794260291; x=1794865091;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YNEvUZEqZIDnSORqnBcviTGCY1xg9Q2qeRZLzfoHA6g=;
        b=WjjNGKTc07OlAad5LmmuJ6vQcnt3XCRcGTEHc+UsIhsSzAOGsJUvxqDG9hK06TAO/t
         GCuEhTtjenUhYH/b3vHEHjy8GenO6yeYyU1xLtkFyzu0QM61HDIAQ6Ky4KequIZ+owMu
         8IUqILmsnyeMocvhjU5dBSsHOHRvxiqP+kvsVQ+h08xXlXCzkryHLLxEyNJj+Fxxrb8p
         nhRIka8MsYwwGhTqLm0P2VyFXpbkoyIS9pWicWHLqP9oytXfuHxopqotAYBSPrvXhLrY
         RrZlkX7wOsnUvOZy3O9y1Xwai/77WoIu0AIkxrQF8RMutMKwcVMujMrIarq3B0ZZYas3
         1Btg==
X-Gm-Message-State: APuU4Z88Ceq9+8OgIlpGtFOR6qrLGeQC0TRzxSn7LHtM6FWnjzsCJ8Iu
	XHrCFVIkpbU6ErmL4YVVtHOIz2tbfe1QHMOozp+EbfLudwCqE1Zeu34xUnHrJRz6lxu8kMAQ+qu
	QS+hV
X-Gm-Gg: AYBFou3DIzpWe2rCbav/OZ/Uq7cUv7av1izqGlxCLY19t1gMlgmzswlyFy5FFAZkmFC
	nQni0chvhKsap+ajsMY6V0kUMBsvcH47serEdYQ0J6eU5aViG9AnjofybYW68dzumcGIMLLpfyR
	UnSUSsSUdhZZvgK/ZAP6uhrQCYUeLZxpbEQvGgvIZmux0WcYKIevhONVnXU2yDB4EAU054VyOyg
	w1cr3kd2euR1crOzFgxAK1WnTSpx3kws2dcrEwf5jGIp9eRjrwjLwPdHvqa/YUJ7m65rO7ZhCCQ
	fxFgRnZtNnhGrQQ37OfpatGsxUdxJy8OcYSkBgaOr7dXlbrJAYe2n3c2GH2XqVsafabfQ2Wqzk3
	SMTZB09td7j8ET3AARk5giKa6LB0IWxhmM+qONHVjz6v4MD2OcQPtXmOHbe/crASo7Pxd3AciJ5
	2pQHQrOhRywTE7G11mrM2ZS4ZGCvxAyamylq/jb+KolLBy7YkmztbeDJl0jv5k4Szjwx442MHlU
	F9wWJuvLdGpyt6BfNbgNZtp8F+LnIa0AlzcOKD/A+aiLr2b6UhoWt3Bw9xJVJifQnP/5hm62T+I
	as8ekTEYYpyxrcVl7FnMY4vAzm3lie1gFzisQn1lZ08I+nKE26IY6EVYJQTV5rLNwA3kQcwzHu3
	Ufa3+KWUN9D7O
X-Received: by 2002:a17:90b:4a0f:b0:3ab:f38:2b43 with SMTP id 98e67ed59e1d1-3b166cf450cmr914186a91.34.1794260290895;
        Mon, 09 Nov 2026 13:38:10 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16774309bsm1024629a91.14.2026.11.09.13.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:38:10 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261103211031.592745-1-csander@purestorage.com>
References: <20261103211031.592745-1-csander@purestorage.com>
Subject: Re: [PATCH 0/4] io_uring: improve alloc_cache branch prediction
Message-Id: <179426028968.141878.17464468753491452535.b4-ty@b4>
Date: Mon, 09 Nov 2026 14:38:09 -0700
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Tue, 03 Nov 2026 14:10:27 -0700, Caleb Sander Mateos wrote:
> A call to io_uring_alloc_async_data() that provides a struct io_alloc_cache
> currently has 2 unnecessary NULL checks in the fast path:
> - Of the struct io_alloc_cache *, even though it points to a struct io_ring_ctx
>   field
> - Of the void * entry popped from the cache, even though all cache entries are
>   non-NULL
> The compiler also incorrectly assumes the success path in io_alloc_cache_get()
> is the unlikely one because it's written as an early return.
> 
> [...]

Applied, thanks!

[1/4] io_uring: split io_uring_alloc_async_data()
      commit: 5b1d75482ccbc6483336d16cec609da2706981ab
[2/4] io_uring/alloc_cache: mark cache success paths as likely
      commit: 2c4f39b09b031c94465e945bea50df5c781fafd4
[3/4] io_uring/alloc_cache: assume io_alloc_cache_get() doesn't return NULL
      commit: e10a5108ae01eb9e166b0c7bc04fad6b0001095c
[4/4] io_uring/futex: avoid ifd NULL check in io_futex_wait()
      commit: ddcc50dd41d331dc66e0e5793492c3fa09941ff9

Best regards,
-- 
Jens Axboe



