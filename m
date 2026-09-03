Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475835013B5
	for <io-uring@vger.kernel.org>; Thu,  3 Sep 2026 18:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788459072; cv=pass; b=El59FyAdGWF3U1ixUwCUoe3FED9TAYkLresm8/hEvAOJ2neMkO8u9tMYzzQZ1htqH2itWaEcJwJGRzb8GTuunt6yrx7HnKQW2wBdCbbc64IPXqLbDvnmZ42uWZSalz7qNGcO7Td1EkaLo20gsXCz33GXY+bV5kP3Uzt1A6k4JlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788459072; c=relaxed/simple;
	bh=fXxBVZFHxevQj8B2WKb/l5YHw97kqKkmToXCtWsCBCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K9CJ5PvKt7OeIRhMQAyXHM3lAjX2AthCPSbP1NPa3jkcXvO22kH4jN4m+c+nhTYXuMQsPzGcqfzuKcAhERWVYtfvR1+oFT9FmPpc08UwvSpjRunSAl5z2iLEkOl72Pf+iDYHEUdYI4YTO3RlegS5JweMLc1wnipPhBCD3qlKTpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gisZZoLH; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gisZZoLH"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so1959765e9.2
        for <io-uring@vger.kernel.org>; Thu, 03 Sep 2026 11:11:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788459068; cv=none;
        d=google.com; s=arc-20260327;
        b=MeMIlfUiO11vSuL7uWJsMOQW8Ph2It/E3uuXdhwQA/VUytRfE/t607jj3iAPCSrfYF
         mMBsQCdJHrIO7r8LNLvVu0oS8eE29a6gUUQCBsDjhd2qXIXqDqZEvwS8Lrlw16k7W1Ur
         GnrczQfDr9v5dQkElb/6GPeHIMxREPVCd9g9cZG/5DyAVhW/ax7NV1+DHkaDgwtXw1SO
         VxDKdTCVlXxZDSxNeJwJdun/sHD23MkaNZ5fLtR6i5cN53eW2VtEBkQaL5/Ug7bn8Pvw
         d0otfK/V0VMC2dDALrGJCMrTaUk1Y22vnsNu832u/BVfL6/4mUG3OMCu+UQYJ9H23BH3
         rLWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GNUdEEWKQVjdN7q8W0TVhZs4T4y8jeYY4j1GTYsuFeU=;
        fh=iYmE/Psbnr01cZ25Kln47ef1dBN/KymjqFAk+hYqS9k=;
        b=NbbyHO4HE7bN6Ggrxt5tokyhi9QBnalxzgwAXc3W1is5xqwqTy6lFcGeztcr71mci7
         bvvwAFPHH5TMcATgNUiGETtS38A0ZztMgVRXyz+H7BXdbYKV9Un9VGksdiJ8DhdDBydH
         u1aAE70CuUbR6NyVpm6KRx8eRgfrFhqnXkAvHhuAKdtI445z/+7Toctf8v7Xop5uPTe7
         26p5nXkttRNFTiAmbXKtNV++/pYOacxSnfxtJZkVOTesvM/7zBIFFQSSkqgV3pzUA/Zc
         OpWNiNpHvMjolkRHZQ96bqbcuItnTdQKAI6RWwTX/PKN2kO5abIKT16WxEIlinFfV1Vi
         lZlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788459068; x=1789063868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GNUdEEWKQVjdN7q8W0TVhZs4T4y8jeYY4j1GTYsuFeU=;
        b=gisZZoLHY11v8NMjqTv1Ri6KYmcDG9cqJ+uYj8XsCAizk/X0Dy6gMQE1+OCpxy5BF3
         TWx2/dl2Pds3alDtoiv/QlwZH5DTor+UnK//cc9bjk2Jz3z6jnl0kVmgsJYo1iWYqhZ9
         3sF10kKkTk2XIDYKIvSxl1ZzOJ2FIxM+phzIM5q5ucyfL8yLOf1mCZFoJxG49E9GgWZs
         MftkeWyNN9kQYiAvc/yu1rV9aLJBGk2rkl1g8M6mLpSeiGYp2wqbS3JZcZNXG/gfElAX
         S2AP0p8VbNcRNALxqwzcuZ0VzfRBOIwFoMur9Juw+B/FDnGfVKwnG1h5H7EjdQS43or3
         FtPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788459068; x=1789063868;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GNUdEEWKQVjdN7q8W0TVhZs4T4y8jeYY4j1GTYsuFeU=;
        b=OIkCkd20wDyzGmOAP7qa4hrLyWj51TY8xJ2Gw5gVLEYeBhhyz+3nQ5vOLYazNkXuP4
         mOdCZR0k1R9D5kUIVR15kMiHtRHUPk56RLvM6ooicDjbDBmQpsta6BDRzHMP90SbvU1n
         AZzjOL/pnVJPwWBS8ElA74HLHv/3qgQKc9o9SAIlhj1C7FDejS0g/SG4Aggw7R5r+PC3
         sbeoTec0eeqIob1v2haxmTCLCfqNbpCPG0Ar5AkmG4nsePO1d2lWlsrzTBoq09iKxo/i
         FyzX0BRjUFTB6GbLtdJOcFkZrtSkOFlHqN1GrEKs7GrD0k9n36bOR2qathB3rCmtw2n8
         NbiQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2jyt/mOto0JxXUmDxzWZsC8WndWQxF9XfgIlr32lji77XTPN91cwO9v2kAouuNay5sQcjxWe29w==@vger.kernel.org
X-Gm-Message-State: AFuF++kKEF9QlO2xlVucko/v6xeIT47l/PPkxu819BtlICAj29IwWGIG
	An0czxHTVG7C0rSVp0kMyKFLgt2vsleXnuWzcyE83z0IhyNMtgFuWHpQSovXRPn10cMWF7v4pJO
	GyKAOBktdPyVgHHLqk2OOQvLaBXi2FHY=
X-Gm-Gg: AYBFou2su7GmrYiA50fTOq2iwTojvJc6+Jux3hCLaj1hbvxiwWrQ5w38T4cnCojcvrY
	FIvEOIxQ86cKGSdzaZQoErxONahPY72tBOHR0xp6oQE+7zmjq4LhODD/8b61+ZwUyilkgVLQUAO
	J8gzgrGwTqaVuoPABdKnR60kpnAxHRTWPPzYsr/U3nPXqIvNz96hrSZ2GN61fpSLm9Uy5a60Nbm
	ffBs5KlXVfAzjSuYMsewEIYK204DntalILapFWLccgUY5lK2DyPc1VMDTNX65j8QNfSAron4cCX
	E5dSrgj41stB+ifNPjAowDyApJ3T1QaNRGMOcD9z7T0lMjrFyMQctT9B2Xk/CCx2Egz00VcvAx1
	0j+xq/tfURuu/KU9h6MDakYCt2HA=
X-Received: by 2002:a05:600c:3587:b0:49c:cee2:1697 with SMTP id
 5b1f17b1804b1-49ce583bc25mr243260895e9.16.1788459068282; Thu, 03 Sep 2026
 11:11:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902225708.2379840-1-csander@purestorage.com> <20260902225708.2379840-2-csander@purestorage.com>
In-Reply-To: <20260902225708.2379840-2-csander@purestorage.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 3 Sep 2026 11:10:56 -0700
X-Gm-Features: AcwNN1Wk1maw-DrWq2_P78Fm26WaqGkngFVI3rHwve7qSgVEiY7UO24DLet1Cpo
Message-ID: <CAJnrk1Z=JgOGH3m8aMRcK0fBRtnHLQutHGc5aqht3OU3uMQ_qw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] io_uring/cmd: split io_uring_cmd_set_res() from io_uring_cmd_done()
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org, io-uring@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 3:57=E2=80=AFPM Caleb Sander Mateos
<csander@purestorage.com> wrote:
>
> In preparation for setting the io_uring NVMe passthru CQE results from
> the blk-mq request completion rather than the task work callback, split
> out functions io_uring_cmd_set_res{,32}() from __io_uring_cmd_done().
> io_uring_cmd_done{,32}() now call io_uring_cmd_set_res{,32}() and then
> __io_uring_cmd_done(). This allows __io_uring_cmd_done() to be made
> CQE-size-agnostic, with 3 fewer arguments.
>
> Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>

> ---
>  include/linux/io_uring/cmd.h | 23 +++++++++++++++++------
>  io_uring/uring_cmd.c         | 33 ++++++++++++++++++---------------
>  2 files changed, 35 insertions(+), 21 deletions(-)
>
> diff --git a/include/linux/io_uring/cmd.h b/include/linux/io_uring/cmd.h
> index 331dcbefe72f..67f2ef700c43 100644
> --- a/include/linux/io_uring/cmd.h
> +++ b/include/linux/io_uring/cmd.h
> @@ -50,19 +50,21 @@ int io_uring_cmd_import_fixed_vec(struct io_uring_cmd=
 *ioucmd,
>                                   const struct iovec __user *uvec,
>                                   size_t uvec_segs,
>                                   int ddir, struct iov_iter *iter,
>                                   unsigned issue_flags);
>
> +void io_uring_cmd_set_res(struct io_uring_cmd *, s32 ret);
> +void io_uring_cmd_set_res32(struct io_uring_cmd *, s32 ret, u64 res2);

nit: it doesn't look like anywhere else in the header omits the param
name for the cmd, so maybe worth also having it here (and below) for
consistency?

> +
>  /*
>   * Completes the request, i.e. posts an io_uring CQE and deallocates @io=
ucmd
>   * and the corresponding io_uring request.
>   *
>   * Note: the caller should never hard code @issue_flags and is only allo=
wed
>   * to pass the mask provided by the core io_uring code.
>   */
> -void __io_uring_cmd_done(struct io_uring_cmd *cmd, s32 ret, u64 res2,
> -                        unsigned issue_flags, bool is_cqe32);
> +void __io_uring_cmd_done(struct io_uring_cmd *, unsigned issue_flags);

Maybe worth adding a comment that any caller using this api needs to
set the res themselves before calling this?

Thanks,
Joanne
