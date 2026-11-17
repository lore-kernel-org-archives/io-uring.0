Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883277;
	b=J3T7CqbATP0b4u5FCkpkd20v9POYEf3tixRtGvIihWxRM1MJOMx6qkq0W3WgX8izPe4S
	 40KJWW/dO/XUvem9m9BmDXibvYQg+nckJ7hJrhYpO4CcnS22T2Z6lLiiYIcyaKHx9NtOQ
	 ODTIK+pFXnQIgS5ymZQYw1kMex1VsvSm+cSjWbryenRHAVZ/TnDaZ2ZAAb5QSRHnKoYAf
	 7CU3rkPNnefW0MLERZIlc1Yhhke3Ii9UF6UHaJp+mgaJkIGPY9pKztp1eQx15Km4bwvko
	 pkiMUcYylUf+pBhJitEqBWIEea+F7sbx6FBUefgpZr/Q3WCrdbEDZSeTq0JBQd/185w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=1Q04N6U4B5Q631xjtJZ+YPrWXutbUwLW0YUT+T/yxok=;
	b=z9KPwx5eB8tXUyKv9UAaXQYS5lsRJ/q2aSNQN9ceL4kxckuPm8fIy6Jr+acL4yyK/XNQ
	 8Tmqa2p0m369XEQvyYwImQoUfxWOqwOsJjnXSFQ7tFOi/anGsjdQxbKodETQHWa1FUHHe
	 DvHgnntssR1wjrTofUy/icZxT8hCuvPpw3aMFPn+KeE4QxMiz4T9mWmjHPvZZhXAnEyrY
	 fLQ1Sp1jAli8sAhz780e9Y6tgjexkqh5J/VYlH7HDPt+16cmjUzsn1ODWrK4Bn13iEbfA
	 l4FD5SISKwhhZWBJsPjeYSjz2SzSQJdtJJNU1JmApFBx62hJMZ+0+2Rdkd+PW+lWcFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qpv7yFj3;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2389606A330
	for <io-uring@vger.kernel.org>; Tue, 17 Nov 2026 02:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2389606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qpv7yFj3
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a2761c69fbso317027c88.0
        for <io-uring@vger.kernel.org>; Mon, 16 Nov 2026 18:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794883276; x=1795488076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Q04N6U4B5Q631xjtJZ+YPrWXutbUwLW0YUT+T/yxok=;
        b=qpv7yFj3Q2nPcAN7KHsRHLBqCNYBADkrVnYKuUVtR6MFdoG3PyldCv+tn8xynudmqf
         5WBOo/d4tQR7jwng0FNFzJVW8QHMJMJEg/rXm9Rd1Z999K6acAViLSKcBHyZFcpC9T7p
         eTQg4p0CT8t0fTUgNHgSOvUC5vNrcrM9aOCWvORmSkEwHVXJGFf5NC/WJaUtesFB1RLc
         3plkN4f4XYdRCTU55lOuY0cKX6RUz85BN0bs1FoFkHNETxr8uOfqgv7uAV72v24kYZ/u
         gU3sLxI7YDGQmj0JlKG0/ralskhVX4GRtdhP+A3NFPlgFrISqqiDUZ+YmCx4TBfAKDhS
         gTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794883276; x=1795488076;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Q04N6U4B5Q631xjtJZ+YPrWXutbUwLW0YUT+T/yxok=;
        b=adHCGMISnPOWgv+B0vU8K5U/41RVTxFyQfA+/SGGRSKE9qX3ljSzmlb8JR5gjRmzVf
         1l9i+ah96OqoieQpz1+hU8/JmQRxCTVxaMAA+071GesU+wyBrzpGLIymS6Tic3ONazwa
         zwxrC4UUZPMHnDerdGvcMzIBP3Sk67eLw6GgwSe1qz1kUuF5lAnwd0+QuFsWyOyp6sEl
         scEIpyS+xRMJi+AA50nBX95/PMG4lq0lH2KUIJP/M6A9TaXNsdux9YXN9HtZVzx5n9V/
         GcDtNMvUlzFH0tjlxcU0EVtXYRXJTuLAMBYxC7iXs3R+6+Q0jEsJeEE2lMHMj5cAzRDA
         ObcA==
X-Forwarded-Encrypted: i=1; AL+hErGjmKx6ou9FiUTB3f4s5yLVENKGdoHJpH3fw45G2qIFt+VYhjPuPP1uXB/f0ZXV0SHomovh6STnfw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8EfqSAeirJCHHnqKiyoMPLpLTQvPOTiuirYG4t/KuTG1Q+xrR6
	ozEEtsUb0zaPdBOp+lPa8rDKbwhbMnEAntGQlZd5TNFYln518Gqa2ubNdmJUQTa0D15LS8uGxOy
	Uym58NVc=
X-Gm-Gg: AYBFou2nzUG4zfa3XKaTsOVG8v+dgMBxo2HIW6/nVEpDWYRcmj5jBVeQxhi3HSGdYJ0
	q8pbM+qu9N2aMaptfkDlVvbAdIvHQPNhsFGCjskGhNSINjIbeYTaag4e9X/c/Is4IrD0yvVoSXR
	iui5VBG1GuCKIqhwQU68BSQFvxrNNoA88AVTbFXVKfz2nydQA2DpNDd86yHVxJMOr147F0iIvU9
	IOPm1h2ybgJp+HhnQfIVcBtw+/XyHmMZnWBrRLz6H4XsznDQXelWjrhzcNAIbuGBs4YKBKz7h8S
	WkI6whI4/rMrEAXN9XvU5LJNNkTeR/tbtJdRWVVwbqPsWgpS41fjHzzwvoR3WH/ASLbagFUtfYh
	VP8c/OCLjaaO22QjaROAD3vxKy45NaUuiG9Rq2XMsiPuKjPZuvlEt8jfDTXeRIA+DfNPUHMvQJa
	E8DRMYn2Vzg3+CgBO3ZJIbOFPFjQtEUNVaNWMBSDL0BBp+v5lcdDrC8zR5wbyudgPtgt4M6m5LO
	0dudfWOgMcdZQidClOYAqFgk/yMokbZRgRW+z51m07SXCchJCjN7FOLKgXpytTGNQfM6Fgq6P61
	ex3821Ks33YbdyE6A0qE6QdNl2KmRZh9vkdHlhvWPcX1czijJ8qxSUWyd6bcRhp3iOmR9Jf1pC+
	6yKZ/NjXUj/CKyjQhE5DWTjJLaGzGsB5OBg==
X-Received: by 2002:a05:7022:4392:b0:144:c112:5f24 with SMTP id a92af1059eb24-1b503175a36mr18573024c88.25.1794883275826;
        Mon, 16 Nov 2026 18:41:15 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50309b27dsm35592113c88.2.2026.11.16.18.41.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 18:41:15 -0800 (PST)
Message-ID: <71233dfb-bcac-42df-afd4-45b65dabbc09@kernel.dk>
Date: Mon, 16 Nov 2026 19:41:14 -0700
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
Subject: Re: [PATCH] io_uring/timeout: don't rearm a multishot timeout on
 cancel
To: Cheng Yongkang <teel4res@gmail.com>
Cc: David Wei <davidhwei@meta.com>, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261116044519.281756-1-teel4res@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261116044519.281756-1-teel4res@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/15/26 9:45 PM, Cheng Yongkang wrote:
> io_timeout_complete() does not check tw.cancel. When it runs from
> io_cancel_local_task_work(), a multishot timeout that has not reached
> its count still posts an IORING_CQE_F_MORE completion and rearms its
> timer. With a zero interval the timer expires again right away and
> queues new task work, so the drain keeps running it until posting a
> CQE fails.
> 
> Normally the CQ fills up quickly and the request then completes. But
> if userspace moves the CQ head far ahead of the tail, for example to
> cq.tail + 0x7fffffff, posting keeps succeeding and ring teardown is
> delayed for a long time.

But why would the app do that, to shoot itself in the foot?

I think the fix is fine, but the premise of it is very odd.

-- 
Jens Axboe

