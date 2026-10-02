Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B2E2F39C2
	for <io-uring@vger.kernel.org>; Fri,  2 Oct 2026 14:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790952513; cv=none; b=rr1j0kQfBpnZ0fdCvTxVevcGOcmsN9xN3STmvvRH2wQSD0F89QK5hKN8SzUTMrzYTmXS9Pcb6VtsDZ4eLkB1EdzGbyXwleKobxWApbmme/EiupObgeZqIzefqzsDpk02KsVjZ8YOxxWUxqjMyawx0aRLzHJz1Mhkwy4ib/s969w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790952513; c=relaxed/simple;
	bh=Oi0Zo7VyQ5RvjbAKhZDXsZLm8sHKxTLi5fgJUxeSatY=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=P9flGsLKBHfc4dtYJIYREuRNKhgfCAaxUKJw211gzHjcJz+27pgnIOXYHxMgMF2OSZ69RWUZzJPuypZfjvDXUgDgv1D8oZZcw2bG4X+gP8EI+B0nI/aPmD/24aJ5i9hbPQNu1COVdbzaReFUnYa+vbmZ3jDS5EdhY9cyeIOxfZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=BzkwFQIu; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="BzkwFQIu"
Received: by mail-oo2-f43.google.com with SMTP id 006d021491bc7-6def0527340so722341eaf.0
        for <io-uring@vger.kernel.org>; Fri, 02 Oct 2026 07:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790952508; x=1791557308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HayPz1S7+qNV1DiQMWraL67OyFTT8PrrA3ZAOdQDzXA=;
        b=BzkwFQIu2K/c7JeET8RDuG8PZVlgT82ahzpU+bGtjTronRe2yC/ZDVeAtci2speWqw
         zQ7JpYRfX3hJHbc5wkk+mRho0DLLVqK5EekiAeA3g8y9Hr+4ITIpWAYDcAhAjennNQi6
         AWI+9gzWGRJBUpv2jiepeHND6qul7ZDU9sPQmDYFWs/Q0/5LEd+T50UWtl7kvxCqDwZF
         IOsM1EsC09XUrRxAM+vXhklGqkCJv5iyF2HdjATGA7KlhrP6G9+HpNuRGgRG5Jj9D4U7
         Jy0Q3Dl3uCOhu17OsM6QrsTixmz+gW2xMEYdLFkX2snbm3utTc3Jjxp75ueuBRd+NWSU
         wQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790952508; x=1791557308;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HayPz1S7+qNV1DiQMWraL67OyFTT8PrrA3ZAOdQDzXA=;
        b=cri6tq6Zu0+mTVOW5E9L3nPVTnBCrDr52Y8/rem5tu2yNHrogfelV5E7izR5nZW1lP
         6S1YnVNtNy52hTNKnQgV+OTvffNIl2nkQHv5KY9/b1WH5wA2Mkh3wtPLyMMunh0Uoeus
         if4rfbMG4Y5oM8swT48U7zZsFFd5KpiIuYXV3vexNxPfYVF/EQ5RBhzYfglfh0PSNNoO
         QBnCfbNElaVvAdp7tqXsRRPrkyiMKMlB6f1L6ScyKA8QjL8lQQCEUm0iucABAev7wg9k
         8FN2BC1mJdO7kr9msP2dpGDVCDe/DULRCT0Q5wcygAT18yT4osLFZ2YjJ34g7Ud6qOJp
         dOGg==
X-Gm-Message-State: AFuF++l4XFa9JBqo6p65obEUvwsf/nSUojxLkL+J2lS4Jc1SzcEWVP7N
	YMxeSk5lXyj9sVJQ9HxJAcW8pqsISkK2z4wDupSpedOQWLMxOJI90PTujuFMHTl9zBSPeQf1hSc
	IXufYr9g=
X-Gm-Gg: AYBFou1IPzGrI+Cg7Bkqr0MOxxHs+xeki5Sn/c2IFo943HWt9O1yZsi89muPeEvjH/O
	krX8T4LDHfZ3wirhk8n95jrX1ytFsQioJFzOBUlWJD042aD0CrCsT/GtOllolKBhlFdGTnkGv+Y
	dmWBvDKwx/TsPaMEiqNCU+oQlqr8cvW+xW8xM0TaOJc/4sQ5dDxkV7qIh5oG+2181eElKvYs0Vo
	gohjPbkXpEcdwV+yXYqJo4wsR80ackLw7XkXeP78hLmmxg2PYNCH+OkXAjd6O/LYphNgBf16ZgV
	W+rgMvIYAYfYFGf914nzC2QAf4bNwh0dk8ZbMsRyhSh1hIQATIsuVIwHyJkGfeLhi1Sa13gTR04
	sIdCeNWgWulOXGwMQe8ydgpUNbA5TrHiWzlIDGSdnnFewC6ZCSkjIIuTvpqFY7ugjH/gYScdyP6
	+ED3Cv/aiw0SiS1/oAgk9qp/KNDSfyjbNuLvqK6h5ePMMYFbRuxSjVGlQdcHCWOVup5yhpbkDu1
	M/CU4yNgTCET0HQbQgnq0ICwD+bDZfCXQELpmL3Jv0CuoUFFhmDUSnj5RhuL2ZjjA==
X-Received: by 2002:a05:6820:a50c:b0:6dc:16e5:d37c with SMTP id 006d021491bc7-6df35b3c0d4mr1728902eaf.85.1790952508007;
        Fri, 02 Oct 2026 07:48:28 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-822792a169fsm3609962a34.4.2026.10.02.07.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 07:48:27 -0700 (PDT)
Message-ID: <0fc0ef2e-93aa-4b18-9816-4f47a77f74ab@kernel.dk>
Date: Fri, 2 Oct 2026 08:48:26 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: io-uring <io-uring@vger.kernel.org>
From: Jens Axboe <axboe@kernel.dk>
Subject: [GIT PULL] io_uring fixes for 7.3-rc6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Linus,

A set of io_uring fixes for this week. It's really a collection of
things from the last few weeks, just various life things have got them
bundled up for this week. This pull request contains:

- Fix a task_work add use-after-free with SQPOLL, where the sqpoll
  thread could pop and complete the last request while
  io_req_normal_work_add() was still looking at them after the mpscq
  push. Use the same approach as DEFER_TASKRUN to protect from that,
  holding an RCU read lock across the add, and have exit wait for an RCU
  grace period for SQPOLL rings as well.

- CQE32 ring fixes: correct the free entry check for 32b CQEs, zero the
  big_cqe for aux CQEs, and only post the dummy skip CQE on CQE_MIXED
  rings

- Mark the source filter table as COW when cloning bpf filters, so
  registering another filter on the source doesn't modify the shared
  table in place

- Initialize the task context before running the BPF loop

- Requeue zcrx multishot receives stopped by a local resource

 - End a TX_TIMESTAMP multishot cmd when the CQ is full (lollipopkit)

Please pull!


The following changes since commit 47ccc3f1c615a46c25cbf7f3ae60df30b40eb2e6:

  io_uring/rw: keep CQE flags on iopoll requests when adding kbuf flags (2026-09-09 09:59:02 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.3-20261002

for you to fetch changes up to a92193c91e8839fe5fc209616ea95465ae4b919d:

  io_uring: fix task_work add use-after-free with SQPOLL (2026-09-29 06:52:39 -0600)

----------------------------------------------------------------
io_uring-7.3-20261002

----------------------------------------------------------------
Hui Peng (4):
      io_uring/bpf_filter: mark source as COW when cloning filters
      io_uring: only post the dummy skip CQE on CQE_MIXED rings
      io_uring: fix free entry check for 32b CQEs on CQE32 rings
      io_uring: zero big_cqe for aux CQEs on CQE32 rings

Jens Axboe (1):
      io_uring: fix task_work add use-after-free with SQPOLL

Junyuan Feng (1):
      io_uring/zcrx: requeue multishot receives stopped by a local resource

Yao Kai (1):
      io_uring: initialize task context before running the BPF loop

lollipopkit (1):
      io_uring/cmd_net: end TX_TIMESTAMP multishot when the CQ is full

 io_uring/bpf_filter.c |  1 +
 io_uring/cmd_net.c    | 19 ++++++++++++++-----
 io_uring/io_uring.c   | 16 +++++++++-------
 io_uring/loop.c       |  5 +++++
 io_uring/tw.c         |  3 +++
 io_uring/zcrx.c       |  9 +++++++--
 6 files changed, 39 insertions(+), 14 deletions(-)

-- 
Jens Axboe

