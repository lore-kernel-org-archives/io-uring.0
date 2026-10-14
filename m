Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C85E5427FA;
	Wed, 14 Oct 2026 14:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791987294; cv=none; b=RgvCFJfSFRvdvI3cKpTPdsYF9DDsPXJdV2fT/tRKLYFslqnFFQRiwtZ0NIKSUrgsPtPWmkOVzDmg53tmN4i95gShCSqD9ghrXq7ECnQoTV1PEOBLtLQFiibZTnCyZj/ucMt66OtdhFUIJuyzoTPA0lNg59nQgdIiI7zI90LIFRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791987294; c=relaxed/simple;
	bh=LDLT23fIL3Vnuqvwb6RQ16bO8CIzq4ggp+SHdh/yJ08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZKPTf4odAy4m8s59GpFbb8hwdVrEdwbIRXsH6HijJeBTwl+VF9is5zP5r91LrzKJ4MJm/iJfpv8dMu8ceylMjFKpkVaLoRmKPW+R4r+xchrq/usl5loKl9YPOIOjclyDjU8lNw0dEsbEVojMQy1fA34O0RfCLzRk3S8h5Kp8JxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fkLRL1VY; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fkLRL1VY"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 018FE1570;
	Wed, 14 Oct 2026 07:14:43 -0700 (PDT)
Received: from [10.0.128.106] (e127648.arm.com [10.0.128.106])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFC683F673;
	Wed, 14 Oct 2026 07:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791987286; bh=LDLT23fIL3Vnuqvwb6RQ16bO8CIzq4ggp+SHdh/yJ08=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fkLRL1VY54gikhsUiI2B08JovTDr16GKwY4ByahW05VMCnBzsHhuJUdNA8Qpmt6L9
	 R2a7DU+O2weDRvhgsrZP0d1vwfAZeQ5xF0qw3/Eea/A0dSLkx1QJYRpM5v1ZjDvaKt
	 Mz0lvPcL+Qp1BGaRFvwt+SLyL4opFDRo9U5qc+kw=
Message-ID: <48eb633d-9fbe-4299-8d10-e7686acf5a3f@arm.com>
Date: Wed, 14 Oct 2026 15:14:41 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] sched/cputime: Preserve iowait accounting across
 waking interrupts in dyntick-idle
To: Wei Gao <wegao@suse.com>, Frederic Weisbecker <frederic@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>
Cc: Thomas Gleixner <tglx@kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, Jens Axboe <axboe@kernel.dk>,
 io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261014015258.13967-1-wegao@suse.com>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20261014015258.13967-1-wegao@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/14/26 02:52, Wei Gao wrote:
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

So reading the test, the reason this doesn't fail constantly (on a non-isolated
machine) is the massive margins?
It pins the io_uring_wait_cqe_timeout() to CPU0 with either in_iowait=1 or
in_iowait=0.
It then asserts after 1s that CPU0 got: 
a) for in_iowait=0 at most +10 iowait units (<10% CPU time)
b) for in_iowait=1 at least +50 iowait units (>50% CPU time)
So a) would fail on too many unrelated iowaits, b) would fail on unrelated
runnable tasks.

I don't think validating the per-task in_iowait setting via the CPU aggregate
is really feasible FWIW.

> 
> Fix this by checking nr_iowait_cpu() in kcpustat_irq_enter(). If the CPU is
> currently in iowait, pause and settle the elapsed time to CPUTIME_IOWAIT
> before the interrupt handler runs. On kcpustat_irq_exit(), resume
> accounting if it was paused.
> 
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

