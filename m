Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625EB49B1E7
	for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 15:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141506; cv=pass; b=uyPb+yvRSygYfOJ0dKvyk9sd4KXEnMnzeFvElleuP4JgK2XtpkN05xI/vn816BBoon+W/cvTMcduEmDzOm4N7EcFhqXB+rR34v+hK/24SCrX2OHcaO78+4lrc5G0n4ADWAiaQn18u44MlxZTV0dQ2ym8myMxyBmLw0wr4vw7+m4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141506; c=relaxed/simple;
	bh=eR+DZtjxTGHsnzJaTy1dHb0uzl5eFl3JiNNFfBIoHpM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=puY05Dbn624NR/k1RhBIXOpzqO5iBWgd6s7YwsLXGBddPgx7wfiC3v2kGf/Jr54BA/LqkKCqKc3IXJl3Y59qfE9dkQXByN1M0vlr33/RJWLhpFtVruw6Q8mBWr00K0VB0IL6TXm6BCZVfjY/3fXbnIBVaPLMwW5FG7acvZymgkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m0yJXpyo; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m0yJXpyo"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d6ff390a6cso5095ad.1
        for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 08:45:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789141504; cv=none;
        d=google.com; s=arc-20260327;
        b=BHCzlINiey3dIhEMfKPD+HTAinL2Hod9Jr4N1jTn5hr6oEFw7pETzIFqBWwowZoSeq
         ue6ui0vb31mIelczmv/kj/PmN4u7C1CQd3g6jJBm2m0Dw2yHgrfDV6FACzcgQjOXieuZ
         pvqTnSuL/vGtS0+z9LmD3NC8ki2jC0HtJ9zHOKNpY6ZS5Yx5u1BFTumAl8Nm8g1A9gK3
         eSd5E9qVivmwLTIy++oJhhzUcPiuT8VxsaawpG7/TBWNKz2CTfuBbK4xrpzmiLcrZUvG
         5x/Ec0LTV6wdjFvN3TuOWlXz2XQOkXW618vQQwI2q5r8nhgbw3UNMSnx//++BxqYCk0s
         VE3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l5edhVg2tXWRMX3roRkpySjER0cDjb+C0WlaE36JMtM=;
        fh=Io+e6O+83hdfP9SZuz9KVbmES+pej7kUHYBry9Liwl8=;
        b=gcffX0ep+SwxrSvs1DLQoF/n9pEyx4QDuX7UIithJSO3MpGWYpd5CGvYm8E+EqG8Hs
         48XW6bq/yO0xPk6J343r2iGkWySI1Xcm58PivardrQwPT2tJchtKtPziLQUQe7ML16R0
         N4iYSWnVPhGWaXgi/Rneg2F0258hE6cQCT3R3sKpC3/29uOIYUaA8RPxMGoI0OAvvsar
         3cCy81layVvk+qnHboOBd7/4Hdv8JsKmzZnG1hQGDNFTDri0okvCqwrckZZuP2ygsOqB
         w/KB4uUrgeyLTkuFok72uW63iXeAjcfR15oZHE+ycSoUrdAWU/IgZdipm1dE26UxMzQh
         s8ag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789141504; x=1789746304; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l5edhVg2tXWRMX3roRkpySjER0cDjb+C0WlaE36JMtM=;
        b=m0yJXpyoZENCFLYprd6KfU5Nz82ynxYx1fpIzDbsuzUOB/a86AvSI2EDrX+3IO99jH
         WwHuISCy0XtBBYNoZ6hIvuFbL1kN8hbyn986CNHUJnOiPriJhYC3vjYpZhGwYEcOjLVI
         /oUYq1PyQHgd9/I9gRxkOJllefDost0GQA0OejMO/EniTGyeWVvU+hi1hwDNtj+7GYl4
         V2FlK0YzhF5v3UeQq8jOov25bx2+CQrTljvoIIhm9V4lcl7/UzULXRM9tsdJ1lheOp3z
         DeDy5e4sTWQftInT0AFWKopbQBFabEkBpf+PIk9WG9ps+r0oh8tYTZsRZK2GKeGwHpsQ
         ltLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141504; x=1789746304;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l5edhVg2tXWRMX3roRkpySjER0cDjb+C0WlaE36JMtM=;
        b=AU6apqv6x230UHvp7X0/61Ph1ZI+9RV7H9nMTdZW4TwShOeyW9K+DxqmzFspb3VFpK
         ttYPo9NUL3QkjfTBlYihPGqYRqlyI9HmrJV1Qe88X/YrbHmuDRtAeJPP2hFEAiBjEt8Q
         MZIJDfi6yTh3skrgeLpz6jnjHLGU8jG93aebJ0tpe6PjqlVdq9nTAm+zk2jqEpDPo65y
         5kiBOGslJwwtul5DR1NrcQVTRirnEzVEyOMOuVAVuX66tTpbh7ciRN/8affLoKWtX+IO
         PcftDfo0j+dhU/16Zsnn3WmnTpHEz5j3ljbPGmIfBErJdoUUJOSQuY7EZN2ZiXSeKotC
         JNfA==
X-Gm-Message-State: AFuF++mDplGKr3lUb5yCQ+Retu7rDHW/lgnIkHJS8g0SxuA8Rxue2euO
	gAOFGnAEoW5Eu+7d3DyovrMiRfI1vtIuHSBvQSmjQIkWZmtTEU/K+gnzdJvxRMCPE4ejz8T3CbD
	yUzam+eQ9kwlwx36QB+AvFm72m39AIW0VvJVEuFfJ
X-Gm-Gg: AYBFou0YM3e239EOukWqzFc77vzcof0YT1gUVrQyDWXT8aeSFE/7jAMUHdAoyUHuT3S
	D6MMy7oz9jPfdPUaNOE8dUVZUUsPoefWPnjBM+4OPVnqMNIkCvEhubGmGP+xOP93n3znWgub9/w
	hXDPusrOe7N+JLdYaEcw+r42IMecbbhRlEpfyeQjjQdj0knXaf1A0gOv0mJbJkAD4qg4PKeIRUP
	+A0gxfHHEVx8RCTu3eC+tQO7QrPo3JATWQZ2djqHQPo6NXIYK9m3zrqrf+PogzLIaKHrmNDCdVo
	w5okq5VUGQj4FU0RJPJ2avUqKXRMQ/CyfGl1PrIw6Tj8a4cvE0iyQIdJmGYaZ0p3q3/8Fpw3YmU
	1UxLWH+0fDi75zU8xcNsIgI3K4MCRnEzBlpmWeO7F8w==
X-Received: by 2002:a17:902:f60f:b0:2d5:cad1:a2e8 with SMTP id
 d9443c01a7336-2dd2c9342f1mr8684325ad.6.1789141503667; Fri, 11 Sep 2026
 08:45:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-uring-fdinfo-tighten-v1-1-47c62a154aca@google.com>
In-Reply-To: <20260911-uring-fdinfo-tighten-v1-1-47c62a154aca@google.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 11 Sep 2026 17:44:27 +0200
X-Gm-Features: AcwNN1Ulz6FVkSYBUki9FpHmMBQr4IeI2P7Odkxp60h8A2YAlYBmqO2GdtEHPXw
Message-ID: <CAG48ez1dbEXQgvvAxchiiakym7KJntGFJ3f_obfnDwFouYZQnQ@mail.gmail.com>
Subject: Re: [PATCH] io_uring/fdinfo: ignore IORING_CQE_F_32 in last CQ array slot
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dominik Maier <dmnk+artist@google.com>, stable+noautosel@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 5:35=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
> A cqe32 entry spans two CQ array slots, so the last CQ array slot can't
> contain a cqe32 entry. If the CQ tail points at the last CQ array slot an=
d
> the kernel wants to write a cqe32 entry, it uses io_fill_nop_cqe() to pad
> the last CQ array slot with a dummy entry and make the tail wrap around.
>
> However, malicious userspace can directly set IORING_CQE_F_32 on the last
> CQ array slot, causing __io_uring_show_fdinfo() to read the second cqe32
> half from beyond the CQ array. Change __io_uring_show_fdinfo() to
> explicitly ignore the IORING_CQE_F_32 flag in this case.
>
> This is not a real bugfix, just tightening the code a bit, because:
>
> 1. the number of CQE slots is always a power of 2, see io_uring_fill_para=
ms
> 2. the ring_region region consists of:
>     - a 64-byte header
>     - pow(2, N) CQE slots (each 0x10 bytes)
>     - optionally, the SQ array
> 3. the ring_region size must be page-aligned because it is shared memory
>
> Together, these properties imply that the last CQE slot can't be close
> before the end of a page, so the "out-of-bounds" data is

Oops, sorry, somehow I forgot to complete that sentence, that was
supposed to be:

Together, these properties imply that the last CQE slot can't be close
before the end of a page, so the "out-of-bounds" data is in memory
that is anyway accessible to userspace.
