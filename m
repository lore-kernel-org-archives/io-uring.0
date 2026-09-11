Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A104B48F031
	for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 15:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141997; cv=pass; b=St5ZaGnAvHADWo/jBVehaFQ1AEqy2CC9AM5G4KBMpnxGApG9j9/0PiuuunvXmulTyvuhAi+oaXJfo7he4vd7BMrn49tL4H9KvtvTKjFUXq80/FuLAWxpjH7ILwI7rbQkHwbd1ddlMJpyMOS7mQzwAXzFrvOEh2jG+d2wAABOFfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141997; c=relaxed/simple;
	bh=Isnr+k3W8HxLA6E/Gz/qk3n08kGP4pNs8ypyyBdSk9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hmRc+Iiu6AGI+RpwDOY+AX2CUxSsq9XlLuSqjzj6QDsAFCiHUCp2oZpBp/Mu6zULnXItCiyU6ctqXCmNuPQhCkaI6W0NKgpM8su4VRcY+nVaardjEUuWUqpUxNtamg0XQ2epOYG4Outo1Fy+LJjXMg00dPjngnYFjSJS9s7KmTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dtU1p42f; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dtU1p42f"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff3aca06so10425ad.0
        for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 08:53:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789141995; cv=none;
        d=google.com; s=arc-20260327;
        b=FQAoWkFDJqkR3fZdip9w5hEYhG/Dq1zztdAu26typL2NRVvXneIZfBOr6nHZ+9eeMu
         5aa1J5hafH3PB02zhsR1PWldBcjjC8phNLsiP7vV57T+y3dGZg60spHmG7TH3osSlG5c
         rC9EwvCMO3m+YvbCKjn6MOvtgFiylOPBKUcEsi0Q3mVEXJGnfIe6xczbsevYYpBbpG+Z
         1m9rinpnWRFWZg5E75/zfjQ7+uH062qGK1TiCNcqjY3BPg7Ou9CzD00xd3IHWwrSVg5C
         jzKjTR7kaaImB24V+HbaJKmQZHNPrB+E71yofLoTon3nH+UeEkTC92X0CvuWmJ1D0keK
         zHZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Isnr+k3W8HxLA6E/Gz/qk3n08kGP4pNs8ypyyBdSk9E=;
        fh=Io+e6O+83hdfP9SZuz9KVbmES+pej7kUHYBry9Liwl8=;
        b=iE16mb387jWux9FTuJqIAe0sIGP08bgXX3k/lUI5hxKKG7FtJOSpGxv/xiTefP01VH
         y6egzMOhXGo50WwwdfGh+URFsITigiOFkergX0zJie8JSpy+FLRqACzxywaXimfxXkG4
         aMahzTTOwwmxUhEzW3SyCQ3HC3P/y9HV+M9TsgZWBpnpShpJOfg8BGJ7o+RRyMUsezDZ
         zvYfgP6ED2LOTfjxqfrrdfORNAZ5OwOBNm6SljBirKUSYHYD+GbDStFT0nhxkeHNq5AM
         P66SUhowAcoOjqxJVGxclE2oo2Iv6I9SvncTmLvbBZdhFNWqw/VG0KUAvdiIYlxcTzZI
         ME8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789141995; x=1789746795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Isnr+k3W8HxLA6E/Gz/qk3n08kGP4pNs8ypyyBdSk9E=;
        b=dtU1p42fcC5IxTqlB9Qc3t1SnG6cNz5EegmwpuJXs5RZ5XKQPVZkUjiscDCWgZ8ih/
         MKWJJHjh0VoC4QcS9gNPrQUryy4zUGVt+R3gtUzIWG6hLRHoQyvz411jcMJ9FKl3Dz6/
         tCvLqL4LrDA0nymZrBlvFEIhNQCfwvahukJu6KgD0mugJa7IQ3V2ZPSGu8PU7THy193L
         5pwRMN4FOWh+WtTx256m0m5hd1tZx0oJctILsmLFl594HSaUsI+ZSMpi2nf3JxMm39D6
         wIYRPKGizx+WKFEMZlbHLdMR7CKQqIEGdzrDBVEoUhJkkYScsIoj6Y/CzasfrwNHKF9s
         aroA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141995; x=1789746795;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Isnr+k3W8HxLA6E/Gz/qk3n08kGP4pNs8ypyyBdSk9E=;
        b=C8moVWyuqYPNP3h7xItSiTQJezQRgrh+FrCr+0+MfAbv4w7oHuyFaLoy7B6PbnDLF6
         /UUSkD73kqfZGMpDRBjzinycU0gqe6OjNuuOGmEyzSAnOj5KDPF8DUU/a5v3t59IzZ4G
         AIaGkJDlMlgb2LwQeExK1ao0j3P17astMIfmQkdQwpNzlJSXn9ZGWalmKTIw1dCk9TBT
         TKrf5uuEQfZHeh6Hfw92KGEzLFbfi4/TxOSLad8PlpeG92+py69zynGxXcG+kUD2P/tO
         QFVDiN07cfKW3a8FFcBVpHwK3f6reOfN7NG+LhIHhrknqoz/iCQtG6nLoUaQvLSP+BGm
         VOvA==
X-Gm-Message-State: AFuF++kIfwTI+arcZGfn1RgCj4amOS71CA8sAMR4UDDnEVbE3EjnwdhX
	uI1Q7YVRjHx+Dktz5ybzDTQnKQOtb/URyrC9xQyGahCfwFMjZMjXlfVR1eEOr5rocr5RhRI+4PA
	dapsjQon5PEAqhYEs/Sw1YkNmlgu4J8xxlBOx6Nom
X-Gm-Gg: AYBFou1lRQKo06Mun4w5ukF/utjQ6NK5lUzT6Z4UBqDQzELEWHl4Nq8YOBB9580iv4p
	9Wj6RYH8QmYsRcROn2ida3yYo1KcUaivXol9oCfZUQ6fLIBB+QsaTl+5Y3+Zu+LnCRA0Lc27gu9
	Ekc/Qff+k5H5ufgiiM9x+YakUuDlJC+hR0ZzutFlzVDh5cC4/Os1qTZD7ihdh5k6DVX9tKq9RGr
	U/POPW5JsacRkk9mRvANPLfcFSWhZs/BrgBcr0SDywHM6gS+z5WqC1ddIsQhxAFqCLgV4GVpA66
	/i6XrCb7TWbytRS0d7Lu/0trlQEATaTpxw/iLp4Q7A4M9qP55tE9r5Zb5Lk+daGVIT16ieGg8b3
	3n7xGU0Kih1Q4aMW/94cZLg/XieRuMD9Ngqbok46408dwYk+EKH1e
X-Received: by 2002:a17:902:cecd:b0:2d7:2a35:d14 with SMTP id
 d9443c01a7336-2dd2f56c2acmr4256765ad.11.1789141994232; Fri, 11 Sep 2026
 08:53:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-uring-fdinfo-tighten-v1-1-47c62a154aca@google.com>
 <CAG48ez1dbEXQgvvAxchiiakym7KJntGFJ3f_obfnDwFouYZQnQ@mail.gmail.com> <5a656a9a-afff-4309-9007-2fcb6d3ae1f8@kernel.dk>
In-Reply-To: <5a656a9a-afff-4309-9007-2fcb6d3ae1f8@kernel.dk>
From: Jann Horn <jannh@google.com>
Date: Fri, 11 Sep 2026 17:52:37 +0200
X-Gm-Features: AcwNN1X5POQcXKEYTUYARlopKaBVUQhEVDC4xGhc1P6zKPSFd5VbX0gIb_i24Zw
Message-ID: <CAG48ez2J-MwLCS1NHV1+Yu12JpxiiL7_qfN6+37CAdeVZ8wJRQ@mail.gmail.com>
Subject: Re: [PATCH] io_uring/fdinfo: ignore IORING_CQE_F_32 in last CQ array slot
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dominik Maier <dmnk+artist@google.com>, stable+noautosel@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 5:50=E2=80=AFPM Jens Axboe <axboe@kernel.dk> wrote:
> I did spot that as well, thanks for finishing it. Your fdinfo idea keeps
> on giving, at least this one doesn't really matter :-)

Ugh, yes. I hope it is at least somewhat useful for debugging, and
doesn't _just_ cause lots of bugs?
