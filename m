Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BE1429014
	for <io-uring@vger.kernel.org>; Sun, 11 Oct 2026 13:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791724294; cv=none; b=u1ZDHhauRkZ9UbBKcGAV6rcr0IOITju5AuUprVd0J+6sGKjWKJdNbthINlgDLFRTCRUMYqKSFagS8zz41GtTvKl8Sh9Swbfm0w9C2S0g8Myhj3GdzqsDLaHbEDDoOmbwUyh1LeO1B0oZeBNGW6rFadcRuTQwyLYUYr0NKk3ZXNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791724294; c=relaxed/simple;
	bh=ijCwcok7uKm6UEr6BavnzrncI9Xg5kPyAjBSsjmH7Q4=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=f+1WBs3Gem3WjLwAiEToXH0c8Cbh+hAxakAceL9AsrP4JUcCoXAl7g1tjeBCcOxJvAjoY0uxjm+QtO6qsSLiFJtEIbO5egp3/z84PVdZ/haXKqiTVms+urr2/ZLlAeWQsUxEuQRG8RJzTPlmdu1i39SXQrD7PsDzTycddeQ/QTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=LryHkxaz; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="LryHkxaz"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33fb4680717so402403eec.1
        for <io-uring@vger.kernel.org>; Sun, 11 Oct 2026 06:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1791724290; x=1792329090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2NiByrqvryM5yAKxMiyJ7wEimzzcb9T9QYnmAZ6ycMs=;
        b=LryHkxazyMUfLyoQjk5oxZo40o3RJ/ZqzTYkr0e9CKVnCDFEXr1Vhtn2hwh13mqvot
         YhftsHfN55gILiGal26yIPV5Gzp0TT+VNZHQ5Gk5WtuJ7iLuWt5lRwzdkKYtDyGUTJSi
         p6pRKrwLJuK64x7Yy4cWXUS7mZQbouerekuvdOxu+zEyPHllpyy0tONKpw/C2TWAe1qD
         HhiBSMBfpW9e0xGgBzUMevOQ0LGvIivD4wN7lJtcqVOEsbqWiZkyAN+iGR0elfN9wZH1
         9A7PKMuW9+5MJznVo575tH2cKo4QPh/NVKgkf0tIYCgrIAjsME8qVMZMs4GrGE0yBG4F
         BmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791724290; x=1792329090;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2NiByrqvryM5yAKxMiyJ7wEimzzcb9T9QYnmAZ6ycMs=;
        b=NWUL6zybJ/6JX3uRXvFnxTS7ItMdTKGTlXYRI193CuFdKboovPodRb9wGUmky2b2Ze
         5rkWIORsGVH7Br1VOhlY24yOeCAT2F5MWv6GQzMxrMfzO8ve+nqbtnh7hWaKo/tdNcT7
         LMGeQIeThYEtmbfE/BrmAD+lvzs+/ApccOJixklQRyhYtBBmSrKkVvtZfNeXsj5zLs9s
         HpwvRGDYqPOailGkb/P0RU00lDOLV44HhjIc+pMj9lkgl8IezA5CMyPu+/I2hylQKwgS
         kqJVs5tzxk/R2XU+akbpoylq7imJO8ANTq+yUQPsq/5lQVLrw9VAYZvPcGLFnNeT6VwY
         JDAA==
X-Gm-Message-State: AFq9FYLQQpkUb6etDQ116nh5KGG3vxhh3vWoJ4AJStIW6/Pjsbo+E00r
	Seq2qs8C3I0ewdoe/yhRYCBQ4NaviDAQBbYYeShbkZ3bZdhW1dUddLPiekhf9ChkNWt8ZadXGFd
	UTfSdZdI=
X-Gm-Gg: AYBFou2dnbAFCgDXP56dJvAkdRB4EpCT8EC8zvvn25/FNNqualOP0r5PWUUSUAHR/wF
	lckM2Tu4EjhdCJSoxy1XJaN3jivU9bsTVLKPyS9YGREfYegK8fDEWinX31Vwf6oDWxd/8bVMogA
	aXkgcowcbbKvFFHhITYy/nebtpLDJfGVrh03q831TbzSy0bXKCpyzKoT785tdI7zbQG/WDT+4em
	mWjDqH2YsMx3oPAvXbOKYnB4PNdWYCtjjG6Mup2NrtnAtZ271rvpLYpq2uCP6OHWGCiv8ITnL74
	T0Dz+Ew2lpEGpHv050uWBWIsb+7ywljNTYJoqTJVzbNIQ6PvJR+tJQt9KEfUbgGbh087Y9QHcBf
	2SxVBJS5J1OhS8R0/a5lU4q59TSncozBZmA9bnzngz+DlrbdvcIYYM0RhIJjj5n/+RFZiqdFbCa
	NeZL3+98GZd3kPesgSx/o9ZQgfuQgHe8gPX/gi1hwdjEkReMOBnNODYftOKC4lhbEqfVKagvRfX
	rsnTnZHb0KoR7HMDHY8ztTzHl4CrGwuutVmybvFY6hPrqoSh2zX0JU/4A==
X-Received: by 2002:a05:7022:ea8b:b0:149:50cb:2175 with SMTP id a92af1059eb24-16a6043d0c4mr8857188c88.33.1791724290187;
        Sun, 11 Oct 2026 06:11:30 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a42407e7sm21836420c88.15.2026.10.11.06.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 06:11:26 -0700 (PDT)
Message-ID: <51650716-bd0c-4349-92ff-01020abf6fac@kernel.dk>
Date: Sun, 11 Oct 2026 07:11:25 -0600
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
Subject: [GIT PULL] io_uring fixes for 7.3-rc7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Linus,

io_uring fixes for the -rc7 kernel. This pull request contains:

- Don't spin on local work the exiting task can't run. For a ring still
  R_DISABLED when the task got its tctx node, the submitter is set later
  and may be another task, so DEFER_TASKRUN local work stays pending
  forever and the exiting task spins in do_exit().

- Don't charge the SQ/CQ rings or provided buffer rings to
  RLIMIT_MEMLOCK. The region API conversion started charging them, which
  the rings had been exempt from.

- Don't exempt disabled rings from task restrictions on register

- Populate the CONNECT filter fields for a 24-byte sockaddr_in6

Please pull!


The following changes since commit a92193c91e8839fe5fc209616ea95465ae4b919d:

  io_uring: fix task_work add use-after-free with SQPOLL (2026-09-29 06:52:39 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.3-20261010

for you to fetch changes up to fddcf4c5321b3ea5f72166c3fd36a9d1c34f80c7:

  io_uring/cancel: don't spin on local work the task can't run (2026-10-09 08:33:09 -0600)

----------------------------------------------------------------
io_uring-7.3-20261010

----------------------------------------------------------------
Cen Zhang (Microsoft Security FORGE Labs) (1):
      io_uring/cancel: don't spin on local work the task can't run

Eugene Gvozdetsky (1):
      io_uring/register: don't exempt disabled rings from task restrictions

Hengyu Liang (1):
      io_uring: do not charge the SQ/CQ rings to RLIMIT_MEMLOCK

Jens Axboe (1):
      io_uring/kbuf: don't charge provided buffer rings to RLIMIT_MEMLOCK

Natasha Klaus (1):
      io_uring/net: populate CONNECT filter fields for 24-byte sockaddr_in6

 include/linux/io_uring_types.h |  2 ++
 io_uring/cancel.c              |  7 +++----
 io_uring/io_uring.c            | 13 ++++++++-----
 io_uring/kbuf.c                |  6 +++---
 io_uring/memmap.c              | 10 +++++-----
 io_uring/memmap.h              |  2 +-
 io_uring/net.c                 |  4 +++-
 io_uring/register.c            | 21 +++++++++++++++------
 io_uring/zcrx.c                |  2 +-
 9 files changed, 41 insertions(+), 26 deletions(-)

-- 
Jens Axboe

