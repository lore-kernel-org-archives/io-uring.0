Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB733B637A;
	Fri, 31 Jul 2026 17:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785519779; cv=none; b=X7STuA+pKcCv/7P0OZGoigN6HpVgxUba9wWH6WLJePZUKu3S4jOk+D+ITOSDx4zZuNo0TJF3W0SsJBtlhIqSg4M/61QBk/0K8Rri7M2Bp0ve4irUhAmuFZOY6EDtPhTLq7GLo//WvuoyFxGhEI/gxfp50HOideY1veOpMvunheI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785519779; c=relaxed/simple;
	bh=o8j3ecwAlIaY5Vab1JFqVlLya9uoOW9Kq3ZMBXUyQ1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JugdhWxfBZHMrakcPFYxSREu9O9xFeG4Q8LfH3PZwJlr7aTZzCvdn5iQXyiGEBqW7zvXivaXhusXqUHE/MZ/S4UWujZJSVj9NrE0rq3OrptdeWtVELqm5uw2DAJLVRrNN/l5yQZB8TF0/GtdyCjv/MvjD5NijaetYq+fO3w6Ld0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QOtolFg1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QOtolFg1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 746BE1F00AC4;
	Fri, 31 Jul 2026 17:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785519776;
	bh=A6odpjQn0p/j7OXh2X4ejlqux8X5BDNkRDXPeBFsCdY=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=QOtolFg1mJLZ5Wd3nlt9KI7nWsTdZsHoHpouUgv7KLcPuiPcjsGAaGgfBJUs0rNaz
	 g53me28GeV3bcEcDEuOphKCrtNaMFwfDAYo+U+dfwgVkBkwBHyQcMLWp2TRPCiuX3R
	 xbfCbLJEvjuyhxsbSUSXOFy7D0B5o/4Cphfe4HPfQYZian6Vh8W7aHlRRU2AhOYyGK
	 b5t6MrO6DuPoz51oHqK6XhGsMX/j/ga3S1ad+M3PlAqNojSd6IAAoLQC1kPzdS5UaP
	 w5G2/8pvjkpFDkls5QNVn7GwbUXd+I1Cbkxj48covcOKw1CezFmBJEQ4czyzv2v+sw
	 dN7N+Lba+ZxXA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 461D7CE11BE; Fri, 31 Jul 2026 10:42:56 -0700 (PDT)
Date: Fri, 31 Jul 2026 10:42:56 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	io-uring@vger.kernel.org
Subject: Re: [PATCH RFC 4/9] io-uring/rw: Use accessor for hrtimer_sleeper
 ->task field
Message-ID: <4fb5df7f-7ac7-48b2-9eef-3960e6159c89@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <e76a426b-f65c-4357-b263-96506d877136@paulmck-laptop>
 <20260731004019.3530210-4-paulmck@kernel.org>
 <20683d73-32fe-4605-93e4-b02da0172e2c@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20683d73-32fe-4605-93e4-b02da0172e2c@kernel.dk>

On Fri, Jul 31, 2026 at 09:03:29AM -0600, Jens Axboe wrote:
> On 7/30/26 6:40 PM, Paul E. McKenney wrote:
> > The hrtimer_sleeper structure's ->task field is used as a flag to indicate
> > that the associated hrtimer has expired.  This means that the hrtimer
> > handler can be storing to this field while other code is loading from it
> > to check for expiry.  Note that additional races appear for hrtimers that
> > can be restarted, which could be argued to be a user error.  However, that
> > is no reason to let the compiler introduce additional confusion, and to
> > this end, the hrtimer_sleeper_task_get() was introduced, use of which also
> > has the benefit of avoiding open-code access to hrtimer_sleeper innards.
> > 
> > Therefore, apply this accessor to the io_hybrid_iopoll_delay() function.
> 
> Seems fine to me, but for some reason you didn't CC all the people on
> the series. Hence I don't know if each can stand on its own. A quick
> grep tells me that, no, that is not the case, as
> hrtimer_sleeper_task_get() isn't a thing in the tree right now.
> 
> That's a slight nudge to please don't do partial CCs, it's impossible to
> tell without needing to dig further.

Good point, and apologies!

However, in this case I would have overrun the CC limit.  Would it suffice
to just add all the lists (in your case, "Cc: <io-uring@vger.kernel.org>")
on all the commits?

							Thanx, Paul
