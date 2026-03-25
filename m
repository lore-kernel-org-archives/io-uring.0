Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55C63559C4
	for <io-uring@vger.kernel.org>; Wed, 25 Mar 2026 20:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774469738; cv=none; b=mR7dLly9f0vYLwanMPcOfW79m80Wf8YUnpe/h1W7aqZP/f2TwUjCG7uq71y+kMxdKFs3m7XYWo5M+lWcql3N/2hRckjU//hcOSpPpOx3fCIm+bUbmZuupRx0GtXMuse91xtx9TpRTK99buZEXStvsLwj4RiWPmvg/4txDzITseY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774469738; c=relaxed/simple;
	bh=FX87JvNP2urAP/Msg++UjIWQZUA8IY8rePOuuoioyWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AfgD1VZXLblx2bvzoiGCtmOwE0IDQelnn5XJYX/73ihNZZIu4O9TlLbWoBQ3krpioqYgDK1wY+DTOrIzQr+x6VGWrznw1om6VjJLNX2nRscEHfKg7ZPu1rcIr9bpRCgqshpdX0cNQbnmRNcD1RmzQnQdNCJ2UHSypPf/Cwmxvnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=YinCHXhz; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="YinCHXhz"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-41c420d1460so131128fac.3
        for <io-uring@vger.kernel.org>; Wed, 25 Mar 2026 13:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1774469735; x=1775074535; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3438vBASjikmNd+Fl6xoWCMSRHEKDZTbjpGFwBCpG8w=;
        b=YinCHXhzRr03Yxvcql8q5spZ1rpSb0UUzxlYtBF+ECBW0zk1GEc7oFzXl29MjWT3ta
         QsUfvk/CEr1WtrtdoZptgNVih2SDcaxNpjk1VdTaLpxHi9bL/ctDJE7CInpOYJW8u4iP
         7HE9AvpKmA7zWT5pgEe1kP5Ga9iwWZm8Rc4cdztErcwzgVFKWhE+2MprMyPdb0lFcCHO
         p2M8FevCo/ekO9p2PkvMrIGqJxyhCkEI+/PasqnWFkQ6Hxz8VVZkpLbCnUXQi0Qv8TKv
         CP37BWidteeb1QFbATxhm0Qz3n1619HkvbJYi1OmxuMc5gSzQ0x1MV+Md5bw0pXPQRb5
         kaqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774469735; x=1775074535;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3438vBASjikmNd+Fl6xoWCMSRHEKDZTbjpGFwBCpG8w=;
        b=mMbvK70GXEgbLol2YSSZ4Nhia+Kzf4+npECkJFk56TY0SYy/uovghX5f41f2srTVmZ
         3m1Y9997U/nUVfdJD6KmZ8SM4Rrm66z8oPC15FSP8iR369tZNngXvBgyfYo8EPo2aQEi
         5ZixjLmJz428pudO5txzRBbRQ+wBT4WmCie/eaIoah2NHPfIoFsoxnrRV8ab/f4svdNy
         LUhTL2npIOn5MHHkHaphXAHHnM3byp6gkwZO+Wk7pXCZ6GPYvbCMx9LpIFo3/dPT3mZQ
         Vcb7l94tmKIyfKABcBgEclNcU4Qs4e3N3W7wcXND28G/ETJ5ncnCQi8Anx9S/oEBqDv8
         trTw==
X-Forwarded-Encrypted: i=1; AJvYcCXqtVPM+s9/yTl8rgNfnRGgIEbNnLd2qVdKRWnoqojZJRDMoNGVRtCiO2eEhtYvy0stXCnj2hbNHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOWg1E28KaKM+Uo8NkCmE4J3c9PI0F0y2HwI+ONGJqKZ/xWOsE
	SXk0L2qZC/cn3tIBcidp/s5llYMjrkUkYaBsB3JO3kX0MHxSXzqh5O+ZswVYhEpAaGqTCqqeuOL
	f/Jy8
X-Gm-Gg: ATEYQzzJ3NIP1fEpab+rgC371cayfyqdiD2LWYEuD7UE0J5rIio6XS2Qb+6+vzJRVrx
	7gAGUdbpVRqOCV/m7XI+PjvjT/1/86nWUNAVMSAdvrTTOQK6wJZJHHYSyNGlzCynosoy05BcAC5
	aEjzatmwy+mSE4lr6vYRl6+KmR3sRTDMuY6Edhj9kvrpQJKnRzHJzlPVr0DAyLoI8WRf/xhhA5R
	o6vbbKUVKUXTwt7qv9tuTdUXye3PfbMbd5hCM9xECpnm0545vIpwZg1DvEYtVV32Fcfy5j0E+aR
	g3al/6/HrhgsJ51mxNMDR4/DBweiVYkeYysN61E2K1BjpCDh+H1XT94X1Fw9eqPdmHJ4n6RE3i+
	JClSOBkuqul/EDQsb7FbvpDWXDh9V2nv7KgYPOWWd2eY2wdFfGAKdyDUpuNJeEziTtfn885jPyf
	Pf5LLfsbPDpvS2TmDGsxGj0B36FHhj4yr8DzhANE3CjN1Unu67EJHu5VWx5U4CuQ7loSjqo6MkY
	qR0iJONKe/LNqa4R0I=
X-Received: by 2002:a05:6870:f602:b0:41c:63f2:bfb8 with SMTP id 586e51a60fabf-41ca6ddbb48mr2449341fac.13.1774469735482;
        Wed, 25 Mar 2026 13:15:35 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41cc7ad3444sm478762fac.12.2026.03.25.13.15.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 13:15:35 -0700 (PDT)
Message-ID: <796fd39b-af84-4e91-9fc2-2599c8eed46a@kernel.dk>
Date: Wed, 25 Mar 2026 14:15:34 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] io_uring/rsrc: add
 io_uring_registered_mem_region_get()
To: Joanne Koong <joannelkoong@gmail.com>
Cc: csander@purestorage.com, asml.silence@gmail.com, io-uring@vger.kernel.org
References: <20260324221426.3436334-1-joannelkoong@gmail.com>
 <20260324221426.3436334-6-joannelkoong@gmail.com>
 <78925323-89b4-4def-aa5a-6138b4aa5d1c@kernel.dk>
 <CAJnrk1Z1n2xTem3xoP9oGDsJ3o9wPO_CfQ1GQy+d3ggLXP-9yg@mail.gmail.com>
 <147aa05f-2e03-4d0d-a86e-b145913d8584@kernel.dk>
 <CAJnrk1YWh=bVNZkHYgtG4QSePTC2LGi-x=-AuecS=HG5wCTpKw@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CAJnrk1YWh=bVNZkHYgtG4QSePTC2LGi-x=-AuecS=HG5wCTpKw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/25/26 1:56 PM, Joanne Koong wrote:
> Good idea, I will add a comment about this to make this more clear,
> something like:
> /*
>  * The submit lock ensures we don't see partially initialized state
>  * if another thread is currently registering the region. Once registered,
>  * the region is stable for the ring's lifetime (no unregister API exists),
>  * so it's safe to access the returned pointer outside the lock.
>  */

Perfect, thanks!

-- 
Jens Axboe
