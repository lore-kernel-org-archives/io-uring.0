Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AF62F39B5
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 02:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792032039; cv=none; b=btV1pQH1yjsgmMqRucgnuovOB2SaVU0M/NGEAZOMZcXxhp35eWA1KlLxnb6OiimB86KXwbCeqOEq5vwg80gnbY/PyAEjNl+AcPK7kMZkxztSmSR/qDNJroAVFKc9DKY2nnWRJmmkb2lsk2DYM0Q5eAHTa6l6PlD8YA1FmJfpKGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792032039; c=relaxed/simple;
	bh=FCFqIUr5heuDZNwG08SPXGC/g2fvuFyx/JS7ppBVR0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JSFileFyHdbUPypU8h7RSeQynI9fJRQczq4RxoynsuZaROm/U24YkFzmY2YcJ+8b77KpsqZU+rmd2Ly5Au+Vrt1Gwf1Z89AL65KJyiOYEluj1C87VeIT6/aENCNwl6ftxr530NN301tzGOKVUDu2GPeI79tIqvBQvnpORLs40SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Tgh4eK2Z; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Tgh4eK2Z"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48de6a62a4cso1848162f8f.2
        for <io-uring@vger.kernel.org>; Wed, 14 Oct 2026 19:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792032036; x=1792636836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JEItkXykfQ51k8AnQA9MCb40y60hqHTN5XUgh4Tpq+I=;
        b=Tgh4eK2ZmDX5xg7z4mnU2G2A75C1G+wMVJ4IXidAaMzZwNojeBFMFt0fUM7Q209lm5
         GknCX7HphpBgIr3yQ0ojftGnogFE+GcC2097L1KRo8VTAYH8zyp7kdIx/sSAeMyupTnA
         4Jn48ZM79rKkOQ7lQrsGI6uG4YxN6wyVnzK9Q+iSG52F68MIq/bNyyEQL/jDXRMrRxsL
         vO9AvFrSME/AX1wDcU5p7HwMDhJ3iuyyXf2YPBqOiFi17OddhqonV+tpwr4zVgMkkg1s
         jQzpcH8/GLL+7xFivsubXdgJAwwNyp39DDCo20JvKqfP6bUP0xqCATE18v4NRMctUclx
         8Jag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792032036; x=1792636836;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JEItkXykfQ51k8AnQA9MCb40y60hqHTN5XUgh4Tpq+I=;
        b=G0Npm6oieHhVUIB2SX13FCX2s/BocBMVt7RDEZ9aDRo1lC88ts8ByZorLH6nfY83h2
         OwwJlMBzv6yLRfwfuKikh74K1b3tAMULSHpIA+kDe8h2vAJIuvGC1fdHagX5sAtGS1YB
         TFZYUta42W9dpvwpbA98HER3zMwBipT5G+G5sCyE/hLV4XZ1EWXd8r/5U5MfUV+bNex4
         igsZ43dcUJxXj/Gcmzsrwk7LUKGo8uB+E4k9jqAOn4Hh/fE8+lZoOT2EvYOY4MnRsiXE
         jW+jNAn9r5NKuTOcfo9r5oWFzZt4iAXLoQsS3lv0qvBEwZhxR21/GH1Pi7Ae5Fy7dExj
         nufA==
X-Forwarded-Encrypted: i=1; AKwUvBwgl8H32AjA5r2T3AjaNq4HEbWKSAyzHkHHAcTH1SUUlRtRR2ZfC0Zp6EHWwocgro3YY6vz1sS3iA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJky3jPMWN0zqLejiqtJtPJbD2B5uJUYKPPIuzI6/vrifhL2Xuw
	MCkBdR35hebMvEFX1Iiv5NxGN7me0CzFH86FmcP+X2mPf16MMf3rRPIm4R2rE7zP7g==
X-Gm-Gg: AYBFou2jasIRiAbC7ajt2hwAs5kbyWlR1eX9It0mEuQry3vgR1DV2/koZxfTP8Uh42y
	bDiDSP20jqlJ5v5m67ekJIuEP4xq2P+XJsF951Gay2l99fPW5ZCuECQtJF0YOZtTrYyiGiqq9QH
	sb45DuD34YD+u7r4Fn30WIRdYqZsTV4v2OYpVZLxDNosDPGIMrP4fvMRxaShNmwdNyRTe1d/2Ch
	JYMLAyBfq2qAy1BwW0b9qgYCiNF5j4omSuzREFH+UBpcxMv8RZcsdOvreemN4zgHbh6Cwa3SDY8
	b3UcPwiPGrx5wXQ5A1lx5F+F5yBOAi6VQtB0EpNYmga866CaIob4X+Anf9IRkIvVfuAIl+xqRsL
	6yCBt7k0EOwRJCQg6wRUAoem93P9BZSKlzEIIedtnC+tSb3TG02PGkw9ck2HvyAxGd8bzOzsmSk
	DwPXFZeQBBw+Ca8kGINAjFK4GCObOn/jc8JBZPlDKbDE/Cw1uATT9+JDyudVSXAt0V0UQ3yx9/q
	yiHsmQRusT5pIHe9oEdPah8mAz63WABlsBF+KJtk5hYXDGgLVUxucNZ3b2hujhlcfhrOQ4C
X-Received: by 2002:a05:6000:24c4:b0:48b:1c:d6e1 with SMTP id ffacd0b85a97d-48dbace386bmr34023314f8f.43.1792032035872;
        Wed, 14 Oct 2026 19:40:35 -0700 (PDT)
Received: from autotest-wegao.qe.prg2.suse.org ([2a07:de40:b240:0:2ad6:ed42:2ad6:ed42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc6b82sm16078538f8f.51.2026.10.14.19.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:40:35 -0700 (PDT)
Date: Thu, 15 Oct 2026 02:40:32 +0000
From: Wei Gao <wegao@suse.com>
To: Christian Loehle <christian.loehle@arm.com>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
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
Message-ID: <atA9IDcejbSs03Zs@autotest-wegao.qe.prg2.suse.org>
References: <20261014015258.13967-1-wegao@suse.com>
 <48eb633d-9fbe-4299-8d10-e7686acf5a3f@arm.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48eb633d-9fbe-4299-8d10-e7686acf5a3f@arm.com>

On Wed, Oct 14, 2026 at 03:14:41PM +0100, Christian Loehle wrote:
> On 10/14/26 02:52, Wei Gao wrote:
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
> 
> So reading the test, the reason this doesn't fail constantly (on a non-isolated
> machine) is the massive margins?
Margins should help, but this case has more chance to failing after
recent kernel change. It does help track kernel behaviro.
> It pins the io_uring_wait_cqe_timeout() to CPU0 with either in_iowait=1 or
> in_iowait=0.
> It then asserts after 1s that CPU0 got: 
> a) for in_iowait=0 at most +10 iowait units (<10% CPU time)
> b) for in_iowait=1 at least +50 iowait units (>50% CPU time)
> So a) would fail on too many unrelated iowaits, b) would fail on unrelated
> runnable tasks.
> 
> I don't think validating the per-task in_iowait setting via the CPU aggregate
> is really feasible FWIW.
> 
> > 
> > Fix this by checking nr_iowait_cpu() in kcpustat_irq_enter(). If the CPU is
> > currently in iowait, pause and settle the elapsed time to CPUTIME_IOWAIT
> > before the interrupt handler runs. On kcpustat_irq_exit(), resume
> > accounting if it was paused.
> > 
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
> 
