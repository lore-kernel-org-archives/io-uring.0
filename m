Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEC7433BC1
	for <io-uring@vger.kernel.org>; Tue,  4 Aug 2026 13:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785848441; cv=none; b=BiDoBqFe9we24Qa79atphlawAVH3VqF9J8ne1wthsBSl/T6FVBwESV6v21xwLWxDqEXO82+gXJb5RelaPh4eR3h4VaMhT7F8oDLxFQgRyA/dC/BGuNc7kzajkhlubSSRXNVEWosNmeaIrzykbAsObic52U3IANMETyneKS2nEek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785848441; c=relaxed/simple;
	bh=ZArUxw9bYziUeO9DjSFlEmrEHR19mhW9P1kY0G1JwDo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=A/giVPd5/0x6L1KeoEgq3rwRoHh1+SaeL4uO63eGktUx6ReVE4fibZb52MDtecmrTjJf6EdvXfTkzFZpMY/2ZQg4M1Mu/7f4Vj9ucnEwsv0HHh/XIaKm7A4k4JogesQs+1aD5qTwQZ2eosMIwmM3PnEGS03YuKY1mSNi7qdzwJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=riwzQ5Vx; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="riwzQ5Vx"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6ae3faeb9c3so1679816eaf.1
        for <io-uring@vger.kernel.org>; Tue, 04 Aug 2026 06:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1785848439; x=1786453239; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=esQztOvye8C0iC33tB1B7gy5m42vkTB8iGVGoL4MhN8=;
        b=riwzQ5VxP+U2XzAKTSbMROM5RW1NlJ2ZiNX+ViQzMPjjNhMNzINesB0LUb4h4PoNn2
         il5GIovQIB2uBX6mFBnYcuJW7g9gjli79fP0/erYrF8EWeI2tsMMruHvLkv9VVu0GulX
         WxkJeJzm3rZhxGnhyJm7YHEVrX2UMF+tSLVaiYBIf5QsUgWE4l4gWK5WG9OmkRvAeqQZ
         v7eFLIoS+GaX1dsbguBLQK+qV5rrmJVSmutwgQs0kct4csed3OWrrEs1d0biekYuFxeK
         HJYfSSUCF0fCVkzfzum+EXc8mitiDZAYabmPLgK74rJbRHwI2s5o4lEZESu+/1damVM7
         JxKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785848439; x=1786453239;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=esQztOvye8C0iC33tB1B7gy5m42vkTB8iGVGoL4MhN8=;
        b=f9GW3PVB5zTgHoSfN/wA9HVRhx5BpHZohFej8/cPCGX6bo/+W1tie4ZcvhJ0cDWG9+
         jGuFf7NcW8Vf4rKQMf1U1lA05W3vNxw4G7fsN1kgnfEK+piWsHrvuRLv5+1c3EOZMQd4
         Rj6rRQlaKVOHptoK/gKF2AQ4C+Kb2zHig25BD4Iu+y8nbBQyQgp3fCMV5o6gS9Xz6OdG
         /CtvbD5MZc7TSS/fiJbAyEXsg9ocKZXKeFRD6FqsGhmqhG0u3O1JKzdKE9JZ9Xz4tgx6
         KbPGsOMfolQ+ameVFc3Y3uRFn7p3jsywlTp/j6WiHIeR2BdSluXfXdvCCAGvaGKXWMp8
         8A+g==
X-Forwarded-Encrypted: i=1; AHgh+RoC8eb6AdGPyChteYVrdojgEXEDcteTUCCAxCYA+iL9QrtNlqgbor7vlIYQMwK/+tv/xxy3ykfZRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1jrtb9qXzDGhKO5q+EFIudoinZX8x9iWvO18DmNUTPmsSz/ym
	VdhIup0yg52zgnwKa9sQurctTD6BLnSzYd4xMsfCwJNC1R1bYQBxFhF5DRkKIsln+w2BUQHaLb4
	1ChQgdY3IYg==
X-Gm-Gg: AR+sD12lPcFe8BeF0uBT/ZInJnO42fl0jg1+qbdgRqZ7Co81Gz58U6yPIW552e0zRCl
	nl7lSaTaAebXVnMioJOou6gd+41sKRl/RBEHgk5nUZRbSNTWcyMgbleqonJrgHgYh4bFC7nUy5T
	hjFevzn9jVGqZRVG+IvxlxY+Aq1CAmLhfd59yrGuPP9ei1PU5Z/AJ4LAJirGuMsKSdJGWyx5lRP
	ZKNPDYIg2QMwsIw4ANiC76btpCCknu8DZv+G9OIiEvckvIE7rD3rsUFNNnD9hUEF6sunx2sJT4U
	TWL7IX2Z82GZGjHnoNquhastyeQuwPokpgTLia4t49uGUxopnxh3VbxKcCj6xgg9DHhg27zY2Vi
	lejyskS28AaaeFr2bZE78tYdukEFcpTPwEV6MhqID9OLPs0IOKeJs6VSAMCroRbLLObgI0Ch46Y
	sv+VS408f4dgdm+zMCiLZAi/zhs4uSycOWkrH5KZ7JEBTOqIlu9lck52H957cipQpHAYZgM3DFC
	7HbYkOUpaMnu90VOAjcQXTDpL85wIaoK2RF8wgbPg==
X-Received: by 2002:a05:6820:2904:b0:6ac:b3b1:a5a4 with SMTP id 006d021491bc7-6ae42f5c8aamr21094013eaf.0.1785848438610;
        Tue, 04 Aug 2026 06:00:38 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ae93d61482sm61530eaf.7.2026.08.04.06.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 06:00:37 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>
Cc: Damien Le Moal <dlemoal@kernel.org>, linux-block@vger.kernel.org, 
 io-uring@vger.kernel.org
In-Reply-To: <20260804125038.740388-1-hch@lst.de>
References: <20260804125038.740388-1-hch@lst.de>
Subject: Re: add a ZONE_RESET_ALL uring cmd v2 (resend)
Message-Id: <178584843753.926496.12133768325371025674.b4-ty@b4>
Date: Tue, 04 Aug 2026 07:00:37 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Tue, 04 Aug 2026 05:50:16 -0700, Christoph Hellwig wrote:
> this series adds a new ZONE_RESET_ALL uring cmd, and cleans up the
> io_uring discard support and the block layer zone management code a
> little bit in preparation for that.
> 
> This command is useful to speed up workloads that need to initialize a
> large number (or even a small > 1 number) of disks.
> 
> [...]

Applied, thanks!

[1/6] block: remove a dead return statement in blk_zone_plug_bio
      commit: 858d0abdb890006af3eb81e53c438d69debf51b1
[2/6] block: allow REQ_NOWAIT zone management commands
      commit: 9451934953bf1a4cc8e88179082785f3de5e127a
[3/6] block: remove blk_zone_wplug_handle_zone_mgmt
      commit: f3dfaf68ea3691a388dcd4c86c249f4544cfa898
[4/6] block: also reject zone open / close on conventional zones
      commit: 13270876ce4eab47a218f31f0081885639011bb9
[5/6] block: remove most blkdev_cmd_discard arguments
      commit: b3c5f8d05e68963dea7c0cb9bc60e9e669b5c54e
[6/6] block: implement async io_uring zone reset all
      commit: ca8f6548e6f79761cba66ec8cb45bf026da8bf7d

Best regards,
-- 
Jens Axboe



