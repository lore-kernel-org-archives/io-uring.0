Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2364044F569
	for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 11:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789126400; cv=none; b=dNyLPG2+Y6gc0ekUkAkW2uXv/LlijhoN/a1oJmtjLxPOfnb1OH9KkfiK3u1H0u4PBwqqKsr5wIND/Tx8It0lKDaryLCZGnu3k7xO1+So3zbHolpkxDdvUAVMHJJJ7vIw19wy8nb+kylW0MbOJ7WWkmc/qi08hImto0nij/C64HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789126400; c=relaxed/simple;
	bh=Y4pWk4N5YPJZgmh1JfDhcpE0VeR6Nczh8bZ5BbigPgk=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=I5F3bo4Prk7rGCKLgBu2wZa13Lnx0gcmxCPHEqZGIG3ad1Sw3KLWJ21c90gWV7yy+Na9K08+koeytEj7ISXO3FCNAi7GFFGCtPVn8eU8fmxmJ0X63ToNBdh/ZJmRlWh5tA1Zkl+EtxeRsDO7+bovKMqlBBZj0Z3eVteyqlPNOaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=fS0hypfF; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="fS0hypfF"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6b1b9c3af5cso729644eaf.2
        for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 04:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789126389; x=1789731189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V8xGfxm2gN1VlEHSNiwNU+nl4zZq74pOy/jRVbH2DnM=;
        b=fS0hypfFF3CLyM/1DdrXL9andA938IwebS6R8+6vbPhPssa5RlwtN2urJZxTV1wNfU
         pd2Xn19KWBneKLdrhJ0XV8asqYFaLlDQscFFKh2X920bQKbYniIfyXet9Qp0Vq/eHOHP
         wYwg4Rb8iiYOBxLQV5LE3TTjvA4WqyDuHCdoxCP07/bYoFjblYF6scE8mgTHWm+iGozg
         oUzTKJumEL28jTiR4jXz6TII00JATHHET3lDnqk84pHegbjo3fVFDHDhHdH1lNpVsKZE
         zmtv+yPUCyasPJfjMqp+grsea/Rh7BeCz2oEjZXod9KW1/d2tBfPERBgSAp1JLcQkRpG
         kOSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789126389; x=1789731189;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V8xGfxm2gN1VlEHSNiwNU+nl4zZq74pOy/jRVbH2DnM=;
        b=OmZaxU9CCCmgCoMuPGw97/vUBW0EAa1/7464m7ZVs8QEuIqHtDmus6eFwOizuxryc9
         thNttzqZQOFMnVxDQXG7mBMGYTVmhGuavrX7I2PXFYDRqDoCWgXUuZiVpi56tGPZLb35
         vp4/CHlc79vEpkmXzZ+Zkies7hVXkFogpD8dQI5PGsnX5JJdELoYifg++Pnpfqr4+1UZ
         xdOZb/HYuAJ1mwHtNmb/0Bj+wvwdOZ7wEDsHoqiY7m5+iBZQetOejmXlgdIdEpnKYrip
         Oc1husez802uPX+5B3DviwizjcbZJWlOe9XXcVgVGukBc/WNjqYCLahxQpDnCs2nB8X8
         /pMQ==
X-Gm-Message-State: AFuF++l7eUV+0vgoUGhEeb0Nvtf8LwHnhPxZ9o0OBgNb6juM65URX5MC
	xDQr6B7FVOeG7Rikz8IttrenxDlQ+bsrTl65cNSG0utRmHAb3QxsTVzfJsA6TTw1naVOShEsthH
	7ngbR1Yw=
X-Gm-Gg: AYBFou1xl5oAVDNND4YXHKRnA7weHQv0apfbrEPq/Boxnut2RB20MU/QVLnB55Dd7De
	3UQ0NH7N59oofF4nLUVsZcAFZs1+o2CeVIK/T0iKYqJsbDkuiuMXFIDbbVEnUXztfBG/+RGnz0g
	RywYPBdRmL3HwOLZva2/U0FNTG6w8DQkRcIMj6CJ8QEDHpYt/grv6+yHmYzAkewZDg+Ds6VDxRV
	epcydgCHFFrvUWjQYY9MBJ0aJjRLuah7dFkDQYSDeJ1f5NBV/etYf5jAKuBYcJcPJIvDnHduR6Z
	Lirp5kQGKrVOoxnhPN6+cwjGyh6X8C/WpetoJjT3+YGz4SRolsnHsxYt3R0wjcISmBMlePaPvpI
	SzhSQCZaStvC/hZ9x1RPl2nDBURX3l4gBpAi2w/+yzEPJQkVUuBiaeMWjQLfcZmgYtWsSUju/KV
	2t9ZE+vcuOP0l/5lfSjQwkcRfvUqVyx7x2Qs8LngN8wJFX6Am4yweB4jQcAcF7K7aJHrOgTNxfF
	V0XLypeNoebVRL20pRmGGjUgaV6NwouZJ94QIa6xzV1awdHxTp+ZeQ8Kw==
X-Received: by 2002:a05:6820:2084:b0:6b9:2d62:960c with SMTP id 006d021491bc7-6c0be928db6mr2443227eaf.68.1789126388719;
        Fri, 11 Sep 2026 04:33:08 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c09a31f6b6sm2751961eaf.11.2026.09.11.04.33.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 04:33:07 -0700 (PDT)
Message-ID: <3764292c-52f5-47ce-8f2c-02663e1f287d@kernel.dk>
Date: Fri, 11 Sep 2026 05:33:06 -0600
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
Subject: [GIT PULL] io_uring fixes for 7.3-rc3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Linus,

A few io_uring fixes for this week. This pull request contains:

- Fix a deadlock in the write path with superblock freezing.

- Fix an issue where a provided buffer ring would overconsume when using
  MSG_TRUNC.

- Keep the CQE flags on iopoll requests when adding kbuf flags

Please pull!


The following changes since commit 2cf20c4e0f72d523b8673053e7120d092ff1f074:

  io_uring/waitid: avoid siginfo copy during ring teardown (2026-08-25 11:51:38 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.3-20260911

for you to fetch changes up to 47ccc3f1c615a46c25cbf7f3ae60df30b40eb2e6:

  io_uring/rw: keep CQE flags on iopoll requests when adding kbuf flags (2026-09-09 09:59:02 -0600)

----------------------------------------------------------------
io_uring-7.3-20260911

----------------------------------------------------------------
Caleb Sander Mateos (1):
      io_uring/rw: keep CQE flags on iopoll requests when adding kbuf flags

Gabriel Krisman Bertazi (2):
      io_uring/net: let io_recv_buf_select return the length of the buffer region
      io_uring/net: don't overconsume buffers when using MSG_TRUNC

Jens Axboe (1):
      io_uring/rw: end write accounting from ->ki_complete

 io_uring/net.c | 51 +++++++++++++++++++++++++++++++++++++++------------
 io_uring/rw.c  | 32 +++++++++++++++++++++-----------
 2 files changed, 60 insertions(+), 23 deletions(-)

-- 
Jens Axboe

