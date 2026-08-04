Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8BF46C4B0
	for <io-uring@vger.kernel.org>; Tue,  4 Aug 2026 17:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785863969; cv=none; b=FnAOaUxKhdVFkpd4lLVnhCgkrt9ttmtdWr5Ulebj2Rs4d4MSm4pSlsLzMPw5RK59u9T6KHdnoqixP46j9Sg4EbIVEEuR0cZePvGDBwCquPRoHQxdHRjsMIGNaaGzqqWTypEftqxxr5q1jFpwCylAAVMf5cfs65iwTXOaO9Zf7FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785863969; c=relaxed/simple;
	bh=fiynAW9WpUzgt3N4BHN/WeqgVQsTYwv6Egh7edSdGZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i25Y6Ez9hAuZJn+qW/e0+PdTVqQew6nw5BHGZBL6+AG+4GunX9Jn0qmRcJTeiyXSTnw+29GPWvHl2bg76w8vKIk2EUMuAeF90kJLvc+Shnu5j36fxQjmbMIjxDNW5CPmnoHbOhaGv55xWmUw88CrsFhvxGZJX9vJOQYK+OGhhB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gB9JzHh/; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gB9JzHh/"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47de0093c42so32983f8f.3
        for <io-uring@vger.kernel.org>; Tue, 04 Aug 2026 10:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785863949; x=1786468749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kJpsobbV6cDtzB2hYIU7sj8yXmkuFvAex2Z4hVps0ns=;
        b=gB9JzHh/xNwbsxwl/HtsyKUVQn66uJpc4fGE3xWBbRBF8Bj789qpQkHuQYRZUI1uZH
         y1ATPiDHs+timfWEFxnQ8qOmZjfmmj3xYlVR86qIr174/WUoTBm8CWOktDfOtHh+vEqo
         FY7kiI/3/FOvVzA03rCNK2f7HteezMqmQ/yylnkzHyLH/U1gz6yngtU+KTnWdrdMlvY2
         +SSMhgpAcY3pILj1UPd1xvW/yHxQFHlVeFWGr+ikEeeL+JufTVT7HIo7ghRoQCOubnyt
         juvM34xc6zLxIMGU01B9wEc7AUyyF6GPpYwVIJ6J3IpHXum3mOowlhaN36AJ36Z1POyc
         EhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785863949; x=1786468749;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kJpsobbV6cDtzB2hYIU7sj8yXmkuFvAex2Z4hVps0ns=;
        b=kX/vskAHFf8zddYBKmItD5lkVzVqfHPpMGTaRfyidPK8lUDzzR9DrGKeNCM8tiwUme
         GvIVedqnhh3xt7qJG9atI/RuPx/rbMK5V4lcZettPOrUTRyGTg90o9b0nWHn6mw7PSRP
         Csk1nxpfHv0zfbBE+WV+MWkN+8vqFjLkr4NzDTtCc0NPYRmNZH/vcXvHfLbqI/yl8uIh
         Fvp9vPV/01K/nvhIqS448payZOB7JC430JnPDA4LyK43nkCZ4nWMV04hYqbOIAwI41w2
         PQnK9eTN3MlZGERj4yNREkBFbJraCgOFI5Z57cF3PPgFkfgwnNuQ358Nw9Y8oMEU+zLQ
         TXtg==
X-Forwarded-Encrypted: i=1; AHgh+Rr+x7jjo0Hqcubu5yPkiBqXRl1bkY7UmfJASyTthGomcGfSHGsR9fZ4bCwCmaZIfxeB+C5QVPC/5w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6ojrGfqdxm/H00eL4lngiftIxj1NHoDhE8DjG6mCCVSNei5hm
	nTm+ei38CMT8UHwwwpEr+kHlcH0wp8bxybrtTXZpuXlJcvKO/VoPIPX2
X-Gm-Gg: AR+sD119C6tGJNYwNrDYHJ7+lqY186DMz7uqqkzNfCUjnKRT7Y+LSSCFFS4yN3y2Auz
	G92TWC6x9dwEx320/8mjENPIMCAj+YS3dB2FBxAQR4fLseguOC/xwhV3uJP+HWV1ml112NSSo3a
	XrTIgOPUoaa9ZtSevYd1GVVUVN5B9pSvFQi3Rr4IzANR+aUVvMrtMRuxOFW6MOxa3uC0xkbTyOQ
	lNGLigrNfQJf6MvkeQluvNHbYj7745KfXaEMAlGhCCSO00q8KDulu2Y5MVLf5BLzsrv6yVtyIfX
	wPajLk1Rn9dRW6b4m7hehy+Ya1tReNFkH9PX67MBgHkCl/LCDNxOZPPm6yLHiTeZj+fG9L8Rzm0
	FsXG7fUayaRQ0EMRYcLanpCT+IIb7EETM2NbvReB0RlKvY/lnuNL02V7Wqbxj2/HudbYX0WWaQ8
	Rm9dnrQSWK/XKfrch2rv7AnE+nOdm6+IIT61jXdXwS8VTwLwI1tqNqhzHUCv80ruv30cfGmZPbP
	QMF/hgWaxhOiO/izjfpPvQ4wxAa+IHPRhZ1FM7x00apk2vDEEGVHXoo0oal36dVvkWVBgZvoXba
	fEXs0BjeuwKWx5VOWss71PJ/GjunQvpsbYGex1A=
X-Received: by 2002:adf:fe49:0:b0:47f:941a:796d with SMTP id ffacd0b85a97d-47fec4fa3admr1381301f8f.12.1785863948785;
        Tue, 04 Aug 2026 10:19:08 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47febfda6afsm1357370f8f.3.2026.08.04.10.19.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 10:19:07 -0700 (PDT)
Message-ID: <38163009-770f-4596-abe2-249efc113f59@gmail.com>
Date: Tue, 4 Aug 2026 18:19:02 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/16] block: introduce dma map backed bio type
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>,
 Sagi Grimberg <sagi@grimberg.me>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>,
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
References: <cover.1785596451.git.asml.silence@gmail.com>
 <e26aefbcb383be7092dc76343ce745013e671334.1785596451.git.asml.silence@gmail.com>
 <20260804162440.GB12292@lst.de>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260804162440.GB12292@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/4/26 17:24, Christoph Hellwig wrote:
> On Sat, Aug 01, 2026 at 04:46:19PM +0100, Pavel Begunkov wrote:
>> Premapped buffers don't require a generic bio_vec since these have
>> already been dma mapped. Repurpose the bi_io_vec space to strore dmabuf
>> maps as they are mutually exclusive.
>>
>> Suggested-by: Keith Busch <kbusch@kernel.org>
>> Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
>> ---
...>>   
>> +static inline int bio_split_io_at_dmabuf(struct bio *bio,
>> +		const struct queue_limits *lim, unsigned *segs,
>> +		unsigned max_bytes, unsigned len_align_mask,
>> +		unsigned start_align_mask)
>> +{
>> +	unsigned bytes = min(bio->bi_iter.bi_size, max_bytes);
>> +	unsigned seg_shift = bio->bi_dmabuf_map->seg_shift;
>> +	unsigned offset = bio->bi_iter.bi_offset & ((1U << seg_shift) - 1);
>> +
>> +	if ((bio->bi_iter.bi_offset & start_align_mask) ||
>> +	    (bio->bi_iter.bi_size & len_align_mask))
>> +		return -EINVAL;
>> +
>> +	/* single contiguous range into the dma-buf */
>> +	*segs = 1;
>> +
>> +	bytes = min(bytes, ((unsigned)lim->max_segments << seg_shift) - offset);
> 
> I guess ->seg_shift is some sort of encoding of a max
> segment size?

I'll add a comment.

We rather need the minimum segment size, you can always split large
ones. I calculated it even stricter as the least common multiple
pow2 to avoid divs here.

If the device supports N segments and we know that each segment is
at least M bytes, then we should be able to issue IO of size N*M
of full segments. The line above truncates the bio size using
that + offset adjustments.

I guess it might be more straightforward to calculate the worst
case number of segments and then adjust the splitting size, but
since we don't return the number of segments it's more
computations. E.g.

seg_size = 1U << seg_shift;
nsegs = (bio->bi_iter.bi_size + offset + seg_size - 1) / seg_size;

if (nsegs > lim->max_segments) {
	nsegs = lim->max_segments; // unused after the block
	bytes = seg_size * nsegs - offset;
}

-- 
Pavel Begunkov

