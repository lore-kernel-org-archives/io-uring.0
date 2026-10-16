Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1687951B193
	for <io-uring@vger.kernel.org>; Fri, 16 Oct 2026 16:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169273; cv=none; b=bZ8U+V3NPa4IG435X7k9TKFD7kcnkgnbekOSY28KV7JUrp8YKBVHa7sRqeGTWsL7WiFVuMP3k1D95knkxhvYZ3axUJRGIuzuGqobC7gTvqHXk67wr8YSLAhy3BVen2kQ/X92BWiRcygIZyf0ZK2GEr3wbj9oG6CL0YJpevagTSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169273; c=relaxed/simple;
	bh=h383LcJm0p6abLqQbalsy+F32SK3GLnP+6pu4dSKacg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dfXxBKckYuy3Bi852D4Ixr6lJx/ockuxa72Rb3ZQ9+Ixi26lIk/G/2XWrGQYDnj1EJ9owGT7rpSlm/elCzwvQGE30y1solLM0xEpLtugfFYa99SOtW0vUr0BWYDjZHaoui8z26SuhTskOBrZHmqhGVv2g4AypiNdmysdCpcZBWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V407meVg; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V407meVg"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48de6a62a4cso28617f8f.2
        for <io-uring@vger.kernel.org>; Fri, 16 Oct 2026 09:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792169269; x=1792774069; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BfYi36uChMh6atP01V6qBXOnLQlnTKtEKxoYMy5vbxo=;
        b=V407meVg/UejOW3hyeYEx0RH8V/g63az4IkFQml5ggrUwj/K0ydCcuKs+1MNONOmHr
         xT/ApSAoneJ/qr/GgWHJ41XdtpK19dUAbR1Totm/GUr1QTCveg+SKqf6vgnzZWxr0F5K
         UC7jhRnZytUhzKydJd4XbUtmxQKEcCQAsKB+4RQoMR0KLXqPzJgosYPD88Bh2IqOXj8v
         KKmwybqqgmnCRd62fdKdULzzjHPYhZQkGNas07zhEwakBTjP6XzFvh/sw3rXy2hh9m/E
         6LAqTzb6QtGXExSxVH13nyX5nKQcbGXDsnBGdMKMCWbB4wBSDpzvSNOQrLIIMCooVYyw
         SXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792169269; x=1792774069;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BfYi36uChMh6atP01V6qBXOnLQlnTKtEKxoYMy5vbxo=;
        b=VXAWl97SvWcGKqzxYYWZqLkD3oS4TaZczPAbImnQkudCMBD//gLtz0vkY94wzb1MPD
         bh3BMDquPoq+PZR9+k8Hb5IOy8PzHNU5CA/X6DzeZvXfcyv76+eyFQPle+Kdv9UmdzAL
         XknjAnxumb03T1dHXrQNJHyX53j9Kp+rpUyqICcaj/hHLD54wSkFqlQF0PjLn8Y8knoK
         qUs+FYzhirzGbIKieY+mIxFX6Sc6kTLv+zD/ln6hf8NitzEmdxE6bcCD+1XQEdYnZZEf
         Y9GHljFvkQn0XCKms7DB8yViQkdlTRIZ7gb+kExrpcLcdqa1mvHS3dLYI6tokIXSa9D2
         cfiQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNMjZVUO80G1w4L1b4IK3/XZKaUJ6NjKqSNTRZYTIZD58djHk/K9topYGTrN+iEOJSWaK3AdIFgw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLNytHV2Fr8fKcfOgTIZzQ3puvSe+gW7HNMUkeqp6efDWtStU7h
	uS9pgZoLKsbSn0c86O6F93yJo/lR+Idxeg27K24feTkCCP1ly8CHamORyDWL5A==
X-Gm-Gg: AYBFou1NXchbOZenNEfw9mZJmbEtF/d/WwAuJ4BAmfjT5yFCZ673uShScnsUjQJx/oX
	ThQfCMdWWUDM9d08FaWpfv6uB0MRd3wrLsIf14dLpjBtEpJnd81DCmu4ZYBr7MJ/RV1UsjK8OVF
	YfGi7B/FmVrALLwLe4rYmhR8ZPkRRA4OYCRkzP5II/bEY5cAD0BLxVqmclgGPJiOTGYDptZG6Tc
	i440TwQFvk4BCeddnoTzSvFqQmfHw5Pk0N2YqomLksXdwuneFGZZRY0LFXPl3om7o5t0rLMCjVv
	VoQW3iEOgaa6XKQWpKWfjmGk34VIuZ/TntrdybHarWWgcoFgkJs8cCZEeDQA7r8UNDpEfk0+zqH
	q82bk8a3zifCraBG7SxJY6+njL1GdtrB2DPx3Jj2KuurEO80P+FviyVb3lJPkO5P9j4315gaYiS
	eKpaez4dqagxfHWgJ36BKSz/PbBTVtm2ZZ4Wq/l5piBwIcv7651y1i83YHwnnnkovd1A42EUdiG
	LmJNNcJH/zub7BRqUTeRrN9EJtzvKFt1H/DsR4JQumtkTRdxRuUk/2iZbvxTBbdr1r/jesMRjvK
	lFcz1FFipcZreIZKBhfQjjh1U9feTcS/5V09nCN/MGKIxFCx
X-Received: by 2002:a05:6000:4694:b0:48c:414f:cc12 with SMTP id ffacd0b85a97d-48e07f9c387mr207656f8f.40.1792169269171;
        Fri, 16 Oct 2026 09:47:49 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471b06sm6973167f8f.5.2026.10.16.09.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 09:47:48 -0700 (PDT)
Message-ID: <059a4998-cbec-4727-8a22-21aa0f3e601d@gmail.com>
Date: Fri, 16 Oct 2026 17:47:46 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH liburing] examples/zcrx: don't forget to sync dmabuf
To: Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org
References: <73b2654e41519acb2ec310ba1d6dc99cbafcbdfd.1792167723.git.asml.silence@gmail.com>
 <9d696969-ecca-413c-b96f-8fae5bb469a4@kernel.dk>
 <9c7dfccd-c1f1-4719-8731-34a8d6c8ade3@gmail.com>
 <f4a6b4f9-d3fc-4f36-8c85-ca99ae2ed0d8@kernel.dk>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <f4a6b4f9-d3fc-4f36-8c85-ca99ae2ed0d8@kernel.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/26 17:38, Jens Axboe wrote:
> On 10/16/26 10:36 AM, Pavel Begunkov wrote:
>> On 10/16/26 17:29, Jens Axboe wrote:
>>> On 10/16/26 10:25 AM, Pavel Begunkov wrote:
>>>> dma-bufs are not always coherent and we need to sync it before
>>>> accessing. Use proper dma-buf API for that.
>>>
>>> Can we get a Fixes tag for this please? Other fixes from today
>>> lacked that as well, please always add fixes tags.
>>
>> There was no "fixes" today.
> 
> Sure let's argue that, I merged 4 fixes from you this morning. None of
> them had Fixes tags.

There is nothing to argue about, I doubt anyone would call a
tabulation change or adding a kerneldoc "a fix".

>> liburing fixes tags either, but if you want to put one:
>>
>> Fixes: 93d3a7a70b4a6 ("examples/zcrx: udmabuf backed areas")
> 
> Because it's always nice to have the reference, even if there are
> no stable trees or anything like that on the liburing side.

Sure

-- 
Pavel Begunkov

