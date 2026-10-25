Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792935010;
	b=TkSi+57v3KzXB3S0TJDGq2OK1BrthNWXaH+NN56kyZPCkqeKWwnBHLZK+MjemVAdTsN/
	 DNetB1aGbT5b3nVsxJNuzZlX0ThPG60yvT5knnV2JNfgMjoTL4e+i5eNdf9IcnUnoTE4R
	 M6XWALNFP+QCr1Mv4UQ4A3/wPB8XafYK/QbBN4wWepTQ6egIOAuG1zKbTKeAO2aCyTPt6
	 1hGmyuoeJywgFRMrL8qhu4PLxtYA3IOKh3kfiAaMDeOVtwNou0X0+HQdcXCYn96x1hEcs
	 /egHyYvHqFoLyODsh7wWJRoBNWF2dts5Tzvgar/+W+2eAXEGM5C52rorbOlpRYznm0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792935010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Content-Language:To:Cc:From:Subject:
	 Content-Type:Content-Transfer-Encoding;
	bh=JbzvD86YHcBEyz7BEI1bUEiWMcAVsdqKwyAbbxU1r8E=;
	b=KEfvh8Obgl8anY5uo4pSBRTRfgXp9kpUCdSR5HDz+bkiNIHlrafJRoS2Tx9uBeDhREUH
	 NpT/eC5hBz6y3ePc4/yHlanJBXVFTXDctQ+3ocxURa9fFUZVLMOdF5HtB4IfA3c1qcgUQ
	 g0ozVKzI1qUQ6MYYNpL03CkJyNV8FEwCUM4/GCl6+7p2ZZOgKhRVNYfUCaymtxC1Nc5rz
	 BVZrpaneUoyR2CSnnle1+hCJPNV8g1xDwcvM4HMdbkC+4iir+T0wnLf+Tu92fDFs6RDb9
	 YFxefwqOrvlqE4jYUH1hb1fjnyEI01p1NmViHtI5g1reh9aN0p979hlUewLI7a1nTuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=kUuWctmL;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94BD606A31B
	for <io-uring@vger.kernel.org>; Sun, 25 Oct 2026 13:30:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D94BD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=kUuWctmL
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-16079d54c17so1530024c88.0
        for <io-uring@vger.kernel.org>; Sun, 25 Oct 2026 06:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792935009; x=1793539809; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JbzvD86YHcBEyz7BEI1bUEiWMcAVsdqKwyAbbxU1r8E=;
        b=kUuWctmLak5Eh7juuql2f4dAsFLDLLH4cCrjNHb/IFr3xpwqaLHZ40XLa+tSoMF8+a
         ujBDLBJZOpFIa/f5COIxPWuJsmegR/wo9YGB/kuJNyryQrCJjyK4PYwa27nakIBkx5sN
         wFHtFnFrZ/6kSLQJPgyCf0j95LjKF5s7hBFfMgB/ZLyMf250FkfjfH8L5VhGdN/ZgFss
         dfIFkuix8sfs7pf3HboCahMn6nTFH8LnFI4s9namQBDW0jIkHd604PZQvdar1R1EVTJB
         x8vojzznw9Do5vilI9cKWzxNWSxQfHyJhHT5OqecoVNPYh4udvP38TL9gYblD2Pr3pf/
         mDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792935009; x=1793539809;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JbzvD86YHcBEyz7BEI1bUEiWMcAVsdqKwyAbbxU1r8E=;
        b=fjOyw+HEy7eOIIGJ9TQa+F+lpeDfkSWmyp/dMXdHlK6K09gPJTD1QCrqETHGjIHGVF
         dK+S7UlVWKBNibNT62RWc9kyGu79HwySBMSJCtRT+pe5tdmVyArb+7Kx/wsQlV6NWY/+
         Q7JlE6OfjQcOQz5ftVnmV3EGBZTAmn1pmTxYLH9W1Ab2pv0j1ahzHt5nQog5SnFzdsck
         5TZWD98w3YdKcQzTwe3ezCmzYhD1nYEGHmLXE+sxZ+es+HgtyD3w+pPEwibDNGiGpdgJ
         k52HxA9RXTkJi5wljSOPrLQTMW16c0qLuwj3DNpQlqNEkY8F1x225UtcsxrIENXKpz2U
         9o9g==
X-Gm-Message-State: AFq9FYJ7zRrk/mQF0ZUj/67xsuM8Gz6zKj0sUqR1tyAaJQLh8aisDeYc
	kQ4VV+2pTlWVOMwjdGk82d5QBE5AQ2kN6M9ZAKl+uDhcyu402oi0ZMaUh3rETxUn76ttMBdjce3
	eSoQ3QtQ=
X-Gm-Gg: AYBFou177hKe5q8A5vjTMPHRDG4ZaI9LkDFvkyMbpQCRHAZCmku/TccN2KeoYIqejRa
	8VawZz+wQ8Dg7KQJ2yV/leevuyqKdcEhagJgpR47JNKD37Ur/huX2W75U1IyoJ7TsPtpD+XL14z
	KnglYsft8OERiMvcM6tkMuRn9uLZYdyUOlMsp0G8vVbi5Zy9QGmJme5lPCjG0wBbagQsQbWwUjj
	G10AkgZwB+I2tfrg/p77O+EUO1ZL8BvpxI6Oko5z+4X1MFp8ZhDT0180nUsB57nR+Cup5Bxw1So
	XxdL0fFz7DdWB03wi3qhIGGwAh89lBtu9wdQii/1FzvvzeVMgrDDB36Y5pYv6lkiQTU4hyZ3DO7
	meBzItyn/P+FHFMOdNg/cXRCp9ZQwKGO3qSP99uTS0Rb7HUR48+m3Z5JsOXdo4NLkXGOv6wKB46
	qJPhspuqReXklqy7tiBSvWaC4/Tv0b4yFYBAXnGw06M9Tmjyc07+qUdzdnUse2whIp8ODQMzQKD
	WncBwRstIZT3sZmfVBBlAZbkwUpAT8enXuqYsgtOhHX8GT5Dwo8kmi2yBxkcuNQTVQjjpHSPTeS
	yD/W1gDbP9n89jGZWzJmTjoUcugSmIF7yaVe/LJE
X-Received: by 2002:a05:701b:464b:b0:14f:505d:813 with SMTP id a92af1059eb24-1993f2020f1mr5713322c88.41.1792935008917;
        Sun, 25 Oct 2026 06:30:08 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369ef6a71a4sm14500641eec.8.2026.10.25.06.30.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 06:30:08 -0700 (PDT)
Message-ID: <b97140d2-df87-4cdf-9f0b-d5ca404d50da@kernel.dk>
Date: Sun, 25 Oct 2026 07:30:07 -0600
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

