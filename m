Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792474189;
	b=eqF6Ayc/Yk5682D7X3ONyWNAy/ftEwY2u81BtCdSjrAcjVYJOqLi/LvsF9ya4yYjM9Ed
	 pdC1oVjCzrHaBqIWp7epeZ0xragDmas/fH37TVxftrdg9quKRZHclZ+Xe+bKGnTYvJjzR
	 0/VT8hRWfRQt6/JxSkSazQEEV5Olmei7xRUWe1WCo/5T18WepSeRTdXtnFn3LqJm1D2Em
	 hvcJgswjxUklfKD9srPTMOZNNaiHiPrnqCmFtl/ofc0sCHLfg3HOcVCoJwRWpz1OUvfEk
	 XGHrcjQ6SCYrdW0QlyJWCFiZgrlvtpvYNIRCHLqW2mnrG2QeXG6OtIaNmpSYRLmAU+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792474189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tHAjKdka0IAEGQfm3qc8oW1fRsGpvdXl9O5QyjZFVAg=;
	b=tdcqL8bGs6jAvm25H2G2Ku+T1SgmtgIhtAUDPrfwMaqUYJvYOrJLrEoaLayth2hUFQRc
	 GWbppWFsdIPc62zC8baXj5tcR05lZzapAReapE9B2lB7b5DM4brNbb4BQ+Dz9mQUwQUqZ
	 fx5dnbFNjNcA2EmnNQMjyv9s2qVR8E55UFR41eMIOQzTGmMedZTBLFTscruG+JkxrHnAx
	 qYq+5TgrE057peyHG17u5u4BxlsXF91RZ5gB1xsp7weCoqFQNd1EuX7ApNXXIyliwWU5E
	 g9PN3gdbHA8WEuFRNws5sHXk5VQUQJ05yYoDc7eOv54csUv8EeH1XXJ3PTlJE1N2opw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n5+kTXHa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F50606A31A
	for <io-uring@vger.kernel.org>; Tue, 20 Oct 2026 05:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6F50606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n5+kTXHa
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93f2b8cf037so225270085a.1
        for <io-uring@vger.kernel.org>; Mon, 19 Oct 2026 22:29:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792474187; cv=none;
        d=google.com; s=arc-20260327;
        b=SSDsnOGoibYzPVuFz4vFO5RbksH4qBzZ+fG3umgRtu8JrOmJmUTJK/ttRRNyeacdit
         ntEHHXvAFxlFoEhPBSbWO8ctjMewV61eJ7r7FFTcw1530+IdUZ2yN+PadmijwGoAJLga
         El7hnCvkPpxpYnLvgA2Thd6gruN8btDIy9PpY0iWVINDXSTTJgkiONNGGCDSZr1PKFuW
         3X1yhR7UvGpYkNeKKd3P/p6KZgWLZWKNO8qBs9uXz/T4cD6y4rmcosPXSoBdWJKKa5+j
         O+oDjXtFBdXOA+9hSjDgzoP/rWc1sWERzo3oFMuPeE58NbV4xnLAmtFpeh7XGKDQsIBw
         Yyag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tHAjKdka0IAEGQfm3qc8oW1fRsGpvdXl9O5QyjZFVAg=;
        fh=xR+Mpav1xwMgEy/Zm0HxIzOCcFAJ8/1kM0WiEBEbMBc=;
        b=Cu87iKNVpDAXgyrRT6Z75Rhf16OaO3qTDFKdep3AV5nmb+qWfJQvMmfqwYnHREQdZc
         oWXYC52o7KAj2wlo1YdZdVjiFcsuVvZlDnwAs2dkF3fTYB62Zge4dCwcuBSdhs2BlluX
         0sQnvMwgvjTYP19QyQ168soyRf2fTJ3ONOXvFAqlI/IMddhfUyXzUJ7EI0iBQnxgWD17
         MphHBlseQRr6G9qBW0Hd+w2tuPB53q0e4IGRDgbjO5AAXXV07+ZRJAJSDyhSDeWD/Zjo
         jTjocVFKFpYYtexM7gVQG79DhFB16sCpWqApZPTYkgjqx+jfxNkmQLM3BtRFEGzCeBQN
         PHng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792474187; x=1793078987; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tHAjKdka0IAEGQfm3qc8oW1fRsGpvdXl9O5QyjZFVAg=;
        b=n5+kTXHasuicYviffMU8HhNzFbnSLJolY/w0BEX+uxjFA8ePrLtwQdWpizr6WVFfi8
         LrAUqDxcEqbkqllSHdwLmdrsIeN/YqHqeQL/dT5rcO5lHroYB9rjLnqdKteK8FM4Nw4J
         jtWtLrcNEHHhk+PZhLmWUhYLScXdnxAFoTVhBriwUkd8XBLMGdRHmSwBOAZ6GY2XXQbb
         vMuRoidzoU/Gd0jpucqoqETdJBcoRxdgiq75jbheoXtWZCAEOfmSaIiHvYzWJ0NflAvW
         CNcY3w3Xafer+Cp4BkAZxjqAs+pA74VpWOCc6zbmG72CMDCgzpfc86I++Wk7JoIoEg5e
         hvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792474187; x=1793078987;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHAjKdka0IAEGQfm3qc8oW1fRsGpvdXl9O5QyjZFVAg=;
        b=YEncqUf/TU/zdC/HgQqncGE/R+ediyz3v33dxXoi8DgvXMHgXw5Ghdh/yJv09Vw59V
         aVNwbZnHKhrYbSkTyripNmGVRe0oB4IITNw1Oz48QuJvB/lasJqCLIaD9mm/lpDkIoz9
         /FYxfyzA6b2YMEps76uxuE/bAZl8yT9U/w4WhHSXJFlizB1hCzDHrOJAGkUGY8CGVCSv
         6SMG68FqUkr+YXaYo7gwKBYMBHqyXpoWHMjhtXOy+AZBJRTuMeqEmml1G7fqM9yUDj7K
         17IEkCuATBeAb9iRGqqcrDjG4tq2Hi+MP4E/RWT0ghSdaUIJC2fGp6dJPDd0Zt5j3m0c
         30Ig==
X-Forwarded-Encrypted: i=1; AKwUvBz1FXtFfZKF7S3aVEp3u43M6B1SWUJyMlZpBMkTYzjSB+EBJQOz0j3ppolB+BJlfB0RKL1KqR5Vuw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLCoYcFD8zBAzmMkYC8bEMrocjpeZBbT8RIGg2vUJZV1KlWKhlM
	a3jmKYvXM+bXaUPWPfs1YKRMFRcU/qV6K1utshn/BHq5mGG+RBQGQKUDorgj+R7+Yxqi9U55/Wv
	YkNYz3ari7mYOPC3F2k7vuo/Gm6c8ZzvWVV0P
X-Gm-Gg: AYBFou0YzrRh0yJGllKFXuFr28S3Th7RV/pHkyQ9q4fdr3BV9nHXPIn2bgJL2H6JEzz
	ycuGQ1XzC1BI2LCJK44TKbpQuQcZmXg5i+GVdZaiMxZJj+W4LqmgLxoxCE3SttIsXOFsWXmMyOy
	gNREXZ0WQ7tzzW+ajhAiBOKa4hXgSqYSIYyzAMOSqYwsH9aMRxjXFatIftrk13tayUYkaWl9285
	DteeLLVbASrPLxsmRW/RdkIXqX4nD7NWf8DpAlrHSZQCaQk48FMHd53SQIJBIqiL2UBeZqIGReO
	1FAchyebisEc+G1QmzU7ZUib8T3KjNM8tA9fmmi+SfteRQB+/a8a7cPqXQ81+tcE5r6A6mlSznl
	xhCyS1z9JUBEixuC6ScTJCHWeA4CS0mpB8HJAJjh2+VHmhdp1AxLUWuSCT6BI/Z7xd+IzUkK3ox
	BljmTECKGLfeM=
X-Received: by 2002:a05:620a:3950:b0:93f:2463:f78f with SMTP id
 af79cd13be357-93f29d81cb5mr1631822685a.62.1792474187518; Mon, 19 Oct 2026
 22:29:47 -0700 (PDT)
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019231243.802569-1-austin.linux@gmail.com> <6bc4e237-353b-462f-b388-3844821dd67f@kernel.dk>
In-Reply-To: <6bc4e237-353b-462f-b388-3844821dd67f@kernel.dk>
From: Austin Schuh <austin.linux@gmail.com>
Date: Mon, 19 Oct 2026 22:29:36 -0700
X-Gm-Features: AclHuK-3C03Y2foM4nH1_Fagl2dH4K7q2dr8npdWhOWTe2qyEiaSppZtHzBVMF8
Message-ID: <CABsbf=Gnw0+u80oebHZf24m94YSHDxFtYY2-Bq_=bMfvqUUvkg@mail.gmail.com>
Subject: Re: [PATCH] io_uring/futex: return a wait's data to the cache when it
 fails to arm
To: Jens Axboe <axboe@kernel.dk>
Cc: peterz@infradead.org, io-uring@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 5:54=E2=80=AFPM Jens Axboe <axboe@kernel.dk> wrote:
> Patches like this have been posted before, and my question is
> always "is this a common case?"? Reading this:
>
> > Notes:
> >     Based on for-7.4/io_uring (5b01d5955ac2).  Built for arm64 with
> >     PREEMPT_RT, W=3D1, no new warnings.  The numbers are from an equiva=
lent
> >     change on 6.18.39-rt on a Jetson Orin Nano, counting kmem:kmalloc/k=
free
> >     by call site with bpftrace while a test loops on IORING_OP_FUTEX_WA=
IT
> >     with a value the futex word doesn't hold.  Happy to turn that into
> >     a liburing test if it's useful.
>
> makes me very much think "nope, not at all", as it's a deliberately
> failing test case. And yes if you keep issuing failing waits,
> then it'll drain the cache. The cache is for the hot FAST path,
> which is not an error path.

Fair on the test case, it only showed the mechanism.  But for an event
loop, -EAGAIN from a futex wait isn't an error path.  Right before
io_uring_enter() re-arms the wait that just fired, the event loop loads
its futex word.  If the word has already changed, it handles the
new message and re-arms with the new value instead.  A message published
between that load and futex_wait_setup() checking the word makes the
wait return -EAGAIN, and that is how the loop learns there is more to
do.  The window can be shrunk, but not removed; nearly all of what is
left is inside io_uring_enter().

Here's how often that happens, measured on a Jetson Orin Nano running
for-7.4/io_uring with PREEMPT_RT.  The event loops are AOS (a robotics
framework).  Each one keeps one IORING_OP_FUTEX_WAIT armed per channel,
on the channel's queue index, and re-arms it after every wake.  One
channel: a SCHED_FIFO 40 publisher at 2 kHz with a SCHED_FIFO 40
subscriber, then low-priority processes publishing and subscribing on
the same channel as well, then interrupt and system load on top.
bpftrace on fexit:io_futex_wait counted, per process, the waits armed
(IORING_OP_FUTEX_WAIT issued) and how many of them returned -EAGAIN
instead of sleeping.  Two minutes each:

                             real-time subscriber    low-priority procs
                 messages/s  arms/s  -EAGAIN  rate   arms/s  -EAGAIN  rate
  pair only           2,000   2,000        0    0%        -        -     -
  + low-priority     12,200  11,020    1,292   12%   14,760    1,229    8%
  + load             12,200   9,830    2,797   28%    4,120      377    9%

(messages/s is everything published on the channel, arms/s and
-EAGAIN are per second.  A subscriber arms fewer times than messages
arrive because one wake can cover several messages.  Under load the
low-priority processes arm less often because the load takes their CPUs.)

In all, 2,520 and 3,170 arms a second failed in the last two runs.
bpftrace also read the futex word as each failed arm returned.  Of the
683,303 failures across both runs, 88% found the word exactly one
message past the value the wait was armed with.  So the arm raced a
single publish, not a backlog.  Load makes it more likely because the
stretch between that load and the kernel's check gets longer.

Timed from syscall entry to io_futex_wait() returning, 74% of the
real-time subscriber's failures came within 6 us.  For the low-priority
processes, which can be preempted in there, a third took more than
40 us.

Without the patch, each of those failures is a kfree() and then a
kmalloc() on the next arm: about 3,000 a second here, from a slab cache
shared system-wide, and more the busier the system gets.  On PREEMPT_RT
the slab slow path's list_lock is a sleeping lock, which is where this
started for us.  The patch doesn't change the armed path at all; it
only stops the cache from draining.

I can send a v2 with these numbers and this explanation in the commit
message, in place of the synthetic test.

What I'm after is a futex wait an event loop can reliably re-arm without
latency spikes.  Is there a better way to avoid the allocation here?  If
you'd rather not have every failure refill the cache, I can limit it to
-EAGAIN, the one failure an event loop hits in normal operation, and
keep the kfree() for the rest.

Thanks for the prompt reply!
  Austin
