Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47655306B1B
	for <io-uring@vger.kernel.org>; Sun, 30 Aug 2026 19:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788116854; cv=none; b=jTgnFar4gwP2mtRkA1G/nwWMWo7kYo6psemR68u7cCRzB8G2OeDFeZkOnk9pU50tfKYENH5dKLeaNj+IZCJ4BAPpKxQ14HvNo1B6KPtmvpVZW9h3PoqCzvOaK/FVSHHXMkNoKdZ+Ld84XgOM3jC4S7AsVrTxMR3+G1XF5pB2LMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788116854; c=relaxed/simple;
	bh=UAP+WV+IFofygBiyPmq+Bb+SASH5CvpOwDr59qLwPik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T+GHZIQo4uX9U1culaEhTkWrbvT931/qO9P47zden241ooWW7JRrOIofHI9+2uf1+JTf7O6cRZalliocPeNYW0QCoUPUVPLOD9isDUNJeJ7yjk2aueSsPZZgZGzQ4VL/b54AB/B52TUzTCWj7ofysmAcIJq7ujK7qNWQrRaQkOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDP8lHzo; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDP8lHzo"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3964e480f76so3389565a91.1
        for <io-uring@vger.kernel.org>; Sun, 30 Aug 2026 12:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788116849; x=1788721649; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ix3X1jKRamQQtcZbUM8iTm49g5yElaf+reQBINXWBgc=;
        b=QDP8lHzoUTIQYWDbFwXq/mtNx+3CfVbojWs1J0erttn6GOOn/jja4SEvKtt9ljdpl+
         xmIyTLboE23PA/LiYL+gjm0okYj7418vxIYsNEkMYpog4IzFMFIhlV7XNJiQyGOqD2p1
         nITzF4AiT6B6lgEmWpINjcGlYErIYO36RPGFXMLAPYfrnviqe2jCvjdjhAKDBCsPk0hd
         hpHwmqZ0tCivYEm8bTlWzWFCC82o2/iaAZZLER/kEfN8BBalZ3PBUtO63Wp7gTQ+EZhD
         mqnvrMJfnGG0/U86HEpoPMgNYfw3ZOyGBILEI1i0+csfpOdNyw5Pa6/4vIhakR1BBUEu
         m8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788116849; x=1788721649;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ix3X1jKRamQQtcZbUM8iTm49g5yElaf+reQBINXWBgc=;
        b=RxHskT+XcEebiEUgRqTgoyFW95KSe+KKgzz410FwWQw7550Ddl1OL2thZtWBhchPYF
         Bgb0de2FVlqAhP4S+KQKodO2AyRhsZXGB2Q/S+vYv0O6kFfq03f737WtDEzsOuAG8bu4
         I3o5XD6439bvcxS3a8BkKcUKV+dsJis7I2t1YVIyZhbh0LIsiV4xbgZukxtJXZhYkBmK
         T4m8UUy0UoAQaGAzi8Tmupy4gW24ZlLDRSN1AG+TgW+lf3CgZ5ppJLDgZNrDVoHJsdyG
         LdYgYlm92+YQx1q75/6/2PT+OwNDzEUO0n6eyNBABv/NZhlIwNwdh4n6ZPivIe6mKVZp
         QgmQ==
X-Gm-Message-State: AFuF++k8XM/bh6eSbcklvdfaQuMuf/ttHiw3+8KpJ4eUykka9p5zpCgh
	CyEWQM6q+Gwx+do3DM0+EOT17pO32mU9+Z4Bn3qI2Cq4wrcDos/hceMw
X-Gm-Gg: AYBFou1yyGvZGTiBWe6rPgKdSCtkrb0+3Hng3sgmw9VFu9TPGrADHhddaIos9LwoF28
	JeBiOtZqynQHj8UXaojmZrvjnHND/xtAotzyo5WpNFDSOizBapxyBsR/Q7iyEp6WNTudqG0WtEd
	EE/SiSOqF0o0kMkAiPIKGQOQWYk5d69+OiLlPA06B9CyFVBq3jGh8RlC4aHf2yRVC2KkiH5b8R3
	Y4DZp3uZevv0pFahpBtSp/n1BShRGaLktuRJ3+5OVejnM6L3TnIyGvu0dBDBynZIulgeuWR/end
	+ki0E8l6R0L++il0kaoXj0+hebaZ4iUy8RPCl/+xCMQOxmktQYHPXF9n/lRXeaCk3jkD6CWt7H4
	9jV3J1a6PEBLzgirpG6oZuxQH9EBfU6ExFALnFqm8OZkYdpY3akwlGdsUyeMqzWJagjDPii4ydO
	W1QoOw3Q6or9l3UROt8mzKmhIxPJNRSJ2IqmsNa1GMEoolkpVKwbA9f0xmx0a23TkCw6sZtIVXn
	pz7mWCJ
X-Received: by 2002:a17:90b:2b90:b0:38a:c3f:3b87 with SMTP id 98e67ed59e1d1-396d0fce294mr36544130a91.12.1788116848637;
        Sun, 30 Aug 2026 12:07:28 -0700 (PDT)
Received: from kernel-vm.. ([117.28.251.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b1ac3cbbsm17111627a91.17.2026.08.30.12.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 12:07:28 -0700 (PDT)
From: Chengfeng Lin <lin2530632123@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH for-next] io_uring/futex: use GFP_KERNEL_ACCOUNT for futex data allocation
Date: Sun, 30 Aug 2026 19:07:15 +0000
Message-ID: <20260830190717.1509012-1-lin2530632123@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <d8fd1498-fe73-4f48-9213-6b18ec698a3d@kernel.dk>
References: <d8fd1498-fe73-4f48-9213-6b18ec698a3d@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jens,

I tested 6e0d71c288fd against its direct parent on bare metal. In a narrow
io_uring futex WAITV -> WAKE workload, the child was 8.09% slower. A
separate 424-line standalone reproducer showed a 6.49% slowdown. A matched
scalar WAIT -> WAKE control changed by -0.55%. All compared kernels actually
ran with preempt=full.

The test system was a Core i7-12700KF with 32 GiB RAM. The workload was pinned
to P-core CPU 2, with the governor and EPP set to performance, Turbo disabled,
and GCC 15.2.0.

#regzbot introduced: 6e0d71c288fdcf5866f5d0c6cde850a091cc3c55
#regzbot title: io_uring futex WAITV accounted-allocation slowdown

This is a focused synthetic microbenchmark, not an application benchmark. It
uses one raw-UAPI ring and eight independent wait vectors. Each vector has
eight cacheline-separated private futex words. A timed cycle submits eight
IORING_OP_FUTEX_WAITV requests, wakes element 3 in every vector, and validates
all 16 CQEs. An untimed wake then verifies that the seven remaining waiters in
each vector were removed.

I used a fresh boot for each point:

  816095894c0f parent A -> 6e0d71c288fd child -> 816095894c0f parent B

Each point had 3 warm-up rounds and 15 measured rounds. Every measured round
ran 512 cycles, or 4,096 WAITV/wake pairs. Results in ns/pair were:

  implementation   parent A     child   parent B   child vs midpoint
  formal             1045.687  1128.704   1042.755        +8.091%
  standalone         1040.270  1110.916   1046.198        +6.488%

The formal drop-first result was +8.080%, parent drift was -0.280%, and the
maximum CV was 0.151%. The standalone drop-first result was +6.511%, with
+0.570% parent drift. All 90 WAITV timing rows passed the CQE, returned-value,
overflow, residual-waiter, and CPU checks. Untimed child traces also hit
io_futexv_prep(), io_futexv_wait(), io_futexv_complete(), and the wake path
with the expected request counts.

The exact source change is only GFP_KERNEL -> GFP_KERNEL_ACCOUNT for the
per-WAITV data allocation. I understand the memcg-accounting purpose and am
not suggesting a revert.

As a separate current-baseline diagnostic, I compared unmodified v7.2 against
a direct child changing only this allocation back to GFP_KERNEL. The
no-account child was 8.12% and 9.00% faster in the formal and standalone WAITV
tests, while the scalar control changed by +0.09%. These values use a different
baseline and are not combined with the direct-parent results above.

Is this per-WAITV cost an expected accounting trade-off, or could the same
memcg accounting be retained with lower per-request overhead?

Evidence bundle:

  https://github.com/lcf0399/linux-regression-evidence/tree/25ed417f566fc83b942e1787a0b53d555ccec291/io-uring-futex-waitv-accounted-allocation

Standalone reproducer:

  https://github.com/lcf0399/linux-regression-evidence/tree/25ed417f566fc83b942e1787a0b53d555ccec291/io-uring-futex-waitv-accounted-allocation/reproducer

Thanks,
Chengfeng
