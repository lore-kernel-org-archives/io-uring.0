Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827F54A0EF5
	for <io-uring@vger.kernel.org>; Mon, 21 Sep 2026 13:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999042; cv=none; b=P25o6Lb4/jMZlXSwg0x5CtKoWfTGNVITBrK/slacmzV78mbR3a2mln9iezmkg701iwYI21BZu/ZhO0QuZDClczEk0OHLBVMeXt2udsX4pGZP6daC5gQapLm4YP749LhYKWp6ZoJqeNKdH2AxidZASY4RFxbC1Wy3bppXzpWHvQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999042; c=relaxed/simple;
	bh=05nQQn1fD5gOEpF/ULLHdZqTcDXLkNhHu9x2ubpJqaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QoRh/g2I4kUk6Gcm6UZcsrFYf3P31GjII7OmAPCGGyaH01HTpIMyvEfHOR/KazLuPG4FBlk771iJgEgmK6E2b+czvCwB0HKiymFfaUJEmJbtVSRDFdWuPfHBfxnRbaTSZb5lefV34+qKkV8CqITAZKleO9XkSCiRAk4LAhRQXVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mzWI9N2G; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mzWI9N2G"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aa13e194easo4685492a12.1
        for <io-uring@vger.kernel.org>; Mon, 21 Sep 2026 06:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789999037; x=1790603837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ofpT4h/xZOk97T1LnY16xox+YwsLCtjUsNXPXQGc7Q0=;
        b=mzWI9N2GG3yCh33wQMPJzyAje6/w1azTh4oUjAdlzJOreyc1TK6YMNTV/hQZ9TK3Gd
         CEyFT6JaVuVjed/fVn+ehu8kPa8HNUOBbo0dKThcMYqAxQ33Sj3C6fOg7tWRzo9WCdYB
         CgktU7m3qHBLqKFnkA5IBAlERt+FmUYJlBApJNKVhbQFFUR5JGgAq2NbcjsWbRyg6SFr
         8Cqy4Q2D+SN+vgDtmn38CUCnH3wPIvBSzJNJo61M9aWxru9kd6n65Lm/HaoGXxtsYsZY
         9ms6vbHcQFg4jHmo+4f1jqR7dpXme2eRW7XmPC1nlYjnriBkw/EB1U5QYlSftufCNk/N
         jkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789999037; x=1790603837;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ofpT4h/xZOk97T1LnY16xox+YwsLCtjUsNXPXQGc7Q0=;
        b=vGaqwdFcxctyOSFwXflNL42qlmKQM3P2kDWd6dufdA6OyeRae6zgkoT6cpi/GKqLCY
         kjyge9uwFFrEjIX+LYnOkEOPjN2iZ/Q/iRFbEqUXPnOsVOZf1+41gtbiPGvafelHTuoy
         GPIHcUeldouQuD/2uGdtdaskMM9CqQMhZC90IDpJZDp29GO91aPSb9sDlyAw7ced1FVr
         smynvve7y5K0axn0+fN37LqdZX9fv1nrXuBz/I5TqQXAmhPKcqpWF2tNNsquD3DY4GA9
         s93NNGa1wtjWF11au+UU9UhPgvV5oooBdCE13JQQwUhGJIGTXFF0iRFm1YkborBn/aGS
         Z/DQ==
X-Forwarded-Encrypted: i=1; AKwUvBwW0z4OAgmBYQWGcOIqqtqvUHFPSlfKVKelqn7Be88HyD0lfm8pTFw0sUN0dwwdWp2AsoPdoiYOTQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lvqUiZBZ0Buk0JcVVyQLfUgsi18b5wE702Zq0zIw/KkA3GL3pC
	lN6xvQgtqqez+FIOItvn4UBn8JTBJgUBMl9gaUB4IWQsNGHXcLSz2d+O
X-Gm-Gg: AYBFou06v9AwiE+eZBZ60tvXmyb5nhISk8r8Y61TCrxOqPzIWFkriqrA1l8v+JvCI1h
	A7ND4XxryiZdccEGxlBs5NdQjybdcr+l67u3AkadDFBwgNJUxQBc/1LBK+R3eTPtGodoHtC/R1j
	p/iq0I+61Q2rU4eo4T4Uat/AxA7vaU68//ox8fb1zw8hWGnuU1/dtGYfTsLQtSte/v8uYeNjBX0
	4Q+HXKOIIoFrZyKShcErst5TYnPulw9A5nQkXCTdPQGVg5kxY+BwgXzdj6WyLahzYlMBFp8latH
	V65vkztaQ9ncS2XI67NEDIKmWqF+JOMs5BBvhTdNzqXyf4SBFCFORBuySZ8MwLDIVFYgnU21qL3
	3ez38t0VCtk0T4ROOvxD3Z4Ol8G8zFdcK24736Zy2EX4/3qV3uAOxe59vNaiY6kaESBNz955Vn2
	1RMk1/305Xb1IfwUMZyj8SLfJnvNzx7SogSlohUQB6y3vq4F8qYMlbBXhSztfoCVnZH4u1R9VZJ
	3/thveZGik38wunLXjnxtiIInO7TuWxb8qUI9BvY/L1Bi9zwikoGOIj+LvUXk7hFWd8/h+TeW9N
	Gftordi+f0p6+/sA9oBYGyG6cfiwxLMbQWiK
X-Received: by 2002:a05:6402:210f:b0:6a9:aead:4e98 with SMTP id 4fb4d7f45d1cf-6aa577f5cfdmr8215865a12.1.1789999036894;
        Mon, 21 Sep 2026 06:57:16 -0700 (PDT)
Received: from [10.54.182.141] (82-132-213-26.dab.02.net. [82.132.213.26])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67e0d3c5sm4446691a12.22.2026.09.21.06.57.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 06:57:14 -0700 (PDT)
Message-ID: <a8b01e56-bc86-412b-862c-d6a3efef2e6d@gmail.com>
Date: Mon, 21 Sep 2026 14:57:05 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/14] dma-buf: introduce initial file I/O
 infrastructure
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 io-uring@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Nitesh Shetty
 <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>,
 Anuj Gupta <anuj20.g@samsung.com>, Tushar Gohad <tushar.gohad@intel.com>,
 William Power <william.power@intel.com>, Phil Cayton
 <phil.cayton@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Damien Le Moal <dlemoal@kernel.org>, Alasdair Kergon <agk@redhat.com>,
 Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>,
 Benjamin Marzinski <bmarzins@redhat.com>,
 Vishal Verma <vishal.l.verma@intel.com>, David Sterba <dsterba@suse.com>,
 Ilya Dryomov <idryomov@gmail.com>, dm-devel@lists.linux.dev,
 nvdimm@lists.linux.dev, linux-btrfs@vger.kernel.org,
 ceph-devel@vger.kernel.org
References: <cover.1785274111.git.asml.silence@gmail.com>
 <bc20381e8daf85ac58811c344325d8192cde9d1e.1785274111.git.asml.silence@gmail.com>
 <181b08be-04bc-4ae9-bb88-15321a82440f@amd.com>
 <8285ede8-bebb-403a-8a37-b9987cd37a8f@gmail.com>
 <0113c49a-a364-4df6-9ab4-681c789d9d3b@amd.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <0113c49a-a364-4df6-9ab4-681c789d9d3b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/6/26 08:29, Christian König wrote:
> On 8/5/26 12:59, Pavel Begunkov wrote:
>> On 8/5/26 09:27, Christian König wrote:
> 
>>>> +
>>>> +    dma_resv_lock(dmabuf->resv, NULL);
>>>> +    ctx->dev_ops->unmap(ctx, map);
>>>> +    dma_resv_unlock(dmabuf->resv);
>>>> +
>>>> +    dma_fence_put(&fence->base);
>>>
>>> You should probably set map->fence to NULL after that.
>>
>> The map is freed two lines below, but I can add it as
>> a defensive measure.
> 
> In that case it's ok, I've just haven't seen the kfree(map) below.
> 
>> ...
>>>> +    ret = dma_resv_reserve_fences(dmabuf->resv, 1);
>>>> +    if (WARN_ON_ONCE(ret)) {
>>>> +        struct dma_fence *fence = &map->fence->base;
>>>> +
>>>> +        dma_fence_get(fence);
>>>> +        percpu_ref_kill(&map->refs);
>>>> +        dma_fence_wait(fence, false);
>>>> +        dma_fence_put(fence);
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    dma_resv_add_fence(dmabuf->resv, &map->fence->base,
>>>> +               DMA_RESV_USAGE_KERNEL);
>>>
>>> That sequence is clearly incorrect!
>>>
>>> The fence must be created after dma_resv_reserve_fences(), otherwise you definately have an illegal memory operation here.
>>
>> I'm not sure what you mean, can you elaborate? I only cared about
>> pre-allocating it to avoid allocations here. We add / signal the fence
>> only once, no reuse. The map is going to be killed here, and if we
>> create a new map, it'll have its own fence.
>>
>> I can move the dma_fence_init() call here if that makes a difference?
> 
> Yeah that is a good start, but you might need a bit more.
> 
> Here is a summary of the usual procedure you need to follow when implementing a dma_fence backend:
> 
> 1. Allocate your operation object, in this case here it's your mapping I think.
> 2. Prepare your operation, including all memory allocations.
> 3. Call dma_resv_reserve_fences() to reserve a fence slot.
> 4. Allocate and init your dma_fence object.

Looks I forgot it reply here, sorry for that. I killed dma fences in
v6 in favour of synchronous waiting, it turned to be less trouble even
outside of these fencing rules as I can rely on dma-resv lock less in
the code.

-- 
Pavel Begunkov

