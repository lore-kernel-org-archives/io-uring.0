Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793324751;
	b=s549h1LIYKlsnXyu0L6imXYjxpSWwJRYMm7MobIlApeU4IVLitZPHYW7L/6IzCc2y1El
	 Wk938V3chCVuzfb6P1HRauRJt1qoNgFGDlmOte8t9x2jwLC0mc3Uu7OXwoNJvUnrPfUn+
	 J7dr+yLjmhJCM2CH1+flhTGUmqChIP/X01XkZJgym3gANbXACFjuHb2ZvgNHmrOLROdg0
	 JWNZXNcIkWTZ3BZqcmXAEs6VSope2bW0dlOKyMnCU4v7xusFFMp7vDDCykWj+Lk3sH0zq
	 mM+nlTBcoWuMdj3IIoCKm98HEjccOheLfhjahObUcf4Nb3wBE+0znvcaS3PxDh5tluQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793324751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=8e/IpuSYW9d0QekEXFx6bT2Oe0C5XCSMgDyLhp7uw80=;
	b=Vnx4wbwQpInl8telu7bqjaX8dlTU64iVxu0yuqR1lX/XNLGsX+vcxhIm+sndx4eUiBwy
	 b341sxN5//7lJKJcEIJG1MhyOdROrpbYlFg/BGc5f9709q1Q1qqh2IX1/t0rPW9u77Kcg
	 0ltVW+0gNEoSrf1wzQM89FuDK4oEucvjbDNzcjaB1MuRMWtc4fQqNVNnoEYt1403Hd0cL
	 VSZZYJlgd4WRW1cgpstx9Kloo4ZnuNKo4GtjMFLTm8/57LddIOJzANKiQImAELrFNkQMP
	 e81p8CfOS0Ve3a0ox529Xj/e2Hjch/b5zV5peN4m78hhSLxg3CZRG9qoMa+xhPz9AWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=grwei3CL;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1DA606A31D
	for <io-uring@vger.kernel.org>; Fri, 30 Oct 2026 01:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF1DA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=grwei3CL
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36a1947498bso451090eec.1
        for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 18:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793324750; x=1793929550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8e/IpuSYW9d0QekEXFx6bT2Oe0C5XCSMgDyLhp7uw80=;
        b=grwei3CLBhH0n+t8FMxoVn41EIUIORxUG2gg4NQl76HodYhPBrH0i3O0LFwy+YwR9F
         Y051WwR9tNWc/ViI9NCrkq0e+VhlF9WP+auwSRu3BpwQupNVW7sc9g0CmfuXfbHUWl0f
         vycTRltBoygYfYV7wjOQlqh2PB0iPhRLF3CLsuJgzgurCZQdfSMjmSalpoABRFupELBC
         H/i3fQFZAG+AkxZydEHe6Q1P0nv4v2WjaOap6wF7wuLTNgxa3DSNWV5Ur4+ctIYebVvj
         X9DJckYCVvSAmy8MMCGC1w6M9njEsUD7ESz1VtNyY149Q4CtSAAY0jbb7rjX9zPYx8Rw
         hm1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793324750; x=1793929550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8e/IpuSYW9d0QekEXFx6bT2Oe0C5XCSMgDyLhp7uw80=;
        b=v8A0zS9Z9MysycJclRP07IhUDI5mseFT1xkc7UP+rjCkztgOpHBDdwPZElpciekHxk
         26lxuwn0NZ09h093xPD6Q9FAGd0rUcyhPRYkUWbF56rrpTR8T4BIsdcqBVRB3n2z3uX5
         pw431LF5f4rZIOdvgaNm3U5MrKMU8ZCwvHnEdVUrJsl99IOs2sreABjxC82nije5YU3Q
         dSACVo8MkCOJ0UpGMzAbOLG9hFAMLvuoFH47LLqAj8HCFX+KuRXOGhJkvjzgKQZEDwDv
         fGyccPqef507m7pa0eHVteg/A22xwT1/yaJZILvJhFIwjqpM9qM/epRVL4Ri2YN/HRNH
         MVcg==
X-Gm-Message-State: AFq9FYL5OCWfAyUcJrBPcou/IJl+8olFASBMMqa+VFgmgtgK9bQigPz8
	GEIKix3u5nQdmJAz2i4F2yOAM9R/Mltw6pBFSW/IMzEqKHnKA+DhmZAdYgoFvGY=
X-Gm-Gg: AYBFou3+FJmaFXgaoJ8t57mWE4XhGW/AF4TGTbYYNBDne45YWBlxLxOM5ohC1gMaTEd
	DOoGJE09uI+GCfu0LKDSd1ux0C1hNQDMLwQgvHQ1Im1zFxsrO+fFqakyRbbru6e/yaBCvk6SxDm
	xZS380aKDT60+Tse8cY05XBbCWGJI7IzVkdR8VNQIpZJSSmw8Vf46YQaJ2T8f7A2fawL41cUjoq
	UyfmBd2bbTyG41HOdbFu5AnTRn+QhPn/rZvj4zg4DXX1fqdqLS8AmRPN4nGZGu49B/8KxXRe13p
	CxCaEvrVvM7D/VPioqPk9xJEyqfLN/qfIQs56i+M9i2Mb3VrWb2ELob6xEV7Ak7KzCFz8T8KpEu
	ZdwX/M1qZb1eu/6/AMukx1YmunzL3XFQEnyBYHVqaRD0zWcnogsMsLkbwSUcxKXu1l1Sps9wQy6
	opdg7NdPvPG38rhWRKlAsgeHtVe2k/01gcVqte5MpeCW5GrpckuazbeAYUIu5KHllHlbSXmbuA6
	Llvf8Njg0by5yzj7FtCfDPTqjk8m8xvZVSFsmhOS2CvbHkln+R+bl/x2Hu+HiuGqe/0H77foqfS
	YEMLTX4J7DXCb/kT+9Bk2ipVLmDcAa6B/gwRRBI2jaiV+ePySEtB+1vzmI3Zf4BDEov25oHWDHU
	3K3NguzjR016xUpI2X/VaAGodfnkhZgmo+wm9CA==
X-Received: by 2002:a05:693c:8806:10b0:369:f97f:72c1 with SMTP id 5a478bee46e88-36a4241bbd5mr1678012eec.36.1793324749832;
        Thu, 29 Oct 2026 18:45:49 -0700 (PDT)
Received: from anuj-MacBookPro.. ([2406:7400:63:75fd:f9a4:4062:7980:1324])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm2209020eec.12.2026.10.29.18.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 18:45:49 -0700 (PDT)
From: Anuj Gupta <anuj1072538@gmail.com>
To: axboe@kernel.dk,
	asml.silence@gmail.com,
	kbusch@kernel.org,
	hch@lst.de,
	sagi@grimberg.me,
	James.Bottomley@HansenPartnership.com,
	mkp@kernel.org,
	bernd@bsbernd.com,
	joannelkoong@gmail.com,
	miklos@szeredi.hu
Cc: io-uring@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-block@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	joshi.k@samsung.com,
	anuj20.g@samsung.com
Subject: [PATCH v3 0/5] dma-buf backed NVMe passthrough I/O
Date: Fri, 30 Oct 2026 07:15:35 +0530
Message-ID: <20261030014540.3065403-1-anuj1072538@gmail.com>
X-Mailer: git-send-email 2.43.0
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

This series adds support for dma-buf registered buffers in NVMe
uring_cmd passthrough.

Patches 1-2 add import flags to the fixed buffer import helpers, so
uring_cmd users have to opt in to dma-buf. Patch 3 adds the io_uring
side, patch 4 lets the block layer map dma-buf iterators for
passthrough, and patch 5 enables it for the NVMe namespace character
device.

Tested with this liburing test:
https://github.com/anuj7781/liburing/tree/rw-dmabuf-pt

Changes since v2:
- return -EOPNOTSUPP when the controller has no dma-buf support (Pavel)

v2: https://lore.kernel.org/linux-block/20261022144501.2478417-1-anuj1072538@gmail.com/

Changes since v1:
- split into io_uring, block and nvme patches (Christoph)
- pass import flags to io_import_reg_buf() and
  io_uring_cmd_import_fixed(), and make callers opt in to dma-buf
  (Christoph, Pavel)
- add io_uring_cmd_hw_done(), so nvme no longer handles the dma-buf
  map (Pavel)
- warn if task_work is queued with a dma-buf map attached (Pavel)
- make the -EREMOTEIO conversion explicit and comment it (Christoph)
- refuse dma-bufs larger than 4GiB on the character device

v1: https://lore.kernel.org/linux-nvme/20261016103453.1129150-1-anuj1072538@gmail.com/

Anuj Gupta (5):
  io_uring/rsrc: pass import flags to io_import_reg_buf()
  io_uring/uring_cmd: add import flags to io_uring_cmd_import_fixed()
  io_uring/uring_cmd: support dma-buf registered buffers
  block: map dma-buf iterators in blk_rq_map_user_iov()
  nvme: support dma-buf registered buffers for passthrough

 block/blk-map.c              | 15 ++++++++++++++-
 drivers/nvme/host/core.c     | 16 ++++++++++++++++
 drivers/nvme/host/ioctl.c    |  5 +++--
 drivers/scsi/scsi_bsg.c      |  2 +-
 fs/fuse/dev_uring.c          |  2 +-
 include/linux/io_uring/cmd.h | 14 ++++++++++++--
 io_uring/net.c               |  6 +++---
 io_uring/rsrc.c              |  6 +++---
 io_uring/rsrc.h              | 13 +++----------
 io_uring/rw.c                |  5 +++--
 io_uring/uring_cmd.c         | 31 +++++++++++++++++++++++++++++--
 11 files changed, 88 insertions(+), 27 deletions(-)


base-commit: 70866cfa169d5ee149364267289e71d50f9a7ae9
-- 
2.43.0

