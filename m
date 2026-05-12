Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4283A875E
	for <io-uring@vger.kernel.org>; Tue, 12 May 2026 20:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778616251; cv=none; b=A1juZPeHzM1sIfzU3bJmm2Ym9njplUivk/MZPVJ27OF563IduIeueErZjejtakbfeJ/x7fcMOBpiFl8ZBMv/wxomiujTNM2MyAlEG8f43I0VJfmZnibNftkET9IGKB7Q06MAfwltTGkYa+LhQGS4IQS39CCWpuOKrlkbCnUFV8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778616251; c=relaxed/simple;
	bh=/hkOjn/leKAClt06K1k8dcGw0kKl6JVqrw3E17jd8L8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DuQ+e54XuQPEVETLbA6LeJ/XaTQjYqCKeWVsWIOB30rcdHtl4TXD8BWo5iGple9gEbIdgJjprMSE4H9+3D6izcpo9BtWuqmp1Kj/rKQeJGv7QRoHGErsLKvw9IguBJilrMjFD4dVLA7Au5kHjNpvTDzGXqufHuQ6sNwngj+mOww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=bPAZrPur; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="bPAZrPur"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-434e69e943bso4489144fac.3
        for <io-uring@vger.kernel.org>; Tue, 12 May 2026 13:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1778616249; x=1779221049; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JAPMktyvOhiuLY9Ol3xDpLg5ZIMwHSxD+pTIiS+Dfmk=;
        b=bPAZrPurMHnOmtjadFeQ3/bHrBK988B2OrvfeqFKxR2pvgAJLkQhqs9x5NnSloudCD
         3bTU+Xjmkgv7EpsY4rMUoA8nOJZqdIWLDf5/IDkwJ+M7PMp/YpuEkVT9HwsMYJ/GfOpA
         n8Dge7Xs2iPHVQo5e0nwvXDpb5HLYlMsDO8xOwuhvkmpNZlxbCT1Uu+MuMy/L3PzvQD5
         ooCZPYlIJ+/XxxZdeR41HM3A4UrLGsVZvW7WxDwnlXpLZzq7fXpnbk9ZIJCX8OOXqtxY
         K5FLjsID8uVOygDiC2Qjla16eRBjgC7asD7KiBdCLRE0K4X6bZ51UK1vgGhJYM7G0mm/
         wQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778616249; x=1779221049;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JAPMktyvOhiuLY9Ol3xDpLg5ZIMwHSxD+pTIiS+Dfmk=;
        b=RAPSYm8TpS4nzOGqmqYPuivsI4038iPJFrd1UOplpCPax/ZeUDFVve3tcqWXERLj1A
         HkVnupoi0jVxY21kdXHrcT1BTVOfwyKiKdLoStjqXLJkXUGdDj5lsAlIyqXLSxVskkf9
         Pgk4x0R18AFjZAa6VKaRiGmTHRmAZXXjRq6zHyPTwtYnoYGzncVKdseWN0DBPRgK+PPU
         Z21aNMSAXWpzu06xkDkAn8cCFBUEaCFY1Zny/890FupijdFG2mfEQ8nCI18Rgmb/Jhi6
         kaWYLuJvhOUSOfME5u7gSUYsYRPyZiPCOSO4qFfbpy8KQFFWcjUtRBGfMCqwSax5XPnK
         P8vw==
X-Gm-Message-State: AOJu0YxuJ2PJPLVLI093RJNxN2JN6gy9PW+zJRYliYwxxZxiHWcxjcRa
	R7FOq64l0Xup+z+qBafthtDuyBDPk80MpX4CjUOn66jRrwXVjV6Nc/3x06p/Aa3ygNY=
X-Gm-Gg: Acq92OH46kYmXE0B9TojGvL+iGA32opeOstOt7/9secXYoGwHR33MnAcFG0KSsHHczB
	p4efd905AFdGRJToI4IaKouQPH8nMkmgcXqWVBQqgKx8W++TThof8MAs9jn7a8HGslnZPQnEeVr
	rXlb2l7OcNFpBO4oLhpcgdTkDblQdTgXpw/fQ08JgAEfFVJOhd3M0QkIX9+/tH3AsgM5zcSldWb
	M+Maaz+NY1O9s8AqUjXJV8FsRgm/05j380/N2WLCRU88KhiUULoGFPACabr3gXdpZNP595+Ohmu
	MGW+KPJaGZ4TnKLmrf8bsXg5K+fudgUzn3ZNgGhyZXfkXpkThmCX+NELbzcgwwL4KBYLtW/5mYR
	yOnbpdWJ7H1Br0Ko5zfBKUopZzM2rbhxP5ZZX7bsamSICVs5l54HQhAL2dbQu0PR+C3SsdLxS1P
	MEwhWOUSO1ZhaGOR410k4gXcqwSWxR54NmfxTfdbVMsu4yNpNaI7GIXgLIUB3A+hpvnRFevIG6p
	0s2en2XuHTp+nj405uc
X-Received: by 2002:a05:6870:d623:b0:423:9219:4c6 with SMTP id 586e51a60fabf-439ce12fb66mr120125fac.13.1778616249058;
        Tue, 12 May 2026 13:04:09 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-439c1e0b5easm816013fac.3.2026.05.12.13.04.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 13:04:08 -0700 (PDT)
Message-ID: <dbd67425-5bd4-4d14-9b44-bc5252c1dbab@kernel.dk>
Date: Tue, 12 May 2026 14:04:07 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] io_uring/epoll: disallow adding an epoll file to an
 epoll context
To: Christian Brauner <brauner@kernel.org>
Cc: io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20260503085101.112698-1-axboe@kernel.dk>
 <20260503085101.112698-6-axboe@kernel.dk>
 <177861542131.846060.10743549776459529700.b4-review@b4>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <177861542131.846060.10743549776459529700.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/12/26 1:50 PM, Christian Brauner wrote:
> On Sun, 03 May 2026 02:49:16 -0600, Jens Axboe <axboe@kernel.dk> wrote:
>> diff --git a/io_uring/epoll.c b/io_uring/epoll.c
>> index 59cd4f009648..42057aab9124 100644
>> --- a/io_uring/epoll.c
>> +++ b/io_uring/epoll.c
>> @@ -62,6 +62,9 @@ int io_epoll_ctl(struct io_kiocb *req, unsigned int issue_flags)
>>  	CLASS(fd, tf)(ie->fd);
>>  	if (fd_empty(tf))
>>  		return -EBADF;
>> +	/* disallow adding an epoll context to another epoll context */
>> +	if (ie->op == EPOLL_CTL_ADD && is_file_epoll(fd_file(tf)))
>> +		return -EINVAL;
> 
> This is the same pattern in epoll itself.
> Might be worth also adding a tiny helper for this that both codepaths
> can reuse.\

My preference would be to just open-code it, then it's immediately
obviously what it does. Unless you feel strongly about it?


-- 
Jens Axboe

