Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187503;
	b=BDmbiVWULDF4FnfSeIywqw43Xc/DUTn//vTeQkaOmKo9MatFG5yQRqOfZOOZg/ndu6v2
	 SpLwoUfAoRuAfJAX709K1GPnJNRNu0YCT7j2m8R9Pl2FRFaVEe+bZFuNnr1r/83hw+q55
	 agWbfYpvWqOSUIaNR+Lus+71iuHhmklkGBcwlEwTlLUmHiIBB1gxrzf8hT/y6G4I5EBic
	 PIlDtRQbBzai33HTrP4MtkyiQsWvm5NOo+zn2I7kjzKrl7HR5wG2I9TwdYfB7Vjfki3my
	 As0D3koRihs+2XuYo9QxECIhN3pH6hYc4/EcDTtxWupdlqQhZcBhQejxgtzckcaBfKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187503;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Content-Language:To:Cc:From:Subject:
	 Content-Type:Content-Transfer-Encoding;
	bh=OrIXVWOYNbGUC+6/aKAdRPodPhw+kP3f2USHFB8jC6c=;
	b=u0yrt4T+AaQVFW3BPJnfX3eEsgHxadh7zEp1b/mkH+e4PjffGfMQ+TiHeSj1k8rlVRo2
	 2HQ0rShau46Zjsnz/ZGvvgyhQupeo66IMWIu1MHNZstFdczzYMJEDJ4XiPGPjlT9lXIGz
	 xoh/GcFKpiaMUjfk+7+9Z8mpN79O4pMvWgdgs2kTIFtSIhYtC2xxLBUlhyHvO+JV9k3d7
	 0N52jXX02aEt9chHFYFN92azJyEjSZytlGQR5u1f2VeaRG90Cm43Qm66md0SC/RRfYU3K
	 fdg16iVwIcMpUL4cnzb3tYdxaK6c5Kxkgr3gBCxvV2wGYPpqLKLvNd5vUIWsnoQZfqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AdTFbdel;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB8060A260A
	for <io-uring@vger.kernel.org>; Fri, 20 Nov 2026 15:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CB8060A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AdTFbdel
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-571888655f1so383783b6e.0
        for <io-uring@vger.kernel.org>; Fri, 20 Nov 2026 07:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1795187500; x=1795792300; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OrIXVWOYNbGUC+6/aKAdRPodPhw+kP3f2USHFB8jC6c=;
        b=AdTFbdelgyofvmGb6vALRuUR4Cvtl4U34Cac+atXQlKpKn5hTqDzGg9nb6Xws35fzz
         +9dcpVpKkY8RQb5yGqkJc9baWTNVKLYT/1Fp33dS3TwH9vTc5x7NjxH1H5xCGn3RlJ37
         /5x8QJq4CpSg4TEQ8BLujC4dVGRZWY+DBejskYHWujcvhbeLpUnW1/Y8DSlsIUpUTV2E
         9R2KOHEdbxIqNYnP6KnsMxLpi1WVJ+7dyBum12eTLmC2P1W/dWISVlKVh4rBsWssr1bP
         8o+eMHNwLcqPeCr40DBeOxNgl1QLm+9Hf2NxBQ2EOedboFXkPfy1eTGPkOspuoZe8zwl
         i0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795187500; x=1795792300;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OrIXVWOYNbGUC+6/aKAdRPodPhw+kP3f2USHFB8jC6c=;
        b=xSEjCKsmgZv5V9Hm2M/hYn41GkfwQ+8wbYoEG9uE8HdpaQeBJ2hC9xc2vM/n8gjpZq
         2lNXB1AISIr/zYvnOXg4hZ/mrMgG0Y3r1J2GYrwAyH/vGc26vJd9k5bRqq+7QYmkV/6g
         S+cklpktSZJum9pHGATjCnOsnjvcviCZt4wrOzJnYSePSkhDpPQY8vPMl3E2XldalbWL
         6mMApurVgajE9C9NCkHmkriv/Ba2g/FYLTsG1nVTkTVKV7YCRh6AbzyKeKQe5+gRi06P
         N/Pczrj13gJtBbexiZJWMULa1TDPNmFM68YJ54q/TVae4mSCGUiksiTFtz3g7eymW2qa
         MZYA==
X-Gm-Message-State: APuU4Z+3LOwuIrytKAodQ1keDrFNoOOaauBrR1WTnDUj3YZqRLCIzYFo
	a/x1NM16Ag+OnWNeD3nuMCYS9XbkwllSEy2044jFNG0fA0OoJsf3zbrLZbiQcYTGCV3WGaxNgIT
	qyo3oad4=
X-Gm-Gg: AZFdTZffHfWqs/tqcKo49cgdcWUCKtReN0vMaYKA2wjH84dJUWiVVd2264pv3nyPiJ0
	KEipfUmYYCm3aqI+HPQ2IYtXhaGclS7KDdlbNfL70jobHUJ0yaUdSWtcCCMTMpIKjmcfdel2cgh
	wzoU+xNrj5dMl9hkfYIxZlvODCqW2QHOM93Zlx8L7xFBZaVHrQVFd/w1Hc4z2o3sNZynjtrFA8o
	JVcl1Gimx6rw1yjadIkS8+6Qw/t4edXcXr9lHHFKJX3azvrjjpntcYj0lLLqTqwhHVVkrPayWWc
	gXx3aLlp5HzyqrF8dBzy0wTopVu72qkt5LPO/3bUZelzIvE4jRA9DZHaWC/mgw+a2v5W0oklbGD
	mR+vELpDEXdUHYo3uPrsHoj6tB8Ktve5JG5D/5UtyN1xQ/Qq3WBHyBCUpvWWebt++9DYYkFdB7/
	TnPO/plxixM7r6X56nv8QpZ8FnJksR+Af3ogFDGHvDCm5sNetjNA7/gsQHQzMQUe6CUlvmSodAj
	0B4JkS7ZoQqTomz0+vwkSHeUSJTCp58GPWcA+TGQAJT3/MYzFa5tSRK4cskrsHnI4jL2vCX85Yn
	oF/RZ/6VUYAwd5y050A9tDS6YMsnmhdEAdpOieZylCkggtNFSvCAX9mL/lhcYjCihcunYrjTYqq
	llxQ0H1mJTXCNBhlsXvx5dXi7XsszIWOv0ieY+LSSDxyXA43ykTfuAsNanRT37Mf5iz6t
X-Received: by 2002:a05:6808:f08:b0:4e9:7d56:846f with SMTP id 5614622812f47-57a0b041513mr3961733b6e.41.1795187499896;
        Fri, 20 Nov 2026 07:11:39 -0800 (PST)
Received: from [192.168.0.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm2205477b6e.9.2026.11.20.07.11.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 07:11:39 -0800 (PST)
Message-ID: <a637854a-2c55-4609-9faa-80378d817ba3@kernel.dk>
Date: Fri, 20 Nov 2026 08:11:37 -0700
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
Subject: [GIT PULL] io_uring fixes for 7.4-rc4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Linus,

io_uring fixes for this week. This pull request contains:

- Don't run canceled local work from a task that doesn't share the mm
  of the submitter on ring release.

- Fail soft links on negative IOU_COMPLETE results, on cancelled futex
  waits, and on short or failed IOPOLL IO.

- Show the stuck io-wq workers rather than WARN on a slow exit, as the
  WARN can be triggered at will and the exiting task's stack trace is
  never the interesting one.

- Don't rearm a multishot timeout on cancel, as that could delay ring
  teardown for a long time.

- Keep the old registered file when a file update fails.

- Honor the sqe->len limit for legacy provided buffers in
  io_buffers_select().

- Apply the current cpuset of the cgroup to new io-wq workers rather
  than the one captured when the io-wq was created.

Please pull!


The following changes since commit 39c7210e970200f8b17de3767c73efe64173a95f:

  io_uring/napi: don't end the single NAPI busy poll early on need_resched() (2026-11-09 14:48:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux tags/io_uring-7.4-20261119

for you to fetch changes up to 0659e44ce739ecd856164c75a5325b7959a2921d:

  io_uring/io-wq: apply the current cpuset to new workers (2026-11-18 09:06:05 -0700)

----------------------------------------------------------------
io_uring-7.4-20261119

----------------------------------------------------------------
Cheng Yongkang (2):
      io_uring/timeout: don't rearm a multishot timeout on cancel
      io_uring/rsrc: keep the old file when a file update fails

Jens Axboe (2):
      io_uring: don't run canceled local work from a foreign mm on release
      io_uring/io-wq: show stuck workers rather than WARN on a slow exit

Mikhail Malyshev (1):
      io_uring/io-wq: apply the current cpuset to new workers

Siddharth Chintamaneni (1):
      io_uring/kbuf: initialize arg->out_len from arg->max_len in io_buffers_select()

Yang Xiuwei (3):
      io_uring: fail soft links on negative IOU_COMPLETE results
      io_uring/futex: fail soft links when cancelling a wait
      io_uring/rw: fail soft links on IOPOLL short or error IO

 io_uring/futex.c    |  1 +
 io_uring/io-wq.c    | 68 +++++++++++++++++++++++++++++++++++++++------
 io_uring/io_uring.c | 12 ++++++--
 io_uring/kbuf.c     |  1 +
 io_uring/rsrc.c     |  6 ++--
 io_uring/rw.c       |  4 ++-
 io_uring/timeout.c  |  3 +-
 io_uring/tw.c       |  7 +++--
 io_uring/tw.h       | 11 ++++++++
 9 files changed, 95 insertions(+), 18 deletions(-)

-- 
Jens Axboe

