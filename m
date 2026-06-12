Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99B432938D
	for <io-uring@vger.kernel.org>; Fri, 12 Jun 2026 15:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781277104; cv=none; b=BCYeVre/ZPoQW3PYNAOX1qwYzrs2Bc6jHQah5WY03p5BMpk3LILVRshUSAxjIr1DRMq2ixHjiyrsXXST/8iYqf5rqgQABn5PqZB0B4pqRYZe67iy9Cv47I4XmLKry68RinO9maLv4+chLjam+egzLP7pzisI7/7GBxEVequT7G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781277104; c=relaxed/simple;
	bh=05VO7IbwaJa2Hd9qb/ZhzxkiRafDwlt5NlHrvZ0LoTo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=bwumtDi+P/CNDkm8MrWweGhplz5TAf8j+cajGDjOg+Rd5GbB92JjWQ5EVyw73NFCZr0eDM/SdCvOW+ghvkxcH7lRiCM1hMsHjEPd03eMn0bNPSeE1nkszYPL4qf5CQBaDoIPwefIvHtyEWl2CWl8kXfWXT/sKpYW/jSjswhFMWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=WCF121hW; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="WCF121hW"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7e6f586a0d5so586880a34.0
        for <io-uring@vger.kernel.org>; Fri, 12 Jun 2026 08:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1781277101; x=1781881901; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ihnplhl7iY7iqJQego0rnorT+cAGvn58KXxseGRCm5Y=;
        b=WCF121hWq5o4lVWyudeSccfFGleqANV7uzr1He97XAYbFbPf9QjjNtZz5ieVdtjKsb
         +Ltj3HGEOGsHL41ow3LAX6/Oc1yt+p/fN9onUSxQdf69Ts58N7QGSuIu2eR0D9wblGyX
         0JS39M1+8wUV4GDGrzeUxpBUxUi8qDJvR+dtFgCEpaMM8+WJ9dV1dezcB10bWmiZRiSb
         b4QrsNoSZoj5grvkzpB6/Gm1fH+u5/TCGsWQmbP5s6VUz/xwjb8mtdfAhBbUWJu7IzwP
         E3xJSmpLYHSdRUSIQRm6ZBsX3pdvRqjHM9XifUgwRchVQrIzeOiQnaalcKp2UHiPEo26
         vigg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781277101; x=1781881901;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ihnplhl7iY7iqJQego0rnorT+cAGvn58KXxseGRCm5Y=;
        b=rGwExeShPCWFrpj+dBMgiyWMAo06VrFffH/PVekpq0TAo0wJg6/l4s9u3/oy74sT9V
         RTxcyTgSUa68QHp03aGkO+WEKgpC4XzDSm0v/8OQPTsoMdOMWaO36jgdzDpTlm7WS0yC
         iO2biWpDsCFvjLP3ydxG0lQpdZg/vMLTZ6gmYG4Ej3LUY/uGQicwKXfKfkh1y5EOhZZu
         RvusG0uWipNGmqt+Di6yMZkl23xXXStPte4iyyRRf/p9HV8IiBdBsDrRFGy7ymv+HyPx
         OhFXwXFPI4yMifFw5OhsLr9BZbXaWBCrsU07QlrcYtI3qQuDtdk1dU/4iAJcVjOj5WG/
         adkQ==
X-Gm-Message-State: AOJu0YxaOmIrTM+A1Ph8OO+YbVAta0705r7m2uinwIktMmhu6T7MJjKp
	89VZWd4tGkIQqxi5EL06iljI/UryXvx9PPo2iMAnlC0Nm8Hgz67Tu3oQm7Mb9KS81w0=
X-Gm-Gg: Acq92OHVpbJfxdLczaUvmcp0vUwshSJwP2AuH5fMV8NxQVk394mlhhGVqsUeqge5Ozh
	KoP2DGzJMKxUz/Ay6qhxhIfkrDk5dZXjPS9kAKwLRc29jzpai4UKS4VQNwAl7sBB9k8cA+fVhCm
	SBnZ41h9wg5nmwgxFPwL+DnCfpKobVtpumV/G1wTdXJU39R5ilGUXR1cpNOUy1GbXXrCDO/0m/M
	YVnCAwYvkXnVrQyqcwUO/530/1Um+D0FPHdsbJyz32OSDhYCJId51HDZFpoAisa6GjypdaLg15K
	yeIf5h4cxmjc8VVebdkaSJ745NBikyFq5DN5/Vv1CQlgWJSi9clL+OsUADzjHCD3+TN/nM228V4
	5s4ZHMTtDlLGQgE5K6okMyhknq3Ng0Jwv4GWdSdNSbdUx137wvSjjb8sVJSUI8PjEPwTQEhiz2O
	661Ue8w41H9x0wZkBH75A6Zce53SGa8vTpssHVlAUl1SuPtOM3ulVcr1oFViepgwhc7nf17fxHV
	1+UirEOsw==
X-Received: by 2002:a05:6830:7002:b0:7e6:e349:538e with SMTP id 46e09a7af769-7e78477f67emr2161951a34.19.1781277101495;
        Fri, 12 Jun 2026 08:11:41 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e78148a918sm2088564a34.7.2026.06.12.08.11.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 08:11:41 -0700 (PDT)
Message-ID: <9232ba9e-2ea5-4ed2-9043-15190e0f5d0e@kernel.dk>
Date: Fri, 12 Jun 2026 09:11:40 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] io_uring: switch local task_work to a mpscq
From: Jens Axboe <axboe@kernel.dk>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: io-uring@vger.kernel.org, dvyukov@google.com
References: <20260611160553.1486640-1-axboe@kernel.dk>
 <20260611160553.1486640-3-axboe@kernel.dk>
 <CADUfDZrzwvY6UpBBhLj1JynuNf5bo140+LbMYDOvU13=od+nkQ@mail.gmail.com>
 <4be7a6db-44bc-4125-867e-9d22c2809f1c@kernel.dk>
 <CADUfDZr-MMYBaP-e+y9+xuRhuiunO2sBTUCmwZyd7AgT8sVtiQ@mail.gmail.com>
 <1af6602f-590e-4ca5-b034-b09b3f40a8d1@kernel.dk>
Content-Language: en-US
In-Reply-To: <1af6602f-590e-4ca5-b034-b09b3f40a8d1@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/12/26 6:21 AM, Jens Axboe wrote:
> On 6/11/26 11:24 PM, Caleb Sander Mateos wrote:
>> On Thu, Jun 11, 2026 at 7:23?PM Jens Axboe <axboe@kernel.dk> wrote:
>>>
>>> On 6/11/26 7:14 PM, Caleb Sander Mateos wrote:
>>>> This is great stuff! I had also observed these hotspots on a ublk
>>>> workload. Since incoming ublk requests post task work to the ublk
>>>> server's io_urings and completed ublk requests post task work to the
>>>> client's io_urings, there is significant cross-CPU contention on the
>>>> task work queues.
>>>
>>> Glad you like it! Once I post v2 tomorrow, perhaps you can try and run
>>> some tests with and without and see how it does for you?
>>
>> Haven't tested v2 yet, but v1 shows a 4% IOPS improvement on a ublk
>> 4-KB read workload. The workload has 8 CPUs (unpaired hypertwins)
>> running fio with io_uring submitting I/O to the ublk devices and 32
>> ublk server CPUs (paired hypertwins) servicing the requests, achieving
>> around 4M IOPS. Both the client and server CPUs look completely busy.
> 
> That's a pretty nice improvement! Would be curious to hear what v2 looks
> like.

And here's some more stuff on top you might find interesting. For a
6 NVMe drive test, it drops my task work usage from top-of-profiles
to ~2%.

https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git/log/?h=io_uring-tw-mpscq-batch

The patches sit on top of the io_uring-tw-mpscq branch.

-- 
Jens Axboe

