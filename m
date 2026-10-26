Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793055393;
	b=u2EgtF5BNEw3Z4QQz4fVqcMeZaTcwXvNK5jKDvoJUOW1pmwNAVekVW/holWaYMeKvdiK
	 yBWNRCbkyINyL9vudZr4NjLiHKzhrHPq/VgUSzYvu1YVJkycBgGh7UnVomwmJPwyRIl3a
	 EL6WShZV5x7CnywMWGydQzJb/Z3UHxLcMCrSdRV00kn0aaNg6vDNDGQvE3FPbJ2kSYSpq
	 uDsf+jxN7sdhb41V5/PrNmqUyWSWAn6ofNGA+ZO2m7cLL7q2Q+8g7cQA0IdrQNoRLnc7u
	 9YeVSEOgrsXctUJD3wsVTrO8ji/s77eX9osTu5UXwzLCq8Q5VskR8XFTZNe7OwBZLwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793055393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qh7+bL2tt7/pVu5eSjikO++61ieI9Cj5ZNr8SJkHxX4=;
	b=Qpd/k157ZFrvpMAB7SvMnIYHYCYeJeeh8X8Vo1yLrs8K6YQ9z3OYGw9u9XsacY7KJ168
	 IJSvnk6iSkp7vE/CMTXMGQ/Da83FhlLS+Qjjk3YjGDWiwrd2KoGRhoos8RQzP2JW+lPI6
	 ONYsEsHvKWJVyXKYiFc8zehFFZgsVEcFev5fTsWHF6Gha/JlPeM6BNt0aF+s+o536fprq
	 p3o+gx56L/Pde5jg5L+f8KVM+7RG6dz9ziKJk44ag7BvuFYL9mX4YwFnOGfGHhvzBS5uo
	 XgRWLpdyEtpgvfAdcnSIF2O4MfUF+7L6tgLbQXXd8nfYM6JSKxKCZ0hjD3L/Wn2huZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=s8grGiR3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B78606A31B
	for <io-uring@vger.kernel.org>; Mon, 26 Oct 2026 22:56:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09B78606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=s8grGiR3
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4550d8ab15so454327766b.2
        for <io-uring@vger.kernel.org>; Mon, 26 Oct 2026 15:56:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793055391; cv=none;
        d=google.com; s=arc-20260327;
        b=sZzMHMHw90rLvXuza904OR1FoHEi/R+lTT2hs96jD/xKZPIey+8kz+BvK33eBjrCwU
         UWe52CJnoeOLDkq9rCYfrRGA6htX9rK3dnXNoL9m4c/1E/UINO8zdL+NOZzB4Rqsu1HN
         p1HJc7Q4AF6w3rJdirX4FuiKKOF5tkrgGjGVFXasU6xmK7XLIT8VA0BsEguxISeSyhBr
         0k83ZaI3M59yUr39axN30c8HSUuxuUUXdOUaf7BUR+XvNl9RcwJbvCu4m9FX8HaGXAZ6
         WhzT+s1HiSzjpyi5z5TiMcsxTr3lDUNmkzf3HvpiGkdaEPg23xMY+V0qF63tUgDr5eMg
         i1Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qh7+bL2tt7/pVu5eSjikO++61ieI9Cj5ZNr8SJkHxX4=;
        fh=vknUZkJ1WZDsICcAiVeKlQtxXsnfUjQa7LpYSHK7kZc=;
        b=dEhc8W0F3jZ+aH+lOZPPmERQ2LWaejBXHM1vz88YJIqhC7HG45H0zjWXyx74fg9GN5
         xGAB0veYYpPi47dUk7k4ZHtj//V56GFk3zImoNR4Ja7Y83X7n2UhgVvC0wEC5OBTmtz6
         3vUq62fR9mqTxU/DAv5cAwOID3TkY/hkLw0yRKz9PNBGyMQ5drJDzNz9qKJKYGBp0BI0
         HsbhgxZ/ZEDn6mMHoXCsWw8ufu2JmDpsRW5W/TiETQIzM0T1Nq8wZNYzDfbI9d2k1qJZ
         3qNPp5NJ/76oYda7fQO6mdTqRudOW/MTxFY50M3k+A7dIW1CW5+sfQdfNWQTej7eK4gR
         NpXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793055391; x=1793660191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qh7+bL2tt7/pVu5eSjikO++61ieI9Cj5ZNr8SJkHxX4=;
        b=s8grGiR3jmOk9ry50/nEnZjaxWjWOPyppi2m4MHQTMfb5el8k0obk5/UMSWfPsQmIM
         HPtLzsEa12OcSsVXiRmiCNw+UUDDo1UYyS6DiU9bwXoKmoGF82ns9DjJzrfs9pJWdjkT
         dIxIeAf/R+LNQl/XTj1bdocyLOLlTkNfh75pW2KuZcZpn6JGMaXwZms8i83nnm2msMhG
         qxuIapSALuC5I4z0EKwNizZvGG6PaVYwrsYFc03clQ+zaffY9Yi7+Rd9DeVq8TqQMsPo
         mOa9KjkQgAnBHYiQJzjduIMO8ab1In9zxpTDESz20wql691IHa3z4eYMgIiR+VfFmdpS
         4rSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793055391; x=1793660191;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qh7+bL2tt7/pVu5eSjikO++61ieI9Cj5ZNr8SJkHxX4=;
        b=2G8cCXZzCJ1O1ewLBuYppWjIbWUBOBm/Wc9lly0Xf8N2VVIPsB0AAw2YA0m1PAkv0F
         VAHM8+oSvh5Z596oen5c8P2pGEvPViGgprkzYRKcQDybfvI2LXJyeaybucVOnMJR+5rr
         6yy1SZQc0ei0oSRdz84AEA2dwrjhOTX/T8LqKTegHvCToq5SH33Yjw9VXI1hpKkcyZzw
         gknKk2lID+siq7s1xxajoXWqM8fuqicgQrhoWa7sQZY//7o/P72dANWm8LDaz8z6AftL
         QcT9kfSIjK7FCWaA6ZlfS8qsOrycUVceTEz26TS93qcE5suLULoccJ6Iovq9Tlr/+79H
         4M3w==
X-Forwarded-Encrypted: i=1; AKwUvBzcYjtO1yKu65QkLCz/FdirjqhEoVI8X4h+gbqiX0mvLNHEX9MPe+27ie5RFcR+tBND/Lpc6zewNA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJV/qMoqjzZwBLlH7f8ZKCpw5AtpY0vbz+9mS8YcSV3XK8aGtf/
	10U2VDY7CTw8il7N1WFlF+Hp+nXFEcv9EiWgsri+Fh0+9/YGnvCUZNb7RxvHmQ/0i6MKk/5M1rK
	iu3us/NM2NFbvIfnhKpSbPCl9sG3AQZQf8ktmS3Ks
X-Gm-Gg: AYBFou1SOHXT4nSU1z2zTvYdjBFDoLp3jCfPI1u2oCAyeyHn/AzFA2acSZo5LNNzjyN
	kpe6pg/3G6MXpbKZciLinBw29lfY6Mdy2B8qhJd8cgJXd8wEt1CppIsz7mmGp07LJ/Gr/7ofnp7
	Rx0XR0hr7ZtLbenxbAJzEWIOrDKFY9F9ENT6oGpGpG/G4WSx0grFfF/RlCBzQ1kabEtC5tz1f55
	7FEA7/F036wNsB4VRFAdTPeBz1anQjkvfJaxQgJJk/H5ND/pZsPSXT2jyc4RD+SqQEvKbyumigN
	jUzNG2DOz67ZGPgjx3HIr0Rac1T75KBwSoXAq6qbupyixxJmWuwABCVd/K/H5h5kers58IQmpln
	e2kF62UhF6fs4koZIRE4olEj8DWSDbFoHpipbL8W/8iXxx/QVEXm13Jh1myBLEJIR+iRvw/tW4D
	LL5LYkwffBy67RG2Y7Lufo3nukTiHqU4dJl8SJmNeSxyJYVDdtVAksV/KzVBPyeSVUTA5IvKn3V
	rS9jZ4C
X-Received: by 2002:a17:906:9c8a:b0:c2e:7da8:f54f with SMTP id
 a640c23a62f3a-c46bde874d7mr911731866b.38.1793055390933; Mon, 26 Oct 2026
 15:56:30 -0700 (PDT)
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026215226.3713941-5-jthoughton@google.com> <bce97570ea9665a2f83216d4dfd7ab7ce17d54aa777f761c3d12db430ba21bb9@mail.kernel.org>
In-Reply-To: <bce97570ea9665a2f83216d4dfd7ab7ce17d54aa777f761c3d12db430ba21bb9@mail.kernel.org>
From: James Houghton <jthoughton@google.com>
Date: Mon, 26 Oct 2026 15:55:53 -0700
X-Gm-Features: AclHuK_4pEIR4EnpfJkK690R4CHqdS4wt-7zneGKcf5MW03i114xuH5q5kcZiJk
Message-ID: <CADrL8HXeYRC8w7F7e_6ZXK6MHd6FRepN_zD632j0JPjNUDrLZw@mail.gmail.com>
Subject: Re: [RFC PATCH 04/10] stacktrace: Don't unwind the user stack without
 an mm
To: bot+bpf-ci@kernel.org
Cc: akpm@linux-foundation.org, viro@zeniv.linux.org.uk, tglx@kernel.org, 
	peterz@infradead.org, kees@kernel.org, arnd@arndb.de, david@kernel.org, 
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, seanjc@google.com, pbonzini@redhat.com, 
	jmattson@google.com, axboe@kernel.dk, asml.silence@gmail.com, 
	James.Bottomley@hansenpartnership.com, mkp@kernel.org, dsterba@suse.com, 
	mason@kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	john.fastabend@gmail.com, jpoimboe@kernel.org, rostedt@goodmis.org, 
	mhiramat@kernel.org, mathieu.desnoyers@efficios.com, mingo@redhat.com, 
	acme@kernel.org, namhyung@kernel.org, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, kvm@vger.kernel.org, io-uring@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-btrfs@vger.kernel.org, bpf@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, andrii@kernel.org, martin.lau@kernel.org, 
	eddyz87@gmail.com, yonghong.song@linux.dev, ihor.solodrai@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 3:30=E2=80=AFPM <bot+bpf-ci@kernel.org> wrote:
>
> > stacktrace: Don't unwind the user stack without an mm
>
> TL;DR: Commit message only: the Fixes: tag may point at the wrong commit;
> 7e8e6816c649, which dropped the !current->mm check, looks like the real
> culprit rather than 214d8ca6ee85.
>
> > stacktrace: Don't unwind the user stack without an mm
> >
> > stack_trace_save_user() only refuses to unwind the user stack of tasks
> > with PF_KTHREAD set. That doesn't cover all tasks without an mm:
> >  - A user task that has already gone through exit_mm(), e.g. when an
> >    event fires from exit_files(), exit_task_work() or the final context
> >    switch in do_exit().
> >  - PID 1 before it execs init, and usermode helper children before they
> >    exec, which are created with user_mode_thread() and don't have
> >    PF_KTHREAD set. E.g. booting with trace_options=3Duserstacktrace and
> >    an event enabled with trace_event=3D unwinds PID 1's "user stack"
> >    during initcalls.
> > With the ftrace userstacktrace option enabled, the architecture
> > unwinders then read the user stack without an mm. That access does not
> > reliably fail: the user half of the address space belongs to whatever
> > mm happens to be lazily loaded, if any, so the unwinder may read
> > another task's memory.
> > Use is_user_task() instead, which also checks current->mm, as perf
> > already does for the same reason since commit 76ed27608f7d ("perf:
> > sched: Fix perf crash with new is_user_task() helper"). This also stops
> > unwinding the user stack of PF_USER_WORKER threads, which never run in
> > user space, matching perf.
> > Fixes: 214d8ca6ee85 ("stacktrace: Provide common infrastructure")
> > Signed-off-by: James Houghton <jthoughton@google.com>
>
> Is the Fixes: tag pointing at the right commit?
>
> When 214d8ca6ee85 added the ARCH_STACKWALK version of
> stack_trace_save_user(), it guarded the unwind with:
>
>         /* Trace user stack if not a kernel thread */
>         if (!current->mm)
>                 return 0;
>
> That check already covers both cases described above (a task past exit_mm=
(),
> and PID 1 or usermode helpers before exec, which have mm =3D=3D NULL).
>
> The check was replaced by commit 7e8e6816c649 ("stacktrace: Use PF_KTHREA=
D to
> check for kernel threads"), which switched it to:
>
>         if (current->flags & PF_KTHREAD)
>                 return 0;
>
> That dropped the no-mm protection, which looks like what this patch resto=
res
> via is_user_task().
>
> Should this be:
>
>   Fixes: 7e8e6816c649 ("stacktrace: Use PF_KTHREAD to check for kernel th=
reads")

Thank you, yes that appears to be correct. Updated in v2.
