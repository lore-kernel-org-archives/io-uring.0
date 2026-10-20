Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506977;
	b=rKgNr0YPTrvvedlNph+JGS5nuZQAmAF9Cj+9srcgd1hozB6eCd2OhUoHY2YNNh8h4laz
	 oXD4yzDN+/MR7Jf9+xH2QxjunHl8nCXNhyug4c3VoXJk/vwtiNWbVNM+SX2U+yFg3QYa2
	 PGhXFVg0VcX0kIshaQ4LnXU3IZZmwxLQuyP5ppE38aFpCIoz5FyXesrVl2qyBq2YGQM0m
	 lsCM0ab0/R7S4k0vR/zegTTavJLVfLIJQsPp0DnR+XFdhpOqNn4us9j30sLTPcgZvHKUQ
	 +iXCUea37N8O34s+8Jd0/XxN9ChsrnRFVWiWi+6LoP+cPp+ffsJ29bKItBtShHevrnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dR1+dS7v7LccK2f/cm83IFIuuzYbBQwl7Z5inKNTp64=;
	b=NSnQd3zoY11elvu7I7vphqgvOMMCxeMt3oH4um7wRjTDlYjCfq8vxH5tsWKKJE7bxDSV
	 dF8u+/Atqd9At8b6mDUoCc9bi6F0mZLueXlhUf2Af533HMD7g7JTSxL0recYrjuuR3yuu
	 HPd0LPQ6rqTi0lk/RCje+HQeTEE4OwvYalKJgngO1+2AM5qmkgmTByP4LOE9UmtOcB7yZ
	 Xv+dFYSLpPkG1NJMdh1DW62M3DhXtU1bnYEqYHwAJfaPgKyNgAYHfefzOdBOTr03Ugrdl
	 uLhQGzd/H/HNm0AOPyZ6c5ToawqQUqaTOCFGJVoPmWii4N0c3PQjz4aBXqnvioTzEWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=IRQOxQZ1;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC11360A260D
	for <io-uring@vger.kernel.org>; Tue, 20 Oct 2026 14:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC11360A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=IRQOxQZ1
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15ea896ddc8so4121078c88.0
        for <io-uring@vger.kernel.org>; Tue, 20 Oct 2026 07:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792506976; x=1793111776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dR1+dS7v7LccK2f/cm83IFIuuzYbBQwl7Z5inKNTp64=;
        b=IRQOxQZ1T8Kz/NCch7J/b9CsN+p1GsO1GtbQyP4T5MT58c2CfTUbQjRHDk5YhyqQfb
         VDmfdtniiIJ6FZddnvN4nOkeKk9pfg5wIfBHdidiW3hFcTTcxgh2J4xG4A3pz4y4sIxZ
         yBIJbp1YuhqIU4narGtuMSln0yyX9Ld4WDG36be32pCCJlUzqucAON/Ro64hu3e0M0YK
         iGs6oZeSRIwRg5GT+jz97ttLODf9iWm07HIl/NGX9idwCPz+88ysJYEuOCwQQkZzfF7J
         a823jwht9kaxJqdmhN81FBTWH0GIlW6tQQWEo+9J3MQGr+BL4GVg+mPCRloHuyqTGuxb
         5F0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506976; x=1793111776;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dR1+dS7v7LccK2f/cm83IFIuuzYbBQwl7Z5inKNTp64=;
        b=Xy3CrL39mLRqyZyEOuiUnTA/DxCnfhzJT0ZSY34eZau5j568GsHkO67bbBT/SrVfvp
         boPafjl5Nn6cqD2hT0ra8eJcdPg8hh22QCyqWkmChE9uA2RuiF/+60p4KOmRXDPNW9Wq
         +bVn6YV2Vsuoslt9H2T8CEuGcJMBPIZDJjQAivR9WC6sxbA0u+z7FbTDb1e7IjRf3Vrj
         C74zj/OBCvRTVO1VeZOoVMcpTrd1h8c2Svpg4mbKn6feiQmGpioL01eZl6J99ZbREXrC
         km5T6snHYFcG7xudMyTMP6FZr/qip058JrWW3d2Uk/oEtpn9gcUtem+wHzTPr7oOMYKU
         GDUA==
X-Forwarded-Encrypted: i=1; AKwUvBw6plNcwrydPYaOrQhkXHIYW/EDifxlM0FKXL2QLrV/H9zycT6ISl8EfWpRbreQb/HzVMgl6M54NA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJp0bHSWvju9CfwmLsxRmRfIuiplHoj9vv4xNwqB+AV7IOT5jRQ
	vYlDwlEsD90P/8XJbsMHZ+bF4vikKw1liQgUb1LqJCgE2QINfikGAnsvb/WNb1dhmTM=
X-Gm-Gg: AYBFou3whG0kHScHiSVy10FoU/Qh+5IsB7LqMK5shCFb6JyyTufxHoL8NeWt6Q+LZEB
	XZi4U1jUUOw84CXWkJp77yEdRcZNs22ehz4AQXJQx/oMCJcdigEuq6Joe1EF2EPtnSrH+0HxnwL
	IgW74iVj+LKRSsVro/xeyLSj5YwgEssrDklSxOBzeRtL80DRaKc+b2F5BNAoZxgq9rlMUQoSIHg
	mq9VAWPYrHFdn6lgaGL+yAFucdG6M2dQwxb6N2JPtxl+3MlRs/p9XeYDDfgRgrmQTPDrkVb748l
	18nuu5x3GfmD1CM5J1ftOE6xAxRMqq+p/0piy7XVMmBwWDjvWsrZbvzEFyWmHRaGfJX8gKPSW9W
	cKMloKRK+DqpmcBA8nITTKyygvy16jdX6291YMyp/uSnDMhUEHOYDnETM8azuaizC5pC4yPkkem
	vuvViOrT3I+v9pc2gxQ0pqOYsBAeIpQbCNl3OMd/dhab0pXu5cvN2Mlc2UIT1f1ip+BTecX/caS
	EwFxn8gQB0NTw+UpA9BEMzOuo/P251UUm3RTx5dy6Kgr2ro1dlP/N19NOInHlxZPW/Cx8U97PdA
X-Received: by 2002:a05:7022:ea9c:b0:149:49c:233 with SMTP id a92af1059eb24-185138b5a78mr13727639c88.27.1792506975944;
        Tue, 20 Oct 2026 07:36:15 -0700 (PDT)
Received: from [10.61.8.29] ([155.98.132.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18319d3b880sm34657256c88.10.2026.10.20.07.36.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 07:36:15 -0700 (PDT)
Message-ID: <933e2d11-5bec-4737-8e5a-9b0c2a8cad60@kernel.dk>
Date: Tue, 20 Oct 2026 08:36:14 -0600
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
Subject: Re: [PATCH] io_uring: clear IO_RING_F_DRAIN_ACTIVE on drain
 completion flush
To: Wei Gao <wegao@suse.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261018070154.16944-1-wegao@suse.com>
 <ae73d8b4-c2b9-4a9c-adca-8c995ac92975@kernel.dk>
 <atbWH7hdrvLQJhOl@autotest-wegao.qe.prg2.suse.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <atbWH7hdrvLQJhOl@autotest-wegao.qe.prg2.suse.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/19/26 8:46 PM, Wei Gao wrote:
> On Mon, Oct 19, 2026 at 02:50:16PM -0600, Jens Axboe wrote:
>> On 10/18/26 1:01 AM, Wei Gao wrote:
>>> Fix:
>>> Make io_queue_deferred() return a bool indicating whether any drain
>>> request was active or deferred. In __io_submit_flush_completions(), track
>>> whether any completing request had REQ_F_IO_DRAIN. Clear
>>> IO_RING_F_DRAIN_ACTIVE only when a drained request has completed
>>> (has_drain), no drain was active or deferred (!drain_dispatched), and
>>> ctx->defer_list is empty. This prevents premature clearance if an
>>> unrelated completion flushes while a drain request is still executing
>>> in io-wq.
>>
>> Didn't quite feel right to me, below is with some LLM assistance
>> to try and get to the bottom of it.
>>
>> Thanks for digging into this. I don't think it's just a race with a
>> slow io-wq free, though. DRAIN_ACTIVE is still set when the next request gets initialized, so it's forced async and goes through the defer list
>> every time, even if the drain request is freed in time.een read.
>>
>> Basing the clear off any REQ_F_IO_DRAIN request in the flush is not
>> enough:
>>
>> - A drain request marked REQ_F_REISSUE counts as has_drain, but
>>   io_free_batch_list() punts it back to io-wq in that same flush. With
>>   an empty defer list, we clear DRAIN_ACTIVE while the drain is still
>>   pending.
>>
>> - A second IOSQE_IO_DRAIN request that fails init after io_init_drain()
>>   has run gets completed via io_req_defer_failed() right away. If that
>>   happens while an earlier drain is still running in io-wq, we end the
>>   drain, and the next request is issued before the earlier drain
>>   completes.
>>
>> It also only works if the drain request completes through the flush.
>> Without DEFER_TASKRUN, io-wq posts the CQE directly from
>> io_req_complete_post(), so the application can see the CQE and submit
>> before anything clears the flag.
>>
>> A drain request dispatched from the defer list always runs alone, so
>> we can just remember which one it is and end the drain when its CQE is
>> flushed, and have io-wq complete drain requests via task_work so that
>> happens under ->uring_lock. Something like the below. Can you give it
>> a spin with your reproducer?
> Thanks a lot for the thorough explanation and pointing out the edge cases.
> Your proposed fix works as expected. I ran 10,000 iterations of test with 
> your patch applied, and all tests passed without hitting the timeout.
> 
> Feel free to add:
> Tested-by: Wei Gao wegao@suse.com

Great thanks, done. Thanks for the report and initial patch
and the testing!

-- 
Jens Axboe

