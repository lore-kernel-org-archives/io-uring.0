Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AAF3368B1
	for <io-uring@vger.kernel.org>; Thu, 13 Aug 2026 02:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786587076; cv=none; b=fhWe/bCmbyo6tBgj7h2ihXrDTropAfEAncevgtUsFpTeCMJUu0mPc3XoKrqR6Lzj2eAoP7lgHY2hqnP//wMIRfDIQN9Bpc5eQnzn8GTlASEYIPat3CWCiIAdcLyqcy1fXorltotXkVhVvCnIL+Hc5sFpJkZ4Aq72mbog+rjcS64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786587076; c=relaxed/simple;
	bh=ozbVlMco6G0HKydbqafwUtC5muWneq4nR6i4hM+YrtY=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YFsyPPTSANYTZRIPLU5GjVbO6XBMUhHGX+agXN9sTpR1WC6BMeIF2R6k74KDrbGxEUXk16vYWnuysCLYUkTQ4U4ldaZYdzRaBPbiS3pNGlVRl/VNzfWYtA1YF4WxtLNztE8q+dIMnC21A0wzEVLpTjd8IRpNqm7P+xMPxOHIRZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=w10uSAzT; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="w10uSAzT"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4a45b3f0becso902044b6e.1
        for <io-uring@vger.kernel.org>; Wed, 12 Aug 2026 19:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1786587073; x=1787191873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cOFyW24OzrwCZ7wijAUBn2BiweeS9JGKEL/3pUHzZRQ=;
        b=w10uSAzTfCqyy6lDOmBf64Fo8kmClKdg0qvFz0vMhGoC+O/CtbJ61Rls9JkTPp0JtZ
         kQBqKcXrBawGhluR3d93n8ANAvfqpZojGAlc5C5PzaP+dvLrByuWKzJgyv8XMITKvnUS
         W4WXYN0Sdj2HyksYY27rzbojo2ta4dgLAoGZkZv8aS9V2X1SIWuHyCLBSY+GGQLR1Ryc
         jliHq/p+TgxeUPKQs3Z2gPJkQnHH7EONxPzveZhoXSERWzte7f6PYKVcIbOpnB+B0Rre
         S+9pm2rKlGvRhdP1dfpi+J6ypinVGNRVPbuF7npGzRJ+rHmU8p5eQWUobEnwpdlmWOTe
         hufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786587073; x=1787191873;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cOFyW24OzrwCZ7wijAUBn2BiweeS9JGKEL/3pUHzZRQ=;
        b=FCk9erRBAUJKXwboz8E7nB1pTPWTfyu9zK0kSjSSejtMEdyRwopJKduPceXrWu2hBY
         6UIfN1kIH4uzWuzQShINMNAGITi8KB4z4H7YcmxfdTjb8zlSZsP5xk9DpScx2R6pRho0
         AnuN8citj7uYpxnxKhfNNX5y9FY9pWrbAGvH6Qh2eFINBdeNZ/VdcZtS3VjvRNAlSYyy
         AzoeyAP14wuI+DSwYlVY3WQvwDr0ITb6bxbWXVWQxerE6eQ00Kaj6cm135sYArvcxI55
         N5fFGBeN3wtyeyBPGPblqkb66bbBgalOCbYzU1walmVji3T3Uo0yUbXo7XbAui2GwEyd
         UBPg==
X-Gm-Message-State: AOJu0YxCT1rHMH3HaEVrhxgicZnxBAj/Vpbw0wITCqBjP8jvcCTTKC/G
	5eEur2wayBvsn+z9hd9EzNILg5rIrpb2FADCNa1zpyFMtC3DL94V+PZfXCvi7wUNfrA=
X-Gm-Gg: AR+sD12vYJqZ+0yFVus4jeh2VFfIq4imeJNk/SjCLtnTu12o8MplltJNKrR9HMwNiFU
	iWKnYlA+s4MApc1tID8LOVKkgiw4WcP/6M+PG8Dvg4mSymm0jQfb3XjWUNQ48KDyF6ir6VNGuS8
	oKGvlXc1sfOqnHXm3AncMzTr4+R737mHNG7nkgHD+uIOIKkOqd37b+Sburj5pazZLedWu17V2YV
	EDB3xBJA4EVGg0baAuXmy5XzWL5wxq60Yl16CSVdjtwrw+U2QJN8c87A5eFoAiMziFcA8tdpXbC
	LVyvUmhEnwljdV04PRjjXtlW+OKavsJOHIXbFmxHAG8BWJ6oLlhX2IwJNpJZLvMLb7JQ5Zsdwsi
	w9nubwXXsvTsuBnsKTOr+7M/TQtW8KKxRiQxVLy2tdb7oqaFEMYpvNSVVwEjq96FUDxbWitGw55
	m6QkzKXhoclchGKlrX8z1C2UZUY3U1OfvH9MEaW50wL2Se4A1OUrtkpDKd49GlFHE9W37bBMYT4
	jyAOnZSfxPnLf3iOYMw8QrC3cXY97HWWM2X0dBWhw==
X-Received: by 2002:a05:6808:524b:b0:489:a387:1e29 with SMTP id 5614622812f47-4b22799e765mr2664247b6e.20.1786587072579;
        Wed, 12 Aug 2026 19:11:12 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b22cd187e2sm454073b6e.6.2026.08.12.19.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 19:11:11 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org, 
 =?utf-8?q?J=C3=A9r=C3=A9my_Jean?= <Jeremy.Jean@oss.cyber.gouv.fr>
In-Reply-To: <20260812203042.720348-1-Jeremy.Jean@oss.cyber.gouv.fr>
References: <20260812203042.720348-1-Jeremy.Jean@oss.cyber.gouv.fr>
Subject: Re: [PATCH] io_uring/rsrc: reject overflowing regvec bvec byte
 counts
Message-Id: <178658707155.307023.12210617485137487141.b4-ty@b4>
Date: Wed, 12 Aug 2026 20:11:11 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2


On Wed, 12 Aug 2026 20:30:42 +0000, Jérémy Jean wrote:
> io_import_reg_vec() converts the estimated number of bio_vec entries
> into iovec-sized storage when struct bio_vec is larger than struct
> iovec. The conversion still multiplies nr_segs by sizeof(struct
> bio_vec) in size_t without checking for overflow.
> 
> On 32-bit kernels, a registered buffer large enough to make
> io_estimate_bvec_size() return 357913942 segments wraps the byte count
> from 0x100000008 to 8. io_vec_realloc() then reserves only the input
> iovecs plus one extra slot while io_vec_fill_bvec() writes the full
> bio_vec array.
> 
> [...]

Applied, thanks!

[1/1] io_uring/rsrc: reject overflowing regvec bvec byte counts
      commit: 6ca662cc71df7eb4eaf1b4bcb07cd3f188ad19f2

Best regards,
-- 
Jens Axboe



