Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5713A6B8F
	for <io-uring@vger.kernel.org>; Thu, 17 Sep 2026 04:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789618977; cv=none; b=NE/+6AIoltKGQiE3oAwU20I/XuTYVHjvz2jdso2z0YO9pEkkTAaJfcb3PZZbgmImKicOBYYsrRmK5zsR4hsXK3PFiyx6rI6Jv31vPISJs6LCRSzXi9b+1uJBipIZBgQg+QaeFfna1mrkeYknPFf4Z83d4uhWn2KM6tLgvc80ENg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789618977; c=relaxed/simple;
	bh=8wtZAvNT7a9V1ZvAdLzYY7RJHrpWTHVT3hZn+/HtNiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GD/fz/Qsjudd5Eqea4F/vTd96hhgKQlx+JytvRc0gobkp3LM2JfMVHe0Fx7ltRD91DkDgDgMJo3I75FPU1oEiol3TvknRN1rN1Tw2mQuJ1CCsp+C7QIX1zvz1EIgzPNjvV3rIz7PuRAjoZqh5vFvnMOWIWX/Y3gxSVEq7aVz6ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=W6AYAdYO; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="W6AYAdYO"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485b1d2874fso98885f8f.0
        for <io-uring@vger.kernel.org>; Wed, 16 Sep 2026 21:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789618972; x=1790223772; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HvJ02HsiNrv8JW3zikD+XvlfI0/TGUEX8EPR42BPyOw=;
        b=W6AYAdYORAo4p/1ZMn3av4np1UqMUJk29ThNMNuJ6/TJsnD/KkIyaexASBO5IDgQKm
         NRxtRBhE2CUGSyHBp4CJJKm+kVPLdqNRot/YYzjJtOPw8NtOUjS2/wNkllDNnagTY9J/
         5jVZWojN4aGxtNqIVU0+WdBeXLWHyXSVtJrWt8UNfX++0kFEj/K1f53kkOxMKyq5RIYY
         rv8VmIrnn2VL13hmoO+8FbrErNd1tfYd7vRUNy7QxrnAuCR5D4cVE3IVFWw02CEzq9e1
         bIgW5aPpfkhoZofPxK/DL6dwfpey8JYPKPTHeVN+9LIhAGyLhD6uLVBaJR4KrUgYj6sa
         Jpig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789618972; x=1790223772;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HvJ02HsiNrv8JW3zikD+XvlfI0/TGUEX8EPR42BPyOw=;
        b=kMpCTVlFy3e4sHMWavhgPxjqKnQMiM5DuQ51CvdTXbNKxPWx3wKU1Nuwp5/PdNavL5
         ySVoygUhRsHwzloDqfJdBJR96cyDv/k68yV1rMMAAw1gyEluwT1Oj9YnD8exrlLdBGeg
         T+d4I5Z6/QpRUZyklmZm+84kSx2GO9xJc55Bc5ZkU5prgeWvkle/3E81A2vJUaTMK6Jw
         rtzHQyIurf05oM9deTqOyVJQSuEOUAAZ9QyJPVm2fcW6Yc6ag3zVk3uuo4gwC64tdxsN
         bL1aWZK9eu/2MJZebNqwbtJYZJIUWiJfmuJ4/wJKJ0wsoTrNzvH8cG8xUNEMUaFrf7m5
         PsyA==
X-Gm-Message-State: AFuF++lccZgDpHRXGqn7EY9UPUpuPHH8UM3nfiRr+dMu1DNR91SVbvxg
	4sp3CNAgknQ/R6UKixsl+oTNmis9fGcC3/sy0g0cv4KOJtEGwpPnUDQl5glYAc0tFn0=
X-Gm-Gg: AYBFou14X383LDyE+12/h8S95FZQbbHYoQ+tXkZjSk7nDY9yr87AkkSeqiHkRaWv6K4
	TpggR/K3lqD5VzmFN4kKoFLuPN+B2TfFEUEzVf9ZdkVrKx2DsbeyrrWXx8p/ErRq1V6RIUTQc+J
	5UphWOTL9rLzxWtuheca9Tbi858I8LlPoe2jXVhgub1vWKSlFADnLQy8AnikojW7MIHPnKGJQMs
	3/duZUeepIbJgr8BaQk0POTzARwWEF/6hZq3jJRX9XmUEgL78LFRM8YUEbUlYkysVS/GtycUovU
	zzDkHDIXzk50lbVWp4c+uVkCcJT1efw24ZNsqQew73BGezbq+qmuVahCePH/BtlzKzNwMJ/WsPv
	3AIeaW8rZU5TOU1YBNC3jL1JCiPf/lKBjsB3ecJ+k9Cznep6TWmRDjn0P6ue6NAjuHM4gA6ZdX6
	b8utHedOkkrd/WaSz7OwPbGR5VwKr5FST4WRb0Iapo23eOOkRXtxjRMP7a7HfS/i1Vv6V50UwoZ
	shMMfAgMWrg5M3x2uN+IpIjhBuY9DOLPiFcj/H4NvxU9erECeACk+obRGxlVmYRW6L5+OoVQWT0
	g8yjMqsgTnJuO3eUhw==
X-Received: by 2002:a05:6000:2f85:b0:487:cef:222 with SMTP id ffacd0b85a97d-48713c16823mr2532424f8f.23.1789618971851;
        Wed, 16 Sep 2026 21:22:51 -0700 (PDT)
Received: from [172.31.3.9] (static-82-61-24-46.ipcom.comunitel.net. [46.24.61.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf26c8dsm11895824f8f.14.2026.09.16.21.22.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 21:22:50 -0700 (PDT)
Message-ID: <f430d1ce-4803-4bfd-b6ba-2065c84d03f5@kernel.dk>
Date: Wed, 16 Sep 2026 22:22:49 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SECURITY] io_uring: provided-buffer ownership loss across
 MSG_WAITALL retry
To: Andres Berbescu <aberbescu@gmail.com>
Cc: io-uring@vger.kernel.org, sashal@kernel.org, gregkh@linuxfoundation.org,
 security@kernel.org
References: <CAAOipkaT5tDsf-FtP0hC0iUG2fEe0PowqeQfV4m-cuooJeZX2w@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CAAOipkaT5tDsf-FtP0hC0iUG2fEe0PowqeQfV4m-cuooJeZX2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/16/26 3:35 PM, Andres Berbescu wrote:
> Hello,
> 
> I am reporting one io_uring provided-buffer ownership/accounting bug
> with two MSG_WAITALL manifestations: bundle-tail reuse and
> incremental-buffer reuse. The two cases violate the same invariant and
> should be handled as one report.

For the three you sent:

1) No point CC'ing security@ when you're sending it to a public list as
   well.
2) Send a patch
3) Potential data corruption is a not a security issue in the first
   place.

Everybody has an LLM these days, if you have it find issues or potential
issues in kernel code, have it generate a patch as well and send it
along. The documentation is pretty clear on that. That's more useful
that 20kb+ of drivel report.

-- 
Jens Axboe
