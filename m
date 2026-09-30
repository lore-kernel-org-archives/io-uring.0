Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832123BB110
	for <io-uring@vger.kernel.org>; Wed, 30 Sep 2026 10:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762896; cv=none; b=c5o8AkZW5bOoe7RYQguB2WNh9RlGukHWP4asQreVWgDyfYnfkJJ2NClkmyJ1s0tSLfLTeu+DHqiIT/P7a50PdydvWJVubuvJxkqwLE3VALWzMUxeZ2dwoqd059snpkzCSThTGDm9QrtSOx3Rtcs9bA/zF2eWst8A1zhCLmCXytU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762896; c=relaxed/simple;
	bh=yFJZlb+iGZsfhNjOANXyz0l3Z8bjj8XhD2cNkl79VuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TqT/WerQ0XIJUfSwfGhyVZxTU6eacwsJVjuTCo500QZ7NzW1kHM2Wh4R5ESgteV7i4VEQaSh1LdXyJzaqn35oafnMircIrqrKq33Rx70MPtBuo93dDr7zCU7MAPJR27+IlFLp10OVp9Nq++/u4BP5vSyrG8UcU9KYypBrmHNP7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pv6qrUQZ; arc=none smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pv6qrUQZ"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6ad795d5205so670096a12.0
        for <io-uring@vger.kernel.org>; Wed, 30 Sep 2026 03:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790762892; x=1791367692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L6C6Fqcl7JBjpTUHBHO+U+uYrchMJCAF5saUsMOGnSk=;
        b=pv6qrUQZvjpTIGQr7ilzmWajqAelw6/EDANTOn30ksWuTe9TVmd0SVMbuFmVe+LUpB
         sjqXVYJ+H/oWfl3Y0Pi5vnmGW4u/osYljg3ocJ96gNhBhNL8gL2eTRZ9fpw4WI2e8xsV
         pzVKjTjrCN0fRNp+OVV5Okam8ZftHFHo7+kpoMT/T9A4Q+uSVdHo7vPVWry1KoN72Uzq
         xKzjWcRnQGOldYZU2H1jo9mNGTGqmhtwbY0zwWdvc7Y6i2g21Vx1vFhMG+t/FSSm24Ws
         VWpD6LSaSZCqrTqdpcusezC49DCBWv/stolPeavtdUlPV+EVSLUoKgG8vVpJ/6FC5e07
         DrrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790762892; x=1791367692;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L6C6Fqcl7JBjpTUHBHO+U+uYrchMJCAF5saUsMOGnSk=;
        b=Y2rJwg+xAvoSjzC2Sh4KQOMvQoNZSatPNJaGbhIyurtunstFhBhml5vQLIPVBUGvni
         9SlchO7nlfeP3FBh/ixGSkwsnH3U0mmBqpx2RyClEKaRGZenXRzakoku6HmWPIZowOb6
         nUoCnS5zkiWGa3/66OC7znBSNN7Zg36LdhNWdlfBaNV8qc0G5FnSwHvZVs7l/etBqiN9
         9OnANqCFtvCbPT+NCIRfzcqxfxXe9gTVxTWDAq2sI9ixFh6jGNypZlo8w9QSqln31A7/
         ne7uX24/c+Ys6RBj9GY8HkX5ZnT+vKQzD+04+WW3iC/Fy3KFBiE+VRC/ArrOqG6V75ee
         uRYA==
X-Forwarded-Encrypted: i=1; AKwUvBxx6a38koZORRenE73gJAzQCBEJfQAqXyzQ7a2kqE7Dv5YZLqk/xubiSNjvU/VC2DvUHeEi8zhO4w==@vger.kernel.org
X-Gm-Message-State: AFq9FYKIwFlLXCExWiHAno4GzJQuBD+tHAcT7zIyuAebW+/Ss5MHXrbd
	s1EfkC88vEcODuAyQkzVGg/8weR4PiPlsXBUVr++wUVY2M6f2HELmK2e
X-Gm-Gg: AYBFou2MTgMBrQxXhQEUVGgvmexqtW/3flFCK6ffHz7rJsNc76Wy/ksBAGxl6LZxoCq
	Z6li8fiRXZBwP6ZifH9zyGKqGnLk7JYBfVNCtZsWPpUbnKULJr0Bku1iv/9OBFAGMX6Lc+3q0L2
	MVptRgEM7y4rxn+EusKiZB4oaQPVvWuxhQcbxfrZ/KzeG9S4YeU7uV2e4Sh2cqZ8k/DlVKKVt0f
	ZQd2hN4u/lnDajfZnSqGYXhlOmXLPs0/nEg4rUFg5taMrKLOWETsJhbAjco0sGGhwyHjs1/k6G/
	mAqCRFHwyOHGKdz+jVdGWWIb4x1P1aeTwyHeIzuMcpJHEi9YpLq+6VmowGrfXwe67KZtALGccRq
	W51BnEfX0eMezYx+CI2Wmvl3FAo5qUuY5X+O8PuBLsfyV3q+0euGCrmEsyKeNBuJRDanFmBHZJy
	hDsMrTpFSd0IXfgkM6ln+mlO11JjWc0h5HoXWVSocLf0AgjWHRfpajqO3W7G4TlrtiUczvRQ3sc
	gyGLTA5C24opR2bhT0rM3ForYA0/I1DdEdaU9SMB6r1LDWysfQpi27niXd5p84WJpwKBWZB5F/t
	b79XTOJQWmXPNGETKKCfGOAg1yq6xZTWKe5XsyoxENHOwZEH
X-Received: by 2002:a05:6402:42c4:b0:6a9:a362:4646 with SMTP id 4fb4d7f45d1cf-6ae198f0fbfmr582772a12.14.1790762892209;
        Wed, 30 Sep 2026 03:08:12 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae156adf4fsm527943a12.32.2026.09.30.03.08.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 03:08:11 -0700 (PDT)
Message-ID: <447c04dd-6bfa-4c45-99e7-37d25a7ab539@gmail.com>
Date: Wed, 30 Sep 2026 11:08:06 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/13] dma-buf: introduce initial file I/O
 infrastructure
To: Matthew Brost <matthew.brost@intel.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-nvme@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>,
 Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>,
 Anuj Gupta <anuj20.g@samsung.com>, Tushar Gohad <tushar.gohad@intel.com>,
 William Power <william.power@intel.com>, Phil Cayton
 <phil.cayton@intel.com>, Alasdair Kergon <agk@redhat.com>,
 Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>,
 Benjamin Marzinski <bmarzins@redhat.com>, dm-devel@lists.linux.dev
References: <cover.1789997898.git.asml.silence@gmail.com>
 <5490ee42c4452fd4198b245ead20fcf7438c066e.1789997898.git.asml.silence@gmail.com>
 <arx7ZQ8o9aeHsAqS@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <arx7ZQ8o9aeHsAqS@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/30/26 04:00, Matthew Brost wrote:
> On Mon, Sep 21, 2026 at 02:38:45PM +0100, Pavel Begunkov wrote:
...>> +struct dma_buf_io_map *dma_buf_io_create_map(struct dma_buf_io_ctx *ctx)
>> +{
>> +	struct dma_buf *dmabuf = ctx->dmabuf;
>> +	struct dma_buf_io_map *map;
>> +	long ret;
>> +
>> +	guard(mutex)(&ctx->map_create_mutex);
>> +
>> +	scoped_guard(mutex, &ctx->map_mutex) {
>> +		if (ctx->maps_killed)
>> +			return ERR_PTR(-ENOENT);
>> +		/* recheck under the lock in case it has already been re-created */
>> +		map = __dma_buf_io_get_map(ctx);
>> +		if (map)
>> +			return map;
>> +	}
>> +
>> +	dma_buf_io_wait_active_maps(ctx);
>> +
>> +	ret = dma_resv_lock_interruptible(dmabuf->resv, NULL);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	ret = dma_resv_wait_timeout(dmabuf->resv, DMA_RESV_USAGE_KERNEL,
>> +				    true, MAX_SCHEDULE_TIMEOUT);
>> +	if (ret <= 0) {
>> +		if (!ret)
>> +			ret = -EAGAIN;
>> +		dma_resv_unlock(dmabuf->resv);
>> +		return ERR_PTR(ret);
>> +	}
>> +
>> +	map = ctx->dev_ops->map(ctx);
> 
> I'm playing around this code now.
> 
> I think you need the dma_resv_wait_timeout after the 'map'?
> 
> If a device doesn't support p2p ->map() will typically trigger an async
> migrate to system memory and data will be moving but the map is valid -
> Xe 100% does this, I checked AMDGPU and fairly confident it has the same
> async behavior.

There is a wait right before because I read somewhere in dma-buf
comments that I need to do that, sounds a bit odd if I need to
wait on fences before and after. I can add it, just curious how
come that other dma_buf_map_attachment() callers don't need to do
that. Or maybe they wait somewhere else?

-- 
Pavel Begunkov

