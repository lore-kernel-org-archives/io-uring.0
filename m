Received: from mail-oi2-f10.google.com (mail-oi2-f10.google.com [74.125.231.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A0436E46F
	for <io-uring@vger.kernel.org>; Wed, 19 Aug 2026 20:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787171156; cv=none; b=eRMlsQcY21UkZSdzcph/GAAZIHnMd/mQx54EMkkcxINo24nDj8uVwAPvJqqFrOcJMFboiAUqpKkyvJmPWN1xOYQMI7oYxqGtNy21Ew09Oaw2/XMiit/zw81Izh9rCb13mCURl7neDdcKRMhoHVMD1gMhI7PxPlVVFB6IbumGbb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787171156; c=relaxed/simple;
	bh=leL9IUakvNI2XU5WfS13aBRU7iKAOCvlEUcbENPXhOc=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=bsa+Zz4jilfEW5omyDamKWl21n2gHzeM5BQmUlj9AQ8I434R/tND4w9yIzLCf+DMYaBHCpL+STa9OAh4vq6piXiNqLJpYCEtZEoTvVw+SNwGcMvwF5v18bEoO/9oOR5nP3cqSSn5iNPKrVFl/4HgaISmStvh519MdVWbzRq4Kvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=zTVBUgsH; arc=none smtp.client-ip=74.125.231.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="zTVBUgsH"
Received: by mail-oi2-f10.google.com with SMTP id 006d021491bc7-6aae09859easo90955eaf.0
        for <io-uring@vger.kernel.org>; Wed, 19 Aug 2026 13:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1787171152; x=1787775952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IjnWy4LMPym+aVgGeT5Qa082rsH/m9xCN6iHv6BVQ38=;
        b=zTVBUgsH3zi8UEDWRJ5ZGlp3Um8MuXAkofz6YndGlx7wuVAujktcqiKYuWTQ3XWjkM
         Z8beZFuO9I7tEEtEMulIzO/8yiRwAnryTtJzQ4YBpatyaNB580su8zFXSYjNSj8k+lLZ
         YbGv1HcK7YP5PDcL6HoWk7a7ZC/YUZBT7CofD1T63b16mCcGLCjPeCpBEA1dAVixWH9P
         trqf+0kZKKcp6mR8OZbR9aJYoTyZci4z2Mu1bZxraA4wQxUwWRmfPTyK3eipUZwWFhik
         rQCdTV8IwpoD+6XuD1hk/PXqsV3f5qW+UYF0HQupDhn5Djwktb1iNRAeDceeqtypLn4B
         6wVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787171152; x=1787775952;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IjnWy4LMPym+aVgGeT5Qa082rsH/m9xCN6iHv6BVQ38=;
        b=AKw1g+OnLBHDXU+mUDWjHE7fyzz/GX9Ro2dNdch5JRo++z5koL7gbunb2n655Wc2CM
         VL4sg2kPl1Zq07COd1NYufnBQdoiF/JW0IrTGX5uAo1NasfoGSqKAnKiDfJWH8DBoWFE
         w1uvrfxQg+pzHSbcJUBDywl/7B/zremxrG0a6FfXDrt3+tktTRj/PG9Kqkw6iU7Ngz3s
         QI8OO9ABwa0KYNzvuZGUISqN2kAeZeS+HvrNqUlN6HvBST4i33r0B7JbO+0EEgIXUVax
         4OOXutdzIEDLEwvlJFwxAMNHd3++KMbPuSx2s6N8ScfMweZ1w25uVyQB7CoZ8jzIm3S/
         zNmw==
X-Gm-Message-State: AOJu0YzCs7rhZm3kcqTVTjMVbCKdRLXqhhmwxtRWFQ6NJNn73X8NLJxu
	kqEwuq9RxJ1g3mq23AxuERLF2DqQXhd9U4Wr03clS6WugXmq4jWqfBgnJ7qEoguvVIEUlhq8Myo
	AqZgVnc0aA1V8
X-Gm-Gg: AR+sD13+VW1m9wRdRzwNYQ0mg4r7mAKuZN/wiiw61J64szqTQC3XG/QcFEa51rZo3ll
	4LWECgKQ4agWAv/T1HXd2fqXImv8hJvaiWtCoaGVKdC0sDZPczo7sINUF/AmIAjVo0/QB0nkRK3
	Zs3cPtQrUYiB/wHwUWuFcOi0XDnAYxv+wA+TazPAeChwGVsZRSfyo6aWhOjsvLhPCBRE8XCJtfn
	q0KISPJ/K0H8+0x6lI4iibXKpursWnFNhQzzw4Fg+zWQju3ehpv9+BxO1HkvmcYhNwhgHOfbB35
	D6G9F2eIyaVqoD0vTtRenaeET4F+dkGEFyf21owAQjtlFHx/2Rl9xaeB4Rpi4LgHl4Of2sjELG/
	OtmAjgci4vdvGY4cjN2XruNXbJnGFr2ahvGGks03xp5ntbiSoXk+CEpJMhiU96rpVnk5CV+r9Lz
	kpSU6LlVXB4//weRq0dmQRWjPgkrCTBajIk3JT9weJtBVReTku9xpeu+Ps4lNqVz43VwpITem+G
	zN/De4HSh0SkCAiOgqbTbTr+StFOWU5j0MyY4uGeuOXlA==
X-Received: by 2002:a05:6830:2403:b0:7f4:3902:3a26 with SMTP id 46e09a7af769-7f44bab7f71mr2091996a34.1.1787171151610;
        Wed, 19 Aug 2026 13:25:51 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f44005680bsm2815113a34.22.2026.08.19.13.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 13:25:49 -0700 (PDT)
Message-ID: <9e824d20-2fb7-420b-af60-8411c5f7db5b@kernel.dk>
Date: Wed, 19 Aug 2026 14:25:49 -0600
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
Subject: [GIT PULL] io_uring updates for 7.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Linus,

Trying to get back to a regular schedule again post the summer break,
but alas this PR is later than I like to do them. Still early in the
merge window, but I always try to have them out on Sunday/Monday.
Anyways, here are the io_uring changes queued for 7.3. On top of the
usual cleanups and fixes, the bigger items in here are:

- zcrx work, most of it centered around adding dynamic area
  provisioning, plus a bunch of prep and cleanups leading up to it:
  scale refilling with large pages, coalesce same-niov RQEs on refill,
  separate the RQ head/tail cache lines and cache the RQ tail, and
  rework the area creation locking.

- Fix the futex inflight accounting so that only private futex waits
  are marked inflight, and don't mark wake requests as inflight at all.

- Drop the custom iov copy in the buffer select prep and msg header
  copy paths, using the generic helpers instead.

- Fix a folio size overflow in io_vec_fill_bvec(), and account the
  pages a compound region really uses in the memmap path.

- Fix an iovec leak in uring_cmd when the async cmd isn't recycled,
  skip the blocking task work for io_uring_cmd_issue_blocking(), and
  don't skip completion for a synchronous multishot cmd

- Defer eventfd signaling when queued from a wakeup handler

- Fix io-wq worker accounting when canceling creation callbacks

- Annotate remote tasks for kcoverage

Note: you'll get a trivial merge conflict in
include/uapi/linux/io_uring/zcrx.h due to the rename changes that we
applied to 7.2 before this API was released, it was in the
io_uring-7.2-20260724 pull request I sent you.

Please pull!


The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/for-7.3/io_uring-20260819

for you to fetch changes up to 881dc9dd66d2367e7fe1be0f953a8837cb3b26a9:

  io_uring: Add missing include for ITER_SOURCE and ITER_DEST (2026-08-18 17:13:53 -0600)

----------------------------------------------------------------
for-7.3/io_uring-20260819

----------------------------------------------------------------
Ali Ahmet Memis (2):
      io_uring/rsrc: fix folio size overflow in io_vec_fill_bvec()
      io_uring/memmap: account the pages a compound region really uses

Caleb Sander Mateos (1):
      io_uring/uring_cmd: skip io_uring_cmd_issue_blocking() task work

Gabriel Krisman Bertazi (3):
      io_uring/rw: Drop custom iov copy in io_iov_buffer_select_prep
      io_uring/net: Drop custom iov copy in io_msg_copy_hdr
      io_uring/net: Drop ddir argument from io_msg_copy_hdr

Jens Axboe (4):
      io_uring/futex: don't mark futex wake requests as inflight
      io_uring/futex: only mark private futex waits as inflight
      io_uring: defer eventfd signaling when queued from a wakeup handler
      io_uring/uring_cmd: don't skip completion for a synchronous multishot cmd

Mark Brown (1):
      io_uring: Add missing include for ITER_SOURCE and ITER_DEST

Pavel Begunkov (16):
      io_uring/zcrx: scale refilling with large pages
      io_uring/zcrx: move RQ head/tail to separate cache lines
      io_uring/zcrx: add RQ iterator
      io_uring/zcrx: cache RQ tail
      io_uring/zcrx: coalesce same-niov RQEs on refill
      io_uring/zcrx: constify area_reg on import
      io_urint/zcrx: narrow var scope in io_zcrx_recv_skb()
      io_uring/zcrx: don't reload skb_shinfo
      io_uring/zcrx: add helper for deriving area token
      io_uring/zcrx: don't pass ifq_reg to area creation
      io_uring/zcrx: split dmabuf unmap and release
      io_uring/zcrx: unmap under netdev lock
      io_uring/zcrx: move freelist lock to struct zcrx
      io_uring/zcrx: keep array of areas
      io_uring/zcrx: lock area creation with pp_lock
      io_uring/zcrx: add dynamic area provisioning

Robert Femmer (1):
      io_uring: annotate remote tasks for kcoverage

Vishnu Razdan (1):
      io_uring/io-wq: fix worker accounting when canceling creation callbacks

Woraphat Khiaodaeng (1):
      io_uring/cmd: fix iovec leak when the async cmd is not recycled

 include/linux/io_uring_types.h     |  11 +
 include/uapi/linux/io_uring/zcrx.h |   7 +
 io_uring/eventfd.c                 |   8 +-
 io_uring/eventfd.h                 |   2 +-
 io_uring/futex.c                   |  32 ++-
 io_uring/futex.h                   |   1 +
 io_uring/io-wq.c                   |  14 +-
 io_uring/io_uring.c                |  17 +-
 io_uring/io_uring.h                |   2 +-
 io_uring/memmap.c                  |  37 +++-
 io_uring/net.c                     |  75 ++-----
 io_uring/opdef.c                   |   2 +-
 io_uring/poll.c                    |  23 ++-
 io_uring/query.c                   |   2 +-
 io_uring/rsrc.c                    |   2 +-
 io_uring/rw.c                      |  24 +--
 io_uring/sqpoll.c                  |   7 +-
 io_uring/tw.c                      |   2 +-
 io_uring/uring_cmd.c               |  10 +-
 io_uring/waitid.c                  |   2 +-
 io_uring/zcrx.c                    | 398 ++++++++++++++++++++++++++-----------
 io_uring/zcrx.h                    |  15 +-
 22 files changed, 448 insertions(+), 245 deletions(-)

-- 
Jens Axboe

