Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF621ADFE4
	for <io-uring@vger.kernel.org>; Sun, 16 Aug 2026 13:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786886810; cv=none; b=baMUZClFgzngwhVvOvZOMRsXwxdXcuLOopeRjMLViwLhZ2Uh9jb/I83YCDxXZzHp9+1VcczHbhZDtiGPlpvHe0mPwivnNCzKHv+xBQkVZekabYeVBsJsIf8+Wx3EmiIO06fKCCC1qxjiwtZJboYypGPvTLzrpGR4Cq5AshUY6Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786886810; c=relaxed/simple;
	bh=WolDcnoyYYWpL/wEoj/8j5nQWKOIsaWcx0p2Fvmj7EQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hzmlat+7tr9Ng57j0iXM6nzZT5fVWDFDDBb6VsTbaRaQf7VPpYu7SjeW5dl0vD7CBMjE+LojoX+eYoet3eeN/y0b3H7W2XsHNFBy+APmuaRMYAN5uJ2LlDNx5CQ4pNMaCLhkp82jEyoXSk4/TSv0XyKFoXTlvXhvC3Z196G5ZCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S6ev+GmX; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S6ev+GmX"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4954dff6536so18922875e9.0
        for <io-uring@vger.kernel.org>; Sun, 16 Aug 2026 06:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786886807; x=1787491607; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q4ncF7PMB5PQYvMzxEFMiA4JGuqwWsU1nBIl5hnPM6U=;
        b=S6ev+GmXb9jNOZFO9GOnKSThmeRr2g4TTb1S4aZjrXruztMRoi2Hat0BfwKhcpZ7XE
         wST5l1V477NGABLZF9LanUhDvJBNdO4T2Pbxd+yMfvyWvvAerzZfwjyHEkT9/Sp8+WJP
         8CCkEAbsvbtWcb23BDSLmuDqc2r+JcOyResE+u/hGeNb0damKqIUYsfaU0LJwYmehkl4
         iTobpyEhZJu/ffJXCgCrRHqjAH055W5Hvgr/1f0BjWd/QeuqHDXMzMig05jI8WZs507b
         GeNBNqorR91nVFr2ayCcLLnrSkJNUO6WBBtv2hSnw7uq0D8GglZfOkBJ1GLdZzLx11A7
         9x6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786886807; x=1787491607;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q4ncF7PMB5PQYvMzxEFMiA4JGuqwWsU1nBIl5hnPM6U=;
        b=gfWsJCvK5OUYR8FtIYGvbYz29DNNeB/gG/AV0ilI5HyhA4uwdDvJlR7kSOH26zmW9m
         R5+Up1MW9p15wmeo7ALGT3Stp00jsd+mdn0HOBd5JPPJ1aRnufd8LaeDPrYpUon0g5QL
         2Lrlh5HdGMTiZTIa46FB4ZDWr6yPxlRHOQs58dbbHHR7xUA+QFugoQncX1bUe93Enoeu
         1lN6aXpBohMuXnc2ETs5Bd/vAeP6sBgC9I2vamNjFSm/ZnFIj8Z4cgMnjVztaYpnJyF2
         kM5XOmJGJ/uMWXKKzMw/1mbNVXTsHDZ4h+D6De+4Uo0kowgLuuF8EYl2PTznbbQm6cWH
         ZS6A==
X-Gm-Message-State: AOJu0YxAv6RIC0x4vjUtWYQZ22DTMOw5yd+2YhUPacyZn6yJaVFO3wwb
	gCgnCJcT9KuAB0ZOffpKBus5GFLiF+Dycq+Ww4PYPrxkZap7va5AawGXHRwFjQ==
X-Gm-Gg: AR+sD12Cttq/CxmHfUc4asDiu39MqIWpTiIfnmxUkU32aOJB5nslekwWzigLJ0oFOlA
	tq0VDbMo+MrMuPdYavq+m3FI0fhdm6fsIRNPybO3DdgJEaRJ/OTc8kqpiuWBnqbjHoJ1s8iLBba
	FzPjULEKi2OuGZ3b0Q+FN4RJhp1qOBtJw2zBIZaWnEySYjklPlWa2p5gOnqNsYNBjiUgdCNvXP8
	sWpOcMFmgC7qAUvddtzx9beNdaQNO1krJsuDPxg8h2hVowGI/ulO4zjNAZVVMCHgmtJksBNd5V3
	nPs2cFrZe8pORHqZ2fBk2bqtPw757OSbapQq33kZasgK2+sOxrihjB0+ue/Sjwh5lDogmu+RUcW
	CrzJGCCRiTHtM2RYiq3eJC+UjrojOs+adGL42ZcPgpmmS2myvttMqKTeN9XH34pG25fEp4W62Mu
	xQRVk3nWuXOezZWEoqJFYA/s13pU1GqyShTgxq6u59Lkr4+mfXADOiZ7vgvXaaBJZ7Ar4pVzuhl
	ETd0DgGRd6ho/TbuZW0swEOgL2PD6u4xloeu9oW6DFznCQktPF0VyPaky3cDs5BzS2DHH1EktTd
	xvG2dqxTmmgXZv55WHlu9oMKYg7QYIPF8NUdA4n+t0vnzKx+pw==
X-Received: by 2002:a05:600c:3151:b0:499:51f0:a9b2 with SMTP id 5b1f17b1804b1-499880b4335mr251800265e9.1.1786886806436;
        Sun, 16 Aug 2026 06:26:46 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996127629sm43504425e9.14.2026.08.16.06.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Aug 2026 06:26:45 -0700 (PDT)
Message-ID: <80f87119-fcf9-4fcd-9e0c-fc9f60fb6e03@gmail.com>
Date: Sun, 16 Aug 2026 14:26:43 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/bpf-ops: wake up the loop task on eject
To: Sidong Yang <sidong.yang@furiosa.ai>
Cc: io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-kernel@vger.kernel.org
References: <20260814030421.61216-1-sidong.yang@furiosa.ai>
 <bfb153e0-d3f5-433a-963c-da71c1dc4850@gmail.com>
 <aoBJMxDWsakOjOp4@sidongui-MacBookPro.local>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <aoBJMxDWsakOjOp4@sidongui-MacBookPro.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/15/26 12:10, Sidong Yang wrote:
> On Sat, Aug 15, 2026 at 11:26:50AM +0100, Pavel Begunkov wrote:
>> On 8/14/26 04:04, Sidong Yang wrote:
>>> io_eject_bpf() clears ctx->loop_step while a loop may be sleeping in
>>> io_loop_wait(), which releases ->uring_lock before schedule(). Nothing
>>> wakes the submitter task after the BPF ops are unregistered through link
>>> destruction or ring teardown, so the task stays blocked in
>>> io_uring_enter() until an unrelated CQE event or signal arrives.
>>
>> If there is nothing to wake it up after bpf removal, it wouldn't
>> be woken up without it either, it's a mess up on the user's
>> side. What's the use case? Especially since you wouldn't
>> normally be removing it from another thread in the current form
>> of the interface.
> 
> Fair enough - I found this by reading the code, not from a workload
> that hits it, and I have no use case to justify it. You're right that
> if the CQEs the loop waits for never arrive, it's already broken with
> or without the bpf removal.
> 
> Two corrections to my commit message as well. Ring teardown can't
> race: io_unregister_bpf_ops() only runs from io_ring_ctx_free(), and
> the sleeping task holds a ring file reference, so only link destruction
> on another thread can race. And it's a liveness issue only - the task
> sleeps interruptible without ->uring_lock, so the Fixes: tag was too
> strong.
> 
> So let's drop this one, unless you think the loop should be stopped
> promptly on eject regardless.

It's preferable indeed. It limits what we can do in the future,
so I'd avoid doing it if there is no use case, and if there is
an application, I'd want to hear about it first as we'll need
other aspects like how it should look like with callback stacking
and so on.

-- 
Pavel Begunkov

