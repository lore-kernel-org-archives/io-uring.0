Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368000;
	b=XOYuvhLIyerBLNqcp+CZ87yx6owQrV1XgKkXQYkdF5lYGA/0oxoesRtOpcNNcFOCqIoq
	 WNxktAem7Y8X6sEI3iGMrWjcEmKKE0XjByIAMKOEZV2MSwtdtrBZ3XTurAmMRYOkzBE8Y
	 n/wE32Z/QwY7elYj0RnMx7FM/VOXVQzD9xsAORXDh5HJOJ5U1MXINCQPXMnrw54n7geFM
	 WV9Uoulz06iBgAbBsY49vqHI2kw4FZJav6iVhTQKmFOnhAHdp7l5y5HttHOxFIX1OHF3M
	 JcBJ7W+7hjqtBKsFUnibVlvW5sHBm2q+cmjTPVPqLjGGb78SG97V6iKiFcPOD/qQW5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Content-Language:To:Cc:From:Subject:
	 Content-Type:Content-Transfer-Encoding;
	bh=+Sejojha3vSPB1Dw1U89z7G9BCP7AZstLb8X1qUvq78=;
	b=Bd15mXpZDlA8IP5RTrFDexEI703PT5oOxb9IwEAEhoaXiNwg0pvOyR4WQKBliS/6Lu7l
	 0Fm7b9oMzpRkAYlY1Do0wSQcQ+qHWi8/K+OYcBuMErRLARZGHXB3SuJ4jc836XeingRaD
	 SttwSBdhj5AY+EtAG7mnOKA3qo/8JvrUNe6zQnTAZUsvVi1zmC868ksKMkzvi8Pm2UEgJ
	 Qe7AmBoJblb2eI9E7kmeoQxw9oOzTUrcuzGUP6mFqBfBCcGfR6u/hfLY3C0rXzqsJZNWa
	 ispuEjyZCKXtRboTD1qFHz3FkKDuv2xbR74p5MYtbKEx212CGcnEwVI9klOplaXCswg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dpDJv1Tx;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B59C606A31A
	for <io-uring@vger.kernel.org>; Fri, 30 Oct 2026 13:46:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B59C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dpDJv1Tx
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1846bc43c28so819829c88.0
        for <io-uring@vger.kernel.org>; Fri, 30 Oct 2026 06:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793367998; x=1793972798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+Sejojha3vSPB1Dw1U89z7G9BCP7AZstLb8X1qUvq78=;
        b=dpDJv1Txnvk6ZPD6R9QLTfuvBqrLJFilZkwLObr5y/rQjJEScVenEheZHVaKjJ7blK
         N3D3042pxSBPulW6VQBno7LEJS3bMFSavJCRkqJEK8gDFLp+LiSai3MIh2iYGAeLFpa3
         70AhdNDm/Q0XQtwB26PgoZFnFMUJbRt1XW382zmNtqt7A6eFKUvyftfbv8Seh8MxhJKy
         TIJITfa7nwE3EQl5R+bGyk7zOcnCthAwNZCOE8jHWi9uTdH7s3nP29qgd6fWclUmgJSn
         RQbQuDbFlLiPZWwALw5AnupzN6yhdY0HG8W1pb9L60dadVc/viZG+dqL4Iga3YfEsGUc
         XFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793367998; x=1793972798;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Sejojha3vSPB1Dw1U89z7G9BCP7AZstLb8X1qUvq78=;
        b=2Mzm73zBzAth0Xq/KRLaB0q4noJqcjEP16CBG86Y0qsmUd4hhH24gJpgD1R4vlo6FV
         bb9CwDVy0zGeTg4Ywk+yNGdaxqLlHNIkAxfAx8VevFKDrEGgjXUL2eQuJxcsS4OS31kO
         7z7QGPkXbUB25kagSnj/ZoMsf3FfvZ0zCCG0+MIXr3G8EYSmm1IQwjSDJzVC2F7Dj0iq
         NDpZjkbimtbyRHm6N0nVLhcGYKXtkb3WF/LqKbfnAG0hj+S1z1ypCQP1dF47zy9Yjne6
         neByMcvUopB8hnRiN5WzZDloXLtqbcWV7EVvclC051miNBNLevoY6J4QkfWD90tHt7jH
         aATA==
X-Gm-Message-State: AFq9FYL6ijrAjkpIs/kB+m70oQtuSrhtpzobDRPYidMOHK2MzxRhDO7e
	gXgTVhoWwqMen3z0iUZcuex4JlqWZnCySA/SrTAsLt1jk7Nox4bjvRBdHtuABvJckt94l1beNm6
	Qv+CMi+A=
X-Gm-Gg: AYBFou2wj4ETwuvbNjaUdFNOF0+8GcRcCZvlN27scp2zqixwzg3S9DyHtZpuUie8RbG
	7Xd6av7s0uHunpfKrBr4AlfPw6zBOGzesKsYXDCvhqm19R+h+L5vCqMv+v4m2DK0a/rRqiT4D8V
	fnPFO8NpOabHjVJm1Ux+MxqqV0emqdDGa2vX12AAZ/awma1hMi6IBu6RPdhEsD0YMrOSdmNd6/r
	6Hgb05kjG1XGAmbCHj/KirdWQHf5Me+RlG6y7wxAixCOjE2DOS3pPVKIzZVl7sHvHSuDHL+XEWK
	E1mie1lBviAm73afDUax95gkgupWjq+OoU3NzkGlogvzv4hISIJg2M2Uc9EuKQ6j0whKIX2odng
	uyprs1JC+UYjeLpP2yl1DNIYVS2msU2WtbL1Xt/tujrmVMVVYVPbx9F0SjWCoO1mdyo5+pnjsuy
	UL1Ov0MfO6tvgzvgSA3wq+JDpcdqZlR4wd8L1R2ytdfLOEAf0XgR7ieZ4oxd2tlNXSVf5RJI+2n
	bxBDyLupSlYzOjr1iAzLTSH44wm1hFtyuIRcFrkRtBUCxm8GnWXc8E5Sv1rnL7X+pNjkqvGCp3f
	ioZ4986H6wdvMVMALxAPQLdfxcSfl4COXPBaEUt7R5bw+PzQuO6/3FXM6pDAaok6kZ/q1vkXr7d
	SU3ZRp7xQddWJ
X-Received: by 2002:a05:7022:2606:b0:187:ec67:2fc5 with SMTP id a92af1059eb24-1ac5de53d33mr3578248c88.32.1793367998327;
        Fri, 30 Oct 2026 06:46:38 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c2e9dsm9635507c88.9.2026.10.30.06.46.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 06:46:36 -0700 (PDT)
Message-ID: <e2d2c19d-fdb8-4c66-a912-70c99ec9456c@kernel.dk>
Date: Fri, 30 Oct 2026 07:46:36 -0600
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
Subject: [GIT PULL] io_uring fixes for 7.4-rc1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Linus,

A pile of io_uring fixes, that either came in during the merge window,
or just needed a bit more simmering before I was comfortable sending it
all out. This pull request contains:

- A batch of fixes from Chris: charge registered buffer arrays, rsrc
  nodes, tctx nodes and personalities to memcg, and free the XArray
  nodes a failed store leaves behind. Clear bpf_ctx while submitting
  SQEs from a bpf-ops program, as the socket code otherwise skips both
  the capability check and lock_sock() for a setsockopt from the SQ.
  Free the task context after an RCU grace period, closing a UAF when
  a foreign task frees the last request. And stop io_ring_exit_work()
  from waiting on an SQPOLL thread held in get_signal(), and drop
  sqd->lock while the thread waits for in-flight requests, as either
  one could pin every iou_exit slot

- io-wq fixes: don't create new workers once the exit has begun, which
  could leave an exiting worker in the thread group under exec; save
  the worker type before dropping its reference (KASAN UAF); and defer
  io-wq enqueues from a foreign task to task_work, as an IOPOLL reap
  by another task could race io_wq_put_and_exit()

- Keep the drain active when the deferred request being started is
  itself a drain request, and don't attach a new ring to an SQPOLL
  thread that is already canceling

- Fix the multishot recv length limit accounting, and count cancelled
  timeouts in cq_timeouts so an armed off timeout doesn't fire early

- Advance the buffer ring head when a pickup empties it, and keep the
  recvmsg buffer select length within MAX_RW_COUNT

- Mask the socket type in the bpf filter population so SOCK_CLOEXEC or
  SOCK_NONBLOCK can't bypass a type filter, and enforce the per-task
  register restrictions for blind registration

- Complete a non-blocking connect() that fails with -EAGAIN rather
  than retrying it through poll and io-wq, matching connect(2)

- napi list traversal cleanup, and remove a useless min_not_zero()

Please pull!


The following changes since commit 6b4b543fa18757297ac756a6fe6e64f506b7844a:

  Merge tag 'parisc-for-7.4-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux (2026-10-25 18:04:17 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux tags/io_uring-7.4-20261029

for you to fetch changes up to 22d9db9fd64a493525d692b32c556875b7254665:

  io_uring/sqpoll: don't attach to a thread that is canceling (2026-10-30 07:33:00 -0600)

----------------------------------------------------------------
io_uring-7.4-20261029

----------------------------------------------------------------
Anvik Loitongbam (1):
      io_uring/napi: clean up list traversal with list_for_each_entry_safe()

Cheng Yongkang (2):
      io_uring/timeout: count cancelled timeouts in cq_timeouts
      io_uring/net: fix multishot recv length limit accounting

Chris Mason (7):
      io_uring/rsrc: charge buffer arrays and nodes to memcg
      io_uring: charge tctx nodes and personalities
      io_uring: free XArray nodes left by a failed store
      io_uring/bpf-ops: clear bpf_ctx while submitting SQEs
      io_uring: free the task context after a grace period
      io_uring/sqpoll: don't wait for the thread to exit
      io_uring/cancel: drop sqd->lock while SQPOLL waits

Cl?ment L?ger (1):
      io_uring/net: Remove useless min_not_zero() usage

Daan De Meyer (1):
      io_uring/net: don't retry a non-blocking connect() that fails with -EAGAIN

Dominik Maier (2):
      io_uring/net: mask socket type with SOCK_TYPE_MASK in io_socket_bpf_populate()
      io_uring/register: enforce per-task restrictions in io_uring_register_blind()

Jens Axboe (2):
      io_uring: keep the drain active when a deferred drain request is started
      io_uring/sqpoll: don't attach to a thread that is canceling

Josef Bacik (1):
      io_uring/io-wq: no new workers once the exit has begun

Kyle Zeng (2):
      io_uring/io-wq: save worker type before dropping its reference
      io_uring: defer foreign io-wq enqueues to task_work

Yichong Chen (2):
      io_uring/kbuf: advance head when a pickup empties the buffer ring
      io_uring/net: keep recvmsg buffer select length within MAX_RW_COUNT

 include/linux/io_uring_types.h |  3 ++
 io_uring/bpf-ops.c             | 16 ++++++++++-
 io_uring/cancel.c              | 20 ++++++++++++++
 io_uring/io-wq.c               | 14 ++++++++--
 io_uring/io_uring.c            | 50 +++++++++++++++++++++++++++-------
 io_uring/kbuf.c                |  4 ++-
 io_uring/napi.c                | 14 +++-------
 io_uring/net.c                 | 27 ++++++++++++++----
 io_uring/register.c            |  7 +++++
 io_uring/rsrc.c                |  7 +++--
 io_uring/sqpoll.c              | 39 ++++++++++++++++++++++----
 io_uring/sqpoll.h              |  3 +-
 io_uring/tctx.c                |  9 ++++--
 io_uring/timeout.c             |  3 ++
 14 files changed, 172 insertions(+), 44 deletions(-)

-- 
Jens Axboe

