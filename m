Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BE54C7553
	for <io-uring@vger.kernel.org>; Tue, 15 Sep 2026 16:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789488176; cv=none; b=XH/g16GlkmUnTWksLnnQnjiaQpW25XDLK5+ZQKAtpaiOEfvKKQw1gV03TIcjZn/6WTn8VAKgf02wc4FDOuvIEdcDTA/1JW6uJtoVG17qAbMYeg8RiAjYQq0OgnlmwauxLAgQKwj9UXVcEGSTwA3m5CpvcQGTNlcQWzQjVSW1YNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789488176; c=relaxed/simple;
	bh=TaD3IKHcoZf0PQ+wUUh3mHvOgYZf6uXYuUZRFHNcE+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HbIOhLKvA8zxFF3KW1vmtXB617jZBlZuQb3uWFq+rTJC/1eVMTymP6LZI9iqeVOuSgKI4rWF2jXAe7WpV/Yl4NDS0UaM7PbGzB4po9HkmL9J/gEdATFyLb2pSYCghK+NztVuKJHpGpsqTxb5faffYb7m5jKJPW/NPQdhqi6t4zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=fdYfMs4q; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fdYfMs4q"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a99cd5115bso5799225a12.3
        for <io-uring@vger.kernel.org>; Tue, 15 Sep 2026 09:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789488171; x=1790092971; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cj8iWYGkmy9fr6Sp+MjBMi0cvssqzarl8Tgut8FUMEc=;
        b=fdYfMs4q4uFUWs5wIOEkcXaeDEyhyTfMUtiaey9MWmBUxIFSL8f/zcbhiPQx8Uo04r
         1MnPHln+1qimsZKmkNdSOWfkgEJclVvM0pvnGEilQl4Z04wzPOwl/CWzuOu3Mviz9c6M
         KYxh+wliakI3bz4Z7N8nfHQAZb67A9v7aD+7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789488171; x=1790092971;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cj8iWYGkmy9fr6Sp+MjBMi0cvssqzarl8Tgut8FUMEc=;
        b=EPpSjMS0islr1O55pR9HnjK3n4G/cPt/S6BDX5ul/NF+juoKV0uiND0U1xcxp+eC5+
         1K6OLluxDOtBY1+OlaK95cyIThFph4+NYNPWL1LPw4imNjWn0KV7hJJJYhCrkUbfXnm0
         ttzcn9JNwAzg/dT2M7tpkZSC43OaV+7Bj1gzKenQVjoyDXeeWYyukAzdqUok8d42j3+v
         ieYymBqPON1f0lAcjpk1ka9jNLwc3LFuShlaOP+6ZTbJkjm8WXB4lqGC1VHWwH2ksMl1
         tv8QBlloosn7n3p8wKrg9oHJIx8gwIeK73qqbARy3jwJr94WAvfEqcLb0lXZolsXHkUx
         5ENQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSExBvY5qHWjIdfz7DefJiOpkvdVQJqQprhp5t0RevPsIxheSvBNK7IVVcv5np40DLAhav5jtY1Q==@vger.kernel.org
X-Gm-Message-State: AFuF++m1tYL3m4KnyndUHfb2Ru+ScPSGkNuaRHSDThjYgIqX1l3muyOx
	a31mLP+iUXr2feFILpms5HvQp2C+35tYHg2dOQ2zAobRzS/DLvsLTK8u/P25bi22MavzNrEeGGP
	eoqD/zBM=
X-Gm-Gg: AYBFou3uxvtm806k5oQpSM4GoJNIgUlbivfLPb7k5rxf8B8RgOjJ0ln2yYCxxXax46F
	jFNTfDiwVf8epUQp1UV2emKLIqO3kAIUGS9ij5gMXiy2NPfvEswLsRW7j0eGEEACpM3GwZnKmpQ
	DfM5ee8npzunMB/wTT2YIIyFJXM2yLn7ig+qwJI1kejYnwM/EBZEJzhsaoSy/b6I0LCTcMBG5wm
	iuLciS9uEJN49drZO+MTRP+1vse9f23bE7uMxFZVD3yGkCTshKLb3B+BYOKiAfT70lbNCpMTIMA
	5UnKyLJyQPw0JR5qcTwtrgjgYg8qw66wB1+abi7maN8FT/iRho/0oeC83c119qZV68JCpFV2No9
	jD6ZrNRDookEJXwm4Iab/6f8m0kKzAoHTbrQxv+B578aEa6NcXmSupcJeJlmGD4dFJO13hyKIPK
	cRK37EMTalGa4H8Pgjyv0nIb1of3JtrX18jKUiIJC3kSgGhdYoSHnN4A9DPUaKm9Ndm1nJaaUGs
	qsh9mDWrqhfDnRTx0soxvthzFjJpvXdkC/hpwGbUtj+rGZLKAEb+6lI96mj
X-Received: by 2002:a05:6402:322a:b0:6a9:9c40:37a1 with SMTP id 4fb4d7f45d1cf-6a9f63da424mr6003972a12.35.1789488171296;
        Tue, 15 Sep 2026 09:02:51 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b592470asm5984225a12.17.2026.09.15.09.02.48
        for <io-uring@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 09:02:49 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa4c24cso537076666b.2
        for <io-uring@vger.kernel.org>; Tue, 15 Sep 2026 09:02:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw6wevDJyXwfUw1KNN3Spb8EV4dQ/27FhPJ4Wwq08zUxXrmUNuYbhWz7tYQTNG1IHngrA1bZlZelw==@vger.kernel.org
X-Received: by 2002:a17:907:cd0d:b0:c29:439b:d5c1 with SMTP id
 a640c23a62f3a-c29b86141b9mr553591866b.16.1789488168046; Tue, 15 Sep 2026
 09:02:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Sep 2026 09:02:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
X-Gm-Features: AcwNN1WK06t9f9BcKFBIanysXcyUXK4eRICuH4x14s60AdlpF6ijCATIYaYAAvQ
Message-ID: <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jann Horn <jannh@google.com>, Jan Kara <jack@suse.cz>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org, 
	netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, bpf@vger.kernel.org, 
	David Airlie <airlied@redhat.com>, virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	kexec@lists.infradead.org, linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sept 2026 at 04:31, Christian Brauner <brauner@kernel.org> wrote:
>
> TL;DR, this lets arch code handle fd install and cleanup. fd_prepare()
> allocates a descriptor like get_unused_fd_flags() does and records it in
> a slot on the task. fd_stage() attaches the file to that slot and
> returns the number.

Honestly, I am *not* a fan. At all.

I think this adds complexity rather than removing it.

The diffstat tells a story:

>  106 files changed, 962 insertions(+), 861 deletions(-)

in how this adds a hundred lines more than it deletes.

But to make things worse, it adds them in bad places: low-level
architecture assembly code.

Those extra lines are *not* making complicated code simpler. Quite the
reverse. They are taking fairly straightforward "just deal with errors
with normal cleanup in the place where it makes sense" and makes the
*straightforward* case simpler, while making the big picture more
complicated and subtle, and adding new code to places that are not
simple and just blindly do somethign that makes no sense in that
context.

IOW: it's more code, and it's more abstraction, and it DOES NOT HELP.

And yes, most of the well-maintained modern platforms (read: x86 and
arm64) use the generic infrastructure and they don't show that
low-level asm effect. So for those cases, it's mainly just  that added
conceptual complexity and a new odd rule - and makes a *successful*
system call go through that "extra work" and indirection phase that it
didn't use to go through.

So it just spreads out the work, and moves it to a less obvious place.

All for the very questionable advantage that you can now randomly add
a file descriptor without the few lines of fairly straightforward
rollback.

IOW, I do not see a single real upside to this, and I see immediate
downsides to it, and a more abstract complicated machinery.

I do *not* see why we woudl want to make this be a "every system call
exit" kind of thing. If there are places that think it's complicated
to do, they could have *their* local little stack of fd's pending. Why
force it onto the low-level system call entry for every system call
when there are only a small handful of actual real cases (the vfs
itself, and random ioctl's by odd driver subsystems).

              Linus
