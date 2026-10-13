Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCCF545D93
	for <io-uring@vger.kernel.org>; Tue, 13 Oct 2026 20:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791922401; cv=none; b=dROmqImnqaaBxQF3CrdRYw5cRs00FWgVXAqKSu0hdS/UOIUt0HwA4i7Ko+kaAvsWXWs7Th6uL1tAp/jI2uZhxBATl9A65o5zfEMj7XHHllmlny2QSmbB+K734jrFkMqfElApEHHlq/Mlf435C5yL48MpsiuJWjj00h7vkUGZHR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791922401; c=relaxed/simple;
	bh=jhbx9laNPy92AqwKrICB3iCZDPZ5wNo0jYJGltxXPiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lOUzj3W/9C1XTk0B24ZwUmlgqpZv6F26oXJjx+4kaLGKBcOeIIZGC3q1ULwtYYYcbDuYtiBmxcHbTNKUN4PuDU8N5QgTafkzdKFyLp3tgONbBmHPxYws2jHHiVAsyfPKD6r88k13+1jx0dLGHD9GlRtju7TE6IoTafJLdjBOMaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ld3gp7MK; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ld3gp7MK"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so3542835e9.0
        for <io-uring@vger.kernel.org>; Tue, 13 Oct 2026 13:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791922397; x=1792527197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z2hIuYUY9dxFL1uM5B7+C8H4OaVqNBpDv98EiuOQjRo=;
        b=ld3gp7MK5FcPklAwnoAExZfcQ0nj4/hfGddimZr3xS6GP0gYcjwgPTZDcP12Ee/g5o
         YO474N/HuWU8J+zgOHBgDO5fU/OXrLAv0wx1SNXyUayt3524LMDm01VvpeRDkkPTjwKb
         1BnUO6jONh/m02aBdswYTy46X8oyBXHiuLr6Ol6RI/rDWMfS2hfXlHNixSwsRvYg3sa2
         ZVvgJNEOZA3rpauEkqTIFOaeJscyA8JJj8/MQ2Ll9WFGWmuvc14ROSKKPNBOJ5iHjl/a
         6RlolqFpDWJX6FnIqK5R4k//PNcMKCrWFuMyRoqajPFt5NiFTscqn5N8zWmWhCk1LBA2
         50HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791922397; x=1792527197;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z2hIuYUY9dxFL1uM5B7+C8H4OaVqNBpDv98EiuOQjRo=;
        b=U8deJZLxcPxq4z4B6FnczhnM21EjOzhtYCTcrFetqv6G+RoXXfrQXLtftJ99knSb0q
         DlyeVZod823RBW7sMjD0OONrXsGYYa2PkMLeJQ+cl/WBqZxH/CSvHhjUGIdS58E40kgg
         vApaDAn96+y/KggVmhNgpbFWv1iWsiSohhqY6q28hCwEwH2KXYgp9cICC5+z6QkX9iU7
         SgyAGkDrMwP0Wf1+2usVN9kwn4wYphfsiFxrGvu1KaqwHOM6X2uatZmpg+URF6EBoneD
         +Gt5FoSit+ok0zyc8YyYdZCSUdEIp+VqRqqzV+2noNjbg8NZNLezpV3bCTvZ0wEI/oXO
         ZRbg==
X-Forwarded-Encrypted: i=1; AKwUvByZ+0H2Qat+H2+pjJ1xj/u7unQr5ktmnGm/wRd6EuLa7qJdqb6+BcF8GjFoxLDMg8D7+MYhQsz2Yw==@vger.kernel.org
X-Gm-Message-State: AFq9FYL8GnTr82t/fb+MRAjol3G5BoNwg+OG8m+n0lRDlYtSC5160fzq
	9L5v1+bR7miOtCb5B4z1cffraBKwrtqBBF1q7yiHwJ49GJgOXxOkzE2F
X-Gm-Gg: AYBFou2gVfGnlLlBouWPOuf/zl9y9KdRxkEqRQ8msQbySj224wZkeHJnvFw2h3TkLUg
	TeYKTy3Tpr2jbZcaTddK8B+hkpNfghyPIgcJ/J1DCG5byuiNqxT8h3c6fMXzI/nB+YU6xCBTHPL
	mUo+twQYFm8z+nEECqxVYHmNFWcyBh5aF06A8ivlxmy9bOyXOjXmIO3jJXIIRPTeQ1TXIvs+mEK
	RlznpWYh+ahWlwBUBbH8bB4tZM3r1K4igLjvuJOMaNnmbNClGk/jbOxXuIY952jhnK/zyojUvr6
	mOKSPLkEtZMKCkdj7ks5EK7BU3gvpIHOxknlOTzxp9aC6ZHwCpcRFAaHVzlvW6b+xizDdBOVaQ3
	LktrpdSj0ulPLSkprFz01Z7TgB0LE/6gqsC9b4VZl4o4prf6ImJKOZwWkyZoXaKgdEWLqCqsQ6B
	FLDEn8idFy8vJ8VyBeO7QQ1uDD96CSYlNnk1/hoM6syq0L05faxSEa8//fAQbAgpcs0AYlkD0uB
	R96fIJVfDtjnzbrnq0v6vaKuaOePFhydzg992WMv2jhIz3ytjG0nXVUSGeKtaZI817hUNLzVfHW
	S56GHzoA8XFCFnw9c15L5mMahT20N/0pEzvSt8UIEnkmiCGU
X-Received: by 2002:a05:600c:4f42:b0:4a0:b6:4619 with SMTP id 5b1f17b1804b1-4a18e3ecfc8mr324117205e9.0.1791922397398;
        Tue, 13 Oct 2026 13:13:17 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be97d1esm608335675e9.8.2026.10.13.13.13.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 13:13:16 -0700 (PDT)
Message-ID: <736950e0-c890-441e-bfa0-ef5d2b7b7d4a@gmail.com>
Date: Tue, 13 Oct 2026 21:13:09 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 05/13] block: add dma-buf support for raw bdev
To: Anuj Gupta/Anuj Gupta <anuj20.g@samsung.com>, linux-block@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 io-uring@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>,
 Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>,
 Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>,
 Benjamin Marzinski <bmarzins@redhat.com>, dm-devel@lists.linux.dev
References: <cover.1791336930.git.asml.silence@gmail.com>
 <CGME20261007014324epcas5p2a7f3b03f118c9a1d1c633fe839ed1e46@epcas5p2.samsung.com>
 <af2b48a490186edf38f1d4a5dfd9513574f7a350.1791336930.git.asml.silence@gmail.com>
 <bbb87d6b-b7a3-487a-8be4-27f3f9ce4a1b@samsung.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <bbb87d6b-b7a3-487a-8be4-27f3f9ce4a1b@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/8/26 13:27, Anuj Gupta/Anuj Gupta wrote:
> On 10/7/2026 7:12 AM, Pavel Begunkov wrote:
>> +static int blkdev_init_dma_buf_io_ctx(struct file *file,
>> +				      struct dma_buf_io_ctx *ctx)
>> +{
>> +	struct block_device *bdev = file_bdev(file);
>> +	struct gendisk *disk = bdev->bd_disk;
>> +
>> +	if (!(file->f_flags & O_DIRECT))
>> +		return -EINVAL;
>> +	if (!disk->fops->init_dma_buf_io_ctx)
>> +		return -EOPNOTSUPP;
> 
> dma-buf doesn't work with PI: bi_dmabuf_map aliases bi_io_vec, and
> blk_integrity_iterate() walks it as bvecs to generate/verify the
> checksum. rw-dmabuf liburing test hangs on a PI enabled NVMe. Something
> like below is needed:

Thanks, I already took it into v10! There is some some confusion
with the branches, but will get incorporated in either case.

-- 
Pavel Begunkov

