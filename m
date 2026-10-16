Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46E7381EB9
	for <io-uring@vger.kernel.org>; Fri, 16 Oct 2026 14:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160901; cv=none; b=qeJZ1mUOLuHeavXO2LK3e9/ByL7TTCJ5LyMnsnIi8TwpF578PUzYTmlq8FidZWu0TB+QrbiX68MGgXkBkkEAdJOw4PJ7tBCqrhsw5cbwbplOzSG3Spw6T7fh/3nRvpILRzigcHYsCYa8SXz0VSR320ThPJ2/0mnrBQRr7MFpTok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160901; c=relaxed/simple;
	bh=Cbnpk6Z2Kh5FYf2uSRupUg3VEKGPV0FhJQUd7YpjTVQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lgkL73T/xpk/rl2M6yrCnypjxuAGdC8EBRMW9QoAXFNJRg3X9Ui+zAh4ZLMWCtpZMxZcuBkSaTjsiq6KZSs32JVJCBYYVvWdRoTzKbx8XovsmPI1HHSmYgiTdfcKo/Ia26QFTG1vMioWOB+p/vNn/8exkmkcPJn8+JEc3BZq3XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=Msn0KVP5; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="Msn0KVP5"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35d7fa491deso24222eec.1
        for <io-uring@vger.kernel.org>; Fri, 16 Oct 2026 07:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792160900; x=1792765700; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RnUUwsz7Ni/EGP55kG3R7N5cal4ZwbaWIr1Y673vFW4=;
        b=Msn0KVP5GA51RDmYo5l9KFPkbJyCpZAsG7evfp27ZsUji+HSimJfDQWrjFmm7Fn8oF
         mBC8HKrrcdLV5bkMvCAbip8OUdIQF0MVLYR/9VwiE9EvFg1VuNjCivF9jmlwwFbG8M05
         lVB2dKN74/xjr5c2XrP5jYoipW96XKMyG4awvytDatQtEshRSIvl0f5e8zSh2WXC/4oO
         qJ5cI5EnLE5lIbB7dqj1VmGiFt9bpDpoguu5sU0opjS41+pui11+WwqGLx8gMKiq2NxZ
         ScwehT22bRJLke8uq7rtG6Fg5IUKiV+r9Za72fO81W/xPmoRadiJIbzD+qKjZhpCbXJL
         nesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792160900; x=1792765700;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RnUUwsz7Ni/EGP55kG3R7N5cal4ZwbaWIr1Y673vFW4=;
        b=HgTJvv+lqB0+zNxZcgZbcH22iz9U1PyOTgV/ySH1MVCLv1tlYR1OMaO4VPs6XnXKdn
         qgT193aKl7fuEwpBBKnM9rSHhsMXg/HUsvHhj4/yxWswMIDXjJDDIbROIYojq3GqEvIf
         8CBaUIovqvTRH0ACKsMHdSOKVwbziLZH3uX+xZjIZy+kvJmbeHQ0zNHgFdjzLCIAXFAY
         YwuWO7KFzH9wrAXuKNTW/Dt8UNjNG03o8EwZ9giVuMKLYhXjChQgmiMwTiKyoC4bSnJy
         bxWaZ5gz164ltx0+pBC1yrnvl5/9n/0WaQNiXd4B5kEuJK5OeOlY0ZJ+vokvNyn99J4a
         z6Bw==
X-Gm-Message-State: AFq9FYI1xbxd3pyDpw3r4ds9rGhf5Ka7sPDACkNFY6Hh6+jAnYS3zYP1
	ggAHE2lHLcpuIPmCtLMuL+s18DmRwvVB6xCW9v7e7d5FJrD2nimAx05PUg383OYVc7c=
X-Gm-Gg: AYBFou16f7ah6dH26fRfQ1Aij8444a0QJNzRBnpxJ+7Vw2rayH5EP1QYsXix6uaSFiH
	nacMOEwRZ2tSQxQeraj3M8mfnls2FKXl3CmCBisir7Mq5dhFK2B8sMLb72QD8cDgEYLenzyB24h
	dt0FtCm1WWgEDauDv/j3zFKYnsbccjCY3zzgNkVNSOUooVSWNwtQqNcop4zB/g1uwRF/ERaXGA9
	vli94SkzT0Z+GvaRDpkxVMqlpyfMWxUievTFJ+BG6bUz17rDJc6RWlepZD5LkcW04ldxdVP+Wpf
	f186akrqQKnLlgucc1ZNtzu8ESS2G4tBCnSzRnlHZJRldwmrs+Kj+w5UMqR77kXcqPAjrBOfssp
	FR8x0J/g4cjVLD6eIShX0fCqplfvEdbrXD3RAiFfmk9MhiJhi9ePAI3gX7+MYoy610ClpzKOmEU
	Q4ALsKOQoQwQrd60wLDUlw5u8RmAXV0Xrc5yHKwfrLfoV0Sr1Mp/Y11Cj+OUbEK+zTB2B+44JSE
	7yyRvxwTtQ00qEBbCvNtAhwrtLgZyGMnZCBcXqgzWz66S0MZARE4pnrcw==
X-Received: by 2002:a05:7300:6708:b0:351:77a3:55f1 with SMTP id 5a478bee46e88-3602eb94623mr3984668eec.19.1792160899122;
        Fri, 16 Oct 2026 07:28:19 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081bafa7asm7150945eec.14.2026.10.16.07.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:28:18 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>
Cc: Nitesh Shetty <nj.shetty@samsung.com>, 
 Kanchan Joshi <joshi.k@samsung.com>, Anuj Gupta <anuj20.g@samsung.com>, 
 Tushar Gohad <tushar.gohad@intel.com>, 
 William Power <william.power@intel.com>
In-Reply-To: <b76cf21ee0e2362489c864e43781b20d95fd75f7.1792142588.git.asml.silence@gmail.com>
References: <b76cf21ee0e2362489c864e43781b20d95fd75f7.1792142588.git.asml.silence@gmail.com>
Subject: Re: [PATCH] io_uring/dma-buf: allow cloning registered dma-bufs
Message-Id: <179216089822.2070939.2002360782198878485.b4-ty@b4>
Date: Fri, 16 Oct 2026 08:28:18 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Fri, 16 Oct 2026 10:26:55 +0100, Pavel Begunkov wrote:
> One problem that was brought up is that the file table size is often a
> limiting factor when working with dma-bufs, which is quite an old
> problem. With a single io_uring people can work it around by closing
> the dma-buf fd after registration, but for more complex cases we need
> a way to dynamically register it into another ring. We also need to
> deduplicate internal registrations as each creates a new attachment and
> related structures, which could involve large allocations and iommu
> mappings. Solve it by enabling io_uring buffer cloning.
> 
> [...]

Applied, thanks!

[1/1] io_uring/dma-buf: allow cloning registered dma-bufs
      commit: f57b957778a33d98e15e394ab426e93c3ead659c

Best regards,
-- 
Jens Axboe



