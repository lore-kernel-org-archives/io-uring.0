Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1BC4CC631
	for <io-uring@vger.kernel.org>; Fri,  9 Oct 2026 11:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545048; cv=none; b=YFu23ito0NUyzjZ7qnz4hWL7WGgfUjT0wrO6LFdcrmdPQXE7TK6GUK3YA6eDG124plfhSR5ReNt06BJFVE60rvI7CpnM2vbwuwZsUj7RIBOCw9I8oTwMwJsdLaeM077wGrHDuEk5Vf7AIcHpCQ8blYPNo2Ae3RrdQzVdfSg0tug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545048; c=relaxed/simple;
	bh=V38vhjeTzp3k5ITMNDV6z39rmdMCvkYnm7NSfqrDfZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cFDCId5g6fvA0C9zjBi5xJ4w6+ZRcv1nVDVtZOs6idcLQgHHdmgbjylXoD4DOl5vnoIPjEr2e9cHlA3Oxb4PJ7sBIFnTf+giUqzKtK+bgHBETiTr3p0P+vGn+4ZVyX4hb02xMlhQ8n/mWiIXd6Ra9eT2FOI355OA8GkXm62AHPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GwTlLord; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GwTlLord"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a17baef589so30263645e9.0
        for <io-uring@vger.kernel.org>; Fri, 09 Oct 2026 04:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791545038; x=1792149838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l0FDlo5X9NOcg3UrYdd8gMV7/2rytUnITD56A6AkawM=;
        b=GwTlLorduSK1NpYlzvs3WNkPYiWfIiRvgHsi6RKgfw6N9HA+hJJBE1rF4Dk7HeksZY
         vNh6Q3qzFbq9PDY/dS+CaPLTC36BMQhidW3ULEY9WfVvgood/8r1rBbE1wmk+mRWlZfm
         1qRE/IWyzcEzjlm001veLq3ldAC7aHGqTEU6yQ1PRDfWJDzC1+EcTInuwyo/K3dbfQjx
         mrn6OMJPVdZOi9BCOOCt2k9wfRrdQWyrnL+FHVq8TiFM3imY7IQo2Sf9bzuflkjPXjQe
         foHChqp/Ps3XZA1DXyr1dXZUB4T4H6IwS7qa1a7xHg8ANHPiuArSDsTW8G1hPs89J5hT
         J1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791545038; x=1792149838;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l0FDlo5X9NOcg3UrYdd8gMV7/2rytUnITD56A6AkawM=;
        b=p+W+/EcCJNTsW4J7NGSYvM4U+5pg4Ni8oOHjxNL7HN4vkApFycINFa5hFhPHYX1x9b
         L1i9rFNRxLuxGAr6BlKZ/QUrIgS+SiXS+37UfPwabbL1j2Ojr4CArVqcPca7z2NJL2s2
         GwPOcyYdnUGNU33z1QCDfsTbHmdhRX+PQDG+CUBqk0A+6rWF5jPSTUOEDdcvyytiQ+cH
         E9cOlovwBB4nYXptYHsBpHsI+4WoLCiMlclRD0XYxT5mSaqKA2iUGQbfmOXuXX/+hLxd
         lghp+SKhXEaz0eU7b3fQSMaEqUSeYwLhG6m17yu8RK/jAsrfFt6FDiPk5hNRCo46nTPr
         Dt1w==
X-Forwarded-Encrypted: i=1; AKwUvBxsp1kpoqZjw68W3qX8KdeznNdGjOdnOEiv0HIFvoqT3s7fzgddV97vJW7Agsesy0/XP6h2SKcMQg==@vger.kernel.org
X-Gm-Message-State: AFuF++nx5SWnlCOe28TeJV6MCAb2mKrv3IosUmVJPP8C5L5J4XshDvzz
	QbgGSKgYn4Kl52bO8gMtddtm5nlj4QzHnCaU6aszvhVQSrjldoA+XyHa
X-Gm-Gg: AYBFou2d9ibkWhjfhoyXmLYaBaauy4DfFLtj5S9EwclTOoKYXzIQC92J9jQAuJtTrPX
	OO4oO/eKE9qgCYgBiMVeLuPKo0hw+ASXUcaKJXhvPUOEgAvEyySxiSsG+IfiRwRvW3UNVnLi6Jh
	De44vNSNaEvh9hawsLxQHtsFMIuzeax1ZEd4NTJGnmf3psY5fkXZ+5xjRNx9/1Ip2Y1zeuQer04
	Ka3qeSjuxhGgVIdIR/qFJaSEdBXqtTIZsni6fOLfAC6TD6sw9gz8XnNUkXc95GtOqlsQH7mAJkO
	D4FrJ414FlZeWSX7kp+W1bzL3EFIzwQnMGVAfQC6DeocJaZqnBafX0bIUbJyGCIG6YjvUSD7zvi
	eHuf3mFIaDNoS70Ohtg0Tm86F6ZHKPug0l04Be+yljvbWqS7XItTEbcXimK3GW1w/a5Mo6iMpD9
	T07vsSqU1Xr9/mlM/RbB773wrbYeLCgPpl5cjGY9lUj17wK0gh1XhLCUkQH8yJOj/Fc4arEY/1p
	kJNQU//xTicVshgkTwcjWQ5Fpj6Xy66zSl76nDS9ZbpowKF27rWhyjDUMvyyOr3SEXGJl6slJEY
	scUmvpaQ7FsvF+ZuHH+iR8MNAWmSNXfFAjHAqCM9G5Z5Iwf0
X-Received: by 2002:a05:600c:524c:b0:4a1:825a:5726 with SMTP id 5b1f17b1804b1-4a18e4aeaffmr31536085e9.31.1791545037794;
        Fri, 09 Oct 2026 04:23:57 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be8c669sm58317575e9.5.2026.10.09.04.23.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 04:23:56 -0700 (PDT)
Message-ID: <bed0a0c0-1706-441b-926a-fe568dea313f@gmail.com>
Date: Fri, 9 Oct 2026 12:23:54 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring: do not charge user provided SQ/CQ rings to
 RLIMIT_MEMLOCK
To: Hengyu Liang <hengyul@cs.unc.edu>, Jens Axboe <axboe@kernel.dk>
Cc: David Wei <dw@davidwei.uk>, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <b5a33433-b0b9-4231-9998-23e2a2202091@kernel.dk>
 <20261008170611.1285778-1-hengyul@cs.unc.edu>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20261008170611.1285778-1-hengyul@cs.unc.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/8/26 18:06, Hengyu Liang wrote:
> Commit 8078486e1d53 ("io_uring: use region api for SQ") and commit
> 81a4058e0cd0 ("io_uring: use region api for CQ") made io_uring_setup()
> create the rings with io_create_region().
> 
> However, io_create_region() charges user provided memory to
> RLIMIT_MEMLOCK, and the rings of an IORING_SETUP_NO_MMAP ring were not
> charged before those commits. As of now, a user without CAP_IPC_LOCK
> gets ENOMEM from io_uring_queue_init_mem() when their rings exceed the
> limit, which is 8 MiB by default. PostgreSQL 18 creates its rings with
> this function [1].

That patch you mentioned 26bfa89e25f4 ("io_uring: place ring SQ/CQ
arrays under memcg memory limits") has always been a delayed time bomb,
though memlock is quite a nasty limit. Makes me wonder if there is a
way to migrate it to cgroups completely.


...> The issue can be reproduced with a simple liburing program, run as an
> unprivileged user:
> 
> [2] https://lore.kernel.org/io-uring/b5a33433-b0b9-4231-9998-23e2a2202091@kernel.dk/
> 
>   io_uring/io_uring.c |  8 ++++----
>   io_uring/kbuf.c     |  2 +-
>   io_uring/memmap.c   |  7 ++++---
>   io_uring/memmap.h   |  2 +-
>   io_uring/register.c | 10 +++++-----
>   io_uring/zcrx.c     |  2 +-
>   6 files changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
> index c2ce83c7c1f1..2a16369894d4 100644
> --- a/io_uring/io_uring.c
> +++ b/io_uring/io_uring.c
> @@ -2070,8 +2070,8 @@ int io_submit_sqes(struct io_ring_ctx *ctx, unsigned int nr)
>   
>   static void io_rings_free(struct io_ring_ctx *ctx)
>   {
> -	io_free_region(ctx->user, &ctx->sq_region);
> -	io_free_region(ctx->user, &ctx->ring_region);

1. It's not perfect to make all these changes for a fix because of
backporting. Let's simplify it, add a wrapper and use the "__" version
only where needed.

__io_create_region(ctx, bool account, ...) {
	if (!ctx->user)
		account = false;
	...
}
io_create_region(ctx, ...) {
	return __io_create_region(ctx, true, ...);
}

2. The need to match alloc and free arguments has a high chance to
eventually blow up. It'd be better to turn it into a flag.

__io_create_region() {
	if (account) {
		...
		mr->flags |= IO_REGION_F_ACCOUNTED;
	}
}

io_free_region() {
	if ((mr->flags & IO_REGION_F_ACCOUNTED)) {
		WARN_ON_ONCE(!user);
		unaccount(user);
	}
}

-- 
Pavel Begunkov

