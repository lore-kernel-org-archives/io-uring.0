Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD784D4895
	for <io-uring@vger.kernel.org>; Mon, 21 Sep 2026 16:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790009278; cv=pass; b=a+MzMjPIv0BBZttaeKK+V2qAtHa3xtdGN/Ud/IQMOZ1iTG1PAUis5XTYne5mZ/z+JhOZZ8puBpW0o8AaujkPig8x9FIgKLPZWuxpCIPh9vYtcYW2w77ZA00W7hflzK+7NNkk/asERteJ63Oi8RKbRoDtRNMg2Hh2Tx5+fpkySfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790009278; c=relaxed/simple;
	bh=RwZnQQhFtAM7evdQmSZFlOB9sFdlZveU2LX6vUMde7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kYNSSwWCoXRx8NOfZwINchCGIEfjmS7lw1qnCGmsgZbwc2W0VpwU/NsddaHcF3Erwilc8U+hIHIMV413LpMX3IldP2h/A5bvRksZ0ooJ1jK2ImP+9cbijzMveP2X3u/VTOGAD6aXgCUL8Bxs8SvR+4F6ceBXmHfuXrEgdXsAiJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s42svd9T; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s42svd9T"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2db33db4de9so185ad.0
        for <io-uring@vger.kernel.org>; Mon, 21 Sep 2026 09:47:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790009276; cv=none;
        d=google.com; s=arc-20260327;
        b=kZYpTG5K0rHxZvug5FssncqTX1uyzRWsF7/JfPZ5UTqhl38teWah9CIhliJlIAmu8Z
         tvnf9kBacgFW1nECOc1gbMZ489LJ9yc15odxC1pSJcV9B5Af5hEO1sR1BsgXcE22M6mo
         GMHaDZlq2y96mZytGDP8A5RXaWmsSLF4RtB4z01jClnsJYtMtQzu7XP28iKhDU88MZFO
         QVPZNjAPLmwBbt1l+fm4+rghFyzf9Hh6kMoKGchoy02KUXmmixiGrFCOxYoUcOvQdh8L
         udb/v+QfDoKdUgG0oLcaP67qGbISK47F8lQtPI63VOcyY0Hz/hSPlJiJJd9m0dZCNfut
         80Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j0vE4kZPOKuoqChBoEWd7u0oHqRVqQKnzo9W4sUzGbY=;
        fh=0+ZX3m2TVtMrxiBBsot1L2KZO+7emVzzCbmOmJ8D4Yg=;
        b=JCvXk78II80uJ6I7dXnOuQlhEloohL9HzFnNS3ybLEEelcc9OaHtJu8Z920uqeU3kq
         vQYlXTSas3JDEPHNuf8WciEPmaIn3hLJgbm58ZhesoHlycmQDSd2Q2li37nAGKjB/n8J
         Cr2ri1rrWO30Be57HWg7+GlWfIvr2+NDQpA9rLK9wQUqESKwqGKYFjkGCmZRGjIPsY9f
         5cklupGTniRPK+ILlLMPUy+2Otwt7NQXuS61DTNA40RZQR/ZuQX0l0HsRcG+HEN+riS0
         wsqSiefWS414zFCXcOkmnYcS9qn/yoKqjJ4ajnJzbXBPlyPYrfC+zsPsRI7f2zY/1lnk
         zHeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790009276; x=1790614076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j0vE4kZPOKuoqChBoEWd7u0oHqRVqQKnzo9W4sUzGbY=;
        b=s42svd9TYqpSfHg2EF2dWwjc5WXqzhEyla1skLnFXnxRT0QFqfiEGThIW4Ruvn17ct
         T/CoOkyJV4jUeDiy783GJ8/KCX9rrQ7E27WRrRUMjaeM7P5jrkD469PsT+yRaEJm0jRS
         ArKZZpYMXi7IifTwSvJMZPyV/3encSQ9yVCVBXD/cFaTHg/prt9E6hkyIo0APYJHPKBc
         kkv7laT3dc/ThaeYmxDvr/pkrjQGZK5m3BGv7wGI0TF4TxwNhYByB4ZV+dnbeBXfsfVx
         q5PvzH8nmTffXl+kMY4dapaYhSYeTt/aBZR1uIElvgumo1NsKIawdvgh3BhGVxDt81CH
         pjiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790009276; x=1790614076;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j0vE4kZPOKuoqChBoEWd7u0oHqRVqQKnzo9W4sUzGbY=;
        b=YJTtqM4JC/5n3tEYNUKFiUUrgVmjVEAIp5vRjPhAbObTQ3efIc7ptw4ldEuPTv8lrB
         8WL/GaRzJkF0QBdfwXU4SAAWCkJdQKp6AdNyCZxD8stnY0WCDRwEYi4zueHFiQdrhgh8
         fS4njnhm2/w0nW6jEYyO0zFyNWtU2hS3099apfWNNkHHkfTob8fHnM8S4Xu7rhCLNZnn
         Q0pZlXSk/7GCmJ+HS4QlFxiZ+hxtYBbYPar+GpQ3D1qhHABsIMga31Uj9hF3nrvYpE4e
         dYz0h6QFyothcC89Su+kfmLOilLIISxkMwBEMS5BoL1atksJvNyCDh792iq8tA0qT/QF
         V2Dw==
X-Gm-Message-State: AFuF++lbaf1VRrZ0/ALfGh1dChbdUVTtrKWXtYD2pHUiPUG5f84JcIA4
	ndh6nuvsyxonP0vPe91Aucp4U2W62FKdJtOoOO42Kj9SgIRtuh/WQRwbm4KfO1M17PL9BLqS3xr
	tPzPerfXbdx1K+n9vmaXMaVk5lxAvmDoqWnQJ6+a2
X-Gm-Gg: AYBFou3MnwjS69mLPKj1C7nQq46inu08XhguXdPLPED2hl5QGawwt/SMtYkb7sHq0xq
	XnWWhYV8+9oT50mScypP4VilemhmcBzPhBQV0Vk94O5eFfB3yrAhIemTbIPTZS+vG6RlpjIEofB
	iot0wUwhZgiDoDDAgVPo9rdE4gU1Q8wrfBY5t56n4CN9JhODRv9F+CXgOeurHpXtJM3O88kYId5
	eudAsQabTV/uoywbb7zADaLu9Qdi3KYElwCoFJcRah8QaYQEBAzoebFraXuy5OE0W1Pxklf5rgL
	vMD6g0dQVx4AQO9ZTQLda00aHH8ZYNvArEMU1QkhdtW1/8o6VLJBOipEBM3GnABFRSq35DHTcgQ
	qmha0DBWaX4K3QDynfjBym9xgGE57eU4+LdSQvMor
X-Received: by 2002:a17:903:1a10:b0:2cf:9ec1:ea6e with SMTP id
 d9443c01a7336-2ddc1703951mr12870035ad.8.1790009275675; Mon, 21 Sep 2026
 09:47:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-uring-fdinfo-tighten-v2-1-fa24d517035e@google.com>
 <178914981183.662923.3814591941846027409.b4-ty@b4> <de0221c0-80e7-499b-b46c-66a2adc78db9@kernel.dk>
In-Reply-To: <de0221c0-80e7-499b-b46c-66a2adc78db9@kernel.dk>
From: Jann Horn <jannh@google.com>
Date: Mon, 21 Sep 2026 18:47:18 +0200
X-Gm-Features: AcwNN1WR8IhxT4hGSiQT8g1ydMaTBIgMm469wwiCUSFeC3f7b2SE2WiOkoQQuW4
Message-ID: <CAG48ez3bX03GfFK_HJpMP8ZWEZ0x7Q8qtaMbL9=z5ZyeqqtmnQ@mail.gmail.com>
Subject: Re: [PATCH v2] io_uring/fdinfo: ignore IORING_CQE_F_32 in last CQ
 array slot
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dominik Maier <dmnk+artist@google.com>, stable+noautosel@kernel.org, 
	Gabriel Krisman Bertazi <krisman@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 6:45=E2=80=AFPM Jens Axboe <axboe@kernel.dk> wrote:
> On 9/11/26 12:03 PM, Jens Axboe wrote:
> > On Fri, 11 Sep 2026 19:56:13 +0200, Jann Horn wrote:
> >> A cqe32 entry spans two CQ array slots, so the last CQ array slot can'=
t
> >> contain a cqe32 entry. If the CQ tail points at the last CQ array slot=
 and
> >> the kernel wants to write a cqe32 entry, it uses io_fill_nop_cqe() to =
pad
> >> the last CQ array slot with a dummy entry and make the tail wrap aroun=
d.
> >>
> >> However, malicious userspace can directly set IORING_CQE_F_32 on the l=
ast
> >> CQ array slot, causing __io_uring_show_fdinfo() to read the second cqe=
32
> >> half from beyond the CQ array. Change __io_uring_show_fdinfo() to
> >> explicitly ignore the IORING_CQE_F_32 flag in this case.
> >>
> >> [...]
> >
> > Applied, thanks!
> >
> > [1/1] io_uring/fdinfo: ignore IORING_CQE_F_32 in last CQ array slot
> >       commit: ab394388d05977f369e8e8d1beceae47fc3c5e72
>
> Back at it, and wanted to move this to 7.4, as there's no point
> expediting it for 7.3. While doing so, I took another look. And
> cq_head is the raw ring counter, not a masked index. Hence I think:
>
> bool is_last_cqarray_slot =3D (cq_head =3D=3D cq_mask);
>
> this is incorrect, as it won't work past the very first run around the
> ring. I fixed it up as:
>
> bool is_last_cqarray_slot =3D (cq_head & cq_mask) =3D=3D cq_mask;
>
> Just a heads up! Let me know if you disagree or want to send a v3
> instead.

Ah, bleh, of course, my bad. Thanks for catching that!
