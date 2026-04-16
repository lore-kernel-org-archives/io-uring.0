Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C113D1643B
	for <io-uring@vger.kernel.org>; Thu, 16 Apr 2026 01:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776304257; cv=none; b=J4i1COT/2MIiE8UYFOFdxym9TIOjbdmDoqsbkm1syMO5HZauNUzoObJLS6qWBl7KQ8kk9CZJqWhycW891RiF4e+yEvvN+9NdY2Q5EB1+3iNZ6mL73StcKNFJklSTgSkERTDWDG/rQej2I5GCZXgV+8OH6f83YLcPJRsA4cOaG9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776304257; c=relaxed/simple;
	bh=RGNGyO79iTSiLKNV+Ssw8Lrq9pBVyxq3fyvqhhXGblg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hg8p3EqJL3A4Mfh+UMuZLylji50ARC+/oB14CtwnMjmWh4Y+/i6GB6qgsBQJLgxkoWwJUTIGL2baHZj6i0ONctMkayDl9agB9fC3Re9Y7m9ajxoAuBRFDS7r2CG2lSbKqn2fQRo4PWOW6l97F9XhtMOcjUCKR/HWkZP99JiE+XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Biebj91L; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Biebj91L"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b4520f6b32so8344881eec.0
        for <io-uring@vger.kernel.org>; Wed, 15 Apr 2026 18:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776304256; x=1776909056; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EynrvdMibWxR5IlkzRIxEx2nILhlpBffr75eFRmqLcU=;
        b=Biebj91LVeYPKpgC2HVhNLyu0jQILe3D6va0Fyjp8zrO9VNq9YsVwIWo3wY8Oaqc9C
         QzbSHRdlyPIr74K6ys0McB8SjXg3loAkU3fM4lM8mtvpGHCCErTmSIZoTIMpPivCAdT3
         hblGde3XxnO8ebsWzAykZ0tVDhA7rZ8Vgy/NwU+oyZTfIiKAfA+SnjxeUutqvq4l3BHh
         mmz14HcvwGxzhUTHq80//QiQI5ZwfVQIlSyJdKpq8sObwkVyaef5AXI087wk+1M3HlkQ
         hCJb+fzitN2vtFVqXUhBu1+gflKjPkUk8auKagCoSrIFKgxr9hwG6jMzltapHOGhgrHb
         l0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776304256; x=1776909056;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EynrvdMibWxR5IlkzRIxEx2nILhlpBffr75eFRmqLcU=;
        b=J4DM1tA7hN9425nu8xXqpDyUvXB3hvtVBAHPoOG2FHFtk90GoTTb+NWU30UTJpFiwX
         jrrvWfQ6PcPaJracRTzm7tOAFx56Mt3tZlQU/uxTlWHJR+zL2+sNNWvrF37VpGCudY/u
         DVTH3ARpGaDaPPW0WypCB4QtsBN5U9FLv8Q10Afbpt/H2+ZBhqazX6jxfxuMtX0+7dL1
         UTSPa1qjCdZRgNLnBM1WygLeI66TedF4Whpkpq5DopVKIA1FOTMcoBDCzHuGTm5o/fJc
         VUSvdOd47i8x2ZAD/QNXA64VDbYWNDHqhXN4P4RAVGtJkbr/eTma5gHXqryhZa/zw/49
         wenw==
X-Forwarded-Encrypted: i=1; AFNElJ+xGx8ii1HxZbxOMueO8CFWqn9MmRYrHgTNZ9HRD944hd3d4xOXe4EpTKOP4xZ0W6tEq8UX7n0Q5A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx06VIDfgqoSoNjI71IwZCwjUK3DhDBlg2BNInru6h58bnHPpNe
	/bGj1YfEXfZ13EeN7r2QYxJyIdrVTKMEkL/om2wQZtYd/XO8bhkTxnJU
X-Gm-Gg: AeBDies7RSEmbf9QmBHNlgMnht/bNH7ZmWmhrlqETOSVepIraaHBv70hlXq9DtJQsyb
	xivgQ4PVypR9x4BUF3a5QPuewWL8GvGPkGMfvlgQV97j38gg3/XX3hgKqfXzjia08C3DRDgvjZ3
	sGvcXOJkiLoTK3aB9/QfwnhmB9AdNY5CUztcKl3Ezf/Yc85k4PQh5lkY3WC+g8YZsQnKBv3ydTG
	0S9LC5JMfvNNP+gvQYLpa+4p+pwssM2xyi1Lj7btdGJFoHvtwFK0hpLCXUAvv/liYZx9tI5AHTV
	vaYoEA0D11xy7wH1rm7DEEVL0RJt+3rap0yK6pJ1tBDujydVn0NYbfz8p4L7DCOQ2kwpgiz6eiJ
	m5ZDEc6wD6LDjibvdhYyYVbxi/Y2t6cfSgvL/rUzxPkFRxOhrJy2KiC3gcwYCCJj1yfJI1+DLq8
	rOAKFYV4OZBBq4ipmC2CWBMEiwVepC1JzIiND638zzAVLplqJvOkZUFtwVgNvE9HSRxbiUVj7y2
	ny2NxXVtD6B7NftbNyBuP2Vyw==
X-Received: by 2002:a05:7301:1003:b0:2c3:d51b:91c4 with SMTP id 5a478bee46e88-2d5876a4991mr13210016eec.7.1776304255700;
        Wed, 15 Apr 2026 18:50:55 -0700 (PDT)
Received: from ?IPV6:2607:fb90:bdd1:e0ac:ec4b:d50b:ac50:163c? ([2607:fb90:bdd1:e0ac:ec4b:d50b:ac50:163c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8f6615d5sm6453231eec.24.2026.04.15.18.50.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 18:50:55 -0700 (PDT)
Message-ID: <e5b35ee6-8255-4164-8aef-3b9168634529@gmail.com>
Date: Wed, 15 Apr 2026 18:50:53 -0700
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] io_uring/poll: fix signed comparison in
 io_poll_get_ownership()
To: Jens Axboe <axboe@kernel.dk>, Ren Wei <n05ec@lzu.edu.cn>,
 io-uring@vger.kernel.org
Cc: asml.silence@gmail.com, yifanwucs@gmail.com, tomapufckgml@gmail.com,
 bird@lzu.edu.cn, zcliangcn@gmail.com, ylong030@ucr.edu
References: <cover.1775965597.git.ylong030@ucr.edu>
 <3a3508b08bcd7f1bc3beff848ae6e1d73d355043.1775965597.git.ylong030@ucr.edu>
 <6dc4f9dd-975b-436f-889b-7c584bc18e62@kernel.dk>
Content-Language: en-US
From: Yuan Tan <yuantan098@gmail.com>
In-Reply-To: <6dc4f9dd-975b-436f-889b-7c584bc18e62@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 4/15/26 13:09, Jens Axboe wrote:
> On 4/12/26 2:38 AM, Ren Wei wrote:
>> From: Longxuan Yu <ylong030@ucr.edu>
>>
>> io_poll_get_ownership() uses a signed comparison to check whether
>> poll_refs has reached the threshold for the slowpath:
>>
>>     if (unlikely(atomic_read(&req->poll_refs) >= IO_POLL_REF_BIAS))
>>
>> atomic_read() returns int (signed). When IO_POLL_CANCEL_FLAG
>> (BIT(31)) is set in poll_refs, the value becomes negative in
>> signed arithmetic, so the >= 128 comparison always evaluates to
>> false and the slowpath is never taken.
>>
>> Fix this by casting the atomic_read() result to unsigned int
>> before the comparison, so that the cancel flag is treated as a
>> large positive value and correctly triggers the slowpath.
>>
>> Fixes: aa43477b0402 ("io_uring: poll rework")
> Is this correct? Seems it should be:
>
> Fixes: a26a35e9019f ("io_uring: make poll refs more robust")
>
I just double check it. Yes we were wrong. Correct bug inducing commit is 

a26a35e9019f ("io_uring: make poll refs more robust").

Thanks for pointing it out.


Do we need to send a v2 to fix this?

