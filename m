Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27AC4F30E6
	for <io-uring@vger.kernel.org>; Fri,  4 Sep 2026 15:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534117; cv=pass; b=UJig6xNgl/sTuM1Wvd1eJ8JmcmVKDmgf2yePbtPLE5i+Gl7O0BoIqiEmbChaVAGduUrp1hgcX+ThBR31uKkkYlTh+YmfLrxHjLLD8dQ8XEmbv8blfUbEPWJHU6GttNQmBI0COoTmIDio8N3DDan1DdknCaSH/AGN/mAa9d2QL1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534117; c=relaxed/simple;
	bh=qawKlECuj94epc81pQ0ynQTh+xHXUx6MRIkhuTgGTUQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WXtCeiTOKTu1OYhtImce1Zz63Fkz4xxzmGqBpyEi0pcnIkRWZvlUyif+V1zsU6/OwSa1cDldlwfuHxU9NCPZAgbacEl53GO8G3B2sZr/rqQtNaFvJ4GeiDksRF7C9mzVZsNQfEXhPD4WDMYtgb5DABwCYfkZBMwPCQfxVDcM8Y0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=G5Lo9wi9; arc=pass smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="G5Lo9wi9"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-7f4eb488690so57964a34.2
        for <io-uring@vger.kernel.org>; Fri, 04 Sep 2026 08:01:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788534113; cv=none;
        d=google.com; s=arc-20260327;
        b=PPgCaophkTwZD1dVxQC5ZZzh0DUYgIR414qP/cQRDSQPD/iVyodMn6rFkXau3JW9Qn
         McgrQMy3gJty4lAAbBsE/zpYDkLOP5pxZgseE2arh27Y4hEN7w6X+aYNFSqYmwQoh3It
         eCKGpYY7THl7czvbiApONkYRPxq2X41NWFV6Orf6BNmtS3tQHHAeoSap9amSGyb+HJJ5
         THkau3ZVp+Ig52T4NYUKs9yM9R3T480ui4PFVHu7JLfnHA+8EON3gOsULs5IVlLH59Oq
         fP9kvOuBKcqixAWC8bTon21VJqcnTMOjlZux/yyCyMHU+huNT8dbw0ExXasbqhbqSK57
         8m7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WIcM0Ila/fL0qXdyT+6C5ZW2M8LEsnOQ1TQjy3IHFIY=;
        fh=ek1/SOc+2T73ayZC4SEsNGKfLZybzTfcIhPFdtzVmA4=;
        b=pf2SxTQQWmsSJZEJQbaiANsF9RGK9pbWKD98wt4iI4oNjLiAwvpGcVzdbRftbl3A5U
         g3aE4GAXc3AYU1RdS/MrkD8btrO2KC8RPMQZYfuc3+JA1FbIdMMZ0VWIrznfFlxpcNku
         T24qkZPtC86pJkKjJ993T+9zLoPEo9DohHrY6qjZKwUZsD3EKzUiGfZMTLW8ONrazX3p
         8eH8MDn2OjHFH2fzDWtXAHJq59FQdFzHdHPWz+fneXktch5+T5zJZbiwsIhpcz0WnZNl
         BhmoQTGVvA4voIRpuIpU8kmRyIyd6OTz5ilCbjY1ltZA17o6BD52r/aOcr1eZrxfL1FS
         6DBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788534113; x=1789138913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WIcM0Ila/fL0qXdyT+6C5ZW2M8LEsnOQ1TQjy3IHFIY=;
        b=G5Lo9wi9vIz2qelbfApClafU5gpiWJqYajcAx0knOHDbf9UPwEhKxDx+DzDnFS114K
         UsxKBxtA1LRPP6o+ImbJT5FUaOLDHmhhVqDGP8WJSpOGW0pmqTq2B8/M83EjSiqwZ3m5
         SmcOG2p5djz+PNRoLWRtxp5NmhDNrFzLqAsB2l0CLjG50qiVl3C4z6EIXPG7my4iurgM
         yiIjp/99KISO296CxZAb85hdu7SoamDRVi7BOTK07N+Xofr0mm1zxTBCW16XOGJl5gNu
         pZapNW+0iNZqRypO/CgCLyMS9P0SjbOShnsR47dHsflsFpmenrJvQ+VpByn6ksAO+YuZ
         tglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534113; x=1789138913;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WIcM0Ila/fL0qXdyT+6C5ZW2M8LEsnOQ1TQjy3IHFIY=;
        b=PB9fzyzxIWGG2skQ69SOY8ykmACLqAELhJTNfNjKDskBYmDVaZ3/j0sv2WjS6KUUKG
         DbSF3KFY+zGaRV9Admb7Ys6O15K2X6C56u3ubt+NOnILiqeg5iLYXrecA1XI2XJou97V
         Gmzx+c3izmWt0Vfp22HUKq96ZFaRc2pLl0XuDONuymveDr/UJ5C5DRju9+r6DA7Es/TO
         fOq6VoU2BwknaAsOHCIM84Ii8fjgZh7axjP51hPXj3t1QpTlwdCCPqGY8E12N2BxW4ug
         Ut04M3rpVkZmwBqlyZ6PSUbSn3UcPkLVk2pLk1C8McKAc53OTWDEgi7q48gPAzchcDfE
         /M0g==
X-Forwarded-Encrypted: i=1; AKwUvBxq6F2VfFE0LEyDJlvjKiUzmXjVVgUUALT72z6jVCQ0tVwkFHompKKfSCQ1+Ikcm94TLfLaogx8kQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mDKQz/XOhJFWJftmF293qZmUJvyus8iomtyK02YGiybICMwraJ
	fzpLP74DOXUPLXbIZ4ZZtVlrM90xxsuEG9Z4+3FcuHLvdVUeQNtbfDqBdSHJnNE9YfwvI2xr2Eq
	kshdKkcoihtzbT4PtrST4avZ9rhueIwwVAYi7mEX5AA==
X-Gm-Gg: AYBFou1lprMrgWsajm4YMH0MnF3b/lzGtOpeKTK2WJhn8G/Og5Ee0EimzVYxqBmG19f
	I952buJsb5p9WxvgP5SN4xwCyCOeFIQS6MVb636gDOQP0NhFsfPQR0lXm5+wXrNy4iadPz+ojGP
	XMru+SVTLKcw5dh8mduGUBncccA0SzvFXlllN8AVABL98kg3BihGCtOEaQGzDib8V2vbaWfNSzt
	zhB1LXmLujBZLgcYkcmONW9bpZKGYFeFHT7actglI9Tqzeccw/SF1apy7+Pl9zFSvA4W9U1jL1P
	mltRXMuOqunKrMt0BWNL+ceQYZpYSG3fj+yrN7blnZVZ
X-Received: by 2002:a05:6830:668c:b0:7e6:6f9f:7445 with SMTP id
 46e09a7af769-7fa438c3fb7mr2967139a34.3.1788534113297; Fri, 04 Sep 2026
 08:01:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902225708.2379840-1-csander@purestorage.com>
 <20260902225708.2379840-2-csander@purestorage.com> <CAJnrk1Z=JgOGH3m8aMRcK0fBRtnHLQutHGc5aqht3OU3uMQ_qw@mail.gmail.com>
In-Reply-To: <CAJnrk1Z=JgOGH3m8aMRcK0fBRtnHLQutHGc5aqht3OU3uMQ_qw@mail.gmail.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Fri, 4 Sep 2026 08:01:42 -0700
X-Gm-Features: AcwNN1Xah8sd8LB6WNip_SsEfqly8NYatZhdOo3fb9Luj2iVfa_QtBKTXyBpkbU
Message-ID: <CADUfDZp2K5_E=PZ6rcyOzRPmRWSboKvTADmNT_L4W5mqoguX_A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] io_uring/cmd: split io_uring_cmd_set_res() from io_uring_cmd_done()
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org, io-uring@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 11:11=E2=80=AFAM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> On Wed, Sep 2, 2026 at 3:57=E2=80=AFPM Caleb Sander Mateos
> <csander@purestorage.com> wrote:
> >
> > In preparation for setting the io_uring NVMe passthru CQE results from
> > the blk-mq request completion rather than the task work callback, split
> > out functions io_uring_cmd_set_res{,32}() from __io_uring_cmd_done().
> > io_uring_cmd_done{,32}() now call io_uring_cmd_set_res{,32}() and then
> > __io_uring_cmd_done(). This allows __io_uring_cmd_done() to be made
> > CQE-size-agnostic, with 3 fewer arguments.
> >
> > Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
>
> Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
>
> > ---
> >  include/linux/io_uring/cmd.h | 23 +++++++++++++++++------
> >  io_uring/uring_cmd.c         | 33 ++++++++++++++++++---------------
> >  2 files changed, 35 insertions(+), 21 deletions(-)
> >
> > diff --git a/include/linux/io_uring/cmd.h b/include/linux/io_uring/cmd.=
h
> > index 331dcbefe72f..67f2ef700c43 100644
> > --- a/include/linux/io_uring/cmd.h
> > +++ b/include/linux/io_uring/cmd.h
> > @@ -50,19 +50,21 @@ int io_uring_cmd_import_fixed_vec(struct io_uring_c=
md *ioucmd,
> >                                   const struct iovec __user *uvec,
> >                                   size_t uvec_segs,
> >                                   int ddir, struct iov_iter *iter,
> >                                   unsigned issue_flags);
> >
> > +void io_uring_cmd_set_res(struct io_uring_cmd *, s32 ret);
> > +void io_uring_cmd_set_res32(struct io_uring_cmd *, s32 ret, u64 res2);
>
> nit: it doesn't look like anywhere else in the header omits the param
> name for the cmd, so maybe worth also having it here (and below) for
> consistency?

IMO the name "cmd" or "ioucmd" doesn't add anything on top of the
argument type. But I can include it if people prefer it.

>
> > +
> >  /*
> >   * Completes the request, i.e. posts an io_uring CQE and deallocates @=
ioucmd
> >   * and the corresponding io_uring request.
> >   *
> >   * Note: the caller should never hard code @issue_flags and is only al=
lowed
> >   * to pass the mask provided by the core io_uring code.
> >   */
> > -void __io_uring_cmd_done(struct io_uring_cmd *cmd, s32 ret, u64 res2,
> > -                        unsigned issue_flags, bool is_cqe32);
> > +void __io_uring_cmd_done(struct io_uring_cmd *, unsigned issue_flags);
>
> Maybe worth adding a comment that any caller using this api needs to
> set the res themselves before calling this?

Sure, that's a good idea.

Thanks,
Caleb
