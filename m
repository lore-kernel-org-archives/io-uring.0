Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7AB405AAD
	for <io-uring@vger.kernel.org>; Wed, 25 Mar 2026 17:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774459629; cv=none; b=hY6Dfu+qYQ6p3wJMpwd4u89iC0LeTN8JPkc+TfZhbMYGW0RCbBy7gWaGfokm0xMkAMsiy+NthTO/kKYpXRHSaNknxLAUgGYlajyvp2ctH3/9P9xt8J1NDxm+ITnIWm7yY6U8yI6QDJDSTG7aDGR+Zd+IBNO/uTzx5OpkHpin4Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774459629; c=relaxed/simple;
	bh=IA1WZUi4XCVGr84W+CmgQqvzPsLMfq4WEyCP59MHXmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eG5vWo28VnDvwZqfuA7qyn2xny+C1SyHFpDW5dhTgeX7NaAy6q0vzw9S1InbQyO/KrL6ucXKe30ZnT7apzOD0OwF4gPknbu+EKlRyU1Cl4tXazM9aaGaDNpVEpljgJuxWDjAqO9zEHvSJfhcY2UukbjR794FARwzOmC8WlvJDCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=rWGepbMH; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="rWGepbMH"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4670464029eso20799b6e.2
        for <io-uring@vger.kernel.org>; Wed, 25 Mar 2026 10:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1774459625; x=1775064425; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W55kRY8k4dYWgOlUe03j2+o3wLziWl5X4vpeQzcgyDw=;
        b=rWGepbMHClos57qgDDK50V/ybmPTw0MJcT3g1oPH0LuF/vBGixfZPiMMaVc/Fo3bXi
         YQtDka4lD07VDJL1nHVSUWC8bkNt7TeXxac/cY+V5TUFZBozuCRnlBg4qeo7+DQSVaIY
         b6OX2Rl26bjwCs/5hMWrb8Zmv+1VdqI9Bn1MK5c1g0fQfy0vCkkd+NSfubMxCe+ir+t9
         S+wpDmQzqimm90VUVEmwX28zF0IFVru+XwimMneMQ1bzPRaNEbCA0OSm0PSbKBm9p4Am
         HANZgH/OtzBTfyLKNrqnDOlps3kpvhoALzs1qzXitXg9MT5gYdZW+/zRUO1pwGvTmmT+
         JFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774459625; x=1775064425;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W55kRY8k4dYWgOlUe03j2+o3wLziWl5X4vpeQzcgyDw=;
        b=cTRLeCa3DRUNKds+s1wOR/KSO1Z87wbJT+24ZAIV9d/grHRxxV8iiP/R8cSKrSb2lZ
         By3egvWKCVuFw8t1+ciN3tkYl2ZTCGnfN6XqML5pMd0w9cBmYDTalrd27hL0wPu46TvM
         3Igg8MpJTlLjwJv03E6X9+Db/Wa3ORHbtyrjHgrV5Qxjy0uyqxyMoxvM4kHSL1Mw6jX2
         Ds2SSElZhyDpixlvQgXK2JJdT81c2ig0C2nCkkI0cT6tO1GBLx9uihoZfzcBfRWv5+RV
         VaRemed5p2skacZLHIYSf+0V8ue7xA0O18k4fGCKWOOzCJlmX5oCYDsdzwO+R9v//tfQ
         2Qow==
X-Forwarded-Encrypted: i=1; AJvYcCWH2dtNG9V7akxkd7evsap2Y+yOmqah5fs5uNKSRxhVaFVGQHej5XOmRJVyqF23GK1LOxHyVDmGQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YydyaByhEfexbKvI5LhMfVxUoLbp1z84UvztVaJ3DTAdpWuACgm
	N3PEGagpUDnb0eYG9W45/drxqUWK4zB5yma8CZ+NVdIRimDIJrorI0Weh3/eC7qdwqM=
X-Gm-Gg: ATEYQzxZHVCF/HjydP7k7myj8VUVoRKUDfkWzYRaQsLYlZQbXU6ZC/BvXYOKH6g65wu
	an/9YvI1+eLeJxiMNQijPFbgqSOYsHiEpFyZSXeYNl/F5avmjaiMBADmQT/qTNcwxLckpeDukjT
	sHiZ61r5Mn8G/1YurnVxZcoJkWbU4noBhiU8WA0qZQHGz1c0t2owF9Q4CnO71a+9pjjKmS6Ches
	KNBqxiPZ58DY4hBmLVDUumMMvftktue7EAmxtYmpGSCWNkXZxCp8xUOGN7tgMY0DAveFvs3LBM6
	NE9DmYNz5BKi+Wbuqrh6FV3Zldg1dQu+tEp43hA1cY3cou6UYdbAOE0XZKcn92ylA0ls1a6vX1g
	k19xcGMloLUjnz3MTaFO83uP63scs9HTx66QUp0R8F/Osbn30VORtJBoqwZHIresxzpRzGtt5HU
	NAxNHTGxex/7OriXDWgvwrKmug5wm4unPkKvpyYqbxx7rl4O6fHVoaJF4e5v7wnyLPinWjT+k/D
	qwJ4Ps2
X-Received: by 2002:a05:6808:4fcd:b0:467:91:fb26 with SMTP id 5614622812f47-46a5c70e438mr2209344b6e.37.1774459625666;
        Wed, 25 Mar 2026 10:27:05 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46a70aefb70sm78480b6e.18.2026.03.25.10.27.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 10:27:05 -0700 (PDT)
Message-ID: <147aa05f-2e03-4d0d-a86e-b145913d8584@kernel.dk>
Date: Wed, 25 Mar 2026 11:27:04 -0600
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
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CAJnrk1Z1n2xTem3xoP9oGDsJ3o9wPO_CfQ1GQy+d3ggLXP-9yg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/25/26 11:24 AM, Joanne Koong wrote:
> On Wed, Mar 25, 2026 at 7:56?AM Jens Axboe <axboe@kernel.dk> wrote:
>>
>> On 3/24/26 4:14 PM, Joanne Koong wrote:
>>> diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
>>> index cf5638406a0c..c706324fd66d 100644
>>> --- a/io_uring/rsrc.c
>>> +++ b/io_uring/rsrc.c
>>> @@ -1182,6 +1182,24 @@ int io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
>>>       return io_import_fixed(ddir, iter, node->buf, buf_addr, len);
>>>  }
>>>
>>> +void *io_uring_registered_mem_region_get(struct io_uring_cmd *cmd,
>>> +                                      unsigned *nr_pages,
>>> +                                      unsigned issue_flags)
>>> +{
>>> +     struct io_ring_ctx *ctx = cmd_to_io_kiocb(cmd)->ctx;
>>> +     void *ptr;
>>> +
>>> +     io_ring_submit_lock(ctx, issue_flags);
>>> +
>>> +     ptr = ctx->param_region.ptr;
>>> +     *nr_pages = ctx->param_region.nr_pages;
>>> +
>>> +     io_ring_submit_unlock(ctx, issue_flags);
>>> +
>>> +     return ptr;
>>> +}
>>> +EXPORT_SYMBOL_GPL(io_uring_registered_mem_region_get);
>>
>> This looks suspicious, but I actually think it looks suspicious because
>> you add the submit locking around it. For patterns like that, it makes
>> the brain go "hmm, what protects this from going invalid the instant
>> io_ring_submit_unlock() is called??". But this should be stable for the
>> duration of the ring, hence the locking should not be needed at all?
> 
> My understanding is that once a memory region is registered to the
> ring, it's registered for the ring's lifetime. There's no uapi to
> unregister a memory region and my interpretation of the last paragraph
> in this thread [1] is that unregistration is not intended to be
> added/supported. I think the submit locking is needed in case another
> thread is currently registering it so we don't see partially
> initialized state between ptr and nr_pages (eg if the caller calls
> this from a task work callback).

Yes good point - can you please add a comment to that effect? Both why
it's safe to return this state outside the lock, and also why the lock
is actually required to ensure we see a sane state (either region fully
registered, or not there)?

-- 
Jens Axboe
