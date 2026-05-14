Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62241366820
	for <io-uring@vger.kernel.org>; Thu, 14 May 2026 14:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778769800; cv=pass; b=Rx6y8wQod0AfcyBo5W2/T473OyObC8gcOJrdKfm7oSbOqfUIpPPOkbsANMBVHYkHEmXj+0s23/DZGw+nfvm2NpFwxC8CxNVBylbyc5qLZcyGcf+darQz2UDdy/MGTNqdG7+tn8Ai0kkVK0CXa0UaI0+tzBJ3NNcBdcTvjvLhkPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778769800; c=relaxed/simple;
	bh=TbECcub46ozJVpWGQgy/v/C0hUTUuXUnK5aENPmmOp4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OKNsPcO8zXazj+45DZYRLrn0f89crg5+Mv49EY/FlBzLsySLqfR1c8nWUMKI6Ky4A0ec/Hh8Zq7NOgLZj6MKntSPT1Of7vOLdwnKLtKMbcZMwOuxZViQ1nn4yds9c5e8QPltoEySUrnIJRVmaP3jC207Vjlm0PZKbTUrbAfO5qc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=PySpGG6I; arc=pass smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="PySpGG6I"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7dbb4fdc04eso1005761a34.2
        for <io-uring@vger.kernel.org>; Thu, 14 May 2026 07:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778769798; cv=none;
        d=google.com; s=arc-20240605;
        b=doBbVjyJMjWRpQUFN82KPtEX4K8BW9jdCDbw4QFtkommzF5PJG2VhpwCrnHxg1Rg2n
         jkawWqnXD0drpQTPC+Rmd9qO7LJ7DPVarAGZpW3ONdQHOepB6nNNwaXK4MwVrDcFgPIJ
         qIK1VqpxCc7NX6XXxrHg5B46yMTyIFNJ3jKi93OwiR1sLyx3qysiBSWPxl2kRx9Yi2pQ
         6/Acmu2FRmTv0Y8FhzOuKSKLC7PFEKErHW2kdJsty8xxEACVdAY/FqhYQhMczzmRWikR
         mlUy57TnWE5P1OhXJN5mrEtY+Eqrjkey3qPH4C101jZEBPEZ/thU/B3FVrwzo3UTCAk5
         7YgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PpNwLzxywO3MAxlGgTADRjS7r7/xBWnb4cmVFzQ4570=;
        fh=u/DoiSm55NtMuNiDKWu3ssjF33NRVxOgMYZNWb3wmO0=;
        b=EPE2pAUgHnIcVSb8Msb00ljdluLnJpb1oWim7Zs8ht6swql/wqGCh7qo8azRee4p/e
         26u4dAVwcF8PKsWkCvaZAMDdVBFeQZTENVqp0S/Fk+nO5NYAj8bmme5UtTVCTjqpV1UE
         TMD1MXGkbhxL2Ww9bySnCtT41/cXlsAImrQoJ8MuPnRGQGDaO1F/n+PxoDskEA67DRb3
         Qo60nK2pEdMwoz5vUS2EDvOdvvLY5vwTVVZvrcNnbC96ARHklGPf83c7305T6aBkzg9M
         CkbXYlnOvlly5AEJCBFn7OpQr5RA2nS2fnXRDwgFXsGRc+Zmhhy3TyaMMv9wiamd3lZn
         B0Ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1778769798; x=1779374598; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpNwLzxywO3MAxlGgTADRjS7r7/xBWnb4cmVFzQ4570=;
        b=PySpGG6Icf70Fw8jfawWZQWq5JsJqvvjwEYMw0E55WdE+7x0OxKA8ef5Vd+263TqbN
         5ySDxxiLY0tEss5t8c5wNG9ZYsUBfSWNj4QWCQQs/9It68LxX9IB32JLAwKIhyDxElsC
         oPd/G7pI6kQdZ8/cqnuvUAG5HkT0cpb/NKBNDCKyWzHZU4H8WvayU4+2QnYyq9qp0Nuv
         Uiwy0DsylHBvZwhmb6S69nidnBgv6PauDOzidtTrtKeyTc1Ry8u22Ju4DeTT1d/uuaPe
         JF66mbmOqUfAg//sKNHrdn2642aY3nCpWQkvsovk4ZfMfwLIFykPDVYfXhf9OWQz6+5l
         x2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778769798; x=1779374598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PpNwLzxywO3MAxlGgTADRjS7r7/xBWnb4cmVFzQ4570=;
        b=mdYdnaQmkXbS8ZPBBLzgDt90S3jNzO8nfTFYiSUdbOmnUViKCmfLUtS85Sva2Ps4sj
         UitXjPyPwVDdgLhsmy8yA0fdvOZJfjXumzZbM73qP7bwM+w3NT8bnRmSXFT9aqqNdY8W
         a0uFsZYp4HNU28mA7dtH421GQmT06g07yzcIR7/wri7v7Y1x7NMv05nXUzVxcUYBjG6a
         FZtfm+0Js2ZJ9SQdqQeyygawD+DrKquYmXU5C/6UHHonEEmRiujb+8Q8HvGvFJRg51CM
         DLmySwOvkjMeLE0xzZUtZVRd/CUKoGW2+sCGGBXHr4uD4V45IeEyaBFbAGNZbyALV3w0
         0Urg==
X-Forwarded-Encrypted: i=1; AFNElJ8MnbtFNc3yH8J4v8dYJGukop6jjuoByNVwT886EcewsqLLI+Rncp5ztUC1F1Vov2Wh98OoTBhuew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy47lxf4GBcc7PxcH+l1h6gL7p83LbM8CQkstw//0TwnRnHfrFV
	NZaoiOv3sogj+u/SMkA9fduGzvHbq3VoZZ8pmofeZv1iA0wwInoyrQwWxL2rMEeiB4Dt6tkWuqg
	IvACufEHgZuz2nwTn7jH2cPcq4atRZ0kZ4bHgcerQnxq3p7f7D6D43aE=
X-Gm-Gg: Acq92OHzW6SsNtbOdrhlcdINkHjq3IGazlxWo0yt5aBVD/fhjIwtaHRe04EGUmweiWv
	cWLTNrr/M0JDVUA65BIFr2qBiSDRiBYNTjINRVDY3kWHgUH73x5efGpsxztXZWPOPTgAO/AN9VW
	vtIeqabWsdnFHIw/3MVa0Mtd99fxXjMoS3ZKVzv8Cz6DcC70r7mLksg45uOQNMN9t7I0KPthZll
	Jx7bHdHTQKmJsblLlDpQ64SGQMoTiZjcuHLiI5WADYgqhJGIaYBI5kHA3KJdJkUi8GqjolO9GN+
	76Y5sOCVD+/+thbPdxDYRCdGVMl3qg==
X-Received: by 2002:a05:6830:d10:b0:7e3:f809:7984 with SMTP id
 46e09a7af769-7e3f809992bmr1114325a34.1.1778769798281; Thu, 14 May 2026
 07:43:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514083443.203387-1-xieyi@kylinos.cn> <CADUfDZoYZ5hGejvoZrCzhef2LrB04cbDsdoe+jyGnhL6Pnn4FQ@mail.gmail.com>
 <49a10373-f2d8-4813-b9d6-25cd2a0f2fe6@kernel.dk>
In-Reply-To: <49a10373-f2d8-4813-b9d6-25cd2a0f2fe6@kernel.dk>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Thu, 14 May 2026 07:43:07 -0700
X-Gm-Features: AVHnY4Kp7G4oMEbXcDs3qn_70NKKadASFDqR56SancVToKHpeua5p76Krn6tpNY
Message-ID: <CADUfDZqGmQd0t0614yU6FKYWs74iFWnuEhp0BaxTfgDWwLDLLA@mail.gmail.com>
Subject: Re: [PATCH] io_uring: parenthesize io_ring_head_to_buf() expansion
To: Jens Axboe <axboe@kernel.dk>
Cc: Yi Xie <xieyi@kylinos.cn>, io-uring@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 7:25=E2=80=AFAM Jens Axboe <axboe@kernel.dk> wrote:
>
> On 5/14/26 8:22 AM, Caleb Sander Mateos wrote:
> > On Thu, May 14, 2026 at 1:35?AM Yi Xie <xieyi@kylinos.cn> wrote:
> >>
> >> Wrap the io_ring_head_to_buf() macro value in an extra pair of parenth=
eses
> >> so it is safe when composed into larger expressions, and to satisfy
> >> scripts/checkpatch.pl.
> >>
> >> Signed-off-by: Yi Xie <xieyi@kylinos.cn>
> >> ---
> >>  io_uring/kbuf.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/io_uring/kbuf.c b/io_uring/kbuf.c
> >> index 63061aa1cab9..dd54e43e9ddf 100644
> >> --- a/io_uring/kbuf.c
> >> +++ b/io_uring/kbuf.c
> >> @@ -21,7 +21,7 @@
> >>  #define MAX_BIDS_PER_BGID (1 << 16)
> >>
> >>  /* Mapped buffer ring, return io_uring_buf from head */
> >> -#define io_ring_head_to_buf(br, head, mask)    &(br)->bufs[(head) & (=
mask)]
> >> +#define io_ring_head_to_buf(br, head, mask)    (&(br)->bufs[(head) & =
(mask)])
> >
> > Is there a reason this can't just be an inline function?
>
> No reason at all. But also don't see a strong reason why it can't just
> be a define. And generally I don't like cleanups like this, but this one
> at least made sense to me.

A macro can certainly work, but as this patch shows, it's tricky to
remember all the parentheses. An inline function also results in
better compiler error messages since the arguments are strongly typed.
And not applicable in this case, but if an argument is used multiple
times, a function ensures it's only evaluated once. I would generally
only reach for a macro when something can't be expressed as an inline
function.

Best,
Caleb
