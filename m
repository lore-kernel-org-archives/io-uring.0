Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF8C4BEE27
	for <io-uring@vger.kernel.org>; Mon, 21 Sep 2026 16:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790009145; cv=none; b=ZVMImy+sS3p/ot54Lny76Nueo79UhcVfwZhl+OpkpXGu5S5no/TohbiP913xdx5MN8YFilvQCK4pryonN9Ei13+7BeshxQl1bhLyDz4GhGAkAGqBOjk15BQNwWNIv9rxFGxfShC9zcJgS5M8r8P1i3cHqjAnIs/AF4KWJS1uos0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790009145; c=relaxed/simple;
	bh=JAY84BF3kiv4SehvHOx1+RbIx//U4zBMwgXIV1UQ22I=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=VYcKwjR+QgWZSraQFKvTQqD+16pt05eZbUxFNETi7lTAm8UgGTRZBhEJY/hyK+mrPIYhe26t47jTCWf73jb9rQ8AiyoeGvUTPStyqS1hRzcEK2ikmFzHNGaRJpFLjO+RaOutKK1NPoRzkA6vMPmjZWpF/LP9cl2I2Db86MHwNFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=0479bZRE; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="0479bZRE"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4b37a2c0356so1775217b6e.2
        for <io-uring@vger.kernel.org>; Mon, 21 Sep 2026 09:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790009141; x=1790613941; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=myMNJlHREsp2N+3GOX8EU//XKOBcaC2cTYeiE4RcwcU=;
        b=0479bZREiXVBYxQNMmRItGEsnaeESNIpJgzVU8IVjoYIXZu3MFnjs61vtgZj4u1h9a
         RYheFDolZIoPhHXfbdtgfqjBR20oDfh1slDtIvsYD3ANh4LRrTJaxymtFtSpweQiO9dL
         GMPav4HYKDuzsUZNAtvq2Df1czOgugMGe7GoLJoRurwf9aydMfKkd1jOd12Q/Hutwpqm
         ayr1qfxk9b5Xven3mjhyTKRv0uI+dcw0+D8OZxVx7IfyifMkx4hTpeE5eHgHrlkVLy3S
         EiDDKaS1Hugvu1P07nZNfrAjGqRtqjPu8XGuRCNm0zMZ3/ub0BiWtGkRVmLI1kkEd3Dp
         gX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790009141; x=1790613941;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=myMNJlHREsp2N+3GOX8EU//XKOBcaC2cTYeiE4RcwcU=;
        b=0/GxqKEVguzY4SPecHrugcO9+EzEV0wUJKaems72JYbXrT8/1hZA6JLsz8NRA2sDVV
         lbZfOdKxNJayS407tbvVnoBbsYoON7hDWv+wG7SqRF8iGkmwwcrtZKCN6wnqfzYDLNSF
         xxk5TVF7PxC5TM7qNDo92xkRtZaQYwIZu4SB5ONnYfU6onzxmqrV77mwUelXpNMrMncX
         xKVR8o3D+sdW7QL7HWGnWQ/+fLL1bwoQjrAAEKqbKyQ/V+S1hQJh13J6wvUJdz0yCO4E
         QSWTkzo5wz9iVU458Ja5a/bUEYGjxvqK2ckfao/uMQU0MuHw0tUTD89cTxqTRWIcTHuJ
         LMKg==
X-Gm-Message-State: AFuF++k2kLn65n024nJ1bofNssCj0P+w31itlYph7Ox9U8qikgubay86
	u1V2OZNNL/4D+aMLeFh0yxD3O3agJmCI04CmxyAxvvU8i4IcQHcYAKnc+yjGWevvE8U=
X-Gm-Gg: AYBFou3OOYq5oElvgxY+Qj1kkY03wicTbwuI93B8jom6vTwzfu/+R4voJx8B1AmB5/j
	geK3eyUiQfi5dQoYafgs4KaDA3FS0AF6LYYy/iT7exEAQvyWwrFe1qeNjKx6lii2IXTUKAYsilb
	k8LmfWKpeOpi6E7QRONtEaYZ03ulUFs/FARqYYXzVRATp9HxTqRFw4ElPRR4TyCORqU5sMNLuR8
	xV8YoHXYqsKoNe0X15iOSFFLY6DbTJTq4FTK5AA5P7Izng/3qMlJMR3yHZErGQj2IwUVcL0AjSC
	Yinl17LPIeITmdrPYRhKW0Zyv4JT85AFlGzoIH/c7WIzQvbdvqMZ4dTAnGCwU0oM+UyPr9igIn5
	y+4Wtd4gN/QDAbu78hyt5oSbcn4VjLu/9jrUiGVdwNvO2jgPmhvk8g6VJSOj8+tgYJMG+YfHnpH
	RQaWTIcQkEYN0rcz1KHhoDl8rhLjKzSHZANzpme+teNwWiFN94S6lvxqB/lKHnUk4W33CpQTrXz
	n3RRI95TA11fvcjsz6ND4S8UA==
X-Received: by 2002:a05:6808:1705:b0:4b9:e65b:8c36 with SMTP id 5614622812f47-4ccf8408b97mr10078224b6e.36.1790009141011;
        Mon, 21 Sep 2026 09:45:41 -0700 (PDT)
Received: from [172.19.0.10] ([99.196.129.128])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d423d08773sm443470b6e.12.2026.09.21.09.45.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 09:45:40 -0700 (PDT)
Message-ID: <de0221c0-80e7-499b-b46c-66a2adc78db9@kernel.dk>
Date: Mon, 21 Sep 2026 10:45:26 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] io_uring/fdinfo: ignore IORING_CQE_F_32 in last CQ
 array slot
From: Jens Axboe <axboe@kernel.dk>
To: Jann Horn <jannh@google.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dominik Maier <dmnk+artist@google.com>, stable+noautosel@kernel.org,
 Gabriel Krisman Bertazi <krisman@suse.de>
References: <20260911-uring-fdinfo-tighten-v2-1-fa24d517035e@google.com>
 <178914981183.662923.3814591941846027409.b4-ty@b4>
Content-Language: en-US
In-Reply-To: <178914981183.662923.3814591941846027409.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/11/26 12:03 PM, Jens Axboe wrote:
> 
> On Fri, 11 Sep 2026 19:56:13 +0200, Jann Horn wrote:
>> A cqe32 entry spans two CQ array slots, so the last CQ array slot can't
>> contain a cqe32 entry. If the CQ tail points at the last CQ array slot and
>> the kernel wants to write a cqe32 entry, it uses io_fill_nop_cqe() to pad
>> the last CQ array slot with a dummy entry and make the tail wrap around.
>>
>> However, malicious userspace can directly set IORING_CQE_F_32 on the last
>> CQ array slot, causing __io_uring_show_fdinfo() to read the second cqe32
>> half from beyond the CQ array. Change __io_uring_show_fdinfo() to
>> explicitly ignore the IORING_CQE_F_32 flag in this case.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/1] io_uring/fdinfo: ignore IORING_CQE_F_32 in last CQ array slot
>       commit: ab394388d05977f369e8e8d1beceae47fc3c5e72

Back at it, and wanted to move this to 7.4, as there's no point
expediting it for 7.3. While doing so, I took another look. And
cq_head is the raw ring counter, not a masked index. Hence I think:

bool is_last_cqarray_slot = (cq_head == cq_mask);

this is incorrect, as it won't work past the very first run around the
ring. I fixed it up as:

bool is_last_cqarray_slot = (cq_head & cq_mask) == cq_mask;

Just a heads up! Let me know if you disagree or want to send a v3
instead.

-- 
Jens Axboe
