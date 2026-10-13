Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A4A410D36
	for <io-uring@vger.kernel.org>; Tue, 13 Oct 2026 16:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791908588; cv=none; b=Xi4J6R/Xy35axB6pvS6AB7vt2Irm0HqWTANHl0eT4tnvI+alv89KXYLIihAP5r+G2wz24K2DOoR6dOhP7Zok5uLf5lfYj2DqxUff9ClJqi+ys+WjRLO+42teYOo7FJcgVh4Ee5Tc7y6SbNq2sTfHQyAPwGvTk7ByLNeNjGirxWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791908588; c=relaxed/simple;
	bh=ykCJHQQsOWnyaRzz2WFnkzTvYpyE+YIcHcea6L9ly50=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=m2jo+6Fk0h42m27e922zJyCbT6vFQsfPg4hju74k5+TDpu0Vlrc83p15EYDpJEV+vkGDQzljesp5AXz/KPURoyMcGwCK7DEh9w8iy0cHostVUW+P+XYoMp4V2rKiiglubgpSDdbfJHHqMJNOEEGm70kpLzwLWA7m0AsOu9kk6HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=TcWjHbVo; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="TcWjHbVo"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-81b54d0cb17so2478291a34.1
        for <io-uring@vger.kernel.org>; Tue, 13 Oct 2026 09:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1791908586; x=1792513386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QdfePyZSQWfxzgU3i6fr/xLSfsEJRbhkSMrdRwEcqfk=;
        b=TcWjHbVo3puoItC8phATIPJQRj7xaL5TNcdZUU5RN6Kg/qcicVgJwUJhVXn0gjUcjG
         SaGhBqOXJHmhBxelPtKmjLJKx/yoIUYoNkAgp0SxB9oN+5MvInjf90OBKeJKmbf4C2v+
         a1Gk+6nUc95qEgafJa4AaGYFYIk9DRTMdJ0UHnIH/NQgiLGSkyXKYsi79EJ9x9yFxs9G
         VQ9dNS4kBsJILyiQxAMeFm4PnGvs38Y1GnfE8aw/fDHYS6jrPme7nhSM7p+7GJQmB5Fd
         wz7wrSt8Yi8v9j31hhn2ohCkFTyDpifmEMdQk0fssofadxG7e1NhPX4pZNmNZn2T2STC
         Ju9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791908586; x=1792513386;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QdfePyZSQWfxzgU3i6fr/xLSfsEJRbhkSMrdRwEcqfk=;
        b=I4ZpcudpWgVseY7FSk9yuM3fiV9tZyzo3haHSdIAPZd4KDnIP+IAN58Od8DKg2wT+T
         pncAOadNtyUNr8n+3Su8KoqEfpaqiZuukg1nDNKtaSQxSlAmlee2PTV2WzmOdsreqg9O
         Z02eOhaCrFoNOJMq6sYNFM13Dqvor9DFPBc0nQRfilQm5B9bCTguMA3g2tn0WGJvF9If
         70t+Jyp2Pox+btkzjO5p8VCuHSYeY5nGD3zaHxMOJR0XMaik31UDiD00ziCWrs6yArLE
         aApNeo/TQmbSJ86YI+GBo14yXrQpbxQqCoIFSqv8Px8L0rKrsWCvyDrJ8q2pf8yPHFKz
         FgIQ==
X-Gm-Message-State: AFq9FYIjA0/l8UmuLVA2N2s3bADeNEjbH14iYkOKBPrdikxzqRaYXiJ1
	QHq/7b13MIGsudeab6f5bcwIDsk94JBOj1IW4jfacNcpP5FFCW0iy7zOGEJ8TK64LdK47z3Ngpb
	7oy1nVa8=
X-Gm-Gg: AYBFou2ZllxgB7qpZsGMSoc+XCG0QNkAmrjU8mzq9ZLIOPGSZENvhBH2daM+d2m9KIU
	WJhCWc6Z3gS7TROMiKALds6Vd8VIFsYTnWo1vpoIwWoLWyMN0Ef/7gXdw4KFkPEv217oz+LSNGR
	/mhsCIwqIUI/bdm0SiBIUhkJC58tFlFa+pxsGyRaSBaCXtoa3c3/a4ymjfjlz97KnQ/Ay5MBVEd
	3g2zpA638pyTavus9TXDRJTuc/x28vVW3zoQ3sgLLk7g0H2R+c7knslt775UTGIc2ZLVD24JPKS
	Rdlzmwtj+RwR1aVUv+ilfMoiDfWEdNnJMIgfCmcN0+SXgr8ey9YW4X7caAQTXjJf1k09EizKj+8
	BWjqBwO5cp3GjOS3KKWfdwDndE41ibNJB5DUfqU7Vf43Z32SIO1feZIf4JlWKRZJatcmQ9dgsMq
	E2WCcLIU3eSi4LKQvtNIjJld48lRcHseUoKaiR7TbHB0djSkgsEKuZCm9bQbwJpoXhDwoNjoEt0
	Bc1ktJNgI3A0Fl83y63W+8QoY3NmdEzCc51T3O7YWfIPfQyqHiMTBU=
X-Received: by 2002:a05:6808:c40e:b0:4d6:92b3:c1b7 with SMTP id 5614622812f47-50c5b46d515mr12233699b6e.58.1791908585582;
        Tue, 13 Oct 2026 09:23:05 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6df871f44sm161125fac.1.2026.10.13.09.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 09:23:04 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Pavel Begunkov <asml.silence@gmail.com>, 
 Sasha Levin <sashal@kernel.org>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261013122417.3-1-sashal@kernel.org>
References: <20261013122417.3-1-sashal@kernel.org>
Subject: Re: [PATCH] io_uring/rsrc: fix build without DMA_SHARED_BUFFER
Message-Id: <179190858434.473157.10312300937470839616.b4-ty@b4>
Date: Tue, 13 Oct 2026 10:23:04 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Tue, 13 Oct 2026 08:24:17 -0400, Sasha Levin wrote:
> io_register_dmabuf_desc() calls io_register_dmabuf() unconditionally, but
> io_uring/dma-buf.o is only built with CONFIG_DMA_SHARED_BUFFER enabled.
> This causes an undefined reference to io_register_dmabuf() when linking
> kernels with CONFIG_IO_URING=y and CONFIG_DMA_SHARED_BUFFER=n, as reported
> by KernelCI for i386 allnoconfig and ARC haps_hs_smp_defconfig builds.
> 
> Move the configuration check from io_register_dmabuf() to
> io_register_dmabuf_desc(), before allocating the resource node and mapped
> buffer. This lets the compiler eliminate the call when DMA-BUF support
> is disabled and rejects DMA-BUF registration with -EOPNOTSUPP. The check
> in io_register_dmabuf() cannot handle this configuration because its
> object file is not built.
> 
> [...]

Applied, thanks!

[1/1] io_uring/rsrc: fix build without DMA_SHARED_BUFFER
      commit: 1127f017f33d9e9dbbadd1c230a0640f9a326055

Best regards,
-- 
Jens Axboe



