Received: from mail-yx2-f2.google.com (mail-yx2-f2.google.com [74.125.224.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CAB30C178
	for <io-uring@vger.kernel.org>; Sat, 25 Jul 2026 01:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784943166; cv=none; b=H0qy8Iq06rqOWMGh7h5n9/xFEmPVwjFH9hDjqoVFH5HsbFRFmDJW48yBlE46i4VvwAMWjBdsu+VhrFBxh1ZzLvs7utVcp5Kzz+5/WsH10mCXVrISS50GP34YLraPSOWvp6P98SO9bTIWJv5xjCOL2EQo2X23SUaevnAbo7+NTq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784943166; c=relaxed/simple;
	bh=vuEcqupBqELiV4wE8bIEpAPR9F0xTb2/Xps6Dwwuapc=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=FUo7hGZyO4EU0Xz9DYfxpvVX7Wqfd/0ZaGaeqVIpZAMxWfJL+SnHRzinyVLuPiWoebmLO9Sf1iYaSKVsamLeSHOD/5cmuXIttRjU5gszDoY3mmAQTmPgoV5a+eDtbonZHFjXVNmT1MWm2hWXvEULXfJJbWBRAa5CZJXi0+4OXMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=RExTCXqD; arc=none smtp.client-ip=74.125.224.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="RExTCXqD"
Received: by mail-yx2-f2.google.com with SMTP id 00721157ae682-81f48ae80feso2737357b3.0
        for <io-uring@vger.kernel.org>; Fri, 24 Jul 2026 18:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1784943162; x=1785547962; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TFDVqv7OSQyoXoHbU3DTZ9/h55UYxH25oyphFmP4pRM=;
        b=RExTCXqDDOBAaVhuxTTU8QjT//Q2/xFEfAmDuy+2dVdF67iQVhT44a/kRYBmhe1y8V
         tt6ybfLDCP2+1eA2Wtq5xjQD/Rzoox7prHYdCi7mxiSDI9Cm9pXNCo8OOLdMM5f/zJRU
         PTKJGkFF/314QQUmRZO/gFEeUpbMGf4H9Lc12rrEi23FnlhJHUx5yGv/voKJ2XpSABYc
         NLwqvSBCK/o2Bpa/xfsdNpodFdZctcPD4M0AM0ynKTN6ckM1IbiJH2BD8E1CK4xrms7C
         Nn1y4iWOljj1K3WDwnj+ubvbE0SdxWnelPnibsl07F60f+2Mlo+QbTfhvaeaVA0riro5
         7DxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784943162; x=1785547962;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TFDVqv7OSQyoXoHbU3DTZ9/h55UYxH25oyphFmP4pRM=;
        b=rzb1bACV6Pqprno1waAEk4UkWxM7Gp+Cn462P2D3/qs9iWjkg1sXcfeTKeCNZApe+v
         lfA5IZ7oV4929t1M7EKzhZLHCbNNL4Co6Wr8udQwHQSTiJ5L+z5Ydxp2oxSueiXMzmcy
         hg7xqe1zKuirc5hWKgViv18n0X3ZZmcsf6oxIfIjUxDZtW2JDNuhZxHVOjhf+ry9pods
         mVuBUKmXwvgJJVE8wxeY36lHvyUMLC9IfipupphKLUfXJ1ty971oYj5zgsCI1ih7xQkv
         9YHKoKZrD3HMFKaeVuc6O0lUxnZkgilJQaCzuKoxDsZclGlaqqoHJTs1KRegBgHvCsLx
         to3Q==
X-Gm-Message-State: AOJu0Ywg73donUr+3BFxRFIvryyMX/pITixHNjaQemCIGqTedpIO7Aib
	uqmm1YH91Vk2Mg/eDi3TCEmjqb++QHEkjz4mrl9TjaATEe9BHSgyTF+G4fFYRCFP8aerilAbAZj
	SgKYURnFJMTKK
X-Gm-Gg: AR+sD10t962SHTUPtkhdv1+Cpk9ZiqajRhW8nMmTtGaEssmEgZm8sk9/t4iKMDN+vsh
	RjnT7pCU2qyHFvf3bJM+jIB+t30I+cEx6S6bCrQnw8vFxYk2kuqV4wfgzdk7HgJBCQH/J3SuK1R
	iMhvaF5KE66DJA/PfPrOEtS1LjC6725XVLrLUjd5so1r4ZteBCtTjZNycNXJHGYI515j/R7xLR1
	wmKyuKDo37eHxHJZOT+CWJOIlvyxOvszWf5SRqCWTuo5Y2CSaw+hJr0TZGlkSXHyyICVKcNnfSJ
	KFXsJRfnRYHcs+NVeQRejDcs2dsUuXnloYYvX8rKl1+//iRMTXhvIM6gu8goqjb/E5EAerFKG10
	Xr/P9Skk8ZIGi+UfTXDIVEkuVbT7+sx7iFpv5q8OTH/UUVrQFkYHdYpY9XkUnXCD/h8ei94NmS/
	28RBls075i5EQSzUmResk4C2E2NFR2hV6coD8W9+8k9LUXVTDXR7asm/8huUY=
X-Received: by 2002:a05:690c:9a08:b0:81c:f508:c1ff with SMTP id 00721157ae682-81f69cd10c2mr2907447b3.7.1784943162475;
        Fri, 24 Jul 2026 18:32:42 -0700 (PDT)
Received: from [172.17.0.108] ([50.168.186.2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f657a9705sm7619357b3.16.2026.07.24.18.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 18:32:41 -0700 (PDT)
Message-ID: <55fe18a5-1bae-4836-a4de-f7a496165b5e@kernel.dk>
Date: Fri, 24 Jul 2026 19:32:39 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: io-uring <io-uring@vger.kernel.org>
From: Jens Axboe <axboe@kernel.dk>
Subject: [GIT PULL] io_uring fixes for 7.2-rc5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Linus,

io_uring fixes for this week:

- Fix a missing ERESTARTSYS conversion in the read paths, which got
  messed up back when some code consolidation was done for read
  multishot support.

- zcrx UAPI rename, dropping the abbreviated "notif" naming in favor of
  "event" for consistency and to be less ambiguous for users. This was
  added for 7.2, so let's rename it while we still can. No functional or
  code changes, just a strict rename.

Please pull!


The following changes since commit 3afc64c61ce906a04f073ca350b46de10e8302f9:

  io_uring/bpf-ops: reject re-registration of an already-bound ops (2026-07-17 11:17:54 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.2-20260724

for you to fetch changes up to e366c15e1610ef11d0717ecd875ae63050282676:

  io_uring/zcrx: rename notif to event (2026-07-22 09:48:42 -0600)

----------------------------------------------------------------
Pavel Begunkov (3):
      io_uring/zcrx: drop "notif" from stats struct names
      io_uring/zcrx: rename ZCRX_NOTIF_NO_BUFFERS
      io_uring/zcrx: rename notif to event

Yitang Yang (1):
      io_uring/rw: fix missing ERESTARTSYS conversion in read paths

 include/uapi/linux/io_uring/query.h | 14 ++++++-------
 include/uapi/linux/io_uring/zcrx.h  | 32 ++++++++++++++--------------
 io_uring/query.c                    | 12 +++++------
 io_uring/rw.c                       | 42 ++++++++++++++++++++++---------------
 io_uring/zcrx.c                     | 34 +++++++++++++++---------------
 io_uring/zcrx.h                     |  7 ++++---
 6 files changed, 75 insertions(+), 66 deletions(-)

-- 
Jens Axboe

