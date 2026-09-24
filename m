Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B19B41836E
	for <io-uring@vger.kernel.org>; Thu, 24 Sep 2026 23:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790292781; cv=none; b=N97/3uhS9tuuDnWrB6X+x0jAE/9ZMs0oTM0gqCSIJuyS+Xf66XOOlNNeQvSC7Uq/IwEeudn85laNAgWxZdHk17AlH26wJdVt7UZYhqAqgMy5TA2zWN/pEwImFCwJ4zpW6QoUvkbnlUsJLlEVjRjkIUVl00g7eolePLHmTHgGbrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790292781; c=relaxed/simple;
	bh=kTnPWWQ2BIcJljm1EN+fW/0QPHIPCTLuXWEVNgYv8HY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=eceOGZ9ymOWD4CM2mclfVpd16Fd49WV2/oVpvIIRQpkdsMpsHMYPhExEiM2pQzSWLWy/zwMclb/NuPDwsZRqna6l2Sv5vOBaKZzk0TK84FMlZSpzMHkQxm7h+ynujIvWSB1oeQpZ1uYvJ2EVNIyRXjh/YS6UPbghI4dN9i61974=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=NaWDhvoR; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="NaWDhvoR"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-33b9e805130so175666eec.1
        for <io-uring@vger.kernel.org>; Thu, 24 Sep 2026 16:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790292777; x=1790897577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LXZmjhFB9CuarkGAqk43Kn1bH+0V6owkhXtkgSKcCIE=;
        b=NaWDhvoRmhXhgoBA3nw2GcHWlsN2HsivhYh7p6l8U9jBBtwg5zLviEK93dTjeeK7cJ
         qtzrFvX0hhiejFhJd3+clIkDF+l8fiILibhuNLArnJnqJLr0otmVGTvOP4mFI6bOwEIk
         FmqE7Hp/05j8VDMvwpnRZ8XT241ctQRLmkk0uMZJ4dyn4BAO6+HHlP6ROwabjMv+pCg6
         1KBzSqmvXDexEcWhARfHnU/z9bw+5NTWm/edlETCNm2VnMpBa+YdStIrDXnsvDPkRXFu
         EdSlLm07IBE7TECRHFjnZVVgoETqT8oGNfD+8Fr0fRKZqMj5+YveQQ8oX8bJXtJ83DQ6
         X4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790292777; x=1790897577;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LXZmjhFB9CuarkGAqk43Kn1bH+0V6owkhXtkgSKcCIE=;
        b=2JyDz089EZN/vbAxzjgZYdfG0Zz13a6SnvzudsuZrivJlUeqo4jbEuEyHvd+t18BBY
         cot1WpoW48gzWQ2P4sWfUxR4jg+HyaEY7RHsHiVwqOpX1Bka88I5i7D5xAjPaAtxd1z4
         U0xAn9K5y4CEFyIxivLa7L9oY8CVVkviR4g1qimrqSNd+hDiWjN87pFyupgUWPhEBGke
         AofOpNPeO8wxasxGbcs6gxUVfBIs5zphSP+8Jr4KwkbrboomqstAj1UTNnr7apG1bGpV
         AoNcSQx3RiUu5QeAKHnlubnz3XM1XMiswuLc3S7FBJGyu5idrcSXJsZoqOIIi0TKI7uh
         ZzQA==
X-Gm-Message-State: AFuF++mBaV7Kq39wTYsTgRkI1taGMIam89xqglA4v0K2zGqDXjBfiXPM
	r8x4S/DeeYxgJY0CXcZ7R8dXnWMTskriohGaPdmYYbUFhjAksQu+73ItI884za3aDphj7Hxgd1p
	Z0RR+zig=
X-Gm-Gg: AYBFou0mxWMRLe7T0xGxx/0M8VShfLgtH3BvFFVNeXZhXs7OLyhHTc15CSeaH5AsuDc
	/h6lro9X8Pem4BesfkWO7oj8pLjs8LdTdfm3wMBxgmmddOsvgdSDNQLOJmO/7uqTO4po8+paNXV
	K9xxUQ4yC4bbPc0EJgBoj2N0oJtGGPuSrKvCjjQyjXbwMGtytGnizkke0FrWhP38kvQjvYfqrLi
	yRQyC+0VhzVAeDyErSxm0a1hpBf6GPjN4wvf+zJDZ2xinipzSmbQ/sQdkZ/pShMEkOoCPyDKL1U
	rjCZ59LA9AEtzZxTOb8MvOFg3Zu3Vgxf2Q6VSIeNtB1qK32a+AvLucBZZXCDFw8W4DDn6Uhwf+q
	6ptYDqUrSP4evVA9hRB3BDBFOLS+6f90VT5s163x65fgxFmDFVmUzxTwSoUcsy7VU9dxkQERYre
	tULrIP9/n7tDjKf9nMPgUgPM5bHi4jSkZaBT3PVGIumEUFL76ZAX6Svtm71pqkJbtJFxmigsXBX
	xVlcSHFgoxQR1VOcNb8IOy8Er7SGLTHdMCYHdwHUNu5emZ7cR9F6Tk=
X-Received: by 2002:a05:7300:c88:b0:33b:b4b8:ac57 with SMTP id 5a478bee46e88-34006772e80mr5319034eec.29.1790292777252;
        Thu, 24 Sep 2026 16:32:57 -0700 (PDT)
Received: from [172.16.11.208] ([4.39.28.114])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144172d8asm1607341eec.5.2026.09.24.16.32.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 16:32:56 -0700 (PDT)
Message-ID: <39b2bee2-84d1-498b-a5e0-1f2307bd31d3@kernel.dk>
Date: Thu, 24 Sep 2026 17:32:54 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/sqpoll: pin task across task-work publication
From: Jens Axboe <axboe@kernel.dk>
To: =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <Jeremy.Jean@oss.cyber.gouv.fr>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260924205056.3759980-2-Jeremy.Jean@oss.cyber.gouv.fr>
 <096d996d-3028-41ea-bf0c-f7eef1281fcb@kernel.dk>
Content-Language: en-US
In-Reply-To: <096d996d-3028-41ea-bf0c-f7eef1281fcb@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/24/26 4:59 PM, Jens Axboe wrote:
> On 9/24/26 2:50 PM, J?r?my Jean wrote:
>> SQPOLL can consume a request immediately after mpscq_push(). If this
>> drops the final ring reference, ctx and tctx may be freed before
>> io_req_normal_work_add() finishes using them. KASAN reports:
>>
>>   BUG: KASAN: slab-use-after-free in io_req_normal_work_add+0x439/0x510
>>   Read of size 4 at addr ff11000000ca0000 by task repro/55
>>   (...)
>>   BUG: KASAN: slab-use-after-free in queue_work_on+0x25/0x70
>>   Write of size 8 at addr ff11000000c3bd00 by task repro/55
>>
>> Handle SQPOLL before publication. Pin tctx->task, publish the request,
>> then use only the pinned task so the publication tail cannot dereference
>> freed contexts.
>>
>> Fixes: af5d68f8892f ("io_uring/sqpoll: manage task_work privately")
> 
> Was going to say this isn't correct, as the mpscq is newer than that.
> But I suppose this already existed before that, with the previous switch
> to private task work for SQPOLL? I'll dig into that a bit...
> 
>> diff --git a/io_uring/tw.c b/io_uring/tw.c
>> index f573bcc3af6a..2e37a3fd7a33 100644
>> --- a/io_uring/tw.c
>> +++ b/io_uring/tw.c
>> @@ -210,6 +210,19 @@ void io_req_normal_work_add(struct io_kiocb *req)
>>  	struct io_uring_task *tctx = req->tctx;
>>  	struct io_ring_ctx *ctx = req->ctx;
>>  
>> +	/* SQPOLL may consume and retire the request immediately after push. */
>> +	if (ctx->flags & IORING_SETUP_SQPOLL) {
>> +		struct task_struct *task = tctx->task;
>> +		bool first;
>> +
>> +		get_task_struct(task);
>> +		first = mpscq_push(&tctx->task_list, &req->io_task_work.node);
>> +		if (first)
>> +			__set_notify_signal(task);
>> +		put_task_struct(task);
>> +		return;
>> +	}
> 
> There's no point in having a 'first' variable. LLM's love bools...
> 
> 		if (mpscq_push(&tctx->task_list, &req->io_task_work.node))
> 			__set_notify_signal(task);
> 
> would be better.

Thinking about this a bit more, I think the following fix would be
better:

1) Add a guard(rcu)(); in io_req_normal_work_add() at the top, which is
how we handle this for DEFER_TASKRUN as well.

2) And similarly, expand the synchronize_rcu() run in
io_ring_exit_work() to also include IORING_SETUP_SQPOLL.

I think that's both a cleaner and more efficient fix, rather than fiddle
with task_struct references.

-- 
Jens Axboe
