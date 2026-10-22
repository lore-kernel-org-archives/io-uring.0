Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680343;
	b=jW/EOR5AJoVseEAwume2m1jzjD4Q9fC83Hs5PO0FQOLZAUfpK3+9+xCp/R5ZnYPT0lwr
	 W1EowNTZkvygXKIqqN3HRVaLSJPFuWBKcvm7uzFN0D03sgwKF1oQfQ428YaGAmYaelYeS
	 5ZK/zNDCPExfB2s0/6Mg/NC3LkR9/pAOJnIziqrjCHXr3Vjw6vOHyTWDYszznL6zYI5OE
	 lElGDGuh6PSQwv8c9wlVEXfFtGAFX1v2ILUrYWRRkaKbOh/VyM+XJ3++Rc9d4G/05NJfk
	 zJtEM9MmuDZQfFugFMBYjV6kjRNhvLb19uHt8hLrIR5oQI/chQBlmty5x48ZODH4lEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=YHBFmHAZzkTNwhPEuQe/n0EZjSl7NRJ9RBTHgn7pG6g=;
	b=dJN4fRf1IFgtEynWtbquYCPEHMJTtEZ5pcfxaak/FX57TAuOg5vDg6y+n1St/Dz+9i2D
	 wExTUzL9AY9nkgNHZUV0Az7BG4n4bbPj+kvJrhP8fKG7ByyMHql2fDtPryntyssVK3WUs
	 YyzpwjW0RkJdg/sjapG4quqTqD98MwZgAtGGPer15VFz5Vat+YcdgIM+9iKf1dOut9/cl
	 GAJkq60ymdBo0Q4wS4tszIyvQMB+uiArrnXIcqGkYIZDHeY56k/AvEnmfhttAyDujpgX6
	 D9wiq9QOPa3dczAR3e31ZWWnHanH9xaZi6tyN61q7q/MeO9AnD0g2ZcD/vS8QLHOYLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MX4aGq+Z;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4192D606A31D
	for <io-uring@vger.kernel.org>; Thu, 22 Oct 2026 14:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4192D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MX4aGq+Z
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-156cbe59524so1556286c88.1
        for <io-uring@vger.kernel.org>; Thu, 22 Oct 2026 07:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680342; x=1793285142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YHBFmHAZzkTNwhPEuQe/n0EZjSl7NRJ9RBTHgn7pG6g=;
        b=MX4aGq+Z76FGWDcCUV1LNuRvEgXiZkCR1eq0l3RwGH0V2h9pF4ulMUXNn5dSFjqW0h
         dvaIMrGEeu5BEQb/j8zn0XhshvClFROYk4h2ZW28nTXT48T5ArQH931fqAHdUOAFM4p9
         Cxr5jFg2zRStIh6zh8a6kI/jpDiYNmLNO+1TsZEfy0BZYRKJtdTTP1DjjfMTd3K1k/ym
         h4t75bJSWIoverA7ahvnVUnActI9LRbH2i9b/Tndc2tMA83g8lseNO+qnb6lWec7zavH
         S6zcElnkrdUhivd4xhakT/4gvt5ladPKD61Xb1wbseoIaQnK0I72aOoiQF/xw1Ia9BFC
         6fqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680342; x=1793285142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YHBFmHAZzkTNwhPEuQe/n0EZjSl7NRJ9RBTHgn7pG6g=;
        b=OzVGwZ55sGKRLWh8w1LzRyPmBHBEmM+FDZojiRBnxu0K7Ehgi2cKOc9vHVHMOF7KwQ
         /44jueMrPBMFwTEPWKYye3zAwtwQ6/oytaPHCxfrKMt8CImp8ApHiLbG6CHrG6vF46+C
         QdG/gS+Qr0A9xjTX0wvMNmUhtBQawx8WTqUI62xZvovbB8OWAiZckluLoMcEj8ZYktim
         kJvSHTbBDZs+3N7b8l0n+Nqxl/I9Kn8mIRWUprtZ7NRXeW0CS9BBO17wRGg/NiOxCjg2
         LnH9pHWpNetfywuM39bETIfvadN+KNggqOC1Lfu8lfNHZUmRoLpf57436GdLwJtcMpzC
         q0vA==
X-Gm-Message-State: AFq9FYJ0b1Oa2heRAARHZteDA8xak+/R+urmoxoezuAokvb3+bMD5BHt
	KVuVZQtZNNsb6zqSmokwWiMLb5dbnWvWYrwoOACHLv1INGaVN2aEA5I=
X-Gm-Gg: AYBFou2HWQ5q6L8emCnjQJawL2Lbj1u48S2m/hKT+DhX5rlUOsfRyztTyuirYX1YkcS
	gUE/Mgz9341hVagbLVHYU+aPN2PNin+MoQQVOwRM9WGq38m7xqTD9MUBhLgP4OahpOIHnr610A5
	A97RFwMeDAOCrTJjA3e1DuUYxXxsEgatsUt41MwNehkXaueJLagZ+w4rJyA68ycPobCcAroUG1W
	Jv24LFAdfSBMmgdPzrTIL5B6Ka71yDL7JE7yGergwbUlTLltTV/vmYv7IBSNC4dQA05/jwZkugF
	KY61Jxpo86zDcU/buHBWgfCrhZONNZ5ehcguhKN5QXsfeS6WDtKKI3oRVXlU6WI7gXZ7S+mJ0WL
	hwuSA5fC+8sRlR+plP/uThgPsifVYEwJmSSM8134RvH/F019bDSOrch9s5FXXg+f2jt1IZaoom3
	8BxlJtjbWZZEQXb5xoMbNotkvrbn6Nu+e+m0sXJMLjXsiBvI/fKZ9KOPnjjHT0Wu3fkPjGcRNq5
	7aGSjPYyeSd6rdO4Ntj/495zwApXggcrv8cgItGhkZ4Pz/BZvm5NpItRoe+obL9jpwbF8EdKz7b
	wAEqBbbaywTYWIbn1LXNc1X2Ey1kMQoyRvHBfv6ycb4=
X-Received: by 2002:a05:7022:286:20b0:191:17d6:ccdf with SMTP id a92af1059eb24-19117d6ccf9mr5773178c88.8.1792680342117;
        Thu, 22 Oct 2026 07:45:42 -0700 (PDT)
Received: from anuj-MacBookPro.. ([2406:7400:63:e55a:5016:92c7:7a35:f3ff])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a275026sm23625880c88.5.2026.10.22.07.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:45:41 -0700 (PDT)
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
Subject: [PATCH v2 0/5] dma-buf backed NVMe passthrough I/O
Date: Thu, 22 Oct 2026 20:14:51 +0530
Message-ID: <20261022144501.2478417-1-anuj1072538@gmail.com>
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

It depends on this fix:
https://lore.kernel.org/io-uring/20261022132027.2293931-1-anuj1072538@gmail.com/

Patches 1-2 add import flags to the fixed buffer import helpers, so
uring_cmd users have to opt in to dma-buf. Patch 3 adds the io_uring
side, patch 4 lets the block layer map dma-buf iterators for
passthrough, and patch 5 enables it for the NVMe namespace character
device.

Tested with this liburing test:
https://github.com/anuj7781/liburing/tree/rw-dmabuf-pt

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


base-commit: fd13f31ac62abac4df2166bb0a6fbff53b288e0c
prerequisite-patch-id: 6ad52e1ffc603df71c6855926838f2df402c3ed1
-- 
2.43.0
