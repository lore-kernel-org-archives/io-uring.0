Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B3B3BED6A
	for <io-uring@vger.kernel.org>; Thu,  2 Apr 2026 16:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775146180; cv=none; b=ixCZjD0Q8lG9ejuPXHW0XoC81bB/FMs+UtxCB0+CkEn+ZKBSS6PKiR8SOL3KfI9zNLBo+NIewBetC9AZDondfk3Vq/6aWXkqt03v8H02p5MfUKgOn8S95DHDaVSbpDgPZg9RI728fGt1qvWJ2Q9XAoWlsTr02xwcrVZa2HZcnJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775146180; c=relaxed/simple;
	bh=9TYkJP7Dyua/4q0Zc8ZsKEjhs41fvL7cMTqgmXA1N0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oo+ye5NOXe/jKKwnBpeQboGj137FzOW9BoE+YLgJRMmXU7sdVp9mKtUmjnPUcWVsXmAgussUSo6hrOVatMjesxSOok0L6pv3ntsz3iPqxG37w7JZoGYD5XqbJK8/zm7kapQStP8Kk2f3NAy3SNaG9CWdjnTtGUAgxo3rW66TCyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WvRu93Ov; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WvRu93Ov"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82a655cfab5so942277b3a.1
        for <io-uring@vger.kernel.org>; Thu, 02 Apr 2026 09:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775146179; x=1775750979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fz2HjW2pkHajmV7V5gNjzTrFkw9MDxaG3hDAY6z/sPM=;
        b=WvRu93Ov2tIjzO5ZS6fMfMzFRTpbGBIOVLZZSJTOrU8xXRGxzZudtx8+n1TAa2eBYf
         bP4bHNXgHpAO32jhtKOoDPGRTbcCS9Gxjs7BW7uMv8to+aPK7jgDuCidHWfV0z+DgCau
         gpiRSXELVbYwd0CkPtcC/ntN+vSI5rk03FjreWCrzLFUQfkSSXD7EMOe9EzXwwnVV/d7
         os1KnOFtEVJtm1biKpk+I/zTQmbSf2o4JTXAZFU36aj4tBzC6XXJ+9n886uvJuJ58Jgg
         5cpc89/nr5WI6lk9ENjIh13APW5efxCBRaDM6WxqJzmTg6GF3BMueJYwlB3v+B2qyHzn
         +47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775146179; x=1775750979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fz2HjW2pkHajmV7V5gNjzTrFkw9MDxaG3hDAY6z/sPM=;
        b=DC04xneyyi2QIRIZQSNwgWD2O8370pvbmoVG4Xev+QDnh3lPu6GqW+1pnO1g07g5RZ
         E3cbi6joAerH20op5XCAKUNDnqv9Pqv5tEay7G+0iyAaw1CLSnrA40Gx75CwP+A1xVkj
         VvI0Tuk5wWcEFmh7zyLlb3fHg5eTwryIxLSQ5zHD/5N6DrkFlaYKR6nQlOKiZXHzzQRN
         r/UZ+jsdqup/w+Gywp9IHTYp+4NNVy5OYcyRctu+yvJmYUWPC84XNYfBw69lF0tH4jXg
         BrXcZw3eiN7ulwC6MaOLUJdp07uCD4dFV2/pER/3eCfOMQQIDuKR+62DFZd9YhqRe1XK
         D7WA==
X-Forwarded-Encrypted: i=1; AJvYcCUXU7HDVPU+ewi/4bUNQEXjoxfejllo8K61hemUHDHPHIfMGI6j4PA43wtIETL4Lp+WuQjbpLPjFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzBiI1jZotFMLCrFImLBKdbK2fuxWnKinuVQ3LJEhhUGAo7869
	WXnCJJ7LkC7pvxkDidJaOYnjaAYxeh0Pw8k0fGkau9N14DkXQrrnaeoi92Bj/g==
X-Gm-Gg: ATEYQzwHzQA5bZX1TWlJbnqDsWvdNqEjPbHQOq/K3Q13IEDVtlff/c10VP6sHjFT96n
	RUr1EbdMBSiy6fedt+2PqJcx/WIX+3y2qIMfbraZuAFUTea1bu2oRNRRPoLud439IoJ0k471wB5
	ZfrAiFM+gxi3JYWeaiY9wdnY79H6vR/YSI5AUNDqZX34Wm1a+ceMw1SJub38DdNjvPzNC/xFLiL
	+IQMrJwOjZocA7d5sQC8xGkMwAoKcuTS81iBWoA/qqgF3dJwts0NqPssnZ32Gw16u5HaNUUYALE
	eMoaqWIiVlXCYSGZB7LUHrE5D/Tn7Y+XHEchWNYU12vBSgjKC9r21dTVUwf6Y6HGKwFhtllEPkb
	MmE9IMYfSp9dO36Anvo9lvLCLtMr/12/OTkLQnFZkIgH8FGBlqVP6g0fC6hZNNfKCs2pi9rsAdK
	UFjPNOHpta0zZDEG5QVg==
X-Received: by 2002:a05:6a00:4195:b0:827:3d52:5d1a with SMTP id d2e1a72fcca58-82ce86d78a1mr7491603b3a.0.1775146178744;
        Thu, 02 Apr 2026 09:09:38 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:40::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9ca79basm4495935b3a.58.2026.04.02.09.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 09:09:38 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: axboe@kernel.dk
Cc: csander@purestorage.com,
	io-uring@vger.kernel.org
Subject: [PATCH v5 0/4] io_uring: extend bvec registration
Date: Thu,  2 Apr 2026 09:09:25 -0700
Message-ID: <20260402160929.2749744-1-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series refactors and extends the io_uring registered buffers
infrastructure to allow external subsystems to register pre-existing bvec
arrays directly.

The motivation for the patches in this series is to make fuse zero-copy
possible. These patches are split out from a previous larger
fuse-over-io_uring series [1]. The fuse zero-copy work that builds on top of
this is in [2].

Thanks,
Joanne

[1] https://lore.kernel.org/linux-fsdevel/20260116233044.1532965-1-joannelkoong@gmail.com/
[2] https://lore.kernel.org/linux-fsdevel/20260324224532.3733468-9-joannelkoong@gmail.com/

Changelog:
v4: https://lore.kernel.org/io-uring/20260327172631.3380702-1-joannelkoong@gmail.com/
v4 -> v5:
* rebase to origin/for-7.1/io_uring 
* drop the io_uring_registered_mem_region_get() patch

v3: https://lore.kernel.org/io-uring/20260324221426.3436334-1-joannelkoong@gmail.com/ 
v3 -> v4:
* Add comment about io_uring_registered_mem_region_get() locking (Jens)
* Return info in a new struct io_uring_mem_region_info (Jens)

v2: https://lore.kernel.org/io-uring/20260324182157.990864-1-joannelkoong@gmail.com/
v2 -> v3:
* drop patch that makes buffer release callback optional
* add patch for renaming/exporting IO_IMU_DEST / IO_IMU_SOURCE

v1: https://lore.kernel.org/io-uring/20260324001007.1144471-1-joannelkoong@gmail.com/
v1 -> v2:
* update io_kernel_buffer_init() to take bitmasked dir directly so callers can
  set both dest and source

Joanne Koong (4):
  io_uring/rsrc: rename
    io_buffer_register_bvec()/io_buffer_unregister_bvec()
  io_uring/rsrc: split io_buffer_register_request() logic
  io_uring/rsrc: add io_buffer_register_bvec()
  io_uring/rsrc: rename and export IO_IMU_DEST / IO_IMU_SOURCE

 Documentation/block/ublk.rst   |  14 ++--
 drivers/block/ublk_drv.c       |  22 +++---
 include/linux/io_uring/cmd.h   |  38 ++++++++--
 include/linux/io_uring_types.h |   5 ++
 io_uring/io_uring.c            |   2 +-
 io_uring/rsrc.c                | 127 +++++++++++++++++++++++----------
 io_uring/rsrc.h                |   5 --
 7 files changed, 146 insertions(+), 67 deletions(-)

-- 
2.52.0

