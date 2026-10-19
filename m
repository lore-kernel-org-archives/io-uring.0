Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792444962;
	b=p+ABfoWoA7ssNqfhXUF/8BHXX3/Ku1LJbb6Oa85DM0M7gGu1NTEmfHhY4eR0Wlx61heF
	 MhCmSWUnJaOx5rS0Qi8Ukq8zL7t1ZSJLZkVIwhg0HHtjshgyUcAmFqyONudh5mdPC5uwN
	 zhDJ08PGoaJeu5t7PodkSzZqIbYw7L5kIMsl1fe3MzzDTRYsEq/KNOOrRQhQk72MxmHIh
	 wGJlyAqCETE+xYCIXzRZu05fyazCrMTIQs9fwWcgpsScVaU92I5/2BlzMkGz4W5hvT6ud
	 hEDDxJkwtQVpc6JATKIOpIxND9e/SjbDPKYQJstIRMmX5w38bYCNs0xdMeBrUqzWyHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792444962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=CEb54PbMcZ4QC2hOQFDpn9YXBC5p2LNF1QebXmTTnaw=;
	b=MV+z92BMOaBjTMnUTjAyEz54B8bxvpNDKNkeIxVhQ+xqv/E6TrEwhqb4tmaLkCroLhHc
	 JXRNJW8oT2Arv70ySPWrKthoODnpyR1UAxDgbNl9CM/7NW587u33xPvkxO07oG1YTARQA
	 f9iGCt+DKZT+xiEr7aLHpQXdBmN/P7JCPHMQYfFBo4kZMxHSN2Zxkr2CgiwAwbStaKn3D
	 5/VINMosr24HkZMzp0MWnWmWR21dukFs9I5rMR4tXGnkDh6A3Jaf6sdWGuKvUQ9ETvZM2
	 XrhmxaH5desr2qnOaeThQ4AZJgWrbZH7p4SVMCoyX3LxAPBKSIChw7mIKDQKz4qDa5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=crQKpPzk;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46459606A31C
	for <io-uring@vger.kernel.org>; Mon, 19 Oct 2026 21:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46459606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=crQKpPzk
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-82380b0f55dso1175003a34.1
        for <io-uring@vger.kernel.org>; Mon, 19 Oct 2026 14:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792444960; x=1793049760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CEb54PbMcZ4QC2hOQFDpn9YXBC5p2LNF1QebXmTTnaw=;
        b=crQKpPzk4HbGrVKiuAlEdOyeK7Z+qQz5C8fVvQQ/dJQ+687M5eYHFURY+QuLZMNrE9
         74mVHPdEucO20wUp6sZifiVrFukZyp0kcbqxmTDABgkCJ7Yph56xWNUwA/JgfmqUSlN+
         msWIhZ+DLsA9DtwsT4J2vo7Y3ZPKdRxgO/uoWOZ36ylEZQSpUCS/lPHtWbJ+Ub/v3y86
         ebf/Zeie1KdqNQsVLyPPHiN07FP/PGZujHEJkEHXWhwjRDrVMcPIgMFSbU4lyAY/5Gpk
         X6aP1Gu4m6bqpRcDqF1/QNTodn208biEzKdDvX9uNudWH0DbNW19O1aamsBIaYu9NUa/
         wGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792444960; x=1793049760;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CEb54PbMcZ4QC2hOQFDpn9YXBC5p2LNF1QebXmTTnaw=;
        b=Rz07sVGecHTD60zsOfvJZMxvN9L+EfGZl5vXHaiK+mW2tZueEx/PePIpte636r7121
         lDSB28A/pOnUKxU5a8iz2c9IsiofNVh6/wky3lK2yoa7151DcBFTuBNlABhO67TxbBB6
         Li8K2Voj8btgDlm50HTjwM2C87XOQZcC5bcEAnOA7c/6qp1JMUhV5dlqgKbZf1yQWOUE
         qoPgd4Whgobfu0Ot4pcVzqti5Fjdeg0+sTShvYzE7L6vF54YJZbKfNI/EG1b76OWy7bO
         dnUTmkmao2Rs9hMwDyeQFYrfv+64bBTUOrx+wNxMeRAjmBPv7wggGZTpn2A2qkqjOQ4m
         vSFA==
X-Gm-Message-State: AFq9FYIiM7yOXfNWbsCW7awifGMVSUlkm4auEE2IJ6gv2jn4CsiinIpY
	3GDsr2QEfF6ZiOIBqT3jRJc0upzPtXIFnVYD+r0/VR98LW8uPz2EvLeHH4AOHAbEgijN6Sk9eRv
	H6eQUwq0=
X-Gm-Gg: AYBFou0Joqxek1PgGOxWswNNyegmwgvAzAAwArCh24fetGqCX+bugakP9/KJAaqyAS8
	DG85IS9uQVqt0pfB4ddM7SYi8IHLuCi5+rQM4xFw6HKRpvIweIChhuwrDLDLNwPlMLhIJxkC/Ju
	e8G85CkEn0McNDYnHsFwlJA4wxD5bQLsjH76sCrfw54H/2wtwyxm9pPYLJnjlXzOEjAhRwuUpXB
	hPqWFUXjyVv0Ho0EYlIQbYqt0k4bw3CFK/E3B3fPpTh18O00lvkYWT5akwVY4v2RlnUUSJMjMQv
	E4wulC5ueC4GpWGeG8q5Ckj+shGILj+JNKJiUebKT4WypCQ0v6kmYvGvERcO4mz/czXLIFSm/vf
	P7l0zrMkoYYMkGmZxrSZAIr2lbZ2E1/HpDBgupK4+/FGXja8Jlg33zZlIU92NY2L063IrrCXNTY
	tMaeSTdfcL/lDL/ytBwDPqpX5AjjzxOH73LwnUKD9necUO8MUAgnhXW4LTn+qBOw7YGuXahN6dt
	ikDAjkqNwvmGh6HhLfL8vLhIU4BX0wKuXk6WvbIkMY/FKc4+h4yU48l
X-Received: by 2002:a05:6830:67e3:b0:821:a094:b26d with SMTP id 46e09a7af769-844ff9f4095mr9582081a34.13.1792444960202;
        Mon, 19 Oct 2026 14:22:40 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8438ce16e37sm10588561a34.13.2026.10.19.14.22.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 14:22:39 -0700 (PDT)
Message-ID: <956e10db-bcc1-4e6d-a0ce-b5f5fe25354e@kernel.dk>
Date: Mon, 19 Oct 2026 15:22:38 -0600
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
Subject: Re: Question about asynchronous blk-mq tag waiting for io_uring
To: Maks <mi9992828@gmail.com>
Cc: io-uring@vger.kernel.org, linux-block@vger.kernel.org
References: <20261008214137.1267424-1-mi9992828@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261008214137.1267424-1-mi9992828@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/26 3:41 PM, Maks wrote:
> From: Maks Ivanov <mi9992828@gmail.com>
> 
> Hi,
> 
> I read your comment in liburing issue #1492 about callback-based retry
> when storage tags are exhausted:
> 
> https://github.com/axboe/liburing/issues/1492#issuecomment-4696489936
> 
> I'm considering this direction for my bachelor's thesis and would like
> to clarify its scope and design.
> 
> The initial scope would be io_uring direct reads on raw block devices.
> For requests without explicit RWF_NOWAIT, the mechanism would register
> a continuation when tag allocation cannot complete immediately, then
> retry submission when a tag becomes available.
> Explicit RWF_NOWAIT requests would retain their existing
> behaviour when tag allocation would require waiting.
> 
> Could you clarify a few points?
> 
> - Is this still an open direction worth investigating?

I think so, yes, as it'd avoid needing to punt to io-wq. Which
is ALWAYS a good thing.

> - Is there related work or an existing approach I should look at first?

Not on the block/storage front. Basically the tag waiting is just
a normal sleep operation for the current task. The alternative
would be to add a private wait_queue_entry to the list instead,
and then retry when you get the callback.

> - Which layer should own the continuation: io_uring, the block submission
>   path, or blk-mq?

Just spit balling here, but it'd be an -EIOCBQUEUED operation on
the io_uring side, even though the operation hasn't really started
yet on the device side. On the block side you'd need to handle this
at tag starvation time. Right now that'd put the current task to
sleep, and then wake it when it can get a tag. With the callback
approach, you'd need to be able to tell in the blk-mq sleep side,
and get access to the wait_queue_entry to use. On the block side,
this would be a 0 return, just like if the IO was queued.

> - What lifetime and cancellation constraints would such a mechanism need
>   to satisfy?

That requires a bit more in-depth analysis to answer. Presumably
the wait_queue_head would have the same life time as the io_uring
request, so if a device is ever torn down with IO queued, then
these entries would need pruning too. I suspect the block side
probably does all of that already, as it'd need to wake tasks
sleeping too.

-- 
Jens Axboe

