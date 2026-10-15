Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BD830EF86
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 02:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031321; cv=none; b=YyQ9F5I9+AjmZe5lJ9ljrJbmONYcFGfiVfJ7iqrtZ7vpqTo7fLG9/CBtpEzp7HznPslunO17z+SfAA3cxTjROdOIr0QAYn5U+OdvW2upU0lUE9XlwxPmhepNe6jBgz/BfrO5AQDFmTslQsVyDWYwevoCPvP1zCRR/GntiSJoOHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031321; c=relaxed/simple;
	bh=D8kqw460aVqAXVxDDxXCj1ESFmCPAvjMk5GS3hAyqw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tEwLbGYTteFMbCw/MRu6PB0z4CJK34xDFkxxAoK3Z3rq1abjNUkboZ2tGGCTmy2dyQNeR205JBe0/OMGlrs07f0+DUQ/qa2UyKMCJYtgdxtwh19j07O+APXFCMa/bN2iwXZpLH7Gzk4pneLT0fZ6rSvD89hyOunBn/jwaMYmf3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=D7sxjFEz; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="D7sxjFEz"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48af27fe287so1063432f8f.0
        for <io-uring@vger.kernel.org>; Wed, 14 Oct 2026 19:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792031317; x=1792636117; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vFK7bW+ch1AnYKr5eaZ3F6vsFcFiDVJtqAQR0MXM7VE=;
        b=D7sxjFEzzTR54Fap9UTXMo0lC8Rx3cKcr9uxvKxiKA3Y7YuAhXqquuYVC5Z+u0uHQx
         5X+c3OtobWLoiKUBOyAfV0Z3o9JsPiedmJz5DK7+gqUcKY4oo594AePD3Ju26l5NifuY
         SEG38vNIpYJ2P7Wrjp6zHtLoqJ26OSxehoeOMHARffXcsn/L7koX2XRbnYGWuG3umUE8
         2YDW1oY0lww7Ak2/Y4EDXvrqTmkfWC8Be5xd9RasEOf1WHEpdidLxIP1Ea8NkaKUO9yg
         dcd7lp+39axT/cEtAdabLdNukkWQdoYHtFDzawtYCEzzUvHMp08PB95mchYbMLpEBv5M
         J1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792031317; x=1792636117;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vFK7bW+ch1AnYKr5eaZ3F6vsFcFiDVJtqAQR0MXM7VE=;
        b=gf/1UT7fG7GMtgorhR4k5WqTFVN/ULKVgI39Cg3hapODTYABIfMlm1if2SAiHJh6IN
         2lp/lzjKexlsE7nTGyUHCGzz855oOrGgsznY3A6rfSMarMWZIwQtaTFrLXy96CpQirH6
         8pcU9XSsol51M1gqjok0nOpAItqHUxt+bggQXlMyqal/VqEGRCwEHfFl+OW7ycAaMdWf
         jI+bidNmFnUt+LGdGRsHeLo2cIb0nyBYK2BF4ZZ/68Vd2f/nOXdZ05LrifSlNeDiad11
         6eHAURimfRhVfkeEUaBb5FKGfs3DXl5jbSjl87/fpECj0/MIJuRA5M/RLJBLMwLES7VJ
         tEjQ==
X-Forwarded-Encrypted: i=1; AKwUvByfbSb+6IPkkZaOKdFGWM2KsR7zIRfBsqpo2v/gVd8U9wuHkZ1vKV/hcFGVyh9GaIbxNU7xJrogKg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLQyM8BTLZwU/b1wyCoFB4CDXHKv4/5bxrZ+VnQSDjHfJCKHjiw
	CZBGECWK7m0IyQ1im/cgmYEwOijF4xK2TyecPZARgj6eTlWKhT536poN5DUMjjW0hg==
X-Gm-Gg: AYBFou0Y+iJUVZwpw9f08EpG+uF7LxRdCv1FmbN2FGOK6hKNGcoNPrUt1ifezov05+P
	MnERDHPLQaXAE5BOEEgjn/1Q2FNtEgJjwgaCazBpGfbroB84gPkvyAcsFDHYVl0MjavSgJVdVPA
	tCYp4K/u+FjNegoA7wNxq4qeIMj8ka4gDrvceQTBar8anM9tSSrRnMG+TDOK/yphO9QEFjoSoN/
	+NBq9jw77De28Hl2FhajKa4Md31iQ2egdKRRQSOwUaz3g7Vsg96EKaN1AR5YtkmkBb80AjCNj3N
	CPfyBRHLYXKQPazyt+Xh5vCfxvsCROOd+F13FEbLvilL9AYTDpH7lTTInNjOmF5vxpmiV+sn7CN
	TrX4ceYjyl9H8ZbA3AEQB7eQbhZOjoivSsRHpqrRxJjGzR3fqgS9iRPJrEgnPabjG0TyB5cbZfC
	EZtJV4z5N7ciKi8jN+aOI7Hk9jMvDju9gh1Zgoel34mjihMBnJRawkK7XXB2zUdlkpLGAanNat1
	S7jYPEBVPwpsdbfx7RBh4FjukdUBwb3O8wz7o7MayDdOkCrgM/IGXwnoGCFAVGYdMRrfC2qVmQs
	A8YTmqg=
X-Received: by 2002:a05:6000:4550:b0:48c:4d74:d7d2 with SMTP id ffacd0b85a97d-48dba9db092mr24942282f8f.12.1792031316622;
        Wed, 14 Oct 2026 19:28:36 -0700 (PDT)
Received: from autotest-wegao.qe.prg2.suse.org ([2a07:de40:b240:0:2ad6:ed42:2ad6:ed42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bd1843sm15748786f8f.56.2026.10.14.19.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:28:36 -0700 (PDT)
Date: Thu, 15 Oct 2026 02:28:34 +0000
From: Wei Gao <wegao@suse.com>
To: Peter Zijlstra <peterz@infradead.org>
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
Message-ID: <atA6UsI1CldllKSP@autotest-wegao.qe.prg2.suse.org>
References: <20261014015258.13967-1-wegao@suse.com>
 <20261014124934.GE4121339@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014124934.GE4121339@noisy.programming.kicks-ass.net>

On Wed, Oct 14, 2026 at 02:49:34PM +0200, Peter Zijlstra wrote:
> On Wed, Oct 14, 2026 at 01:52:58AM +0000, Wei Gao wrote:
> > In liburing's test suite, the test/iowait.t test case intermittently fails
> > with:
> >     iowait diff too small: 48
> >     test 1 failed
> > on tickless systems where IRQ time accounting (CONFIG_IRQ_TIME_ACCOUNTING)
> > is not enabled.
> > 
> > Commit 7198e3927a14 ("sched/cputime: Handle idle irqtime gracefully")
> > optimized dyntick-idle cputime accounting by avoiding pausing idle
> > accounting on IRQ entry when IRQ time accounting is disabled.
> > 
> > However, this causes iowait time to be erroneously accounted as
> > CPUTIME_IDLE if the task waiting for I/O is woken up inside the interrupt
> > handler (such as the 1-second timeout hrtimer in liburing's test/iowait.t):
> > 
> > 1. In test/iowait.t, a read request is submitted on an empty pipe and
> >    io_uring_wait_cqe_timeout() is called with a 1-second timeout. Because
> >    current->in_iowait is set, rq->nr_iowait on the CPU is incremented
> >    to 1. When the CPU enters tickless idle, the periodic scheduler tick
> >    is stopped.
> > 2. When the 1-second timeout expires, the hrtimer interrupt fires.
> >    Because irqtime is disabled, kcpustat_irq_enter() does not pause idle
> >    accounting.
> > 3. Inside the interrupt handler, io_cqring_timer_wakeup() calls
> >    wake_up_process(). In ttwu_do_activate(), waking up the task immediately
> >    decrements rq->nr_iowait from 1 to 0 before the CPU has exited idle.
> > 4. When the CPU returns from the interrupt and calls tick_nohz_idle_exit()
> >    -> kcpustat_idle_stop() to settle the elapsed tickless idle duration,
> >    it checks:
> >        iowait = nr_iowait_cpu(smp_processor_id()) > 0;
> >    Because rq->nr_iowait was already decremented by ttwu_do_activate(),
> >    this evaluates to false. As a result, the entire 1-second idle duration
> >    spent waiting for I/O is credited to CPUTIME_IDLE instead of
> >    CPUTIME_IOWAIT, causing diff < 50 and failing the test.
> > 
> > Fix this by checking nr_iowait_cpu() in kcpustat_irq_enter(). If the CPU is
> > currently in iowait, pause and settle the elapsed time to CPUTIME_IOWAIT
> > before the interrupt handler runs. On kcpustat_irq_exit(), resume
> > accounting if it was paused.
> 
> Using nr_iowait_cpu() is fundamentally never a fix. It is rolling a dice
> and liking random numbers. See the comment that goes with that function.
> 
Thanks for such quick feedback. I see your point since per-CPU iowait accounting on SMP 
is fundamentally flawed. It doesn't make sense to create any more patches for 
current iowait accounting.

For iowait.t test i guess need revalue it or simply skipped it.

> > Fixes: 7198e3927a14 ("sched/cputime: Handle idle irqtime gracefully")
> > Signed-off-by: Wei Gao <wegao@suse.com>
> > ---
> >  kernel/sched/cputime.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
> > index 06bddaa738e5..e8b56433c61c 100644
> > --- a/kernel/sched/cputime.c
> > +++ b/kernel/sched/cputime.c
> > @@ -496,7 +496,8 @@ void kcpustat_irq_enter(u64 now)
> >  	struct kernel_cpustat *kc = kcpustat_this_cpu;
> >  
> >  	if (!vtime_generic_enabled_this_cpu() &&
> > -	    (irqtime_enabled() || vtime_accounting_enabled_this_cpu()))
> > +	    (irqtime_enabled() || vtime_accounting_enabled_this_cpu() ||
> > +	     nr_iowait_cpu(smp_processor_id()) > 0))
> >  		kcpustat_idle_stop(kc, now);
> >  }
> >  
> > @@ -510,9 +511,13 @@ void kcpustat_irq_exit(u64 now)
> >  	 * need to pause nohz accounting. Resume nohz accounting as long
> >  	 * as the irqtime config is enabled to handle case where irqtime
> >  	 * accounting got runtime disabled in the middle of an IRQ.
> > +	 *
> > +	 * Also resume accounting if it was paused on IRQ enter due to
> > +	 * iowait.
> >  	 */
> >  	if (!vtime_generic_enabled_this_cpu() &&
> > -	    (IS_ENABLED(CONFIG_IRQ_TIME_ACCOUNTING) || vtime_accounting_enabled_this_cpu()))
> > +	    (IS_ENABLED(CONFIG_IRQ_TIME_ACCOUNTING) || vtime_accounting_enabled_this_cpu() ||
> > +	     !kc->idle_elapse))
> >  		kcpustat_idle_start(kc, now);
> >  }
> >  
> > -- 
> > 2.55.0
> > 
