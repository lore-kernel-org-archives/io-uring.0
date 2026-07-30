Received: from mail-oi2-f4.google.com (mail-oi2-f4.google.com [74.125.231.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90BF432E6E
	for <io-uring@vger.kernel.org>; Thu, 30 Jul 2026 14:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785422061; cv=none; b=AjW97pfSNXHqdQXoGtvukfNIX/Eko238up0h8ZV7qrYfaSzIdmYHlQEdYqMxwR8s7DW5AHlgg6UjSCyXR+e+/nedotbZtz7E61K3QexmIXNKrv+Itp4BuGl0XhrNnbQLBnuetu4JIZflwcVL5S6Cui1hvBwBqorHTPcBEtsXR2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785422061; c=relaxed/simple;
	bh=TB9COi3LZwqdeW20gV3IacB42nQh2XS8QzExjKq/IG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TDslbjPFi3idsuAMt7DPxwL23/5pRcNfExIj1xHQfTz7AfHvKBVIq9Vs0DK8/z6oB5BjHcaU9tqoZZt8f+2msTk9+83C4bwg2BTuRc8aFQ9QVkzRQJOpzaCJGPRtLPxiHTkP9hEbeeTN8VQo4pqI7uIbwI72pxRK5HJo4YLs/v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=W4C662Sm; arc=none smtp.client-ip=74.125.231.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="W4C662Sm"
Received: by mail-oi2-f4.google.com with SMTP id 5614622812f47-49ec9d117f2so202330b6e.0
        for <io-uring@vger.kernel.org>; Thu, 30 Jul 2026 07:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1785422057; x=1786026857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sL74mQw0WBxRoWRghx17Ng3Z07+sXaKozIlj/fsplB0=;
        b=W4C662Sm0V5xzscBhax4gHQ1noaQJaD7a3IHjaqCKtoiiKriQXyNcxzFAqoRdwnSzU
         BwWzvhbewCoSOSRZJgAzEiETEyqGxceOOh5siMpTm8HzDHR84wLdNrgHAqj8y+RGSjBB
         kThppv/NKSB/sWw+vUYJ+lJk6BAtQDujBw57hjNKY6q/ClJm+HcGtnpGByJyloi7Vgnd
         EMkLHI+/0P+lF1y2/V5B+Q4v2dkpW34Ky8X8d2+XpamteNqwydFFX4aCPh2yvn0qyPRJ
         5IVOIT4CCtSXqd/loSlg/3qSXBFIcO/GATkMI0KWOxDO93G4uoHnudq+rCBuQxnOXBwW
         +ghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785422057; x=1786026857;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sL74mQw0WBxRoWRghx17Ng3Z07+sXaKozIlj/fsplB0=;
        b=lZqzn2SRZkTNwjyiFGYLsJybonOo+WeM7Xzj8EzK/o3/9l88yq27WYtWI0qjT1t8WG
         ieb+upr/0jq13qRfEe8iNwU+ht1bDuq6hXGrbXFa6XXz+3H0916n16CClOYRIXfr+nF3
         cM239i+d4/9/+msmiBDNtTJUD+8qlRMfezrLi+LmlJ4Huygl4L+TtEWtFazxv9bnQFVH
         rmlMPTYnt5aoR1VkQj+ZW9LIYb8MXSCnWniZ+XzwCrzR87wlGRS1+a8AkCyEPcKlyAyj
         QvK8+bhpY+FlSMCn8baIArkpGcjl/QpuxkhqeWcVkOaHsKn3FTpvUGoRAXfFICXhmswD
         /EBA==
X-Forwarded-Encrypted: i=1; AHgh+RpqCyZnTidrdRIBD7DuLQqcnOtRU3hTZM5vjILTVrHmUrDC2kQAuOlcR0e4opVQ/8SueA4s/4pH3w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9OIe9YtYxFNbKiv5dsPt3vadp/SUT/9nSljaBoG8BN+f481bb
	hKxgLh2O6zEEWnlLkpLSsMtSZ3eCSSn4RXSTp5RnoyI4872vq+dlFcMI8Gws4c/LxJU=
X-Gm-Gg: AR+sD13HwtEb0cGF10vj8Gx41O/EPzTqvYd7fDZh8SFDWREGb3GPI87BSIngDEF3/uy
	3GeBBwOb7Nb/3aEti8IYdpOdUn8GxP4lsQBLgptS+VyLtyvB5AK+7Q5Xz2rGktvfBN3MXBhTWZq
	yFFp43E1FCtYNIiNJfeYYAYsj///fMWSsytGeEhqbW/vrZfMfNDML4sB7I9z22xuJiiu3hHz3Sf
	Avr3JymsICaGj9d/oQ6H6uM62BD6if1C7YJ/ql+iLx48KSl96emPuGvroJAqkBL+6xUtJahpZSz
	otbNvSKokVr/FDTVdaJKhPtUi2n8P/OqKZDKIOWxsXH1f+SBcFqureuLXANitWhOXHLtCmE9Rd7
	MxH/3QSse8syVOEhirXs+fe+XJcQgmcxi7dnKDCSAt5St/XnTO1DQPL81mj6JmL6UV2oE84nslj
	RXk4MZyzZDaz3r7SPjLZ47FiTT+8rS9ciU/kKlpkTKlVSO2ASNwH4Jj/OiGqEKvvxsGjhnbwdGP
	JtVcm1mpQr/6qZD3YgzvUDKc1HwIvB/8eoPSakm+ud6RzGxSzcOKTyj
X-Received: by 2002:a05:6808:159a:b0:492:9e13:d5a7 with SMTP id 5614622812f47-4ad876c9e1amr2001691b6e.6.1785422057412;
        Thu, 30 Jul 2026 07:34:17 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ad6ecb8040sm4033444b6e.1.2026.07.30.07.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 07:34:16 -0700 (PDT)
Message-ID: <e679211f-f036-4cd4-887a-430aa9376fc1@kernel.dk>
Date: Thu, 30 Jul 2026 08:34:15 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] io_uring/futex: scalar wait/wake slowdown after
 079afb081c42
To: Chengfeng Lin <lin2530632123@gmail.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>, Robert Morris
 <rtm@csail.mit.edu>, io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
References: <CANGjgdn=R_qyUdE=j9za+vkmqcxacbP-84OHXF4nZ4ho9qRyVg@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CANGjgdn=R_qyUdE=j9za+vkmqcxacbP-84OHXF4nZ4ho9qRyVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/30/26 4:42 AM, Chengfeng Lin wrote:
> Hi Jens,
> 
> I tested 079afb081c42 against its direct parent on bare metal. In a narrow
> scalar io_uring futex wait/wake workload, the child was 9.27% slower. A
> separate 338-line standalone reproduced the result at 10.02%. All compared
> kernels actually ran with preempt=full.
> 
> #regzbot introduced: 079afb081c4288e94d5e4223d3eb6306d853c68b
> #regzbot title: io_uring scalar futex wait/wake slowdown
> 
> This is a focused synthetic microbenchmark, not an application benchmark. It
> uses one raw-UAPI ring and 32 cacheline-separated private futex words on one
> pinned P-core. Each timed cycle submits 32 scalar IORING_OP_FUTEX_WAIT
> requests, then 32 scalar IORING_OP_FUTEX_WAKE requests, and drains exactly 64
> CQEs. Every wait must return 0 and every wake must return 1.
> 
> I used a fresh boot for each point:
> 
>   6a8118a77eec parent A -> 079afb081c42 child -> 6a8118a77eec parent B
> 
> Each point had 3 warm-up rounds and 15 measured rounds. Every measured round
> ran 512 cycles, or 16,384 wait/wake pairs. The results in ns/pair were:
> 
>   implementation   parent A    child    parent B    child vs midpoint
>   formal              180.079  196.647     179.856        +9.268%
>   standalone          180.171  197.856     179.502       +10.020%
> 
> For the formal source, dropping the first measured round gave +9.269%. Parent
> drift was -0.124%, and the maximum CV was 0.169%. The standalone drop-first
> result was +9.996%, with -0.371% parent drift. All 90 scalar timing rows
> passed the CQE, result, timeout, overflow, outstanding-request, and CPU
> checks.
> 
> An untimed child trace also hit io_futex_prep(), io_futex_wait(),
> io_futex_wake(), and io_futex_complete() with the expected request counts.
> 
> A matched WAITV -> WAKE profile changed by only +1.385%, below my preregistered
> 5% signal gate, so my claim is limited to scalar wait/wake.
> 
> I understand that 079afb fixes the exit-time use-after-free by keeping pending
> private futex waits visible to cancellation before their mm state disappears.
> Scalar WAIT and WAKE both use io_futex_prep(), so in the child both sides of
> each measured pair execute the added tracking call. I am not suggesting a
> revert.
> 
> Is this per-request cost an expected trade-off for the lifetime fix, or could
> the same exit/mm-lifetime guarantee be retained with cheaper tracking?
> 
> Evidence bundle:
> 
>   https://github.com/lcf0399/linux-regression-evidence/tree/65c8cbf86f40cbe759e3f7db1d29d152ba03a8f2/io-uring-futex-inflight-wait-wake
> 
> Standalone reproducer:
> 
>   https://github.com/lcf0399/linux-regression-evidence/tree/65c8cbf86f40cbe759e3f7db1d29d152ba03a8f2/io-uring-futex-inflight-wait-wake/reproducer

Great report, thanks for that! I'll take a look at this. The inflight
tracking is a bit of a big hammer for sure for this, and it isn't even
needed on the wake side. Can you tell me what parameters you're using
for the reproducers?

-- 
Jens Axboe
