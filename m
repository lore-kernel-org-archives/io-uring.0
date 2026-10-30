Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793390666;
	b=Zo0Uvl3YUXJJiOayjiJjNeB5wi7kgOMZJG2eIBMiLF21iVFWlVRvdMyQH8+lAOArYSkR
	 oYzpY/HyDZVoUy4jU0/WPCnqUgT2egbHysKfXHHtN8laNB8prHyNUxV6RlRXpECbjh8A+
	 TmTCkWMZJBiFZhrcvqzEC+FHEFZlxW5jXulUnSWo5vWF/UYdqMAEKJ0aXcpuaxBq3h8SZ
	 ExuwmdFUPLHPZO1lA39LQrwl7mGFGqq2VjJwWOoY/Y3DgXkI3OLMpVO50u+++daldEjrA
	 kEmAErFNuSgOziTTAhndtBDl+YHFSSBUmhMadZlbUGVkgGcdSnLVgPgnzAdbAup5nRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793390666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=/aveSAcDre7rIAFksjG//1AJCbCzdokzMeG5QD+mvkE=;
	b=v8rBNRM72wyXCn5OG2Q/P4LEIhDMMyx24awbXQ3ZhwwgqAw5cQvAZD+5QhbBii05ZXzj
	 h3G89zV79HoMIgtfqCExU/LBUG0XwAIVgcdSFUHoRquwK7J9y2cTeklVTth62J5j8dLPy
	 PcGQf2e2ycnPqwYwXwuW1jsq+ssAmByZgtWGcHbnS/f11C36hdGo9SmMrO4MHOz/JR4km
	 sYoZt+fDZ1NfrkcMcdaoCeXqqdAvpHAfsQW+DwfDylZeipmW9u995k4hp8S1Tdz6/vbbG
	 RCp6MaEx8iW/BNz3Hn+4Jw7MNMdIcU/jHNIT3ZjvSMIFjWgNyzpgjIRNmK37f3NMyJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="DffaK/B3";
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA79606A31A
	for <io-uring@vger.kernel.org>; Fri, 30 Oct 2026 20:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EA79606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DffaK/B3
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-85c1135c286so690646a34.1
        for <io-uring@vger.kernel.org>; Fri, 30 Oct 2026 13:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793390664; x=1793995464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/aveSAcDre7rIAFksjG//1AJCbCzdokzMeG5QD+mvkE=;
        b=DffaK/B3m773o3eCoqhkSvj1kYW29Ut4C7d6m/LUvpSmhyrPxNWYhXrqYTumnWUP6t
         fNOwl6ird+4qWZ4VztWd24FRq6vWoFhF/1zbSYXYc0KayJcwrJ6kPDp32blYWOwmC3yK
         LWeQprd+f8pP8i3S+0GfXeY2n11wnKkis1lwnqZu7Q4dG2C/oVzm+dOX29L7GT8Hm46O
         Gakm03bSTNNF8wAb66/9ySft7r+wViA8ToTnvWC8KUYfKD3t/cZkfULoOGaq2jItJKbf
         Wkx83oYT9F3N89FoGqwHuFnno4MhYRTIthyLmbcXs2mMhrrDSAmoReD484VOJKNAxORT
         2QuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793390664; x=1793995464;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/aveSAcDre7rIAFksjG//1AJCbCzdokzMeG5QD+mvkE=;
        b=p/g/ZQ0pH+mlnc641DagKnA07SFVc8lANECvFmwyI01y76/YzRPHNzWyrBEsMT8GjG
         EYUgiEk8R7bT07cW73BUYazqNRVnv/3lB5eauf7O6b3K4cbnEtVQqLBU97C+TUzCPBWm
         ePn3IKyK8mDhRvzpq0y0DjVOhktgvG4Qzoj9NWNJIOiCuyLZ4O5hILRpCU9S3InDuXKY
         lOFcBfQg4l6QSXWB+liE39/3BF0j7novmXi6LcPL//JdSzFKz/lLMbQLlh76N/UnbsSg
         xJI45Z4fQOgfGJx4OGbSdD3JhWVcfgzkeSg+73j8cK4P5WNi9SVSa1UDrP0Vlf+GV6IF
         Xmpg==
X-Forwarded-Encrypted: i=1; AKwUvBxNCMzYTT/wBPpl90OD1MJlBUn/bnYqMFdIfwirv00SnaMZgcs+W+KXOJATappI7eC8ZnsWTidrSA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJBFFEdDqV6sOjco6Nvlvt2ImRPLG2vx+0M+CWzi758ub4qeJve
	TEOYUwd4hofAm9X0Q5/tyqxq+9KnJfjAJgjuf+RMOcUp4G/OwMp/s4Hon5JhNYni8J4V6r6Z4TR
	YYo5KR1U=
X-Gm-Gg: AYBFou3YtWM2xMyzkc6vuUh9qo8fNgYPKIgxcVYLDfvymagL1WmOaE5ysTDgTmzi+4o
	ro/WbHrL2By34aNJwGA3ZA2RIh3s0vQI6A0Km9p8SfEjfXLKZlwNsLGTwP/12ShqhwXBqCphdgU
	FGW72bz5I/4UjqRlpqCtXTLQ7ZN9Yb9f3hDnYsrao7A5lnNx6hOFo/lJ3CEp5gbulQ0fXk5s7t0
	+ROWXaGGtsgYhJ5CEQ0RWxCnTwTNXadm6KD2YZWmwD77KeyKYmOixA22fqEdItVyP8Ssz8CGo4B
	3sPJLggCN5AEgHIfz9J9Th+ta5gXkV3scb98uf+Ex0P+i7ZK7ejDJ8GkPLqcWc9LclvLIGlzSS1
	FZaa4BdGxmcI3RUEXWKlaOwYitx3QUsYeKylmUXJQLuSQpheTjIOTVFiy8qshu8qSbCSp28VWeF
	+t45p9IAjkX7jo+MLeE2Sfs8fYNJUxyGkPrBQ27MNKxf0b4jzMYDacl4JMfNBQP1Rn0Z+3cG1t2
	8moLmVtGz/XZ6k7kb1oBjSHI45AIGLnEDkVPRqQvIq+cgtaiJJuKcEprKq46eUn4iuxHqY8tUYA
	bxMyH1PVOVn6RHFk3yvPw8iP3tumqN6pkhInI2Ps+7eNs9gNE/ew45wg+y0MszHQPx41Mt74B++
	jxZruHuecZQ==
X-Received: by 2002:a05:6808:244d:b0:4d6:90d3:e18f with SMTP id 5614622812f47-5640de2ea31mr2521690b6e.46.1793390664235;
        Fri, 30 Oct 2026 13:04:24 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fda0sm2404156b6e.13.2026.10.30.13.04.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 13:04:21 -0700 (PDT)
Message-ID: <22616bc6-a393-4dd2-bca1-8912cf2bf51f@kernel.dk>
Date: Fri, 30 Oct 2026 14:04:19 -0600
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
Subject: Re: [PATCH 08/10] io_uring/cancel: drop sqd->lock while SQPOLL waits
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Chris Mason <mason@kernel.org>, io-uring@vger.kernel.org
References: <20261028164732.1264069-1-axboe@kernel.dk>
 <20261028164732.1264069-9-axboe@kernel.dk>
 <20261030012506.10611-1-kmehltretter@gmail.com>
 <8d7eeef5-7308-40c2-8670-733a69e24fae@kernel.dk> <auTrEl1ahq53QKrz@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <auTrEl1ahq53QKrz@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/30/26 1:11 PM, Karl Mehltretter wrote:
> On Fri, Oct 30, 2026 at 07:34:06AM +0100, Jens Axboe wrote:
>> But no reason not to make the check see it. I've queued up the below,
>> what do you think? It sets IO_SQ_THREAD_SHOULD_STOP in io_sq_thread()
>> before it cancels, and tests that bit in io_sq_offload_create()
>> alongside sqd->thread. Then no new state needed.
> 
> That looks good, except for the WARN_ON_ONCE() in io_sq_thread_stop()
> below.
> 
>> diff --git a/io_uring/sqpoll.c b/io_uring/sqpoll.c
>> index 49c52284ecdd..c833e776320d 100644
>> --- a/io_uring/sqpoll.c
>> +++ b/io_uring/sqpoll.c
>> @@ -433,6 +433,12 @@ static int io_sq_thread(void *data)
>>  	if (io_sq_tw_pending())
>>  		io_sq_tw(UINT_MAX);
>>  
>> +	/*
>> +	 * Cancelation drops sqd->lock while it waits, and a ring could attach
>> +	 * to a thread that is on its way out. A fatal signal doesn't set the
>> +	 * bit, so set it here for io_sq_offload_create() to see.
>> +	 */
>> +	set_bit(IO_SQ_THREAD_SHOULD_STOP, &sqd->state);
>>  	io_uring_cancel_generic(true, sqd);
> 
> Setting IO_SQ_THREAD_SHOULD_STOP here on a fatal signal means
> io_sq_thread_stop() will see it already set when the last ring drops
> sqd->refs and trigger:
>   
>     WARN_ON_ONCE(test_bit(IO_SQ_THREAD_SHOULD_STOP, &sqd->state));

Want to send a patch against current master?

-- 
Jens Axboe

