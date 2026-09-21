Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A450489865
	for <io-uring@vger.kernel.org>; Mon, 21 Sep 2026 17:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790012170; cv=none; b=PGiuO7aLqeL9jaVDdbWcI30SnqUtIpXUHzdom8oQ533zJqikR8/f2/X69j9DUkigoXS+PC+6ettymM8acEayyQpE6MSR+1XMUTl5oyGXYuQ0T6qrVqQueJ6gE1ktxLwp5wtlkYnP/7HDz13VCbDgZXnoYlFvpzkHT6Ino78z6FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790012170; c=relaxed/simple;
	bh=2V1x5bmrpF/vhKpiH5mf0dEr4dZwjgAvoqn4u93zAfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n/38Ixkq+stQScEJSmJwxexPts07OcCfozNT8P94GYWCJtCfQQmG9Kcdp+HjEBNwrqvOFVSFbt4kztEccFWf9O+Ouf4mjq557IItAMR4j405ZyUtI9FalBwX/O4wYCo0VXqPIa4YkhcF8tEasV9CFNnmpBpb1Ac9bGSzzdBTHAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=AC7tKe1Q; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="AC7tKe1Q"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4b1ba286f6bso71324b6e.1
        for <io-uring@vger.kernel.org>; Mon, 21 Sep 2026 10:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790012167; x=1790616967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQXqx3kypLayD7YI2GHlSyGrESOzJpPnn3LvqeJEGpM=;
        b=AC7tKe1Q/9V2Rd/33TeRhjX9pCRBrlMy/dNS9t6QHvY4n/dp0aM4oINNlupZENQlQ9
         2Vh4Mm9lg7fvpN5hqqDx4b1iysrWXA3rniaooDeC4LQSOOAAEB+w/CZgyrpppGzHw+qb
         OQySTBc15aMAh1d7injCkSsZlfnqLeel9bd0dhqvuipFG5bZEr4ppLgE3JtGXybKurhR
         ngaKX2aAAbUAt5oa/WT7BaWqbewKMjW23B3Wa93fIc6/78TNYaQCs3hMMDY60zVwTDSq
         X0R2uPVLuhAAgZaMwLp/qT5jqAXNhdX4yleztl8TWXEU/EiVvY1ukIBZRz370TCIjyXx
         /32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790012167; x=1790616967;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aQXqx3kypLayD7YI2GHlSyGrESOzJpPnn3LvqeJEGpM=;
        b=aVFbCpvZlUbwwXEIjAN/iZu60V/ODGxeit1SydAlub2eRlXoYQh5nWMdxGL4mFf2uC
         8ZH8Few6RTm2ZuUZeQK5JCVcPhFSfTOaxypOHxn+hQsnwEVa5raRYm3PfpshELP504Wk
         QP6f9zsBw3Cl8TNEi2nOgx1UhJu8+GF1vmpUZj+fsMTCBDYfx7ZwHhnIi3yP7mN7vCLc
         K04XaoaFjgrOAU9F49iAozJIWujrEQ03+QIkUKTrfmkeVJu22MOs6SK4YuETaPmYKb8t
         j9SpvFFLv3vKwcD0lgWFfahcrmm0ZPW2gJ8EnTM8v0EcDA6x8fnQUb1qTuhcexLvrmik
         hmZQ==
X-Gm-Message-State: AFuF++kTIajoftbyGBsYQ9pfrZ8XeWyiYrVYiSu3iBqWL4hhrAV3tWH8
	n2TrvPBgNiEclP7Mkq7LbeUiF5mBlrgQaajQHO7HNCG/EVicSse9XWIPo08vWNFpJis=
X-Gm-Gg: AYBFou2xp88kK1HrG9WN0x1ms1fkjf0ezHFlpCjurFt9LqGznodvL4Q84wtAmaXbSUB
	6S5KyThDIFJIvgB0+htiY/3pnnRGDaBPWICknjRqBeBGzqjwUdbX1PsHZ49U75uk2BtciwmxOFQ
	tpdchBmwUPKRBZj14xVNyiwB/kLxwSX/hAZL9SSRpCxI+7ZmSjDU5xX84/ByQ9pPeLAVPmx/14d
	xYKob/ju6TrVqmE8yenjqsG9ieXvFLGk5juex3Ci1rFmh4H5b55HMJfmYwpHOZAs+RUteKoBCih
	PnYcCDPdKAfCnh4SqT7dcIfzhqXS1p2kaCwIf5k8ebPcAplv8tLya9yv2QWZ48u197h58LPnQvH
	nFM0uQyu/i5Eua2QVgTqL26aDTXa9BuAjJmFesj4Y+l3+lL2K/d5KbB7W14UtTj8Y/fffsxDy4L
	FhBtJmldOMZFzX32f7AcSVs+qzsZvYa+A45fuJQ12M6Ruv+1vuNewy0P6rmT0tdpEVa/QzWrbmT
	rTtvRFAsF9mvO3JMbwOzRkYuQ==
X-Received: by 2002:a05:6808:150b:b0:4af:aaca:7be3 with SMTP id 5614622812f47-4d43708da96mr333033b6e.12.1790012166717;
        Mon, 21 Sep 2026 10:36:06 -0700 (PDT)
Received: from [172.19.0.10] ([99.196.129.128])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d422effcf3sm704029b6e.6.2026.09.21.10.35.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 10:36:05 -0700 (PDT)
Message-ID: <9ca64fc2-c1b3-4978-8610-0c844ee6238a@kernel.dk>
Date: Mon, 21 Sep 2026 11:35:52 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/15] io_uring: thread identity handoff for blocking
 inline issue
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, tglx@kernel.org, mingo@redhat.com,
 peterz@infradead.org, Oleg Nesterov <oleg@redhat.com>
References: <20260911154148.644489-1-axboe@kernel.dk>
 <87a4pdami2.fsf@email.froward.int.ebiederm.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <87a4pdami2.fsf@email.froward.int.ebiederm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/18/26 10:33 PM, Eric W. Biederman wrote:
> Jens Axboe <axboe@kernel.dk> writes:
> 
>> Hi,
>>
>> io_uring issues requests inline with IO_URING_F_NONBLOCK and punts to
>> io-wq when that isn't possible. For a range of opcodes it isn't possible
>> at all, as there's no nonblocking path in the kernel for them: fsync,
>> statx, openat, the *at family, xattr, fadvise, splice, etc. Those are
>> punted unconditionally, and the punt costs a thread wakeup, a context
>> switch and a task_work completion round trip per request. io_uring HAS
>> to be cautious to prevent accidental blocking in the kernel, even if the
>> operations predominantly never block. Sad story. Examples of that are
>> things like an fdatasync that doesn't block, statx that hits dcache,
>> openat for O_TMPFILE, etc. All of those would've completed inline just
>> fine, but io_uring just cannot rely on that.
>>
>> This series issues those requests inline in blocking mode instead, and
>> only pays for the offload if the request actually blocks. But by the
>> time it blocks, the submitter is deep in the kernel with the request on
>> its stack, so the work can't be moved to another thread. What we can
>> move is the identity. If the submitting task blocks, an idle io-wq
>> worker takes over its user visible identity (tid, signal state,
>> credentials, scheduling attributes, cgroup, user register state),
>> finishes the io_uring_enter() call and returns to userspace as the
>> submitter. The original task finishes the request as an
>> io-wq worker and joins the pool. Userspace is none the wiser, hopefully,
>> the same tid came back from the syscall, it's just on a different
>> task_struct. Folks that have been around a while may remember earlier
>> attempts at this about 20 years ago.
> 
> I don't see anything immediately wrong, but I suspect I am just
> not looking hard enough.
> 
> In my time working with the kernel I have never seen anyone actually get
> this kind of thing correct.
> 
> The handoff that we do during exec has a bug with posix timers that
> I think is 23 years old that we just caught, and still hasn't been
> merged to Linus.
> 
> There was the old daemonize call that got it wrong so often I added
> kthreadd.

I agree entirely with you, which is why this is (deeply) and RFC and I
mostly pulled it to (some notion of) completion so I could run some
testing and see how it performs.

> Maybe you want something like the old solaris doors, or vfork.
> Perform a synchronous task switch to this other thread, and call this
> function in the other thread.  Then block waiting on the other thread
> until the other thread blocks, or the function you called finishes.
> 
> Is there a reason you didn't try and do it that way?
> Just a synchronous switch to and from a thread in your thread pool?
> 
> You aren't changing the mm so I really doubt changing the stack pointer
> and a registers will be that expensive.

And replies like this are also why I wanted to get it out, because I
think it's a problem worth solving, and it's the best way to solicit
ideas. I think there's some potential in your suggestion, let me try and
dig at it a little bit and experiment...

I'll be back with more details.

-- 
Jens Axboe
