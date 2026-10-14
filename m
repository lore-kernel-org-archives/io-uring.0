Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6622264A7;
	Wed, 14 Oct 2026 12:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982233; cv=none; b=kzaQsdb8k33Re/hgOANJaMvI6j5LM49KgAPuVIxja0HsXW9CsH60Pl6WnYXg23m2dyOwVSntfwGSFB61i/RMmUjUQ5HDwjQFIyFDrOr2+ybctJRbFPX08DSN+6yW2lk4Evrw2nRnT6sIJjk1gOl5NtqmWf/mPiPPoO1joCTdRPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982233; c=relaxed/simple;
	bh=bgiFu0sGxQoiEuvk8HoG3W6bGFni+KGMvGFgg73mU3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aYsymLR8VwJXJ61DWtCaa3A2Yrz0xnX7R62Yq0i/tNtkJZOtTs2gk5uEm7KuGX77sVtvsmuwO8Rv8x6glfmKZoRyPXiRHPRYHdYA5Cc4RgRnGhlTJz4Vf1LsxBLC9CYwy9Ej63IWTgbBJrPB+z7GDYhD7901zriE/LFrYokn0Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Q7ZUZX/6; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Q7ZUZX/6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tSsrfwv3XYOUoqKLasClhmhnPY9YIfSnY1a1of3xT0Y=; b=Q7ZUZX/6ijEmASKNFKPOgbkHBJ
	vEepA8gWzYzR2NSK6D8eUMR/4L1OVoALjwhXfAGAqjm15LDtUrEua5HWtY1JRcD1lC8VkyZOjukz6
	wCMNUZAm+xHPkGBxBlhVJwIEWzg0y5ZtDwyO7wzRhCD/+i+ARQLgHrrihEbvrBdM4mnvdv1LO3+Tn
	zHN3YnNbRKJNziogtRMVETMaC11ccSGlze2/6N41uVaOr3lqoYFhdX516OloGIHD1jpQVJDO3pr3G
	XyrD4OVXF1C7RJLkDbjSop0t0fNTMdP39PLVKb+jKcyHOplZgTSaGznCeMX50phP1+zxLwORZWCf8
	bakExnZA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyQJ-00000003eL6-1Zok;
	Wed, 14 Oct 2026 12:49:35 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E9751300890; Wed, 14 Oct 2026 14:49:34 +0200 (CEST)
Date: Wed, 14 Oct 2026 14:49:34 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Wei Gao <wegao@suse.com>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] sched/cputime: Preserve iowait accounting across
 waking interrupts in dyntick-idle
Message-ID: <20261014124934.GE4121339@noisy.programming.kicks-ass.net>
References: <20261014015258.13967-1-wegao@suse.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014015258.13967-1-wegao@suse.com>

On Wed, Oct 14, 2026 at 01:52:58AM +0000, Wei Gao wrote:
> In liburing's test suite, the test/iowait.t test case intermittently fails
> with:
>     iowait diff too small: 48
>     test 1 failed
> on tickless systems where IRQ time accounting (CONFIG_IRQ_TIME_ACCOUNTING)
> is not enabled.
> 
> Commit 7198e3927a14 ("sched/cputime: Handle idle irqtime gracefully")
> optimized dyntick-idle cputime accounting by avoiding pausing idle
> accounting on IRQ entry when IRQ time accounting is disabled.
> 
> However, this causes iowait time to be erroneously accounted as
> CPUTIME_IDLE if the task waiting for I/O is woken up inside the interrupt
> handler (such as the 1-second timeout hrtimer in liburing's test/iowait.t):
> 
> 1. In test/iowait.t, a read request is submitted on an empty pipe and
>    io_uring_wait_cqe_timeout() is called with a 1-second timeout. Because
>    current->in_iowait is set, rq->nr_iowait on the CPU is incremented
>    to 1. When the CPU enters tickless idle, the periodic scheduler tick
>    is stopped.
> 2. When the 1-second timeout expires, the hrtimer interrupt fires.
>    Because irqtime is disabled, kcpustat_irq_enter() does not pause idle
>    accounting.
> 3. Inside the interrupt handler, io_cqring_timer_wakeup() calls
>    wake_up_process(). In ttwu_do_activate(), waking up the task immediately
>    decrements rq->nr_iowait from 1 to 0 before the CPU has exited idle.
> 4. When the CPU returns from the interrupt and calls tick_nohz_idle_exit()
>    -> kcpustat_idle_stop() to settle the elapsed tickless idle duration,
>    it checks:
>        iowait = nr_iowait_cpu(smp_processor_id()) > 0;
>    Because rq->nr_iowait was already decremented by ttwu_do_activate(),
>    this evaluates to false. As a result, the entire 1-second idle duration
>    spent waiting for I/O is credited to CPUTIME_IDLE instead of
>    CPUTIME_IOWAIT, causing diff < 50 and failing the test.
> 
> Fix this by checking nr_iowait_cpu() in kcpustat_irq_enter(). If the CPU is
> currently in iowait, pause and settle the elapsed time to CPUTIME_IOWAIT
> before the interrupt handler runs. On kcpustat_irq_exit(), resume
> accounting if it was paused.

Using nr_iowait_cpu() is fundamentally never a fix. It is rolling a dice
and liking random numbers. See the comment that goes with that function.

> Fixes: 7198e3927a14 ("sched/cputime: Handle idle irqtime gracefully")
> Signed-off-by: Wei Gao <wegao@suse.com>
> ---
>  kernel/sched/cputime.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
> index 06bddaa738e5..e8b56433c61c 100644
> --- a/kernel/sched/cputime.c
> +++ b/kernel/sched/cputime.c
> @@ -496,7 +496,8 @@ void kcpustat_irq_enter(u64 now)
>  	struct kernel_cpustat *kc = kcpustat_this_cpu;
>  
>  	if (!vtime_generic_enabled_this_cpu() &&
> -	    (irqtime_enabled() || vtime_accounting_enabled_this_cpu()))
> +	    (irqtime_enabled() || vtime_accounting_enabled_this_cpu() ||
> +	     nr_iowait_cpu(smp_processor_id()) > 0))
>  		kcpustat_idle_stop(kc, now);
>  }
>  
> @@ -510,9 +511,13 @@ void kcpustat_irq_exit(u64 now)
>  	 * need to pause nohz accounting. Resume nohz accounting as long
>  	 * as the irqtime config is enabled to handle case where irqtime
>  	 * accounting got runtime disabled in the middle of an IRQ.
> +	 *
> +	 * Also resume accounting if it was paused on IRQ enter due to
> +	 * iowait.
>  	 */
>  	if (!vtime_generic_enabled_this_cpu() &&
> -	    (IS_ENABLED(CONFIG_IRQ_TIME_ACCOUNTING) || vtime_accounting_enabled_this_cpu()))
> +	    (IS_ENABLED(CONFIG_IRQ_TIME_ACCOUNTING) || vtime_accounting_enabled_this_cpu() ||
> +	     !kc->idle_elapse))
>  		kcpustat_idle_start(kc, now);
>  }
>  
> -- 
> 2.55.0
> 
