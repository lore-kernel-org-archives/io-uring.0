Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793929116;
	b=cJ4qE0OnLUU8gss1wtLZn2JPdkolm3GBeMBOjYnm0MdD50k4ZMd23dn/FGlUsJIrlwIN
	 m6/9w69H15QlLg63f6YrZ5mCRtHtSVvDT3wX+zB3lLY2bC4Pv1t683aRGcBANbrmJu+Ik
	 io8/jqxvTstuPQE10d4T7kXvXnKtjgRMIEPDOdTR4m7H5zXeQOoFXycPlnuTcKcDPEDRU
	 dZSCOJN7apaUQ+bjXMeZ0y2e0KxzHZBv7dTS+kgnXk8cNtCKsNY3idSaIlx1wPHkTE8cl
	 vVz6ukceF7B3fapcEFC5sn5/1qRQPUMz/NCghBCl4eGFynSZEJypSLwQch2A5Xoh/8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793929116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=0tjyMJZVm7gO71NrNJnNmzg/9maXQ17zH1d3OcpDIbM=;
	b=OK6c4lSt/5UjBjVFlnmZ8DUVmkFI3lhTGHSGAIlg+AUajk22wRBGY9dqEFdlm5RNANID
	 MTRTvv+4zUTuJLSZAeK4Tk0RxXuXZGsJg4Vf6bQZJOQcIbtzVLn8M3fCb+aF6Fzr7DyzU
	 BX8o1zRJKjT3yG4qcZvUyRes+7NFyxcQSrfSpN+EloNVan6MAavukyLmtgxEQ5t7u58KJ
	 w4tCzwIOniAvIg8XdSqbRndO97Y3EJX8nkjGtpw3LPehjVdNXQ1v5Smr2YKXcVD0rInQG
	 Z1EgCUmnATNgZlLQoBkkZ66XoDZ6n/WlW6eVAdc5hSZHPF1Fwcxck4brzngfOx2zxvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=keith.pro;
	spf=none smtp.mailfrom=keith.pro;
	dkim=pass header.d=keith-pro.20260707.gappssmtp.com header.i=@keith-pro.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fHU4MizP;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3040606A31B
	for <io-uring@vger.kernel.org>; Fri,  6 Nov 2026 01:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3040606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=keith.pro
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=keith.pro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=keith-pro.20260707.gappssmtp.com header.i=@keith-pro.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fHU4MizP
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b0960fdde9so76391a91.0
        for <io-uring@vger.kernel.org>; Thu, 05 Nov 2026 17:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=keith-pro.20260707.gappssmtp.com; s=20260707; t=1793929115; x=1794533915; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0tjyMJZVm7gO71NrNJnNmzg/9maXQ17zH1d3OcpDIbM=;
        b=fHU4MizPakYTGEMGmk3RiUt3VL1UnWd6GHGoPyLsku8eEmmc0YVHmf73o13ONBEAR7
         EYWBkYFH1P2NtcU3OSVclAnlAlL/v5VB/Do06jvmhuCNjjvpBvUFQ8WnlkW2/V07Fs+e
         Ax2db3z+fjyNUu392EsguYhdR30f1ioV0pA+0KLZvbjoHpKwQHW6eiQxCCS8+vx3qf9F
         V8zDk4xnUxaOCxnumgue3pDH62pAsp8OHvpBL6YfngXC8/tb0sEIxz0So8k8239NhuMD
         3ffhmfnWw/9osBB2cN9SYJb9lJHsBDMkhCAmBX5U4APrDUABpCIl3W3CqwsmJFZBQ1WI
         Sadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793929115; x=1794533915;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0tjyMJZVm7gO71NrNJnNmzg/9maXQ17zH1d3OcpDIbM=;
        b=ztZH1fDrPoaXuGWrLbQxqtbqvfcgxSklUayul0H9bOroHWAHRu1VpgtCFapyGbyH3N
         hMJxmw1CUnfnpcgCcIGEzXukwpt5nOE3UQD4wC/wM+a6jK56LlrDr9ovux4dNWt4B66T
         +P1PyiRclEwaMvB2UBfjpVaLUf1EYLQH7BSpbWFHWM11bmqTpaCRUlKLYfTtfGiBV0YC
         CzMg57eZHlehQKAqJXB0mmK39VRS3hpQMCgFgEb7iKI+VxxcrLyfdL8PcungB/r2GPf2
         cynoD7IzuJpBEwD2lgmYHQzDY8bqczzT9tOF1oDjtNATMz9/vwQNhE1MvH7qIUmU/uxy
         ogmg==
X-Forwarded-Encrypted: i=1; AL+hErHMFebhndqpezbDx+PFwpRAOYX57N1n/38lZRq9w5nGy4xJCjVE7z/iW3+SnGB7TQ0VsXSUVMUPIw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9f9GFtccGeieFJeVG+06qQW66J87vrRimRg6m35id+p5JXCZIR
	SMuTafFzo20X5ZeujT6Ly/4pkSv/Krc22rDOcLD5BxUjn6sP4n7qJWTTCnm1dvthMAb6tlv6Zbg
	hu/7Y
X-Gm-Gg: AYBFou17abyeJx4xbmaxNafddTGzDfmxdlFbNVXkdep4NHDvEm5toajagEVtbToFXp1
	W7c/GJ8EOLeBqFUJoksKsNjw8uxKSdhlzViMT5T2e+Pv/wzDEYAxFpB7yLWwXhlGbaA76uLq1he
	InAzXkULAbpkJdwo9ngBzuoek83EZW29lBljESJu5fVTTnInOD9S6ab5MorWKZB/tdVaHW80Ijf
	WjnKIwKrfFz5NSVjo8KNDfKQ3tLYtHNU1uKHu7NmKzRr7fBQs8nnB16UQbRjXQkpZF1lxd8f/po
	OTeY+mylUIwuWFCBO/pPAPvp6O87JoaOHdgnfzC8Uu13GrjzZqEXQnMrzEVKertre7XavB7ur6I
	aS23/HYGAf+jhkBeoXmcPihArsAEsiAzPUXwNBcV0mVPzH8nhjtb5rVXRYigIKK6xR5vubd5rl0
	NheQD4ll/KSB9O7m0JwD+OK/IikcSnrxsmK7vuUCGpgxyLHCuebdv1k5AfO3CErLoS2BHh7mcDL
	djfZE+z95FF4zwmLc4fab1pvvFmg98NbyeptyGKvw/mHWCXAV54b8Fe8Uv9rR6hdF37ltYU4+7B
	tqrAyLV+dEHIZinJsZqy4TyELEAyVznHZIv9jXTRMPBmBXM40lmlvzzop441p8ueWqC1LGbXero
	EtyXHrAAmBAIWjoKosvOS9DV9lbcvpO9OPbSYSgq+jtHVgp9e/53WLaSxPFlGfxpX4kxggqqzyl
	yIoPlVnA==
X-Received: by 2002:a17:90b:5107:b0:3ad:544f:81e9 with SMTP id 98e67ed59e1d1-3b0db6dfb72mr766770a91.15.1793929114895;
        Thu, 05 Nov 2026 17:38:34 -0800 (PST)
Received: from [10.0.0.24] ([50.37.101.51])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b328a04asm5568287a91.14.2026.11.05.17.38.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 17:38:34 -0800 (PST)
Message-ID: <5858e35c-ea6e-4957-8476-e8171858af23@keith.pro>
Date: Thu, 5 Nov 2026 17:38:33 -0800
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
Subject: Re: Best way to continually discard incoming socket data
To: "robert.j.graham" <robert.j.graham@protonmail.com>,
 "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>
References: <FepzOp21D3FNjLor4XObZ0-0m2tiUlNcI99eIpTZsRAfLgPW0FRyrDTRAC2_JamKECcJi8NFxbCKl-VXixV7vsPZccaZw27VbYgun-EKEQ4=@protonmail.com>
Content-Language: en-US
From: Keith <admin@keith.pro>
In-Reply-To: <FepzOp21D3FNjLor4XObZ0-0m2tiUlNcI99eIpTZsRAfLgPW0FRyrDTRAC2_JamKECcJi8NFxbCKl-VXixV7vsPZccaZw27VbYgun-EKEQ4=@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Did you ever find a workable solution for this? Honestly, the a socket 
option like you suggest SO_RCVDISCARD would be great.

Thanks,

Keith

On 6/17/21 3:38 AM, robert.j.graham wrote:
> I wish to be able to discard all incoming data on a socket for some period as efficiently as possible, while still being able to send data on the socket. I think conceptually what I would want is a new socket flag, say, SO_RCVDISCARD, that would just as early as possible in the network stack discard any incoming data after enabled (and not show read readiness on epoll, etc). What I want to avoid is bouncing back and forth from kernel to userland just to discard the data, even if we can avoid the actual data copying the systems calls to continually be notified and instruct the kernel to discard don't make sense.
> 
> I've been trying to understand what might be the best way to achieve something similar in modern Linux. Would it be something like submitting a bunch (chain?) of recv()s with MSG_TRUNC on an io_uring, or some sort of splice(), IORING_OP_SPLICE, etc. There are a lot of different facilities available and it seems like a pretty straightforward task, so I'm sure there must be a fairly simple and efficient way, it's just not immediately clear to me what the best approach might be.
> 
> Thanks!

