Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793809115;
	b=aewGYH9+/DKn2E6ujOO2Pm04GPUC/46ZRYC1aBiPU6HHT6WOu5GuYnZ2Qk0BxFc4Ml70
	 pGbs8pPyASLnqoKUflO0SfEYPKC6Fguko2pWpWuszbIX9xOTRXEJIjOBy3IN6n3UrpA9b
	 kSaFNs3mVPyZH9huVgRZw0YXa0CLkMWynM/GDae3n7UkMYQrh6vRztIpEJYk7Rc8vVr7c
	 E6X3yLtLpsS/H8zvQKWY1pzWLKdJ8oUyEx6HcQKGieHwgTA0VEMWU5eXSf1XSGLRd3r15
	 RcJjvUUypmVzri5pDo1EZLgP5aY1zQb9EtjC+innjTG8LVPPxtuJ62cC9TVmWHdpGDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793809115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=Ll065Iwva0dmxU/IZy6URbTXN/3yl3VrT+LTedVkzNk=;
	b=GzYqD0K8dgrgO7rHz8YrfoX/UBGCWk/z9qMI8kXbNp3ieRzkq1L0w9p112Rr+450mxOB
	 0sV9bYwH1WtASUZHZeiy4f8wzHuuGi9Yp1be8NCYZ8khAUiteB+3wWmycpn9MmNh+RuNa
	 go8uXZ1RdtSKnFtRoXifCjr/uwoPtUBgf1B2MSJk48etJ1VPRRKeeedd2ij6auAW7LylI
	 npzDd6gMoelAA2ivasKqT6KLfEtAeE5WRPeyRn7sCWQ+6SMC/ZuKpD+zGnFQdP4aJCeyW
	 HsOlUlDqE3lEvY3USccRoK+SlHgg/v3T7v0vMbTc1fapA4gkZATmBcweiYsWvl/QX9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=eCwhvCcH;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B02606EE9D
	for <io-uring@vger.kernel.org>; Wed,  4 Nov 2026 16:18:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43B02606EE9D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=eCwhvCcH
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6df5e315bd1so735539eaf.2
        for <io-uring@vger.kernel.org>; Wed, 04 Nov 2026 08:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793809114; x=1794413914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ll065Iwva0dmxU/IZy6URbTXN/3yl3VrT+LTedVkzNk=;
        b=eCwhvCcHuVOutn8KRFUSn8HUBBSJoNUSAVZI9FHQ8E1galHlsXe2BKEEl/W8WFlwst
         bK7PDz9N0DMGEiORCqTPgfxVEQu/mVtGxootoadDh7sjD+yrUcfhap5i9USb2aQOvpl4
         68ur+HHUXyEqDHPelYBDpgni93culBTEstSNxshczYMeANm5Y331cpbSsEhPQSI462Uv
         EBqG3ccwyRRcjASkyNDBaulNVrft39PFITfzEyGr+2nlz2OWaYlyG1fSLhI09eqXI3i6
         d1W5Fb3y8hRowgYdd9d5VbvGolHaVm1qyd/IVnbc5o+JiszNxrb8NUJ+8tnLDmHHV13b
         pd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793809114; x=1794413914;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ll065Iwva0dmxU/IZy6URbTXN/3yl3VrT+LTedVkzNk=;
        b=ztWIrFDvqqaI5litT6PEexBwHbvAWdVIjrhds8rUnLDz5hw9XMRL/Qyh5/2oT7cOf7
         9+2QsOPnOSkY1trpQ7Kq+CtBq2yuogvBqCgjC7d3MHn7Xcp5MiQyyZEDcs+iqgMjz/Of
         sQJ4x3kemV51UxqhQlrDbJ29Yc5d8z6skBVlv8qj2JF2WOKwaj2i0IP0cKrovD5isYKU
         YjWAmWuymRtG6Mkv+Q5XAmdmjKwcdn/RabzZ9zpNvsJP/yyzx+quicx589sBrhLKjsNL
         UBX1xyBkLAbiz0rKxzijfebB5CD6rMNBCg4ldCZxjilPNBACh9KFExxJGs4tqGWa83u1
         fL6A==
X-Gm-Message-State: APuU4Z/+9HFtNOPBjDpn0pRbUl6YU577lzk0uRp1c0vLzpMcdP/p1kox
	78/tYTWIPRz6xUNC6XXxqFZY3FVf2zkpfUC1xQ/23FQdGUbJaapikwrZSAUuagTezcw=
X-Gm-Gg: AYBFou0lHtqDBafV/XmBD8kB6tH3O87NGtZ0s3U4oJUFUaWncQl4rA438M4/18p/XwA
	w5B0Ef/vT9lRbBp8h5KxI1TgfpjwkmsqU7JumFlKQcGvxgQ/Fy6iH4F+BmDuZClnndzcU2rycPR
	B5+AlxwvwdaZjrwyYKYKsZ0PJjC1CGDaH29iWo512p8LR2ZwB24JgwrYOVtLTCpVWfP5soUxtur
	N4lHq5+3P26svUsRhxxP/z0SwzZ1FnftW6+3fShq/j9Ad5kzceQyT3QV+syVFXS+1I79CvkKSAq
	lA9fHPiwNxnJ0K8dy9CU3yY90ss5DPbmqN4uoQqrTBZKKXw6dYDnP5poM6J6PcKmohV13m6IVSO
	2tJ99VhnoJohgb9vZRtBhYhWunmGOtPLSLjcXPfAUWcZPqN1e+0Let6i79bsVrCLBqoYV2TqlYW
	Lcw+dUxojdAcD8c8Jgj7UFBJGs4jgR9nekEIQK2DbrVT8KS1rgxOEPpDYWOd7U34W5Oj5QLUQnH
	S7cYA5wPkDspBg+oMHJD8+P/Nv13tCqu+0RBbLGtNTcc1489n1OVo55HwvgleQOpsDCJYMVToGK
	fVgiwcti2Lliy8M0/sgMt1ss/5n9PI38H/ZfvTFrWisDaPhca5eAs2Mm9tjylVVeAo0wc2AZRHt
	DOBPBjtWhZA==
X-Received: by 2002:a05:6808:118b:b0:4f5:97bf:e56b with SMTP id 5614622812f47-5640deeb619mr11922414b6e.17.1793809114001;
        Wed, 04 Nov 2026 08:18:34 -0800 (PST)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9fdfa53sm1897499b6e.15.2026.11.04.08.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:18:29 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org, Ioannis Coward <ioanniscrd@gmail.com>
In-Reply-To: <20261104104707.2031280-1-ioanniscrd@gmail.com>
References: <20261104104707.2031280-1-ioanniscrd@gmail.com>
Subject: Re: [PATCH] io_uring/wait: don't sleep on an already expired
 timeout
Message-Id: <179380910852.4062229.12350044283128485606.b4-ty@b4>
Date: Wed, 04 Nov 2026 09:18:28 -0700
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


On Wed, 04 Nov 2026 10:47:07 +0000, Ioannis Coward wrote:
> When io_cqring_wait() gets to the point of sleeping and the wait's timeout
> has already passed, io_cqring_schedule_timeout() still arms an hrtimer
> for it and calls schedule(). The timer fires right away, but only after
> the task has switched to idle, so getting -ETIME back costs a round trip
> through idle plus a timer interrupt.
> 
> NAPI busy polling hits this on every wait that times out.
> __io_napi_busy_loop() caps the busy poll at the remaining timeout, so when
> the loop runs to its end without a completion, the timeout has expired by
> the time we get here. The task then stops polling for several usec, and
> packets that arrive meanwhile are left to the device interrupt. This
> affects one of our production workloads, which currently works around it
> by having another thread signal an eventfd on the ring before the timeout
> expires.
> 
> [...]

Applied, thanks!

[1/1] io_uring/wait: don't sleep on an already expired timeout
      commit: 99b6efa810675d99c04216574a189aa4bf031cfd

Best regards,
-- 
Jens Axboe



