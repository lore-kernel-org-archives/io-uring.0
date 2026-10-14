Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D71560AA8
	for <io-uring@vger.kernel.org>; Wed, 14 Oct 2026 16:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996210; cv=none; b=CiOe/7WxDNuubEJHtk/Dsi2V+pFXca1Lv82AvDzhU1yCJyrDhiRi5xnaHfwPHih3DyGYzLCbp+T0iFkD7rk4EuMdkbaCAnisGXFPaTjyeON9+pZFa+YLvdKwPr9fs+56SiZD1PgsD+yrSKM9zkTahyvmh5Szz4B9/9UeIYvOFjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996210; c=relaxed/simple;
	bh=inWFXH/4gvwDDJShSxb1UbDeXwomoSCtPfVrGbG9V30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BlmSTe3wnpB7tBwx5PKnd2ZTn2rYxix2Uiqrlr0a7ObCUKTot9bpnO7MYbJuhQepx671a1bbzcO4UxWKe3hrxApmZEq1J1O0LepOjXM/GEIEgAga9POwgmnWxb2KJyehK+rFBXunaJ7SmGpVkw/NdKikWf55WFA/K0reK0PEsYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1NM3HAv; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1NM3HAv"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso33440075e9.0
        for <io-uring@vger.kernel.org>; Wed, 14 Oct 2026 09:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791996207; x=1792601007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MprqRVTku8rnnoqrNidogE79Hh/sbjcVtJHMk6QO0CA=;
        b=E1NM3HAvhNi9WchZCxi00OWvzNXWTS2u9u46iCZ3ECQeHnpGaWCZkd2cly+63fqf9N
         vCRSfhbNX4pSk9hS9CdsqxtJ9Ct3kD9jrt77wBkSBXF+cbMZ9YyJCbxsApFjfxGwVHkQ
         9mI97SUREXrgYZjUWhNcorUK/AhUkfbW+kAiYYRCscCCfVyE99IvI5Lvc+isggf0hntX
         ILRq77IJjxILg2lW57G4jEGwEYrprjfZgboCuATbf849dHnvs/BT/5NTChKw9SrVwSYC
         ojaj/o0+U59n8OjEQVffo6tw80KC9ygURz8nKf7xjhnzzmTKJzZNJFGetkIgcLFaC/NG
         GqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996207; x=1792601007;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MprqRVTku8rnnoqrNidogE79Hh/sbjcVtJHMk6QO0CA=;
        b=0PxjaiEM1NQGH8R0Gf/Gio0spuQsYDqA4/RlZ5Lcl6aTLRgTZqleKhva12MqIdFY9F
         91nLv4G0bFAj6Tt0Kg7FPV5O22louahEm6ZVC6z2qfpfyF18ogm8yPzv6AA6B5zf88oa
         TxKwZ98l+Kg8zMBBi64TMYumJ+46kilLADRuC3SGhjt7vkt0qhEB+3bRV1crn2XrsMt3
         Wj3XF8Th/2rNUhqdBolUxJJ/8OP+7GH55dQ7cnB5ZkpfTsEWgO9N1wN/cI0MwhjaxJNH
         bHg9jyyJYcikgoDxkK3lJBv1NU2sfDCCieCr7d2IVmt065kKdwfMY1VBqw8pQBp7dMlC
         nNmw==
X-Forwarded-Encrypted: i=1; AKwUvBx5EpbJUEo0qKknYJ40bqE/bao7Q8ne/eYL8mgYaq2d+xCcFp76ffELkg2fRvQir+JDMfSZJ2ZmsQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKXseUtqO4s01/JEYWkhaac65Qf3xCaK+L8NPJwesVBLCwtGxaZ
	7v9wp7rLDFkG6GXmnCVxwZj6aHNgfzWVfJnixMBFXvO6Of1Fksd92HtZ
X-Gm-Gg: AYBFou2QXwzT3P3ouIR24GkDY0Xol2pyIUNX0gd9h4ts8fyk8cwGbj/PwkkjNttIwLw
	/W9F/f+mDlnL3MBNpM3gInbdV7ErOHPbhc9K97J+pVHRAz/YM7EvvMAc61jmHinDkNhk5qBBzYO
	B87C4Zu/DzQbRP8t/5roCfpuZXXsRUF1UgR1mfE11HBYUUYmSVzNisj1Ft/NxwvHIZVnZuc74aU
	Zu9mOlFYk84PugxWLidG1sZR57x7vYQ743uBAuJTTEraNB1HcVXoSe9BYYtDIx9txpVNX00IlIZ
	6w7pvjAJZZmHOTUq8kDE2rPEpVsckrwXjQawb3NL4YYgSo8iWjNzfdluMarDduvsD7XItngkQoD
	cNbEzPgDktk88r1ExYa6XdWmIsQ0VIxDYfpjgWc/EHVWwdkJ0Ie8fW7ukueBUhH8STuw1477tOh
	XO66/KVo9otLTbkri8Wta79DRBsqtSfwHM0A+perubOLdDv4qXGhmT/Pv8w1Azynb4F5QMDnpUp
	l2gD/PghxoyaK8MBnbJfPp7UHFy3ttZZpeulNG4UNT9Q1xvP+X9bg+2d08PCcoZ1t5fRJdkp2Hi
	XrtBLQ3hBBSoObBWJS3T+h+joK0dwwm9BhA2qtqnQJf+Wx9Z
X-Received: by 2002:a05:600c:83cf:b0:4a1:ac66:604b with SMTP id 5b1f17b1804b1-4a1ac666a65mr120408565e9.1.1791996206748;
        Wed, 14 Oct 2026 09:43:26 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd640be0sm4751135e9.1.2026.10.14.09.43.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 09:43:24 -0700 (PDT)
Message-ID: <7d3c3cc3-5c7b-4d28-82d8-2cdb5e010c29@gmail.com>
Date: Wed, 14 Oct 2026 17:43:20 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 04/13] block: introduce dma map backed bio type
To: Christoph Hellwig <hch@lst.de>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-nvme@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>,
 Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>,
 Anuj Gupta <anuj20.g@samsung.com>, Tushar Gohad <tushar.gohad@intel.com>,
 William Power <william.power@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Alasdair Kergon <agk@redhat.com>,
 Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>,
 Benjamin Marzinski <bmarzins@redhat.com>, dm-devel@lists.linux.dev
References: <cover.1791975048.git.asml.silence@gmail.com>
 <39b964cf7510f42755188563da63d3d5acaf2aa9.1791975048.git.asml.silence@gmail.com>
 <20261014131554.GA16467@lst.de>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20261014131554.GA16467@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/26 14:15, Christoph Hellwig wrote:
> On Wed, Oct 14, 2026 at 12:02:02PM +0100, Pavel Begunkov wrote:
...>>   	case REQ_OP_DISCARD:
>> diff --git a/block/blk-mq.c b/block/blk-mq.c
>> index e929f94b25c7..1b7f8cbbda8b 100644
>> --- a/block/blk-mq.c
>> +++ b/block/blk-mq.c
>> @@ -3150,6 +3150,12 @@ void blk_mq_submit_bio(struct bio *bio)
>>   		goto queue_exit;
>>   	}
>>   
>> +	if (unlikely(op_is_dmabuf(bio->bi_opf) &&
>> +		bdev_has_integrity_csum(bio->bi_bdev))) {
>> +		bio_endio_status(bio, BLK_STS_NOTSUPP);
> 
> Wrong indentation, conditions are never indented the same level as
> the following code block, even with the weirdest preferences.
> 
> /me note the patch from Anuj on the list actually got this right..

I had to split Anuj's patch in two, should've butchered it
while hand applying. I'll follow up on that unless Jens
already applied the change.

> Otherwise looks good:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>

-- 
Pavel Begunkov

