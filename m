Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E46472091
	for <io-uring@vger.kernel.org>; Sat, 12 Sep 2026 12:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789217120; cv=none; b=nemzik8FNhLwAWPerwkjekU+3E8/PsgY+EAFBCxniOo5F/1jOcOCp0U7VtILwUcGbf28kdNMIWspRI7HJ+UVXsTuGYzWDK9FMr9vs03ayFgLPvE3UpGCb7V8/S32GcRgZwgiN1r1TDUbBfrd9cLMh9pSDhH1Z2BxUCI3b7KzJR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789217120; c=relaxed/simple;
	bh=p9H5fJ0qznjbd7WwkOCCZHtdV2j8uNOzcKohs1KM2HI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EM4c2MGXMaL8/AZmel0kWrTTrSiDTM/G9Cbp7cj7XowmqP6LGE3vFpCG+oEk4yjGpwrUmLgsv7iPedlWayh2Es9VgeLgDg6Ubb/3DqChTVsjj29SgJPRMGXQrrGjQuhowYq/Lt9eTHhuGwIjNKg96s5exKhvREy3pUHx0IbsXK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TYGxXM71; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TYGxXM71"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso8760125e9.2
        for <io-uring@vger.kernel.org>; Sat, 12 Sep 2026 05:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789217116; x=1789821916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DnLavuIU3PeT29b0R+tsLZa/nqbV4NGKsHKuPzpckLg=;
        b=TYGxXM71DZHjLh/Rq+9HcXxkLFjtrbsrxxrp8GJVKX9v3d8viBPMuSsfYI7H+1yUoB
         P5f5ynRhjCrlMvHrco2IhASIwqEgsmCFtyj1QgnNVCW70TjLDsN0g5/fkuqYEDyedC/7
         iEw3V3Cc7WvEYmGocV1xGhp3h85C8T1KyfgzwFDNvO3ZQgV3rxOav9QiSdA+QsJAmu8x
         VVf3ACsBz+5JazTqf5/PMzcNuiW79TUaJgSA286iuHwvwRCiHjWquG/epviTgRJA6eow
         6Y54GwKte6yQgmV7UXDZv612iCll+R0Bxs6bdsWjLM5hN7v45rjAW3kQkIysQmkhYsdE
         YUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789217116; x=1789821916;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DnLavuIU3PeT29b0R+tsLZa/nqbV4NGKsHKuPzpckLg=;
        b=r8y3IbxCVlBPR+pKlRt12o/Hm9+RE91/pLGSrr7feYLkh6Ih/MxhBaDLyOBheble5L
         YcZ0Zybij2SKA+AZz2kZQacwp7AnQ2CsuJH84e22GfJ+P3Dmsg39/oqYRc4FSmEJpAW2
         +hrOpJuLVJa8e/6wTeQqJorWEZGI5/gnUjrcUOQTjNAw3hE9iRuo+FRCcqji1jgNOXCx
         YyhIOapXKUBS8NmUGpJYwfs0MUS2a2PTuBW1M0DJNw8rFluIf/jhBbhR021/32UyGPsV
         y2kSYAs5ZzlQpr95s+oEubtyrlwLVDn3k5jXIrYDaE81z4NKWtrivudH1TciYEsrPK3K
         EM9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwZ6K9r72mbdfOkRLwJLOXc98iBUm7+7zpuZeAa6MprR92HmyPvKb7oUwMqGq5Vq54QIhARcipepQ==@vger.kernel.org
X-Gm-Message-State: AFuF++np1kYOnWsrBQW/LYloB5fmg5sFxsvYr6Y2qEWiDbdsdyp23ZpO
	XmZb1SdUeyz0n1zroMPbdJNFeIfCs8qHwXjYH5PQEsreJiV6kpE674ew
X-Gm-Gg: AYBFou27nGg5aml6A9b1rGXJWbVymr409qwBdN9AFI69VOLifwFQzQYucfNN7zZJ0me
	LRYfPFZ51lIurSYAUKf5TNe41tju0sb/OKXsKbqrKsXfh6ac3PaAzYTzLCNUX13CRWdmJHa3L4v
	pNnYEhK1VWRM1vbHOXQ0S9G8eAoK7TWF5HGRdz3UJLPr6o+sSJBd7+VJ1SyinrmxJL2dmLzvWbL
	Z3QhqJfFA/ue83qRLePFS1bP2bhVs7tIvnYtDnGTpJneBq2/WeoBMIaMOEod32okn/vhBq5IRxK
	LfWPLCHRhIko0XrIHms8vr9cRaJ7/aVGG+b0rdWGDkxdc9jgJM6Pxa6I2f4YPjFg+fbGOgoL5hU
	T4txQvT0a332GpoFVs96nGdQkBsN2zHwCzoke0z67OOLwGvahreP2gT+FjrLGGMHZZdpuawY1y/
	jOfKt9SbiKl3yC4wEkvNHh3f0Wwp78ypjf22Xy3NqMitoPhv131NEPKeb+1lhlOoq8GfvypXkil
	6raEoMOw0+Ik1iTtDxaJVDAi/MIc3c1jBOCb+8EVHkMeN7YVG356THOrZ/KPAxJF+j4iF0WXGJk
	ye8u1GRfFBb5XcCbiyJjEDzKnfkp
X-Received: by 2002:a05:600c:4693:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-49e619bec89mr188946025e9.6.1789217115992;
        Sat, 12 Sep 2026 05:45:15 -0700 (PDT)
Received: from [10.192.161.217] (82-132-213-27.dab.02.net. [82.132.213.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm226373935e9.14.2026.09.12.05.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 05:45:15 -0700 (PDT)
Message-ID: <7b126162-f412-41d8-8002-6b31d2795f51@gmail.com>
Date: Sat, 12 Sep 2026 13:45:11 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] misc: fgds: enable GPU-NVMe direct I/O via POSIX and
 io_uring
To: Li Wang <liwang@kylinos.cn>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mengmeng Zhao <zhaomengmeng@kylinos.cn>
References: <20260908131545.105987-1-liwang@kylinos.cn>
 <2026090913-landline-encroach-c544@gregkh>
 <6aed7ecf-d125-40d1-a82d-1a7f62049605@kylinos.cn>
 <2026090924-corsage-shout-833d@gregkh>
 <33c9db65-fa30-4d34-9026-98144ce1ed95@amd.com>
 <9447bb67-96e9-43b3-87c8-db231051fa2d@kylinos.cn>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <9447bb67-96e9-43b3-87c8-db231051fa2d@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/26 04:57, Li Wang wrote:
> Hi Christian,
> 
>>>>> Nor why "fgds" is the name, that's going to be hard to remember, does it
>>>>> stand for something?
>>>>>
>>>> "FGDS" stands for Fast GPUDirect Storage. GPUDirect Storage (GDS) is NVIDIA's
>>>> technology enabling direct I/O between GPU memory and files on NVMe,
>>>> widely used in LLM workloads to bypass CPU overhead.
>>>
>>> That's nvidia's specific solution, but this works on other devices,
>>> right?  Or just for that one platform?
>>
>> That was nvidia's specific and very hacky out of tree solution
> Exactly, I completely agree with your viewpoint. In fact, we previously conducted
> a deep analysis of NVIDIA's GDS implementation code, which was also one of the
> motivations for us to develop fgds.
> 
> Please allow me to introduce NVIDIA's GDS implementation briefly:
> NVIDIA introduced two kernel modules: one module called nvidia-fs, and the other module
> is a customized NVMe driver replacing the Linux kernel's default NVMe driver.
> nvidia-fs creates a device file for every NVIDIA GPU on the machine: /dev/nvidia-fs<gpu-id>.

I'm not an nvidia expert, but IIRC they switched to P2PDMA, which
is supported by the upstream nvme driver.

-- 
Pavel Begunkov

