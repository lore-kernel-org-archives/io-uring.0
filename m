Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5723492E40
	for <io-uring@vger.kernel.org>; Thu, 10 Sep 2026 15:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789053533; cv=none; b=gkzW0LVqrggetzBHibbKje5TEn5t7nNfPoloqeQrGMHZRqjeQ3qUJqv5bYqf2baENZws3ibaKSuCnpoDquds1PZ2ADL2HceUt+5SP9kiJh3uNt1DWkLIpMcBBtTi+DKzVVzBGwsO1bbU8f7/Tn3eoHbYB6UnRQxQMv+ZNx/2dn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789053533; c=relaxed/simple;
	bh=nmlVxuCmJvwgWzZmLtvEnd6MUk27wZGVvMDVW+s6btM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hIPEAY1y4IMJfn4CK8f3s47n1TuOJ5Ra3IV6jdvNkHRySmR92NnYuTd1eRlDCmYIbsV6PVHkeFp/NzR6i9FglRd8V8vIRi1k0yYBHBlj0YdI2opfuLENAmZo3N+tV5qosvDrODPqT4rx3FrSn/jeSp32vr1i3mwVI2VCqf/TZDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=mriNDERv; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="mriNDERv"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4bf948737e1so1189738b6e.2
        for <io-uring@vger.kernel.org>; Thu, 10 Sep 2026 08:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789053525; x=1789658325; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i5FCwCz8I5I3vnms5aLJ0rTuKe9JHgwTVrTlpHQrQos=;
        b=mriNDERvuhBpRVL+3ruZSUxk255Sh6HuqlsnslwAKAsFkNXfguA5YKtnQAqkk9yp0x
         +n4xsuwo+nMijfPvvlq2saMlJkXJaGWBa7pySsYEwslvOkfFKlcWETDmlFC2t/T1haUv
         ZEsX0jUYoPPTz+0NeVJwmBP+fWl2GzXLBRiZZtqJZOiQYto+SVBak8WVTOlysVwuubb0
         +xczuabAA/yv4P5zlt4kT4flBMJywK/3QPN5/McJb7Deyk4H9uAhrYjqka7BHiaiyBeq
         I5MKx/ZQm1E7X7zXM0z/qW4PRqNLtZ/9QV8AhPez5WrysU+hmY+vs7yw4mmKy3ij3ata
         NhLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789053525; x=1789658325;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i5FCwCz8I5I3vnms5aLJ0rTuKe9JHgwTVrTlpHQrQos=;
        b=onQ/MKe4Te5qlCjC5NVwaXWifa7SbYT0s+lJhYPQyJEZ1EnxpsdU2JdatiFQ+eXj3c
         q/nJ4RrVatprNjFNbnePCo+gZuMBgd+bGephEpfDus4L6iTnN5g3LhyYUfUDA8V6uovr
         BWK01PLChymq+9zarJwFZdpELVOLa12pDholLw2BWawPoHqja3HiO+a7/o7mZ8VzV3pz
         4SyPjPlyBJpEHA3itPG5nbJLiAs2vhUYOoTCa0qoTAtl6iznwkRiAYdNxpZFhFWIvrtJ
         fW+7GaW/THm1hb866SH0v67RJqaFPaVALsFQJkvsMrbb0QMOLBBCxdcqOwv13k/dEIHJ
         gNrw==
X-Forwarded-Encrypted: i=1; AKwUvBxy/RLii7zGw7+5Sa4uW1xjThGqSKXAc4OhGfAiml5adtE/TvNiBesW7ntRpDDHfE6gWozY6hCX2w==@vger.kernel.org
X-Gm-Message-State: AFuF++lzdKXmQtRh88eVQrIS9cAumL1wKevxPq5N8BqpDaPlNu3y5IHr
	ZPm4CsgYeFd6oe9XX3c7pBQA2PfmNCVvEwkjViX4vcoluVIbSYjbGWDl9HVR9BrUwKo=
X-Gm-Gg: AYBFou3rcnR96RtEOvj9twLdJnuj4pcJqrPbIBDbvtvQIALPS6eLveELMoaIAQ4ra1y
	pK8yFFkvBw2a+ajUJ/idRQJiuQ47SSPFaIxCTj7A2ZomXqPtunWMmmrkJFly2Vi7og1szN3qNcE
	hd9L63sX3Nar9VGfNUFSbbj8xA9ukPxpCXkbyBnC4IF/HoE0TzE1wDRYYqg7d0q1xzPqbHJMhIi
	isHp5HBQv+REii/Dnwn8KWvqLfpL/a1DZsnxoO/bK7eJdU1e92KE4dggQVA5hK35PxGNqQJKBLn
	hvZyW6jJwuqMlrxQr9hfSXR8X6vTrWDQlQ0565/hQ3yB6C9QjCQVcn5yAo9YEs6/Ey9JJVVzy/F
	QvrDDqNYbayUs1JFrUBbM0f1MsbixU6hux4lbxL26eqMSnKFsCLOF/7Q5I8eHwMbP2SK9Um6jZS
	PtnIBOLWvBWdC12mAW0IIUd6cc2XGCru0SSRP9/QvOSzew6o+oQQnY3JXVqkzNPtoOmON4mBmVe
	1goBKEzpLeiecEK28TC2mSHxQ0exigFcsstTIEGWHpZhdEtr0I=
X-Received: by 2002:a05:6808:30a4:b0:495:eb86:6e8f with SMTP id 5614622812f47-4c142e28f2dmr9206435b6e.14.1789053525074;
        Thu, 10 Sep 2026 08:18:45 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b970d1cf26sm19089338b6e.4.2026.09.10.08.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:18:44 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: sashiko-bot@kernel.org, io-uring@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260902210200.2336720-1-csander@purestorage.com>
References: <20260902210200.2336720-1-csander@purestorage.com>
Subject: Re: [PATCH] io_uring/rw: keep CQE flags on iopoll requests when
 adding kbuf flags
Message-Id: <178905352403.347131.15633574006083255030.b4-ty@b4>
Date: Thu, 10 Sep 2026 09:18:44 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Wed, 02 Sep 2026 15:01:59 -0600, Caleb Sander Mateos wrote:
> io_do_iopoll() assigns the result of io_put_kbuf() to the request's CQE
> flags upon completion. This overwrites any CQE flags that may have been
> set by the opcode-specific layer. (For example, if __io_uring_cmd_done()
> had set IORING_CQE_F_32, it would be cleared.) Switch the = to an |= so
> the kbuf flags are added to the existing CQE flags rather than replacing
> them. io_req_rw_complete() does the same with the io_put_kbuf() result.
> 
> [...]

Applied, thanks!

[1/1] io_uring/rw: keep CQE flags on iopoll requests when adding kbuf flags
      (no commit info)

Best regards,
-- 
Jens Axboe



