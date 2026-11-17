Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919556;
	b=SG/58MQQufonW0voYe0G+zREnoLFY3lM3noy/Rl6xVIsA54hMST/hdZ+tIKK9YxulX3u
	 bEI1Sp+6M57tDCYGs6S31g3OugS2m78azJNG/OfKz1NlEB4OIzt+rKKINpkRiViKXKjBX
	 29Rg7cdJRMibWlexLyqkhPDnzRP1S8kaSrM6sBoiLi6Pw+uhbhN3BRK6PQiR3/Bp2G4P4
	 l1Aof2iqEs83J8UC2IRp+hcJeeJ7d1iVJ4omXPAcJinRAm4bixbE7/PVV5ESgL1u1KcsX
	 XO6O5gVY4oycvF/Dvefmm0z8HKOTaRq62kLCoRq03Mud0pfSdh8ZWMIQAQQ9+kp5FSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=wqtnpGUNfBdI2tYwRkteOHEl5pecZGPokpZA5V7JX6w=;
	b=eFKabQxDmVW+brVXGLwITRR1aGkVuaCjsiF7dDdWin7CR7NfR8TJ1Ozl4xgJzVd+7DMj
	 XbZDt0mXr+nfDqqrGasxb/kmbXCxmrxOqfD3tUCmyKF/n/Bh19NO/YBMMVzU7c3jJUHmD
	 x4rqVou3yKC8TaRSG2Kxr6Lk3UHsYNKaf/m3WTSV6Y67Qw/pv8/wrhYunPpftH3e6aV0Z
	 kh8ILaIndVSobFqtHNaLe5zXorDtQlJrl7u2u6poO/Uiyp1gSpe9xb2PcHqUPUx/OC+je
	 lzm3TrA2PnO+mASNUezPbQn4UblcPd2S/yA/Sb/NTdKB+/kHTVJ1ZkcuzWZEf1dgAJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=neJcPGEj;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E44606A32C
	for <io-uring@vger.kernel.org>; Tue, 17 Nov 2026 12:45:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4E44606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=neJcPGEj
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1ae58d17cd9so3775105c88.1
        for <io-uring@vger.kernel.org>; Tue, 17 Nov 2026 04:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794919555; x=1795524355; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wqtnpGUNfBdI2tYwRkteOHEl5pecZGPokpZA5V7JX6w=;
        b=neJcPGEj0sPqBvoJKx0FchihvGXWnqXwuk/r9RLxrDA5e2Eu73wSyzpsxd6+h3bLdx
         kkHawRT1bwXCIjKe3BEiovXdc2kFCNGY/BPr9SavJrnRwynnSDjOrDw4yzstwrbfI/ed
         V/hZpFpVnkOpXBU2qJx6LidBE0hmbB5NCLK5tahKbNfsLXC7sEPFyyAS8Ba5sOTxJxdP
         xCvdgfMbPCH6EbT//m12Zy0j+nv2ZYV+LzHiGWKO14OKP1hlWTN5JUf17PMu+8rkJrCl
         LVyoOURtaIt5wBAQ3Th5TFPwVChoq04yZSVc7A2uFjHF6QOavGJfkxN24pa/I9nyVdp5
         tGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919555; x=1795524355;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wqtnpGUNfBdI2tYwRkteOHEl5pecZGPokpZA5V7JX6w=;
        b=dozQxh0TBYuAnKqDZfWdUdUQ6h5akqFiC6s0l82a0E7zGMXci1s8D/C4V8kvgKMLxX
         rnzvC/TOP2FP0EStSpjDLKwrCGdkutZ67C6XGjYbsFELw86LBTCE6yaptDnV1Zfl1K/7
         8PJiA67DR3W8U3ayDXHYnfP/ahF4Sx+yjbUaMpkGCidPCmUjwYvTIEarWfyinL/VSr+X
         Z3lh0nsS04oKzzezqOiKNcE7ZXwYlnk4g5IKBFAvH9eufU+0buZZL2gSuqz+5XnQXdzO
         gIp7qgDAU/oqIN2h2SSC0xxygVeBSfl/X0VeaNPoBGbphi8PIWg+SCS2lH438GXIhWtO
         O0JQ==
X-Forwarded-Encrypted: i=1; AL+hErFcrx8gY7pqvGfRTiyKhmUoeC9+Dum5WboZMYKLitpmstz94stcFOep1X5G10JfKacek0kqbJajzg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+gKySQKYrkIJ+GToeAEWGpHMQMJyfsjzINEHKizn4HiNidZ+ep
	7OQrpAa8KG+U49MBO79FqiSjg+apTAz6w1ktognhHmM1lzYJn2Bj/Vj1xrSbbFuVEXU=
X-Gm-Gg: AYBFou2HN73lTDJnqsbFudzN2OT00V2b41v0ZjaXUlTSQZwQ/x22J/ohXC1tBq4TEmS
	I3jiBRUmYAhJdm4+B0i8q9j5FSUjZIfy2OqvuuHVMr+1XIJMbKraX5W0uiyV6C5VTlvsAni7OcG
	+C0/ipKVJ30NedtimFA8kbjTNRVdpN1Pnsx2ndzFkzG8tbeb8W7dLnRy3MrSQAWwdqPRPb8yWIQ
	WEszKrvZSfqWQQ8eRVPqdY953Po0bnzCqnjG62/4sD8lN4n9TCjynrimjF30thfisGRndJ5vgul
	jj1SgjoNhdwXIW1HrOBRw3K8jvjwqdjzUHnv6Eu7VEXUkclNSJ9sdXaseJt7mIuyvbvJ3bWLIIX
	sphi4iNoLXAITXHay7H8EWd4aZRasvMpoqf/miU534ZdCVGumrZLTiYVM3ZsQTFeyQN5FfPyj/9
	N2Wg7ZeIY0ZWxNk4UANq7ZAz+oRoFCRUzGQaoMBhFA0nlYYuPmvWq75y2veeP+2g0kcMuFCh4u4
	Al6vBEo++JLgXST99qUEIHuh8N59j3gtCqoIAqfZ+RgrMkEE29Kvvtt9VSBaWbed9+r4mfCdGU6
	50xfhAfNnb1yWYKGcSH3rzKv3u0lJ5vJe8xs+de6r1y6uwUuYhnTmDVyYIH7yQJ+c5XCZ11BIeQ
	kK8WLwe69V3ArhQyQy6+uu3gIuX9t0JiyUNICVdnl4/YpC21o
X-Received: by 2002:a05:701b:455b:10b0:1b2:4b42:1870 with SMTP id a92af1059eb24-1b5030eb0cdmr12758685c88.31.1794919554771;
        Tue, 17 Nov 2026 04:45:54 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316d9c2sm37302905c88.7.2026.11.17.04.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:45:54 -0800 (PST)
Message-ID: <8e6c1d69-9910-4c89-832a-34ecd65a0ca7@kernel.dk>
Date: Tue, 17 Nov 2026 05:45:53 -0700
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
Subject: Re: io_uring/eventfd: registered eventfd signals only once after the
 cd305ee3633a backport (6.18.y, 6.12.y, Ubuntu 26.04)
To: Sasha Levin <sashal@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
 Yufan Chen <yufan.chen@linux.dev>, dev@rebasedinc.com
References: <oMhla8VwCWoihfrmgn8znIy60W1QXI8g_v2OyB9i6sWESIDlVJlwoGGOLylJgIHRARNoieXUVRGqzeB__KvHMdXgnCfPPovs8vLMOzaMPEw=@rebasedinc.com>
 <draft-agent5-0001-re-eventfd-signal@kernel.org>
 <5d92861f-9a4d-4810-8700-b9e457ed9c86@kernel.dk>
 <2026111605-deskbound-clobber-a4a1@gregkh>
 <07947062-2974-4630-90db-1556e25b50bb@kernel.dk> <avxLtZ2YLHdbeZxC@laps>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <avxLtZ2YLHdbeZxC@laps>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/17/26 5:42 AM, Sasha Levin wrote:
> On Mon, Nov 16, 2026 at 07:21:38PM -0700, Jens Axboe wrote:
>> On 11/16/26 2:52 AM, Greg Kroah-Hartman wrote:
>>> On Sat, Nov 14, 2026 at 11:12:40AM -0700, Jens Axboe wrote:
>>>> On 11/14/26 10:42 AM, Sasha Levin wrote:
>>>>> On 2026-11-13, dev@rebasedinc.com wrote:
>>>>>> If this is correct, a backport of 04fe9aeb4f3c to 6.18.y and 6.12.y looks like the right fix; it keeps the CVE-2026-80920 fix in place.
>>>>>
>>>>> Queued for 6.18 and 6.12, thanks.
>>>>
>>>> Yet another bs CVE - Greg, please invalidate this one too, it's NOT CVE material.
>>>> Getting a little tired of chasing these.
>>>
>>> Now rejected, sorry about that.
>>
>> Not sure how we improve on that, it's really annoying to catch these bogus
>> ones after the fact?
> 
> Hi Jens,
> 
> Since some of our reviews are LLM based, I was looking to see why this one was
> flagged as a security issue.
> 
> From the explanation, and looking at the code, it seems that we can register an
> eventfd with io_uring, then have epoll watch that same eventfd. When something
> wakes the epoll, the kernel is holding epoll's wait-queue lock. That wakeup
> runs io_uring's poll handler, which signals the eventfd, but the eventfd is
> watched by the same epoll, so it tries to grab that same lock again on the same
> CPU. The CPU spins forever on a lock it already holds. One core is dead,
> followed by RCU stalls, machine wedges. Any unprivileged user with io_uring
> access can do it.

I think you're looking at the parent of that, not the followup. Yes the
parent is a real fix, it's similar to the eventfd fix in mainline as well
for that exact issue.

-- 
Jens Axboe

