Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478714;
	b=HwgcKC7hbmAhDu0hawv1jnECfv1T2uTH4+D/kQXZbK5FMcvkP9Lb26Tnc1t8EtzoZ+s8
	 dj35Mar+DMw7/S9EHyYVOOOgPzapo/CHVHfr6Xw0RYALWf9qH48+xtPng7JkPqI4pmH+y
	 lKQbmSyh3xNMj/tHpmeyjnjBxqRhpyzg5vwonvu7YEVpz3OBYYx68JM40PpEQuUkCh7xL
	 Z996xyy//Orr0X0UN+0f9/WiQlLgz069y10hJm31r45XhM3XV8yWSWLwo4Z/2m3EKGiaC
	 m3KMIxOUwW1zYDA+6iC6qmbFTe3q2pKcOPeGdt1/bu6g0/GYpHSWeerAIOuOCtaXG0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478714;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+UdPCHMg1FScbhxVPW4mzgiUXb1gccMlfPmwASjRzO8=;
	b=RDawTpgSQqnkbLp7BCLLTnaoknWwKRfcHkP9Fak6XhQwl9xsmBN0B6sMlYIeTz0iI7u5
	 8fXco5vPjpI0iKt8L79NZXrriq4ZybIQCIas3kfYtVfvKrgMAWepMxIiTecX8LdSYU0sY
	 e7QgqG5xKXVdQMDVMIFU3McnFfY6T1EYnpWJcOFLqYz8qoYrN3/s5x52486eMjeMVmq5u
	 ULPNSeN+NCMKCx7Aql+3CC8PSXr0oTO99uyimOG9ldBVofvVqudw5ypoll3ybtF7kZleF
	 ltwfiY7Khz4ehvt4vBNYUzM3szA8iw+O2UHvpDLsuJAanrDsWehGovdoC4LLfNLy9Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=mTMGPEP8;
	arc=none smtp.remote-ip=115.124.30.97
Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8568606A320;
	Tue, 20 Oct 2026 06:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8568606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=mTMGPEP8
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792478703; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=+UdPCHMg1FScbhxVPW4mzgiUXb1gccMlfPmwASjRzO8=;
	b=mTMGPEP8wdouMygJ7+/zizkD1I7UjUsp1ngnTY1DZ+HCQ7Foj8l7Rz/nT87TAvvxeNT48r+QDvAvzIGQezigHUfJfEuiudI+oUFwKaozrYp0BaP7W12h78CJkSIr4tvBxMM5Tgdu49vK4adOW5tDdPdz7I935/1cwaBCDl/nm5w=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=xiangzao@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0XDBupRa_1792478692;
Received: from banye.tbsite.net(mailfrom:xiangzao@linux.alibaba.com fp:SMTPD_---0XDBupRa_1792478692 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 20 Oct 2026 14:45:03 +0800
From: Yuanhe Shu <xiangzao@linux.alibaba.com>
To: Jens Axboe <axboe@kernel.dk>,
	io-uring@vger.kernel.org
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	linux-kernel@vger.kernel.org,
	xiangzao@linux.alibaba.com
Subject: [PATCH 0/2] io_uring: add schedule points to request freeing loops
Date: Tue, 20 Oct 2026 14:44:50 +0800
Message-ID: <20261020064452.3633250-1-xiangzao@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
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

An I/O stress test on a production v6.6-based debug kernel (stress-ng -a 1
--class io -t 7h on a 384-CPU machine) hit the soft lockup watchdog
twice.  The kernel was built with KASAN, kmemleak, lockdep and
CONFIG_PREEMPT_NONE=y.  Both lockups occurred while a CPU was busy
in an io_uring request freeing loop that has no scheduling point:

1) A stress-ng worker looped in io_free_batch_list(), reached from
   exit-time task_work, until the machine panicked on "softlockup:
   hung tasks".

2) A completion fallback work item held uring_lock for 671 seconds
   in that same free loop, until the watchdog fired again
   ("BUG: soft lockup - CPU#61 stuck for 671s").

The field kernel is v6.6-based, so to check whether the same
weakness exists in current mainline, I tried to reproduce the
pattern on v7.3-rc7 on a 192-CPU debug kernel (KASAN, kmemleak,
lockdep; preempt=none - see the note below), with a test
that submits 32K requests per ring and then kills the rings.  I
don't know whether real workloads hit these exact loops on
mainline as hard as our test does, but the loops clearly have the
same unbounded shape:

- A single io_free_batch_list() call freeing a 32K completion batch
  took 443ms with no scheduling point in between.

- Killing 48 rings at once made one __io_req_caches_free() call
  drain a single cache for up to 13 seconds, with 8 kworkers each
  stuck for over 12 seconds; a separate run with 96 rings produced
  97 soft lockup warnings during teardown (the stack is in patch 2).

With this series applied, the same 96-ring run produces zero
kworker soft lockup warnings: all 97 drain-path warnings are gone.
This series targets the request freeing and cache draining paths;
the submission loop itself may need a separate treatment and is
intentionally left out of this series.

The free loops are the remaining gap: the CQ overflow flush already
drops the lock and reschedules (eac2ca2d682f), and io_add_buffers(),
io_remove_buffers_legacy(), the fdinfo dump loops and the tctx
teardown all iterate with a cond_resched() in the loop.  These two
request freeing loops have none.  The debug options amplify the
per-request cost, but the loops are otherwise bounded only by the
number of completed or cached requests.  No functional change is
intended; the patches only add scheduling points to long loops,
and cond_resched() only invokes the scheduler if need_resched()
is set.  Unlike the overflow flush resched point, these do not drop
the lock or leave any critical section, so they introduce no
reordering concerns.

Note: the mainline test was booted with preempt=none to match
the production kernel above.  On x86 this required a local Kconfig
adjustment to disable PREEMPT_LAZY; this is a test-environment
detail and does not change the fix.  cond_resched() is the standard
schedule point on PREEMPT_NONE/VOLUNTARY kernels.

Tested with CONFIG_DEBUG_ATOMIC_SLEEP and CONFIG_PROVE_LOCKING
enabled; no might_sleep or scheduling-while-atomic warnings during
the reproduction runs.

Yuanhe Shu (2):
  io_uring: add a schedule point in io_free_batch_list()
  io_uring: add a schedule point in __io_req_caches_free()

 io_uring/io_uring.c | 2 ++
 1 file changed, 2 insertions(+)

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.43.7

