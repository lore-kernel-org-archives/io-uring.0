Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB5F25785C
	for <io-uring@vger.kernel.org>; Fri, 24 Jul 2026 01:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784855441; cv=pass; b=HQtJZJLyfuojRZ6hdKInftASPHYV+XgPQn0V5wMVWF0hdQfgH6resJeNyOPCyzmj9Q2NbYjNcBINAxGH7sZPn0C703/WVum3pDZPQ+/ZB1sF83b9+AHUK1uj3qWq5yDnTQe43aiocOcclFP58QYg8QZYgjOcSWNs8+K6eAI0Qzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784855441; c=relaxed/simple;
	bh=cBMihjtfnzn8xCdItbkni5HmOZKExq/gd6xSmOtgIxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HV1+SXQxIPtCLklZvKv7zlgyq7+s9vYC2vpNzGQWVTvyg/3/qT1kmwy+MGlymIKfxYxF/T0lkEAvDHI1X4uWAQhaObZMDt7r/6/yONP0Eygp6Xj+sZSvSftryMVYAfX2Ihz4zdhvTCsNh6/oxa8meutkK2IqVjQOAEx+Eu4HqbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=PcOXBiIV; arc=pass smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="PcOXBiIV"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-49da0c3a1d9so87407b6e.2
        for <io-uring@vger.kernel.org>; Thu, 23 Jul 2026 18:10:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784855438; cv=none;
        d=google.com; s=arc-20260327;
        b=anzFHSJvw4Q/Vg5fpumO+xluapUHkKQooPjA1cPwlEOpHPESzXDVGbaLlezNaP0gwL
         GyuJTYanvhZuZL2uFTb5GfykzQ4zx9EQ74w3i4iMDvQW7YIii9qCLb6DFy+h5lHMGL/P
         N4hykNpnBcj2TBI6ZQJGiuzvtkZcC7QUP2Mfmsu33IhPX8rtYkq3iLtLzQrKxevy7ayl
         WBtIX811rBXbgIiyGu/86JXWNAkn+FAyXgDdNxCDGPI1+F2RMj+giYT4cblZBg0S4Dh8
         5yIUdFnBOJfIOGFLgUSgpaFxQ1HQrNcXypvHwYeDRNVYGYacpM07LBZdue7Lp7ry6MUa
         pk/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YjEvrw98k2bIS+MXJKjl1OOCntzqCiFfo9x9NFJokR8=;
        fh=f2FA+DiuuYVbOe+M9P4FZEzc85gvMfVLDJyLfPW1sgI=;
        b=giAKIfQF6kcwkyLhEXCVrhxhL8MrtUA/2xAbRdi7b0u1CafWsLORlr6uagJvrt7SlK
         q28luNhqGGxmYV4BLoYT+jPx2/WVMip7hXrqdkm9jxFe3ohgNCyIouoFVdGfN0U1TD3w
         WNC/fxOCSSskSDcoQrwiDUSuKwbzHJAnv3hFGpjsnWVP5FqB22BOtWSj6ouJeVLRjGcy
         VhhdR9dEY2L0lk6AJJx/CFV9WdyRBaMSDazKKV8F6fnlHX+CfXtZGaKL9NqhQYlb7bl9
         xSGc8+JtFK3ZE9zDwaYljetJrpqM7dsC3gP1roGYbPwe6dURiAdsRdCLfjyp1U7f7hiF
         x25A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1784855438; x=1785460238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YjEvrw98k2bIS+MXJKjl1OOCntzqCiFfo9x9NFJokR8=;
        b=PcOXBiIVNanJ2SeRbAJAvB2WeJSTfNHdJfeocsPPmkH0hCwgEY5acewlbR+rMhBsd2
         vWAS6HR/H1wQNJCAZqUBC/OOBKCqGIuOvbXmiVdDVkoPkSuLq+8PzpqHqTu/L+uj4y+R
         lFpXz0YJG5hLU5OMOoZ+VPZIA2FkOQazlKsLpqBSavMeCWUyTrT29fbtCoUNVKJ9AAdW
         pbulT0pW70tSvWSze1kt+7aaVX792sh1PcZXR119t3sSyGSQz1aXbhBXiGH+apf+ivJo
         k8fBgFEep0NRb32kqXrpV1xsKk0FSsd9YyF8EEjq8+DvQm7p/Z27jXse1/wH3JmA2v5H
         fTNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784855438; x=1785460238;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YjEvrw98k2bIS+MXJKjl1OOCntzqCiFfo9x9NFJokR8=;
        b=q+iSzpjQslvr4B6liHHgCXGbEw2DwjsB9o4/raZwEf8GhjV/Pijb0jjuiChttr3npo
         jFPGd5GP8taHxhsONj6EJAt2uWDpbvnuLyaHs+oibFadDifo/S0D4JvJ5OLgCxWih407
         jlxtfrUgsH9JovhRc+StNaqV9MVW8S9bknBKoJ1pd1AeaQJazv0Nu1SD4ta4aFYcsA/8
         AvmiZ20o2BCLIuotcYLp+Go2KUHbo3WzrsHGnb6Y6Gnoppt1UGMMeJybkiYxwGKzt+JA
         WQf/r0hJh6CLtimNaQqfhaGjKwDJCfq1jool5rq22Z9NPX7/RBIRek8WFbcKBu11E19r
         7UYw==
X-Forwarded-Encrypted: i=1; AHgh+Rq95Vn2cSEDQk9aH88qn6yzRLJ2nhKb0G6fLy4jTEHRjjVL73MU1YSwWPXJy3f9FD/feYBlcwvn+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YznEk/goL9aMTAcCqWALlSWk9XB6zvKRqqjluS7D5kcV7DMqseI
	fuTwo3CDCnwFU5uzT/c+C3ScN4iRGS81lt+0mMgy8FkVELgvq/DQ8IHSFrJNDmwVmVMsjxskPhZ
	CdgmXzBJu/K77cuBD6RWxGo2vAgB0pFW+s0CC4a6yGw==
X-Gm-Gg: AR+sD1307rlA5RiA9IdKbApElVqnnAvjkHqoOthZ1LQZETURoIWc234uL2tI0uouLKJ
	dn8+A7+1TKAWeIf9PNLJIqPpZvW2RJPz0uHqHNro93nzkhT3xWIN6ElyPQrAC9e7Y+ZKofjXhxL
	HwZyj6tr6ovsGbpzOGoFlsHs2nQ4n0WqTHcNkFjaipI8N3nrbys+8DjklBXF54QQQ3UVeKjfFDF
	unfGiIfbzMeqXHtSfsrjCwD7xlrfCqGVRuhpeBiciLG+2FAERr0zWaboXWe62U=
X-Received: by 2002:a05:6808:120c:b0:4a4:866:c1c5 with SMTP id
 5614622812f47-4ab487a32e4mr763595b6e.2.1784855438121; Thu, 23 Jul 2026
 18:10:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720032338.461681-1-yangxiuwei@kylinos.cn>
 <20260720032338.461681-2-yangxiuwei@kylinos.cn> <CADUfDZpAW261MhFJg434=4nZFMD7mV=LL7F-ZiAWPa7dYvGpcQ@mail.gmail.com>
 <20260724004907.2742329-1-yangxiuwei@kylinos.cn>
In-Reply-To: <20260724004907.2742329-1-yangxiuwei@kylinos.cn>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Thu, 23 Jul 2026 18:10:27 -0700
X-Gm-Features: AUfX_mzxjwAB-owwzf9zzBMmhMb1g2JJjyr46qdZmeRBMmcP4vb96w1zCZX3oAo
Message-ID: <CADUfDZpsTH7zU4gyVE11R9GxdadjbcrcGVX+btoEjRYS-tBiGQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] scsi: bsg: fix TOCTOU in io_uring passthrough command setup
To: Yang Xiuwei <yangxiuwei@kylinos.cn>
Cc: James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, 
	rc@rexion.ai, axboe@kernel.dk, fujita.tomonori@lab.ntt.co.jp, 
	bvanassche@acm.org, linux-scsi@vger.kernel.org, io-uring@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 5:50=E2=80=AFPM Yang Xiuwei <yangxiuwei@kylinos.cn>=
 wrote:
>
> Hi Caleb,
>
> On Thu, Jul 23, 2026 at 09:56:08AM -0700, Caleb Sander Mateos wrote:
> > cmd->max_response_len is passed through here, shouldn't it be accessed
> > using READ_ONCE() too? Omitting READ_ONCE() only seems safe for values
> > that are ignored (except for a possible check that they match a fixed
> > value).
> >
> > Ditto for cmd->timeout_ms later in this function.
>
> timeout_ms is the example Jens already called out as not mattering if
> userspace rewrites the SQE:
>
>   https://lore.kernel.org/r/55f36cc5-a013-4960-8787-fbdf4b4d0c20@kernel.d=
k
>
> max_response_len is similar here: we clamp with
> min(..., SCSI_SENSE_BUFFERSIZE), so it cannot overflow the sense
> buffer. Same idea for response.

I don't think that's true. Without READ_ONCE(), the compiler can
assume no other thread will concurrently write cmd->max_response_len
(else it would be UB). So it's allowed to load it multiple times:
cmd->max_response_len ? min(cmd->max_response_len, SCSI_SENSE_BUFFERSIZE)
                      : SCSI_SENSE_BUFFERSIZE
becomes
cmd->max_response_len ? (cmd->max_response_len < SCSI_SENSE_BUFFERSIZE ?
                         cmd->max_response_len : SCSI_SENSE_BUFFERSIZE)
                      : SCSI_SENSE_BUFFERSIZE
And if cmd->max_response_len changes between the second and third
loads, this could definitely evaluate to a value greater than
SCSI_SENSE_BUFFERSIZE.

Best,
Caleb
