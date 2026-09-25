Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FC6489FB0
	for <io-uring@vger.kernel.org>; Fri, 25 Sep 2026 11:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790334726; cv=none; b=RmOorCWNBGOotvFIMNCkU8oY5YUphaBP5nthFiiWeri6M/srmglthsChYJn6zsPiid4x3z7hxoj4qgeWpMj/abt4AzjFZVEGHVCNe331QPsYEdSact2FtIXHnGq8r1/0jt9hp2b81Z8Tel5NP+lNNk1aSghwPuzz41MYEcUd5Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790334726; c=relaxed/simple;
	bh=GuW7eXEh2gVczNln7jtlJt8uCjI8l0C1PzUKgYCAbxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F9n8rhx2BwAz6gqRe8AdqmJsX5uaLeQt08XyBbtBaDqp3b2Szsd+BGKW5st69Kp/dfFps7fASGD9B6bAQx0y6OKFQTzbYdeyUosJ7qcBp6jE/7LhRotAKLviTyyC9GKJxXGXVAoKPE5+cxDpLRggVg0xrCCJShpdOfEGnn8OnVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YmX9Rq0s; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YmX9Rq0s"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso10019315e9.2
        for <io-uring@vger.kernel.org>; Fri, 25 Sep 2026 04:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790334723; x=1790939523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QUYgotJhZ6LNOKd9OKnwgJyVznPrlzbQCA8QrOOaWH4=;
        b=YmX9Rq0sXPA2AUzkrD21A/2+kmiQUlAynaMsf08bZzRFzX1Bp+FV4Fs9H7rdvhqbE5
         LinO2fYd+h1FbNWPb0R0Yn9rztwgKcd9EST3I+XWfJjn+Kw7MNQj2Jv2VxbJmgPLWd1H
         5+lgwA+7wKlEi3mVK9+LkKEUzLDR6pfywrnZGYYSEdqwz4R/qMMpE1GANHsg1WrRGZA/
         fpbsNIzC/7m4/CgqWVqZdR/5YLx98R9LNZnEh0uQqpElEGR/lEstMmPH5WmBHbC20nlj
         ETlbOBZYWuM1kLnAyvwEkLUU8u7eJqitNz15nwIBet8/NlnnUjx5kmmoNJsLiJTn/roO
         kD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790334723; x=1790939523;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QUYgotJhZ6LNOKd9OKnwgJyVznPrlzbQCA8QrOOaWH4=;
        b=g2TyT/9tfNM1jF9tgKsYTKP63hxidvBqww4rJj1rrwQN53b6x0jcmwRvMs7F1d+MWb
         ktP4D3IuQiwB2ealy5aDQ+fox3+T6thMkhooDxHMUrS9ShGSFSa6cyu9Y8QLvA9r7Oj2
         HotUb2SjJYag48INAv+HAQ9YJgZn4gy0mxFYMuFA7PW08VmA41zq1B2jzFo51t0v124t
         l3SJmGt2wdybIB0P4B0Ia7zXc6066hN0OSpJ3fNyrxsGF94+AscqA+5KpIWBQOYQUamy
         Ix6dIjcrUDy8dOAFpR3zuKdFub6tSRFPY0Dl4ygm1o4iaeu5prtwvaTBw65ercmDvDv3
         IVtA==
X-Forwarded-Encrypted: i=1; AKwUvBx7hgt5OasYmtVRPcy2C/FjVDU2uzG7l71ekXJJi3tzStrmFD5r2SZsDaXX4S6teYrDzQugHZu9Uw==@vger.kernel.org
X-Gm-Message-State: AFuF++k8076HdacDR5KhvlbALbquC2vbk+Uxa5uhUo5O2inGiWYMxNSN
	Y2S2al37o1NoezV098X4hkH30WhYLmCy6P0AOVTe7SlsA20b4L/ag3zq
X-Gm-Gg: AYBFou3xE+atIhKDLtLhkjFLbwKslKF+ZMj3qGYbZF/uCCqzT8+i5TC4nmE7dEzXXgg
	m7A1jk1iT+mFBry0QQGlaBP2PxbbIbT0clfLBZJXQswFns1D7B+G9z/02It7HjbwKi7P3ZPbhjb
	5M4PgURwuVSXug96PPn7bqxkihPnsRbeKPsyEJFgRxa65ZwEXFy6i/q0RySIiOOtP2LhpvlfWQl
	haMvNr/8Y4AKiZfDF9WjhkXWa1ntpT+DP5oUniF+NzCgUwd3G1ljKM3I3r/Wh+qmwGDbhQERPty
	mf5XGT2yjhx/jPWtC6pMstj0dr6We5B2dmapxfwotzUEIXyzw2/iIbNvBHoAeTnU+dt0Lhvds8a
	YqI1JTIEUdBQI3K3wLjq7YQtqb8ITa9P5S7fr0ELTHBviUK3lseJekiRhlkyasRJmWYC8eP17EK
	mfVzO6WGuoL6uxoZcdoQ+FyL6R7pt4uPL5OcdJ6QSpv66AsKMtdm5qZP3qOlJRmUnnvtL24TCN5
	QuU8SxvQRzsuF6+qyxLKjS5uVJ7DBpovKqGDNYILB4wHkmBayvhBAPb/dAV2hnXELFc20vHk3Wb
	Rk3lMNDqPtjNEehz48PRyP5M/L7mQ6dGvBO69ijhohtoOU4i
X-Received: by 2002:a05:600c:6207:b0:49f:bd3c:bc20 with SMTP id 5b1f17b1804b1-49fe66ff476mr101883265e9.27.1790334722519;
        Fri, 25 Sep 2026 04:12:02 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff0658747sm58978745e9.1.2026.09.25.04.12.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 04:12:01 -0700 (PDT)
Message-ID: <b00ad4a2-d317-4d75-95b1-7d2195c069a9@gmail.com>
Date: Fri, 25 Sep 2026 12:11:56 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/3] net: netmem: add net_iov_area freelist
 helpers
To: Mina Almasry <almasrymina@google.com>
Cc: Stanislav Fomichev <sdf.kernel@gmail.com>, netdev@vger.kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, hawk@kernel.org,
 ilias.apalodimas@linaro.org, axboe@kernel.dk, sdf@fomichev.me,
 bobbyeshleman@meta.com, kaiyuanz@google.com, linux-kernel@vger.kernel.org,
 io-uring@vger.kernel.org
References: <20260922204348.717198-1-sdf@fomichev.me>
 <20260922204348.717198-2-sdf@fomichev.me>
 <CAHS8izPwLBCJXM_0Df8P6S-FVwAq+TaRKn3uTh1h=33Ffj8VmQ@mail.gmail.com>
 <f566591a-cef3-459f-a39e-86addb0c5d7e@gmail.com>
 <CAHS8izOwo2NZGaxtxaMcjDu1APY7ERLjsHN4B_Oucqs4jZafqw@mail.gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <CAHS8izOwo2NZGaxtxaMcjDu1APY7ERLjsHN4B_Oucqs4jZafqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/24/26 17:46, Mina Almasry wrote:
> On Thu, Sep 24, 2026 at 8:41 AM Pavel Begunkov <asml.silence@gmail.com> wrote:
>>
>> On 9/24/26 16:02, Mina Almasry wrote:
>>> On Tue, Sep 22, 2026 at 1:43 PM Stanislav Fomichev <sdf.kernel@gmail.com> wrote:
>>>>
>>>> io_uring zero-copy receive and devmem both maintain a bounded LIFO for
>>>> net_iovs in a contiguous area. Store the freelist in struct net_iov_area
>>>> and provide common push and pop helpers.
>>>>
>>>> Leave synchronization to area owners. Keep devmem's area adjacent to its
>>>
>>> This could be a follow up change, but I think synchronization should
>>> be provided by the netmem/niov infra, rather than the area owners. TBH
>>> the infra providing an unsynchronized data structure and letting the
>>> area owner use it and shoot themselves in the foot feels error prone.
>>> For now we could use a comment.
>>
>> I don't think we want it. The duplication is minor, but I'm not set
>> on the per area index array approach, and it'd make changing it
>> more difficult.
>>
> 
> What is 'it'? I'm guessing you don't want the freelist array put in
> the net_iov_area at all then? Because even that change will make
> replacing the freelist array hard to swap? Or are you objecting to
> just letting the netmem functions do the locking
I meant this consolidation / patch. Yes, it adds more friction
but I don't see much benefit. And I can guess why Stan didn't
include locking, zcrx takes it for additional sync and keeps
one lock for all areas.

-- 
Pavel Begunkov

