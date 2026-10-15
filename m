Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1286377A8F;
	Thu, 15 Oct 2026 08:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052656; cv=none; b=TQbzr8JfntSOChxpoDqNZV2fu7xCxB85GFQ1yrrwdx90K8nMz6wUm73Ued8n5g30/JENrneVLBg6MGQMFYJAq3SC2bkqSq4GC/e17LkSn/v4hN+DKkaXQcQJp4CymtHqmMwRelgeSpN7JgzblNCFrsd3JhhKxgPoLge40ZrDDOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052656; c=relaxed/simple;
	bh=bMYkyOkP+QxhVduFGMhhNJ9bjGKChGRtlGxry0l9kW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iG7jk8N41r+mmp9AVoMXHL/2XYF+ZjWhjnVWJj3uMa1DqCS3B96Q2NpdPEYLczuDsf/O2GUN/RSiTTAIzN+TZ311t4H7iwpG9Ur7nl5I9Oi7hwQuJgGGdwSEwaeXvRF6yIFP2V/u0qF1WIeX+InNM5YxmshvUIUZoxILW27qxQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ovQRHnS5; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ovQRHnS5"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEF732F;
	Thu, 15 Oct 2026 01:24:10 -0700 (PDT)
Received: from [10.57.88.29] (unknown [10.57.88.29])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A4BAB3F871;
	Thu, 15 Oct 2026 01:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792052654; bh=bMYkyOkP+QxhVduFGMhhNJ9bjGKChGRtlGxry0l9kW0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ovQRHnS5vdkPrx+4uP4/N0yujXmOLW8YpQLRuIbtojit6AnoyIPr5kaUodFLKzBJM
	 /OL58Eq7WaaiBZMrHkMmO1m/25G0xnrkzlIEAWVgGux1JYd6qI/NjKz/nu7Ve7Z2Lt
	 tJYKAae55UGKaVSkLp7D/BduO1zpur0ebwJy9Qm8=
Message-ID: <a6cc5f59-da1a-4e8a-b91f-f32743b02383@arm.com>
Date: Thu, 15 Oct 2026 09:24:07 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] sched/cputime: Preserve iowait accounting across
 waking interrupts in dyntick-idle
To: Peter Zijlstra <peterz@infradead.org>
Cc: Wei Gao <wegao@suse.com>, Frederic Weisbecker <frederic@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Thomas Gleixner <tglx@kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, Jens Axboe <axboe@kernel.dk>,
 io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261014015258.13967-1-wegao@suse.com>
 <20261014124934.GE4121339@noisy.programming.kicks-ass.net>
 <002a3200-81ae-43b3-860f-64135c28438c@arm.com>
 <20261015073508.GH4121339@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20261015073508.GH4121339@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/15/26 08:35, Peter Zijlstra wrote:
> On Wed, Oct 14, 2026 at 02:17:52PM +0100, Christian Loehle wrote:
> 
>>> Using nr_iowait_cpu() is fundamentally never a fix. It is rolling a dice
>>> and liking random numbers. See the comment that goes with that function.
>>>
>> Speaking of, that comment is stale, menu doesn't use that heuristic anymore.
> 
> \o/
> 
>> FWIW the remaining aggregated nr_iowait users seem to be accounting/reporting.
>> (cpufreq still uses it, but it comes directly from p->in_iowait).
> 
> I see: get_cpu_iowait_time_us() using nr_cpuwait_cpu(), which in turn is
> used for both thermal and cpufreq.

thermal uses it with io_is_busy=0, so that's okay, ondemand has it sysfs-exposed
with a default of 0 except for 
	return (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
		boot_cpu_data.x86_vfm >= INTEL_PENTIUM_PRO);

:/

If that were the only users I'm sure there would be ways around it though.

> 
>> Given they are exported (/proc/stat procs_blocked and something in s390) I don't
>> see how we can remove this entirely but at least nr_iowait_cpu() as opposed
>> to cpu_has_iowait() could be refactored. The issues are obviously the same still.
>> I'll send a patch.
> 
> Right.
> 
>> Peter, if you see a path to ever retire iowait (or at least the CPU iowait for now),
>> I'm more than happy to sink some time into it...
> 
> Given the exposure in /proc I'm not sure we can *ever* fully get rid of
> the per-cpu usage of iowait, but yeah, reducing in-kernel consumers of
> this number might be somewhat feasible.

