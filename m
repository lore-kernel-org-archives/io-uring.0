Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793022401;
	b=qw0PNfVVMR/NhLtFP0f2DbX/xHhnkH8k6diifBwI4jOu29YMdEBf5GWaod+wR5mxKxCS
	 m42zzXO++OFe/8J+mWFaMr8CrLShRwBP59bW19vMcD85e9qUPhLQiuOiX5X/bBKiOu71h
	 xNIAg1iEHBuuASUXqKXAa5jn9hu+dTqkXJWjYWN19sOURekrZLJ9GSW3uXUFYFiIQB7td
	 stnAvbwCXtgk239+PtZvad8hZwgKhtSDfgRavJxR0MFGryQaqASJ/b7ZUzDIqMS+myCZI
	 s/9DucmBlDU5u9wLKB02wWaTACLDMroXWedp9xvPJbOw7IjgZh3i+K9Q/WJgu7Sjl4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793022401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Up25sXPkaIo4f1R0s9btJjt4RYr7oIm0MDexn6UlXds=;
	b=S8G+apUNYOM6OYZL/NE3B6j1vTSUh2EXlwjXXCznf2Oj+ztdjY3N8tK0nDlDa9Qmxu7a
	 f6nz9XlyIPztF2nJ9AMyEPLcM0E/mzmZM9TzwgWRdFdZLnjXoAM/rarR4QrLjqaYKKzTl
	 ZzUw25z8tm1CTnFZSorwYOW7FRP7nXVuqVFIYMrbGrojKeJyCi8pmgcqvINx6qFZW2Etu
	 quRlLh13R/i43k9pRchVdnNmg/qpS0lPtB7DdlIqLZZgVZmQBB0TV8lYitMHP6pmpEnnb
	 SubHoPG1qsHNzfrlkZvO5ferL3vMe0AOjYjv3N478fkQQTBURTySWxJ8TWWFxQpoBtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=FuPOOeud;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85AC606A337
	for <io-uring@vger.kernel.org>; Mon, 26 Oct 2026 13:46:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C85AC606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=FuPOOeud
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3514b90bb89so7051717eec.1
        for <io-uring@vger.kernel.org>; Mon, 26 Oct 2026 06:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1793022400; x=1793627200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Up25sXPkaIo4f1R0s9btJjt4RYr7oIm0MDexn6UlXds=;
        b=FuPOOeudMdxFdMiodw/MS6s9zJEnPZJ6uL6kpUeogL28WlaBKf/pe110zinkDVVA1X
         lB4VHJMC0rtDNiPMbfxfmkfb4NwbWF8XY112th6SqvdZi6fKDIM0t5zwI9KS1orquvGf
         8ygdvtu6gICp6KqRx4Uj5XcnCaRc0d6vtT0XiShpwg9tLNxjjYZvTyLXOi9OEIJYovVo
         rjyOkVUvecL+qT5SRGaWtMjusGg2YmwjWjZy7r8BD7Zk8N9NsZ+lZ49WB+3TjORF2Pyv
         5ikt3krTgViuFFh0+CwHIB6XoqUe4+lUOXySwKgAhnFx6ML9sLzp54f13WmuVKteL5G1
         GavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793022400; x=1793627200;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Up25sXPkaIo4f1R0s9btJjt4RYr7oIm0MDexn6UlXds=;
        b=Di3hAzQTV693VrYdJ4Peg5z/enT9cf/iaWb8LBTpFsi7R5b+vth1tz20ItNRRrF2N2
         dlXj9nD8CnnzvwnsGaAFO1e9HysKPepJoy7SqLzgAc0fp7BX+mNIPDwNxwTsnXlbbdpu
         /wm9mju9DRMDd7iEnoVlsaedxjLlHeKn1kCp+nhkeu1qKoWa2AX9P6+WYnsIGC/IGr73
         a+55DsxGFbSvbzl+fZlzrLJFpgo5HFlsNvGA1pN8GieX8a0+U0tvB8ufwhuUdyYshd/N
         6Y2hfu4xp7BSoOlo1iFRa8SSpW+dzpNCx8rWNwSmPI5idH2ov5EkHyTmAi4Ku0VJq17a
         rzjg==
X-Forwarded-Encrypted: i=1; AKwUvBzghuIIzv8kh92p/aA+djvXZkGTPmTRbroDHLYGPj5quVhM9WV9BwMkjxFw4xvDN4U17ODYFVYgwQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYId0EHYRV87cEGb/58fq0/t9WCYLYvQrNfJQJLiotACVla/FTBh
	YYCfsvS26rxHuqd3rYjd2vXkiIshoMs5FUvEthGlKJ+EQy+5dmoJz76iYJphQRw/Xd3edooFqL6
	YONu/7Xg=
X-Gm-Gg: AYBFou3Eh+I6+mIkbB41tbXeTc3jZW++IqA6B9XLmxm1gtqhTRAWGYLh/yJfM7C80Tk
	k6tLMVPCuEuumswh0FM855x+q4LWviZVtY+cmHWrX7giOQnelzMAQqyF/p5rbZ+zcc7tCjLEH6Q
	QNEits8liGA+9aUi0e1Hxc8i0yPLLU7kmiNY6ERfSJ9pvQaAEOaio6hl9FWr+CzHBxkM0loxvx0
	rCn3fgrNYQo91fO3yFSLd527/zGAB0WS3FwTntIM9HCtl3YjJ7jMQano+AKBCDAcyINd1zF7BrV
	1aU0GGFhBG69LRuE2luNdawM/yyp7ukkox26BQZ69kN9YS0ghgijZ1kazTtKGIwSK7A/EM8lKZ/
	7i2uD2MpjhiRvg+uYsFeIt6F1J6hh5uB2cu99m2aXcahKb6f/7XbE7m4MlmNAxYOXVJkUJn9JEe
	qnmQ7ul+T4+TDXMJXrpeBI3nZfTs1jXhZkcqYR4+kAGubKZyvByUo6BZBnWid/i5o47qapXpmKn
	wExR9PB8TxpV/kdQBm2HJxxXJbnAEs8A5g09lG1Rdr1MJplF4KhVIBz9hRG4wFztZJ5s8lRZCu9
	meaA52QN8ckhHCOFnjj+fRQHqMS1tzBu5dV6eKM=
X-Received: by 2002:a05:693c:66d2:10b0:35d:95e4:267d with SMTP id 5a478bee46e88-369e84bdd3cmr10806008eec.27.1793022399307;
        Mon, 26 Oct 2026 06:46:39 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a005c0188sm11976378eec.9.2026.10.26.06.46.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 06:46:38 -0700 (PDT)
Message-ID: <fe5bf816-815b-4a81-b765-2ed36cdd3168@kernel.dk>
Date: Mon, 26 Oct 2026 07:46:38 -0600
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
Subject: Re: [PATCH] io_uring/napi: drop the single NAPI busy poll special
 case
To: Cinq Prairie <notprairie@gmail.com>
Cc: Stefan Roesch <shr@devkernel.io>, Jakub Kicinski <kuba@kernel.org>,
 io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261025232926.17944-1-notprairie@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261025232926.17944-1-notprairie@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/25/26 5:29 PM, Cinq Prairie wrote:
> io_napi_blocking_busy_loop() has a special case for a single registered
> NAPI: it passes io_napi_busy_loop_should_end() as loop_end to
> napi_busy_loop_rcu() and runs its own loop only once, relying on the
> inner __napi_busy_loop() to spin until that predicate says to stop.
> 
> napi_busy_loop_rcu() sets NAPI_F_END_ON_RESCHED, so __napi_busy_loop()
> also returns when need_resched() becomes true. io_uring treats that
> return as the end of the busy-poll period and falls through to
> schedule_hrtimeout() for the remainder of the wait timeout. The queue
> is then serviced by the gro_flush_timeout softirq timer instead of
> being actively polled (when napi_defer_hard_irqs/gro_flush_timeout are
> set).
> 
> With two or more NAPIs, the inner loop runs for a single iteration and
> io_uring's outer loop controls the busy-poll period, honoring
> busy_poll_to. As a result, the same registration behaves differently
> depending on whether one or multiple NAPIs are registered.
> 
> Remove the special case so a single NAPI follows the same path as
> multiple NAPIs: the inner loop runs for a single iteration, while
> io_uring continues busy polling until a completion, a signal or the
> deadline. Since commit df8599ee18c0 ("io_uring/napi: cap busy_poll_to
> 10 msec"), the deadline is at most 10 ms on every path, so this does not
> extend the busy-poll period beyond what the multi-NAPI path already
> allows.
> 
> First observed on a 5.14-based distribution kernel carrying the 6.13
> io_uring NAPI backport, reproduced on io_uring-7.4 at 9c207aa58e54,
> x86-64, HZ=1000, PREEMPT_DYNAMIC (lazy), no CPU isolation, low RX
> traffic, r8169 with one RX queue, prefer_busy_poll, busy_poll_to = wait
> timeout = 10 ms, with a SCHED_FIFO task pinned to the polling CPU
> waking every 1 ms:
> 
>   before, 1 NAPI:  busy 0.5-1.5 ms per 10 ms wait, ~0.8M polls/s, CPU ~5%
>   before, 2 NAPIs: busy 10 ms per 10 ms wait,      ~7.2M polls/s, CPU ~100%
>   after,  1 NAPI:  busy 10 ms per 10 ms wait,      ~7.4M polls/s, CPU ~100%

Claude had a few comments on this one, mostly related to now
ending up with a full start/stop cycle for every poll. Details
below:

> diff --git a/io_uring/napi.c b/io_uring/napi.c
> index 7e698720cd51..5362690a9d17 100644
> --- a/io_uring/napi.c
> +++ b/io_uring/napi.c
> @@ -166,28 +166,24 @@ static bool io_napi_busy_loop_should_end(void *data,

[ ... ]

>  	list_for_each_entry_rcu(e, &ctx->napi_list, list)
> -		napi_busy_loop_rcu(e->napi_id, loop_end, loop_end_arg,
> +		napi_busy_loop_rcu(e->napi_id, NULL, NULL,
>  				   ctx->napi_prefer_busy_poll, BUSY_POLL_BUDGET);
>  	return false;
>  }

[ ... ]

> @@ -216,24 +210,12 @@ static void io_napi_blocking_busy_loop(struct io_ring_ctx *ctx,
>  				       struct io_wait_queue *iowq)
>  {
>  	unsigned long start_time = busy_loop_current_time();
> -	bool (*loop_end)(void *, unsigned long) = NULL;
> -	void *loop_end_arg = NULL;
>  	bool is_stale = false;
>  
> -	/* Singular lists use a different napi loop end check function and are
> -	 * only executed once.
> -	 */
> -	if (list_is_singular(&ctx->napi_list)) {
> -		loop_end = io_napi_busy_loop_should_end;
> -		loop_end_arg = iowq;
> -	}
> -
>  	scoped_guard(rcu) {
>  		do {
> -			is_stale = __io_napi_do_busy_loop(ctx, loop_end,
> -							  loop_end_arg);
> -		} while (!io_napi_busy_loop_should_end(iowq, start_time) &&
> -			 !loop_end_arg);
> +			is_stale = __io_napi_do_busy_loop(ctx);
> +		} while (!io_napi_busy_loop_should_end(iowq, start_time));
>  	}

Does dropping the single-NAPI path trade the early need_resched() exit
for a full busy poll start/stop cycle on every poll?

With loop_end set, __napi_busy_loop() acquires the NAPI once, spins in
its own loop, and only calls busy_poll_stop() when it is done. With
loop_end NULL it breaks out right after the first poll and tears the
busy poll state down each time:

net/core/dev.c:__napi_busy_loop() {
    ...
		if (!loop_end || loop_end(loop_end_arg, start_time))
			break;
    ...
	}
	if (napi_poll)
		busy_poll_stop(napi, have_poll_lock, flags, budget);
    ...
}

So after this change every iteration of the do/while above re-acquires
the NAPI with the cmpxchg on napi->state, polls once, and then runs
busy_poll_stop(). Without prefer_busy_poll that is a second
napi->poll() call just to re-enable the device interrupt:

net/core/dev.c:busy_poll_stop() {
    ...
	} else {
		/* Use driver poll to re-enable device interrupts. */
		rc = napi->poll(napi, budget);
    ...
}

so the interrupt is re-enabled after every poll, and once it fires and
schedules the NAPI the next cmpxchg in __napi_busy_loop() fails and that
iteration polls nothing. With prefer_busy_poll and gro_flush_timeout set
it is instead an hrtimer_start() and a clear of NAPI_STATE_SCHED per
poll.

The multi-NAPI path already behaves this way, but a single registered
NAPI is the case the tight loop was there to serve. The before numbers
in the message all cover the early exit case, so the cost of the fast
path when it is not cut short does not show up in them. Is losing that
path acceptable, given this also goes to stable?

The notes below the --- line say keeping the singular fast path and
falling back to the single-shot loop only after an early return "works,
but leaves two code paths for a case whose only benefit was the one it
was broken for". Avoiding the per-poll busy_poll_stop() looks like a
benefit that is independent of the need_resched() exit, so would the
fallback approach be the better fix here?

The notes also say re-entering the singular loop is not viable because
__napi_busy_loop() restarts its deadline on entry. It does take
start_time at entry:

net/core/dev.c:__napi_busy_loop() {
	unsigned long start_time = loop_end ? busy_loop_current_time() : 0;
    ...
}

but io_napi_busy_loop_should_end() is io_uring's own callback, so could
it check an absolute deadline stored in iowq instead of the start_time
that net core passes in? That would let the inner loop be re-entered for
the remaining budget after a need_resched() exit without overshooting
busy_poll_to.

This isn't a bug, but with the special case gone neither the single nor
the multi NAPI path checks need_resched() at all for the whole budget,
and the only preemption point is the preempt_enable() between polls
inside __napi_busy_loop(). On a kernel without preemption that is up to
10 ms with no cond_resched(). Should the message mention that the
single-NAPI case now stops yielding to a woken task on those
configurations?

-- 
Jens Axboe

