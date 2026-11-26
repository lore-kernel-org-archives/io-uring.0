Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795657738;
	b=OMm9GI9gyZE2VQeR5TNxbJq5tvsbFBei0aP/Pr/bPGexngg/aFl09t5UVZERkDP0Ejf0
	 jtuRJgxPGWHviKBTiX9SYSbKZQoqifYSRrkCjAN2E1OWC+84XOxThgqmHFfjzYknCeB/w
	 QiiQaaUOac/Z6fZUHXZ2+99Z6L7f1DhVs6l+vy947c77E4RBQ68Gd41EbmmEPsZD5rYuQ
	 aA6XYZm/0JQ39zLgi249uOT1SdxGM4En2TODjj6yzGTLrQxhMFk5R8rPNS6/8zcVB+7OU
	 VEkoxuv2CfsIfLLCvZOYeq2lSnEGblQGb9VUJvMte7gJ8h+/qo3JLvKb0H4vrRUpNDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795657738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=HJrvEI0w4/nagFajlzLVreq9xJMwT6Dei5ExGu8K1us=;
	b=nR9wh1HHIqi068sbs9eFGB6LPgs0vKQhjy4V5UpWyD77E7pt9C7Saq1W6ht5xbbdz2oz
	 +HTOzrtoXQGmIt4g57HWh440KUDB5tPvXQmY2tyH7Z43Y3eoTpYycbb/gAxBaOrbVrPBv
	 SwNFO9+v2K/+IJcGKXUFaNcXF1aUiyUpIrze7MB/n/NeGGCmMoivOmD5Asxi6VlhSJz5S
	 K+mVWA1pzClk8uamQx98F2jFSNGdl2TP50eCAlRPzSPNCiGH5k5ARaAeNRqQdypcYMNZt
	 bmzGo4QVoj9Aaqg4TKaxGCoEuDBV3oBTpsNqgFuTck7McvX4SytyZr31uPDh2BMksnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=DetbId0m;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C573E606A321
	for <io-uring@vger.kernel.org>; Thu, 26 Nov 2026 01:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C573E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=DetbId0m
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b563e32936so2386006c88.1
        for <io-uring@vger.kernel.org>; Wed, 25 Nov 2026 17:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795657735; x=1796262535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HJrvEI0w4/nagFajlzLVreq9xJMwT6Dei5ExGu8K1us=;
        b=DetbId0mZ31noCX02Hf6XnTXArek3IPwG4PAw2/ENsbzw9OCekMtR1hksjyZC46Asg
         TI5FiTXxbpmaZI6Ih9txi2Pksrhvhdr3bChuBfET+Awcx8eqAGMC1hshjjvxO3TkypTE
         jFE5+RxcZ2XwfK/NqIw24++6K3st72Ng61Y5bg2UsntjzGPiewITtHpgUuHGw4Vb6H/z
         csuc+sKylCVkrmFgrlEObPgstGi9TPpFHkIB/B4gT+V2RfiN8Zc2YXeW9l8sKD4XHjN0
         kzrMtm5r4ZGlrmyr/CdOSmiWjpQ+KKSGCbj37PEQOsJRjZc8sDctwjx5GUSkJndyNLD6
         t2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795657735; x=1796262535;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HJrvEI0w4/nagFajlzLVreq9xJMwT6Dei5ExGu8K1us=;
        b=LNS/uGvZRSrSf+p8hyny8dj4Rwg0P2wk3GZS6sLqcdo9rYxx+UT+yPIfxDcnj3rZCz
         wu68+OL6Jb3aR8aynV+j2+XToQaNlZOPomZrIV9cTERmZD8vtUYWmdL3yM1LHM/izLld
         pGgY8HnqdpYM9RqQLMojMDwOaR5HpNROA6GsEtDiq4xVf4D/XTkT5I1If99RWdB0oEOm
         R/Yhep2M/Mj3aG/W+vSIWxSZIWbNUjkSsCNMn7IpumEQqay8PpcgLwwVkL/5fIiMe+Oc
         /KgDgJREjTa0PeezWAhyMnQebWwQezJiqYXNfOulFAhrGClmpI+xtT7JG2OSNMsdsmrF
         xj+A==
X-Forwarded-Encrypted: i=1; AL+hErFMA0y5if0OCSECu1PLde70q8AKBFvpSo1IyeNVcK1hRHtI7Hm4LDnfOQVd8KLiZ2h3m4rpKjzzbA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/L8g0yCtrc9Dxz3ImiJzOvhuJliS1qF/RDp9ytYMDYBwhfD+Ws
	ivUtPYVjSz5ZJ0YYhl9+Q4mSBZhdIp0YC3GlJGo/i1BRl7Hka+bkeQGMiSUeQ5ODHow=
X-Gm-Gg: AZFdTZdSALTa/iWF8d9wKur+TRDnaU3supjGu1MUFVM2BOrQrClEh3H3VJQbN43pdtk
	PzCTLgKkrydcUMJtsiDYR3FqM9wSJW0+GsLxayBLA1ztXDWmQPL/Fi8g10ZoMlqUNWNgxeVKYXR
	hmBf5EeETEMUv4dsvzqpLLqkVdP/X2UiNblhkGyLXEuw35GpVslf2br7kgngm21vSRTJ3NlcxYa
	1lthlWEsYyjD4UzIZsLfznUfc1Q34rrw3qVcwG3z9Lz92cPR/muWQXAlspSwP/USuIcVAxDGsVU
	kQSSvPpU6i0HTa2OlAQqIGqaUUA4o5fKt8POn87sTBAUZsluQJ/iq4TO3nnaA4szX+MbZmeAEkd
	m4UAB/3BuqlZXUMIV/XKja+qB5qgNZU7RFMf9CDnKwK6IIgcl+xwKU6n05h9W9kfwbBME9AsNZb
	mqs1545l2mzwWg/qoEG7FJddOADM7TBPQu8cTZrLMLf2CGCdJmSclCRHesq09VRxSmXncImJwV8
	EoafIRNfteUXucl/tOgJKYmxyESefEbOK2cNJSpiq6L/XLaMGvbqLyVBKVt32I8sJJ/bdXMnDEQ
	hTsHqXVZ/xvUcltaJ854VAUbGdGEbcK3Kyt7nma+aLMERd3bP3WX1QIcZgSolhnw8yziqtVScel
	dVS/xIve/2HQnTmxYBRc3PL1NmPDBI4EO6tllX+Yjttymdi3/0g==
X-Received: by 2002:a05:701b:4583:10b0:1b5:5915:bb34 with SMTP id a92af1059eb24-1b55915bd9amr17158608c88.4.1795657735413;
        Wed, 25 Nov 2026 17:48:55 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm60595886eec.22.2026.11.25.17.48.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 17:48:54 -0800 (PST)
Message-ID: <6bddb1d9-fc18-4308-8d64-73705254733b@kernel.dk>
Date: Wed, 25 Nov 2026 18:48:54 -0700
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
Subject: Re: [PATCH] io_uring/openclose: allow an empty path with O_EMPTYPATH
To: Jori Koolstra <jkoolstra@xs4all.nl>, Hengyu Liang <hengyul@cs.unc.edu>
Cc: Christian Brauner <brauner@kernel.org>, Aleksa Sarai <cyphar@cyphar.com>,
 io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261125180817.3682397-1-hengyul@cs.unc.edu>
 <170898867.2781789.1795642036410@kpc.webmail.kpnmail.nl>
 <86fea5ad-43d5-46d6-b2e5-f93b8a6afb8f@kernel.dk>
 <805466896.2784291.1795644146928@kpc.webmail.kpnmail.nl>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <805466896.2784291.1795644146928@kpc.webmail.kpnmail.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/25/26 3:02 PM, Jori Koolstra wrote:
> 
>> Op 25-11-2026 22:47 CET schreef Jens Axboe <axboe@kernel.dk>:
>>
>>>
>>> Reviewed-by: Jori Koolstra (CIQ) <jkoolstra@xs4all.nl>
>>>
>>> @Jens - You've pulled this already, I don't know if io_uring appreciates reviews
>>> after pull. Let me know if not.
>>
>> Always appreciate that, the link is in the commit too so it'll be
>> discoverable after the fact as well.
>>
> 
> All right, good to know ;) .
> 
> I know Christian does some magic with pulling in the tags even much later,
> but I don't know what he does exactly.

There's no magic, if it's in the commit message after the fact, it's
been rebased.

-- 
Jens Axboe

