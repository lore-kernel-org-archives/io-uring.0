Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670D94E0211
	for <io-uring@vger.kernel.org>; Fri, 16 Oct 2026 16:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792168927; cv=none; b=CoZ3X1yaOXGQM3/OXet5fxAwI58C6ik++k/k31GOTW9cThRyzNYQ+GeGLyJMqza9mF4lRtl2QpyZrRurc7jmmGLFUSjJl2auMd3xOWkHX43tIsyHARhHmP8WyCbyNGLLoR9ULbLBsQ+ToBKl7Qh63JPFNR1AeT4X1zjnMeTPXkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792168927; c=relaxed/simple;
	bh=tVQHrVq84A/KqbQTZtETWBNKfZqkHoyUf5PscE0JQXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FdahpXLICND9PdojDEzzZgmiDQ2wzs7YvcwFx3T8mBDW1moQ4adsdM8JS9mwxH97QDb1P5u0OCBBpbvdKsfHqRpWdKdweaxjLCey3OzSxHhK+ycpn7r8CrBiawJRjHBGEkvMcLGoNw18DsqB7hR9rDP3PgW9MhhwZMNsVd6EHyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=grYIhUf9; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="grYIhUf9"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49d05d51553so1077945e9.2
        for <io-uring@vger.kernel.org>; Fri, 16 Oct 2026 09:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792168924; x=1792773724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0GKtg4Jz5LtRd0U1O0rbGO5+swX6BhaMmQcTTWKDheQ=;
        b=grYIhUf9kZGiXHZxAOZazxzfJ+854GSPl2fIEVlNeQYS0H4jSwAKAmm968dZrmtK3h
         KXcCKWTEizcRBv37R1s/Fvg8gUc49XRODXdZ1/5F8IJSIEaMpY4aih2KBmFlfhQzhYJb
         AGn/84DPLQM3yGI5gqPriIyyI7ZXUkQj7pVaeT1G5fZg5h8DnJiwYMjzlt5TZlNXu9PB
         efW0I09/aiZbIww28s7fWOfkr8ZGqgorUdn0jx60ark95eF6XoEXUigJE9IpNglELpC4
         +zWZ0YQEZX6RFQGtSHAe18N7oU1S0TSe4YMzBEg+cYwt8ttJkKBWVhaDhhMrFziJASP7
         tllw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792168924; x=1792773724;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0GKtg4Jz5LtRd0U1O0rbGO5+swX6BhaMmQcTTWKDheQ=;
        b=2kHHl7M6E7DXWUCGUiv2HQBFgImNjCDE/rR01nCjcZXP+HcZIQrspZKWcDydve+QCR
         bkd4aRG+54Z6dAjX36SBcMBmpOh3zAi4ra1twtGEeaDPdI1KF0pvuVpYXRNjjdCLC3lM
         LljJK+y/6YWQBzE5fTSBTw3dwtnnAn6n0+OfJwu4TBYPsQ6aAxJK73riDAr6yzCRBr/B
         KJRYe/96MJt6wnhCX2rtq7YwYWzqJXAH4v/giQ0UTUA25DxbczBrcyvXWBVr1/U8LWb+
         gsBj+zEPSpvzOadfmrqse22Tu8pC2jcqCP4gfSYpu71UGHZKsVlGCkpm99cf1YyyLvOv
         x50g==
X-Gm-Message-State: AFq9FYJNVSudFCc26SbQX3gfLrGmbIUONhYNOB5mEgOSND1+wLK4TyGm
	8BhpF2MeAywQOLUv1bIGCTNHg4WGigHDOnMut3/y917oKrG8tgmY0iP16E9nkw==
X-Gm-Gg: AYBFou1jTqnK1UleYuGAkjbrc7Pv+a8SPpNiV8QoxE0ATiGojp3MscT8N7agqZpxqre
	Sm3KljHfoW95DCPEGIMxevVJVMK22Rea27Ie2vxRxBgC1b9XcoNEHMw/j/KmC3VdggXEPTFruzQ
	i6ZVW3umQgh1pBW6gkRe3B9HfT+dSernWNBimkqGDMjieqIWW3uAqaxOx4MAQcw1ZowPGgGdPFa
	ek3bzOI5/3RjuJhDqDzsRxISJpHoUnMHQlnd5xbPzKkqeE4mHutUXn07hG0sB/dT2x6WJhaCypt
	j5cCzldXii4zx3vJ+bf8RFQr6O6Zl5J49uW6+Axgrputg63WbzZVWOjpsy27CzR1eY8UyMLdwok
	CuaamTddaqfVS8or2Qq0X+sYfwg9wdHxMgnWJ1yWakfKu4yCjYpLYVIf9Ko8AKkksNR8nij4EiE
	8sbDecxsZmnROT+/geYOr2NLB0FX57KiIgzCdMg/SVVWKtmAtkL82cZF37w1TdG0YqXOMJWoRkH
	p+q0CqQ3vEOV+Z+hzUyi/f2wVD6IX+fGSR+8/3RPFp8KPOTkMxSAhFMjZaofI7uFwRt0cGFrqT7
	wbYuF971agxB961P5ryBNvA8sQjk6nEuhgHiweKfkapOz8oV
X-Received: by 2002:a05:600c:468e:b0:4a0:12d7:4c88 with SMTP id 5b1f17b1804b1-4a1d7625f71mr7812725e9.30.1792168924500;
        Fri, 16 Oct 2026 09:42:04 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cf04ffe9sm41150205e9.0.2026.10.16.09.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 09:42:03 -0700 (PDT)
Message-ID: <354b7567-de3d-449f-a948-3b5f43996293@gmail.com>
Date: Fri, 16 Oct 2026 17:42:01 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 35/43] io_uring/zcrx: fix buffer offsets in areas above
 4GB
To: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
 <20261015-b4-io-uring-fixes-v1-35-c1556f5d7bf5@toxicpanda.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-35-c1556f5d7bf5@toxicpanda.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/26 20:30, Josef Bacik wrote:
> io_zcrx_queue_cqe() computes the offset of the buffer in its area from
> net_iov_idx(), which is an unsigned int, so the shift is done in 32 bits
> and only the result is widened to the u64 that goes into the CQE. An area
> can be up to 1TB in size. For every niov beyond the first 4GB the CQE
> points the application at a buffer 4GB, or a multiple of that, below the
> one which has the data. It reads the wrong data, and then returns a
> buffer it doesn't own via the refill queue while the real one is never
> given back.
> 
> Fixes: 11ed914bbf94 ("io_uring/zcrx: add io_recvzc request")

I was going to say that zcrx doesn't support >1G areas, but apparently
the function it relied on got changed without adjusting zcrx, so the
tag should rather refer to.

commit b4e41050b212ca33c82fb0598a7b323d5b18f1bb
Author: Jens Axboe <axboe@kernel.dk>
Date:   Mon May 4 05:42:51 2026 -0600

     io_uring/rsrc: raise registered buffer 1GB limit

> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> ---
>   io_uring/zcrx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
> index cc9df7e64a40..6d7abb1636e7 100644
> --- a/io_uring/zcrx.c
> +++ b/io_uring/zcrx.c
> @@ -1645,7 +1645,7 @@ static bool io_zcrx_queue_cqe(struct io_kiocb *req, struct net_iov *niov,
>   		cqe->flags |= IORING_CQE_F_32;
>   
>   	area = io_zcrx_iov_to_area(niov);
> -	offset = off + (net_iov_idx(niov) << ifq->niov_shift);
> +	offset = off + ((u64)net_iov_idx(niov) << ifq->niov_shift);
>   	rcqe = (struct io_uring_zcrx_cqe *)(cqe + 1);
>   	rcqe->off = offset + zcrx_area_id_to_token(area->area_id);
>   	rcqe->__pad = 0;
> 

-- 
Pavel Begunkov

