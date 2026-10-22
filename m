Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792637241;
	b=SmbAZjUfUIthrqyT/VLbxR2qyPcQ8np0Z7dg3emSKZBPdcLIrShGKoCUl1Qjee8Mj/BE
	 l1R/30AG46B80WOawozNV4Y++dj/VmA8P7gAxEFEvmdNVJQ5HuRf1F3voUd3aIuqFBm45
	 /hhzt7HADv3cbJFobWK6gM+gkCjuA05TarMLJnnvfEY/Ns5IeQJR4LPX5mHlb97Q+vvvG
	 6OnIGjZ/obKr0dGtiIGL9m+1ENJrjNX8JY3XeVdqZe4HBAE9l7OduxLE6gxQB+y5apqCh
	 F8x4F9s9HPet+X7Zw0ES3jG4Y6E1Kg64q2zmU05YGzL9AMZdstKL4GzEFHtMfOCymOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792637241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Volwfxv4Wq+pPVT4Y+NA3cT3h65Pl/GgAPXC0wXcxI0=;
	b=ephLv5LYqba9aB03EoRsyQ8n+0RmQ5CG6nW8IVHP2qOtFA3smHJpsDqt0aUEts7WJ4TR
	 T4DREIlrIkZcIhp8F45MdvNwhswrUcb1eSb4IsZxI1nH7cogdwVyeyv8WKqNhjwl0QJmb
	 fEeHpyKkCxTCr0EUVpGIP4fFDEQnmq5LM6MhJFYIToyoalbr2v0ZsLBMF4qSl7Tz2Kz2m
	 RCSI4rJ/IAqN/XLKhK+bzeqQ+d0JdTtLT0mw35nUJzw5mBQPF3TN6F48/iGjiK8PC4m3E
	 EI4MZboUI/5e6QkNzWkVOEeieW9FzXdc72X4w3kKSpTupOy7UX8+Rl7ER+ZzVgGukNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CIDJEa7K;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0325606A31B
	for <io-uring@vger.kernel.org>; Thu, 22 Oct 2026 02:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0325606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CIDJEa7K
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35f036b17easo301282eec.1
        for <io-uring@vger.kernel.org>; Wed, 21 Oct 2026 19:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792637240; x=1793242040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Volwfxv4Wq+pPVT4Y+NA3cT3h65Pl/GgAPXC0wXcxI0=;
        b=CIDJEa7K7Th2D5+d6rXvj7eE3+NNLCGGQQLzlpxnPaIO5rY4CXw5kfd08tIpHvcfQf
         TE17lEErHKOWCdWoSSP3WF7wMcXER/FlqwB57wGb/CwtfvDAFjChyQQOw0qYVKxY4VYT
         9EmWXOgDMns9jj27YBDHjpGDGTxOG5lvSG1b4LGx30nQmVNZc7lyirZpUs4IBxR+Wk9x
         i6tlW5WLz4SoMsVheMZxlVTFQHa63UcWIywvZYMPw4bVtcjQ9MhaP1pAkibAY+X5ki6J
         4fhzf6HQqUdKdv35k7jnbsf5l13vFffBWh+rLtDXvvf56/f6Ae7meXz5x25odS8qV6UN
         ZZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792637240; x=1793242040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Volwfxv4Wq+pPVT4Y+NA3cT3h65Pl/GgAPXC0wXcxI0=;
        b=B/013k99mlnzQ/OhDNXO1Hy54zRDK6OBe7UlGuG66G3M7r2auhv3uwA05OJBYTNwNO
         FGnDPywiSNkrAhsxXeGK5vpwOePtHXr+D8AUCPah3Ia6VSy10L8n30C0b75fGePdnS99
         QPqf+UG04dTChclQH0dfGzBDQG5AE0baofATJzCDw7i9b6foNLuD6s7Z+KEfHgdrNsfb
         9YZv2GqohLF5Bq1N6ddbVVWfr8k8yABdVPxXlfIAa4xzUvKDAK6JX/2KTUVBd5ADT7wv
         5tFAna07++3Tn1TRnK2OK0HR4Gl8X9zw9hloAM1GfRtYgcFWqPEVyvTnRQIR46TP4Q/V
         4zBw==
X-Forwarded-Encrypted: i=1; AKwUvBwFCgLWI48YYq2rYFAmJ3Ln++Is+P1ULxlScUFEsiJAave2xqeE8JfO8n+W4C+rDhX/bmuZBXQ0Jg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLMTRKRkoDNQWl+ZbKAWbew4FyBof6PG5sLSprqFmDTBcqkcoG+
	GLKD3vTh5LNyXejyLReLxGWWAN30ted9YIDspG8wiElgDX3jps4CUoih
X-Gm-Gg: AYBFou1lbckTVK4+dQpWXgaW/Y1KD2NPLT5CR2ORDh+sNGYJpCl7Nyx+lue6JJsCGOd
	tgMeOWdZhfClr8IKiElKXO8Fbp5WAtrY8UoD90nCimWMGfBC2fBFPsSzHR7NjTUgTr9h3Tz7Q7U
	xnDLtZGiHHaHBCBTV7EtzJTFWD2qwbUyp7QOKN1lijC8nIRxFOs79oZcmMvDCs1DNQeTXTPI2E8
	l6pY8Ed+2Iy+69OMg16qsrt16B6T8yFSqXSzdWvFHPoYw+cY6FWyFY7B5N854vuWkMQBn6mrPiG
	/1caDnrvVjf/PRWNo4W5r7i16acVagFNyxTF1LHbtAGVvsX1eKB6DbxBHR0wyoC0yBVTdpGnP/3
	rvHkER7oIYuItW1WQm1kntwDVcm1wr7gGPCxMsIXbmw0vK01ksXLsMNsEubkeB2hEsRwJdN6ElU
	Vz000BILIX8brQZxLmj6waQgOl/9MFv6RuKSy2oS9u46kx6Qmr+Dit/p8Yh9A5omdpZ0hWHUUJA
	n6KCg85JfggUMNhePp2n6i5Oh5K+PzLIfrU1T8o2yTxadl/o4Xp6I6M6rAe+LFOP+c96ATAkjjL
	oElDDggbL1bFf2dgIBAN06GR0ibP2SC0OwCY5X42x+2IZU9mCPh9Ggx4ZOEocJ26pKXJ9eZCqfX
	JGGU97UYpIC6Cb+IGk19+047JHMM7
X-Received: by 2002:a05:7300:106:b0:35d:d9a9:e455 with SMTP id 5a478bee46e88-3674ef292b9mr6286668eec.21.1792637239772;
        Wed, 21 Oct 2026 19:47:19 -0700 (PDT)
Received: from server1868-4.tail96fc24.ts.net ([199.188.91.198])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-368ca914bb8sm2318629eec.5.2026.10.21.19.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:47:19 -0700 (PDT)
From: Austin Schuh <austin.linux@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Austin Schuh <austin.linux@gmail.com>,
	Pavel Begunkov <asml.silence@gmail.com>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-rt-devel@lists.linux.dev
Subject: [RFC PATCH 0/2] io_uring: futex wakeups that a preempted lower-priority task can't delay
Date: Wed, 21 Oct 2026 19:46:54 -0700
Message-ID: <20261022024701.1574811-1-austin.linux@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the prompt reviews, Jens!

I run robot control systems on kernels built with CONFIG_PREEMPT_RT.
Each process runs an io_uring event loop, and processes publish to each
other through shared-memory queues, with the publisher waking each
subscriber's loop.  Real-time and lower-priority processes publish and
subscribe on the same queues.  The real-time ones run on CPUs kept free
of interrupts, and the interrupt threads and everything else run on the
rest.

io_uring fits this well, for the same reasons it is fast: most of its
state is per ring.  The submission and completion rings are shared with
userspace without a lock, and the kernel-side ring locks belong to the
ring.  Requests and single futex wait data come from per-ring caches
once warm, not the slab.  With DEFER_TASKRUN, completions run in the
ring's own task when it waits, so no other task posts to its completion
ring, and another task hands it work with a push onto a lock-free list
and a wake up, taking no lock that sleeps on PREEMPT_RT.  Each of those
removes a place where a lower-priority task could be holding something
the real-time task needs.  And io_uring already lets a ring register
files and buffers once, so each request skips looking them up again.

The wakeup between event loops is where that breaks down.  What I need
is for a real-time publisher to wake a real-time subscriber on time,
whatever the lower-priority processes on the same queue are doing and
however busy their CPUs are with interrupts.  Which mechanism carries
the wakeup doesn't matter to me.  Running the real-time tasks above the
interrupt threads isn't a great answer: a lower-priority task boosted
to their priority would then outrank the interrupt threads on the CPUs
they were moved to, which undoes the isolation.

Each mechanism I've looked at lets a preempted lower-priority task hold
that wakeup back:

 - A futex wake takes the futex hash bucket lock, and so does every
   one-shot IORING_OP_FUTEX_WAIT arm, which an event loop does after
   every wakeup.  On PREEMPT_RT that is a sleeping lock, and priority
   inheritance lifts the lower-priority holder only to the waker's
   priority, which loses to threaded interrupt handlers above it.

 - IORING_OP_MSG_RING allocates an io_kiocb per send from a shared slab
   cache, whose slow path takes the slab's list_lock, a sleeping lock
   on PREEMPT_RT that any task on the system can be holding.

 - eventfd and signals take a spinlock_t, the eventfd's wait queue lock
   or the target's siglock, which on PREEMPT_RT is a sleeping lock that
   lower-priority writers and readers of the same eventfd or process
   hold too.

I measured each on a Jetson Orin Nano with PREEMPT_RT.  A SCHED_FIFO 40
sender on CPU 4 sends a message every 500us to a SCHED_FIFO 40
receiver's event loop on CPU 5.  On CPUs 0 and 1, lower-priority
processes send and receive on the same queue every 200us, starting and
stopping, beside SCHED_FIFO 50 threads running 20us to 1ms bursts and
interrupt and system load.  Ten minutes and 1.2 million messages a run.
Counted here is the real-time sender's time in the call that wakes the
receiver, which is where it waits on the lock:

                                       runs  over 100us   longest
  futex, one-shot io_uring wait (7.4)    1       10,285    1.0ms
  MSG_RING (7.4)                         1           55    1.0ms
  signal, signalfd (6.18)                2  33,080-36,122  1.7ms

Traced on 6.18, the futex sender waits on the bucket lock, the MSG_RING
sender on the slab's list_lock, and the signal sender on the receiver's
siglock, each held by a lower-priority task boosted to 40 and preempted
by the SCHED_FIFO 50 threads.  The receiver's one-shot futex arms wait
on the same bucket lock, so for futexes 10,348 messages reached the
receiver over 100us after they were sent, worst 3.5ms.

The options I see:

 1. Persistent futex waits and registered wakes: look the futex up
    once and cache it.  The waker registers the futex word with its
    ring once, and the waiter arms a wait on it once and keeps it
    armed.  Both meet in one node for that futex, so a wake goes
    straight to the cached node and walks its waiters, with no key
    lookup, no futex hash bucket, no lock that sleeps on PREEMPT_RT
    and no allocation.  Patch 2; prototyped and measured.

 2. An allocation-free MSG_RING: IORING_MSG_DOORBELL.  A ring's task
    registers a doorbell, and a sender ORs bits into a word in the
    target ctx and wakes its task; the target posts one CQE per drain.
    Real-time kernels solve this problem the same way: seL4
    notifications and FreeRTOS task notifications OR bits into a word
    the waiter owns.  Prototyped on 6.18, not posted: at SCHED_FIFO 40,
    no message over 100us late, worst 43us.

 3. Keep MSG_RING's data messages, but take the io_kiocb from a cache
    on the target ring instead of the slab.  Not prototyped.

Patch 2 is option 1.  A persistent wait posts one CQE per wakeup and
is re-armed by its slot, without looking the futex up again.  Futexes
also simplify discovery: a publisher wakes whoever waits on the word
without knowing who they are, where a doorbell or MSG_RING needs every
subscriber's ring fd.  In the same test, with persistent waits no send
took over 100us, the longest 25us, and no message reached the receiver
over 100us after it was sent, the worst 30.5us.

Patch 2 is here to start the discussion, not as a polished solution.
It is probably more useful to discuss the design before digging too far
into the details of that patch.

Patch 1 is a fix to the DEFER_TASKRUN wake up that patch 2 depends on.
It stands on its own; its commit message has the details.

I'd love any feedback you've got, or suggestions on other options that
I've missed.

Austin Schuh (2):
  io_uring: don't let a preempted task_work add hold back the wake up
  io_uring/futex: add persistent waits and registered wakes

 include/linux/io_uring_types.h |   6 +
 include/uapi/linux/io_uring.h  |  52 ++-
 io_uring/futex.c               | 788 ++++++++++++++++++++++++++++++++-
 io_uring/futex.h               |  28 ++
 io_uring/io_uring.c            |   1 +
 io_uring/register.c            |  13 +
 io_uring/tw.c                  | 124 ++++--
 io_uring/tw.h                  |   4 +-
 8 files changed, 983 insertions(+), 33 deletions(-)


base-commit: 5b01d5955ac206e38097f777eff6ab2a8b948c41
-- 
2.47.3

