Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9784D6C4C
	for <io-uring@vger.kernel.org>; Thu,  8 Oct 2026 14:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791471287; cv=none; b=vBe/vUZKZTM5WIol7/xbW9xtD3uxd6QV9uO2ZvKf8uX37kqAj3b3M8lnKaJp4N/vNS5JVLh6yTdy/xc3Ye88F/wQBIpuTwTD+0xUhHRrjb4LVUW+8H7GjdW3onOZVkMIhX7qFDm64GThb15rLMh8KcV7wAoT3MuMqFwgHWNhAGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791471287; c=relaxed/simple;
	bh=mTVYvKeNxH9x54GqxZX8L5n+NY3oJiIMt9Q4M8B7Qjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q8onSHPi/AuPH8U5iXm6G1rEKy3URI136ajaq60oTirdt8WR8hLZMyVeNbI12wcAcItwMy9pfZemfiKNzvKehfz82pHeV6HB1GYobBOSuI2304hfv1dvzo3icUgjzntTabjAfPXYeBIBK26Q4O+y56NsA2vIPUpteLbC4VP10p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=nVIVnaOp; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="nVIVnaOp"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4f488ba6e90so1362256b6e.3
        for <io-uring@vger.kernel.org>; Thu, 08 Oct 2026 07:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1791471275; x=1792076075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LCGr+lVw0FZ4ggSWHdBUJKRxZZGinYin+dhCyqmG9ss=;
        b=nVIVnaOpAPtXCj+1nYNm4rsGPofGyGUnoErHzJzzrrhhm1u0s9ARoT2Xj0LRuQgxre
         B+YHsRCba4yGnI4t0Y2Q61ktU7jjhpCWbsgmvhF6ehNjlp8SvP/UX+hP+pXyFf3UlLIa
         Bp5MPQQhQ3S7pqOAUCUUpzUQZIEJ2+iIGP98r1XjlQVZ4kq3LB3v+hkGPXJCOyqbOSNb
         ypeRYlxGCmHI4MzA42at88zLK4XprTzFgm8tAIU/D1+DyfR1h4R7xPAJS30uh1PPO7FB
         ZXPuzRETpIVTGAGMut9tU+84GqcHvQ8dShRQWfI0NIdL9tjx08Vb5XmHe7Pp52IBR4rn
         kicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791471275; x=1792076075;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LCGr+lVw0FZ4ggSWHdBUJKRxZZGinYin+dhCyqmG9ss=;
        b=mkLhmm2EEUcOpB1mJ19QBiSWZpoSr8BEruaGRLeCojtQjAqYPA8s9Vl2FWqIY5CNtR
         MzXjDKB8br4ekhyhdhGulH4p4N479tZokXfJk51H3WRDvs6I8J+AqzC37+cCOCbKt7Sx
         AGRBNyk11TdSFhA2To/B/pY+EJ+HMNLI5LKitDne6xoGXglcvGWiGpSsVTXAs57BLBKE
         TF9oLefGIlgSZMBrgJne83z2UNUGDfomEgBk+32W79Hml+/rbhXaLedP0AhDZT/SAzpm
         ywRQlSHKlqmWUw2CsoT75GPoT8MYU/6jYmeLOIIXVIf7VujbszCIkmEPYkjDlmugpMaU
         yQPg==
X-Forwarded-Encrypted: i=1; AKwUvByOypgR7Lqa39kkd1KXTZsoJByKcVstmSKZI4QgwAXQ2jAY5Ez45HyOg4r716WH2DPf2HXiIitQxA==@vger.kernel.org
X-Gm-Message-State: AFuF++ma85iD9W39tCnwBsl2xPD7LGygzA6d6dr56Axgkrohbp0vvdAv
	b6O7pB73uRTtnzP+uKkq15TnWNs5K1sw6MPW670kkohcN0pNnu5D8BhqA/2GZlv+jI4=
X-Gm-Gg: AYBFou0GmvAHM8QH2wxVg90TrquhQGnJlBn+Epaibj80CiHX218HWyVpnBHMigd7IZz
	p+8Qa49uIMfPYLvA4ylK17upgRzD8a2WN0u8q7HVUTYazIoF3MYabluYhm+lK4o0rgwC6fk5OLn
	KfylVeFkxIJVcxCfrJDBrbXy50LL0pVp3YBlbYUjmGpuALSwm3pfZYra/lSLYxJLoHn2sGf/I8R
	FV2dBhgizJhjtag9tljxGIknhYBVjYLM4k6n54WDFDpLrmz2orSK+uA6cIextawYerk6PxsgQQq
	njNbjX9pJ4v/Bgyu/xsYj/QjRdoCm/p9n022luab0rplFANxT3Y3kbbs6oi7rW5qr4WPg38thFu
	iBiw7BiiIvBIEIypk/eJEd8b413GcU+aoodvmzk6EGkezqjYJwbiw+OYWqR4Duqa6KMSCXXZCj/
	nPk66zop70se6FF4kQJ2ZSyB/ZBrGcN4bLhJ5v85xeEfH5+dVRzm+jgniMtQ3xvXanP5NvFKciB
	58MtLZZWvGvz8eCLwCDYiQ/TTrOnynvrGiRNMtVUJIFowRniq2tiig=
X-Received: by 2002:a05:6808:c213:b0:4e7:a6e3:7338 with SMTP id 5614622812f47-4fc452489e3mr5378129b6e.17.1791471275421;
        Thu, 08 Oct 2026 07:54:35 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4fc49656fbfsm5760405b6e.15.2026.10.08.07.54.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 07:54:34 -0700 (PDT)
Message-ID: <b5a33433-b0b9-4231-9998-23e2a2202091@kernel.dk>
Date: Thu, 8 Oct 2026 08:54:33 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] io_uring/memmap: only charge pinned user memory to
 RLIMIT_MEMLOCK
To: Hengyu Liang <hengyul@cs.unc.edu>
Cc: dw@davidwei.uk, io-uring@vger.kernel.org, stable@vger.kernel.org
References: <20261007213903.445430-3-axboe@kernel.dk>
 <20261008045733.773725-1-hengyul@cs.unc.edu>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261008045733.773725-1-hengyul@cs.unc.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/7/26 10:57 PM, Hengyu Liang wrote:
> On 10/7/26 3:38 PM, Jens Axboe wrote:
>> Charge RLIMIT_MEMLOCK only for regions backed by pinned user memory, which
>> is what the limit is for, and leave kernel allocations to memcg. User
>> provided ring memory keeps being charged, it is pinned.
> 
> Sorry for the late reply, and thanks for picking this up.
> 
> I tested both patches on top of v7.3-rc4. The test case from my patch
> prints "64 rings" again, kernel allocated buffer rings are fixed as well,
> the per-user locked_vm count is balanced after ring create, close and
> resize, and the liburing tests give the same results as before, except
> that read-before-exit.t passes again with the default limit.
> 
> Tested-by: Hengyu Liang <hengyul@cs.unc.edu>

Thanks for testing!

> One case is not restored. v6.13 did not charge rings created with
> IORING_SETUP_NO_MMAP either. Number of rings created out of 64, as an
> unprivileged user with the default 8 MiB limit, 4096 entries each:
> 
>                                      v6.13  v7.3-rc4  this series
>   io_uring_queue_init()                 64        16           64
>   io_uring_queue_init_mem()             64        21           21
> 
> PostgreSQL 18 is in the second row. It puts its rings into shared memory
> with io_uring_queue_init_mem() whenever liburing has it [1], so I expect
> the failure they reported to stay. I have not run PostgreSQL itself.
> 
> Would you take a patch on top that leaves the SQ/CQ rings uncharged for
> user memory too, as in v6.13? I can send one, or test whatever you prefer.

Yes for sure, please feel free to send a patch we can apply on top.
>
> Also, kernel allocated IORING_REGISTER_MEM_REGION regions are no longer
> charged. They have been charged since they were added in v6.14. With the
> series a user with an 8 MiB limit can register a 512 MiB one.
> 
> [1] https://github.com/postgres/postgres/blob/REL_18_STABLE/src/backend/storage/aio/method_io_uring.c

We should still account IORING_MEM_REGION_TYPE_USER, anything that isn't
memcg accounted. I'll take a closer look, but if that isn't the case,
then yes that also needs a followup.

-- 
Jens Axboe
