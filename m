Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1649E38236C
	for <io-uring@vger.kernel.org>; Thu, 30 Jul 2026 10:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785408171; cv=pass; b=iwExXXbQaVMEpYYGBCdFhod5BVOsxsatOQABUXdJ3kVISr7mR1unm6We6gWa/07HzMLl/HiXqKQRfmbkJZeKwLNinpIYVU0my2G5xMMYnJyDRXlzypepVkwH5zNravXQvOxnZti7DOv2V+vq4PB2tXvMw0u2tWqNif8PGZjTvm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785408171; c=relaxed/simple;
	bh=W9y/o0fz9vmCM2PHGdXrf11+hHaWhgOC+/4OWUzaCds=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ujLIroJoRHSr4rMpxCHs6NNqF9c/OaLTho2qeLOV97b48N47CMhANc2nQACmIm6skxNVGp7F81ZplWuGATmJ8Y5zlhbU9LbtOQnH+40nGBYLpETCgLtNOftCl1rSwdWHeXJg8ZsTdBlSp+7cTr/5dUR7/Q23HxYc4JyJXp8gVv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=McbHDMDT; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="McbHDMDT"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39c74722e27so7496861fa.0
        for <io-uring@vger.kernel.org>; Thu, 30 Jul 2026 03:42:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785408168; cv=none;
        d=google.com; s=arc-20260327;
        b=MWVQDqMl9c5oZiDmtg2BD0g6/rPPH/36f/EsNdq9psEWIZxvDINSvRoJfJHdibI1Sz
         dxFdquES/7TEfu9xwjZRYL/JK8kK07v8c5LFlWquo5k1OF6y9vCF5CTq9kaC0oTjIHmY
         UndCeZP0Xckx0CFoEB+4MPU2ahuxCgdNfVYMe1p1GpKRINvM5c3U0Tr6N8OojSm8bKjZ
         Av6C4K636aYM9a9Dz/Hei+oNkGFzPkPI/HIyE49YtLlotwhG/MmS/Fr2gu5W6og0x1W+
         wyZooqPYlSBoy89JLiox+v9EGqxExiW7yK5/AiwxtioLezSBpuFjZu5NDCBIX1pwee2H
         SwAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=DvRPL0xNHt2yUHxmPNQXYSIsNFvCGztbkFOk+1WnSSU=;
        fh=/1dZmVjN/52ytWU9CeN3f7G1pDGoHvKMQnp499OIxpQ=;
        b=PEmdKP+xSv/R9HkrBe7mtwUavDBKmW39mE5fcPOk3noxN6yoj1ytq8Hs/tC1INA0Sk
         Af3FTKsVihqSfsxbUo8yap8FJAAKm3tdDHVbDjgj9WVjMOyrc0DRasq/bYl5TS15ug/Q
         FsboROwDpPmm9yh7x+cOjZF4ret0dU6Q0RcUmgeIcVp0EAmNg+A6iU8lwF63L4hx762w
         E3g7T3AQf9yfDviNuv4sfh7AI03po9JLpOiUhTCfyA9uW1KYYLQvxbe4RvX9ZXcAm5Cp
         xg9rTpxdefS7B734M63FuZgYvE6KtlzFXIoP8tQKxXEfcpTByaHcIm7YgmZShxJLKfxe
         gwdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785408168; x=1786012968; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DvRPL0xNHt2yUHxmPNQXYSIsNFvCGztbkFOk+1WnSSU=;
        b=McbHDMDTb8uhjBUHqKfRFZd1frVsppieQjuX6leZspoO6sLotgsuP83f7XxvDzCL/X
         HTzXp22tNPcIsTI3DZYepcbkgWqwQWruWZ3ZHy2GmTTuomNmhWQ5S/Q9JFhr3iXMLBMQ
         zT7LJyc6NB1E92mhoJ+IRNFDeMBeh70K74nmdL6/we9i3qy8t0GHkRMULfGXNN5SMupb
         Spi6zupJ6lsgywV9iCbNcuk6iSz5JzDuVily4Sir4GsnHCD0/5GC+PrRxPPENVFkuEqG
         M0U8Zeb+ae+YboHFYjzgdMapNF6k/xa4oWs7UkbjQoQV17qeL5Jf3tL8o+XM2ChW74il
         QitA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785408168; x=1786012968;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DvRPL0xNHt2yUHxmPNQXYSIsNFvCGztbkFOk+1WnSSU=;
        b=dmAjO4vhwD6WiKr2Hpkp+DVWOVlbtT03iqFbBJWmDIwM1GQR/gyX/wPRYQ4vfU1a10
         ppcKgHnaYtQQ0MQfrGdSnBIjN/V2vSGy1o66iO1ZeM9JoFzrk3K1ATk908NAJ+PUhX8V
         bw0m7aI7o8OwjsRQA61WQR1X1rw+eECauOfhKmQoZKl9XMU9fPh0+0XFokzwrFT/6TPd
         r8mRVoPoUaZD4BUg+JxVEiGkEXhMNTrl6BzCqbp8lyWTzlX/9OWWQni1jqV1LDocMoUd
         aTmJNJAsIIDjqy17Uv7t1TrrE6vou9ZtjxBJhcEYefeuoq1d5BW/80on9G/rVb7B1PDx
         a5rw==
X-Forwarded-Encrypted: i=1; AHgh+RqrUmXkBw1SMiJFrkHo5RCLMoH/F7cgNjX2xiS/xiQhiOiaedRdW0F8aPw3wUTG164cXHStqZ1Bjw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5yHHb66JVwlGn2dnHcFTsk6mTTnMMqcshzTavW4zwWUDKmQQL
	DSg0qTNAUQmoHvrIScV8MHAZ7W6GSLO4+OOLPnG6O2tTUItGHowIzH3YWT8a1OqEu1oH4uz63Ge
	vQTPewsaoJtWzYP444wd7FTMlgfRSYa0=
X-Gm-Gg: AR+sD11W7jdUVMLKj6fCb1Aj06zU5uPLFk0R5pqmX5cas+sSWpevzE13O/oH6d24gxU
	7xYwzY8FrTwCcGAcqx8UDaMq4sI2MblKdBQqqT9GEIBBIf3EVm6s4SPlEYb2mzBwvBkVnSu2sn8
	qJrcqSZmS4Bi97p6K1DvVyUJybi9rHdpPi4CoJnCPMPs44YA6eP66rFb3ntfiLev7RlDOIGdDet
	keP9uCnGdDUZWORVtSz7v6hsgaX8H2uilDMR87i7h/MWd8wWQSh1WGIW2PO4PIsLPetl57FuUHx
	UO/JNC0ozveOfpK8hh9nm0gbGZeXZlZdHT2SLPY5lso=
X-Received: by 2002:a05:651c:502:b0:39a:fef1:ad7 with SMTP id
 38308e7fff4ca-39f706705camr3487351fa.21.1785408167726; Thu, 30 Jul 2026
 03:42:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Chengfeng Lin <lin2530632123@gmail.com>
Date: Thu, 30 Jul 2026 18:42:34 +0800
X-Gm-Features: AUfX_my2Ux3mXHCSLI9OEzNcBpvgABF6k1WnDjHJmIPPMenxP_myxBhVJEyBI4g
Message-ID: <CANGjgdn=R_qyUdE=j9za+vkmqcxacbP-84OHXF4nZ4ho9qRyVg@mail.gmail.com>
Subject: [REGRESSION] io_uring/futex: scalar wait/wake slowdown after 079afb081c42
To: Jens Axboe <axboe@kernel.dk>
Cc: Pavel Begunkov <asml.silence@gmail.com>, Robert Morris <rtm@csail.mit.edu>, io-uring@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Jens,

I tested 079afb081c42 against its direct parent on bare metal. In a narrow
scalar io_uring futex wait/wake workload, the child was 9.27% slower. A
separate 338-line standalone reproduced the result at 10.02%. All compared
kernels actually ran with preempt=full.

#regzbot introduced: 079afb081c4288e94d5e4223d3eb6306d853c68b
#regzbot title: io_uring scalar futex wait/wake slowdown

This is a focused synthetic microbenchmark, not an application benchmark. It
uses one raw-UAPI ring and 32 cacheline-separated private futex words on one
pinned P-core. Each timed cycle submits 32 scalar IORING_OP_FUTEX_WAIT
requests, then 32 scalar IORING_OP_FUTEX_WAKE requests, and drains exactly 64
CQEs. Every wait must return 0 and every wake must return 1.

I used a fresh boot for each point:

  6a8118a77eec parent A -> 079afb081c42 child -> 6a8118a77eec parent B

Each point had 3 warm-up rounds and 15 measured rounds. Every measured round
ran 512 cycles, or 16,384 wait/wake pairs. The results in ns/pair were:

  implementation   parent A    child    parent B    child vs midpoint
  formal              180.079  196.647     179.856        +9.268%
  standalone          180.171  197.856     179.502       +10.020%

For the formal source, dropping the first measured round gave +9.269%. Parent
drift was -0.124%, and the maximum CV was 0.169%. The standalone drop-first
result was +9.996%, with -0.371% parent drift. All 90 scalar timing rows
passed the CQE, result, timeout, overflow, outstanding-request, and CPU
checks.

An untimed child trace also hit io_futex_prep(), io_futex_wait(),
io_futex_wake(), and io_futex_complete() with the expected request counts.

A matched WAITV -> WAKE profile changed by only +1.385%, below my preregistered
5% signal gate, so my claim is limited to scalar wait/wake.

I understand that 079afb fixes the exit-time use-after-free by keeping pending
private futex waits visible to cancellation before their mm state disappears.
Scalar WAIT and WAKE both use io_futex_prep(), so in the child both sides of
each measured pair execute the added tracking call. I am not suggesting a
revert.

Is this per-request cost an expected trade-off for the lifetime fix, or could
the same exit/mm-lifetime guarantee be retained with cheaper tracking?

Evidence bundle:

  https://github.com/lcf0399/linux-regression-evidence/tree/65c8cbf86f40cbe759e3f7db1d29d152ba03a8f2/io-uring-futex-inflight-wait-wake

Standalone reproducer:

  https://github.com/lcf0399/linux-regression-evidence/tree/65c8cbf86f40cbe759e3f7db1d29d152ba03a8f2/io-uring-futex-inflight-wait-wake/reproducer

Thanks,
Chengfeng
