Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E8121CC5C
	for <io-uring@vger.kernel.org>; Sat, 24 Jan 2026 15:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769268774; cv=none; b=DdVmk0Q5dzlulCDG1INYU7L33CY2TD/uxD3WroDNo2CxlSG13IxQRGMUho/HvynJYMOr04+Rs2QdKklfrHZKr1zqm8EVHS56YoRojqiiFjHoyuUaHIpXjFTjZnohYrOuF/ESggsNhxRA7Nfqv3YwqstE0vpXp0P5KDqDNAOFoYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769268774; c=relaxed/simple;
	bh=5J1z+h9gTyVZWXiuUb5p4sSnczES1pjp5WeZ5xR9ogM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BbyZ8mSm+xjAuQYSX4MWQGplqYOyB+Sq1Hy4ClfY2nzFGaNBnaeYob8xQQ/ghcVXEbPOzMFyOWMlQdykaVyGYBWzt0k21ZmvHUu3bgIE6iuIRNdanCRS1Wk0j+VUnICgRusZN6yc16a2mGXp/viXMfkCqASM0AnxchZPZVIh9ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=Y18mOoqT; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="Y18mOoqT"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-404254ffe8aso2056159fac.0
        for <io-uring@vger.kernel.org>; Sat, 24 Jan 2026 07:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1769268770; x=1769873570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pwfHaIHwhHynrDmxhg0SBWiGRF5dyUumJzQ8SDpYlu4=;
        b=Y18mOoqTVU85CATzrHV9YDuvVyjKDzi7IVId3A+YjhgXo2Pmw8+Z+mvHr/CQ4YXJP4
         2Id6ZxRuaQM9fe11oc1HL3nkyFgQt1p/jjBJpnvlVWqEZp/Vd0ZVSgEX2Hm5W4R+4GJD
         1Hj5Ih21/JwYEYZ7oYq477CE413mg8+TodlV9EyGaK0q6Rn0nhl0+wPEqI8Xh3dVW+wE
         BH4ZzhvrmHpFufMhP944chHsjXChWYbp+YI2dc+VmH8hQ86B9KXQM5uxIoTJQy8yGE4r
         7Fx/6wQa8jbuOKKNJWAo90KsUOMhwtMOK6IvJ6sN5hakqWU4CAzhRagPM9NEg3/4Ga7L
         bLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769268770; x=1769873570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pwfHaIHwhHynrDmxhg0SBWiGRF5dyUumJzQ8SDpYlu4=;
        b=ta1nQPXtXDS65VD2044OZKw4zo1gHEWEzpSSk8+j1wujtzx7yK8MeTzyNFd/Yyh3mk
         AA28EvtHjlCOz47yrONbMVaXdFU/6ohKxHOvgZb6kkQTfvxUSPXFu1/ZdenjmYzmsF55
         O89tx/wTXCvHgX7k5QHa999ZNr7wT6Z5zapr87R9xeGSXD/NvgDORTxJ1MQEr++JQXez
         p8uAGQSA/OprEQU5FzDMNGZeG1Mt+RMw4D5I70zf0BWkWDtsljqYGY91a9/MiTgWUcqF
         0O+fmLuiY+ZWZdkbXf5OT6UGqOhi4AR4uOKAdtwhUa6zUxojPLvKhOdAJlaeLCkTP1A3
         9Tqw==
X-Forwarded-Encrypted: i=1; AJvYcCWsjkujxtoDDBvr2HkHPv8wLkXuFzlxLPcomVxO6WdBjd+DC+etMdMC4HzsPv/prsnesnpBSDTlYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGZwvSUV22FDUjhKDMl9C486PFXeH6IxKqF2VT7ohcjKp1MAe5
	6kMCrJXe0upgW5+KGXzsxh3k1rSnxaj7a8ftoKfnqb/chgc5yzOn1wGDDwslApb63qo=
X-Gm-Gg: AZuq6aL6IoBRCzDEyAWp9zLwhlbl7vaPjOHhHVIL8/W6X2sOgfNuJbMyberxiiFW5UD
	IERLlIu+bu/1pQPlMlqfx4q1M5rMiCjC9GEEndF4bRokBuk/PFceHiBsJ0VKRJkkdQlxkPjmKJ7
	qxLXeXa0e9SkWiG5nlYdCgakM+OK9EYUWNIgJKjUIx1ingO6Ye6EIjdcDQsHIBoLNWc1wzyXWSR
	TxronOQyt26SfgymI2Lpc4pbIkHchKCMOfuVYpX56BObbDBcp4qv/kAMysF/zjsk9NThAWgrDkz
	fm4ab8c2Sv8xeZ6N/IR5g6PzZ3g/0ZDUAkGzASSWexmFPXF8uTeX2JThtj8qbcokWJKNOIvtRyQ
	wtdsZJlMkrlisv0akq6jw0snCPKqotSYSBGR4IBV8e0GzxOVFwJB5CiY43J6n/TaoQs+IIvwuxn
	m573NInL0FycmY9RAfRAKvVefptYvIpKVGJib9uAvUSKHrcj4YxfIt2hKLzm50JImZjH/Oud1X4
	B3NGxJm
X-Received: by 2002:a05:6870:b48c:b0:3f5:3d0c:79ba with SMTP id 586e51a60fabf-408ac5dfed5mr3182584fac.28.1769268768955;
        Sat, 24 Jan 2026 07:32:48 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-408af7ff54dsm3587565fac.1.2026.01.24.07.32.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jan 2026 07:32:48 -0800 (PST)
Message-ID: <8ce09f91-0706-4883-9b7e-1855c8dd5c2a@kernel.dk>
Date: Sat, 24 Jan 2026 08:32:47 -0700
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] io_uring/zcrx: implement large rx buffer support
To: Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org
Cc: netdev@vger.kernel.org
References: <cover.1769249792.git.asml.silence@gmail.com>
 <a840a38936ddcaa4c03b81e66e571a38ca68694f.1769249792.git.asml.silence@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <a840a38936ddcaa4c03b81e66e571a38ca68694f.1769249792.git.asml.silence@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/24/26 3:36 AM, Pavel Begunkov wrote:
> diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
> index b99cf2c6670a..b5166c9118e5 100644
> --- a/io_uring/zcrx.c
> +++ b/io_uring/zcrx.c
> @@ -15,6 +15,7 @@
>  #include <net/netlink.h>
>  #include <net/netdev_queues.h>
>  #include <net/netdev_rx_queue.h>
> +#include <net/netdev_queues.h>
>  #include <net/tcp.h>
>  #include <net/rps.h>

Duplicate header? Rest of the patch looks fine to me, I'll just kill it
while applying.

-- 
Jens Axboe
