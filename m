Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73A03D9DBF
	for <io-uring@vger.kernel.org>; Fri, 31 Jul 2026 08:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785486709; cv=pass; b=MHR/xiT+O98FaefOjnb9uP2anUzPIcbNVDooB8BrbRrHzp2ysxKjPYKIOH35s9HgB/GBPd1XH9kxKylTvPM8Nc6Xb6xo5QftYS+h/voK5gZWpG0jIka86GTFbLsN7vQgSqxRbMBklYbr7fJgWChaJxuiWcnZjhYhfTSQpl2xios=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785486709; c=relaxed/simple;
	bh=Lf0WC8Q3tAhvSJBH2fmrav20dF61iSlxYh25lwcTKxs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MdLQ0P943tjms1Aokoq5oermqwp/usCB5zOq60mjUFPW/1GtXqKgw/5MwBqdwqSSWYO4/1feHpz0feiV8O2H2AgxsDgASnTD2yOwhGgYP45rTvKlSH0M08gwhebsL6cxmzMqpfsNDmSRnFG5J0G+pFnC+5Gp94Dhsnwbm9Orz0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+X7V/Y5; arc=pass smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+X7V/Y5"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39c74722e27so6767441fa.0
        for <io-uring@vger.kernel.org>; Fri, 31 Jul 2026 01:31:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785486706; cv=none;
        d=google.com; s=arc-20260327;
        b=lHGWErUmvEzcRLu8mQxjwbrK5sLGTnh+yh+8lL6n7Szxi3X9zMbjqhlgJ+TaA79bW9
         H8GRf6oHz1ORq7Nq+OFuftt+vUDgDlF9bwE0D4RjCzUoR0dQ0+HCJWI6uGypwO67DWJE
         jhmlIgGQuno6BLfIXtONbM8rkmzUfXEWclvwuIhB0tzZVluQJNyn3HwahpTTLs5tTKBZ
         H/EutOs4LufaPV5P0qjVKqOpeze6mgJh5TaxAc04Q+LuY/aEtTAofxkOXqRpGVZGLR1k
         WLbdChm6TPOoPVF3t+5SEsy5qydYd0dVQC6Y8vw/BZg/JHG1bjoN9PSJpjN8RdkAcwPY
         90SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yoP6AStk9lcM1PY+UBbnbUWksTES850rBwTW5QdUl+Q=;
        fh=Lr4RBnPuIx0al2fuBqJ2kbdtECmqLQoQs+kNTuEEChA=;
        b=In1ZfdWGwVmWnQaarpn3hQIA/LNbgGEk2Dv/ZL1F0iDmvIw+vi3GMXUi9Trv0fOl+4
         41PAl3VSPdLXJ5ERL4VxOawXpL1KthBHvMBr6lCAkcgigwi43JtwiJ2Egxzbpsj+MJv0
         ZYB986ieNAWLtGvBsjA3egTeUtiY6kwBZRn14aapCPaWJdJ2xx3A+MdTd6H7lfRmgaUq
         aoY0x09QMND5S+hyCQ5QOpoX/UzZN/r4jiYsAASGYFQVDvGusyki2aOi3+Sa97gX3/0g
         Xe7S0nmtKL/U1mGFu2K4Ae7P9f2j5hI7XYR+Sdk8oAWSLvbfN3eQ3KSy6mjeWGYSdNHF
         dumQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785486706; x=1786091506; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yoP6AStk9lcM1PY+UBbnbUWksTES850rBwTW5QdUl+Q=;
        b=S+X7V/Y5qQrcPCUj/sbPl3tIpRGyTXhT/lFwLGweNpsYQ/5AGpZmJu0JlUX42j97FL
         Cqj06Eko97zCcSSfcZfvuSt/XqYexJz7MK283XvyxANRzCS3bW6GjaCbPXerpAmFuBoC
         zxwdup+fjHT7DmcLYNVp230ASYW//pFa+JAnQNgX3JnIU5JFxBI+BZfXJ7sIDHpQP2j0
         25VSirCVlcL9EUo1fTNA7Olq2biApaU67dxfteKId2UhzFTZEEwGmZphGnWAFzHwXq64
         455ZRJiIjOeHFYkuw0v2BQ6EEhwVEN+Mg16yyquie0mfIa8MXlP5HmQ7phD3VkTrTbUd
         2jsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785486706; x=1786091506;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yoP6AStk9lcM1PY+UBbnbUWksTES850rBwTW5QdUl+Q=;
        b=m+hU25kTtMQ+IIqFQ6wgD3tV6Bharb+B47Pj922SmdwV6j2ItKAbhtWeA7HHkUxmu4
         MD55ySUeib6oHi3HOtwZkAAT0q+U/aRt2axE+vm6eygcI7hijzXueQnZx87UuzKbDmaZ
         ft/6ljF/a5tzOx8bZxCJE5PT91BRGH98uoOe6y8s+6UBFHY1HiTptHnCSSRlTNv8+V3H
         rye1sioczTzfy83cY4Ev7nqyY/jOvGpq+ub52Krf6ZmcLrtv5EKSP1GyLxSFcyvgf2jS
         BA4Meb1JoVEuZsno4nWIw92YIxF/zD34eqLMmv9CkyVScJNCaxxqFR3h3M/pKv+7WKJv
         xbBQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr6lGOEoE2tBv9h3hSf/+XZLailuRpHbhWwdcegU8MSr2WolxcC5A8xJe+qS0AsOrOXPh7E8biTkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYrPRaV24RtSrTaT4q+ouuzZgf5LPQVQMToJO1sAI0O1PRblfq
	I0JVTjQgiqIk4ykIer3odJ5lVAWP6pH63882fZkhROzs1JdY+vCBr9CtXBs2KUF61lSBu4QFwz1
	mcp/Aq31iDcwPjJmplYlTefKKKCM3XDU=
X-Gm-Gg: AR+sD11JLRhv1xLdL4sK9FRv7wqvef5DqRUnfh/Z4x6HQNw5bWMGKJVMjgLw9QRFJ7r
	ZZBgE3hhG5gqpwUDU6YHr4FQgOVgEtqTEhDn0vgnCcv0+TRFM9c0+kjq3oze8TXYYl9+SNlMGLY
	8AdpWTu6yKywDWZR66n5RGo63YDAGbNWZodGX8UoqMyESOsRZtB4j3IvtT3hs1nP2GOM5pKHeHq
	UQuhKZF5V0+qhl+u7pviGyNQe/ZUrzlf7cFNRXdEEnxHLvBC9xUYyb+GSVv/2lTwvt8A2z9Ifa7
	j6tzrzaR15w5kwbXrqC0yRWeIC/7d259GyQPSevEdzw=
X-Received: by 2002:a05:651c:1472:b0:39b:e29:ae04 with SMTP id
 38308e7fff4ca-39f7eb5332amr1719691fa.0.1785486705119; Fri, 31 Jul 2026
 01:31:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANGjgdn=R_qyUdE=j9za+vkmqcxacbP-84OHXF4nZ4ho9qRyVg@mail.gmail.com>
 <e679211f-f036-4cd4-887a-430aa9376fc1@kernel.dk> <aa84c27c-d9c5-469c-9e95-9f8dd3fe47cb@kernel.dk>
In-Reply-To: <aa84c27c-d9c5-469c-9e95-9f8dd3fe47cb@kernel.dk>
From: Chengfeng Lin <lin2530632123@gmail.com>
Date: Fri, 31 Jul 2026 16:31:30 +0800
X-Gm-Features: AUfX_mxpxaP6GY3_iiaGjV-pklDuNcPtKvihuybTcP82x690KmMKzfFHgNnD9Z8
Message-ID: <CANGjgdkhQZWntcnpa2zBshGn_E7yaKDnPcSbH-HBBfXGWAw1+g@mail.gmail.com>
Subject: Re: [REGRESSION] io_uring/futex: scalar wait/wake slowdown after 079afb081c42
To: Jens Axboe <axboe@kernel.dk>
Cc: Pavel Begunkov <asml.silence@gmail.com>, Robert Morris <rtm@csail.mit.edu>, io-uring@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jens,

Thanks for your reply, and sorry that I forgot to include the reproducer
parameters in my previous message. The exact standalone parameters are:

  ring entries: 64
  futex words: 32 private u32 words, one per cache line
  futex flags: FUTEX2_SIZE_U32 | FUTEX2_PRIVATE
  per cycle: submit 32 scalar WAITs for value 0, then 32 scalar WAKEs
             with nr_wake=3D1, then drain exactly 64 CQEs
  per round: 512 cycles, or 16,384 WAIT/WAKE pairs
  run: 3 untimed warm-up rounds followed by 15 measured rounds
  machine: Intel Core i7-12700KF, 20 logical CPUs, 32 GiB RAM
  CPU: one process pinned to P-core CPU 2

Each WAIT CQE must return 0, each WAKE CQE must return 1, and the program
fails on a missing or duplicate CQE, an unexpected flag or result, timeout,
CQ overflow, outstanding request, or CPU migration. The normal command has
no arguments:

  ./io_uring_futex_wait_wake_standalone

I also tested the exact two patches you attached on frozen Linus master
48a5a7ab8d6a. I used the same normalized config, GCC 15.2.0 toolchain, and
Kbuild metadata, with a fresh boot for every measured point:

  baseline A -> patch 1 A -> full series -> patch 1 B -> baseline B

The means were:

  point              ns/pair
  baseline A          196.271
  patch 1 A           191.071
  full series         189.900
  patch 1 B           188.824
  baseline B          196.962

Using the surrounding-control midpoints, patch 1 was 3.392% faster than the
baseline and the full series was 3.416% faster. Full versus the patch-1
midpoint changed by only -0.025%. This is consistent with patch 2 retaining
inflight tracking for private waits.

Baseline drift was 0.352% and patch-1 drift was -1.176%. Dropping the first
measured round gave -3.323%, -3.345%, and -0.022% for the same three
comparisons.

I then added a matched --shared mode. It keeps the workload and timing the
same. The only changes are that the words use a shared anonymous mapping an=
d
the SQEs use FUTEX2_SIZE_U32 without FUTEX2_PRIVATE. This directly exercise=
s
patch 2's scalar shared-WAIT path. I compared:

  patch 1 A -> full series -> patch 1 B

The means were 271.107, 267.254, and 271.971 ns/pair. The full series was
1.578% faster than the patch-1 midpoint. Patch-1 drift was 0.319%, the
drop-first result was also -1.578%, and the maximum CV was 0.200%.

All 120 measured rows across the private and shared tests passed their
checks. All eight measured boots actually ran with preempt=3Dfull; the proc=
ess
used the performance governor and EPP, with Turbo disabled.

On this frozen-master baseline, patch 1 reduced latency by 3.392% in the
private-futex workload. Adding patch 2 did not materially change the privat=
e
result. In the matched scalar shared-futex test, patch 2 reduced latency by
1.578%. I have not tested shared WAITV.

This is a different source baseline from my earlier direct-parent test of
079afb081c42, so I am not subtracting the 3.4% here from the earlier 9.27%
result.

The compact results and exact patch identities are available here:

  https://github.com/lcf0399/linux-regression-evidence/tree/87da380476eb56c=
b3642d6ed15baf22c59496094/io-uring-futex-inflight-wait-wake

Thanks,
Chengfeng

Jens Axboe <axboe@kernel.dk> =E4=BA=8E2026=E5=B9=B47=E6=9C=8830=E6=97=A5=E5=
=91=A8=E5=9B=9B 23:49=E5=86=99=E9=81=93=EF=BC=9A
>
> On 7/30/26 8:34 AM, Jens Axboe wrote:
> > On 7/30/26 4:42 AM, Chengfeng Lin wrote:
> >> Hi Jens,
> >>
> >> I tested 079afb081c42 against its direct parent on bare metal. In a na=
rrow
> >> scalar io_uring futex wait/wake workload, the child was 9.27% slower. =
A
> >> separate 338-line standalone reproduced the result at 10.02%. All comp=
ared
> >> kernels actually ran with preempt=3Dfull.
> >>
> >> #regzbot introduced: 079afb081c4288e94d5e4223d3eb6306d853c68b
> >> #regzbot title: io_uring scalar futex wait/wake slowdown
> >>
> >> This is a focused synthetic microbenchmark, not an application benchma=
rk. It
> >> uses one raw-UAPI ring and 32 cacheline-separated private futex words =
on one
> >> pinned P-core. Each timed cycle submits 32 scalar IORING_OP_FUTEX_WAIT
> >> requests, then 32 scalar IORING_OP_FUTEX_WAKE requests, and drains exa=
ctly 64
> >> CQEs. Every wait must return 0 and every wake must return 1.
> >>
> >> I used a fresh boot for each point:
> >>
> >>   6a8118a77eec parent A -> 079afb081c42 child -> 6a8118a77eec parent B
> >>
> >> Each point had 3 warm-up rounds and 15 measured rounds. Every measured=
 round
> >> ran 512 cycles, or 16,384 wait/wake pairs. The results in ns/pair were=
:
> >>
> >>   implementation   parent A    child    parent B    child vs midpoint
> >>   formal              180.079  196.647     179.856        +9.268%
> >>   standalone          180.171  197.856     179.502       +10.020%
> >>
> >> For the formal source, dropping the first measured round gave +9.269%.=
 Parent
> >> drift was -0.124%, and the maximum CV was 0.169%. The standalone drop-=
first
> >> result was +9.996%, with -0.371% parent drift. All 90 scalar timing ro=
ws
> >> passed the CQE, result, timeout, overflow, outstanding-request, and CP=
U
> >> checks.
> >>
> >> An untimed child trace also hit io_futex_prep(), io_futex_wait(),
> >> io_futex_wake(), and io_futex_complete() with the expected request cou=
nts.
> >>
> >> A matched WAITV -> WAKE profile changed by only +1.385%, below my prer=
egistered
> >> 5% signal gate, so my claim is limited to scalar wait/wake.
> >>
> >> I understand that 079afb fixes the exit-time use-after-free by keeping=
 pending
> >> private futex waits visible to cancellation before their mm state disa=
ppears.
> >> Scalar WAIT and WAKE both use io_futex_prep(), so in the child both si=
des of
> >> each measured pair execute the added tracking call. I am not suggestin=
g a
> >> revert.
> >>
> >> Is this per-request cost an expected trade-off for the lifetime fix, o=
r could
> >> the same exit/mm-lifetime guarantee be retained with cheaper tracking?
> >>
> >> Evidence bundle:
> >>
> >>   https://github.com/lcf0399/linux-regression-evidence/tree/65c8cbf86f=
40cbe759e3f7db1d29d152ba03a8f2/io-uring-futex-inflight-wait-wake
> >>
> >> Standalone reproducer:
> >>
> >>   https://github.com/lcf0399/linux-regression-evidence/tree/65c8cbf86f=
40cbe759e3f7db1d29d152ba03a8f2/io-uring-futex-inflight-wait-wake/reproducer
> >
> > Great report, thanks for that! I'll take a look at this. The inflight
> > tracking is a bit of a big hammer for sure for this, and it isn't even
> > needed on the wake side. Can you tell me what parameters you're using
> > for the reproducers?
>
> Try with these two patches.
>
> --
> Jens Axboe
