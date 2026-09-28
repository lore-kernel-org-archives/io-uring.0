Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA5335201A;
	Mon, 28 Sep 2026 07:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790579391; cv=none; b=hmVWEI/2U+FJXf89wjGbmMbLUF8NKzoL70JGfjHb11urWsV2XKhrDLGAXw+mgjxktDOq1mFSnOf7L5ko65dfL9RS8fI2TG1XXhXcF+w3XnB49/0ahadtTBV91J1s6X3ZS/lh9KcCMxG7uLKNJJXdp6Be5nFWPB7KXtTSqxqI2a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790579391; c=relaxed/simple;
	bh=0+CDN6dzcgdp9lBMqp1P+zMf6tSyXnXDPvlzSbvBIhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CJ3GJMfgIEfppNFPhYg2dLpmB1MWfQMlz5+rwW4B1Qvi45KtWKVme80kSrhbcjmN68dw5RjmGitCYwDW+sZVc5OK+twM5Rcx/islWUodBo01MAguvG0ZVW/CxjejUMSVr6uKsTpPbuKLhtAcSECV31qFPB/gC2JeHSTovGy1S7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=fwEJF9wn; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fwEJF9wn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FI418+vuJtoGFxa3rzsQVxQZHnk+1rPelhdCwOGpt44=; b=fwEJF9wnbqrSw3HUY0P/cssmnu
	3EfLDJ+a1Zt0iTdAkoVd29HGRl83tyC9vRjbOIVj/+fJJ9nzwt+avN+f4Gk2WhkudcARiBQjqnpDE
	9BTXDUTicYMbgOFCY+PJ569mooQeKXHzh6sVQ7033YdHo+qyIsXAESNofj4fOibxW39Qa+wX311Ux
	A5ulv+5jQfoIpX7lZyW46qK9b82lvyUPyN6oHOzRIbxDv5MbnQ35MOHdtkIaiZe2oP2obUy6Vo/vx
	FVVR7X67bQlIY1uLPLBy+iVX2SWSMF3AOTzyfR67mZCpzMJNq/Xh+uzkbGUxpf3JhdPmxDGZyYsng
	2/FDOKvw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xB5UU-00000001ARL-1Kir;
	Mon, 28 Sep 2026 07:09:34 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D7C33300478; Mon, 28 Sep 2026 09:09:32 +0200 (CEST)
Date: Mon, 28 Sep 2026 09:09:32 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Jann Horn <jannh@google.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	kernel list <linux-kernel@vger.kernel.org>,
	Jens Axboe <axboe@kernel.dk>, io-uring <io-uring@vger.kernel.org>
Subject: Re: [BUG] FUT_OFF_MMSHARED futex waiters can outlive mm_struct
 (because of futex_requeue() and maybe io_uring)
Message-ID: <20260928070932.GP4120091@noisy.programming.kicks-ass.net>
References: <CAG48ez0dLBpc3QtbAhMMVNHwHL94iHh2G+h-=BVFR4dDuzZr1g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG48ez0dLBpc3QtbAhMMVNHwHL94iHh2G+h-=BVFR4dDuzZr1g@mail.gmail.com>

On Thu, Sep 24, 2026 at 09:26:45PM +0200, Jann Horn wrote:
> == Summary ==
> FUT_OFF_MMSHARED futex waiters can outlive the mm_struct that the
> futex_key refers to because of futex_requeue() [tested] and probably
> also via io_uring [untested].
> 
> This doesn't have much practical impact, I think at most it could:
> 1. cause missed wakeups for non-private futexes in anonymous memory
> 2. allow unrelated processes to guess addresses of FUT_OFF_MMSHARED futexes.
> 
> I propose we handle FUT_OFF_MMSHARED like FUT_OFF_INODE and put a
> unique 64-bit ID into struct futex_mm_data, which can be used in futex
> keys. That should address both futex_requeue() and io_uring. If that
> sounds good, I'd be happy to write a patch.

Whee, you do find the best problems :-)

> == Fixing it ==
> I see two approaches to fixing this:
> 
> 1. Put a unique 64-bit ID into struct futex_mm_data, which can be used
> in futex keys, similar to how FUT_OFF_INODE is already handled with
> get_inode_sequence_number(). That should address both futex_requeue()
> and io_uring.
> 2. Ensure that FUT_OFF_MMSHARED waiters can't wait on another
> mm_struct by blocking attempts to requeue FUT_OFF_INODE waiters onto a
> FUT_OFF_MMSHARED key. For io_uring, make io_req_track_inflight()
> unconditional.
> 
> I like option 1 because it also avoids feeding a kernel pointer into a
> hash function together with user input, which probably creates a
> timing side channel leak of mm_struct pointers.

I agree that option 1 is the sanest. Please write that patch.
