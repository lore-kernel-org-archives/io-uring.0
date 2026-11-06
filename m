Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981122;
	b=Ivy178I0jY3r04v0787OAeIRQ/X6/uc8Eaf9FxMlZGMseSx2Wj6ORUkME/9SEsf6slHG
	 ZdHNrDMSHj3qsWd7VLofFxWig9dViAnol5FY8HBoFRS8ZjKZhqceOwnC+baU1R/wiKYA2
	 R07Zs2YwFcx55Jg4NardVYhno0MPtllpHACRZX41JJyYs8yyo5CnfEyH2FfrOliIp27lP
	 f4XZNM8kCnGmlZz+vJMivTmkboa7qrcdQJJ1MJFiQyWVDtmsR43s2gedWJ5UkJb/I5nIB
	 OhC0x2XMecFPKNvFIf9U5JhVj+TYg4n59z6BMr5e8wAix/9pE8DH3k4Mr4xsyIA+gnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Content-Language:To:Cc:From:Subject:
	 Content-Type:Content-Transfer-Encoding;
	bh=Yh1P7typjwfvNkmCJPQQU4gLuzaVgd4vyadmBDFWeCs=;
	b=T1YCwRL3c6eTUou2sTOcpfvCNmlbK6vo8UUWuzks5biJTA6PF79K0HDKHATMjH5VtBs1
	 K8dayWVISwNInbiuKMUhb9T/RhdzLTpa9JLyVBNFOB9bDcFZxPbEVkIpzQb5fnXteKGz4
	 rNeqNd1n3oWhM3efpNh18gSF9L5Qx3sd+GgMiASUY1v6N4IP5vp7pDWv+9aptm4XNTJon
	 IcB2H2j0X7rTxJxyCBNbokuAdLrI4zRotMQXX34QABRGOOyyvYkaxkHOL98vlRSaKUAOM
	 atMYV49b552OMX6I0tcxWeZZiZmcqgbbJKdqB4qDg4EXpW03Etn0PlPlojMxY4qu13A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fHY2ezz5;
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E41606A326
	for <io-uring@vger.kernel.org>; Fri,  6 Nov 2026 16:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19E41606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fHY2ezz5
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-5642e0910a3so280501b6e.0
        for <io-uring@vger.kernel.org>; Fri, 06 Nov 2026 08:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793981120; x=1794585920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Yh1P7typjwfvNkmCJPQQU4gLuzaVgd4vyadmBDFWeCs=;
        b=fHY2ezz5x0Xv9nGN0dYOs/GppeZ/feF5kWk/+Eo8NLtX3lxLAR98raticoSQZLcd7v
         CzjGoXjM7i4PBdccsDVc3dVY6f+p6l7g+dfyM/ILcNUpqrl+GMMf6A67s2/K3DsEtuO1
         XzirZTC4U4GxeQfVmTEMQeqw7ZEXEJa40reBrCDejyTabWv0SvzkzlgnSbdGf44s4s+r
         bXTk1y1W0f1ILmPzATheO57Ix8jRbUjmFrAduK8/tiT1RrYScvdM9tFagZ+K0IHO6ho1
         E/kzA3HPCyxoHUcnyEfIjOy81cTVX6Qn34oY97zzcBre5VvGBZ9BP6o1p06VwkRTdGjA
         fslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793981120; x=1794585920;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yh1P7typjwfvNkmCJPQQU4gLuzaVgd4vyadmBDFWeCs=;
        b=TdGt1fSnMD+zvGeowzcOnUAAjxbinkQ0m/KR48ZFq+fX+JcNn3LBbQCMwA+9yBECqy
         tCXCoRoFx28n1w/uPE7poNPLEGhcfG97iSyr3KgbaGI1CVtmivV+0B5d0Ku0OsA0f6zf
         Y14Ccr/3YO2oL74n9mSfae2mr1NcZtrjEnX6oLij6numUQEp/E2Jl9RrZY7KqsFUgR6W
         q6dZiCS08/BWbxvHyyZxeoGdwBpjnDX/+sjUwU2nw17/dUQpRmUet5/EojMlpHBWAlD3
         1R1xFp+EuICcLJukOry+0e3EslKiTPCUuCraAlv/AzVUaBN6eFvfEl8Uuxs4z9yUCkAM
         aJhg==
X-Gm-Message-State: APuU4Z99IaoMM8y99fouoQql+eNpoQvp9fUbWhPg/P6nOk9xAoiz6w3o
	RjW9KDoTN8xXY9/2KYFZ2qolaeMs7gXOYUAQKrDeyLOFsMiAW+Oe5R2S1GY2IDC1pINNUSlBDyV
	arJB5nYU=
X-Gm-Gg: AYBFou2/QzRU6cJTb/P2ZPhwpYHTaS3qhV6EynqIoJR4aiCj/HNjtVM7GLIX8+2nT8V
	/UMcG0AQ7S/BIVX7GBQREG2/S5KUExf2zRG2gII/LbbopIvZZp9lfVg3x06LSKz6ratntSyTnwx
	AAb/Br2vXQdD0DobJeAxqwqmfTAO+BH+ENcJbX7pbt25pc0GQfzQRm6gc2f+LxyHoQEdDZ3UsEI
	SQ7eMOiT9woxmEgPhtM813O/ljBtSAvYCVpXh4hpR3+wqmRzmtRqKxwnOTm18+LmSGACMLR9orL
	oqUJYAw+69Ss+GkdYyDS9PrapHm7fNkpkaYuesWT/6899DGiGIa79iXCEaLHUZkDjKRn3pEJhjV
	w11fNpanfXfUYbB2eCxtsHR1c8idqhvx+7sIK8sgr4tZYUGuUna7Wol59hT4LjTPXh+WPmiN4Rr
	lO/JVo9AiMQZV4GaH0zgCUL+5MItduql5v/xgZjq1awy2YImqtJd6fwFvYRUaWmQgdzYtiMtVKR
	Vwc5y0nG+7itWe5EwOfRgCSgJYG1/9wD6m/x+TOoLdyUJiq1+NdqmBB5mhZ6hVACvkDzs9K0Qt2
	PtAZ0yc8jwD2CiB8/X2D389cuUbglCsbEz2AC/52ABfIAAkHfs0Sc1TU/q6CMg/asRXRJ83Moe3
	3CawoBFYZrANQ90pZ7uur/+dR6msGnA==
X-Received: by 2002:a05:6808:11c6:b0:53b:6f4e:5176 with SMTP id 5614622812f47-567e14af7d8mr2034170b6e.66.1793981119801;
        Fri, 06 Nov 2026 08:05:19 -0800 (PST)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567e7e5f6e2sm1764628b6e.11.2026.11.06.08.05.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 08:05:18 -0800 (PST)
Message-ID: <b57ad47d-6610-4488-8d16-84aaec530888@kernel.dk>
Date: Fri, 6 Nov 2026 09:05:17 -0700
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
Subject: [GIT PULL] io_uring fixes for 7.4-rc2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Linus,

io_uring fixes for this week. This pull request contains:

- Only wait for in-flight requests on ring release if the closing task
  actually uses the ring.

- SQPOLL fixes: do the return-to-userspace work in the SQPOLL thread,
  as memory.high reclaim and blkcg throttling otherwise only ran at
  thread exit, and don't set the stop bit on thread exit, which
  tripped a WARN_ON_ONCE() in the ring teardown.

- Don't poll a writer for a read side hangup or for urgent data, as a
  half-closed peer or unread OOB data kept the async poll of a send
  ready on every re-arm.

- Cancel all matching poll requests in one pass for CANCEL_ALL rather
  than restarting the hash walk per request.

- Hold uring_lock across the put_user() for the index-alloc file
  install.

- Don't arm an hrtimer and schedule for a wait whose timeout has
  already expired.

- Add a feature flag for the dma-buf registered buffer support.

- selftests 32-bit cast fix

Please pull!


The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux tags/io_uring-7.4-20261106

for you to fetch changes up to cf6542493e35ab9e72ac07da10a178ac78db5a16:

  io_uring: only wait for in-flight requests if the closing task uses the ring (2026-11-04 10:25:14 -0700)

----------------------------------------------------------------
io_uring-7.4-20261106

----------------------------------------------------------------
Ioannis Coward (1):
      io_uring/wait: don't sleep on an already expired timeout

Jens Axboe (2):
      io_uring/poll: don't poll a writer for a read side hangup
      io_uring/poll: don't poll a writer for urgent data

Orkun Emin Sar? (1):
      io_uring: only wait for in-flight requests if the closing task uses the ring

Pavel Begunkov (1):
      io_uring: add feature flag for dma-buf support

Sasha Levin (1):
      selftests/io_uring: cast optval through uintptr_t in mini_liburing.h

Shakeel Butt (1):
      io_uring/sqpoll: do the return-to-userspace work in the SQPOLL thread

Shang En Sim (2):
      io_uring/cancel: count all requests that a CANCEL_ALL cancels
      io_uring/poll: cancel all matching requests in one pass

Shuai Liu (1):
      io_uring/sqpoll: don't set IO_SQ_THREAD_SHOULD_STOP on thread exit

Yuansheng Yang (1):
      io_uring/rsrc: hold uring_lock across index-alloc put_user

 include/uapi/linux/io_uring.h          |  1 +
 io_uring/cancel.c                      |  3 +-
 io_uring/io_uring.c                    |  5 ++-
 io_uring/io_uring.h                    |  3 +-
 io_uring/poll.c                        | 62 +++++++++++++++++++++++---
 io_uring/rsrc.c                        | 21 ++++++---
 io_uring/sqpoll.c                      | 21 +++++++--
 io_uring/wait.c                        |  8 ++++
 tools/include/io_uring/mini_liburing.h |  3 +-
 9 files changed, 108 insertions(+), 19 deletions(-)

-- 
Jens Axboe

