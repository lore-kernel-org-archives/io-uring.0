Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB8D3659FD
	for <io-uring@vger.kernel.org>; Mon, 22 Jun 2026 21:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782162900; cv=none; b=Jj17972Ty7FyPyKeNvO0oCaFMu503TbQXEbQUq/lbBN1gQJJggHMF47HB50G3fst/sv8g8tZUSkCwBKxjCVziBR0FpY9W4soAuH0u3eljRxkF8ebaOI6B+LcIwWJvOFefhE4MdqNIqdh2BAfoZj6ia2xrFEaV7FlMij5PrOebKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782162900; c=relaxed/simple;
	bh=yYzF34EEf9UeVw3Wewl3ZrMgfGs99N5U51ooLzlZ8NM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cXN5pAiWEG5i4zem7+JKVCY5e+Hc9ZwMynVpCi3bpZufxMzv0nlY1w99Yi3HdTJAXIJGC6B15yj/5yzDamV+Wf9N6IzQuMkAesTvPA6QMPxSfpag8WDZPaPil+ddJ5JnYF2Sk8YHq7NVIeuwfFyLfWVLgBM4TeeikizdIOsj6qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=qCBaXwIX; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="qCBaXwIX"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8dd21386a9aso42252646d6.2
        for <io-uring@vger.kernel.org>; Mon, 22 Jun 2026 14:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1782162897; x=1782767697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3G8naCToAbITiqNZ/ZZF0ALS3MOMsS1Z8DWN2VdXaB0=;
        b=qCBaXwIXchJlDDls9FMmjj7/JRwu+/jCU1XBE9aGeAhu4YyuUunvm4/UAFTRY5hKRl
         6ZTHmGqTqSjmKpJHNVS8tbhI1iUXv6AL2ir7imwXSaLyEX4qZkUKAZDMfx9kWSYrUF57
         vQN21RUQhhOC+ijA+6zoPu9m9q/oYabt0ELg4EOFBWg5pSNjzWQQjhyXUyBUlbtrMLg2
         BDFfWNl98PGu5GXs6LvqljdF6bVYlF2+6NCQjEbW79p+Hbs7D+f/rXGQ2/RSBorw0W7s
         yItp6peUamsthXaCy8S5I0PeogDY461bLL3Yx8RMrD2M9hmatp0PmpWE3jG+ZJ57O8Pe
         bBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782162897; x=1782767697;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3G8naCToAbITiqNZ/ZZF0ALS3MOMsS1Z8DWN2VdXaB0=;
        b=nUKS230PDxjN4gOvRwyTRHnH/SwT+xDjR7hzC+RNyX30OXIQriuob9I0o2Re7tRbhm
         VFMWzQx1+OdLNwm6mxI+B+T5gXrUfOUrHBmQYSP16APtFYz4Rs4hsIHYYmUH8p7kKNz6
         Gpc8ZFelCVcUebOhMgGkO3L8QALfrlw9bDGX00Trdj2A2kAXbACdFAtcGmiIDd1vC+i0
         G6yGn71okH4fYRTRft5Pw6V/DrD4A3SnzokJag5HQFFKo4vgkNvQT3PICs5xdeSE9zlD
         ESApb55RyOzV7D8Q8tOkR2U8tSnM3wmJviZ/3HJVa+fQeSVKEsLJcoZrsmv8Ylz4qlP7
         ECiw==
X-Gm-Message-State: AOJu0YwlRSZh04P85lU00kKZmj3WP6RTPblH1F+p5T6Djj3Y3e33iTaf
	lZvq2s2bDNSFYBkVi9y51i1z2RTQ1I6gGMkk2/ruUFXYPK6lXTQnToMiggwaCnqZKB0rTGp+y5e
	hawseCqk=
X-Gm-Gg: AfdE7ckYMgU2Az6w9Kx5gab9RP8P2W7PxS6NMtGhvVpPFvz0LeaBZxaXa8Mbf5q8rMz
	fJiqu76ba+tcG7S16Obp9WW0kuiQhX6XB1Syoj8qYTo15YFBDVPHDhpRLC6kZ1fKknKgk1UY+lb
	LoFsewKoyasWgYbyvF+7zCqH/6skofjUsXwJQ/kmQVSi8vdnHZbKpnA+slYMtwVBYsMO2citRUn
	n5/3Oh3o+4v0oz3JVZ68RISna00ehV/sKLMWx4C9/qWSNNOxh6OCfxlAEZET72kRSwPxJVTcVdZ
	p1omf6/m8PcBBwaKGk+GII3Mt+nGyPGO46grXz1NahZVauQy5PxVl2FY57EFAPDddVxpAhh2LQh
	36lsbHBeCvVJv6ChM4zdhhZowskSkFq5eKzen6m9qczdTnBnmaYmxOPJDjeBAW7s+7xWVFPW/pT
	qKM1BoMgoI56Du0RulZSPzbRyggfmL+9djJ8M=
X-Received: by 2002:a0c:f6c4:0:b0:8db:3bf7:7aae with SMTP id 6a1803df08f44-8de3e7ef8fdmr219524146d6.35.1782162897045;
        Mon, 22 Jun 2026 14:14:57 -0700 (PDT)
Received: from [127.0.0.1] ([99.196.128.58])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df82b67affsm106912866d6.45.2026.06.22.14.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 14:14:56 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzbot+f99b00a963915b6b52c6@syzkaller.appspotmail.com
In-Reply-To: <20260621012933.50571-1-kartikey406@gmail.com>
References: <20260621012933.50571-1-kartikey406@gmail.com>
Subject: Re: [PATCH] io_uring/memmap: bound io_pin_pages() by page array
 byte size
Message-Id: <178216289049.99876.2987989144128669864.b4-ty@b4>
Date: Mon, 22 Jun 2026 15:14:50 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Sun, 21 Jun 2026 06:59:33 +0530, Deepanshu Kartikey wrote:
> io_pin_pages() checks that nr_pages does not exceed INT_MAX, then
> allocates a struct page * array of nr_pages entries. kvmalloc() limits
> allocations to INT_MAX bytes, but the check counts pages, not bytes.
> On 64-bit each entry is 8 bytes, so the array hits the INT_MAX byte
> limit at INT_MAX / sizeof(struct page *) pages, well before the page
> count check fires.
> 
> [...]

Applied, thanks!

[1/1] io_uring/memmap: bound io_pin_pages() by page array byte size
      commit: 3996771b8f759729cba0a28007438c085f814d61

Best regards,
-- 
Jens Axboe



