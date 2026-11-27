Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795814405;
	b=lVyZUSBLLF6SA73l/daNtiQKkEzWQk8aRHiSgcTN8HVirX8GoEbsGXqRU7f/SwXh0faw
	 GG0U67GSOjWnV9tGzmjddywW1weda4BPz7B1vcF3IysJsDCb1FuJ3cfGJLfFpiZQuZmP3
	 A4mo3UD+ndLTcEiQXR41yO+/cwjcNYntTsbRajOpcNE8jVCi1cI91K2Cg/LWky8yyJCb+
	 cfN0WdDMAvbHnFJyDOclKnawbqFh5l+XyflPvRjI+vnuwWYxewq7RGZuI4ilpKU+iyLvO
	 bbq8guO7EpV7crcDNudMtOuG0sSnjTxUAt8Uxlp0uRzrXqZFUV73l/7XMxy35Bjs58Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795814405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=1L+JG2vdUpgp0JPqj2FHTVN4G8BfYs3SYaKUQy5dZWM=;
	b=M9xbF0Z5pP/1GlhyL8RHpKWSv9127NKpRV+NaEpQUvJ8/96L3Z2BYLUS4fTJZgxuyeHP
	 oyEMsSvSEOD47axbLrWI9GtaQdCy6xZ7UUgjssizZJbiZYqmafYYRsZmjueoGWQx2yfCx
	 8GP8LPWTdJxWJKwYkLMTyMkfMmJtqihHtuZXq2yAOgrItHaxbolgtKMU2EzXiOurLJRza
	 uo5DnVGT2qdf0JH9MeOp4EBJ249tprowMd6SNb31N+yPrspjoBG8PmYaz7WRGeZtGpNtR
	 6ccuR5je5Fs5By3PymV7UK6GBM2qIpiHpzJFC36menHmm1lwjLcYnSucBQUwYK0ZMkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0hY7ceyl;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA159606A31C
	for <io-uring@vger.kernel.org>; Fri, 27 Nov 2026 21:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA159606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0hY7ceyl
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-38692f62b22so11700647eec.0
        for <io-uring@vger.kernel.org>; Fri, 27 Nov 2026 13:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795814404; x=1796419204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1L+JG2vdUpgp0JPqj2FHTVN4G8BfYs3SYaKUQy5dZWM=;
        b=0hY7ceyl1k+6gG5NoRMuyJa5XY8JIWyC5XzIlibVt/9sSjFx1iaDnif1zvh+LEp2cl
         XqYhrW6hs3xMl9UG4ezqJAqkJnsGDjvrBKBKG9KGKDbwlnha8AN4UVCOS5bM2essWJGV
         YLFV3QG1oDq7qU/gOILaWeywAg+Q3oODeK6xatjJVpHGvmr2XBo/cZJZbBEPB98dcmov
         UXicMtWrhFeRfURwU2+zaAp5dRw3PwK/8aGA4a81E9SgtpbvOglFFgH8cik55w+K6ULw
         kEdYakIK2mIcbbN16BRqFFyczoC65wAjRh7gd9orDPp8fFoULPj3xEr66juGaUd594gb
         tQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795814404; x=1796419204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1L+JG2vdUpgp0JPqj2FHTVN4G8BfYs3SYaKUQy5dZWM=;
        b=SRiA/LFWNJgx4nzSa5m+PuGZVhJqwM+VA6zwLqrFc/Qq5qyWT80DEhq8SaJTTcx7eK
         iYskFglNkRiL1ZOSdRK5hRX0MBLrhPhQtZQLnC7HByf6k8pvv5XKJen62VsljOZG0I4g
         2xKOGVnbj59LfWk1ceYCyGTe1JH/FusKV8ojl+2GfarcstjtxTOtuJgmBXWdfYVMGWQC
         4o3mfizfJeM6xFWCISeMyhaRyulMOHMoem99LrDymwOncZzQGMrBBEL9byLhCniH/dt8
         6vp19Zkf7twPUvQR863mK/qI0lMOvZuZ47PaZ0VFn94KkLw4XLoS4wp5fKdF4RHEltIb
         pGxw==
X-Gm-Message-State: APuU4Z9dax4CEfRMOhmsDcq8r3degjAWXjliTujN/LH3QjgvTiT0/KNT
	6UPYBL4wv7Zk6u4vh1CKULV2SEOOPgXQBfNkHh3WUHn7TPAEO+mXlW3X
X-Gm-Gg: AZFdTZekdUTikdQC2jrCYVllIip78f41A9cpUG5pKvidfIdff3dOxfQnlVojSh04XwA
	RV7BtuSmafuCBjIQFl/z8Ea6io8WTKKc36Xglli4owZ8DYt9sXbpCRGYm+lR5SaofM4R7XXPV9g
	xpKaCrToa1ssMZ+o6vOSEsxrj8P+Vp/+hODqRskl1imy6t5X8HXuNvMAW6kGAV+1H00O2PUDtDG
	IBLkMmVhNa05T2JXQVumq05MvesOXo8ZuUOwA+J17tWMJzgtvPyEWNkI2M/oYsvuosaxJ0uIQvJ
	gAY8sOa+qZXUXsI2Q76Ht9xUHUegolGMfdgKeInj+ImQJ8BBmP5QRWYUEfQ10NawIL1aAwNjejM
	gENA/NOhVChAav4dMjKfr0NiIzrFoJJ7htO+6C8YNztULq/J6HN3tKJZ8rDiyjuu8UwePuItko1
	2ViFnK3UD/f3aTEjsG9X0Lyo3YqQWO+HtcrDl7JhFjhTiwyra1ZVdBCby9Pgu64aMxeFF/R095n
	bCWxjA5vBjw3d1QMcw0azsNk4409ZKjiEv7UkJ2dR9xxOvrTcoKU13WDalulBpwIlsi4p3LVhiG
	D6Yx4VZ1vgxponOqGv/1uMwHrEEvIbrb7PNQ/aobLNMRC6GqZkimfRdHPyyb1kSUbiSou3Da53U
	3WF58zNHqs+u0mSw5dERC9BdtiettwsI63YX9xt6KTgwX7QR8tgxXW8P7R1LlX3kcj/wru8vhr7
	nDfUgXut6rA8QTXJt4vIHoJt+j8nExAyKF2oFQbX52Ue6DQhZwUmtDsAYhpfPKfzJg7EM+0BdC8
	/GM7ob9BxXQ2kG2rzdGnExXZG+BTi/CQHmol+b6DHKKwyUSnIEZC372RZtJJ7ZGZrgs4B2he6h/
	QJB0NLgdEuFXowaevw==
X-Received: by 2002:a05:7300:1899:b0:386:b6e2:9fa1 with SMTP id 5a478bee46e88-386b6e2a02fmr22240514eec.34.1795814403841;
        Fri, 27 Nov 2026 13:20:03 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:5390:dae0:7063:f08:2b4a:6d9a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm73804236eec.15.2026.11.27.13.20.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 13:20:03 -0800 (PST)
From: Artem Andreenko <miolini@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Pavel Begunkov <asml.silence@gmail.com>
Cc: io-uring@vger.kernel.org,
	Artem Andreenko <miolini@gmail.com>,
	linux-api@vger.kernel.org
Subject: [RFC PATCH 0/2] io_uring: add CLOCK_TAI support for waits and timeouts
Date: Fri, 27 Nov 2026 13:20:02 -0800
Message-ID: <20261127212001.18516-4-miolini@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2163; i=miolini@gmail.com; h=from:subject; bh=XKWCeqAmuD+zCiWGJnq/gtjNw3U99tOn+x2J75zIfjE=; b=owJ4nJvAy8zAJebzwOiZnvnNTMbTakkM2ZxfGNXVi4wfvVZxqv/GkLte9MbxT18WyjwX7p5d+ e/BhfPHPG53TGBhEONisBRTZGlsnb9W//5n75gSN1uYOaxMIEOkRRoYgICFgS83Ma/USMdIz1Tb UM/QSMdAx5iBi1MAprpWmOHHcv28Vt2527eezrAtuq144dSfnl3st80/s3+tu7pnb95FRoYzzGf 8C/QiTT7YRyp+nnH0VmWknmPQQ5nb7l/NdaqeHuMCAAY1UgM=
X-Developer-Key: i=miolini@gmail.com; a=openpgp; fpr=81859FAD2FDFF34B5C74463D4CE032E62E37D969
Content-Transfer-Encoding: 8bit

This series adds CLOCK_TAI support to io_uring for both
IORING_REGISTER_CLOCK (ring wait timers) and IORING_OP_TIMEOUT /
IORING_OP_LINK_TIMEOUT (via IORING_TIMEOUT_TAI).

5G NR gNodeB DU/CU radio-slot loops, O-RAN 7.2x fronthaul, and TSN
workloads anchor periodic activations and TX deadlines to PTP-steered
CLOCK_TAI (matching SO_TXTIME, sch_etf, and bpf_ktime_get_tai_ns()).
Adding CLOCK_TAI directly to io_uring avoids per-slot userspace clock
conversion or separate timerfd(CLOCK_TAI) syscalls.

Patch 1/2 removes the redundant ctx->clock_offset field (deriving the
timekeeper offset from ctx->clockid) and snapshots iowq.clockid once per
io_cqring_wait() cycle, fixing a pre-existing data race between
IORING_REGISTER_CLOCK and lockless waiters (which becomes severe once
CLOCK_TAI and CLOCK_MONOTONIC differ by ~56 years).

Patch 2/2 enables CLOCK_TAI in IORING_REGISTER_CLOCK and adds
IORING_TIMEOUT_TAI (bit 8) to IORING_TIMEOUT_CLOCK_MASK.

Tool-assisted content note (per Documentation/process/generated-content.rst):
An AI coding assistant (Google Antigravity / Gemini) assisted with source
analysis, drafting the patches/changelogs, and writing the standalone
arm64 QEMU test harness. Both patches were built with W=1 and runtime-tested
on arm64 QEMU with PROVE_LOCKING, DEBUG_ATOMIC_SLEEP, and a 37-second
ADJ_TAI offset.

Open question for RFC feedback:
Should IORING_REGISTER_CLOCK(CLOCK_TAI) and IORING_TIMEOUT_TAI be split
into separate patches or kept together as in Patch 2/2?

Artem Andreenko (2):
  io_uring: snapshot clockid per wait and drop clock_offset
  io_uring: add CLOCK_TAI support for waits and timeouts

 include/linux/io_uring_types.h |  1 -
 include/uapi/linux/io_uring.h  |  5 ++++-
 io_uring/io_uring.c            |  1 -
 io_uring/io_uring.h            | 13 +++++++++----
 io_uring/napi.c                |  3 ++-
 io_uring/register.c            |  6 ++----
 io_uring/timeout.c             |  2 ++
 io_uring/wait.c                |  9 +++++----
 8 files changed, 24 insertions(+), 16 deletions(-)


base-commit: 822ba3a89c7896b26e4beb70e2ebffb881924dfe
-- 
2.54.0 (Apple Git-157)

