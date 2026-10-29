Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793289009;
	b=NOD2iOWjqsI2yYeT6Ju0bzSNFmUI1kDje1QNsCpmxz8Mw+7ppbr4t4Rdydmn9ERV5W1R
	 qfd9R+YOLCT8bZ8sk9ZU0wPhUCxMmC3+/FVbdDbEzQoGAggbhrPIxDUsy+X8Nh9+3UdD6
	 +asXbxVXcZ1Fny6zY/4y7ZmV0WIqkn+yGvIhsL1ldN/r/3X22aWpLB5bCS524bNRn+du3
	 fOqLXJoj617GAgKN3WkKJY4L0i7yBYwZnDSOB3bGBf0vhvYsA9rS4z6xuk6J5tnVwq5wL
	 Kkm/5Nq8uHo0Vsdno5MamFaxJEcJqGSiunfuXvUcGQzaIyqWwr1dmiqi7eSVOPqaOTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793289009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=KO2zCYqPM97Qlfn39fdTx9d78CfkFYYHVPWw93WarAo=;
	b=Ij11V9HUGQ/2OIgW3W3V5nvK1Uc9WAma4LqWr9xtnZ2IzoFy9d77hZ1Nijdis3Z81qi6
	 ETzeT00zsWgfZUi3aXFksYC0ouvKfnPBFx8na6XXlippzebMclp69U6pAhPyLIVbyiGDi
	 /be4nsQK6FpdIoYJ1CADjCmn7+JKx0WsOL/UQfB33pKDPTTQ8a6WhKE6ew23J+1R7CXWX
	 mWwwpbC6WOUCoe1jwBnvPwtUyyrVcHApQefG/NtTc9w0/muVykxZ/rg7V/Q2jVf1dgvBn
	 tQy1Q9EG2EQwHuH9IhCIz9Dz8EyLrBDTqIZ2RPRkE7fKGZCVKjdEs2pOGmsNGnD70VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=d04nNPdM;
	arc=none smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899D3606A31C
	for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 15:50:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 899D3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=d04nNPdM
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-4932b13c4ccso1386614fac.3
        for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 08:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793289007; x=1793893807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KO2zCYqPM97Qlfn39fdTx9d78CfkFYYHVPWw93WarAo=;
        b=d04nNPdMCFhdZh07rdXdALecsU4fJmwyvWTLaH34u3kWvbcz+0PYJU2U4bmYL4cFkb
         B9Tv5/73PMmPa/Z1c/iZTcbLsWovJDhaCfI7eWqeNLDOtHtF33jvcLCdTkTUK5df+161
         BW8INF6Dhaz6UY0VVpE7bKAp9p15nizULbqM2HWxjHY8MS7auDu/JkupScPAkFPxoYkK
         4DgRpAx/vgqCm8o4hrBQsfh4TN5QMi7f1pWDNjy7BiYkvOX45Spddc0y+RsoEk6g8mKH
         GWiTgJjzMNKYFsV44zfC0T5zxdxu00L+EJoU2hoQcPm5C+qb3pqWpDu3RwijOZjcE6Ge
         mwvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793289007; x=1793893807;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KO2zCYqPM97Qlfn39fdTx9d78CfkFYYHVPWw93WarAo=;
        b=uBwt8ouaaeWHDCdqpo1xQi7wE6mRwhMuXXSWrOFcoeUuoQrQQ6YUNf3krivzg4gRCf
         HVOAPju1pquFrRsjBuiwqylXdaIKA6SSPY25VRpmWlqL9dI0I0NcsWkCXsNBWZOG/bUD
         IHtSkTvXkLz5mDyl5wW/BmK6lrpzxuSDFX7WAliTNW6CyZbDiiSebI1AY1K0eiE1cPJy
         GpDLgQ91nY4j64TtXEid8EkiKrlw5ti8TIDr5oP1SsmiWgkdk6xRVm/b0tsiiTJ4iW+y
         dVKgNesML1lPK8jy7P9J2KR417b8SmqVWcJ6HbsaaI0GsJi88oYsDfDjD3VVNoDdb9J9
         qelA==
X-Gm-Message-State: AFq9FYJKPK7WcRttH7U943l1YmJsfAK73o9kALxgEZ4cT4803IcuN7ww
	ZfMJ0RfobLpQGm9+BfwNZy8ewahAJLcHrz0G3DT2WntqzpCBW//8BOy8xB0kzSoq88La0zU8Czf
	TDddES1U=
X-Gm-Gg: AYBFou3J1868Fio5sCB2o7KrwLWLNzDO987tK6sn4Lmem2eodDfqubRHPdXCvf3v47y
	Cv7OCsKdZ7K/+Sj6OEzWaSDRIUthZJtuzGh2lddUFThXDuj7Ohi4kZtXpcqxwL3TDzXEfAhSHFR
	NkdRKDYMsfav5BM6+elUjMqUo1i6CsCVkXpzdLHEnLiQy8WSr8b3a9pJ/VFifqloIf/8kFvpt/I
	OpzJkZjRaI6Z/+H5pmuSDAAJ2E1zsw1Dd4il8c0KccJyN5JrRezEC40dhst7xvCLAvpwo5TR8Xu
	i09GDktQg0l753xCnXP1m1PUKa7G9BJZnJak7LH+kECJUQuPlT2MYZ7cMaPHQ3x4qV0XMoOYLxI
	80XBqIrl1rBp8rF8icvviv0V8xi9qqYA+BlBDTToj6bEfv5rH6JQ2UFXnAlczXgkWM331/uiH7X
	TpmI85hRfUu4IgRysduBv4w0cIXuJZJFfN67PVXygvO/4U82lKcMelHPvQWi3wPPI/zLiGgIql+
	92rJ0+2ztVeOMx6KtFqMaD6spzZ6oKxuh+Fy7FKD8EhijLYms5JYjG552Mg/xHAFL56CBcDklfj
	2408njp0u5FRY+i5XnIb3U7hYBRghWVCfg79Byyl5OXaEvFpFOgwLqpF3htBSl71KG7z8DxmZuX
	BebUJHUG7rB8=
X-Received: by 2002:a05:6870:9f08:b0:475:e235:905 with SMTP id 586e51a60fabf-4a8bba79bfcmr3909108fac.35.1793289007293;
        Thu, 29 Oct 2026 08:50:07 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a901ff3779sm124024fac.4.2026.10.29.08.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:50:06 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Cheng Yongkang <teel4res@gmail.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <179328314078.648427.13761781546953594668@gmail.com>
References: <179328314078.648427.13761781546953594668@gmail.com>
Subject: Re: [PATCH] io_uring/timeout: count cancelled timeouts in
 cq_timeouts
Message-Id: <179328900650.1492023.7191895676873527353.b4-ty@b4>
Date: Thu, 29 Oct 2026 09:50:06 -0600
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Thu, 29 Oct 2026 07:12:20 -0700, Cheng Yongkang wrote:
> io_timeout_cancel() posts the cancelled timeout's -ECANCELED CQE without
> advancing ctx->cq_timeouts.  io_timeout_fn() and io_kill_timeout()
> advance it for every timeout CQE they post, and io_flush_timeouts()
> computes the number of non-timeout completions as
> 
>     seq = cached_cq_tail - cq_timeouts
> 
> [...]

Applied, thanks!

[1/1] io_uring/timeout: count cancelled timeouts in cq_timeouts
      commit: 1c8b49851543f41fc8bb18bcd1f15cc93d14b530

Best regards,
-- 
Jens Axboe



