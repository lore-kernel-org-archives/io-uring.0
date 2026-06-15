Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30034423A63
	for <io-uring@vger.kernel.org>; Mon, 15 Jun 2026 16:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781539881; cv=none; b=Ev0uWTdz0nsDZ9tABOM6Pe5TXEaXGgSRouM0JYR653yBJbPqdWSUPxXPrW2DyRc68LIiXfQiByfa/5t0zj81heJJCadQKVC9617A7IqaZ6SzN8ED2iVeOw+mFzAH6l8bow3+Q98kJP3c+vVkquf2OOEPjxp10mI8Ss993+MSYlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781539881; c=relaxed/simple;
	bh=wqIt6saHPhMdkJBMnLipTTklcvTU/yniiwyGxY/ob2M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IamDsnBpU1S1pC6En2tvr78/BIkG8OtweFLCqv5IvA2mjKLfHnTBXWSys9gZVAMZfsh3yc13VsiVy8U4M3DOYu6CasP4qFOJy/GDtNjRHqlAHVfbiuFDfPkVLYIsNb9mG1iYiDj17ljZpV4bCKOt/HmxsZblR/ROYJpZLiJK3fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=BjsnhmZK; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="BjsnhmZK"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-48611ccd5aeso2230204b6e.2
        for <io-uring@vger.kernel.org>; Mon, 15 Jun 2026 09:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1781539879; x=1782144679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3yyIsktHc3qz5wJjmlj/4EkYbwwn/XasOo0abgiHtZc=;
        b=BjsnhmZKtUy3Z8budbn2af53I8ud/DDmIRZ/6VfUhJFlRX7wqvyJ29S290WEz6aqhQ
         TtB87LuJnaG/6Ja30w0ZMQDGdEKPOQXHXebUqPx8NRyJgX0Z6kIoGhMC/fRreQqUL6b6
         0HaeLYstCA8WBSsX8XGLeGt4C9YnR46swzbD2FTLMnoNkQZjz1Y3bTQo5tgA+A2DTSuh
         ch1Ja0CAZgqYLfiJkI/076IFEg5VGRWVTYGEcwReTTUwVjoBMHtWsMQe2GnXBjz5dSAn
         xbep3sUeBkl1XP5yuor407wK2gYs0zV57oV6Ov1cmtN9dY/JWC+ycZ6PW7Uck5HnCMwc
         G3iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781539879; x=1782144679;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3yyIsktHc3qz5wJjmlj/4EkYbwwn/XasOo0abgiHtZc=;
        b=RRRGnWfKrQi4tdw7ZdTd+5uXwkQCpt53QMN9g/6dVFUx1QM2m/DRW73jqK3u8S6bd4
         Igw15j4p6j49Z5iTruRoYAULWGtYrpXr0BPe2UYE/JyW/1z7EC5YQDTvAV36QBrlDNl8
         OFjV/mVxgZHImYTkRyblGPs4jz9ZSfDUx9okFJRYJIZguEElBP6tIr9KWwFJLFN8ui/J
         rkpktCYOnJ5jbxTBO6pnIKVHZM4BRf/0Z3oCH0b7Zsle30/NYU0Z7H/UY67w64x26war
         2OBoIt6aehDvVnUoQqYe3kGNmnV+cgrH/lx1+7v230XjmtRZQzynM/oei1TaFcBpB87U
         ET5A==
X-Gm-Message-State: AOJu0YxWzvZUk3c0BhyT4OHYGXCiLQoETxfPa251D04WpwUF5/GxG8a6
	y5GbIgZAuB5LXCOzlWkFWnV/mG/tWmlVowg2hHCQrbuQDh+nzNx/hsj68UtdjZgml6HYP9EyG4K
	+yUH1BGg=
X-Gm-Gg: Acq92OGEZXetNVX0ssEuKbUDv80g8fPvhF+AQSTYOn/2jl7eu5va9J9JMADsLzfBJaV
	zsqQCS7SSNbMB9i2Ak6htII34sApa/Fg+yJkWaDJQ1Za5IUsq4dXX9sqIXzTfPK9b7N+ONCRdj4
	0V2+kWPQQgP5n1Zd8UqEO+6OdS+jHbC6WxyDAnniv2WTp8CRxB3eZ3CjBj3NtHh7diQTHt/3vXo
	xnIE3yOAJQJfY6OYSsYCaFbNkFGSTSdE3UoAIAVg/7sr7QFQnEf9lYwBlv15OU5UJNxA++e0VW9
	2WWyvDz6kyTwemmtL02xTSLPGOHSS1SjkrcFadJAe1ijYaT79xwYi24+W8ypInv5CQIGfxAMc75
	7qdnB0VhQmXlfQrawGwU1ZJMTMoAH3EM2EaXb+NqOo5Y8Y6ffCZpkdHzYEbuaBATsSPeJUAkjSa
	XE2sTenVLDInSDQ6/AuedVc2IH87n4zAkIIB4r4OiGRAtYEHDJql2U8/h1ZjSDb/17LgBcM/z/e
	/Q=
X-Received: by 2002:a05:6809:2cc:10b0:487:4d4e:bcf3 with SMTP id 5614622812f47-4874d4ebfe3mr4357440b6e.9.1781539879241;
        Mon, 15 Jun 2026 09:11:19 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e79f6fb5edsm4581811a34.26.2026.06.15.09.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:11:18 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Vasileios Almpanis <vasilisalmpanis@gmail.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260615144619.482749-1-vasilisalmpanis@gmail.com>
References: <20260615144619.482749-1-vasilisalmpanis@gmail.com>
Subject: Re: [PATCH] io_uring/nop: fix file reference leak with
 IOSQE_FIXED_FILE
Message-Id: <178153987848.2073745.8254643716156280437.b4-ty@b4>
Date: Mon, 15 Jun 2026 10:11:18 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Mon, 15 Jun 2026 16:45:57 +0200, Vasileios Almpanis wrote:
> NOP file-acquisition support choses between a fixed (registered) file and
> a normal fget()'d file based on its own IORING_NOP_FIXED_FILE flag in
> sqe->nop_flags. However, a request's REQ_F_FIXED_FILE is set
> independently from the generic IOSQE_FIXED_FILE sqe flag during request
> init, before the issue handler runs.
> 
> If a NOP is submitted with IOSQE_FIXED_FILE set (so REQ_F_FIXED_FILE is
> set) but without IORING_NOP_FIXED_FILE, io_nop() takes the normal path
> and grabs a real reference via io_file_get_normal(). On completion,
> io_put_file() only drops the reference when REQ_F_FIXED_FILE is clear,
> so the fget()'d file is never released and leaks:
> 
> [...]

Applied, thanks!

[1/1] io_uring/nop: fix file reference leak with IOSQE_FIXED_FILE
      commit: 1abb79a6afcfb45a46e1f4cd99321e561a46a444

Best regards,
-- 
Jens Axboe



