Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE97B58E2D5
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 20:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792096208; cv=none; b=Va/j0JAvpawRx87gdGkhxQNVcevWtvFMS5tjlEg5bHJqSmOeLwhBDso9Dp3TLG2q2ma37K4MKF19M0c2SCfv3PP0yzirdn5jfK/JIqfvPLfVvp2CU0sIKT9pXzl74TB/BZhBUAxnHssMT4/74Hdv6ZuRNQT1t+5fKmClj3/DyMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792096208; c=relaxed/simple;
	bh=ygPHMn3FOGfSzz94RmoD6C5HYCPIRe/ZrEkE2VJK1ew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NRsEP1MRLA2er3xg/Xlf76q19yv+ApznyZ5vzkx6bHAzQrk62/jloQAEObMX4ivqo8PFFXnj3rVdoGA7g90bx4oBhUO6jB5v9sfIOJd/IqGk/PbguXAc1FDwg/ds9VYLIN6biQtaMc7O8RUMzB4ALxMuzQw7mhci9zaPflR8bUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=f9elU4nW; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="f9elU4nW"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6de1ca1b05aso3791390eaf.0
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 13:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792096206; x=1792701006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4AIbma4tjuLRzJ4ycI85jwstBKmCUvxBUVyzwWqKymA=;
        b=f9elU4nW9xuWqGLRkiZUDcaPWkFSaKVH2cPnwTtFfY6a6D9VIwY3BxsrSzhzbyn+vV
         B2kcgnQuvIhboiljP643duxuteojOVqCi6+ESQuudbzA6UVFJrhWw9pdc38Z0BL9ijOw
         Xtu4bQDkfeBCGEbCRdUkRvlQORFMbSCIh50HFG3kChX5rdss7UH01sLKTDaSp2sZhFFS
         Vqje2m1qe826e/pHmCfy5/P+rqSvdyPTwpBUwcRVjJYs+RUejayBcCh9x1nmCK18HQZL
         McM4eXbIgu+aRHDpCn1nBVqM00EO4wIf4lwPzZeyd4dO8g5WyMdlimqU0OM4O7y9Sfz1
         MUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792096206; x=1792701006;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4AIbma4tjuLRzJ4ycI85jwstBKmCUvxBUVyzwWqKymA=;
        b=Dq05qlRLZiAzCtSnPE4lEUcSbtOpJnx8xOqmIvllq2Dq7TiF+0zm+EByQ0RYiWrloC
         vmJOQ0o9dBu73UiXPa8bbx2CJ9rbc7+TpJ2Er16B9f0gCsQi2QbZjEBWz7azlBD4CBXg
         2cf37jVpqdsrSkdlOXar51V1vN27/14VhuUoYBWypPQFkPfAN9fo6VkrRUVs37pjYdMs
         MnvaPriCJtgUZ+/uP3CwoRc3jThB8SHXJDElzri0lMOQnUYFynAlmlA2rXM5hG25DkHc
         QMxNaGqzGfDEqyu5XyUD5CzsXrFtk9zwgY9YSKLfbFUT9XR8aOF1p3MzfkbE8Z/pvpKe
         JL0g==
X-Gm-Message-State: AFq9FYIhsYVaeAJfd0OloC6t0mZjLuICL+Mv4V1uobSIhQ0nsfOSXOaD
	AaAOevp1MAyZjGQ/EPK9y6kh5OSSz74hHD5i51le/rtnoFn4Ea48oUJSIIKzJEMm1nM=
X-Gm-Gg: AYBFou2aeIunUk2/ea+iu0JcMvleFrPxPWbb7/gX4oEcGt8S9FFMxjvoVs8GTPUsYwo
	k4gDuFt4hmAHbGcng31wTA1m1KP6l8gG/8Ug5uZpyjcEgwGdk/6PYx9QWqu7HUCrm/ayiRAq1RS
	QlTiiOkYT3eN5rFtCj6MpdEc9s4loUr9fwbO0oBxS5RQTNYlGSt8/kARO8ui66bFXLAU38STgna
	jgOGR8bzyNyGVkrCmW47YOlw7tk0IVqAZEKphrUiKj2hK0VOnToU1HytU3DHKyB4MpW3nmmCsVz
	9aT5QAZMy2zszwHQHDAjU84B4gcmQp8Ec3FQECu1ZZ8nKSdMjoFScfjKUGKSJD+BUnMGr2wkYzG
	vyWgPfHCz5JYm779+cLCm+Z4amIurAQKlHOfyq0lNmGVi0UfZFr4vIGQkBVlmGU/3a9vBBCQimy
	4RautMQi1Jv+Qvl77LMNenvTUw0sUX9SEoRhVQC8nZJoko81dyqvElk3+TXDAvQbMzTNPfOOrGq
	/zT7w091Jbg1sQ=
X-Received: by 2002:a05:6820:2203:b0:6d7:4af6:e292 with SMTP id 006d021491bc7-6ef08e7d1a0mr14833642eaf.2.1792096205509;
        Thu, 15 Oct 2026 13:30:05 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-701833928f6sm293627eaf.0.2026.10.15.13.30.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 13:30:03 -0700 (PDT)
Message-ID: <91914979-5692-4bc0-a693-ace5aff83710@kernel.dk>
Date: Thu, 15 Oct 2026 14:30:02 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/43] io_uring: Fix hangs, lost wake ups, missed cancels
 and ring corner cases
To: Josef Bacik <josef@toxicpanda.com>
Cc: io-uring@vger.kernel.org, Leonid Ovchinnikov <teiny.work@gmail.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/15/26 1:30 PM, Josef Bacik wrote:
> Hello,
> 
> We've been running a large LLM driven audit of the kernel, and these are
> the io_uring fixes that came out of it.  Some of them were found by writing
> models of the task_work, poll, io-wq and CQ code and running those through
> a model checker, the rest by reading the code and then writing a reproducer.
> It's a lot of patches, sorry about that.  They're standalone fixes, I put
> them in one series so I didn't send you 43 separate emails, so take whatever
> subset you like.  The ones that belong together are 7 and 8 (the same lost
> wake up in two places), 14, 15 and 18 (the same lost cancel, 15 and 18 close
> what 14 says it leaves open), and 25-27, which touch the same two loops in
> the resize code.
> 
> Patches 1 and 2 are memory safety, a use after free in waitid and a write
> through LIST_POISON2 in the futexv completion.  Patches 3-9 are tasks that
> hang or spin in the kernel.  None of them need any privilege, other than 9
> which takes a SCHED_FIFO task, and with 3, 5 and 6 the task can't be killed.
> 10-12 are io-wq leaving work sitting there with nobody to run it.  13-18 are
> cancellations that miss their request or report the wrong thing.  19-22 are
> wake ups that the application never gets.  23-28 are the mixed size CQE/SQE
> and ring resize corner cases, 29-34 are timeouts and waits, and 35-39 are
> small things all over the place.
> 
> Patches 40-43 are at the end on purpose.  They fix real problems, but they
> change something that somebody could be relying on, so I'd understand if you
> want these done differently.  40 stops honouring MSG_WAITALL for receives
> into incremental buffer rings and bundles, since the retry writes into
> buffers that the ring hands to the next request.  41 fails an ABS update of
> a multishot timeout with -EINVAL.  42 makes the linked timeout of a futex or
> waitid request complete with -ETIME like all the others instead of 1, and
> liburing's waitid.t checks for that 1, so it needs a liburing change to go
> with it.  43 goes back to looking up the file of an IOSQE_ASYNC request
> when it's queued, so that io-wq can tell bounded from unbounded work and
> hash the writes.  There are smaller visible changes further up, 3 returns
> to userspace if the overflow list can't be flushed, 22 allocates the private
> futex hash at prep time and can fail with -ENOMEM, and 25 and 27 fail a
> resize with -EOVERFLOW rather than tear a 32b CQE or a 128b SQE in two.
> 
> These were found on 7.3-rc5, and the numbers in the changelogs are from
> there.  After rebasing onto for-next I ran the reproducers again, for-next
> against for-next plus the series, same config, in TCG guests.  30 of the 43
> reproduce on the unmodified for-next and are gone with the series.  1, 7, 8,
> 9 and 11 only reproduce with a delay patched into the window, same delay on
> both sides.  10 and 12 I can only show in the model, and 25, 33, 34, 36 and
> 38 are from reading the code.  17 needs a 32-bit kernel, that one I ran on
> rc5 but not again on for-next.  I didn't want to post the reproducers along
> with the series, but I'm happy to send them to anybody who wants them.
> 
> I ran the liburing tests (d5b6007) the same way.  Of the 257 for-next passes
> 240, skips 16, and send-zerocopy.t times out because TCG is slow.  With the
> series the only difference is waitid.t, which is patch 42, see above.
> iowait.t fails every now and then on both.
> 
> Every patch builds on its own with W=1.  A matrix of exit, thread exit, exec
> and ring close against 21 kinds of pending request on plain, DEFER_TASKRUN
> and SQPOLL rings gives the same results with and without the series, other
> than the hangs that 4 fixes.  KASAN and kmemleak had nothing to say, and
> lockdep only tripped the assert in signal_wake_up_state() once, for a ring
> with SQPOLL and exec, which plain 7.3-rc5 does as well.
> 
> That matrix did find one thing that's not ours.  On for-next, with or
> without this series, a task that submits an IORING_OP_TIMEOUT with
> IOSQE_ASYNC and calls exit_group() right away gets stuck in
> io_uring_cancel_generic() for good in 2 to 27 percent of the attempts, and it
> can't be killed.  7.3-rc5 doesn't do that.  I haven't dug into it, my guess
> is that the worker arms the timeout after the exiting task has counted the
> armed timeouts, and then nothing wakes it up.  I can send the test for that
> as well.
> 
> A few of these are close to things that are already on the list.  Patch 23
> is the fix for what Leonid reported in September [1].  Patch 40 is the same
> bug that Aohan posted a patch for [2], that one defers the commit rather
> than giving up on the retry and doesn't cover incremental buffers.  We also
> had a fix for the poll retry flag, I dropped it as Juanlu has since posted
> one [3], for what it's worth we hit the same thing.
> 
> This is based on your for-next as of Wednesday.  It applies to
> for-7.4/io_uring as well, except for patch 8, which needs commit
> fddcf4c5321b ("io_uring/cancel: don't spin on local work the task can't
> run").  I didn't add Cc: stable to anything, they all have Fixes tags.
> Thanks,

All good fixes, fiddled a few incorrect Fixes tags and added a follow-up
fix for one of them. Queued up!

-- 
Jens Axboe
