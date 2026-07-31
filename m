Received: from mail-oa2-f1.google.com (mail-oa2-f1.google.com [74.125.231.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B083750BC
	for <io-uring@vger.kernel.org>; Fri, 31 Jul 2026 21:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785534226; cv=none; b=KLCM9WJ1pdetvzp1t8iz88qXt0JxTOm8gYAIKy4ziFCk29fnRj28GMukjwBOzSWbKwzey+QYwTchBJUg7YjaWw7oYmzGYFoq6gms40jDh7VwEQF1OsI6ycdAaEuk5Ryb5FExyPblEDjQxfOG5qtPd0+UQiVSf+AjmUBz7sLnHB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785534226; c=relaxed/simple;
	bh=4o/kMB5JHCUjyXYmZZFW9slHgUIDDr76xT34v1VnjYM=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Cc:Content-Type; b=Gw9WGUkv1MHADg4IYzL3p0TZZdfBEaLfAgAoTiWUFn+dJFpLlKXNSpYftl6525SWXApnV1L5lnjtOwGx7U7i4TPQHvaI+RwsJnIalVWlMzoqD28wF/SfpQG/O6jXKtW53F6e246Ti5acq4LieB0wGrpRqRvZNZ0GlJ9Cj69Wa0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=M3Br+cPT; arc=none smtp.client-ip=74.125.231.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="M3Br+cPT"
Received: by mail-oa2-f1.google.com with SMTP id 586e51a60fabf-448a12ddfb4so223729fac.1
        for <io-uring@vger.kernel.org>; Fri, 31 Jul 2026 14:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1785534223; x=1786139023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mFVp7tZM8zXbE9T3d2ReLuBbWzPL0/a6nHoQc3EFRnM=;
        b=M3Br+cPTfTGFeedfiZtKr31jJPFZNnunefiIZBJF0exKiS6qhwOUgmkASov2kjveli
         FrgTGgs4UAXFXKrMliPNzqJRm/atEpzSRzNq21jmXgutL7QVOyrCdnxQLOpvCGiysreu
         jBbE7LlPBe3xEX8dMZ1X1Nvi0uRPx8YbvXIFymvg9wnmVMoS4qpS5QWdCWtWvef/5b+n
         FBHN6eVJGnvGmFbPxbNB25X8CCsdDMTN9pT/BLKUD9noBpAHmhmwMGGME38wy+pYSWpC
         8+zm1tQ2xxLByb2SAWkcHuVwx1QakvMsbQVCWRcaEat0Z0EALiF+82bzkpWywq1ip/L5
         u/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785534223; x=1786139023;
        h=content-transfer-encoding:content-type:cc:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mFVp7tZM8zXbE9T3d2ReLuBbWzPL0/a6nHoQc3EFRnM=;
        b=YAva3woMP4+13eAkcxQXNbG9z83sFWWOOJAzwwCecAR27KEt9eCKYfoAhkaAuXBNM2
         E0rTSh+cKpPN+XfIMkjp61D6JL1IDrau9pxHBoMIC5Iy+JW7Ed05tk2knv4yWvTpYNSy
         ADGJBnMTFSQZMf5pCjTiHBESlk24g/LNckAhWR7OabG2YO2mcK58KMevSJH3a/98DuWq
         g5HxHG5oHWtbwsxvlU8FnJjhTFhkf2T3SGUQ6wE2mSPuZCN35NTj96wC7nIJO1Hj3+9F
         DNwPmQuoFPmpwHEF3ftq0doy3Qj58sT0Yj7HUWFsnxRDHrqFpZt0whVqBqebaNXhf1Zz
         vUjw==
X-Gm-Message-State: AOJu0Yz/8lMpooIE3S903TdJX6Snzc1rzMNVE635XKQvdO/HnYHkq4AU
	hVFluwHfo6aQaX5UOIPhpXBkC8ic1dfY/+AvEmx0z2d4h80kltxnNPf/IenWo2PJTOciEO7ypqB
	5O2rs37Azxt8l
X-Gm-Gg: AR+sD11h7F/RtuzZlpMDQ6tIyE0qcOWRXDfyP7l6PbfiQ9eP1PoG0z6COx4SXORJtU+
	YLI/G25lkXPNhuWySIDF8aKg6eTTUhHfMAcd8sqPi70vMLadx57w3eTYmcjaSho5BWGkgMK6wqV
	HXQiWVL2qQFJL3g/kVEqCtUt14vr70tMINUsTlqXXw/1kEvsE3vAkk+6zyo23rZ9pNyw/1Cipx2
	cOOU9lGgLc7eWxXYYmRl1CNC9CDs46316aBAwzoAQEDOCrVtbV5O+l+TyIVQ2DIbjlp5qX1bnkV
	KjW69DcCHJ/ndg7rQjLIi0G8vN2SxZ91OiFks87EXyO4bq33SU4c3spZWinrVnxxIOCL5wPcowZ
	LX1MtcOU0BCqYkIbbJOtB9UzBaGicsUZyATIuVJrln2MKN4hVDUsRZzZwtfIos69gaPNu7qP2Yz
	xdfE53cuhHFS/3KxA2p8nb8HPUioBFWPs+whUdHt2gVzCrzrg0QjlnIFaFJ2OYgL5z+HmcpdyuL
	No1z/jXOeuFJhRgTTWyhLdf2Z3H6o3qz7rFguyy9OltKQ==
X-Received: by 2002:a05:6808:4f11:b0:497:df42:1de8 with SMTP id 5614622812f47-4af5dfee500mr3360162b6e.1.1785534222679;
        Fri, 31 Jul 2026 14:43:42 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4af58d1112csm1608738b6e.5.2026.07.31.14.43.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 14:43:41 -0700 (PDT)
Message-ID: <39426415-ee12-47a4-b9ff-e4f475dcfcde@kernel.dk>
Date: Fri, 31 Jul 2026 15:43:40 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
From: Jens Axboe <axboe@kernel.dk>
Subject: [GIT PULL] io_uring fixes for 7.2-rc6
Cc: io-uring <io-uring@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Linus,

A few fixes for io_uring that should go into the 7.2 kernel release.
This pull request contains:

- Fix for a bug in how length caps are handled in multishot, and along
  with it, a generic fix for avoiding these kinds of conversion issues
  in the future.

- Ensure that task restrictions are always preserved across exec.

- Revert of the io_uring controlled epoll restriction, which disallowed
  nested contexts. Turns out that libuv is already using it like that,
  so we cannot simply remove it, sadly.

- Fix for a reference leak in the zcrx code.

Please pull!


The following changes since commit f5098b6bae761e346ebcd9da7f95622c04733cff:

  Linux 7.2-rc5 (2026-07-26 14:45:48 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.2-20260731

for you to fetch changes up to bc0e8faf90e776a2f1f3967a04e8091e6bdb4977:

  io_uring: preserve task restrictions across exec (2026-07-30 14:40:22 -0600)

----------------------------------------------------------------
io_uring-7.2-20260731

----------------------------------------------------------------
Jens Axboe (3):
      io_uring/net: initialize mshot_len for send
      io_uring/kbuf: cap buffer selection length at MAX_RW_COUNT
      Revert "io_uring/epoll: disallow adding an epoll file to an epoll context"

Kyumin Lee (1):
      io_uring: preserve task restrictions across exec

Woraphat Khiaodaeng (1):
      io_uring/zcrx: don't clear master_ctx from the import path

 io_uring/cancel.c | 2 +-
 io_uring/epoll.c  | 3 ---
 io_uring/kbuf.c   | 5 ++++-
 io_uring/net.c    | 1 +
 io_uring/tctx.c   | 7 ++++++-
 io_uring/tctx.h   | 1 +
 io_uring/zcrx.c   | 3 ++-
 7 files changed, 15 insertions(+), 7 deletions(-)

-- 
Jens Axboe

