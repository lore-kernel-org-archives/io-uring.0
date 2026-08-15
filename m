Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2879737F8C4
	for <io-uring@vger.kernel.org>; Sat, 15 Aug 2026 11:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786792262; cv=none; b=HTnyboU1mB2kYdFltirZS6rnoE9kJIJ9AtYjOmxtoDTPJJZAF0LHgd1JRTYwYUQVK7ieNndT4yotgdFQjQUWcHWGIHs1+/L341sa9f4MJpgv84z7hPl3ant2fkZMd4iFpN/9hUxAk+spHzjVfuz4Y5ncyHLbcBgICvgFgITgWLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786792262; c=relaxed/simple;
	bh=o1zSb8nuAVkcmm0EH0JiPyVSy2x70dAJ4ZXp8/MUMbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kAMXwtoSx70JmWtEN29/1mTH6MxoW5e7ljGKIAPflAqWHcyodjlaCcApI/PraIoGBOXgYcaLVWAkDsbVVONNEGMUnr6zqTR2/Af/0urVJDPshe5nqS9HYVqkWo7mHd5x8VjFlfeSr2SqVIs6+fYUi5kKc/3W8UW2Pc3+4CNEWiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=TSahY/vw; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="TSahY/vw"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so24133215ad.1
        for <io-uring@vger.kernel.org>; Sat, 15 Aug 2026 04:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1786792260; x=1787397060; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cIhGudAOWrm49ZjUgTC2r/gP1J2NjmU3DxbhfPb7SHs=;
        b=TSahY/vws99RxFYCoPl5KMdJwuhQ/l0+3EmFw9A6UsTrAkfDDnNKE2ZNb8rBUAVxXX
         J80C7z8obZ2ya9R1lwFeheSEQOSJN+opsGGnjMB6eGMra2GQlIt0zz5YpCxMz/gLHldL
         LRwbj6eyzmZ/cmaEBeH7zvZCFoef/xJa+iKvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786792260; x=1787397060;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cIhGudAOWrm49ZjUgTC2r/gP1J2NjmU3DxbhfPb7SHs=;
        b=sXqlrYQyHvlu9zYJATMP69q4ZoLWH/mK7bg15aSUnIFfPH6m9KLXAMl2uTRwVYzuoY
         W2DEtwuhWSFiAl7g1butTdSvXOES0h9Y8kye+GKA7FZJrqeSfvZ+0MY3uFU3VJZWnygl
         L1gRetydPtwJCA6gWt2vPNzD5F+6taJda2o2UmrFrG5tcvOuT4ceF680f1StGbi824Oy
         FPyjq4l0uNb3YhL2iZEVo7ClFtSi7bCVE5+2NpLXaPCpCDEqPIGsXkYbvNDjWkNn0tD/
         KPflyzvR3RxtaVzUizO7ksN4ob0518uPDQobWhJ0q5BRxTdLvid5M1i81gz4ptk9YXE/
         7EsQ==
X-Gm-Message-State: AOJu0YxMJrtM7u84dBAgzW74n36MlyyE6R34kufrd930q9BYHygAPOuy
	eKGcKtu+5NQbJWfYKoQOnXMu2G211kavIADpR4KmhR0swglOK3D6RYkjF0+zChf2Hazq2KMYAj+
	jLe6V
X-Gm-Gg: AR+sD13qjh5wmY9v4a3ssLV/lmT6k8N1zFBirQu8N97EtK+PIBkN+6kMhOLYj/KrGW5
	UYC6lfLMbY/mZb/NPi7u2KTuKH/O12n05bGD2enNshoD+nhudl3tHjUfsuYHpeTGY2f2AOR4WV0
	PggZTgc97neQcUKbIcVw76F9kAnq+B7tff5fAvbdHwNEmOyMcHrmRz61WkzFP6EGrwh2n5pzU1Y
	prqTmh4FGqSMXBgNlgvpUUypBurojJJHQoT54EkACKMISog+FiWjGndqaXwEtybLvu3ljH5PTfp
	T2HSZkUiWsUAPWc3OdhfT7ZeMNM9g+ElJU0jwNyjZOhVI9NJxV9dPG4aTLCnbyv0RuNZL2BBxf5
	bR1/4pyN+xvMT9NzN6QMQnO+3NWACC4fyDHcr+YxfjC7SVvDqm2gGOomqEv7Ei6gMmzk/R5FmsM
	vaumehC3ShqBwgFtxo3IMRayLNwWzFig/cBwD+r44p8HzeiUcag6FQYWV8H0ywOUZxU0YzjQksQ
	ivoJx9fjKCSYyQrnwvaJjmw
X-Received: by 2002:a05:6a20:6a10:b0:3c3:ac5d:b6de with SMTP id adf61e73a8af0-3cc71d55406mr12115358637.22.1786792260388;
        Sat, 15 Aug 2026 04:11:00 -0700 (PDT)
Received: from sidongui-MacBookPro.local ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc095a43327sm1603497a12.28.2026.08.15.04.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 04:10:59 -0700 (PDT)
Date: Sat, 15 Aug 2026 20:10:43 +0900
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] io_uring/bpf-ops: wake up the loop task on eject
Message-ID: <aoBJMxDWsakOjOp4@sidongui-MacBookPro.local>
References: <20260814030421.61216-1-sidong.yang@furiosa.ai>
 <bfb153e0-d3f5-433a-963c-da71c1dc4850@gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfb153e0-d3f5-433a-963c-da71c1dc4850@gmail.com>

On Sat, Aug 15, 2026 at 11:26:50AM +0100, Pavel Begunkov wrote:
> On 8/14/26 04:04, Sidong Yang wrote:
> > io_eject_bpf() clears ctx->loop_step while a loop may be sleeping in
> > io_loop_wait(), which releases ->uring_lock before schedule(). Nothing
> > wakes the submitter task after the BPF ops are unregistered through link
> > destruction or ring teardown, so the task stays blocked in
> > io_uring_enter() until an unrelated CQE event or signal arrives.
> 
> If there is nothing to wake it up after bpf removal, it wouldn't
> be woken up without it either, it's a mess up on the user's
> side. What's the use case? Especially since you wouldn't
> normally be removing it from another thread in the current form
> of the interface.

Fair enough - I found this by reading the code, not from a workload
that hits it, and I have no use case to justify it. You're right that
if the CQEs the loop waits for never arrive, it's already broken with
or without the bpf removal.

Two corrections to my commit message as well. Ring teardown can't
race: io_unregister_bpf_ops() only runs from io_ring_ctx_free(), and
the sleeping task holds a ring file reference, so only link destruction
on another thread can race. And it's a liveness issue only - the task
sleeps interruptible without ->uring_lock, so the Fixes: tag was too
strong.

So let's drop this one, unless you think the loop should be stopped
promptly on eject regardless.

Thanks,
Sidong

> 
> > Since BPF ops require IORING_SETUP_DEFER_TASKRUN, only
> > ctx->submitter_task can run the loop, so wake it directly. The loop
> > rechecks loop_step after waking up and exits with -EFAULT. A spurious
> > wakeup is harmless because io_loop_wait() rechecks the wait condition
> > before sleeping again.
> > 
> > Fixes: 98f37634b12b ("io_uring/bpf-ops: implement bpf ops registration")
> > Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
> > ---
> >   io_uring/bpf-ops.c | 7 +++++++
> >   1 file changed, 7 insertions(+)
> > 
> > diff --git a/io_uring/bpf-ops.c b/io_uring/bpf-ops.c
> > index 5a50f0675fe5..87148dbd3b3e 100644
> > --- a/io_uring/bpf-ops.c
> > +++ b/io_uring/bpf-ops.c
> > @@ -210,6 +210,13 @@ static void io_eject_bpf(struct io_ring_ctx *ctx)
> >   	ops->priv = NULL;
> >   	ctx->bpf_ops = NULL;
> >   	ctx->loop_step = NULL;
> > +	/*
> > +	 * A loop may be sleeping in io_loop_wait() with ->uring_lock
> > +	 * released. It'll see loop_step == NULL after waking up, but
> > +	 * nothing wakes it otherwise.
> > +	 */
> > +	if (ctx->submitter_task)
> > +		wake_up_state(ctx->submitter_task, TASK_INTERRUPTIBLE);
> >   }
> >   static void bpf_io_unreg(void *kdata, struct bpf_link *link)
> 
> -- 
> Pavel Begunkov
> 
