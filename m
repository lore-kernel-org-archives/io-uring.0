Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6B14A387D
	for <io-uring@vger.kernel.org>; Thu, 24 Sep 2026 15:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790264490; cv=none; b=N0kcewEuDWMo/PLNFsfqLOvw2N9OvBeozH+J0wrWG9EL4lPuujXvsXTVa5qms63y/vDUFaABFMfDWXFqbvsZMAzlnOGRb2LqJUqPFP8u8CWcduZTnUapC1syWLrDATqx9+Q5AW+InVKurtV/ju+aBPatRmRjYqq4fYldnKR9AZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790264490; c=relaxed/simple;
	bh=RHgNRSvOZ3tfsNjW9H3nkua9GfCHF6/OUsrBr3E6fUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LECOlruafK6FccpxrOVS0vqwOwcXP/VLTUPao6xEODgKLEujuT0gOK+BVX3vfZEMJkHu90tLEQ4FB5LVfqU6H87xh7lwaTK8EAFGzU9lre8Zii7HhOXblnjH211UMgosgib5jlO1a3Cjkgqnk85ycWAere8gX6Fblh6e6ntQBXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PB9+c90h; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PB9+c90h"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so12961135e9.1
        for <io-uring@vger.kernel.org>; Thu, 24 Sep 2026 08:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790264482; x=1790869282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gyXDYntwE85ynqtUchJX/U4vPUnBlAqyn2V6U1Pm/s0=;
        b=PB9+c90h4SjieXC5s/zNQoFveT1BgGn+f1+ocj8JPTuqTByrKGFZNeGgB0FEZL7Oer
         Y2u/TPALzMztfPtg65PZhoJ/U/LC5rA8VAb1OpAeSIdKQ/DkaginNirdyBaQoFAX5MsN
         M0KGJlfkOuBw/tTvD6Sv3DHm6qkDEW24CVyyqCpj7ZpJ35QnsZezmI4YoFKqx5xlCF9o
         w4lAHLXucX5rLe9AHD7CrYwAaD4Kz/lsQvngw2R5fx35BDS2iW/oHbgS46OhcLfluwH7
         q15xHnXAoWzQyXm9qjQQmmiUNxT3JUhHtLblW2/tSFx4rZDxbfrCD04Y4heLosquGoTf
         +o+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790264482; x=1790869282;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gyXDYntwE85ynqtUchJX/U4vPUnBlAqyn2V6U1Pm/s0=;
        b=nWthnQ4qFmJ5i66JNTPiMISKMTFCkK9fJNc84v2K4SqQTWglP3X9bnA34kBxvkfPlQ
         QyZdDdgl27pBv3vIFxnrvbNefiALMogZKd4xvmN+emQql864Se677jJt+6O61NlT7e4a
         NcAgb/hamPvEfaaEk1XWC7E+NWrI0UwY0rcAHxV8mVdAUCIZEYl5NPbRA40zvMCtPXT1
         7Sc6PtkxDbXfCcPN1j0rxOd1QdLb4PIaetYNgmZYSqBl/aLxapo+arHlAkyt8bmaSF/u
         9K1yuoo2nh92+r22GhPZG4IjOcARhcS5j9e0pxhTs7b3RKDJBYns5aq6F57jwA19uiLq
         nsdA==
X-Forwarded-Encrypted: i=1; AKwUvBwWavfnKVF1QFA7gnx55VAYcCvEeDfc8mLl2oVVH2kohl86OwffC7Ob3Af+gvDwJsK1D0JjLBfQCQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kj15ihR2jghyt465kZy18OuKHJiYToKYqXsiLgP/su82C/QVkB
	2nTspLHPP/GdTIYC3KX4z5zGBv/qH9jxsCtDte1ANo43+mTf2PANzIEG
X-Gm-Gg: AYBFou3iK3TGj27eCzqJ8h1uGFi9lgSmNwDYT0k/BOTYRcO6Ms8FbQsf7E9EIei1RCr
	csOMjQugdYLrj7mhNE6nv9UBmbcPJZfE/gkEv9emzDowSuZ/hB1mcQMJuupu9vEF9GP9r7kRXPa
	Vh1SH6EAYbXrqu/+QxxPP3526PmVGLMh0pOmLtWtifU6O8E4DNHyEGo1+azH/0lEnhBFb9Ucii8
	AXPWrkEvEoHuDSkmNYjrO+XHYBiNEA7oRVTCVXx3aJESgA9xbPxDwsUiXwo8GeFIi+yXRqbAsm4
	dMcGpP3EFQpfMsF57tr53O+VvzQa6UXkwMYnAUiUxmh/hNZPnA2Kq+NEPZeszMyR4ljnnn+KY/t
	tGjSs7PlmGshzZ0WP+6rF5FqBhsRKtkeczoqmsAKk+Y3ifdgJBuHoG/fYIT36UaxCDLhXh/tf2Z
	Y13qpYMTB7UIuu04l/nt6VMY993EXnYh9eQBLUFGzFB/kVVi4Xq/YSTaETjsWaub8NPLnTZohHz
	dlTF5FrY1Hnq4DiWwZjqu3wG4Ess21CEBx00kogbj7iOSPVnmpQZLXnG4lmKFL8tk8BwIwVNnKB
	GGcxuCG/KGeQC1OPlvCOrsaNpVJnV0FVbHlNop9rpcVw86uL
X-Received: by 2002:a05:600c:8719:b0:49e:6c11:c4fc with SMTP id 5b1f17b1804b1-49fe66c8a5amr52893095e9.7.1790264481754;
        Thu, 24 Sep 2026 08:41:21 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5debbf4sm90846945e9.9.2026.09.24.08.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 08:41:20 -0700 (PDT)
Message-ID: <f566591a-cef3-459f-a39e-86addb0c5d7e@gmail.com>
Date: Thu, 24 Sep 2026 16:41:17 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/3] net: netmem: add net_iov_area freelist
 helpers
To: Mina Almasry <almasrymina@google.com>,
 Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, hawk@kernel.org,
 ilias.apalodimas@linaro.org, axboe@kernel.dk, sdf@fomichev.me,
 bobbyeshleman@meta.com, kaiyuanz@google.com, linux-kernel@vger.kernel.org,
 io-uring@vger.kernel.org
References: <20260922204348.717198-1-sdf@fomichev.me>
 <20260922204348.717198-2-sdf@fomichev.me>
 <CAHS8izPwLBCJXM_0Df8P6S-FVwAq+TaRKn3uTh1h=33Ffj8VmQ@mail.gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <CAHS8izPwLBCJXM_0Df8P6S-FVwAq+TaRKn3uTh1h=33Ffj8VmQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/24/26 16:02, Mina Almasry wrote:
> On Tue, Sep 22, 2026 at 1:43 PM Stanislav Fomichev <sdf.kernel@gmail.com> wrote:
>>
>> io_uring zero-copy receive and devmem both maintain a bounded LIFO for
>> net_iovs in a contiguous area. Store the freelist in struct net_iov_area
>> and provide common push and pop helpers.
>>
>> Leave synchronization to area owners. Keep devmem's area adjacent to its
> 
> This could be a follow up change, but I think synchronization should
> be provided by the netmem/niov infra, rather than the area owners. TBH
> the infra providing an unsynchronized data structure and letting the
> area owner use it and shoot themselves in the foot feels error prone.
> For now we could use a comment.

I don't think we want it. The duplication is minor, but I'm not set
on the per area index array approach, and it'd make changing it
more difficult.

> I also think we should not provide _push and_pop functions, rather we
> should provide _push_bulk() and _pop_bulk(), and the caller can decide
> to only push and pop 1 at a time if they need to. The reason is that
> in allocation paths, we almost always want to alloc in bulk. If the
> infra had the lock it could lock once and alloc a bulk.
-- 
Pavel Begunkov

