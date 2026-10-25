Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792935000;
	b=drkBFl9ZEwMuNFaLKBUN5AnSDDz6Xfofn7n8+YKRYRlHzD3aMS5RYPu1jdrg/5DkTemt
	 orKTxGbpdpqyq+eb21HfbWMutfAa5SKuuyfe6ElSspz6c+m9JSNChz9a4UQggMF6HKjxn
	 Oza9HG3pdl6e2uGItMsCGNz6rq7SlnuSLgCeihOHCpTflyS9qO3OZCwxYLpUPBq8o4noo
	 8a4RmqmtctBX8YF9pVepY48Jl9M7muPkY+FnIbIWca9ZX4/H+eDN1QtwExGqvptxnmILA
	 yRZSC0apryI+RRhjen/K3IvPfv+pOXhAZ1n5sT03o8OXF24KuU9lv3tltvdzDCKxbsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792935000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Content-Language:To:Cc:From:Subject:
	 Content-Type:Content-Transfer-Encoding;
	bh=JbzvD86YHcBEyz7BEI1bUEiWMcAVsdqKwyAbbxU1r8E=;
	b=GAZUH9Vkodz4MMIOD3ZTwgB8yxWBiY0UVl7d+nJnBpIDCcrLM1A7KFYe4gZoHrWOzQDg
	 Ny5hPCKN5pvJjwCZPBzZhjbOXcOz7YtkaJHfXzg14yijJ7MWrfL2oYBPe0WaLUjrv9l2U
	 8WyYjg0Rj3LIFgJV90wItljZv4EjXjaGTidWB/tfqNGaVIfPqm7migg/zO5fC3MJnDTf/
	 yzyt12xlptZFfmxl5odYorKILCv/6ygmt/suX2zwquOXZdsMPCbRM8avNB00D6tnsG0d+
	 f9kvm6oijm2/rNAFVxIl86VfAi+Q6Z53EHm/qAGIhblrBIpM0g3PXyY+8KH51tbZP5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=rlhnYpuv;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B430606A31A
	for <io-uring@vger.kernel.org>; Sun, 25 Oct 2026 13:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B430606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=rlhnYpuv
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-156cbe59622so1424173c88.0
        for <io-uring@vger.kernel.org>; Sun, 25 Oct 2026 06:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792934997; x=1793539797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JbzvD86YHcBEyz7BEI1bUEiWMcAVsdqKwyAbbxU1r8E=;
        b=rlhnYpuvzs00rwDdgVaRdVrBThjwb9QVmb5NEdUgITBKCTiXPX/4Q1WOtoatWdPtK3
         wJPG2jTviPbkP1IujspeawTyXUsAMmKR9IlaBaljyne09uoEavLRrbRQjJsb07AhElIb
         KwSz6LqHbiq05r6MeuzQGPlm2Fe2GBjcF1vWIwU6NI1bVyUHcR43R+NFcWwJDZ9XfHGc
         GDcssz5/0BeA0cvoXnB4MaqU+uShB6y/Keehn51Z3dX1Pfg4skNt+tL6lZ7zYcDvWLSX
         XRxmlE1Mft4M+/vl1+Ga8ExYmHEPBBefcxtU+xMlAxVTfpoj4jWgpn4tcRgj36/+aKM5
         i2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792934997; x=1793539797;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JbzvD86YHcBEyz7BEI1bUEiWMcAVsdqKwyAbbxU1r8E=;
        b=nP5FRmD0Va6G4+/xRUoBBJa/jKdR1OQ7h/MjsWMHx/dt/d6GXv87q7aDsFCZrFzKf7
         V7O+s6bVFZGpCcd9VFkMA8FtqTmg4s+y1C0wRqVEPXuHZOD8mJ7hcDb9sRePW13I9LVF
         VsKrbdZTGy13/Ih4ZkewTXlKNvyZ1OjMtdWGdrJ4jrl26d8P/1c3ybKv/CpEwaeXyGhE
         Y1JAMlBiiE+GtHllebHm7jTX3u2rIAf4aOD4dBpklX3Q3+wzu48hPCFZYS3v/5PHnVyG
         EreBvpKGKSzW/fAjPu5b6tV/xDvNE6osZRmgSXHZO1Nq1oKMv0wA/qIGpSWacfAJqwvR
         4Smg==
X-Gm-Message-State: AFq9FYIuHMllAB/bgY4UuOBx9NiDBVfU1mRA/aXraHX5PFPaaDPnIgLr
	DVx1be0e0/dCAj9l+Sgy5Qe+XRppIq1keBRG7tRTvttVf8hUayWi5QkRWCx8meW9hVh8cr02eHe
	0pLwzxlc=
X-Gm-Gg: AYBFou2paMEX9vBy4LFC3f87N23ur5JELRdjI3V/zSZzAiME0XyOgz2U6ALIPEEwYwh
	cC56zmFFRmfcsJ4RH4O688vfjU/IVUWusBAQoE+XZ9TYJE4nP4kpA8eK/GSFVgRCR9wvXaivmjo
	1pDlM3xs1PYXptlPkEQrIE26ixuQUaDTz7n6NA8W+BRr758GuSgKME5NkOvCRQ5vuKQ4r5Kq/lv
	ObASbu4FAi4W3IxFKiwmj45OvwWW5lZMzAihyBlJ5aCtRl9m7iTcVA2yoUspP83a9ik7+POWUIY
	pH9YQLbUsmst1cEWiZEbUfSRlXDokb6KfXdFN3qKYIoWR4WGyC/nWgVToXCJnlxXeF+YnucyB8g
	RJ/nHBR7N5XRkpsdsNS6a3WXGJ9KuJJNAxAxv4wGsJ/u6CQ7EEbT+lDCxbbvodTcePGx5P/Jgwy
	i8hhcrkZgZlpe9A0lqM7aMOilNvcaKt7pgmv5qoGQlgVNp7OReFnEAK0ilpQqUWAZmUTWU1AJ/1
	G6JWQVOytpYCeqIyxjPvIOAjzO1IUJCGbchaoURFKFqh99/iT8dQL4404/6hjUV0JkZxFINgXBL
	nNYufpKdLUXD0iJbR+UGErFkPDZqHfHjN8jlLLw=
X-Received: by 2002:a05:7022:3a85:b0:18d:9eec:e0be with SMTP id a92af1059eb24-199290fe430mr6943741c88.2.1792934996812;
        Sun, 25 Oct 2026 06:29:56 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d5a10csm16098231c88.1.2026.10.25.06.29.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 06:29:55 -0700 (PDT)
Message-ID: <d38042c3-75f6-41fd-8998-da38f9420354@kernel.dk>
Date: Sun, 25 Oct 2026 07:29:55 -0600
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
Cc: io-uring <io-uring@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>
From: Jens Axboe <axboe@kernel.dk>
Subject: [GIT PULL] io_uring dma-buf support for 7.4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Linus,

This adds native dma-buf support to the I/O path, exposed through
io_uring. It's been in development for a while and should be ready
to go now. Since it depends on both the io_uring and block trees,
I've deferred sending it out until those were merged. This pull
request contains:

- dma-buf file I/O infrastructure: a dma_buf_io_ctx created through a
  new ->init_dma_buf_io_ctx file operation, and a dma_buf_io_map holding
  the device DMA mapping. The two are split so a mapping can be
  invalidated and re-established underneath a live context, with the map
  counting in-flight requests so it can be torn down safely.

- A new iov_iter type for dmabuf maps, and a dma map backed bio type for
  the block layer, with raw block device support on top.

- nvme-pci backend implementing dma-buf backed requests, including SGL
  support.

- io_uring dmabuf backed registered buffers, built on a reworked buffer
  registration structure with an extended update path, regbuf import
  flags, an uncloneable flag for buffer types that can't be cloned, and
  cloning support for registered dma-bufs.

Note that this conflicts with block/fops.c in your tree, as the dma-buf
rejection in the buffered write fallback landed next to the NOWAIT and
i_rwsem changes from the block pull. Fixup is trivial, it's just adding
the iov_iter_is_dmabuf_map() check in the changed
blkdev_buffered_write().

Please pull!


The following changes since commit e889b0e4cafddb3d68c3595dc01b7128fd35fbef:

  io_uring/io-wq: don't call try_to_wake_up() twice in io_wq_worker_wake() (2026-10-12 10:19:52 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/for-7.4/io_uring-dmabuf-20261023

for you to fetch changes up to 45b716456dd99488a0cef58482120dc0474aa696:

  io_uring/dma-buf: don't fail fixed buffers without dma-buf support (2026-10-22 09:27:00 -0600)

----------------------------------------------------------------
for-7.4/io_uring-dmabuf-20261023

----------------------------------------------------------------
Anuj Gupta (3):
      nvme-pci: rename nvme_pci_sgl_set_data to nvme_pci_dma_iter_set_sgl
      nvme-pci: add SGL support for the dmabuf path
      io_uring/dma-buf: don't fail fixed buffers without dma-buf support

Keith Busch (2):
      block: reject dma-bufs larger than 4GiB
      nvme-pci: detach dma-bufs only on removal

Pavel Begunkov (15):
      dma-buf: introduce initial file I/O infrastructure
      iov_iter: add iterator type for dmabuf maps
      block: always adjust bi_offset on bio_advance_iter
      block: introduce dma map backed bio type
      block: add dma-buf support for raw bdev
      nvme-pci: implement dma-buf backed requests
      io_uring/rsrc: introduce buf registration structure
      io_uring/rsrc: extend buffer update
      io_uring/rsrc: add uncloneable regbuf flag
      io_uring/rsrc: add regbuf import flags
      io_uring/rsrc: add dmabuf backed registered buffers
      block: fix indention for dma-buf checks
      dma-buf-io: fix typos in kernel docs
      dma-buf-io: document dma_buf_io_init_map
      io_uring/dma-buf: allow cloning registered dma-bufs

 block/bio.c                    |  15 +-
 block/blk-merge.c              |  52 +++++++
 block/blk-mq.c                 |   6 +
 block/fops.c                   |  29 +++-
 drivers/dma-buf/Makefile       |   2 +-
 drivers/dma-buf/dma-buf-io.c   | 241 ++++++++++++++++++++++++++++++++
 drivers/md/dm-io-rewind.c      |   6 +-
 drivers/nvme/host/Makefile     |   1 +
 drivers/nvme/host/core.c       |  12 ++
 drivers/nvme/host/nvme.h       |   2 +
 drivers/nvme/host/pci-dmabuf.c | 169 ++++++++++++++++++++++
 drivers/nvme/host/pci-dmabuf.h |  75 ++++++++++
 drivers/nvme/host/pci.c        | 247 ++++++++++++++++++++++++++++++++-
 include/linux/bio.h            |  21 +--
 include/linux/blk-mq.h         |   7 +
 include/linux/blk_types.h      |  14 +-
 include/linux/blkdev.h         |   2 +
 include/linux/bvec.h           |   3 +-
 include/linux/dma-buf-io.h     | 126 +++++++++++++++++
 include/linux/fs.h             |   2 +
 include/linux/io_uring_types.h |   5 +
 include/linux/iov_iter.h       |   2 +
 include/linux/uio.h            |  11 ++
 include/uapi/linux/io_uring.h  |  31 ++++-
 io_uring/Makefile              |   1 +
 io_uring/dma-buf.c             |  71 ++++++++++
 io_uring/dma-buf.h             |  76 ++++++++++
 io_uring/rsrc.c                | 178 ++++++++++++++++++------
 io_uring/rsrc.h                |  31 ++++-
 io_uring/rw.c                  |  33 +++--
 lib/iov_iter.c                 |  29 +++-
 31 files changed, 1414 insertions(+), 86 deletions(-)
 create mode 100644 drivers/dma-buf/dma-buf-io.c
 create mode 100644 drivers/nvme/host/pci-dmabuf.c
 create mode 100644 drivers/nvme/host/pci-dmabuf.h
 create mode 100644 include/linux/dma-buf-io.h
 create mode 100644 io_uring/dma-buf.c
 create mode 100644 io_uring/dma-buf.h

-- 
Jens Axboe

