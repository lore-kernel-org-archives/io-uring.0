Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792593631;
	b=ZM2oe1JZocM/mr2qpj0/+ZR4PwZBIM+KB//x6fqgRZeDIERbwFWUVyNLbJFEvoUh/xTY
	 /vDnH+mq3ezuxptKgkeMk6nJ297Avb/6DEV4AjAHEm/P8zLp9Jp3c0I7BRF6KW1r0zmAG
	 fQ9VtkEzWkiU4Je78Wmz63sEdBBzOf8d98krToAxwUYHnKibPdQ3/vhYkcYc59XwWZ2aa
	 EXzkewwb8KXgNM1sGILoQq/kKjVZVW30lih6QpTlXhQQVG9nfeOw9ETG5oXCgBtsOG2jr
	 8rT6vy9n7jGX9IEbF1F+xkRBhP9WKVtxsxyi2Vk7/N8eQGGGpeQnJ/fO8gXV34iwUrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792593631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Content-Language:To:Cc:From:Subject:
	 Content-Type:Content-Transfer-Encoding;
	bh=z5oYMyZjEJAsZvkXcFFdWREmQihUwIFOrgOy5EHmUzg=;
	b=shBUfypP3lcvU00lqErXxExoLujtyIZFDbv7NgPxJz8qvmqHrIB5da43HLzzimGL/oI2
	 oixCqv0vzQiphXRpz3I0rjUode0MJ+6n054PrGNbm6HadOGTUt6ySBJqXJcGbYW5+JmNz
	 Jd1QQme0Pd5R45h62uqo4Lu62cTYvQYBKiHxviRIDvKQoCU4kK+WdvBHIljcfviwd3zrx
	 +uYnz7aCEzIrBDsINVrAx8N3IPKb0wXM7OIomKJxx6bfrPBUPsb3YSJBOJJHQy+uhXmaa
	 /UoIzonjCR/Q2sHWlxcxzDINMVneDnrmLKBS2k0w5e9H0Qsy82VcAW5lWxD7P3idm6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=MlowtuuV;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3D1606A319
	for <io-uring@vger.kernel.org>; Wed, 21 Oct 2026 14:40:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB3D1606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=MlowtuuV
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-17bc533fda3so957423c88.1
        for <io-uring@vger.kernel.org>; Wed, 21 Oct 2026 07:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792593628; x=1793198428; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z5oYMyZjEJAsZvkXcFFdWREmQihUwIFOrgOy5EHmUzg=;
        b=MlowtuuV34KOMtxU7uyhFr8fUg8uOqVH1G5F3S04SNQkbIBcSoudb+akWJDhUO4kOE
         Dn0MMwyZnZXAOCIfA9IHZpl+BJibOvKmUdt2ci4+6F3f14F6Za5WyVS3gA1kvcNmmJL1
         820K19fVcsQjiuD4sBm+VgfYOHqcXVsLf0pA0UrbR8XYDtHUVjSWy2ULZCzBSlNzItHd
         OhOt4gmeG5hZkCxKJMSJdXVKI2rhvQ5fCNs3MlU/T/sfoO9SW8mdsivNAgJChWe7rgve
         DiQ4VVHLbzU02J0CwOVgVtzmbWSc+08E0Vw9oWn2+5wXfWc6lIeaMs35qy4zPTtPoXW4
         FGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792593628; x=1793198428;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z5oYMyZjEJAsZvkXcFFdWREmQihUwIFOrgOy5EHmUzg=;
        b=KD4qiL6a/nYOgOR09uAh2RF0kyhtzOackuA8Xu7nIg95Roecxx8Etdy/t5ia374eRJ
         Z+YyFDBSlxBkKxRBmiRu+e82VmXE5IRJewLc06LMchTQHJhGgRtM5TiCOEwysxpw32W3
         fgKRenfRr/tv3/dLUW+LMqcHv7rr0Maw+sXDwtyvMCqE6Juauh2cQuAtqF/SepZ2VhmR
         BGj5n6modrh/irb3BsiXt+22+dLbEudxQWWc/Y/urBJ+VO7826KkpMTiyqMADPDegU4G
         /4hySj7skmnjfcEErU6AoXKdlGhltU6/6XFTverMEcl+Zd5o8OHW/IAAWoXxlTMm7pZx
         5RZw==
X-Gm-Message-State: AFq9FYJqJ3JaooVR8B1LRvj84LAHfEZwBbAPfZGKbCSh/To8zGK0tS7Z
	w+dWSIfQU4CaLAwWvPNCv5aBGtRclmNnio5rMh6veXfzixQvDGW+PUW4l3A/lBDybjUBixhT7Wv
	NUTUurFE=
X-Gm-Gg: AYBFou3c43fxY3BeuRyZ4LnFvGhL3LIw/V+2UFQVSGhYn8B9XDiLLbOWK2N8Zd1Oc/O
	Xh5DmvDPcBZwMexy5OQGq3r1hIOR4Ym5kHvo6SwtM555Tf4ICbh4Ds9V94BveRU8HlBAG7Jfage
	BHLofMJqsOU8NS7as+cFvVSxJ7ZuU2CBMpHpa2pSERpfoHq9Ce178NWVUIqN4gJSXFnVonNImSx
	eMk9J+zeX4A3Ncl69tf5n2qJYmCc+fdiGWhvsC/0PT05geyhWEQfJvkMMO4L+pRb8sF6ZDGoCur
	4RElsw8TDK5ABAi0B/a3kQtQ013OXqYch+2xKueF+sY5rwk1+KOTXgleGNO89akVi7E9Bo8MHh0
	GhaKaJz848eseDdjJtzmpsBlM8lSDuLMxcXTlwgtm6FJnbFlKQQvAQj/u0Wval3dJsqti6rv9bD
	Eh1wFOR5tnI0mi1yypr2h8NWNvIFFf2liWdKL299LSGS8pL4LVQUtClYS55jgPGnDhbAnDMtzDL
	m/qZ/Zt/id+b+Gc25q4oFS853wj7Ggc089xbJ9BF4CjmMhfuo+dQqIKVx1JiktzQ6lSPM03/CSP
	ZdEkXaWeHnbBrrW4OsqvkiWyVSgIx/RU0zQJPJT+
X-Received: by 2002:a05:693c:41d3:20b0:35c:ea0d:a9a6 with SMTP id 5a478bee46e88-3674d75751emr3293200eec.32.1792593628001;
        Wed, 21 Oct 2026 07:40:28 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367417a2fadsm7566921eec.21.2026.10.21.07.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 07:40:26 -0700 (PDT)
Message-ID: <8bbd8607-bc13-4070-8791-07cdfa31b45c@kernel.dk>
Date: Wed, 21 Oct 2026 08:40:25 -0600
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: io-uring <io-uring@vger.kernel.org>
From: Jens Axboe <axboe@kernel.dk>
Subject: [GIT PULL] io_uring updates and fixes for 7.4-rc
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Linus,

The bulk of this is a big robustness pass over cancelation, io-wq,
timeouts, and poll. Outside of that:

- Large series from Josef hardening the cancelation, io-wq, timeout,
  poll, and wait paths. Fixes for lost wakeups and lost cancels as io-wq
  arms poll/timeouts, work stranding on worker exit, CQE32 resize
  handling, napi entry timeouts, and a pile of smaller correctness
  issues across the board.

- Rework of how io-wq posts completions, posting from the last request
  reference and dropping the request file before the completion, and
  running ring release cancelations synchronously - canceling and
  waiting for all in-flight requests and dropping registered files and
  buffers at release time.

- Don't charge the SQ/CQ rings or provided buffer rings to
  RLIMIT_MEMLOCK, which the region API conversion had started doing.

- Split io_uring_cmd_set_res() out from io_uring_cmd_done() so a command
  can set the result from its ->end_io() handler, used by nvme.

- CQE32 ring fixes for the free entry check, aux CQE big_cqe zeroing,
  and the dummy skip CQE.

- Timeout fixes for sequence handling and multishot updates.

- net fixes for MSG_TRUNC buffer overconsumption and keeping recv buffer
  select length within MAX_RW_COUNT.

- Wake real-time waiters from hard interrupt context.

- Don't spin on local work an exiting task can't run, reachable by an
  unprivileged user.

- Various other fixes and cleanups.

Please pull!


The following changes since commit df2908090cda368b01ff43709f51890076c56157:

  Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/for-7.4/io_uring-20261021

for you to fetch changes up to ecb6817b769fd7d71af2c9f446188649020b2e53:

  io_uring: end the drain when the drain request completes (2026-10-20 08:35:27 -0600)

----------------------------------------------------------------
for-7.4/io_uring-20261021

----------------------------------------------------------------
Austin Schuh (2):
      io_uring/wait: wake real-time waiters from hard interrupt context
      io_uring/futex: return a wait's data to the cache when it fails to arm

Caleb Sander Mateos (4):
      io_uring/rw: keep CQE flags on iopoll requests when adding kbuf flags
      io_uring: move req_set_*() to public header
      io_uring/cmd: split io_uring_cmd_set_res() from io_uring_cmd_done()
      nvme/ioctl: call io_uring_cmd_set_res32() in ->end_io()

Cen Zhang (Microsoft Security FORGE Labs) (1):
      io_uring/cancel: don't spin on local work the task can't run

Christoph Hellwig (2):
      io_uring: cleanup __io_prep_rw
      io_uring: cleanup the io_uring_attr_pi definition

David Wei (1):
      io_uring/memmap: fix non-compound alloc fallback with memcg accounting

Eugene Gvozdetsky (1):
      io_uring/register: don't exempt disabled rings from task restrictions

Gabriel Krisman Bertazi (2):
      io_uring/net: let io_recv_buf_select return the length of the buffer region
      io_uring/net: don't overconsume buffers when using MSG_TRUNC

Hengyu Liang (1):
      io_uring: do not charge the SQ/CQ rings to RLIMIT_MEMLOCK

Hui Peng (6):
      io_uring/bpf_filter: mark source as COW when cloning filters
      io_uring: only post the dummy skip CQE on CQE_MIXED rings
      io_uring: fix free entry check for 32b CQEs on CQE32 rings
      io_uring: zero big_cqe for aux CQEs on CQE32 rings
      io_uring: check for room before posting the dummy skip CQE
      io_uring/rsrc: fix accounting for cloned buffers with huge pages

Jann Horn (1):
      io_uring/fdinfo: ignore IORING_CQE_F_32 in last CQ array slot

Jens Axboe (20):
      io_uring/rw: end write accounting from ->ki_complete
      Merge branch 'io_uring-7.3' into for-7.4/io_uring
      io_uring/io-wq: put the request file before posting a completion
      io_uring: post io-wq completions from the last request reference
      io_uring/rw: don't reap io-wq IOPOLL completions while io-wq has a reference
      io_uring: put request files before posting the completions
      io_uring/uring_cmd: only cancel requests of the given task
      io_uring/notif: count pending zerocopy notifications per ring
      io_uring/cancel: cancel and wait for all requests on process exit
      io_uring: run cancelations synchronously on ring release
      io_uring: drop registered files and buffers at release time
      io_uring: wait for in-flight requests on ring release
      io_uring: fix task_work add use-after-free with SQPOLL
      io_uring/kbuf: don't charge provided buffer rings to RLIMIT_MEMLOCK
      Merge branch 'io_uring-7.3' into for-7.4/io_uring
      io_uring/timeout: don't put a sequence target behind the last flush
      io_uring/timeout: don't flush with the sequence behind the last flush
      io_uring/timeout: don't lose a cancel as io-wq arms a timeout
      io_uring/poll: don't loop on HUP with multiple references
      io_uring: end the drain when the drain request completes

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

Juanlu Herrero (1):
      io_uring/poll: avoid retry wakeup loss when dropping ownership

Junyeong Lee (1):
      io_uring/waitid: prevent cancel reference wrap

Junyuan Feng (1):
      io_uring/zcrx: requeue multishot receives stopped by a local resource

Natasha Klaus (1):
      io_uring/net: populate CONNECT filter fields for 24-byte sockaddr_in6

Nickolai Zeldovich (1):
      io_uring/waitid: return -EAGAIN for a non-blocking pidfd

Oleg Nesterov (1):
      io_uring/io-wq: don't call try_to_wake_up() twice in io_wq_worker_wake()

Tamaki Yanagawa (1):
      io_uring/net: keep recv buffer select length within MAX_RW_COUNT

Xiaochuan Li (1):
      io_uring/io-wq: release raw spinlock before calling wake_up()

Yao Kai (1):
      io_uring: initialize task context before running the BPF loop

lollipopkit (1):
      io_uring/cmd_net: end TX_TIMESTAMP multishot when the CQ is full

 drivers/nvme/host/ioctl.c      |  19 +-
 include/linux/io_uring.h       |  32 ++++
 include/linux/io_uring/cmd.h   |  34 +++-
 include/linux/io_uring_types.h |   9 +
 include/uapi/linux/io_uring.h  |  15 +-
 io_uring/bpf_filter.c          |   1 +
 io_uring/cancel.c              | 135 +++++++++++--
 io_uring/cancel.h              |  15 +-
 io_uring/cmd_net.c             |  19 +-
 io_uring/fdinfo.c              |  23 ++-
 io_uring/futex.c               |  38 +++-
 io_uring/io-wq.c               | 138 +++++++++++---
 io_uring/io_uring.c            | 417 ++++++++++++++++++++++++++++++++---------
 io_uring/io_uring.h            |  67 ++++---
 io_uring/kbuf.c                |   8 +-
 io_uring/loop.c                |  13 +-
 io_uring/memmap.c              |  18 +-
 io_uring/memmap.h              |   2 +-
 io_uring/mpscq.h               |  14 +-
 io_uring/napi.c                |   4 +-
 io_uring/net.c                 |  81 ++++++--
 io_uring/notif.c               |   2 +
 io_uring/openclose.c           |  11 +-
 io_uring/poll.c                |  38 +++-
 io_uring/refs.h                |  27 +++
 io_uring/register.c            |  75 +++++++-
 io_uring/rsrc.c                |  42 ++++-
 io_uring/rw.c                  |  74 ++++----
 io_uring/sqpoll.c              |   7 +
 io_uring/timeout.c             | 120 +++++++++---
 io_uring/timeout.h             |   2 +
 io_uring/tw.c                  |  39 +++-
 io_uring/uring_cmd.c           |  25 +--
 io_uring/uring_cmd.h           |   2 +-
 io_uring/wait.c                |  48 +++--
 io_uring/wait.h                |  15 ++
 io_uring/waitid.c              |  23 ++-
 io_uring/zcrx.c                |  13 +-
 38 files changed, 1297 insertions(+), 368 deletions(-)

-- 
Jens Axboe

