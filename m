Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941CF3630AF
	for <io-uring@vger.kernel.org>; Fri, 24 Jul 2026 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784907836; cv=pass; b=mdOVYOKr3J8BxlTg8p8GVqga5oWNR4sCQw/DdwZYikniYjD6iDMLyJslivG0osM1FH2dfXfhPA+QJLeMZmrfOIqQBTcg8fYFCjS2Qo47Rwr1ADcECsxcd3dscRUhlHJmHTBFeFkVllEhSLhOQfTlxOs3xZuH20vgFyk5MDJVww0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784907836; c=relaxed/simple;
	bh=ILofpUWGWH9zp6AGMmvbmtrtheP7UpO/eX+BW6pBBWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rZ0rBf2m/D2lDSycqiaYAhFZSS1Lg00k2DBOWwlJfpjEcSTRMOVHq1HpGWAMz9sazlCn0bBWrksmDgqdTUEr0t0r8vbcKswdXCDrds86LgN0Aj14dhlRwuISn0vOkpSU0r644DMQuOba0aLhqa99EX0Vdvd5Fh2t3UfLu8QscUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=fFeaWtiF; arc=pass smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="fFeaWtiF"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7eb62dbe747so35484a34.2
        for <io-uring@vger.kernel.org>; Fri, 24 Jul 2026 08:43:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784907833; cv=none;
        d=google.com; s=arc-20260327;
        b=ciHFP6GCryRpZsPLl3vETCsF5jqqwk3YAdy9UuuCFbClb4ha1aaDsjNb7wCeZtBVPw
         SiQsGa3jNgWlsd08lZSoijIDULdfGHbPu5prsNQIFzNZrb5nwlOSRxWsPaj9qDidFLwf
         nm7pICMpebsw6BzGLrSmje9T/tlhyaV1JeOUZHC+pLignOYLOoYhf4bx7x+k5rfxyXe7
         cEMSqx2DAyU0Yo9GmqvBxMgN4MHTnckEOe0kWRbyUML5S9JGsPNaird4tzxb2eRdYNc2
         /Xv9QBSmiG5e8qyC5CWx2ZxiXgAVdPLf35YNaf/1xSGVrCmyjWimhU1cghOzQLLatTBL
         MX0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lvfkPaw63mygCj4Ez7HrV9WaH81ot3VV5r5WvjvtNbY=;
        fh=ZO+NlBwAD2VF6hD9y66POUDWFiGv/uTufY8aSkM9Yrg=;
        b=LK2p04l1SA5EO2BUv8G/4fUCp5wXMqIESMo6aLAU3CHB2c3kDDhvuRSNma7Y6j+nIc
         /stbnoMJAUG787/uGza9ye4rDIgFu72vZq/Mw0lZVlgZfJhoB7nfhDH7hGT3ElTw92Ro
         J03Vv39PpXYkUY3en6ewjLbRDg5GPlljagvjmn/rP6Ggk2orXLlvzGmGjyUxHlmf1TWX
         jG+JYpQ1CzujdqMFjNj75yhQOw2yThLSHXDWaiMbZ3L61D7oMhXkVC+jCqz3so8y8z9S
         GejDzzJjw7pjuWTIpEASeDqqsa0OcgiYmUBapJyoslVTVoLynDj4fb6j21dSroVKUSmp
         DsAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1784907833; x=1785512633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lvfkPaw63mygCj4Ez7HrV9WaH81ot3VV5r5WvjvtNbY=;
        b=fFeaWtiFUf+jNiky+HPe+Nc19K4llYdf9nya5WHaGrigiwx8Rkc/9r1vkuxGSNIkeE
         MLMIvwOhMYf7R8hoGifZdoGfnKgnw4Me0GdwxO9/PfeBwSrfYy4mJg4lVsQ9MNaqpIjM
         7o8AJrBIDiGzxyC8xaWxLsbCfwoP67TN1Vo+Twv0HIKGEThqPcy1ZcJXzF7LuUJb+WBA
         BnuJQboKRbiEAirOm/C9LKohX4Fca+9zwl/xUGcl0Z1T39IFNRbH3hGedCnmM9LrILnr
         zHgM94B/DbhEw+cVmgbpOCVN1+A+bQvy9Pi+8PPuCH8f7w/a6EBdtWog/7ZE/pGZi3Hm
         iDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784907833; x=1785512633;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lvfkPaw63mygCj4Ez7HrV9WaH81ot3VV5r5WvjvtNbY=;
        b=mdWYQhfsK/tp6m7PeUJAxjIbr2ucwBetMQiwih/Vr+23h1hNn5BfUoBwEm9a5zCe20
         +lZKZXdkI73d/0gFciVgqNr0rScwpxF2ynmvVpDe0c14dOKUTV4zny0fdD1QyLcY96F0
         lA+VuJC7yEeG9gbHB9C+wtkNDyKPgrW7mAyECX/lKVOyfZNFkdVpfHh2bXL0P1ZtsirJ
         OVcRfaifgRlYiDHoM4xeP2/K9LH5Ogyx1if2gam+6yHMeEFFjY3Yateu7FjaAvaCnZcX
         YyyiCbv2POf6jhmquvHBJR9dkST5QWcDJCIdLpjBM/OC8MjsZDnpXu2RsIJGBBckyGjM
         O2vw==
X-Forwarded-Encrypted: i=1; AHgh+RqIxz30KF8b5IDaImAbViSOwzAevK1u7RABjBhUiViXcyLs79zlRlgC28NOzt5SEQrHq+ORgXbq6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQs5LkNQEiyLD4NvgUTl8MMlpmy3QacD58H4tdEEs2RygvcyIi
	i6R3q/56K9bOVH9ncnehef57Os4Z4RLzEatySsKkgtL+kdzZ7qwEfJ3e0UpF1Q/pQncG1K6MAZc
	j5CwvO/gesteRAzndGw8b934X/emGOAmVPRoKRvGi1Q==
X-Gm-Gg: AR+sD112fmTdcR8/wLPfeiogadAcR5ouEQF5reYN02UBlXgKrVV4HtUSWRxhr3cS7w1
	DjO1dP/MsoFkifD1kNHlxlp7259nsrDSob/XID+WExubi4Ohe8c0BFwfZFpsJtYJkx2p6xgqQJ7
	dmMx+5WWyJYzFwWa28NY2PvvOpuI8dnPnHaJcMCgZE6YzsmocO3ibJ3joVcPo2IceGsvC7Dx3B8
	6Kj9cHVlPOuBUOPQMivig81uCBPYvVbG1i1jaGdfPI3KRN/uuwPC6dGexW7BjI=
X-Received: by 2002:a05:6830:61c9:b0:7e9:cdc6:b930 with SMTP id
 46e09a7af769-7ee57ae92afmr2130467a34.6.1784907833352; Fri, 24 Jul 2026
 08:43:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720032338.461681-1-yangxiuwei@kylinos.cn>
 <20260720032338.461681-2-yangxiuwei@kylinos.cn> <CADUfDZpAW261MhFJg434=4nZFMD7mV=LL7F-ZiAWPa7dYvGpcQ@mail.gmail.com>
 <20260724004907.2742329-1-yangxiuwei@kylinos.cn> <CADUfDZpsTH7zU4gyVE11R9GxdadjbcrcGVX+btoEjRYS-tBiGQ@mail.gmail.com>
 <20260724020240.2938587-1-yangxiuwei@kylinos.cn>
In-Reply-To: <20260724020240.2938587-1-yangxiuwei@kylinos.cn>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Fri, 24 Jul 2026 08:43:42 -0700
X-Gm-Features: AUfX_mxV-8Cou1n7v3Ks8R-DjIB_eyYje8GjN7815YyL2Gqfxab6vzNDmm4_9HM
Message-ID: <CADUfDZp=pCYGY0TCnMxXPG3LR3Kwk3DB-Hq+EvHZshruX3pv5Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] scsi: bsg: fix TOCTOU in io_uring passthrough command setup
To: Yang Xiuwei <yangxiuwei@kylinos.cn>
Cc: James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, 
	rc@rexion.ai, axboe@kernel.dk, fujita.tomonori@lab.ntt.co.jp, 
	bvanassche@acm.org, linux-scsi@vger.kernel.org, io-uring@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 7:03=E2=80=AFPM Yang Xiuwei <yangxiuwei@kylinos.cn>=
 wrote:
>
> Hi Caleb,
>
> On Thu, Jul 23, 2026 at 06:10:27PM -0700, Caleb Sander Mateos wrote:
> > On Thu, Jul 23, 2026 at 5:50=E2=80=AFPM Yang Xiuwei <yangxiuwei@kylinos=
.cn> wrote:
> > >
> > > max_response_len is similar here: we clamp with
> > > min(..., SCSI_SENSE_BUFFERSIZE), so it cannot overflow the sense
> > > buffer. Same idea for response.
> >
> > I don't think that's true. Without READ_ONCE(), the compiler can
> > assume no other thread will concurrently write cmd->max_response_len
> > (else it would be UB). So it's allowed to load it multiple times:
> > cmd->max_response_len ? min(cmd->max_response_len, SCSI_SENSE_BUFFERSIZ=
E)
> >                       : SCSI_SENSE_BUFFERSIZE
> > becomes
> > cmd->max_response_len ? (cmd->max_response_len < SCSI_SENSE_BUFFERSIZE =
?
> >                          cmd->max_response_len : SCSI_SENSE_BUFFERSIZE)
> >                       : SCSI_SENSE_BUFFERSIZE
> > And if cmd->max_response_len changes between the second and third
> > loads, this could definitely evaluate to a value greater than
> > SCSI_SENSE_BUFFERSIZE.
>
> IIUC Kernel min() is __careful_cmp() -> __careful_cmp_once(), which does:
>
>   auto ux =3D (x); auto uy =3D (y);
>   (ux < uy) ? ux : uy;
>
> so cmd->max_response_len is only loaded once inside min(). The outer
> ?: may load it again for the condition, but the value coming out of
> min() should still be <=3D SCSI_SENSE_BUFFERSIZE. Did I get that right?

Without READ_ONCE(), there is no requirement that
cmd->max_response_len only be loaded once. The compiler is allowed to
assume the value won't be modified concurrently by another thread
(that would be a data race, undefined behavior). So it's free to
combine or separate the loads. If you want to ensure that the value
read from cmd->max_response_len is consistent, READ_ONCE() is
required.

Best,
Caleb
