Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475C4474267;
	Thu, 15 Oct 2026 07:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792049725; cv=none; b=eLCIGbEkwizzs5YZ9WJRA5L3l/8g7C15D53aFexkwcE1+LCYraC4fav8mZqRBPd1a7+I37oiDS+CPgYcSS5oqnpKSYIxk/eCR4QOO5o1AnSCYCoVmaLDg8Hgr7reVE565dh9P9YQs/uP5zejOtp6W+qcEEpeEQyUhS7/OAyZzng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792049725; c=relaxed/simple;
	bh=c++F9Vf3fUz0CQyruYpb7PPYSc/ojoTaqlIFyYHysRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aDD3giUckWlMybfYirtebM4+uRWJEkAJzKiCg3JgROYizy8cqK3dHSh3r3lkUaW8PwIfB95qGxBDTUEvTnl+iCl7VLDL4C5aNuX5trXQQTHvLKPeBAf8eeSMkNqQ/m4FjdMfsqfLVvltdfIot/k8MgLD9CZE+7+uuUwbHq83mwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=SBOg7fFc; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SBOg7fFc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+rP+cxw4LyZbHAKQcyd3+FwqG+SpVmgCRVwzAc0KSwU=; b=SBOg7fFck2+GpCGyXASSABg2Dm
	aRZSbunqoDkWHxbnj8y7Zb8kYIg2eEYkRc8o0SsRPzIu99/5dPkO0QvEAZ32kIlubTZv2akAbwP2g
	4paSmpRcOEBT01JuozPVR0pQE9maLSOgDBxa2AQjsx4A61GTB7l+NO1yF/mC8LovHbHOwmb5Jnc6U
	GrTKFqOUG/1eyGBntAN+gVuHR+sd16SaTD1GmmXulE7/ZuP6qzPXZEC3n71YxfRQ7gnD/cSjsgOaM
	JoASmdxoG5lXIxoedyJXD7OVZTIX4xbi8rivtHP14kSEgX/pTF2bV5bcFDh5J3fOeAMUHV0mD/awI
	MInLGoYg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHFza-0000000Ha8b-1FmW;
	Thu, 15 Oct 2026 07:35:10 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id F39FA3006DD; Thu, 15 Oct 2026 09:35:08 +0200 (CEST)
Date: Thu, 15 Oct 2026 09:35:08 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christian Loehle <christian.loehle@arm.com>
Cc: Wei Gao <wegao@suse.com>, Frederic Weisbecker <frederic@kernel.org>,
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
Message-ID: <20261015073508.GH4121339@noisy.programming.kicks-ass.net>
References: <20261014015258.13967-1-wegao@suse.com>
 <20261014124934.GE4121339@noisy.programming.kicks-ass.net>
 <002a3200-81ae-43b3-860f-64135c28438c@arm.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <002a3200-81ae-43b3-860f-64135c28438c@arm.com>

On Wed, Oct 14, 2026 at 02:17:52PM +0100, Christian Loehle wrote:

> > Using nr_iowait_cpu() is fundamentally never a fix. It is rolling a dice
> > and liking random numbers. See the comment that goes with that function.
> > 
> Speaking of, that comment is stale, menu doesn't use that heuristic anymore.

\o/

> FWIW the remaining aggregated nr_iowait users seem to be accounting/reporting.
> (cpufreq still uses it, but it comes directly from p->in_iowait).

I see: get_cpu_iowait_time_us() using nr_cpuwait_cpu(), which in turn is
used for both thermal and cpufreq.

> Given they are exported (/proc/stat procs_blocked and something in s390) I don't
> see how we can remove this entirely but at least nr_iowait_cpu() as opposed
> to cpu_has_iowait() could be refactored. The issues are obviously the same still.
> I'll send a patch.

Right.

> Peter, if you see a path to ever retire iowait (or at least the CPU iowait for now),
> I'm more than happy to sink some time into it...

Given the exposure in /proc I'm not sure we can *ever* fully get rid of
the per-cpu usage of iowait, but yeah, reducing in-kernel consumers of
this number might be somewhat feasible.
