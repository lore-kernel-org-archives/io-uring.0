Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794009256;
	b=0ms798gOLmVDRbZozGTilC0O8vDzRrNn8KAVbzC7yi6PErHPLmbVrUSvqiVBhAHduebN
	 wGSaBncNCMVMyNoSckcR18K3yc5FlPOrdDBOhpp07HQAiFkeOtYFJfoXZEBGS0lbk043v
	 FM/Rmce/ujz2xBe8k7rFU6ts4v47sLiqnykpJeue7JIVEu6qhB66Z4QW87++eZf2OXfPg
	 quQWVbrVBxJVzY8awvCIb7QCvEhffqNvqP9PZpJj/VF9sRvbtpovZKHDDDGoTXaHBe07F
	 NqOI3ISe8JbqXp576BjPKnnU05vNBHijg4DlTiOlN9MVfYVaXKR648+UFCIKmdpgqWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794009256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=x9WDU8CL2gk2u/bdTFTNtq6JzJE0d2ITEz4eEjmLeco=;
	b=hs8QerJgqN1C7JcM5Kalxks96MFbvm6fwcKkM2AU62UKEmMd695w2YdyIrPOhX2j4fJD
	 N63wQKXCA1rT+XLeN3QKHQlSyMlc4mgiLmmqI4r8uC4vuQJLyD3a4p1JFokHnUp4l+/ZF
	 SyHl4AJ+6HkOaRzikggdO7YyuM0ej3DmqoZLLT14vSOf+FtTOCvx3ODtYabxP7L9Fo4Oy
	 UPQxMFHUmsTSHelbF54jEwWDWYKgtbyg+kgA62Leqx7Nq7ByoDSrGhoMJYdMNZ1LFbCZc
	 5Yclvg5Jhy/PqfzQ7DPwl/I2N5BmxydLGbrHkdB8EJpVNu9u9wfCU6O+cqJIGpWo2+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=q3TGqw2A;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA53606A326
	for <io-uring@vger.kernel.org>; Fri,  6 Nov 2026 23:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EA53606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=q3TGqw2A
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so1844601eec.0
        for <io-uring@vger.kernel.org>; Fri, 06 Nov 2026 15:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794009254; x=1794614054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x9WDU8CL2gk2u/bdTFTNtq6JzJE0d2ITEz4eEjmLeco=;
        b=q3TGqw2AwyyOKv+yKoBFpkyYaeFPA+tg8ZXkLhi6eRlK9Jmgh4nkHXAAG2UfH9THvB
         r00+CNBeEBi4zfGU2vKObpcyX96J5ODfDy88357wqvtFO0i4zFVQBMFrr/4BgpA7Iu1j
         cDL3UYsbYGiwqEQJujwUCcbDI7mpdxgazaIqARuIzI0J/9Z1fCye2wLLlLCE5PPhfRln
         rlSKHffocgOCcdK7Q/urtT6vnfg6xNqe4RCF4i3TYTA/I31XwfgZX4YcnAWrjK4uhJRj
         CEoI+3JGBuJwEe/xOTFg30yz5pabD1rBNeva9SYS7boLiDwbZnUGnrDGpseywOCf11hd
         YmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794009254; x=1794614054;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x9WDU8CL2gk2u/bdTFTNtq6JzJE0d2ITEz4eEjmLeco=;
        b=DMyIWiFWq1oYgkhchfmTUSP4T7DCLJsKYOTqGvs2NM+kdMLl1YbwqkMbFNEY6eF9LF
         5Pksmm64hsyxoC/7EVPgiJsUh92XmW8K+wCi0wITKCgDyIrri8ApTwCZAaFCZPgXg7jM
         AzCDOSOGO1tcF0osra9KNvkkTWYRFNrheSF7DpTs7fRulxDgUgkWsvnbIogBFQ/Sbx1N
         6MoyDVRK714/bPXkBkYIWN5wZkl2DzhcGEoiJFgJwc4S9yCl3Us/UJ+ytTSvY5JuFhrN
         AUJKARx5Gb/8xL2jnCYptrxLzYUeGHIvKljORjGjoCrzHelgQ2V04xrHAfO2KIF/SoEa
         cjdg==
X-Gm-Message-State: APuU4Z87T+Qp2edr7Do8f+hTguPjl9eq2NduHF/crHgIAgLEwXPGBswL
	SgYNEPpTmTaM+96/+VDMCarAP4QwGxNqjmTTK555HuINfede0TtN2j6eKw/lXGe/4P/MkUj0IVR
	7yGWhXpQ=
X-Gm-Gg: AYBFou3fFI0O+kxtXg/FVXUptS1JUH/z9LqSo5uh2yKsAVCaAnFtCvJ1Loq7JK1D3oD
	afyimfppdHAZV1Qp8RmQ8aMR7iYlfQzB0T2B+Kw6/8yeUesutp9TxKw+zo5HYpxTuC0IsFlxfoE
	cD18Q7j7FVm4JTe+fSTwqqrUgdmt5ilushaD9Y5kVM4E7EhoVSxu9NmJ0A5AdvuC3WKdGt6OX82
	5Cm+aR02zo30SdrfhKny1a5Tb/EuVv3Bbf4Z6/c30fbJQiP24Kjw6SVkZaxyoHre9+NeUmHY3C1
	HWSu58QG5x+zbgtYvXY+HvApLfaU/XtVyfvUBuNre19iE1+kvHjR4NO8U0jwtB/6WR4Loe8k56r
	aRv7fVO5Mx+AV5Xc8gXTYjrnjUmMTALx+VIwx72/wyj2Yz2yLeSf2EVIorV7rRB8x73Jp72ne+A
	WXPolae1+WuaLghlI2U4Bk7Oy7XhaeMy07zoR+I3oCAWR8rlDVihRw/JB/fyjZu0Z+SCljA9xQH
	RXxNdM1t5x36yvIocS/EsCDTaT8gGTQgSTMszNvmf00nNoRBDU72f2EMsZmMDVb7YEcx5ZnCk0B
	fhMy8+H/RnCcwlnT30GmvM/la8V5dkZGWr4mnSxNGNcKBpaaQVXsF4Hu1YwVGw6E96qldtCYpHP
	Z70mFELNGvoc=
X-Received: by 2002:a05:7300:f78b:b0:35e:da0a:75b0 with SMTP id 5a478bee46e88-36f7632448amr5496364eec.25.1794009253887;
        Fri, 06 Nov 2026 15:54:13 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922b205sm9892386eec.11.2026.11.06.15.54.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 15:54:13 -0800 (PST)
Message-ID: <cedaa253-48b6-46da-a142-c1d4fc3f6f29@kernel.dk>
Date: Fri, 6 Nov 2026 16:54:12 -0700
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
Subject: Re: io_uring: SENDMSG/WRITEV return -EAGAIN on O_NONBLOCK socket
 after peer half-close
To: =?UTF-8?B?THVrw6HFoSBMYWxpbnNrw70=?= <lukas@lalinsky.com>
Cc: io-uring@vger.kernel.org
References: <a5589b66-9a20-4b1c-a0f1-1b5b31af3667@app.fastmail.com>
 <b06ee030-51b0-433b-9988-148615e35ad1@kernel.dk>
 <6fdd17d9-0ab9-45ac-b45f-fccf085372a8@app.fastmail.com>
 <5475728c-6cd9-4d61-bcee-5c8a42f1951d@app.fastmail.com>
 <3face247-a7b6-4f87-9863-5ad40cc272a0@kernel.dk>
 <7526dc5c-fbc1-4b26-96a1-f416d5bb4106@app.fastmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <7526dc5c-fbc1-4b26-96a1-f416d5bb4106@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/6/26 5:04 AM, Lukáš Lalinský wrote:
> On Tue, Nov 3, 2026, at 5:00 PM, Jens Axboe wrote:
>> Can you try with this on top?
> 
> Hi Jens,
> 
> I tested the three patches together on current master. Everything I
> know of is fixed:
> 
> - After the peer's half-close, a waiting SEND, SENDMSG or WRITEV keeps
>   waiting and completes normally once the peer reads, with or without
>   O_NONBLOCK.
> - The same now holds when the peer has sent urgent data that the
>   application doesn't read.
> - A RECVMSG that is woken repeatedly without data no longer completes
>   with -EAGAIN.
> - The cancel now finds the send, both after a half-close and with
>   unread urgent data, and the send completes with -ECANCELED.
> 
> Our runtime's test suite also passes on the patched kernel.

Great! Patch 1+3 are in Linus's tree now, and I sent out the net
patch as well to netdev just now. Hopefully all will land in
7.4, and I will ensure they all go to stable as well.

-- 
Jens Axboe

