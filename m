Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6430F4B0481
	for <io-uring@vger.kernel.org>; Sun, 16 Aug 2026 00:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786838470; cv=none; b=JhU8fe8rEmxpkkCDqhdOJxDYdD6jitqV9fC4Tg4kQXzGSMwKTXVtgeQ9uMUoveGHoOiNVKYivlBiu0QB2GxXZUXR6Z8t9X3z2DXhyiUnHO37pbQXfromEwDMLbLpZZQZwVH/+4bJVLskDyo+vY/drzKo8cJ9lpb0mGDl6/5Ue/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786838470; c=relaxed/simple;
	bh=6bnHVJopE3wzGGHQ5c7zdl8TF0aztoHK26Sn7dRAMNM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VwgSdq9lr3Svu2PvoxX58fDYWdMkBq46B15TlBeH4TcMSp3efvO5pFneNYamoDbpxOlc2NziPJ7KOSQK/JnZ3cj8/QXzwtEa5C6Ie86Hm0JiyjV3pmKju7sfunt1W138qyaugjU+CJl9f0YN4w13xZ11io/ey4IPoTCLHKALxY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=02o0cbY+; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="02o0cbY+"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7f3ff92cf4aso320439a34.1
        for <io-uring@vger.kernel.org>; Sat, 15 Aug 2026 17:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1786838467; x=1787443267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ZgqbqCfZYpSomXp/sEGeXCqrHIJkO1ngVp9b5m2Rtk=;
        b=02o0cbY+lTu6LcgHz9L72sdH4lEFP3GK6V1hf7X5ITi1qeleDiJVooD6Bv+8syAvfM
         GjnYaVfJVTnOEeTPPnKDGYoRqJVafp+rH0PnlRbHUOS0D82EmCqMgKCrw9y1heQAew9x
         q+Aj3nRfqmMuHKmjFTUZIZnkzoJod1bpOEvU5DZ91kaj/61tVzixwosePuZR9PCTXEhA
         k3ZxuFsqVo8uG8jraY2E0nrkYFhaJTpUpaL9w/P2eHEencYstyBE/xX6cHVAl2GT2wQW
         ZAnwT7pSYJPGpS5Vt6/35dQ425g3LGQkMjKAir4UYGQ0LvVznGeJjxNghCKBpaLIPLX0
         nVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786838467; x=1787443267;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ZgqbqCfZYpSomXp/sEGeXCqrHIJkO1ngVp9b5m2Rtk=;
        b=dv6W8jEprRcxE8PYXt4O7eikjUp1EPJ/7mFT4sPHhNhLpythYFVTgBNiftaCvMMjcx
         1JDbDTAJPBaabssXjzsydjIPw4Wpt44g/VQ4TLsLJctDLqdioS3Lsqg9P7+l8kXmGDPW
         Grk5OuLkfLvu9l7D0gjhsT+mY9iuhlfAkeuzyIIBe4ABuPoi8sUv9jR/fqA0Ir2bucuH
         OzZnjOZN7ocAZr6Hw5V42HZMXOSUHz12HYL3x4A/La3vCI7mk3lR+KKrn167X2FcYnh5
         7FrmLe2ujmDRQodPpwV//BvnIyEWqPNHOdBR40Hl4MdKfh00KZnCp9g5jQ8Aabn2kvjL
         qOtA==
X-Forwarded-Encrypted: i=1; AHgh+RpufuuEpMOIXJAxPEx5s+mU8Yad/9Xvh4/qsVSc/LKd9iqETebbfhnUKbqRhlLISoTEAuv7/TRcLg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7nqNPXeSVBfAXE6kVeE8zIazoNQcDeqjL+ssj+3NBBydkayJ+
	BEjLUM+Ea8GMCf4NBxUMmuqByZtd+2XkHBiJKJRH2WN6Nrmo/ryNLqdOCz6ACPqCpnc=
X-Gm-Gg: AR+sD121EDxlO/IKGMLLFY5Ce3IS/KH8jkbQGHKLD5a4SH0mOauWeggn1NLyi+NP/DA
	l82SFcMArx8UdBv3hlgEgzpFxDVztyQ/xMsAQSSjzjU+VvbQ+kVNStQk5ZOob5IrfZQxocLha99
	OCPCj9WaSy7UcfCXbWrg4b6zZloGYLjCK2sjUbIWotbpnAwZgJCHT83bLM21a1vVoXxa4n4ZS4n
	fuDaRlnZZH3GHoTkSSma3okQn9XHucqXJXJYe8AOxE9m+FU4mn2vsuKihPQ0ijYgSNoKA+f+rtG
	sQdVA3SCzX10O6zBdABp7CvslueKCP1bOt7GvIX5GyPRw/4vWDs2XQbldWfJDc9ta1DR/9+CjST
	SlP1lyGOsmP6+3TvJzxtufoEAv0+XSdzyzLG67qAd7aEvrcJjEigisQRF2QN1VRXpNfZzoNOTWz
	nO4d6Xg6k9nyKzvludNBp7jSeONjyIFUdh0n+lV9g3lulSPEaaX0c6Zz1skd9y7fQzbGQ3RQcYV
	4rCS+q3OIpNcVAStSNeKEYFpjkRADIqKo43LvtuYg==
X-Received: by 2002:a05:6830:11c2:b0:7f3:ff22:d8 with SMTP id 46e09a7af769-7f3ff2257admr3373780a34.9.1786838467321;
        Sat, 15 Aug 2026 17:01:07 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f3e86285e4sm4599713a34.16.2026.08.15.17.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 17:01:06 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Ali Ahmet Memis <ali@iusegentoo.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>, 
 Gabriel Krisman Bertazi <krisman@suse.de>, io-uring@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260806180044.275543-1-ali@iusegentoo.com>
References: <20260806180044.275543-1-ali@iusegentoo.com>
Subject: Re: [PATCH] io_uring/memmap: account the pages a compound region
 really uses
Message-Id: <178683846555.1984124.1583533999449071565.b4-ty@b4>
Date: Sat, 15 Aug 2026 18:01:05 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Thu, 06 Aug 2026 18:00:44 +0000, Ali Ahmet Memis wrote:
> io_mem_alloc_compound() allocates get_order(size) pages, which rounds a
> region size that is not a power of two up to the next order. The pages
> past the region are part of the same allocation and cannot be used for
> anything else, but io_create_region() accounts reg->size >> PAGE_SHIFT,
> so they are never charged against RLIMIT_MEMLOCK. For a ring with 4096
> SQ entries and the default CQ size the region is 37 pages while the
> allocation is 64.
> 
> [...]

Applied, thanks!

[1/1] io_uring/memmap: account the pages a compound region really uses
      commit: f12f0234cc14886bcfd53ffb7c8df4216dad51f1

Best regards,
-- 
Jens Axboe



