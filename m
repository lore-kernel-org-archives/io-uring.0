Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693E0235358;
	Fri, 11 Sep 2026 17:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789148006; cv=none; b=nl9+nked0cbTGeq1o07Isu1ESJHjoNugwAe4qqPO7BrPxCr3u3eWGLyvco2hGP837POVyV9BQajL4/o7rDk3C8iPCM1JGg+ZJ4bVJMjgQTj2ar8CNEat0X6BheyZR2PwBrchqfi8QPfbIP8J5Kws9Fck3efN32fKZfLriCDDd60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789148006; c=relaxed/simple;
	bh=aCsG/0cxeWfqsUPYBzEgcgwNlw4TZovq80tcKHd6zGk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pLXRL7iLyooPdVizdrNU6e8iyHlaBnCYwyh6cft0PwFm1cfBstLrS7hXGoGOqGejbAG658JEV0Oy2ejq0sRSbTxUFrboVKHDTNxsD5WXlGxt5qc7LDTgfiGJ7LiALwJWFnf6npXatcfpLlQcOmgcyiodVNpDejRlQHccwO4+4uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=d5zEd3e8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hzeqglqL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1ftBjffR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=m/0q95dO; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="d5zEd3e8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hzeqglqL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1ftBjffR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="m/0q95dO"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2674F1FEF4;
	Fri, 11 Sep 2026 17:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789147994; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nTRTXWEsK+BnZZ8UWSz0nW5jLB3l/HO1T0G2uqVVuIQ=;
	b=d5zEd3e8CzUG4sX1BgFL7BD71LUbFPoLEnreaj/zFMbt3jgWM3ZlqQBRqlooRuHoLalFBj
	e0+r82H6mMCW69NAxfyGu0EjHgJ5z0ScevuMJ6AIyhe4CIbkjwLQ+p9MeYbmpt+NiKeazX
	z/mBcacXFjs5BBXCui4FwIes5XT9LaA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789147994;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nTRTXWEsK+BnZZ8UWSz0nW5jLB3l/HO1T0G2uqVVuIQ=;
	b=hzeqglqLYH74uqZms8pnKvOiNbTwknqNYEsetGrxLbFPr1Pad6X9quu0qiryVTLk1/yyIW
	9rI5YgqEfh/K1pAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789147990; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nTRTXWEsK+BnZZ8UWSz0nW5jLB3l/HO1T0G2uqVVuIQ=;
	b=1ftBjffR9ZtsV+KRfXS8IQfsig+4LC/0QKUryOHkF0io+R5hgGxJPH0Aw8x1NCqhsXup7I
	XbbIyR45JBjBqe4ZKBtBz2jnMGPUoVVBbiP8vpFkuZm6rCpqNtwpKioSYp/5g6sYXDmHGW
	f7S/7STcgIGep1e+x9LuSP+jnMLig/k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789147990;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nTRTXWEsK+BnZZ8UWSz0nW5jLB3l/HO1T0G2uqVVuIQ=;
	b=m/0q95dO7vWS+mUB3synD+RYjtS74uEFjnT1ufqefzoBAAvPmcuyE/c4/NboC/S279zZEC
	M442g+RkgimwdlCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 68135136ED;
	Fri, 11 Sep 2026 17:33:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TVMmB1U7pGqIOAAAD6G6ig
	(envelope-from <krisman@suse.de>); Fri, 11 Sep 2026 17:33:09 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 tglx@kernel.org, mingo@redhat.com, peterz@infradead.org
Subject: Re: [RFC PATCH 00/15] io_uring: thread identity handoff for
 blocking inline issue
In-Reply-To: <20260911154148.644489-1-axboe@kernel.dk>
Organization: SUSE
References: <20260911154148.644489-1-axboe@kernel.dk>
Date: Fri, 11 Sep 2026 14:33:06 -0300
Message-ID: <87tsnv1ynh.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

Jens Axboe <axboe@kernel.dk> writes:

> Hi,
>
> io_uring issues requests inline with IO_URING_F_NONBLOCK and punts to
> io-wq when that isn't possible. For a range of opcodes it isn't possible
> at all, as there's no nonblocking path in the kernel for them: fsync,
> statx, openat, the *at family, xattr, fadvise, splice, etc. Those are
> punted unconditionally, and the punt costs a thread wakeup, a context
> switch and a task_work completion round trip per request. io_uring HAS
> to be cautious to prevent accidental blocking in the kernel, even if the
> operations predominantly never block. Sad story. Examples of that are
> things like an fdatasync that doesn't block, statx that hits dcache,
> openat for O_TMPFILE, etc. All of those would've completed inline just
> fine, but io_uring just cannot rely on that.
>
> This series issues those requests inline in blocking mode instead, and
> only pays for the offload if the request actually blocks. But by the
> time it blocks, the submitter is deep in the kernel with the request on
> its stack, so the work can't be moved to another thread. What we can
> move is the identity. If the submitting task blocks, an idle io-wq
> worker takes over its user visible identity (tid, signal state,
> credentials, scheduling attributes, cgroup, user register state),
> finishes the io_uring_enter() call and returns to userspace as the
> submitter. The original task finishes the request as an
> io-wq worker and joins the pool. Userspace is none the wiser, hopefully,
> the same tid came back from the syscall, it's just on a different
> task_struct. Folks that have been around a while may remember earlier
> attempts at this about 20 years ago.

This is both really cool and seems like very dangerous thing :) Count me
amazed.  I worry this impersonating method will become as tricky as the
kthread impersonating model that you replaced with the user workers,
though.  I haven't looked at your patches yet, but I wonder how you
handle other tasks that have a reference to your task_struct.

I was actually working something much simpler to improve this problem,
which still require subsystems to cooperate, but largely reduces issue:

My idea was to reuse the non_block_count which already exists in
task_struct preserved for every kernel config that has io_uring.  We we
scope the inline path with it.  We then provide new mutex, semaphore
callers that will check the flag and fail refusing to sleep, similar to
a try_lock.  The new callers are required because we want subsystems to
opt-in the behavior, properly clean after themselves, and return
EWOULDBLOCK.  This is why we need to clean blocking paths in io_uring.
sched throws a WARN_ON if we schedule out with the counter> 0, making it
easy to find issues.

It has the downside of still requiring fixes to every path and we need
to handle every new case that comes by, but it is much cleaner than
plumbing a nonblock flag several layers down the stack across each
subsystem or having subsystem-specific details in io_uring, which is
what we have today.  On the upper side, it is much less complex than
your approach. It also allow us to just back off during memory
allocations that would block, solving the memory allocations anywhere in
the submission path, not only inside ->issue(), which we discussed
recently on discord.

I'll give a try to this series and report back.

>
> We catch the blocking through a scheduler hook. A task in a blocking
> inline issue carries PF_IO_HANDOFF, and sched_submit_work() calls into
> io_uring for it, next to the existing io-wq and workqueue hooks. This is
> where the identity is handed off, with the uring_lock still held by the
> blocking task and released for the promoted worker on its behalf.
>
> Structure of the series:
>
>   1     kernel: the thread identity handoff itself, in
>         kernel/thread_handoff.c. Independent of io_uring.
>   2     sched: the PF_IO_HANDOFF hook.
>   3-4   arm64 and x86 support. The arch hooks sync live register state
>         before the source blocks and load it on the destination.
>   5-9   io_uring prep: helper cleanups, a tctx node list, tracking of
>         uring_lock sections in the issue path so the hook knows when
>         the lock may be dropped, splitting io_uring_enter() so it can
>         be resumed by another task, and keeping the block plug on the
>         submitter's stack.
>   10    io-wq: claiming an idle worker for a handoff, and keeping a
>         couple of idle spares around as targets.
>   11-12 io_uring: the handoff itself, and deferring the identity
>         migration to the end of the submission so a batch of blocking
>         SQEs costs one migration rather than one per SQE.
>   13    io_uring: issue blockable requests inline in blocking mode.
>         This is where behavior changes.
>   14    tracepoints.
>   15    treat IOSQE_ASYNC the same way. Separate as it's a userspace
>         visible policy change, and I'm not sure yet it should be done.
>
> Some things are refused for handoff up front: traced tasks, per-task
> perf contexts, PI futexes, audit contexts, armed per-thread CPU timers,
> core scheduling cookies, vfork parents. Per-thread accounting moves with
> the handoff, so the counters userspace sees for a tid stay monotonic.
> Known gaps are LSM state kept in the task rather than the cred, and
> PR_SET_IO_FLUSHER. Neither moves, and not moving them can only ever
> restrict.
>
> Reads and writes on files with FMODE_NOWAIT are excluded.
> They have a working nonblocking path and poll retry, and a handoff per
> op would be worse than that. The handoff covers requests that previously
> would always have been handed to io-wq upfront. uring_cmd is excluded
> too, as drivers like ublk bind state to the submitting task.
>
> Some test results:
>
> Measured in a virtme-ng guest, 8 vcpu, non-debug x86 config, same
> kernel with a sysctl toggle for turning the feature on and off. CPU
> is the usage of the whole process including io-wq workers, as a
> percentage of one CPU. Mean of two runs.
>
>                                           ops/s    cpu
>  =====================================================
>  fsync, tmpfs, qd 1
>    baseline                               28.2k    96%
>    handoff                                 221k   100%
>    change                                 +681%    +5%
>  fsync, tmpfs, qd 8
>    baseline                                195k   141%
>    handoff                                 526k   100%
>    change                                 +170%   -29%
>  fsync, tmpfs, qd 32
>    baseline                                357k   219%
>    handoff                                 611k   100%
>    change                                  +71%   -54%
>
>  fsync, ext4 (flushes, always blocks), qd 1
>    baseline                                9.6k    66%
>    handoff                                 7.1k    91%
>    change                                  -26%   +37%
>  fsync, ext4 (flushes, always blocks), qd 8
>    baseline                               29.8k   212%
>    handoff                                14.7k   146%
>    change                                  -51%   -31%
>  fsync, ext4 (flushes, always blocks), qd 32
>    baseline                               42.2k   270%
>    handoff                                14.6k   144%
>    change                                  -65%   -47%
>
>  statx, ext4, qd 1
>    baseline                               23.6k    96%
>    handoff                                 121k   100%
>    change                                 +414%    +5%
>  statx, ext4, qd 8
>    baseline                                129k   234%
>    handoff                                 179k   100%
>    change                                  +38%   -57%
>  statx, ext4, qd 32
>    baseline                                197k   276%
>    handoff                                 140k   100%
>    change                                  -29%   -64%
>
>  statx, tmpfs, qd 1
>    baseline                               24.4k    96%
>    handoff                                 117k   100%
>    change                                 +378%    +4%
>  statx, tmpfs, qd 8
>    baseline                                131k   232%
>    handoff                                 180k   100%
>    change                                  +37%   -57%
>  statx, tmpfs, qd 32
>    baseline                                219k   295%
>    handoff                                 190k   100%
>    change                                  -13%   -66%
>
>  fadvise DONTNEED, ext4, qd 1
>    baseline                               26.1k    95%
>    handoff                                 150k   100%
>    change                                 +478%    +5%
>  fadvise DONTNEED, ext4, qd 8
>    baseline                                127k   170%
>    handoff                                 252k   100%
>    change                                  +99%   -41%
>  fadvise DONTNEED, ext4, qd 32
>    baseline                                270k   234%
>    handoff                                 273k   100%
>    change                                   +1%   -57%
>
>  renameat, ext4, qd 1
>    baseline                                7.4k    98%
>    handoff                                13.4k   100%
>    change                                  +81%    +2%
>  renameat, ext4, qd 8
>    baseline                               12.0k   544%
>    handoff                                14.6k   100%
>    change                                  +21%   -82%
>  renameat, ext4, qd 32
>    baseline                               11.2k   500%
>    handoff                                14.3k   100%
>    change                                  +28%   -80%
>
>  renameat, tmpfs, qd 1
>    baseline                               15.0k    97%
>    handoff                                48.5k    99%
>    change                                 +223%    +2%
>  renameat, tmpfs, qd 8
>    baseline                               65.6k   514%
>    handoff                                55.4k    98%
>    change                                  -15%   -81%
>  renameat, tmpfs, qd 32
>    baseline                               39.4k   462%
>    handoff                                38.9k    98%
>    change                                   -1%   -79%
>
>  openat O_TMPFILE, ext4, qd 1
>    baseline                                6.3k   100%
>    handoff                                11.3k   100%
>    change                                  +81%    +1%
>  openat O_TMPFILE, ext4, qd 8
>    baseline                               23.0k   258%
>    handoff                                12.9k    99%
>    change                                  -44%   -62%
>  openat O_TMPFILE, ext4, qd 32
>    baseline                               26.2k   248%
>    handoff                                13.4k    99%
>    change                                  -49%   -60%
>
>  openat O_TMPFILE, tmpfs, qd 1
>    baseline                               13.4k    95%
>    handoff                                43.0k    98%
>    change                                 +222%    +3%
>  openat O_TMPFILE, tmpfs, qd 8
>    baseline                               57.8k   220%
>    handoff                                51.7k    96%
>    change                                  -11%   -56%
>  openat O_TMPFILE, tmpfs, qd 32
>    baseline                               69.3k   218%
>    handoff                                56.8k    96%
>    change                                  -18%   -56%
>
>  splice to pipe, ext4, qd 1
>    baseline                               19.4k    96%
>    handoff                                21.1k    98%
>    change                                   +8%    +2%
>  splice to pipe, ext4, qd 8
>    baseline                               48.2k   176%
>    handoff                                48.4k   176%
>    change                                   +0%    +0%
>  splice to pipe, ext4, qd 32
>    baseline                               53.3k   188%
>    handoff                                48.1k   182%
>    change                                  -10%    -3%
>
> As you can tell, normal QD=1 type issues see big wins. Conversely, for
> higher queue depth, there are losses. The losses are generally from one
> of two reasons:
>
> 1) The syscall part is fairly expensive, and previously we farmed all of
> this work across a bunch of io-wq workers, and the parallelization
> there helps performance. For QD=1 that obviously isn't the case. The
> more expensive the lower level kernel parts are, the lower the QD
> required to see a perf loss. openat is the obvious worse case for this.
>
> 2) The syscall part ALWAYS blocks. For this case, io-wq is going to be
> quicker, just punt the opcode upfront. fsync on ext4, as shown in the table
> above, is indeed that case. Each of those block.
>
> I've got some ideas for how to mitigate the losses for higher queue
> depths, but a) I didn't think they were THAT interesting for an RFC, as
> low QD is generally what people do with these kinds of ops, and b) the
> main concept behind this handoff is really the interesting part right
> now.
>
> Passes the full liburing test suite, on both x86-64 and arm64. Other
> archs don't support this yet.
>
> This is obviously an RFC, in terms of what I'd love people to take a
> closer look at:
>
> - The scheduler hook and the identity move itself, kernel/thread_handoff.c.
>   Is the set of refused states complete enough, and is moving
>   thread group leadership this way (the leader must stay first on
>   ->thread_head, like de_thread() keeps it) acceptable / kosher.
> - The x86 and arm64 register state handling. x86 refuses AMX users,
>   and arm64 refuses SME.
> - Whether anyone relies on a task's user identity staying on one
>   task_struct in ways not covered above in the series.
>
> Patches are against 7.3-rc2. Also available at:
>
>   git://git.kernel.dk/linux.git io_uring-thread-handoff.3
>
>  arch/Kconfig                    |   7 +
>  arch/arm64/Kconfig              |   1 +
>  arch/arm64/kernel/process.c     | 109 +++++++
>  arch/x86/Kconfig                |   1 +
>  arch/x86/kernel/process.c       |  10 +-
>  arch/x86/kernel/process_64.c    | 139 +++++++++
>  include/linux/io_uring.h        |   9 +
>  include/linux/io_uring_types.h  |  48 +++-
>  include/linux/sched.h           |   2 +-
>  include/linux/thread_handoff.h  |  76 +++++
>  include/trace/events/io_uring.h | 114 ++++++++
>  init/Kconfig                    |  11 +
>  io_uring/Makefile               |   1 +
>  io_uring/handoff.c              | 395 +++++++++++++++++++++++++
>  io_uring/handoff.h              | 103 +++++++
>  io_uring/io-wq.c                | 270 +++++++++++++++++-
>  io_uring/io-wq.h                |  15 +
>  io_uring/io_uring.c             | 310 ++++++++++++++------
>  io_uring/io_uring.h             |  46 ++-
>  io_uring/kbuf.c                 |   5 +-
>  io_uring/msg_ring.c             |   2 +-
>  io_uring/opdef.c                |  29 ++
>  io_uring/opdef.h                |   2 +
>  io_uring/rw.c                   |   2 +-
>  io_uring/splice.c               |   6 +
>  io_uring/tctx.c                 |  16 +-
>  io_uring/tctx.h                 |   2 +
>  io_uring/tw.c                   |  14 +-
>  io_uring/uring_cmd.c            |   5 +-
>  kernel/Makefile                 |   1 +
>  kernel/fork.c                   |   6 +-
>  kernel/sched/core.c             |  36 +++
>  kernel/thread_handoff.c         | 490 ++++++++++++++++++++++++++++++++
>  33 files changed, 2167 insertions(+), 116 deletions(-)
>
> -- 
> Jens Axboe
>

-- 
Gabriel Krisman Bertazi
