Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598DE396585
	for <io-uring@vger.kernel.org>; Mon, 14 Sep 2026 23:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789428479; cv=none; b=vEnaYOWaQYOpSJT/HUu6iGacAxCfkh8LR1YBsPZpCBFTErxj7uxPc+wuDJg3mumt7cR39FCgGItHZu8ab5iC3GXDICieJfq+j57S9Vd4bDRZ/rZLBQRM1DHGlantfiNf572cM63D2f4UCZlgClA5Syh0omqNBb0trsBs+Fvchek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789428479; c=relaxed/simple;
	bh=V/KXG5wgKR5+vLOkBvwwHlvYlNM7vtiZA4gswTDPhTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YjEu1pJjefGvfRsBWqN9AqZtN8BsoE8uBibKF4XYwdBLiT0neOErBWNdiNc3W+2dRTwWSSrfSIEqZAYAcWv7J/2HcJFwOqgQV5K6lo7q56nnGX0VqARlxRohr0oCrFH2jetXV7S3VYgzuiVXZnfgsxvzFMQfU2CIrf/04PNx3IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=SHhlVR/G; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="SHhlVR/G"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so22344455e9.3
        for <io-uring@vger.kernel.org>; Mon, 14 Sep 2026 16:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789428474; x=1790033274; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDjN0WMFCOSBqgbtPzRrK3zeeUvndcJ2a115299joOg=;
        b=SHhlVR/G+LzHyMFFXyFfqCxG2mRl4i5bKL+5r+tzmo7J2jlmZX/OSMWiDkWOWYHomA
         zGf2Pa1c81MHJ7TjzAD31pdnmL/awbDgjA3MifJAQPpAHOeYt7H5/emdQM8Sr1xLGmcB
         WRri8/xj2Z04PTXp5K37HV6ms9bu+H7aLjCuCAxeysiMSQ6iyigE096Aax3gcWih+AaO
         Zi/U1idmn6k02PzD/VVElNTKoiRDyhQIeyiBPiUUIBqWOIH+ac3Bc8XCzvg4S1PgDnVG
         NP7baGxh7b3B1vR7QVYQcozH1+OcOKF8FtpZfbVS1T/ePXyjCnIwaQDTmgv6Vc38VWCB
         NaJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789428474; x=1790033274;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jDjN0WMFCOSBqgbtPzRrK3zeeUvndcJ2a115299joOg=;
        b=ASF2eSJ3qfmZ/fed46RnVIwklYWweuRgYxoGo/FANK3bnRip4QqrJ+N8Dfi9GFWkmI
         Msn5VFlzuhHe7Esey8ODvx0XctunCi8SLwoMotzf+sElfR3VcgzwdKu5N3lqHEy16SIy
         E6BhynyqMWFAfyfRwuUtBo4FKUrSw0ZhLs44bcQeRuqef+2TJbQw5AOs9vkdOkpKu2fg
         Yq/Z4dwpLK3z9j9i99y0oJLPE851m3TUIH0W1G6agxh1F6lTH8L8ml6gbo2CbbF+C10g
         Lrav19PJ940AlbdpeKCKVIa53nnEYe/k++xd2ARZzTD38xwi21U0++rVE39HUlxETC6n
         cpFA==
X-Gm-Message-State: AFuF++l9ndXzXEY+N+suQptXIvucueeX213vv2fGbsMYQ3513+ZRjmcW
	NZIk4H+r9rKMxlQ8mo3YAuJgcPudlqIrvD3Uvw2KTi+Z6od8sWXGq9wlQIda2S8+exWef4LQD/X
	34Onbbi8cLw==
X-Gm-Gg: AYBFou1g+RNg8GvHE+QjE5xS8ZzP99O64JgtKxiq7TvOzzjbfc4O8eCS+FUl66cxcx4
	fmvdNsM3CuqISGGAVcW+3agfWF/CU7xIr5ba+vJHyotFU6juPeSRGIeYfELNtskkUG3lqG1Ez/T
	ieNBOHCSoSpjLSQ19DkshocxCWsSf5Yqdoz1izEhOSQ9VoqkTkPE+tvAlBZPJquWC/PS15pFTFH
	akpkPZeDO89mJLcztpqRb+YMsMvnUXHrBdgBAoex9X2fdPEdq2VtkuNuHRZFg0+opAAwA2xF7ts
	ZtCEOwUgD8jGGpqMmvkd7eadJHMhnEJLRQRtO/uyhxE7BuMoBwG+TumdC+LP+NphNEBUbYYEiaI
	Xvpv4TtLj6pr/b3sPkmeEfuFdIbzjGJupfUItFwWW/hkF9ZJQhBGL6G99HLiRnDN/6NDIv5qphk
	+bhjGiqwSGo7Ualn9gaY7qGS7l1zK5/deMSQe7XE2ZkQU6LqbZr7R8I7LNqCDHHCrT6OzTvqjTb
	WnAyEU5+arfeMSj4XYUg2ExwfWo11IA5stF5DlGGX10dExj2QVsIf+kKmAA/Udn2VrdmPj7L0y1
	ctBQk7KO/VTBlmXp8KmRK0yqXQ==
X-Received: by 2002:a05:600c:3589:b0:49c:d818:8764 with SMTP id 5b1f17b1804b1-49e7a669271mr67975575e9.11.1789428473668;
        Mon, 14 Sep 2026 16:27:53 -0700 (PDT)
Received: from [10.160.16.196] (150.red-80-32-100.staticip.rima-tde.net. [80.32.100.150])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d66ab6esm25447395e9.2.2026.09.14.16.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 16:27:52 -0700 (PDT)
Message-ID: <74c87cd3-8ac1-46da-a1b9-9149d46b4788@kernel.dk>
Date: Mon, 14 Sep 2026 17:27:50 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/15] io_uring: thread identity handoff for blocking
 inline issue
To: Peter Zijlstra <peterz@infradead.org>
Cc: io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, tglx@kernel.org, mingo@redhat.com
References: <20260911154148.644489-1-axboe@kernel.dk>
 <20260914192243.GA776954@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260914192243.GA776954@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/14/26 1:22 PM, Peter Zijlstra wrote:
> On Fri, Sep 11, 2026 at 09:40:50AM -0600, Jens Axboe wrote:
>  
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
>> task_struct. 
> 
> I'm still struggling my way through this thing.

I don't blame you.

> So thread T1 is doing this blocking syscall. When it actually blocks,
> you hand-over the userspace identifying part to another thread T2, which
> will return to userspace as if it were T1.

Correct.

> Is this really a hand-over, or a swap? I would imagine we not have two
> threads with the same tid and all that.

It's a swap, yes we won't have two threads with the same tid.

> Also, I'm a wee bit confused, why not swap out the kernel stack with a
> io-wq worker and have the original thread return to userspace. This
> seems like a better defined situation. In so far as anything here is
> well defined.
> 
> Swapping the kernel state seems like a simpler endeavour than swapping
> all that is or might be user visible.

I think we'd just be trading one set of problems for another. In terms
of the kernel side, we have the following set of issues around swapping
the kernel stack instead:

- 'current' itself, this is used throughout the waiting helpers. Things
  like wait_queue_entries that use private = current.

- Any kind of sleeping lock that also stashes away the value of
  'current;.

- signal interrupible sleeps via TASK_KILLABLE

- Just like the userspace side, we have a bunch of kernel side state as
  well in the task_struct. Not a complete list, but:
	- plug, for any kind of in-progress IO submission state
	- journal_info
	- reclaim_state
	- io_uring
	- PF_MEMALLOC and friends
	- task_work
	- lockdep
	- preempt/irq stuff in thread_info

- Kernel stack itself in ways it's tied to the task_struct
	- stack canary
	- KASAN
	- vma tracking
	- thread.sp
	- pt_regs

Probably not a complete list, but it's a start... I do agree that the
kernel stack swap seems like the more immediate idea, but I think it's a
harder problem.

>> Folks that have been around a while may remember earlier
>> attempts at this about 20 years ago.
> 
> That was the whole threadlet thing, right? Very hazy memories of that.
> I'll have to go read that back, I'm sure I still have that in my inbox
> *somewhere*.

Right, and it's actually pretty related to what we're discussing above.
The first one was Zach's fibrils which attempted the kernel stack swap,
and then we had threadlets from Ingo which went the route that this
patch set is also taking and dealt with userspace state swaps instead.

> Surely we abandoned that approach for a reason. ISTR there being some
> significant ick there, much like the thing you're proposing now.

Well like you that state has long since been swapped out on my end, my
recollection was disagreement on the API, not the swapping itself. But
also extremely hazy there...

> Not sure yet on how things compare. Will have to dig through that stuff
> again.

Let me know if you find something interesting there.

-- 
Jens Axboe
