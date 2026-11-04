Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808871;
	b=4WRChAUjnkSm5Jsq7YzS426CMvU+J2t53cFjYusSht7VQEPHD7ciV6hygL5WsRihIPTe
	 UlherAXibiHq40YUqawuBO92JMi7PHXF3pquBu585ESVvkWKpyYzcH9YrbeJxqsBNXErp
	 FzeYOG1HoZy1klnvyhiCEtkvlDN7L3+nVMfEIqhA7MbLgtPcs8eXWEaDpLDmr/SeEDaPd
	 k/DuEFAz2YysYfaQwJAIBiKoXsip+tZ2VKEnjRA1x9miij0ajM2j070oF8GZd7Ky0fE4I
	 9tAeuYWnoR39QM9FNNkfV7r6pCquxtHITRyWxs6RVjQN0swWzevAChQlDILggbRCxSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=2ZRVEb3uxaxxpFesD6mkqxkpYWx/oMieXN2/50UShAY=;
	b=uuyju9n4OLJCCrTSIoZvV09IBx5qI7yPpZPz7SlseQcOo4C53M9t1KVvwyW9EXdztaOl
	 YMmckuIdkD1Q8tGtG+r0CkKnelFuUzJQnAfUK7pzOiKiBPyLrBqe+tXSPqW8Taq4JV5/N
	 avaBGepgiKTpZxUuBPLUAlp1sbRqPuyB9p72fPPswQSq/amk5Mma97EjgtCYMXnSbIdDH
	 z6sbYRkWwDpNtZcMzCf7FAKhtfc9Nkg/X30MZWdbcFLaF3XCzZ/aFFJpSX4ba9B4OmIH6
	 wfHJagvpBKGbuII6xt+amN6DZy8ablPGygMvAYRgcCM8D7+YoyXI/urmNRO+h9+rbUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=IuSJLkep;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8573C606A337
	for <io-uring@vger.kernel.org>; Wed,  4 Nov 2026 16:14:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8573C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=IuSJLkep
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-85a5455bd3cso465267a34.3
        for <io-uring@vger.kernel.org>; Wed, 04 Nov 2026 08:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793808868; x=1794413668; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ZRVEb3uxaxxpFesD6mkqxkpYWx/oMieXN2/50UShAY=;
        b=IuSJLkepLgOArjmNbY3qRy4/aW97zsadqKol5nVhQIjaLRZbMapm1gA7KVin7hCcIb
         XqbvwN5IRjwz32rI7YvqZJYAZIAw3c+5OTUYV92u9/URZU+PFf7Jk9HGtGAFPw36fGl4
         LIqSP3X0ArMMI5cw2fEHT3N/v8BiiNH3y6PVpR6fx/KzH+99By4wr/bTFUIk+rhl0ad3
         XCmwBdYcfT8kWo/x+iYkwx8l5KfJcWaoqL5thS/Q6hbb3lLG0bPh5f7dMGXPekdZdC+r
         dHS8p+mGCpuXaIIB/wMS0/nvmm1dg15mBpmkz+ZXXOgnShD+GMAhhsFhZtjKlKeef4Kd
         m1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793808868; x=1794413668;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ZRVEb3uxaxxpFesD6mkqxkpYWx/oMieXN2/50UShAY=;
        b=jsHv220EXYGcEkDRBSlwFWKcj//vRyuz48f+fFiLWwcLxc/thhfYbqvNuct2dD3L6f
         1G+BkYtbdSSgouTvKbaaeOQ1osJP124xyJpaPX0Pe8LvSLOfvLdW76KDhrgIrOVZZO21
         3t0ltFfPb/Ag1x+6DHSnK9E42HONptvIGrtiz6VhlCmQt4TnwxyDnZ5B+iN5jYA5mFl8
         jL6XJNbFbKdGFjsTg4q1BNED5hTfBYpzkP+/MsK4T4KPbtfHECA4rvyG7P5yE452p4oB
         yrbHX7nMSG4aoahN3F7BplIENlEhojLn52613Er7k5YCVnzYLD3kgS5OIHBZCvxaUvAv
         xWVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyo270/JAv7SC/4SmnowIhMITPAKa7KMDjwTXLEvmqsujJ3I25Ezzc96m7Bt27wco5KjUDyIprsQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8ck9SHdT3R5NXiXJN7EDWOjS7wzLpj3Y+jhhV8HquFtNr7/kVk
	Y/eZV0VQdZlwNgDKIdAzPxXykgh8iuTnb/M7n54vIGGX/bKeesblNkyGv9SginMHlAc=
X-Gm-Gg: AYBFou3NOYxodjB2jN+V4xPhYlT9DTAuRmePM5iKnIVzaq55LGIOfbFJdehtbgp6gLs
	hVVvSYX6suGv11VXit+HC1j285psYg3n0lCwmy+ZZcgpih+t239zBhmb+/W9BkwKzC6FSudBhrA
	IH24r84ZYmM0fKpCQbZxpRAL3ke7SoLF3b7aXMbav2xQWaVVGrH1ludSb54SkEsGe3pZEQTKD9L
	47lJOkjJVfPC5uaTws2zkmZAdffz8HynwwXJmXQnDcQIN+RRaqE76Bb5ftlatekqnwTnE697v13
	aaS5Lwq4YrNej3ZhTQ3pYSYvh5oVg/j70E+uFMIPE8AZYQ2PxehUp+542mX61Hzb+uCOouixPyv
	sAH7uVkaP6My/LzGOV94mmBAlWMwEZLg2s4paBcSudYs26Yw7gCm8zqZSqIHWtdqsW1LSI37Vc5
	3jENbRncXrireBLkUDPP3sXDtDKDeuleJJGZH12SXMFSWEvn0N3SDHGcN104bQqbVLFGQGWihfS
	1BPEpO/ye7jmMjHEHbCEt6B+Ynu4wxEzIBnFhXN5S2IwkGCUjnLJbKl/VEsF7pZiczpgAIRH7gC
	tpBZHWZ4QxQ4D8UlEDB0H4RAC7AkvANvYAZnyWSPOStaW2VueZKQ0ysxT/NJSTxnobKdXTXScpQ
	dv3IvDjqC
X-Received: by 2002:a05:6830:2695:b0:805:2785:fad5 with SMTP id 46e09a7af769-85d36536870mr10734286a34.27.1793808868398;
        Wed, 04 Nov 2026 08:14:28 -0800 (PST)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3a1da87sm2246465a34.3.2026.11.04.08.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 08:14:26 -0800 (PST)
Message-ID: <1a338198-527e-418c-9e0f-2b619ea84e71@kernel.dk>
Date: Wed, 4 Nov 2026 09:14:25 -0700
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
Subject: Re: [PATCH io_uring] io_uring/zcrx: don't sync for cpu dma-bufs
To: Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org
Cc: netdev@vger.kernel.org
References: <2cf944dd571364e249af5fefcab07bc670bce842.1793623006.git.asml.silence@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <2cf944dd571364e249af5fefcab07bc670bce842.1793623006.git.asml.silence@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/3/26 5:11 PM, Pavel Begunkov wrote:
> dma-bufs follow different from normal memory rules, we don't need to
> sync it for the user. If the user space wants to directly access it, it
> should use proper primitives like DMA_BUF_IOCTL_SYNC.
> 
> Fixes: a5c98e9424573 ("io_uring/zcrx: dmabuf backed zerocopy receive")
> Cc: stable@vger.kernel.org
> Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
> ---
>  io_uring/zcrx.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
> index 6d7abb1636e7..17e554bb774f 100644
> --- a/io_uring/zcrx.c
> +++ b/io_uring/zcrx.c
> @@ -1425,6 +1425,8 @@ static int io_pp_zc_init(struct page_pool *pp)
>  	if (pp->p.dma_dir != DMA_FROM_DEVICE)
>  		return -EOPNOTSUPP;
>  
> +	if (!ifq->kern_readable)
> +		pp->dma_sync_for_cpu = false;

Should this clear ->dma_sync as well for this? That'd bring it
closer to what devmem does.

-- 
Jens Axboe

