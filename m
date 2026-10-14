Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D15515985;
	Wed, 14 Oct 2026 13:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983881; cv=none; b=b/4pwyarI2cG5y+nqoV/Ayk9BaXNwmxKdV0Yj8VGfT088x5yc8QXtbdN53hMVu3DCL6pGl2I44Jo4WOAVbttBhTGqE6ujGDxj+QBFa45hCvDhFu0GNi9Om29RLLuuvIs8S+uZgCqMqYBiL0nWzCqLviz1WREqu/yjzzSucuBXMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983881; c=relaxed/simple;
	bh=7/FIc0ur08hSo+pDZOn/0zDBG4tLVroepAjeja9v7CE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sMMPrLwEn32QDqbAbgzYZxxWmNbRz6WnkdhT/cs/iIgEZtsLa5ZI9WPet//50hPPY3iOehEa6KzD+igOIUhEJMM3rm8y/W4zbW6IqmaZo5yUZPsd1LjhDbwCvMJXE+SfNsNpQRbYJ1RDXZOegJ5MNwN9C0gDUaR/dG/4UZmzxk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=m6URe+kW; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="m6URe+kW"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10EF31570;
	Wed, 14 Oct 2026 06:17:55 -0700 (PDT)
Received: from [10.0.128.106] (e127648.arm.com [10.0.128.106])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C4673F7B4;
	Wed, 14 Oct 2026 06:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791983878; bh=7/FIc0ur08hSo+pDZOn/0zDBG4tLVroepAjeja9v7CE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m6URe+kWdZ+B8+kEXuv1pgdWER0BsH63HWLFBBPyZ1WWFzSTED0s1yB1vKt433SAA
	 z4B6qIwWET5CDac5ZzzJ8FRBPGHYyReibYTjvxZXkZd+Sc+CApC5mtEq4IRBKUtq7a
	 g5f3Z2kBj4O7Uy8vbNPEs2K5IM3T9V3VDUS4Gx98=
Message-ID: <002a3200-81ae-43b3-860f-64135c28438c@arm.com>
Date: Wed, 14 Oct 2026 14:17:52 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] sched/cputime: Preserve iowait accounting across
 waking interrupts in dyntick-idle
To: Peter Zijlstra <peterz@infradead.org>, Wei Gao <wegao@suse.com>
Cc: Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Thomas Gleixner <tglx@kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, Jens Axboe <axboe@kernel.dk>,
 io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261014015258.13967-1-wegao@suse.com>
 <20261014124934.GE4121339@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20261014124934.GE4121339@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/14/26 13:49, Peter Zijlstra wrote:
> On Wed, Oct 14, 2026 at 01:52:58AM +0000, Wei Gao wrote:
>> In liburing's test suite, the test/iowait.t test case intermittently fails
>> with:
>>     iowait diff too small: 48
>>     test 1 failed
>> on tickless systems where IRQ time accounting (CONFIG_IRQ_TIME_ACCOUNTING)
>> is not enabled.
>>
>> Commit 7198e3927a14 ("sched/cputime: Handle idle irqtime gracefully")
>> optimized dyntick-idle cputime accounting by avoiding pausing idle
>> accounting on IRQ entry when IRQ time accounting is disabled.
>>
>> However, this causes iowait time to be erroneously accounted as
>> CPUTIME_IDLE if the task waiting for I/O is woken up inside the interrupt
>> handler (such as the 1-second timeout hrtimer in liburing's test/iowait.t):
>>
>> 1. In test/iowait.t, a read request is submitted on an empty pipe and
>>    io_uring_wait_cqe_timeout() is called with a 1-second timeout. Because
>>    current->in_iowait is set, rq->nr_iowait on the CPU is incremented
>>    to 1. When the CPU enters tickless idle, the periodic scheduler tick
>>    is stopped.
>> 2. When the 1-second timeout expires, the hrtimer interrupt fires.
>>    Because irqtime is disabled, kcpustat_irq_enter() does not pause idle
>>    accounting.
>> 3. Inside the interrupt handler, io_cqring_timer_wakeup() calls
>>    wake_up_process(). In ttwu_do_activate(), waking up the task immediately
>>    decrements rq->nr_iowait from 1 to 0 before the CPU has exited idle.
>> 4. When the CPU returns from the interrupt and calls tick_nohz_idle_exit()
>>    -> kcpustat_idle_stop() to settle the elapsed tickless idle duration,
>>    it checks:
>>        iowait = nr_iowait_cpu(smp_processor_id()) > 0;
>>    Because rq->nr_iowait was already decremented by ttwu_do_activate(),
>>    this evaluates to false. As a result, the entire 1-second idle duration
>>    spent waiting for I/O is credited to CPUTIME_IDLE instead of
>>    CPUTIME_IOWAIT, causing diff < 50 and failing the test.
>>
>> Fix this by checking nr_iowait_cpu() in kcpustat_irq_enter(). If the CPU is
>> currently in iowait, pause and settle the elapsed time to CPUTIME_IOWAIT
>> before the interrupt handler runs. On kcpustat_irq_exit(), resume
>> accounting if it was paused.
> 
> Using nr_iowait_cpu() is fundamentally never a fix. It is rolling a dice
> and liking random numbers. See the comment that goes with that function.
> 
Speaking of, that comment is stale, menu doesn't use that heuristic anymore.
FWIW the remaining aggregated nr_iowait users seem to be accounting/reporting.
(cpufreq still uses it, but it comes directly from p->in_iowait).
Given they are exported (/proc/stat procs_blocked and something in s390) I don't
see how we can remove this entirely but at least nr_iowait_cpu() as opposed
to cpu_has_iowait() could be refactored. The issues are obviously the same still.
I'll send a patch.

Peter, if you see a path to ever retire iowait (or at least the CPU iowait for now),
I'm more than happy to sink some time into it...
