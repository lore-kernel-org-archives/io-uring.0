Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795831943;
	b=j9cpqgkvfg7xJwdPnRNx3/ycoK3syF8MVOtVN9Vht6pdTglXfVxeTWH3DGY2duuD6Bg7
	 9qtRyI/+IpU7AI5yhDp4U/gOvWsO3feQTvJlTQY9qJaYKylzhllAP4EF01unNrWHO8P9T
	 yh8Hgxj8FnQEextF7+nevXzcEEEzxfu30Rmd/KyP5RqnlFaLA/TfKZRhOTpaSiq4qH76s
	 y4JWjCnD/2H2FRs7LnPCr+p4IUil/8SHNNSY2vkMP4UowOr/mFKNKF0Dn4BVGagzfOBs3
	 c+3DOfFX2iZfKWhlhCOvlGkFpo+GDpFL5rle58uWaj7b1Ikkj2JAoMZdalCnXz7GLgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795831943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Content-Language:To:Cc:From:Subject:
	 Content-Type:Content-Transfer-Encoding;
	bh=dJFtIGM7EvFmHbxoRg2XtnQ8NjV0OP5i1kbLk+x9NC4=;
	b=4rUfhZZSxVjlkevmBApXb+UrxwOe2z20z3fyoMO/7S1v2oPGAs/MCbTxQAdmNWgahZrq
	 y1p4WpvI9GiaEPRIrs++g4N1yCO2/6G8+6gLQ2Rg2nc8vsVoPB9nYFM1ELXxg/XOTR+KQ
	 rGMbOsAWnwng99sWLXlQX/mFHw5LbLZHGeaqwNzR5h3xSP/S9UYi8bUk+KgZ3kzZeO5LA
	 tDkMIxU/wiZZlluW/OIw3D6uSrQNk4N29RQ80AfA6iuQefigR9OVbzyFO+tyh/qdBMJV7
	 vfjZpl0Gf8W8WcqsIymDz0ppghMfkNYfgC3N38r569pP6yiHgJiVJ8sXl1bqnmi/xwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=B5SErqnm;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA4E606A31C
	for <io-uring@vger.kernel.org>; Sat, 28 Nov 2026 02:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFA4E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=B5SErqnm
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a2af4c8d00so10059988c88.0
        for <io-uring@vger.kernel.org>; Fri, 27 Nov 2026 18:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795831940; x=1796436740; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dJFtIGM7EvFmHbxoRg2XtnQ8NjV0OP5i1kbLk+x9NC4=;
        b=B5SErqnm/R9oTz92TdXmzB+pzzeH8cLWrXy/Yn+8JxW1fxdsR+LjGUjfvlspoR85Dj
         RgbFiofiaOwsuNj8tRMxnF+yDmhkIjudiwkv/YEN2cLyKngFLcqDELyafDoTem9xTqde
         VGXsmInEe3wTuxVeX2JgDU+g+8FXwGh0zqXOqWMI4VNjzi+feKZWeLtet7uAltDDrBCu
         50hpCYx0XgYmlxKbkv6cxREs7/WtRD8jfgZqgtq2e5tiS3jjFtv7MPEJAkSlczze1IS/
         9re/lfWx63c+E8FNtey4PZke1S92q4KTmhzNFFt5tPgZd/azm+gTFGMWul1GS8akO6sf
         rewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795831940; x=1796436740;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dJFtIGM7EvFmHbxoRg2XtnQ8NjV0OP5i1kbLk+x9NC4=;
        b=W4TGNgMyQwaH5VRD/tFPbA7ha+e4wIXCbY8GqM0Vsmg9vYgbclwddbmrrzNNXKq8YT
         DsEekjD2+13e/PJfxeEgiNUFJaLVI7Y8M8QoOL80drpf8Tbe6MlpZyuoyrfH0qakj7N1
         hCuXXR0pOtiJuEn3kx3XYCJSqCjSunhPUG0AvmCkwqKWNhO69kDaTHdyyZuiGpisAGdG
         cxK3iM/9FzF8PJ/l2sIkJ5Gr11MJxX3b4MP1R8+FPt3fzVLiGFTW4Qhsd+2FtKtMbVsp
         GGp0b42kNbF/OTKoE8eTd1n+X1fA2Ejnyy/cMk2njpAzOUddWAaWToNYArSh9PmX2iEX
         zeyA==
X-Gm-Message-State: APuU4Z+iU1RWjgcxV6134PcduQtJ1jogRKDJZhJ1Q0sORVrTlr6R4V2m
	hVuuvIOALzCGeSTKlrSI2K6vJF2H8r3KWdriuFrZxwUUqq7z84JwDH+3dMKgFMN3PCrM6OvpzQ8
	vxeZkV5M=
X-Gm-Gg: AZFdTZdw6R8HLb7CS5JEPtZIKOEISpovYwsyPew52UfAOd53Ul8Jt4CevTZ3HwwOh7T
	hm8/mNEwOXwOIk7rFScKymQERgJ7txRFvi2y7iFrXWYK4ejLNSV7fReFP88utg10m2HsvonYkre
	wY53rkFOgDWcmbeO/rOC6CSUBvzEV3pbesB2RPDsYEa4/n7DYU1gv2XQAtL6/YnEBTohsn3/tp2
	YR6Rop8HnDJjMx29f8PmfDEsWZxaLNRKdeKUhCA/CdNc+zWDHWPcjIhK8m4welQaPnbS6WOazin
	BHZnsrGhADkUCrCfhiXvZLsk+Z00tuQLXL7zaSx0T4Bv7yoWraRRF48/idUmJoQ103eVMXk7Mwb
	ZConTCR3kyrO5VGPr4CZBxdjSlDy0XQT+HUU4vX/gkOOK3vURtA0666B1puxZcK+M52EQ//yzgb
	tnoC7O658ufkVuixzjsdBysykbluBHJB/tFuZMkdr2bKKIFeMbKvtR56RdUErajq5X3VtyTSKNo
	+C94/pV3kdfxTO10Mg2uF+UR0yWoY57QpWk/3A3YnCEUCZIVvedQBc/H4f17tF3VrG0ohPK4DCj
	T+rsN8OxEgJlYMURhA8JW4imWP+ztPSIjBYXNMDey2L7Cq+RTLJWyfzAs4wxHJ6GXI7MfIbCLYx
	8pFVN4mUoy194EAWRHQFSQDw94MxNOhzNzT+tDbq/eSsFRTQ5
X-Received: by 2002:a05:701b:4583:20b0:1b5:87bb:e4d0 with SMTP id a92af1059eb24-1b587bbe63cmr11329882c88.23.1795831940403;
        Fri, 27 Nov 2026 18:12:20 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm60430429c88.8.2026.11.27.18.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 18:12:19 -0800 (PST)
Message-ID: <0e7b0717-e1a9-4a26-a78c-12632e61fe90@kernel.dk>
Date: Fri, 27 Nov 2026 19:12:18 -0700
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
Cc: io-uring <io-uring@vger.kernel.org>
From: Jens Axboe <axboe@kernel.dk>
Subject: [GIT PULL] io_uring fixes for 7.4-rc5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Linus,

io_uring fixes for this week - bigger than I'd like at this point, but
that's mostly looking at the commit count. The fixes are all pretty
small and isolated. This pull request contains:

- Don't charge the whole folio offset to the skb truesize for managed
  frags, as a registered buffer backed by huge pages otherwise looked
  like a full socket long before any real memory was used.

- recvmsg retry fixes: don't copy msg_name again on a retry, and
  restore the cmsg buffer before a retry.

- Clear REQ_F_BL_NO_RECYCLE when the buffers it was set for are put,
  fixing a NULL pointer dereference in bundle receive with MSG_WAITALL.

- Free the ring from an RCU work, fixing a use-after-free of the ctx
  when a task removing its tctx node races with the ring exit work.
  Cleanup on top to unify how the ring is freed across ring types.

- Don't install O_PATH files in the fixed file table from a direct
  open, as the opcode handlers never expect to see one.

- Hold timeout_lock for the linked timeout splice, and always walk the
  link chain under it in io_match_task_safe().

- Don't count the buffers of a send bundle at completion, as a packet
  socket with a TX ring can return more than the iovecs cover.

- Drop cached task refs when the exiting task releases a ring, fixing
  a task_struct leak.

- Allow an empty path with O_EMPTYPATH for openat/openat2.

- Validate loop_step before registering a bpf-ops struct_ops map.

Please pull!


The following changes since commit 0659e44ce739ecd856164c75a5325b7959a2921d:

  io_uring/io-wq: apply the current cpuset to new workers (2026-11-18 09:06:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux tags/io_uring-7.4-20261127

for you to fetch changes up to ba0084f1402bdf2946282290a3fb0af8f3544759:

  io_uring/bpf-ops: validate loop_step before registration (2026-11-26 09:18:23 -0700)

----------------------------------------------------------------
io_uring-7.4-20261127

----------------------------------------------------------------
Chris Mason (9):
      io_uring/net: don't copy msg_name on a recvmsg retry
      io_uring/kbuf: clear REQ_F_BL_NO_RECYCLE on buffer put
      io_uring: free the ring after a grace period
      io_uring/filetable: don't install O_PATH files
      io_uring/timeout: hold timeout_lock for the link splice
      io_uring/cancel: always walk links under timeout_lock
      io_uring/net: don't count the buffers of a send bundle
      io_uring: drop cached task refs on ring release
      io_uring/net: restore the cmsg buffer on recvmsg retry

Hengyu Liang (1):
      io_uring/openclose: allow an empty path with O_EMPTYPATH

Jens Axboe (1):
      io_uring: free the ring from an RCU work

Louis Thiery (1):
      io_uring/net: don't charge the folio offset to truesize for managed frags

Sechang Lim (1):
      io_uring/bpf-ops: validate loop_step before registration

 include/linux/io_uring_types.h |  2 ++
 io_uring/bpf-ops.c             |  8 ++++++++
 io_uring/cancel.c              | 18 ++++++++----------
 io_uring/filetable.c           |  3 +++
 io_uring/io_uring.c            | 24 +++++++++++++++++++-----
 io_uring/kbuf.c                |  3 +++
 io_uring/net.c                 | 27 +++++++++++++++++++++------
 io_uring/openclose.c           |  5 ++++-
 io_uring/tctx.c                |  3 +++
 io_uring/timeout.c             |  5 ++++-
 io_uring/tw.c                  |  2 +-
 11 files changed, 76 insertions(+), 24 deletions(-)

-- 
Jens Axboe

