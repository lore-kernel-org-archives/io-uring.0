Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF0A41D648
	for <io-uring@vger.kernel.org>; Mon, 14 Sep 2026 09:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377688; cv=none; b=QEE7GjrLDu+DB4SnGuPDLB4ewGg7NQdu25wWgpPPf3IFezM8aQouv/rBYI05avwy10817mw1gXmfTql5EsnLDRpIHu7wXFu/uhhHntI6YE/AMZP2ozPPtRPPNnpNNKP0UjxaZMWZFnunKUTh2Sx+fkUb2mMdDyabq8W/MtUPoOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377688; c=relaxed/simple;
	bh=RAlWELwo9TG/w1IXinF2Bzls4at4f/QFqyYXanYN1qA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fU37nfXFXYFzuzs8QpE2NNyCx95tRHAF9w6wEI4cwIOs9ocQfD16KGq4ORpQ46ULPmFeo/WfAC21geilFaedo/s2gc4oIifW8/R6talMwx+67hIm8vBaYqCX0aYrENlAPoRSJ7PdlKYMcoZLkdYq8S/Ve5AMrTGXhOymlgtTQgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDwAJYt+; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDwAJYt+"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc9b6e4so23173886d6.3
        for <io-uring@vger.kernel.org>; Mon, 14 Sep 2026 02:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789377685; x=1789982485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qk+BA33L98SLfZiPW8P8uOFCGuqrShAf04RrHk03MyE=;
        b=gDwAJYt+1Wsr9eviJYtxmBZWu429pzLY4fzgjHQwslatKNnFUBC8I2jjPyRjIwETJ0
         F6f3O/roQb86ZoX054Jqlc4g4HQwn6CdQDXK5SJRKVTDdUflwHZAqFH1VW0jx/sDuKUd
         VJ+Zg5Vc4jZmKhJWy3b+PfItRNeRHVNwNspZniRnK3vcZ8uSlUYuI3svnm8UzL49UN84
         StcnYmZBbn6FCEu+Tg3JFLwuguJpYH7iu6XrnoqILYJXlGTsoY4WxOVHPNT/Wkpbe6OA
         u9VIeUNvai86dqmIZSsxVEbgCsfdpNK8NicGdZFUzRF7g0GCKAkfJt+z01rsDtnCo5v7
         ekcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789377685; x=1789982485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qk+BA33L98SLfZiPW8P8uOFCGuqrShAf04RrHk03MyE=;
        b=YwESvu+BNSP7UofhOQUVz6Q60eAgyZiDZ9dpDOd3Yt163B8XE+4aFFWciosZ3s7T0U
         L6CKdRv0x8XHAk34h+o0I0g4Bz4QUQEfViNF44vaefjaPHQRgX+AW5Ny5XBxmLGTDKlp
         nut6r4K6l6cPsZhohpouz7oEnNbrjlYEwHvM2up32QXl6E/lfmYdx6LKAHT5sb6jm9xQ
         fbl7W/6Cvs2hCR8yHtpJw3tn73cTGbHubXmgCgkhCRLwnX6LdG7a1Wq+EBe0zUZ2aerc
         uSdll6UDSA4zY2R4NkQqMz8P8zYbyasrxzvJzbC1hxUSbaD4OJTmy+o+sJKjPLk9kvvM
         /nNw==
X-Gm-Message-State: AFuF++l+7YxC5qkIBPEGEzEo/fU9S+Af+kCrJHY6pYRQT6U5pGTiu8me
	/XijNmPU9hoejkZ45v4NTPEItS25PgF22jI6YBzQ7iOFVtuo2YlwZPQyHhXtFAW0kn4=
X-Gm-Gg: AYBFou148jGRV6j1nGe32VmIdleIHD+wCDW4TPp53cDTDg8aPwCpsvz6sT8Nh/A7cGB
	yVcjx8v0HNcSnmcffllFKyjuu2ZDMJoY/5sxSUUGGzcP1G2wBy/srONNEpCCfd3NJfZaVDrjauz
	wUT2fPK/YTE3dA4ms/Gz/0hXnmDv1CsnGISlOy1DF7r2Txm/egnzFl4AgElQiK3Nho1Y8mhFc/t
	T0S6qRVqzX1I0oaaHjGRLtmNVSml9CcxroyU3T4iigvvC9V5u4ZMh8oPSODGlPovUwQ6bm7s1gE
	w9LZPVjgICWV20ZsYU1Xt0q7AcdwZD+8ctHebsAWPqyMxD608/rsfZOdnSXM69Fp32pcLl0yxBS
	vp+d9xMvvPpnh8DoL5CPm/wIzuYeuWmjCbxvK3aTwWTmFJOIg1CbPx0+oov2E74mIG3jgZXPOY7
	NOuEuKTh2a17rxPfN/jxpFaytwydzNiaV5VKPwtJIeOKhn5XAFIfOwwnXD8sdtA/7188eTBPB/2
	gOvGiJbZaGVnLg9s4aSXdRuGbDl40BXkE7+N2X/VMyq2mKTX+w3LWY/5g==
X-Received: by 2002:a05:6214:4307:b0:90c:ab32:d9 with SMTP id 6a1803df08f44-9122e50077cmr25896436d6.9.1789377685177;
        Mon, 14 Sep 2026 02:21:25 -0700 (PDT)
Received: from kernel-dev.. ([2a01:4ff:f0:3ff2::1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f49444bsm89854256d6.29.2026.09.14.02.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:21:24 -0700 (PDT)
From: Uzair Beg <uzairbeg11@gmail.com>
To: io-uring@vger.kernel.org
Cc: axboe@kernel.dk,
	asml.silence@gmail.com,
	Chengfeng Lin <lin2530632123@gmail.com>,
	linux-kernel@vger.kernel.org,
	Uzair Beg <uzairbeg11@gmail.com>
Subject: [RFC PATCH 0/3] io_uring/rsrc: reduce node allocation cost on sparse file table installs
Date: Mon, 14 Sep 2026 09:20:46 +0000
Message-ID: <20260914092049.130079-1-uzairbeg11@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Chengfeng Lin reported an 11.6% per-install slowdown in MSG_RING SEND_FD
fixed-file installation, bisected to 7029acd8a950 ("io_uring/rsrc: get rid
of per-ring io_rsrc_node list"):

  https://lore.kernel.org/io-uring/CANGjgdmt0FQ=offsdfn+wEaDxbOFoAa6bi92X_vEo4S6aCZ56A@mail.gmail.com/

That commit is not being questioned here. It removed a real serialisation
cost. The side effect is that each fixed-file install now allocates its own
io_rsrc_node, and on a first fill of a sparse table every one of those is
an allocator miss: io_alloc_cache_init() only allocates the pointer array,
io_alloc_cache_put() on the free path is the only thing that populates it,
and io_reset_rsrc_node() returns early on a NULL slot so nothing is freed
during a first fill. With IO_ALLOC_CACHE_MAX at 128, warming the existing
cache cannot cover a 4,096-slot fill.

We spent some time isolating where the per-install cost actually lives.
All timing below is Chengfeng's, on a bare-metal i7-12700KF with a pinned
core, performance governor, turbo off and fresh boots per point; the
evidence tree with reproducers and full logs is linked at the end.

  hypothesis                          result
  ----------------------------------  ---------------------------------
  slab merging defeats locality       slab_nomerge: no change
  SLAB_ACCOUNT on the new cache       +8.5% cost; removed (memcg
                                      accounting the old path never did)
  allocator call overhead             bulk refill, 32x fewer calls:
                                      +0.007%, path verified by probe
  fresh slab page creation            slab primed, 0 new pages: +0.9%
  per-object SLUB allocation path     prefill removes it: -9.5%

So the cost is the per-object allocation itself, not calls or pages, and
the only way to take it off the install path is to not allocate there.

This series does that in three steps:

  0001  dedicated kmem_cache for io_rsrc_node. Neutral on its own; exists
        so 0002/0003 can use kmem_cache_alloc_bulk().
  0002  bulk refill of the per-ring cache on a miss. Also neutral on the
        reported workload, for the reason above; kept for the machinery.
  0003  when a sparse table of N slots is registered, grow the per-ring
        cache to min(N, 4096) and bulk-fill it.

Measured on the actual series (v6.18-rc4, 6146a0f1dfae):

  workload                            unpatched   0001+2    +0003
  ----------------------------------  ---------  --------  --------
  reported 4,096-slot first fill,     119.423    118.151   107.731   -9.8%
    ns/install
  same-ring remove+refill, 4,096      712.451    710.384   578.365   -18.8%
    files, us
  one-shot register through fill,     518.387    520.663   526.873   +1.6%
    4,096 slots, us
  register 4096 / install 64, us       20.361     21.193    84.407   worse

The second row was not predicted: the enlarged cache retains nodes released
by FILES_UPDATE, so steady-state churn stops allocating entirely.

The last two rows are the cost, stated plainly. Prefill moves the
allocation work to registration rather than removing it, so a program
that registers once and fills once sees no total saving, and a program
that registers many slots and installs few pays for nodes it never uses
(up to 4096 x 32 bytes plus a 32 KiB pointer array, freed at ring
teardown).

Whether that trade is acceptable as default behaviour is the question this
RFC raises. An alternative would be an opt-in registration flag, so a
program that intends to fill the table can say so and nobody else pays. I
am happy to rework 0003 into that shape if it is the preferred one.

Testing: builds and boots on io_uring-6.18; the file table, rsrc and
msg_ring liburing tests pass on the patched kernel. The full runtests
suite was not run to completion on my build VM (the networking tests take
its interface down); the targeted set was. Chengfeng ran the alloc_cache
code through allocation-failure, limit and cleanup cases under
ASan/UBSan/LeakSanitizer, and verified the 8,192-slot case prefills 4,096
and falls through to bulk for the remainder.

Evidence, reproducers and diagnostic patches:
  https://github.com/lcf0399/linux-regression-evidence/tree/af2bf8eaae547d940c64ae8dcd1803baf31f2139/io-uring-msg-ring-send-fd-install

Uzair Beg (3):
  io_uring/rsrc: allocate io_rsrc_node from a dedicated kmem_cache
  io_uring/rsrc: bulk refill the node cache on allocation miss
  io_uring/rsrc: prefill the node cache when a file table is registered
    empty

 include/linux/io_uring_types.h |  1 +
 io_uring/alloc_cache.c         | 75 ++++++++++++++++++++++++++++++++--
 io_uring/alloc_cache.h         | 11 ++++-
 io_uring/io_uring.c            |  5 +++
 io_uring/io_uring.h            |  1 +
 io_uring/rsrc.c                |  6 +++
 6 files changed, 94 insertions(+), 5 deletions(-)

-- 
2.43.0

