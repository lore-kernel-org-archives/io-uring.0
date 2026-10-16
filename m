Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E98E5328A3
	for <io-uring@vger.kernel.org>; Fri, 16 Oct 2026 16:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169843; cv=none; b=jfrts5/9TiBR5Kj3afTY0o4MSg55oCFTeT83Ewu3wyFKcLmNmzkMGwT0kZtEI3ZzK8XYOm2T+FC8pviSnQAGfpU81RresTBotf61FN6KergujPiE1ro3ALJ7qyLKhBxw3bW0yXSQoH5GlAlztr7Og1S1PW4lxAIlu9gkxZZXIus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169843; c=relaxed/simple;
	bh=Dcoc/OCCng82+zHEqO88FxJ7byUrcyi6OAKw9UP+0Do=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=llnBjyLAVzjZLorNEWLXHY9ZHZGPyvx9+vG6selWt7VSSrJlN3ZWiZjd5xRzS6cmFkEREx+eHS0HQ7nbmjolYENsGnNH8al6pvUwvSwXrYhaXfLwE8mBX2KNK9k5Ggv6KeemzAPLNxMwGXkyoS7a24bdznEAbX5dJaSpGHaNknU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=YKDeJGZC; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="YKDeJGZC"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-868b3248b2cso102267b3a.1
        for <io-uring@vger.kernel.org>; Fri, 16 Oct 2026 09:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792169841; x=1792774641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MOSjGjzee+UbFMxURLttP4/baQN38lIp6Wg0nkWXqnk=;
        b=YKDeJGZCUIzY59FVejHcYpRmTSyt41bStz3lcRSsI5x5owcQQ8w3fRPL70V9M1do2X
         jJTyzFAPHmucj7RpIPVHJKSrCXyXgEizvfuUBt+NJKaHNJxWHat1LrX3I+Hi1zgcXGiO
         U2L+/R77+gBC4Nf0s++rH3z6LKmAbmLkvbGyA/P8bLiJJPlIkDgWXwsM3Mgql+IWHdI7
         TnrJXoe8LWQ19/8DpVTl6AhIceMNoDoQPhmxA4KU3JU2e8DA71/jOiUzbsJbP3wtJ6VG
         QICOBZi1h9QaRSPevYsR65cHGnbbqKVMz0KqydavYfIJwx9tJ1Jv3thQC/KQqa411l7R
         kFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792169841; x=1792774641;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MOSjGjzee+UbFMxURLttP4/baQN38lIp6Wg0nkWXqnk=;
        b=SoajXhN+IrqiVrWYfrvE+cwQABIFjvrlaSjRBHhtxRHDRO4+sHojyF6E3uyK549rAQ
         9lFCvhrSwb46/zRpZjU1UbV9Rx6S81eLdLfC7HK0a+q0kIlIB9iTt/IEIXIRb9/sY3qP
         q/b3EDagvUULB8LuEtfB11Ck4MBzGDMAQzVXygOW+hkUPMrzOz+QyRtD44t0kmmdZvTF
         GK62VkdL3DlmF1IQAlvQ4VEi4p8u2oY2MKEopADS3hd92qLKN89Z194Pf7QDvwOQmhjd
         AkHCeP0GyCO80Okm0qVUMchBZ+VBLg+TFaaa1j7YExrg4n1iwIkKG9ZUB5O3AV2nKQOi
         iZjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxmqf4STn6lP3oeAkuhW/9KvadWT+ehWl+I4QaRZdnAPGluFMXoTUFEl2cI4eqwwdpsdKE2lFLpA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIQyVlzHhGNgY82ny4a/8p3DhAEIpPRUlLIrHoZUIbTvDUSm2OU
	aq+9Nh3CqTj+xCO7Oind+9UKl2lD4qu1UGQK9FXcBU0RHrQZdh3ZICqNiN4Q49KQGNLWighYp5X
	U0y8gGS0=
X-Gm-Gg: AYBFou37eOGlDGEvqtIlr4QmBjR2x9keB8NDQ7sv1pnBcS4AfQMS2b8Mf/4mKPEnuyZ
	El2FLkupH+6uyUtE1rpl+E43uX0eLOVVBPDs9B2Z1PIkzOx9ur0BvHz/8tzAVokiDgt381KKmzG
	Lknr7qOjemQnUpQRwGdZXsJG5oDfL2WTGVVYukD80PNw//o75QXYXDp4r3E6pGvfp+Ap+jsZIqh
	No+WYRUerEPFJoIbQSnETCYUJKSm2ZOYpAt9tSJy33B496aT0ONdrga4e9OH3dIAFhnwPpDbG2o
	l5VVfkZDzyXx957UHvxHIgWU/8D+HL1Fd0QIkoAzy/RxF/q7BAHDRXXNNXEH7F4nM1xc3ZA3G3Q
	0N8qaMbnafifKzbwXYyY4l9XTIhRAi2EFp7df7ftknrmc8n4DBmMnMLCaJrnd6A319D+9kPgXfz
	7NKwC5SnE3YFosMQaCky2Fw0UTo/uagNO6NID/Blv9+6FUWkiY2SOyZz+lMKZ6chdLtpBKXmzTG
	3WNG5kJ0t/PldZ1Sw3ZVIc3fWLlN7rR3Je3vPk6ptnj/ZKzWcoFi/fP0w==
X-Received: by 2002:a05:6a21:3292:b0:3dd:a196:53a7 with SMTP id adf61e73a8af0-3e16bf1fb92mr20564964637.73.1792169840786;
        Fri, 16 Oct 2026 09:57:20 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd65497f630sm1414767a12.8.2026.10.16.09.57.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 09:57:20 -0700 (PDT)
Message-ID: <d9f0cfe4-d728-4f70-95de-b3e50e522019@kernel.dk>
Date: Fri, 16 Oct 2026 10:57:16 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH liburing] examples/zcrx: don't forget to sync dmabuf
To: Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org
References: <73b2654e41519acb2ec310ba1d6dc99cbafcbdfd.1792167723.git.asml.silence@gmail.com>
 <9d696969-ecca-413c-b96f-8fae5bb469a4@kernel.dk>
 <9c7dfccd-c1f1-4719-8731-34a8d6c8ade3@gmail.com>
 <f4a6b4f9-d3fc-4f36-8c85-ca99ae2ed0d8@kernel.dk>
 <059a4998-cbec-4727-8a22-21aa0f3e601d@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <059a4998-cbec-4727-8a22-21aa0f3e601d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/16/26 10:47 AM, Pavel Begunkov wrote:
> On 10/16/26 17:38, Jens Axboe wrote:
>> On 10/16/26 10:36 AM, Pavel Begunkov wrote:
>>> On 10/16/26 17:29, Jens Axboe wrote:
>>>> On 10/16/26 10:25 AM, Pavel Begunkov wrote:
>>>>> dma-bufs are not always coherent and we need to sync it before
>>>>> accessing. Use proper dma-buf API for that.
>>>>
>>>> Can we get a Fixes tag for this please? Other fixes from today
>>>> lacked that as well, please always add fixes tags.
>>>
>>> There was no "fixes" today.
>>
>> Sure let's argue that, I merged 4 fixes from you this morning. None of
>> them had Fixes tags.
> 
> There is nothing to argue about, I doubt anyone would call a
> tabulation change or adding a kerneldoc "a fix".

But we're talking about it, now another round... And justifying it. The
way I see it, anything that fixes something in a previous patch is, by
definition, a fix for that patch and should be labeled as such. That's
usually not something that people question. It doesn't need to fix
something that's functionally broken to be labeled a fix. For the
latter, if it's broken in a user visible way, we'd add stable to that
patch as well. Or just send it manually too, if it's missing from the
patch. That's the definition I use as the maintainer of those areas, and
that's why I ask for them.

-- 
Jens Axboe
