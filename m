Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E924A357D0F
	for <io-uring@vger.kernel.org>; Tue, 16 Jun 2026 12:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781612855; cv=none; b=VfOKz7INjwmrpRmfdyx7cgg+UoIXBCFMiYaotPv020+Vam1SYxM/144vz1dTxtZfnbkevQ/2+U26y3plb2qyp4irfEVEXnyxsNuBGPR1BP2aOBVTkBZHMEnvYKsGDJFYcjr0zUDSMr3K7A/6ON4CAiEKW4xciLYQXnVzwDbNgNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781612855; c=relaxed/simple;
	bh=0T1s/TIdz00F2+RTRXebjhw7NY70m4wVnCgrSJ12J74=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=M2CeD8HySZ7zvz2UINTfwsVlszTwuyyOnM8Uy8y6gm1MnkjG9xrLh8ZB9o69phWMYOui5L4YOaDtPo2UzcebvxcevDXcR9dyn6y3waJuwCx1Yhw6CrW4Py3RegLA4eaXXIf2+U4KeYEPk15VSSNdPtmW2CFK7ecmQ2PEOSOnfhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=oHlVxytQ; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="oHlVxytQ"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7e701435806so3962163a34.0
        for <io-uring@vger.kernel.org>; Tue, 16 Jun 2026 05:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1781612853; x=1782217653; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/FT9WgBN6TwwAbvfC/4vmvjeYjVoICRquhYx5kfgrs=;
        b=oHlVxytQ+YO8vdPUl0GxoDLNR79T84Z0IpbFZcwPZHFBpN+QyU4sStkVIrfSQg7Z49
         6HXBkVywuRq9aKXlgVdnz4wkfXrQBTpAH7RhiK34XRd7fvawPzuIurbuRlOTGSUTEWAE
         JJf4+WsBKWsG9q2hvO4IDcDbmGwWeA//d0EV63p+EtpxUpUpHLAZk0pw8n/9OEGRSArs
         SVziwr/5WyyXnySX1WEU2a0w1H4BHR0AkNtJ3qxJUSIbYysB/GcI1F8SgYsDHsr+kpnk
         eT4laQgVDilqR6cjgiePFr7qDgM+Vrc1sY1k5DGD54Txs+7bVlWNFr6PG8A5Kq0GsKKV
         iigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781612853; x=1782217653;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+/FT9WgBN6TwwAbvfC/4vmvjeYjVoICRquhYx5kfgrs=;
        b=mJs2EirqH/wIDJ0HeHI2zdC6YaNAv8xHFa/CxgnY5kbWJ3CyybYsV7tK6vQ3cK9LWI
         gspe3ql/j0CNz+6lAw63rCqAA2axx2MOssf/sEKvuztrrOOqNufIGOCKnxPQeuy7cJQ+
         p02u4wYVgxvi1flDwQoW6jK6h+jSXchfSmVMWUZvAoYuHDSvjICTgEAvayhD9Yx+wKG3
         FSFE+w337Sxu1S+UWD5nU2liCcwpMUtCjWONaf7n3yoQ7FmSpfy819ngKqogHXbBY/ma
         9E/wTn+nmoIOmyuQNpch34PIhIwYLDxKE83B7t857+xOum3oKVvk7uHiCuHtp/kCHCSg
         W+dg==
X-Gm-Message-State: AOJu0YxuK3spsSKmwEEbdfSdRP3KrnZHugKmjNOhiKAytVSPRcqzWhpC
	pG/gb9u/ytyQQvx5j+QJkvExiDhZqjOmYrZY3h2qfmAtPwB/K5GRjEpUeak8GCG484aktmgFVP6
	ZgcQlDZs=
X-Gm-Gg: Acq92OGk7u66bX+Hipuhw+pSVfoXTb9rwjUsIeAgvGMftG5Ok3kRIN6rfV0lAOOpflU
	Y14ADbgBmZIF1/LMAR7ONCI2JWb2bvq1t1Lii2tXNhD4u7dBRV/77hzteu/tzcsVaOsRJWIRKms
	Bo1B0YydT6JK6NrwMyF6VFkRwT5swPlNfAZFwQYAkCQy4nEiznkuQOV++YjoVhyZh+/IxuijkfF
	OQSRTQysJZksSrXPqHrjLd3z1s8UiCgGEiUZ4eWtqhPdrv0Zl+L7DIdu2Gr1rBTIwvjjrVDMnVj
	4k6PlRjJAQZRG/zKJYG/iRtt748apsyUHHOsxABDxR/CHf20oI/VfsmAOOBgQbyNDPZFgxK4Gmh
	5Hu9LlE6l0QAFWrLM5aq9nSt4cFKg+LMikQqCQqW73IKbJo1gZk1b+O9U5V1PL8iNNIGWaUmK+Q
	KPnMPWxb1u1mChvrLDcQCkhB2R/HoBg9cYtJckuaWPgOXQ8TvCXXElsGlh1z9c0nfmbbAbcnoC3
	vTygx6/9w==
X-Received: by 2002:a05:6830:2b09:b0:7dc:c338:d23d with SMTP id 46e09a7af769-7e8fe5c09a6mr2465807a34.14.1781612852795;
        Tue, 16 Jun 2026 05:27:32 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e79f6dfde9sm6675482a34.24.2026.06.16.05.27.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 05:27:31 -0700 (PDT)
Message-ID: <d72ad59f-f09c-49d3-8d9f-f6bf9df29ad1@kernel.dk>
Date: Tue, 16 Jun 2026 06:27:31 -0600
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
Subject: [GIT PULL] io_uring epoll cleanups for 7.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Linus,

As discussed a few months ago, this pull request gets rid of allowing
nested epoll notification contexts via io_uring. Nested contexts has
been a source of issues on the epoll side, and there should not be a
need to support them from io_uring. The epoll io_uring side exists
mainly to facilitate a gradual migration from a notification based epoll
setup to an io_uring ditto.

This depends on prep patches that were staged via Christian's tree, that
are now upstream.

Please pull!


The following changes since commit 6ece1a31c58c8c8293ecbbe79d7f92d52e1b0022:

  Merge patch series "io_uring related epoll cleanups" (2026-05-15 17:41:05 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/for-7.2/io_uring-epoll-20260616

for you to fetch changes up to cfa1539b24aff18ecb71c6334e7270f810d145bb:

  io_uring/epoll: disallow adding an epoll file to an epoll context (2026-05-15 09:57:41 -0600)

----------------------------------------------------------------
for-7.2/io_uring-epoll-20260616

----------------------------------------------------------------
Jens Axboe (3):
      Merge branch 'vfs-7.2.eventpoll' of git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs into for-7.2/io_uring-epoll
      io_uring/epoll: switch to using do_epoll_ctl_file() interface
      io_uring/epoll: disallow adding an epoll file to an epoll context

 io_uring/epoll.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

-- 
Jens Axboe

