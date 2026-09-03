Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172D21E8332
	for <io-uring@vger.kernel.org>; Thu,  3 Sep 2026 01:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788397334; cv=pass; b=De7X08O0wgDMsJ93CA1+XQfVAB7Gth+wYgOX5/s6NNFrG23FzX13TTUPrRBzPfs+of1IuVfZ8ph+jrRbuZlOIHrDS0jFc1Zppe5dzV5RMrHhtERVy2J4KVSHVurGc75gx9Jea1YOkkPYAsv+HkqBP1NwvlL5s2q6//9e4Mtm+h8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788397334; c=relaxed/simple;
	bh=2in/ibJ6DnVvRIaERbWNROa6RNT8uBB8AiXm+8vWTlk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qEGo0gYtCLtdGFUEIjv6gCagu3M/QfIhivBmIl4dr+6Bk4gHAawNPw/iNlQNlsQndhIlA7bnp0DfbDUYhrCk3xbTBMiCX1EbQbS58KLbds06Ybp8sVcJFhKjbvwGOMqcbj0Fg/8KrZfDlgRA4zRCeK+L9rOWwFinDbUO0oNjZqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIaVAXOP; arc=pass smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIaVAXOP"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4b383347fa6so404879b6e.0
        for <io-uring@vger.kernel.org>; Wed, 02 Sep 2026 18:02:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788397332; cv=none;
        d=google.com; s=arc-20260327;
        b=SJSBDDJkhIR3Xbv7NNJXs9/eIvJ/7C8/tU2xKrphyUmc57zT9m+1d1+z8jBvLWsEtH
         ufdIEbF3ikHDSFMqFZjjk8eRCAHmd8X/Lu1pWccd7voz/kCh65/pn3pesxe/ReZwCVCe
         fMHpdTbTenqD7zDUYt0XzefAbWwwPbqtnYqxd38YjRgNMQu9zFo9lO47vSSdqGagKsSH
         6PbXIRA7HdP59cWRF13QqcgqYyR2y/X0gGaNquCt6qoKIvfo/qJW1zQd5HpYA0iCEwVQ
         u6m3/ZsRc4HxdHMNvnZfuGDJErAsM0hQAqIC3SSHdr2b44YacVGQcJkSPKEZgTD0FgQQ
         Izpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v3T+l4YHBD5H35beFOk9ofILa5eFdJ/R8b9xIj6tzhc=;
        fh=+15fUp+IJN+cVJoLBWxsnkGn7Jt5361V9GCa11sQb9A=;
        b=d7Trwvkw4DnNTxSK6SGM8+b6r6fFFx1kg+chifDCB8TSXeKbcn6ukR7A+vhi05ten1
         Q4znIpdHUcU0Z1n0SOORIcFpKi2Q+MhzCNuEezgggq75XzImc+m1juz3PCUwNgW0TUAN
         8CdkrOmst25+1NTl7iGSzjJfdYEIgAJdRlTwPmFoUwijsVJV/qN2kncQNNR8QamwvHbq
         0M3HTt+BEHBSLIrVGJAQdoxWFKygVYjWK5GPw1DPQFnhV/h3vbL+Hko/abgVFodp6Y4z
         0CQvcCnxDIcY7JnTu+tf1vmR5+PIp1t+yPjk2cUTmbyNdfc8Pk+CK2djgkC3HbRV99p+
         cKxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788397332; x=1789002132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v3T+l4YHBD5H35beFOk9ofILa5eFdJ/R8b9xIj6tzhc=;
        b=hIaVAXOPc3oR/9FAmJQjB/IP6g1RyRfkd3KgypBYIwPlWCNPb6IBhwdLGua3ohQXrs
         TWfDeEqh4gFy3GBpzuOhcXUJoVn6R3kzu2KW/6ireEQFoSLCVCcjfCmXSXb8PwpFNYJE
         MfqUIywr3FzhiKtnZDAhY6X6BHdZFbHcSUaGRXODihqCG9ZCdghqmyHfhQN0FcS4CE/t
         6lAMSw8Q0X580eXET6YiudKtZGdPXJ6JPo3V+ho+McA+fDImqRaadh2T1JrhLJFsaeu0
         5amG2kVISzwoFKM7x8ULbErAH9WwS7vRvBkRo0fTMpzjHaM7z9ciyeOMeDCRb5dLR4aQ
         C/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788397332; x=1789002132;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v3T+l4YHBD5H35beFOk9ofILa5eFdJ/R8b9xIj6tzhc=;
        b=JyXdrqkytFvfWqYQq20vO6raHqGSYlXt8LrxHqah4sHeSzkOv2fH4T0/3oy+68AklE
         VEj5Uq/hCfDVmRc3j4svAAPNFbQuSczVsjIm4PXWtzYfnRF7p3b2f02AX4RMzDnRm6Yz
         nyf5+x7mfiOZa/rkCzS9zt+VTAIgieay8AgCgh/DiyyacILQXdvaqoFDwyvTsKCPQ1z7
         nlEnxOicAAe5ZmXokC3iLiVTUFN+hUJMBZpp+4rStOT++GmrwPVS20N4ESY7v9qEx8Tv
         z6IdQTNN1QuRktbNZr2wzuN0WIgOW/mQIpbxRVdX7RAtOBqvm79r+klmqLbzXbsVZ0t4
         odJw==
X-Forwarded-Encrypted: i=1; AKwUvBzWbnDmOVCnd6j4mmeBQ2o5rWbZckyFm2ar6b1woV7SEKRS1sujvL+Co8v41mcQZan/TBAKEmX1Ow==@vger.kernel.org
X-Gm-Message-State: AFuF++mswTDWKHtNmpFYcv2viq8EGqtDjBrPZdnmoxhhRHASDf/ueqC/
	iamUUY9ELhK1/yHIquOZTUkf4jaVuGIKlrzsL6KZgsZo20A0LHkvlfDMVR4XiJpVD0QCL0WF1oo
	kC2o/zkV6ayw8ElS+cFIAsEcXJa23ymw=
X-Gm-Gg: AYBFou3Pbfa9SoisS2caaj63PRj/3FAvzcGuatSr3nvbC11TjFdtbgJJFqoa813X8aU
	VcxCZF0M0ou6s8IpOqR2EiaxuhkkPE2yCVjjRhd058hPV52nWObbmMjuAxDvRSnnFEuk22SVhDC
	ILZRVN3tOUXO+rLd8s768Pki1qjEKhgLm/4ArGTdn9vgy1sKgcgGWXB4K5+ItsopZPYcZvvdT+N
	QcVXtIFUvO6hA1Ccpa8nSx7MAeYfnLSrjo47j/qraWSvuMHA/W47D84/raUmDj4lP5Yk8qZpsCy
	QhDaobhaPCWWGZJZw1It07nb7Bb8H4Evw97YWJ1EqsFjZ/OZUv6e3R/gesZk1eGKC5tJXfakOri
	jL7drNvlIDQG7Gye4AedR37HJoI5KZVnU6ze1OFRgNp5S
X-Received: by 2002:a05:6808:d4f:b0:4b2:6691:b019 with SMTP id
 5614622812f47-4b7db1bb378mr2124405b6e.3.1788397331712; Wed, 02 Sep 2026
 18:02:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902225708.2379840-1-csander@purestorage.com> <20260902225708.2379840-2-csander@purestorage.com>
In-Reply-To: <20260902225708.2379840-2-csander@purestorage.com>
From: Ming Lei <tom.leiming@gmail.com>
Date: Wed, 2 Sep 2026 20:02:00 -0500
X-Gm-Features: AcwNN1XykAeHlzgy4hM5DgNnLtYyOjWT7Rx-kVQ9tsCtGV9ZFST9dEGoIbiXETQ
Message-ID: <CACVXFVOKGOEmefHmZpsBX-7uxGjzbaJiueYMvka8TDjccOuFjg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] io_uring/cmd: split io_uring_cmd_set_res() from io_uring_cmd_done()
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, Joanne Koong <joannelkoong@gmail.com>, 
	linux-nvme@lists.infradead.org, io-uring@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 6:05=E2=80=AFPM Caleb Sander Mateos
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
>
>  void __io_uring_cmd_do_in_task(struct io_uring_cmd *ioucmd,
>                             io_req_tw_func_t task_work_cb,
>                             unsigned flags);
>
> @@ -105,12 +107,19 @@ static inline int io_uring_cmd_import_fixed_vec(str=
uct io_uring_cmd *ioucmd,
>                                                 int ddir, struct iov_iter=
 *iter,
>                                                 unsigned issue_flags)
>  {
>         return -EOPNOTSUPP;
>  }
> -static inline void __io_uring_cmd_done(struct io_uring_cmd *cmd, s32 ret=
,
> -               u64 ret2, unsigned issue_flags, bool is_cqe32)
> +static inline void io_uring_cmd_set_res(struct io_uring_cmd *cmd, s32 re=
t)
> +{
> +}
> +static inline void io_uring_cmd_set_res32(struct io_uring_cmd *cmd, s32 =
ret,
> +                                         u64 res2)
> +{
> +}
> +static inline void __io_uring_cmd_done(struct io_uring_cmd *cmd,
> +                                      unsigned issue_flags)
>  {
>  }
>  static inline void __io_uring_cmd_do_in_task(struct io_uring_cmd *ioucmd=
,
>                             io_req_tw_func_t task_work_cb, unsigned flags=
)
>  {
> @@ -171,17 +180,19 @@ static inline void *io_uring_cmd_ctx_handle(struct =
io_uring_cmd *cmd)
>  }
>
>  static inline void io_uring_cmd_done(struct io_uring_cmd *ioucmd, s32 re=
t,
>                                      unsigned issue_flags)
>  {
> -       return __io_uring_cmd_done(ioucmd, ret, 0, issue_flags, false);
> +       io_uring_cmd_set_res(ioucmd, ret);
> +       __io_uring_cmd_done(ioucmd, issue_flags);
>  }
>
>  static inline void io_uring_cmd_done32(struct io_uring_cmd *ioucmd, s32 =
ret,
>                                        u64 res2, unsigned issue_flags)
>  {
> -       return __io_uring_cmd_done(ioucmd, ret, res2, issue_flags, true);
> +       io_uring_cmd_set_res32(ioucmd, ret, res2);
> +       __io_uring_cmd_done(ioucmd, issue_flags);
>  }
>
>  int io_buffer_register_bvec(struct io_uring_cmd *cmd, struct request *rq=
,
>                             void (*release)(void *), unsigned int index,
>                             unsigned int issue_flags);
> diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
> index 726a659f38c3..917b32a921e6 100644
> --- a/io_uring/uring_cmd.c
> +++ b/io_uring/uring_cmd.c
> @@ -136,40 +136,43 @@ void __io_uring_cmd_do_in_task(struct io_uring_cmd =
*ioucmd,
>         req->io_task_work.func =3D task_work_cb;
>         __io_req_task_work_add(req, flags);
>  }
>  EXPORT_SYMBOL_GPL(__io_uring_cmd_do_in_task);
>
> -static inline void io_req_set_cqe32_extra(struct io_kiocb *req,
> -                                         u64 extra1, u64 extra2)
> +void io_uring_cmd_set_res(struct io_uring_cmd *cmd, s32 ret)
>  {
> -       req->big_cqe.extra1 =3D extra1;
> -       req->big_cqe.extra2 =3D extra2;
> +       struct io_kiocb *req =3D cmd_to_io_kiocb(cmd);
> +
> +       if (ret < 0)
> +               req_set_fail(req);
> +       io_req_set_res(req, ret, 0);
>  }
> +EXPORT_SYMBOL_GPL(io_uring_cmd_set_res);
> +
> +void io_uring_cmd_set_res32(struct io_uring_cmd *cmd, s32 ret, u64 res2)
> +{
> +       struct io_kiocb *req =3D cmd_to_io_kiocb(cmd);
> +
> +       if (ret < 0)
> +               req_set_fail(req);
> +       io_req_set_res32(req, ret, 0, res2, 0);
> +}
> +EXPORT_SYMBOL_GPL(io_uring_cmd_set_res32);

Both the two helpers can be inline, can't they?

Thanks,
