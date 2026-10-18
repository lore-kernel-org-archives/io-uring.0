Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C8F442360
	for <io-uring@vger.kernel.org>; Sun, 18 Oct 2026 22:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792362621; cv=none; b=Q1tT7IIN4bgOmHTxJ3riTOCFoZJRrbazQRIImowYVdEN3Eo+jT9wh2i0JeVy9NLztRWSswBJnv5iVEOcpoMWqCIVdUwVVEEiwwpOjuA/A+h8IY5oSi+hXogUb/NAUKQ/hSfCoahUW1TGB08vZMw7ATVQ0hdhylfgTys0dOfkq4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792362621; c=relaxed/simple;
	bh=nqQ1m7WYHCdL/tob8ve7q0cmYtsXB2g/75/Rbs3AAP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SAqdxvSTmoG4uYJ4Z/CIfY/m1+4wEsw/MA/lysQqRi7qVWLs6vCCz8RgM5aZQRYpHlsnaSBeyoLEJB0+yb5k4i3hSo5eqRxyqbZtYNiQIEnxh4c5D30k6o0wvoUfqn0pE8YQLHsZFx2WEBFbJZYIYN9ydxY01EmKAiDW/pt4CII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eh7uKwMa; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eh7uKwMa"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e10a70540so310873f8f.1
        for <io-uring@vger.kernel.org>; Sun, 18 Oct 2026 15:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792362618; x=1792967418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z4X6m5HuF//9WInfv9qnGQYsuvVPOFTPcRayrxZgC5Q=;
        b=Eh7uKwMazByxB2CjlcuV/9lF8KDjgiS9o6syhHTXqWSIREQxvvqVOSHep5YwEGeT9b
         CCWudInNYgFblZ2R9M/xnZTHA7DuF7JmMuL6K7MofU3fFFpFCY0ZKXYQJ3qg9I2TD3cP
         87z96ieeSL+Ed+GCxUbu8NBiS4yQMFXXy8YQLNGSxCSbgkLe/Vy+og9IMjqyImxJUiN7
         85xLf8sZ9wy1sHrzmt7hsnNs1QmtY6Je+8oaLX4k95FOzOumIYuCNjIN8bd+yHdxOzQg
         XNsnZiOXI63G010Xcs+4JKmC6tIAFaJRuy1jb40CQ4xOt1bo+XT1hf1xBpMgQvDZ54/r
         VvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792362618; x=1792967418;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z4X6m5HuF//9WInfv9qnGQYsuvVPOFTPcRayrxZgC5Q=;
        b=ae27WAGeWBdJnKcKbeMy/qgQanv3HN/Di9ukD+PnwgqZLtxeR2p7lBB2ggvs68mtNP
         Rw9BD3JP3twqpWgxd/eFIIT8Up34yOQiQwpGG4FuDIoAvhEdQ2c40zGL+iisJSQ0zeMC
         QIqmNcJVDNL3DQiqAqFrCQUZj7MCV/CiYRHqoEx1B5ubjwF0NK/LaBLe7wi9/ELxvljt
         8WpJc/DM3V4Ea2OIsFV4rnjMcD4C2MnB1bm7bHxkv+1PFrD2B1K0tqqsYO118r/R7P9+
         kYmsREivxg074UJQcH7sflbt21WYMsGVmCwOJGYHxEEYfJc4xTysa+MbRH/z5VbMf6O+
         ET8w==
X-Forwarded-Encrypted: i=1; AKwUvBxJc1Wr/D+5SEslB/RLCrA1tHPOnmkse2VEXGCsRftGDTo3Q4Rrjt2ftGd6kI4p5kn9txbTWWwmZQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKXwOmz+E/eWrny4Ftu913HdFkaIci/JUfREh3OGLsJiExi5WF6
	tuWOWlVfocZ1wifJaGgH+DaN7WWh8RjC5AH1tjYddJa8KObRdLI5AzeKNjM2vg==
X-Gm-Gg: AYBFou3WH2RBj8d1Aoh3njV3cjABjzQBRdZWukSHYvqEYvif+Nrx5Piy9+DVbVaij7o
	UoS7MeWr1Ny1gnpDKoP/pm13ra7YZANqLyHhxjcRIXV8kSQK0D7Y8qLcW5fb4KV+cm6Ir9i3QUI
	2fTMB36KKmnWSDdtfMDAINvCtyq9vt/kjntRuwJS7n6sMRRnkjDGObLD0fTCu2HU5PsCJysF8/X
	bt8F4ZdcHDxqnjeapP1h65hacJmYR6jhSbNMJHUCPzru8jfUjVbgn300oS5g7I3CqKVuia23dkl
	Q9hlkcOmnGRf+7ViR3fhugvgcpxXP2Mppsk4rdgIex0CwRPTs7pKYoMJ1ievU0YJ2JTdTZoXRoO
	ufvKTKeB1FHBwv37Fovie3OMhJmMLxlpIieJgmVAZPqeDkQOE7X/Vk7vUiIp90IJI1hVKml3TYB
	uUv/VaysAdDpRS7Mxwhc80GNJ6Y6eBPv6qnw6Vg7UQDucbA7fhV0NNyXinFbzb2cgIAPHKioNDz
	lfuyqx+aOr1MZOjupNAJdMBC4kTL6M48e+r4jQRWyIJiQCWJHEfhimzVRf+/ga6sCi0hsfKR9ne
	e1hzgdSAjgfkvb5IMajZ8lHAzTI1RZsEPmT/8vtLsH3ZUlKpfjUHS5BjK+Y=
X-Received: by 2002:a05:600c:1906:b0:4a1:e6c8:ff74 with SMTP id 5b1f17b1804b1-4a1e6c8ffd4mr31719645e9.29.1792362618489;
        Sun, 18 Oct 2026 15:30:18 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cca26dc8sm163767785e9.3.2026.10.18.15.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 15:30:17 -0700 (PDT)
Message-ID: <f1cece19-31e9-47a4-a25b-839192660674@gmail.com>
Date: Sun, 18 Oct 2026 23:30:13 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH liburing] examples/zcrx: don't forget to sync dmabuf
To: Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org
References: <73b2654e41519acb2ec310ba1d6dc99cbafcbdfd.1792167723.git.asml.silence@gmail.com>
 <9d696969-ecca-413c-b96f-8fae5bb469a4@kernel.dk>
 <9c7dfccd-c1f1-4719-8731-34a8d6c8ade3@gmail.com>
 <f4a6b4f9-d3fc-4f36-8c85-ca99ae2ed0d8@kernel.dk>
 <059a4998-cbec-4727-8a22-21aa0f3e601d@gmail.com>
 <d9f0cfe4-d728-4f70-95de-b3e50e522019@kernel.dk>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <d9f0cfe4-d728-4f70-95de-b3e50e522019@kernel.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/26 17:57, Jens Axboe wrote:
> On 10/16/26 10:47 AM, Pavel Begunkov wrote:
>> On 10/16/26 17:38, Jens Axboe wrote:
>>> On 10/16/26 10:36 AM, Pavel Begunkov wrote:
>>>> On 10/16/26 17:29, Jens Axboe wrote:
>>>>> On 10/16/26 10:25 AM, Pavel Begunkov wrote:
>>>>>> dma-bufs are not always coherent and we need to sync it before
>>>>>> accessing. Use proper dma-buf API for that.
>>>>>
>>>>> Can we get a Fixes tag for this please? Other fixes from today
>>>>> lacked that as well, please always add fixes tags.
>>>>
>>>> There was no "fixes" today.
>>>
>>> Sure let's argue that, I merged 4 fixes from you this morning. None of
>>> them had Fixes tags.
>>
>> There is nothing to argue about, I doubt anyone would call a
>> tabulation change or adding a kerneldoc "a fix".
> 
> But we're talking about it, now another round... And justifying it. The
> way I see it, anything that fixes something in a previous patch is, by
> definition, a fix for that patch and should be labeled as such. That's
> usually not something that people question. It doesn't need to fix
> something that's functionally broken to be labeled a fix. For the
> latter, if it's broken in a user visible way, we'd add stable to that
> patch as well. Or just send it manually too, if it's missing from the
> patch. That's the definition I use as the maintainer of those areas, and
> that's why I ask for them.

Jens, thank you for the insight. It was confusing because the public
documentation refer to bugs, but since you use it differently, I'll make
sure all patches that correct typos and indentation, add new docs,
introduce new APIs and extending existing ones, or do other enhancements
have a "Fixes" tag for you as the maintainer of those areas.

-- 
Pavel Begunkov

