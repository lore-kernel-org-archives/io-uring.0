Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6093BBA0D
	for <io-uring@vger.kernel.org>; Tue, 20 Jan 2026 21:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768945515; cv=none; b=lPwsi/fUdfPf4aHllV9TI+/mwAV7RCt5ae3QbVJZLCnE4J6fXKf1s7efHS10Xrt07x+gNq7odRasC1BUwvE9PHL6fDty+XDI41N1xk0s7ZMeIGqF4UISO6T/IfDP4AoSkrF1074Fb+2vynhakmwuzaVsNZVIen85f/gApukBC9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768945515; c=relaxed/simple;
	bh=IA85NpiEAZDIPExWUQuK3efPNcrbbelJ5Re9MvHChCY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=WPiWBCNGbm3xFAC2tIZH4aBT5epQjyUbaL26lTEApUCsQ39fd9OyRe+vv2ZsQBPv9tHjL9MQRU/fBsV0PgnZJdANpIjO/ZygwgpQdaPsSRKgSvUmrJcO1oIqYayRPQCB3JJK95fGF6iSWEkdq3ku6zkx3HYzXeC7lfHz296lIss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cOy0STUX; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cOy0STUX"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso2253985e9.1
        for <io-uring@vger.kernel.org>; Tue, 20 Jan 2026 13:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768945511; x=1769550311; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=76GjIwmmNHDMhjPHVEUL/aP6yXjFQm32bCZZwJGshzI=;
        b=cOy0STUXyfkIA+payp5Ls08sBadmogXDqpUYqFHgWdikw2AGH9R8qslDu2mrMjaCRW
         S4RgtluReHUmRKQR+JWkZkD/r5cdaVjjHeIRDlK9wLH4Jq/X/G7L2x+qhbU1MHSh1WxA
         aek3V90/9CI1Cfi/IeLIFNFPrTlgsSk7YfRiMF4+vUEkr4V18EJlSN/zFjsi6QO1mWS7
         wfN/yKa337pDAh4fGByx9Zj2l2c/xwlVDS5i81luAPff9yLdSGksGjPb0RUR5fAAVcNn
         JS2gTJ6etLB2F6Ss7t+oEIiT7iD8dJqROLlGgg384j9joMu1rkGXJQedNPyNlXHc//Oj
         XFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768945511; x=1769550311;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=76GjIwmmNHDMhjPHVEUL/aP6yXjFQm32bCZZwJGshzI=;
        b=Mm4XV07c3Oly8Wg/mr2ob+oz3v/Hv4RKHEi2j9/iL6dK9y5zKiQAOnB6LJi8ABputf
         pY7CQ5aefI3YPjqiqcStrkru4/QItrunvUBhAkeHUVyqd33klqDioY5/Etkcfa+UQQ55
         GwbKGYvrCgR6FCIrOEgzUee9a1WhDWb9ZaPHX+SdpsLJggadGKW5KIV0jQNn9VIfxgdU
         VAj/8pYEkcRaFArKlZ/nPNpdRrRRkifS5RCUg3aLKJOXCBDjPx+CAA4ChRzuYb0DHvRA
         l6ci4IOUWYBk8mu2fZWehBBj6r17SoN0p5ueNz9gdD2+r0wk+74FCTmR3XejW/Xc6jy8
         SM4g==
X-Gm-Message-State: AOJu0Yx4hRY7tFlQs0+E/gy1H7hZMyhQRLjZ6hALOaca2mYbSeICK6tg
	bnZj+BRSYW8p5aaMRo0XLm/zu2EArqkJHcRvCcAMUTAVNVesiOXxgfwD
X-Gm-Gg: AY/fxX4exYddLH+GXnZHr5VACmz3puq/GWrjDq5zfyY2noKBoAATI9+ryNnd3fCQtBl
	j2rUYKr69rP8UjXCEclYRgOeX543cO/4TawG+H7p6c1JXyJHqwrnLxLkI9Oe6jrzmwdMTam06Ef
	wWKrrNiHQgFGBQqbHFWX9RhRZ4yMqyFhHmUQv3PFuDY85hEGlfgS0EYkdd9MSHksN+MvXeLpDAU
	/jDAcudjrQ2S1LTwyn/lhDi0oOBoz5COh24z6T3hcuyEtxE8Q0kK8VsApXlGsxZnXpZS+XTFUU0
	VGUdOhOtnq4IR1gRHf0YgEX7FVnfDDF1LsKVDMmkgTvQh8folcaNssfLfQVzIsMrMXPybwyFMxx
	29BF8QzDsisENA0ncvaZ8Lx2xUgBuvFClRQxD80XCszrs1vovDgPV+25XO386R9JEB/Spskx2wD
	sfxYo71N7JNMHt3GxgmlcHp3Usc0CsNy7NnoSw30XqHa0z5Po3xSFtpyHwpUqd/7kjfZBFZ97jK
	vqV6SvxCz4bqJCn5eY9i4kUdIo07t7Z1wnhPe5HOuIsIzSUeHQju6mvxk1UUfBSuQ==
X-Received: by 2002:a05:600c:17d6:b0:47e:e97e:11aa with SMTP id 5b1f17b1804b1-47f4289ac52mr168292055e9.4.1768945511265;
        Tue, 20 Jan 2026 13:45:11 -0800 (PST)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e886829sm264939395e9.8.2026.01.20.13.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 13:45:07 -0800 (PST)
Message-ID: <2be71481-ac35-4ff2-b6a9-a7568f81f728@gmail.com>
Date: Tue, 20 Jan 2026 21:45:05 +0000
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Pavel Begunkov <asml.silence@gmail.com>
Subject: Re: [PATCH v2] io_uring/rsrc: fix RLIMIT_MEMLOCK bypass by removing
 cross-buffer accounting
To: Jens Axboe <axboe@kernel.dk>, Yuhao Jiang <danisjiang@gmail.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260119071039.2113739-1-danisjiang@gmail.com>
 <bc2e8ec1-8809-4603-9519-788cfff2ae12@kernel.dk>
 <CAHYQsXTHfRKBuTDYWus9r5jDLO2WLBeopt4_bGH_vVm=0z7mWw@mail.gmail.com>
 <2919f3c5-2510-4e97-ab7f-c9eef1c76a69@kernel.dk>
 <CAHYQsXQK4nKu+fcni71__=V241RN=QxUHrvNQMQtPMzeL_z=BA@mail.gmail.com>
 <d8d28435-2a89-4b25-925e-14fdb346839b@gmail.com>
 <8c6a9114-82e9-416e-804b-ffaa7a679ab7@kernel.dk>
Content-Language: en-US
In-Reply-To: <8c6a9114-82e9-416e-804b-ffaa7a679ab7@kernel.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/20/26 17:03, Jens Axboe wrote:
> On 1/20/26 5:05 AM, Pavel Begunkov wrote:
>> On 1/20/26 07:05, Yuhao Jiang wrote:
...
>>>
>>> I've been implementing the xarray-based ref tracking approach for v3.
>>> While working on it, I discovered an issue with buffer cloning.
>>>
>>> If ctx1 has two buffers sharing a huge page, ctx1->hpage_acct[page] = 2.
>>> Clone to ctx2, now both have a refcount of 2. On cleanup both hit zero
>>> and unaccount, so we double-unaccount and user->locked_vm goes negative.
>>>
>>> The per-context xarray can't coordinate across clones - each context
>>> tracks its own refcount independently. I think we either need a global
>>> xarray (shared across all contexts), or just go back to v2. What do
>>> you think?
>>
>> The Jens' diff is functionally equivalent to your v1 and has
>> exactly same problems. Global tracking won't work well.
> 
> Why not? My thinking was that we just use xa_lock() for this, with
> a global xarray. It's not like register+unregister is a high frequency
> thing. And if they are, then we've got much bigger problems than the
> single lock as the runtime complexity isn't ideal.

1. There could be quite a lot of entries even for a single ring
with realistic amount of memory. If lots of threads start up
at the same time taking it in a loop, it might become a chocking
point for large systems. Should be even more spectacular for
some numa setups.

2. Most likely it'll further relax accounting (i.e. one way
road), and I don't believe that's the right thing. Could even
be unexpected if consolidated w/o any explicit communication
b/w rings (like buffer cloning).

3. Map keys will need to be {page, user, mm}, so I suspect
impl is not going to be exactly trivial either way. Maybe some
nested xarrays + something for counting middle layer entries.

-- 
Pavel Begunkov

