Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2274B2033
	for <io-uring@vger.kernel.org>; Thu,  3 Sep 2026 17:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788456900; cv=pass; b=qsjOa9Q+ZWkV1tjMSXVeVaBUrehXnknyYwehqqd/KPYTNIXUuTuV3dSltCbspmODOjbPNAm3FUkVylRveM/siKbSu7Kjq3pIqH9VMuGVjFMq605njPzoQNL3h0xgaIohWEi5NEIpP3V6qpkKdkFet15qsFGgGFtoEg11v2G7lfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788456900; c=relaxed/simple;
	bh=B9D9nkqnvXNFHSQVP2bm3NFHJ383vXnuevpuXGgUI8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=niNDgWkPnVXHcLLMe1aZ7v+evPS2gacJW7Y4A5yPp4HYzmxQLGh4vvj9xlh70nP3H7v9WTQs5Q0SGnlMKgDMveI/gUxlgpsBU17ESzl2JDu0JBOpnlKVE5L7LeT9zoerzxWettGDoyT+oIItZfkz+CB7ouEe7LPyIAvOEq85eR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=YnRtbn3F; arc=pass smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="YnRtbn3F"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-46ac1963663so8407fac.0
        for <io-uring@vger.kernel.org>; Thu, 03 Sep 2026 10:34:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788456896; cv=none;
        d=google.com; s=arc-20260327;
        b=b1fXi8asAjZMU9ntv1lZHXs0sgGAF/pUa0Eol5tglMeiSmLkdC4FPiPlGzgOvF1fOd
         aQLpp71sPNkEDcsG+VkcFDKfDNNBOOoAljZw86rkeW4wCu5XlhBYKLrhU2svrzjH+FKk
         vI4V3t/cDtHTyv3pW7+qdLz5hgzSZVUIFfhKUj+4qlZEeIaQ9VWz1b6dBKcDyvG+OGPg
         WW+HrkUJrCM7KKbx9T6YZ9s7VocwXkqRQ/m6rpOO/24q+3b9Uwf3BC5VY9VcrokO+A9I
         zqZFtvaG8FsWUz10PcJuxw8bWl5F+kLsUP3VXa9NPhNeknj0mjX+3n92+xfnfDZ5Cal5
         r5Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7ewABu/OdmOVe+HOqk4r9aZ2OhRinVo0iIDSSoR7VOc=;
        fh=sMNWdlGpdqRkTb4s/W3Ezb5cDGz20kizZyvND55MMjk=;
        b=AyxPSkJXy5I8uc2IRgOeXst626VEELurEx/Ig4g/77f38ina6m1YWZapCHf7XiiVfy
         B5IvM81JG2lJReGpM3T7bhKUZ4nJ6imgMWZmj1NXt+6pDW06zGbZViX3YoHvBLB5grfp
         BM2/dzIEH9toa/Wti5/0X0ld9wO9jxfc23ArffX+d36M81gpxcptzyMKrxKt4H3x9gQe
         l4g3X4v/WCvmppB7TijPxJBRWHYdCu0jXKLaX4t/Q3YGZ4WfhJkm6jPfSV51MqzWa95g
         sjkhBnDs6/6dO+5hcCFGFbM+yPGJBYH/zN1b23b5bi7P/31wqQObzypxy9pzjyaw73HJ
         rLcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788456896; x=1789061696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7ewABu/OdmOVe+HOqk4r9aZ2OhRinVo0iIDSSoR7VOc=;
        b=YnRtbn3FqkEDew5AzNRRJhmWvAZjKlSR84zzZti7ZEOVCxkhho7DbCyrG3zxAP6kQK
         oysxkt7VjOeVhQuEJ7WHoR92tGH8avHd0sDstvl1qHcf4OWnb1j+Cs8mMBZp/yFVyLYd
         6vTpi6YqyknNqZDORDHTCZ7Y6sdos5OpiboduROiAxZq14Nk3FGcu2jWJMNK7rotU4Gg
         CQYjqphl0iLhHRoExpTwI2rMwzrctYBtrxSdJJdd+HEBfgVL50/aUQBpOg5aHf+fU2eH
         mPUQ6Ja0bjAcBQBzHhorQDyrqdttbxdgs7+qtjNOAoDrgJwbJ/eTrTR6UetggWyMBAQE
         rt9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788456896; x=1789061696;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ewABu/OdmOVe+HOqk4r9aZ2OhRinVo0iIDSSoR7VOc=;
        b=ECVpXXDr87ekOzjkllC7ZEzCW10ePD5ovrBJE4Ocl18uOq1hLveW7oB0p4uwPAqPJh
         Tua8yGTfpThDcJByAOKnHvhmCuWO7+NqLxxZ4Rpx+2LRVpA4izjonhMDmG8LsOGpjAeJ
         I6UHt1aPn4M8rHczQ3FsN4ktRILilsc7sg9T197GVUD/QGagwMzL1kFmjXtMehI2gSL8
         ndt2k2OjiGO2/+qBdq1aVoXmmXYfUOTwSH5/waXMMw6+ern2fUj1n2Mw2xz8NYTXXNxB
         f9o5FK03H5DbUknTZNnMikvi/lXcF7kuS7Sce5GV770XdY1TypI3jsElItcWX9OHU9kg
         9Qiw==
X-Forwarded-Encrypted: i=1; AKwUvBzdGEwrWRcvhXjGNvtVqypLfyu/24qM2YUzdSFI88aM/aAStKugjTwnicAw9o5Gh51//kLALYBpPw==@vger.kernel.org
X-Gm-Message-State: AFuF++nyTqRBMJGsSjA0EGmwHMrYsC4uFj9xt0z1yuZXj0Ufm6eqV/wE
	c6jLqsHsxg+uHz4gHcjR2VWdZIn5vmNTTUTs7pevbYShTzZNTaL01M09kkMOzaF2ne9Xl+5xfd7
	zjUrA1MszG7xNaRk1snQgqbaJ1tDg9YsApQE2T2y5pQ==
X-Gm-Gg: AYBFou1PWmc9j9I42j9mopnxOC7Di0o0ZX//dXQltp0WIOjOABnkn0QOpPYOeNtbPrN
	HQOzPvhw1HsNXnpo8wjIvajMsgqpjgHFtHV/eN/BMdij9hcKMH7+KlNERimKGd3xp3gKXCTK6II
	8WLMuJH/fOTbxjn7QDZ5zhX2cmutjQkvL2Nd2v0Tj5PcCq6lkhvRmHPDkDAmaVm8mUQWrOFeiJI
	RNg4RfB2CIl5vRVyPk53qVwG0ug3YheTI65eReCJPOx+okoUAxRodXShhijhCpjF8hfJaCM+CEd
	nCON105ysM5wwD2GoSpc/l8n3Ek8uVnuiyeo7fC3uzDY
X-Received: by 2002:a05:6808:30a6:b0:4b5:8402:958d with SMTP id
 5614622812f47-4b6bfbcfc9amr6567061b6e.5.1788456895883; Thu, 03 Sep 2026
 10:34:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902225708.2379840-1-csander@purestorage.com>
 <20260902225708.2379840-2-csander@purestorage.com> <CACVXFVOKGOEmefHmZpsBX-7uxGjzbaJiueYMvka8TDjccOuFjg@mail.gmail.com>
In-Reply-To: <CACVXFVOKGOEmefHmZpsBX-7uxGjzbaJiueYMvka8TDjccOuFjg@mail.gmail.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Thu, 3 Sep 2026 10:34:43 -0700
X-Gm-Features: AcwNN1W9WnICv9pGfNodLq9yLwaSICnIyXjRpvwIb40wmKIKgI6KwpbmnVrMA7k
Message-ID: <CADUfDZqFLMS08wq0bJWQwKpJL5k9ty1bruVFQFcV6juFVB-9AQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] io_uring/cmd: split io_uring_cmd_set_res() from io_uring_cmd_done()
To: Ming Lei <tom.leiming@gmail.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, Joanne Koong <joannelkoong@gmail.com>, 
	linux-nvme@lists.infradead.org, io-uring@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 6:02=E2=80=AFPM Ming Lei <tom.leiming@gmail.com> wro=
te:
>
> On Wed, Sep 2, 2026 at 6:05=E2=80=AFPM Caleb Sander Mateos
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
> >
> >  void __io_uring_cmd_do_in_task(struct io_uring_cmd *ioucmd,
> >                             io_req_tw_func_t task_work_cb,
> >                             unsigned flags);
> >
> > @@ -105,12 +107,19 @@ static inline int io_uring_cmd_import_fixed_vec(s=
truct io_uring_cmd *ioucmd,
> >                                                 int ddir, struct iov_it=
er *iter,
> >                                                 unsigned issue_flags)
> >  {
> >         return -EOPNOTSUPP;
> >  }
> > -static inline void __io_uring_cmd_done(struct io_uring_cmd *cmd, s32 r=
et,
> > -               u64 ret2, unsigned issue_flags, bool is_cqe32)
> > +static inline void io_uring_cmd_set_res(struct io_uring_cmd *cmd, s32 =
ret)
> > +{
> > +}
> > +static inline void io_uring_cmd_set_res32(struct io_uring_cmd *cmd, s3=
2 ret,
> > +                                         u64 res2)
> > +{
> > +}
> > +static inline void __io_uring_cmd_done(struct io_uring_cmd *cmd,
> > +                                      unsigned issue_flags)
> >  {
> >  }
> >  static inline void __io_uring_cmd_do_in_task(struct io_uring_cmd *iouc=
md,
> >                             io_req_tw_func_t task_work_cb, unsigned fla=
gs)
> >  {
> > @@ -171,17 +180,19 @@ static inline void *io_uring_cmd_ctx_handle(struc=
t io_uring_cmd *cmd)
> >  }
> >
> >  static inline void io_uring_cmd_done(struct io_uring_cmd *ioucmd, s32 =
ret,
> >                                      unsigned issue_flags)
> >  {
> > -       return __io_uring_cmd_done(ioucmd, ret, 0, issue_flags, false);
> > +       io_uring_cmd_set_res(ioucmd, ret);
> > +       __io_uring_cmd_done(ioucmd, issue_flags);
> >  }
> >
> >  static inline void io_uring_cmd_done32(struct io_uring_cmd *ioucmd, s3=
2 ret,
> >                                        u64 res2, unsigned issue_flags)
> >  {
> > -       return __io_uring_cmd_done(ioucmd, ret, res2, issue_flags, true=
);
> > +       io_uring_cmd_set_res32(ioucmd, ret, res2);
> > +       __io_uring_cmd_done(ioucmd, issue_flags);
> >  }
> >
> >  int io_buffer_register_bvec(struct io_uring_cmd *cmd, struct request *=
rq,
> >                             void (*release)(void *), unsigned int index=
,
> >                             unsigned int issue_flags);
> > diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
> > index 726a659f38c3..917b32a921e6 100644
> > --- a/io_uring/uring_cmd.c
> > +++ b/io_uring/uring_cmd.c
> > @@ -136,40 +136,43 @@ void __io_uring_cmd_do_in_task(struct io_uring_cm=
d *ioucmd,
> >         req->io_task_work.func =3D task_work_cb;
> >         __io_req_task_work_add(req, flags);
> >  }
> >  EXPORT_SYMBOL_GPL(__io_uring_cmd_do_in_task);
> >
> > -static inline void io_req_set_cqe32_extra(struct io_kiocb *req,
> > -                                         u64 extra1, u64 extra2)
> > +void io_uring_cmd_set_res(struct io_uring_cmd *cmd, s32 ret)
> >  {
> > -       req->big_cqe.extra1 =3D extra1;
> > -       req->big_cqe.extra2 =3D extra2;
> > +       struct io_kiocb *req =3D cmd_to_io_kiocb(cmd);
> > +
> > +       if (ret < 0)
> > +               req_set_fail(req);
> > +       io_req_set_res(req, ret, 0);
> >  }
> > +EXPORT_SYMBOL_GPL(io_uring_cmd_set_res);
> > +
> > +void io_uring_cmd_set_res32(struct io_uring_cmd *cmd, s32 ret, u64 res=
2)
> > +{
> > +       struct io_kiocb *req =3D cmd_to_io_kiocb(cmd);
> > +
> > +       if (ret < 0)
> > +               req_set_fail(req);
> > +       io_req_set_res32(req, ret, 0, res2, 0);
> > +}
> > +EXPORT_SYMBOL_GPL(io_uring_cmd_set_res32);
>
> Both the two helpers can be inline, can't they?

I also wanted to do that, but req_set_*() are defined in
io_uring/io_uring.h, an io_uring-private header, whereas
include/linux/io_uring/cmd.h is a public header. Perhaps the inline
functions could be moved to include/linux/io_uring_types.h or
include/linux/io_uring.h. If not, I think we'll have to rely on LTO to
inline these calls. I'd be curious to hear Jens's thoughts.

Best,
Caleb
