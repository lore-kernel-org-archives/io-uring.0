Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF583CF97A;
	Mon, 14 Sep 2026 19:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789413771; cv=none; b=OGjaAB6pSA67mZ4Er9yM5EU1XmOevtGOhP+58CYPi46uOpOuaSk//GvmM95gjzNKf91lhWBg7TFzjCLiLF8ARqkEvQ3RxWUFeB0TQuXbumZWFDRRaTz+vSPWiOJlvm96dq2rYr6xHpWsivCI3WAmDGlONfV+AXSfTazZ2bhmcac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789413771; c=relaxed/simple;
	bh=GgDn3yhHemYli2Q52P790yoeKriyYyG8frZzVIhYNdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oHBJhiVk29H2gHJdUTQsmFeZSSVQL4UtSOwcImO1g1Rh+evSsBHouxslJGrjJy/PHEj0eOXEBVxAR55QhEi87xGQ597yvk09TXRVJLq8EFMZjMvjqM//NwDMebNXpCBelOOBD979YB2+LaQ3Cd7Cmn/GggP9IOAPYk2Dn2Bbclk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JLnqJ8wz; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JLnqJ8wz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Sc4WufYbwFCUYM3MPYQiGWQLq9nyLA8643InDHEZnzc=; b=JLnqJ8wzARePS7FyPbnm34psql
	iMkF5UT8u0BYJded3rH0Wmp0pQSW19SEi1AaC9Z+FBomoND6f9yTLp8FC/wnk8XZkorLxDdvWaOoh
	uiQeo8+WsuGAK+TkomunhRG6vREhj2h0wIOonpt1rObkNEMjILYjzirMR7aIRIcoEPLaMTGXpmybV
	cClv0cMlfIyYR0XFAJtWdQeqjNafhJnFgyQed4vkJuS1Q06rbKIfpPYMPoWu9p4B+x+8wi/2FYxAb
	x1fOjf6U0kwlcw7fhY80/Gl99YN6ARNfBpExQYBX0m5NDj8W62f6awiC5Bdc6XEwqFDyveAIdCz+5
	UrkOmE2Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6CGK-00000005y4K-3IAu;
	Mon, 14 Sep 2026 19:22:45 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B95123008E2; Mon, 14 Sep 2026 21:22:43 +0200 (CEST)
Date: Mon, 14 Sep 2026 21:22:43 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, tglx@kernel.org, mingo@redhat.com
Subject: Re: [RFC PATCH 00/15] io_uring: thread identity handoff for blocking
 inline issue
Message-ID: <20260914192243.GA776954@noisy.programming.kicks-ass.net>
References: <20260911154148.644489-1-axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911154148.644489-1-axboe@kernel.dk>

On Fri, Sep 11, 2026 at 09:40:50AM -0600, Jens Axboe wrote:
 
> This series issues those requests inline in blocking mode instead, and
> only pays for the offload if the request actually blocks. But by the
> time it blocks, the submitter is deep in the kernel with the request on
> its stack, so the work can't be moved to another thread. What we can
> move is the identity. If the submitting task blocks, an idle io-wq
> worker takes over its user visible identity (tid, signal state,
> credentials, scheduling attributes, cgroup, user register state),
> finishes the io_uring_enter() call and returns to userspace as the
> submitter. The original task finishes the request as an
> io-wq worker and joins the pool. Userspace is none the wiser, hopefully,
> the same tid came back from the syscall, it's just on a different
> task_struct. 

I'm still struggling my way through this thing.

So thread T1 is doing this blocking syscall. When it actually blocks,
you hand-over the userspace identifying part to another thread T2, which
will return to userspace as if it were T1.

Is this really a hand-over, or a swap? I would imagine we not have two
threads with the same tid and all that.

Also, I'm a wee bit confused, why not swap out the kernel stack with a
io-wq worker and have the original thread return to userspace. This
seems like a better defined situation. In so far as anything here is
well defined.

Swapping the kernel state seems like a simpler endeavour than swapping
all that is or might be user visible.

> Folks that have been around a while may remember earlier
> attempts at this about 20 years ago.

That was the whole threadlet thing, right? Very hazy memories of that.
I'll have to go read that back, I'm sure I still have that in my inbox
*somewhere*.

Surely we abandoned that approach for a reason. ISTR there being some
significant ick there, much like the thing you're proposing now.

Not sure yet on how things compare. Will have to dig through that stuff
again.
