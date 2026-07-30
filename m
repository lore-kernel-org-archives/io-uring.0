Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE301388379
	for <io-uring@vger.kernel.org>; Thu, 30 Jul 2026 19:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785439172; cv=none; b=NH9qXOtaXHxWbeu4jHbxZ1EMBAe1lUZ0AGMJVDcEeZu7ladL1/DE4klHhfTu3VtEy++fKgMWN/WxKBzty4rbqA1330kS4/beCcDFLfl6maHbDHwS1ZUqthUuLe/HgBidWMRw0xZa+srb24fFgpIlBIFVCNekCZKkZb03XMGBti4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785439172; c=relaxed/simple;
	bh=Q1iiFaln+XNj+7FuhzOkHN74KT0vodetzmC+U9GmQmI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=c4SIx6OJ/i68tH4Rt/ecPbGXRV4dhhkU0mcGLKxE5APWKo/hUyR4NA+Q6EmeapH2N9jzpMrTkqs9pUeXsr4VP0qJVnm5aoOfGPAc8L6kSnQIh/eGPzzlLzT7GEKq3dtsAooZjDt9f+YQQvQpLZ8n1wdTlPtUF06nmmcXWJQI4EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=sAMGrRF9; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="sAMGrRF9"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6ab0223a3d3so35459eaf.3
        for <io-uring@vger.kernel.org>; Thu, 30 Jul 2026 12:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1785439170; x=1786043970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Pm/oFDGKJ/5FTVwcNH38hLiPGOElDEoWCGChjirSRU=;
        b=sAMGrRF9V3rhEdSCQrtgpUX5q90Y1c08DCBazGqR0G2eh1ywhYUpyHovwIR3niDNQn
         l9P3Z1RZrCFVWHI84GxMHl6XCaF4cEEWhh/J3lSCHTbrrOU+ZGa6wDNsmqzJJOv4qlBd
         LOSMbhI0XNgVoTXLzJ7g5dKrmx51bSM+fNE0+e0RX5uvJnwymXjYLEmn8XbUwnqsLlxr
         57QKGeiM3HuMtRyxUtFLD0RkRFesZcBQETHuYPkPBs2Ju7k8SiUKB6aoBNjnmJ+w05j7
         bHsAeIGGqMxW9n9+SZvzglWQTz/rraW5udckJ3glj0ck/Ah+b+BCQs8A4VgGow9CU6Gh
         7Zug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785439170; x=1786043970;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Pm/oFDGKJ/5FTVwcNH38hLiPGOElDEoWCGChjirSRU=;
        b=YZaQksJ71IFxxGt4NYmUaseWQmOaDIpZsmKLhn/EAuQ2rziOI/ckWMjVI79eW+0FtA
         xJw/frHARLEnBU05fUOe3KHod3jVjxTmgp6BYHxEOqwOBCR5SOl0hzz8wqlRo36YFM5A
         UxAmndhJyo/w7tEeXA0tOae4jLa+rvL7cZGeoLcigEab/0gXXR3eycsbT1EI+AtvttrV
         SGugnf+DFtXJOgaN6OyfXuBTyc/iw/slzhXx7RjkEPfXXDDj9kxm5xWUmCbQ6iZcDvPb
         a6fKdL9AwQHYAjQH2AQGLNI1/4y3GdBZgb8tOSm7yf/f5iLNahp9qcHPqqDBr/7Yl1nR
         Cbnw==
X-Gm-Message-State: AOJu0YzKspNqrhiySv4JRokKi3MCCFW6TU4UITP/o8vBccBM6Z7L0fUU
	8DKpD0vnF85ZrPUGNKRbE5eQLgpynkDofVQQZ+6JIcyRoJQofXpmlVtjHisQjCVbozw=
X-Gm-Gg: AR+sD13v5KFSZLmw/Jcex5soODCTBhf3wamM4kPwq/jr9FUBhUakC5TtjI1EdarzAg0
	Tkos8aDdEBGm6sD6RP9fhcWCQsG9ybPWeXMk3eA/w/VYfHnYfVWs0gn/iK0ryFuLYXO67/Dr/R0
	hOewojtdDQ9RlH/NwpfK9RU4MO47/6xyXaIWEDq4KXFPPXgy2ujCSyYmDyaJVH2D9RMQCiVTAm+
	SLqIAaPCi/bDlSClL667ql6Thv2Jku/8HI6tDprpeF+TWPKYbVeCw84a9lH9V4wygHzVp+F90Xg
	tsSEpTFMbd8COlU1YnZi8U9ImJ5cb7IiXF4Z03Jg7ImokFUTGikZNwYQyr6oKbiPkaw96fAdH3k
	6GEO63Iajr2yg5G8LhOwZZAInFc7lWcfkGVYJG+ieHOBgbM7Kh8DV+tJPxqNmu2gYmbA1T2OyDK
	6JfmUvseMw06cWB4XZLJQPMkXIV+Y3i17SoMMc5xAQjll5FT4h9UCGRkq7VmMCeuVKGyTO90zO4
	MBafmdQCy4iA7VwvPhb8PmlUUDQ2Y5w3EJ6xWN6hP0G/ZU8hm5GSg==
X-Received: by 2002:a05:6820:1798:b0:6aa:db9f:6b89 with SMTP id 006d021491bc7-6acbc01fa5dmr2627187eaf.21.1785439169501;
        Thu, 30 Jul 2026 12:19:29 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458c2948e5fsm2934332fac.9.2026.07.30.12.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 12:19:28 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260702184847.1709378-1-csander@purestorage.com>
References: <20260702184847.1709378-1-csander@purestorage.com>
Subject: Re: [PATCH] io_uring/uring_cmd: skip io_uring_cmd_issue_blocking()
 task work
Message-Id: <178543916857.3222099.17373777385212092241.b4-ty@b4>
Date: Thu, 30 Jul 2026 13:19:28 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Thu, 02 Jul 2026 12:48:45 -0600, Caleb Sander Mateos wrote:
> io_uring_cmd_issue_blocking() is only called from blk_cmd_complete(),
> which is already a task work callback. However, it queues another task
> work item, to call io_queue_iowq(). Just call io_queue_iowq() directly
> to skip the CPU cost and latency of the redundant task work proxying.

Applied, thanks!

[1/1] io_uring/uring_cmd: skip io_uring_cmd_issue_blocking() task work
      commit: 13b0742fd05864384724710c1bb12643b5448015

Best regards,
-- 
Jens Axboe



