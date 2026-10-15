Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145A12459CF
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092672; cv=none; b=BtVEc8v0YlCVAn4KBcSSWlcG2PJT55ol3CUFpGEKnz1ThPEWE4wIl+ssvSadomFcPGAMIe4i9ZyHLf83uRtaiis10HX2SdZFSIJsrIUTSVgSoJWs5ZMUdNZoKC9HcMlEkbQis7RrIf0CB2Yw7tXRzkxK/HGLAVRSKZxlHjyt8ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092672; c=relaxed/simple;
	bh=dA7IlXZvJDAgHdSCCdDV3Tzu6g0YrQ3LXUKAtKlfQPA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fX1MNL2iMNGDLHl1FCb4mxY3N6x2dmZSRWKaNTfDvAl5Pfe7i5eKeXtNfufHTdVXZu2Ty964uenz5GXLhbR/GFOAxnIe32AE6IwaHRffosOERA1oAClNk8YfRysUDyNtcesvhne2ACPs3mUmQCxL3TuYgeh/vFd/rPh08CdbWsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=Yh4VfLX5; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="Yh4VfLX5"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-53381e53b80so70212631cf.1
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092670; x=1792697470; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NV9EYvkP7ccxifkUluMbstu5XIH0DN6mT/qhqNCGbfM=;
        b=Yh4VfLX5NB4lA+6a0USsgfBogHUkkGOZnmCcjC04R17QV8edQADQ4PupEHM3k2+52t
         CZ7EXnQtzkrn9PesoBcAjc9K4b+4r4c9NDV49KTWebktqeKdaZj70P59xQE3PPpT+9RO
         lVXtkBqKp+IaadD8+pxJmNGOlubjTKv7p/4ATZHmIyQqLHcmDGc2r1Upv10cTwrJPP8r
         G1nZyhkSHgBXm9119QwNT4D4dyiM6NuMwYCQcBrLXvRxRP/+KlRPaocvQ+eZDxQL0xhd
         ChAr1cyiwFQLip280WFRQKIEFGm2EmPx6J9Ei7MLhacGN04IkVHVbXH6xp1hLOADrXXc
         syRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092670; x=1792697470;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NV9EYvkP7ccxifkUluMbstu5XIH0DN6mT/qhqNCGbfM=;
        b=HOW3qjfpAbM9N0DVfqGf+/DmGpN96hzipypLFcsayh619jglM6NKh5Zp7vEfvHGzbM
         4Sx9tMvTGelRUXJLc4BJzQV2I+gkOAsGld7LhIACfbM1qir8ySe0P7oeUhe9MG6IUPIe
         UiRaM5OpFrZSO9L/1XCgVKASDfv9GwA5zgE/YdN+y4p+Kxuy/8HQgPu1NcukMUQB5N8W
         xD0JnvMOiloHTja25WrDoaASE2s8M6p8NpP/ogmD+LWDQfHRC1x8UF4fWGIBM8XCHj41
         84cLqD4w2NYEBmcIXiDxKzmbfNtMgE513dq+djywfdhd1AKKZ741iVSfgrnDXBRsV3St
         VmKg==
X-Gm-Message-State: AFq9FYLNGOEh2AKVHOP9XlTK6gqxQn7bTJ+nuAmy317rGoTaiyU7yrJN
	bzjjHjpHS+8dXNHRTvN+er9rFqPhgtCz/lx6Uh4M8jBIcZ5RD7RoN9lPAiMWBBybmOE=
X-Gm-Gg: AYBFou0Q1d+30n+C1/C8uexgIs6UQgRxiwXtqsP1fv6JIhfNmqWSqO1Yah6tuy2ElE1
	vuTqCGJexxf1GxhE0rlZnk/WoAFnQyabyIgSRLQyyN+TsT+NMgXPPxQzeCipYw1XCvJrXQnZ91J
	lx4DgftqXz2uLJ1OaYws/R9sdgLHYQi/ZI6BN3VR6/kx7ovoryiltYUCEB0IliRCZv5pGD11AU+
	XhMT/tjehR8Fbz4pagnSFsTQqwZfnMQ2QeCFUwfuLdMUUYEVJJ4f3UtxU3QhNeHXYb5d5/aPD2j
	BosIfw4yzM0zLhct2bOOBC8LS/Is52h8JppRL9wvcO5+Y631DohDTcN247wRzMoH4zaZdSSax2m
	VNLMCOieABYXUF/2eCROEmWqDZx+RZetpSzKFItmgGgDuWN+ocf6IRh+HraZ+lt2xcPMEEcyXty
	11nXx3YTnqrQGB4AWjAB/3CaX1WCj7VeXsXgv0+2wq8rAjrT2xUHKmsojBunnck9TCb1xgBRkpn
	JWlvSsvYJox0LE=
X-Received: by 2002:a05:622a:392:b0:535:70b5:237e with SMTP id d75a77b69052e-5359fbb5a6dmr335282391cf.62.1792092669509;
        Thu, 15 Oct 2026 12:31:09 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.248])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362aa59b03sm1340861cf.27.2026.10.15.12.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:31:08 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH 00/43] io_uring: Fix hangs, lost wake ups, missed cancels
 and ring corner cases
Date: Thu, 15 Oct 2026 19:30:24 +0000
Message-Id: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANUp0WoC/1WMQQ7CMAwEv1L5jEUcmiLxFcQhCaY1hxTZFCFV/
 TsJnDjO7s6uYKzCBqduBeWXmMylAu06yFMsI6NcK4N3fiBHAVOPMuOiUka8yZsNc3B0GAJ51x+
 heg/lb1G18+XHtqQ752c7aosUjTFpLHlqUcP9/yls2wettnXFmwAAAA==
X-Change-ID: 20261015-b4-io-uring-fixes-c50136512047
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>, 
 Leonid Ovchinnikov <teiny.work@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092657; l=9342;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=dA7IlXZvJDAgHdSCCdDV3Tzu6g0YrQ3LXUKAtKlfQPA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCPgcjgjEpWVPyNoAzcIGQeCKhtkgquoXt8Yvg4UrGWp3ox3iMGpoTu1hbcDE2iK13uczYHXWZ0
 llcl1Cqi01wo=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

Hello,

We've been running a large LLM driven audit of the kernel, and these are
the io_uring fixes that came out of it.  Some of them were found by writing
models of the task_work, poll, io-wq and CQ code and running those through
a model checker, the rest by reading the code and then writing a reproducer.
It's a lot of patches, sorry about that.  They're standalone fixes, I put
them in one series so I didn't send you 43 separate emails, so take whatever
subset you like.  The ones that belong together are 7 and 8 (the same lost
wake up in two places), 14, 15 and 18 (the same lost cancel, 15 and 18 close
what 14 says it leaves open), and 25-27, which touch the same two loops in
the resize code.

Patches 1 and 2 are memory safety, a use after free in waitid and a write
through LIST_POISON2 in the futexv completion.  Patches 3-9 are tasks that
hang or spin in the kernel.  None of them need any privilege, other than 9
which takes a SCHED_FIFO task, and with 3, 5 and 6 the task can't be killed.
10-12 are io-wq leaving work sitting there with nobody to run it.  13-18 are
cancellations that miss their request or report the wrong thing.  19-22 are
wake ups that the application never gets.  23-28 are the mixed size CQE/SQE
and ring resize corner cases, 29-34 are timeouts and waits, and 35-39 are
small things all over the place.

Patches 40-43 are at the end on purpose.  They fix real problems, but they
change something that somebody could be relying on, so I'd understand if you
want these done differently.  40 stops honouring MSG_WAITALL for receives
into incremental buffer rings and bundles, since the retry writes into
buffers that the ring hands to the next request.  41 fails an ABS update of
a multishot timeout with -EINVAL.  42 makes the linked timeout of a futex or
waitid request complete with -ETIME like all the others instead of 1, and
liburing's waitid.t checks for that 1, so it needs a liburing change to go
with it.  43 goes back to looking up the file of an IOSQE_ASYNC request
when it's queued, so that io-wq can tell bounded from unbounded work and
hash the writes.  There are smaller visible changes further up, 3 returns
to userspace if the overflow list can't be flushed, 22 allocates the private
futex hash at prep time and can fail with -ENOMEM, and 25 and 27 fail a
resize with -EOVERFLOW rather than tear a 32b CQE or a 128b SQE in two.

These were found on 7.3-rc5, and the numbers in the changelogs are from
there.  After rebasing onto for-next I ran the reproducers again, for-next
against for-next plus the series, same config, in TCG guests.  30 of the 43
reproduce on the unmodified for-next and are gone with the series.  1, 7, 8,
9 and 11 only reproduce with a delay patched into the window, same delay on
both sides.  10 and 12 I can only show in the model, and 25, 33, 34, 36 and
38 are from reading the code.  17 needs a 32-bit kernel, that one I ran on
rc5 but not again on for-next.  I didn't want to post the reproducers along
with the series, but I'm happy to send them to anybody who wants them.

I ran the liburing tests (d5b6007) the same way.  Of the 257 for-next passes
240, skips 16, and send-zerocopy.t times out because TCG is slow.  With the
series the only difference is waitid.t, which is patch 42, see above.
iowait.t fails every now and then on both.

Every patch builds on its own with W=1.  A matrix of exit, thread exit, exec
and ring close against 21 kinds of pending request on plain, DEFER_TASKRUN
and SQPOLL rings gives the same results with and without the series, other
than the hangs that 4 fixes.  KASAN and kmemleak had nothing to say, and
lockdep only tripped the assert in signal_wake_up_state() once, for a ring
with SQPOLL and exec, which plain 7.3-rc5 does as well.

That matrix did find one thing that's not ours.  On for-next, with or
without this series, a task that submits an IORING_OP_TIMEOUT with
IOSQE_ASYNC and calls exit_group() right away gets stuck in
io_uring_cancel_generic() for good in 2 to 27 percent of the attempts, and it
can't be killed.  7.3-rc5 doesn't do that.  I haven't dug into it, my guess
is that the worker arms the timeout after the exiting task has counted the
armed timeouts, and then nothing wakes it up.  I can send the test for that
as well.

A few of these are close to things that are already on the list.  Patch 23
is the fix for what Leonid reported in September [1].  Patch 40 is the same
bug that Aohan posted a patch for [2], that one defers the commit rather
than giving up on the retry and doesn't cover incremental buffers.  We also
had a fix for the poll retry flag, I dropped it as Juanlu has since posted
one [3], for what it's worth we hit the same thing.

This is based on your for-next as of Wednesday.  It applies to
for-7.4/io_uring as well, except for patch 8, which needs commit
fddcf4c5321b ("io_uring/cancel: don't spin on local work the task can't
run").  I didn't add Cc: stable to anything, they all have Fixes tags.
Thanks,

Josef

[1] https://lore.kernel.org/io-uring/CAECZYD5OMD9vMTzjteFMMP40Dn+SWKj9SFj=43U6uO3XMnxJbw@mail.gmail.com/
[2] https://lore.kernel.org/io-uring/20260902022552.1890610-1-ljp1205831794@gmail.com/
[3] https://lore.kernel.org/io-uring/20261013-pu-cmpxchg-v1-1-4ddc10fd8a03@fastmail.com/

---
Josef Bacik (43):
      io_uring/waitid: own the request before clearing ->head
      io_uring/cmd: don't leave list poison in ->hash_node
      io_uring/wait: don't spin on a stuck overflow list
      io_uring/io-wq: don't lose the signal that ends work
      io_uring/io-wq: don't hide a link from cancellations
      io_uring: don't flood a cancelling task with task_work
      io_uring: don't lose the DEFER_TASKRUN wake up
      io_uring/cancel: rearm local work wake up before sleep
      io_uring/mpscq: disable preemption while pushing
      io_uring/io-wq: don't go to sleep on pending work
      io_uring/io-wq: don't strand work when a worker exits
      io_uring/io-wq: don't exit with a creation pending
      io_uring/io-wq: let cancel find picked up hashed work
      io_uring/poll: don't lose a cancel as io-wq arms poll
      io_uring: don't lose a cancel as io-wq parks a request
      io_uring/cancel: don't forget that the work was running
      io_uring/cancel: recognize "no timeout" on 32-bit
      io_uring/cancel: let CANCEL_ALL find parked requests
      io_uring: wake ring pollers for local task_work
      io_uring/wait: look at all CQ waiters on wake up
      io_uring/poll: drop stale double poll entry on rearm
      io_uring/futex: allocate private hash before waiting
      io_uring: drop the CQE cache if a refill fails
      io_uring: don't split 128b SQEs at the SQPOLL cap
      io_uring/register: don't wrap 32b CQEs when resizing
      io_uring/register: handle index wrap when resizing
      io_uring/register: keep 128b SQEs intact on resize
      io_uring/fdinfo: fix CQE dump of CQE32 rings
      io_uring/timeout: don't skip over reached sequences
      io_uring/timeout: keep repeat count on multishot update
      io_uring/timeout: use the right clock for ABS updates
      io_uring/wait: no early -ETIME if min_wait finds work
      io_uring/napi: make stale entries time out after 60s
      io_uring/napi: don't busy poll past an expired timeout
      io_uring/zcrx: fix buffer offsets in areas above 4GB
      io_uring/kbuf: handle index wrap in last buffer check
      io_uring/sqpoll: let the thread sleep on disabled rings
      io_uring/openclose: keep the lock in io_pipe_fixed()
      io_uring: don't pass restart error codes to userspace
      io_uring/net: don't retry recv on uncommitted buffers
      io_uring/timeout: no ABS update of multishot timeouts
      io_uring/timeout: don't end a linked timeout with 1
      io_uring: look up the file before queueing to io-wq

 include/linux/io_uring_types.h |   3 +
 io_uring/cancel.c              |  43 +++++++++++--
 io_uring/cancel.h              |   2 +
 io_uring/fdinfo.c              |  30 +++++----
 io_uring/futex.c               |  32 ++++++++--
 io_uring/io-wq.c               | 124 +++++++++++++++++++++++++++++++------
 io_uring/io_uring.c            | 135 +++++++++++++++++++++++++++++------------
 io_uring/io_uring.h            |  38 +++++++++++-
 io_uring/kbuf.c                |   2 +-
 io_uring/loop.c                |   8 +--
 io_uring/mpscq.h               |  14 ++++-
 io_uring/napi.c                |   4 +-
 io_uring/net.c                 |  24 +++++++-
 io_uring/openclose.c           |  11 ++--
 io_uring/poll.c                |  21 +++++++
 io_uring/register.c            |  54 ++++++++++++++++-
 io_uring/rw.c                  |  18 ------
 io_uring/sqpoll.c              |   7 +++
 io_uring/timeout.c             |  77 ++++++++++++++++-------
 io_uring/tw.c                  |  36 ++++++++++-
 io_uring/uring_cmd.c           |   2 +-
 io_uring/wait.c                |  32 +++++++---
 io_uring/wait.h                |  15 +++++
 io_uring/waitid.c              |  12 +++-
 io_uring/zcrx.c                |   2 +-
 25 files changed, 596 insertions(+), 150 deletions(-)
---
base-commit: 75b36d2f2b09e3bc3294e37e693d6bf0bdf6c5e7
change-id: 20261015-b4-io-uring-fixes-c50136512047

