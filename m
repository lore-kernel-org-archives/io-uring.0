Received: from mail-lr2-f9.google.com (mail-lr2-f9.google.com [74.125.230.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8242D442371
	for <io-uring@vger.kernel.org>; Fri,  7 Aug 2026 16:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786119391; cv=pass; b=qbTZxqoR2jmldoZqdIS5QY3O16goNpcfDj2zv1WGyebtLHlYO5PdscioT1yOsCCJ97BTaEk0/gZZnqxkDsPr039g8Rv28By/ApIzpmGanVLvM7yhIMvIcOIR4bGSwpi1+HvZNhSSq0czwg0LjpY6ZTC1Dy/RHOj24aBud3hblFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786119391; c=relaxed/simple;
	bh=4xhTbwlGPVO+mIF2BiI+bg9WOBc6lI3ugemGkMOx1wQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=TxF1DsFZWySrqQNqb40Ho3ySOP1X6JVqxIpPgHAysRxmDEkBNGUT0nbJhI28MoIaSITxousRaBRfoDttflxQJuBCya7GP2U8XZYn3V9wxOJw86sOaNWjKC3kbo2Nv1xXJnsQBclNQZW28Zs1NmfUE1b0IAczgdUEh0V4JozW1Zw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wf9nkaMW; arc=pass smtp.client-ip=74.125.230.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wf9nkaMW"
Received: by mail-lr2-f9.google.com with SMTP id 38308e7fff4ca-39c91e78377so19254901fa.1
        for <io-uring@vger.kernel.org>; Fri, 07 Aug 2026 09:16:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786119384; cv=none;
        d=google.com; s=arc-20260327;
        b=IbqxXSXJyucq+Q7+2GcxC6SLPTSysulqNMkJau7zU4HjutdzrbykoOMHY3JVLlTBQL
         FFHyKRGmMNBYxFQQ99GHUG/iIHrukj5dfMnUaZW1J4QMj0FiN3/N2YZ6YuOw8UTyyE+0
         QVWwdhKQp3lWId/Jtn9aKyl9a7qv/spvDRtFjKwBeBk3Qe6lJUk1C5OZ81K334S8boY+
         YLk1+bZrm/HFqR05IpohqS82AKfwdHhZo8NBfFkpLYvMvq0zkeDHPuJcvaNCi4JKwQ3k
         5a+QtQ1fiiuFwsvJLb6j/x/JPK9N08BbRRKbOdF7wnDjk38/AAKr0aTERBQwC52v6Hgs
         Mo4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=M4G/BTBpQuCoN9f6AKTuvFBeIP1ia0RH4I0KQE+Izo0=;
        fh=Z5+wa47tG7JTZOTmZXsaRcraqPRDk8joMvjgAmqnfWU=;
        b=Pp4o/PFyBLAOaNyE+oRdACihzGMSdTSdCszciy+maid16RsGJfFAdVasrNnY0sl+6u
         FABT3QKBjcLHllbqxsLigsJdCUy14EkG89793DfTjS6XwQXeqNeMP1YNldcqVzx/j3ZE
         9ZTa7zP4LUH2v7tQksDaL2US06zIO4nqj6/xxVhB459My7zVHrRpakaK1Qi0dVkwCxVA
         voo2mqmSedXEjv+d89qO+skHSWnSOShA4Hm/97U9KW5UFf3xW1ybQlcspxEQlg1p8b1U
         YxZ7WJkdMD2EEk0pczew6FfBWk+Uot5h1qQrykLrYqWL/T36RpODdA0Sr7Saezjnf7FI
         TBPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786119384; x=1786724184; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M4G/BTBpQuCoN9f6AKTuvFBeIP1ia0RH4I0KQE+Izo0=;
        b=Wf9nkaMWnVNkh0YKIXIk83CsLEeBKAwnEhjFxC/zV9GZO+XUhg1OLuoGglIA+UZjGB
         KmGo98bvLJ7I2+IVTMLgOtJIOOo454s/3FjmccCN/WF15pKILEgJ0iOJP+44VeyYe5qJ
         J4L/R6GWtytw6tDlyeqrE33vTL/ffMC2FzELq3d8hXJK7NVRevUmAsLi7SNHWTMGQaY7
         mFUCdy1ouC3/9crP5HXBkLNWuoQQPdQKZ3U+Lx5WRRW4HFL8+5mRcSQbHDy7BkwNzskj
         531ySlQiTYD2H4fDuz9dAKZASQ8ojKbJnh4rPu1BfPtG5XSsYVDX3DHI44cwq7z3H0ku
         dB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786119384; x=1786724184;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M4G/BTBpQuCoN9f6AKTuvFBeIP1ia0RH4I0KQE+Izo0=;
        b=YFnfI4Ea57HvnDetzSQmglczlvdXja5p2XTbwHHF61+IG1hVLrg/Resm2e5roJuP4+
         D6Jhn6JRIMZ3IR8h2yUYmPyUmjdWeXBDtyryCKeoc2PeMP/z9HzL1buoEEZ+E71+ELXi
         EbApeu9Ipaippg0SLDfeGQipxN0YIjvecXSMqDHgjT6L6c+s2sPs6rj1U9g6TA6WXAUz
         fsil4fsIpc+X8fi5b2TnCEJnQ4P3P42pJDgeGTTgdL7eM0A9bPDWsBQ1q8NNFI4liDnD
         FZf+WFww6KC/Ew61JD2+abfzqK8x7qIP+KFIhYRISBeFmrLqw4dJ7K1jqoHYQDROVLvz
         OAbA==
X-Gm-Message-State: AOJu0Yze0fO4fnY4iW3VVd++rKAoYJxFByCCFXjWR+SocLz+b5gWw5mb
	sPcS2i/aZMvNHuGG/CB9dUirenv/0DC8R5csMVlxlbEzIy2ML59QAR22lOa9UXM+uBB1D9B6tk4
	XJzuJsXLEhaxqLXhOnMpTFzO6Jpf3o8Y=
X-Gm-Gg: AR+sD10Zqi1oHhgDOU0TR7DTdHw5K7UlPa49O2tDRCAoiih2IfE0t5Hkjj5OVyeXO2w
	fA75fq1X34nEHj6Svuj3nIzp1PJKhVgJmxxtW8rSxZhoO29vYECDAhXP/MuZFzxSL0CYoxqMLJK
	CdkrqfI1q9/bqZb7vCxL9Q6+RTvoVWqaXWMxSyu4u0jj2STnQvf0tnMmgHSi3WtPnIhdpFn3fxq
	BwN+ZQQOKSizFivaRd8bdt4HYRXk43J6NCn8yVJqEqHRFQ6oWAQWEUtj/ojSpGqlM8IO7yUevXu
	c325HI3Mr5vyQceC72VYsCP5vedhR2osglXnneghm7V14NGlEPrs/aQ=
X-Received: by 2002:ac2:5dd7:0:b0:5b2:1de0:5e7c with SMTP id
 2adb3069b0e04-5b2f4cdc404mr2876480e87.51.1786119383362; Fri, 07 Aug 2026
 09:16:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Chengfeng Lin <lin2530632123@gmail.com>
Date: Sat, 8 Aug 2026 00:16:10 +0800
X-Gm-Features: AUfX_mzroksw6aCWlVSJID6HLEgHyh7V7alM_VE5i3jvV_mTvJsCNoYDXjoewds
Message-ID: <CANGjgdmt0FQ=offsdfn+wEaDxbOFoAa6bi92X_vEo4S6aCZ56A@mail.gmail.com>
Subject: [REGRESSION] io_uring/rsrc: MSG_RING SEND_FD fixed-file installation
 slowdown after 7029acd8a950
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Jens,

I found a repeatable 11.621% slowdown in a narrow fixed-file
registration/update workload at:

  7029acd8a950 ("io_uring/rsrc: get rid of per-ring io_rsrc_node list")

The same direction remained with 64 to 4,096 target slots. This is a synthetic
microbenchmark, not an application benchmark or a test of the normal
read/write fast path.

Original patch:

  https://lore.kernel.org/io-uring/20241029152249.667290-7-axboe@kernel.dk/

#regzbot introduced: 7029acd8a950
#regzbot title: io_uring MSG_RING SEND_FD fixed-file installation slowdown

The source ring has one 4 KiB memfd in fixed-file slot 0. Each round creates a
target ring with an empty 4,096-slot fixed-file table. It then uses
IORING_OP_MSG_RING with IORING_MSG_SEND_FD to fill all target slots in batches
of 64. The timed region includes SQE preparation, io_uring_enter(), and
completion processing. Full per-slot verification and teardown are outside
the timed region.

I used a fresh boot for each point:

  e410ffca5886 parent A -> 7029acd8a950 child -> e410ffca5886 parent B

Each point had 3 warm-up rounds and 15 measured rounds. Every measured round
completed 4,096 successful installs. The mean end-to-end cost was:

  point       mean ns/install
  parent A            102.476
  child               114.441
  parent B            102.576

The child was 11.621% slower than the midpoint of the two parent controls.
Dropping the first measured round from every point gave 11.649%, and the two
parent controls drifted by only 0.097%. All 45 measured rows passed the CQE,
slot-allocation, sentinel, affinity, and unexpected-result checks.

I also repeated the exact-kernel sequence with 64, 256, 1,024, and 4,096
target slots. The child was 11.853%, 8.717%, 8.399%, and 11.889% slower,
respectively. The smaller points were noisier, but all 180 rows passed the
semantic checks. The signal is therefore not confined to 4,096 slots.

The machine was an Intel Core i7-12700KF system with 32 GiB RAM. The process
was pinned to P-core CPU 2. The governor and EPP were set to performance,
Turbo was disabled, and actual runtime preemption was full. The three kernels
used the same normalized config, GCC 15.2.0 toolchain, Kbuild metadata,
module-signing key, equal-length release strings, and workload binary.

An untimed trace also ran 128 successful installs on each kernel. Both points
had 128 calls to io_msg_ring(), io_msg_install_complete(), and
__io_fixed_fd_install(). Calls to io_rsrc_node_alloc() nested under
__io_fixed_fd_install() changed from 0 in the parent to 128 in the child. This
confirms that the workload reaches the new per-install resource-node path; it
does not prove that this one function explains the full timing difference.

The later node-cache change, ed9f3112a8a8 ("io_uring: cache nodes and mapped
buffers"), is already present in Linux 7.1.3. In a separate matched run,
Linux 7.1.3 was still 15.602% slower than the Linux 6.12.95 control midpoint
for the same F0 workload, so the cache did not remove the release-to-release
signal in this test.

I understand that 7029acd8a950 removes per-ring serialization and avoids
resource reclamation stalls, so I am not suggesting a revert. Is this
registration-time cost an expected trade-off, or is the per-install
resource-node setup worth optimizing further?

Evidence bundle:

  https://github.com/lcf0399/linux-regression-evidence/tree/37b70f08786d0e2855289cfc317fd97e1160c970/io-uring-msg-ring-send-fd-install

Standalone reproducer:

  https://github.com/lcf0399/linux-regression-evidence/tree/37b70f08786d0e2855289cfc317fd97e1160c970/io-uring-msg-ring-send-fd-install/reproducer

Thanks,
Chengfeng
