Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2229F44E038;
	Mon, 14 Sep 2026 11:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386425; cv=none; b=PzmGSFrEh6Xt5hwlk6kb7Gev0t7bg9ngGrdioHJOHOQdOftTJp6GrbUqv1bFUZkZZyiYiTaP5LpoSnDbvwboeGTixUBJ1Ez8jeFFrLPbNi4Iz+gwZisBggDfGK+raYOJfqDPas7972kYpbX5Vjni2EKgQW8I8qRQ0BEoWg1OT+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386425; c=relaxed/simple;
	bh=l27b+nBuBgtUA2P6QrelY7nyDVoeiCe9AQ/+OaTvlr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jjuhb99qdC7F+bEjYPpn/maHP/NTkDxV8hQVaiiBueZiWZaQWFRUYw0wclcU5MM2R8F3fHn0znL1cKSusO8Mg9d6vEFWa+qW7ArU62garKIAoQO4RhyEEZGdlgRuVCI074DDgvtKw8xaWi3eD5AfLcXMygW3l3q3aSIS4Ope6o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=VPvi9CQ0; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VPvi9CQ0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=k/lIyD0eJYyLLShpR2PrbSShwpZ11/bDU2WwZJxxg5g=; b=VPvi9CQ0iLIJ9++Sna1MZm6Jj5
	mdNWw198BGb2L/0ZKSclGf80KxDVQWuY4P69MnnkW0pGH+SFLDJ0NGHWuPqUtEMFandO5bIUUn/dK
	i4Noaj7daYRThxSqv61cKnbONHGxizpp4ToSlsfr4cSDWZtU8VNiHf0bXpZgD8PB5XZbyc20l2Eei
	GOaQq2y2hrffh+4prEjBkW9rYX2IMmK1GiVLnqoIN4yspmEZlQaOrC/gzu7+m/3YnBBJpHIpnSXML
	fkJUVqkZObRRxM8cLes6AzDMtHRv5uzAJb3L/o3OrbZjA3gF0vFqDri9pBDwuf5h32CtlZaaBSa5Q
	a79iP6mQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x659F-00000005YjP-1fsB;
	Mon, 14 Sep 2026 11:46:58 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 59D9830066A; Mon, 14 Sep 2026 13:46:56 +0200 (CEST)
Date: Mon, 14 Sep 2026 13:46:56 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, tglx@kernel.org, mingo@redhat.com
Subject: Re: [PATCH 04/15] x86: implement thread identity handoff
Message-ID: <20260914114656.GC3500130@noisy.programming.kicks-ass.net>
References: <20260911154148.644489-1-axboe@kernel.dk>
 <20260911154148.644489-5-axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911154148.644489-5-axboe@kernel.dk>

On Fri, Sep 11, 2026 at 09:40:54AM -0600, Jens Axboe wrote:

> +/* state bound to the task that neither side may have */
> +static bool thread_handoff_task_ok(struct task_struct *tsk)
> +{
> +	/* I/O permissions, the bitmap hangs off the task */
> +	if (test_tsk_thread_flag(tsk, TIF_IO_BITMAP) || tsk->thread.iopl_emul)
> +		return false;
> +#ifdef CONFIG_X86_USER_SHADOW_STACK
> +	/* the shadow stack is per-thread and would have to move along */
> +	if (tsk->thread.features & ARCH_SHSTK_SHSTK)
> +		return false;
> +#endif

Distributions are having this enabled, this means nobody will pass this
check.

> +	/* only the default sized FPU state gets copied over, no AMX */
> +	if (x86_task_fpu(tsk)->fpstate->is_valloc)
> +		return false;
> +	return true;
> +}
