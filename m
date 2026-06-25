Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2893DDDAB
	for <io-uring@vger.kernel.org>; Thu, 25 Jun 2026 12:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389194; cv=none; b=uBcFMAGmykq32K50PZsDnFbtcDl16JQaDGaw+lstSVLj1NNs+/WzZhRXaYkoHSE/hLoz0ovsGvGJLLRDtzF9flEuHxKdPATgacJHwN02HvMklhSg5DS1rc45BHXFnhO1fHUry5tDJOr1rygzSyPmS3j7Uis0zWUgsF6NIIPBu6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389194; c=relaxed/simple;
	bh=sQ3IvhVlv89cPfQzS65J1lmyYHPFIWi8Shbctwx9fz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u5v9Tvtakauvhjjg65+deg+5DfB+Cj0951X2+pPr+AGsCMPEqCSo10HjVJdT2A3WHsWOpbqoQtPp299zvL58+tqq8G0aYC8zrXLsxMqCziz3DUjA79eiO3wdZWQmnfp3NMGyTKCrQbe/F36lPxod1pVtb+rWXcn/uQhlkOSc7M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=WhnGL/5l; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="WhnGL/5l"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6a11c68ae41so1013767eaf.3
        for <io-uring@vger.kernel.org>; Thu, 25 Jun 2026 05:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1782389188; x=1782993988; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FU2klxnBMUg0uA7ws6NxiqTBs9+/KNmY1E7rkk8xrBI=;
        b=WhnGL/5lNXW3Xow0yfnvN9Rk5Zd5XHrgvaMsBD/L80tA1KI7WDhzPbQ+RHoyqAprU7
         jPtv1YmpuJ1Dyp//RMkusH4ay/ac4rjRF3iosf69MeaTkit1Y6Qi3sxtzzTMQhLx6CGN
         lhydn1gxcAdnOxs53Wv9FpuDYU4TBZdHVewQCOXQzJIO/B2vOjwp9oHZQm/TaAij08HO
         cp5sKf3XBoG3yeBAmiaHYw2o5OEI+ap62GpeyfInLJI2twbRA0sADB7DmdYiFmtBwDYD
         1b7IMzpR0RXNtz1yxRLuJpm5F6xgbexvKiFDZA5K16VEz+xWQ2DbNUkf2l01qFt6YKGq
         s6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782389188; x=1782993988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FU2klxnBMUg0uA7ws6NxiqTBs9+/KNmY1E7rkk8xrBI=;
        b=Yfeus4RR4UAJ8oMATctJq25XbBhFTu83+jdZomjZt3UdIraGFy4T7A3VVhBBQ04BK8
         6gXTNelimRY2N/jjZjnqmd6kcqFH8F4se8SC5ZpNs0b0h6NEJtap798Dly+kqIwmc1oy
         Oax3BvS7gZNrlWoitx5zRcNUG63nHWOU1MNQTiLkufIMHstB6KXYV1xprfEhv7XNcvAc
         LuxH5aBoL/RP14xCCiGFNkvQd3MuF5f9CbHH1mf+zOFFE5t/catoGyCt2rgLYaVM/dpk
         HfEkfRE0lOV+bLPV+pybgHL/+8yz+U/J+5QH8Nkdk/o5ERnIMCDxLHAnbA3BUsjDi9Sv
         c6bQ==
X-Forwarded-Encrypted: i=1; AFNElJ9WS6pGnxTvaSUKDCk2xuVmyjIpMQJcOJJoZ+4bEFhLuMIRQ8SzwwrnqZr5r21dgiONi+mPwZYeyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyD+XGl6FARoOykoRDoPcXiVSj6Itg9kI7dQvJJEy+vKWC/1Uka
	zZpXEBrR/Z/RY8Uj6ZsCd4J+oym7VkaVPSmnRP/KOH8sHxDaSUHEvKaxdOlDEOTPfcU=
X-Gm-Gg: AfdE7cmYEMLCSZCkYK7MshVhIr982zz1qad4dk29fCenFL4Vi+Ebhn2bFW3ZJjafhu3
	g/h6V+mfganEg6uio/yBAerLzdf8BKUaO5MWnh9RZKdA0sXXI0KZ0E2ZTr04a64zuNQ0IvqbE4p
	p8925ZSX9pzMT3PI4LCV1eReagdvljeXM8MwuesuaA0BBAJyXZw+hXijgktLnTBPaHbhgcAe6Vb
	KcH3kxP+a/+V4eblnCShFKK7NGPby7nRvn2mxtfP+Zx6kQbV1/1YGz70ZvmeSEc8uEQ03BE+1K6
	nkM3S+3EN5eI2lquwoZ9h88oSWc0JJkHvgWeolBcEjBzxF9VQwv06LZnGi8W+XnYpCr9l3U19Bz
	KXIDVxGWR3/F8BMVHdUZL3Mj6qIDtFHYjfRPfCTOJL8oNlW7KJbMjvJS1cC38vfOm5k7OR9tyQL
	P0lv/bLv6thqHvmNEnzJcIE1paP9GVC3VbXDYwbmQqQXX+mXuBBQdkw6unyaTHz7MGXQIGy3c=
X-Received: by 2002:a05:6820:f015:b0:69e:39c9:c6ec with SMTP id 006d021491bc7-6a135171776mr1548990eaf.13.1782389187712;
        Thu, 25 Jun 2026 05:06:27 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-447ec359d9csm3002077fac.12.2026.06.25.05.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 05:06:27 -0700 (PDT)
Message-ID: <55f36cc5-a013-4960-8787-fbdf4b4d0c20@kernel.dk>
Date: Thu, 25 Jun 2026 06:06:25 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] scsi: bsg: read io_uring command fields once
To: Yang Xiuwei <yangxiuwei@kylinos.cn>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>
Cc: Rahul Chandelkar <rc@rexion.ai>,
 FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>, linux-scsi@vger.kernel.org,
 linux-block@vger.kernel.org, io-uring@vger.kernel.org,
 Bart Van Assche <bvanassche@acm.org>,
 Caleb Sander Mateos <csander@purestorage.com>
References: <20260527191817.142769-1-rc@rexion.ai>
 <20260626020000.0000000-1-yangxiuwei@kylinos.cn>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260626020000.0000000-1-yangxiuwei@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/24/26 9:25 PM, Yang Xiuwei wrote:
> Hi James, Martin,
> 
> Friendly ping on v2 ? anything else needed before pick-up?

It'll fix the issue, but it also just applies READ_ONCE() everywhere.
Which is fine, but most of them don't really matter. For example, yes
you could race on the timeout if the application is being stupid or
silly, but it doesn't matter one bit. Similarly with a bunch of others.

I'll leave that up to the SCSI folks to decide how they want to do it.

-- 
Jens Axboe
