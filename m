Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C173385B6
	for <io-uring@vger.kernel.org>; Mon, 10 Aug 2026 17:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786383334; cv=pass; b=hiA10lx+YIKuPTpzEryEwSR0Xb0+aSdNEure0R6jBOyIFpjAlVVmiQ+o1gW1q/8rblXakIs4mOWZ1YN0kWM7lGbo9QiUDVEpeyvA098N55ARuCCDO/m9bCtH61jLjqk69e6kcgOE7kQ+iR6y2+3IiCcpwDeX2i3CYkVW9Fy6U7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786383334; c=relaxed/simple;
	bh=83OM+ZzwBqa7cwrYDUl8bybUqf5wsaalrEjaBLUCVyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LzINTODxT1+hVt0BW/dez6nsaotvGbenpwwE5jfeQscC22uc8li3AsCHg8mHdCCPCt6tsri+N7aYY9nDkyZAQ23usU4J269mic6wZql5kQaevBdlWtoAuLBlwhQb/ZWJY7cnU/JlLUkGwSPqQnOa+utyNU2WEVO2IP9iB58b/AA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fpg1E56S; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fpg1E56S"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ccdf36f63dso9295ad.0
        for <io-uring@vger.kernel.org>; Mon, 10 Aug 2026 10:35:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786383332; cv=none;
        d=google.com; s=arc-20260327;
        b=CfoeeWV4SA6Ovs58xhho6d68paFZgeTJbb7Uvrsapk/F+JA9pjB+pnEOYRZ5CtKcr+
         BN3d0VbaAgqzJgMzXInf7G2RSeXY9we/RSvCcLDLq0Lm0oEusVI9GK6YIA31ptyTyjFQ
         M8uwE8wLGiYEqkNzZubGXGwbB0+eBUgQiWRsH9tzHn8HsYJTXz49ti2rn2wd1FPCogwh
         sgOkFreRVbConA/xvkmxfykk6dW8yj69VtPNu+Mhyb8bktf9B9tv3k6aig3YIBbw0HXC
         Me/iOdLCn09Dw2YboA9iSI4+gXGvFxNA5WLeKi8sgXmMrUi4efzkxsSHtkDVXJ/biDej
         lKSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/YgXeISO2SBRzBurpPsKMrMG8HxjECkp46NJHBU6gTk=;
        fh=tEbCYTGdYBSLy3ocCnuuDpq46a1zqKnpr0iHUtdXhhY=;
        b=f/VO3KUpuvEjyjzxHFajlZbCMp2emEHPOo7R/RmnBpOYlbce6KRORwm0830Z0HXhv6
         NE25l8/o79GEQJ4FX5IQVd3Tri20ftBhqKfw+yoeXJOjwA3tiXIp1/r7HyoG8uei++hY
         z3CzA+qTSVdH/x/zMnNtnu9Agt1t3IWsXQVfdE/AqjNr3WOVkC27nBJT0Hh8qVwoFy7C
         4IUlzlkG5o/heuXoachsd3NKyD5S95Uvi7ycoKSHD1XOr1O0Oz1EFSOvHzdgIVuCDOHT
         sV0DmQTJxWg7rqJIc3i9QPFyhuSlC/kVVqztK7Y2s/BNRpT0uLn/mgDRuAhhjL2w5kgD
         hAfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786383332; x=1786988132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/YgXeISO2SBRzBurpPsKMrMG8HxjECkp46NJHBU6gTk=;
        b=Fpg1E56SIJuUUUF/qPjcHjm90y854v6vEBZt/RkPRRfEQ1sjiURIHtaegNMdGt5otS
         LHmwSd+nWZbZb+2jysooigZcGKxEeB8WfWdkJzfrpqhsoU6KnU1J4F3XiE++YKEc/Zyb
         3SwOF+PG2D/Ffx+XVT1MLcKp8aA1RQQwvdPqlxzPLtXo4ppvb706J4Uokck/1axpMPcW
         Aa9FMeg6juhQJQqA7SZ+kTsxdC9GJI1nl0DUfzMaGeIkVo+YNS//QOi1NisEDmhp8sHz
         xD62VPXikCADvwOCK2o6dBAjdhLPucKybVpl8KakRKmtjy5ShU3pf590j4S2f0iapnj9
         FNeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786383332; x=1786988132;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/YgXeISO2SBRzBurpPsKMrMG8HxjECkp46NJHBU6gTk=;
        b=r5RSrVznrOrBo7aSVDUR8qiJmr7WzXBrcbSYGphRuvhtTd9646mEIG99aNyC3XtcwV
         cnY5xWZmakKdf4iZ4xKUlRZ4Jghr6GpAAuPPlmitKGBGMBo7pEd88TJ+cVgP2zrLls7M
         uYzqsUwbfQepUnd0tKDGvOGJBKqhEH6RgHtLVMt9c8b6iET2DK30JDy7qR3uuE2PgXye
         hra5QUXF9EwZAeiDeyhigsqg5K/EyKFfujS7lOxMwGUbEC40RX6LBmD0qAeJGWHoeOvh
         stZokI6Gc9WEpKYMVg+6+L+/4jSlqF1xN9Gja39LcjNR1SJwSGZSZrDEUjjE8SoKxIzN
         IbaQ==
X-Gm-Message-State: AOJu0YxEdlKeWKLeH5/S+sq6++nLbJdqeJW27nBR96raApfz6FtpiD4g
	M+8mDZzuHfgdvwtkGkkdoNRM0Mfcy4qJ87cPCNqcQa5ep21zGae1GI3C4VjI6Paqcabqua1qvtD
	9YIvtglgZvMB9iIzsfbTj8oahnESE+uG3wF8oCdvgkniwEofpnprPNFwB
X-Gm-Gg: AR+sD10nRf2psKo/25XEtY9vSb8SL+ph5nmaI8AGC23L9VPaZrls2kArfFhzxGTeVnm
	TyfGOPIHKcEs1GGbyc5iLhimim/Kff3dk8dZbeSeQ2/e9dZxgFbwLZLTmwdszZyAlQeECgYEm33
	8TdBOELjQT3xC7DV8U23hT2L9RPOfiMVQaWYvH0j6Q6DGBNrZoZt88gFMxMKJnEhY+PkHXBrpKt
	agu0tWBFJkUJoDsMWLjRIvpqLSb5lRQK0Ml4cL7qOUpcSpsLeDTPduHQJ8vOLemjdm0tZeZ7CIu
	F1ipBmRQyuU9FslePk2VjbDyYMrTOkp5ijX235X80m6FmP/KRuZR5OvDOZhXb2bq5ai4LTB3fQE
	=
X-Received: by 2002:a17:902:db03:b0:2ca:4bb4:4bd with SMTP id
 d9443c01a7336-2d3108232b4mr346535ad.5.1786383331114; Mon, 10 Aug 2026
 10:35:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1786108672.git.asml.silence@gmail.com> <f769116a3f5267f06cb9a9a819d482ddea2e0852.1786108672.git.asml.silence@gmail.com>
In-Reply-To: <f769116a3f5267f06cb9a9a819d482ddea2e0852.1786108672.git.asml.silence@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 10 Aug 2026 10:35:18 -0700
X-Gm-Features: AUfX_mzuy_QSJjW1U_c3IkRCXmj6khIsaNUIONuibsGj5y0tANytNqlwlv2Nwqs
Message-ID: <CAHS8izN4SAUCUQySd+VTbdayX-Stj+eYOqAof+Vhi=EsRb93_w@mail.gmail.com>
Subject: Re: [PATCH io_uring 02/16] io_uring/zcrx: move RQ head/tail to
 separate cache lines
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: io-uring@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 6:25=E2=80=AFAM Pavel Begunkov <asml.silence@gmail.c=
om> wrote:
>
> RQ head and tail are currently put into the same cache line, which can
> cause false sharing problems when refill is run on another CPU. Put them
> into separate cache lines.
>
> Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
> ---
>  io_uring/query.c | 2 +-
>  io_uring/zcrx.c  | 8 ++++----
>  io_uring/zcrx.h  | 7 ++++++-
>  3 files changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/io_uring/query.c b/io_uring/query.c
> index 88a325736992..4321f0b94b4b 100644
> --- a/io_uring/query.c
> +++ b/io_uring/query.c
> @@ -38,7 +38,7 @@ static ssize_t io_query_zcrx(union io_query_data *data)
>         e->register_flags =3D ZCRX_SUPPORTED_REG_FLAGS;
>         e->area_flags =3D IORING_ZCRX_AREA_DMABUF;
>         e->nr_ctrl_opcodes =3D __ZCRX_CTRL_LAST;
> -       e->rq_hdr_size =3D sizeof(struct io_uring);
> +       e->rq_hdr_size =3D sizeof(struct zcrx_rq_hdr);
>         e->rq_hdr_alignment =3D L1_CACHE_BYTES;
>         e->features =3D ZCRX_FEATURES;
>         e->__resv2 =3D 0;
> diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
> index a096d44f7b52..fbc190075e2f 100644
> --- a/io_uring/zcrx.c
> +++ b/io_uring/zcrx.c
> @@ -379,9 +379,9 @@ static void io_zcrx_get_niov_uref(struct net_iov *nio=
v)
>
>  static void io_fill_zcrx_offsets(struct io_uring_zcrx_offsets *offsets)
>  {
> -       offsets->head =3D offsetof(struct io_uring, head);
> -       offsets->tail =3D offsetof(struct io_uring, tail);
> -       offsets->rqes =3D ALIGN(sizeof(struct io_uring), L1_CACHE_BYTES);
> +       offsets->head =3D offsetof(struct zcrx_rq_hdr, head);
> +       offsets->tail =3D offsetof(struct zcrx_rq_hdr, tail);
> +       offsets->rqes =3D ALIGN(sizeof(struct zcrx_rq_hdr), L1_CACHE_BYTE=
S);
>  }
>
>  static int io_allocate_rbuf_ring(struct io_ring_ctx *ctx,
> @@ -409,7 +409,7 @@ static int io_allocate_rbuf_ring(struct io_ring_ctx *=
ctx,
>                 return ret;
>
>         ptr =3D io_region_get_ptr(&ifq->rq_region);
> -       ifq->rq.ring =3D (struct io_uring *)ptr;
> +       ifq->rq.ring =3D (struct zcrx_rq_hdr *)ptr;
>         ifq->rq.rqes =3D (struct io_uring_zcrx_rqe *)(ptr + off);
>
>         memset(ifq->rq.ring, 0, sizeof(*ifq->rq.ring));
> diff --git a/io_uring/zcrx.h b/io_uring/zcrx.h
> index c1005f23caff..9ae0bf1c632f 100644
> --- a/io_uring/zcrx.h
> +++ b/io_uring/zcrx.h
> @@ -44,9 +44,14 @@ struct io_zcrx_area {
>         struct io_zcrx_mem      mem;
>  };
>
> +struct zcrx_rq_hdr {
> +       u32             head ____cacheline_aligned_in_smp;
> +       u32             tail ____cacheline_aligned_in_smp;
> +};
> +
>  struct zcrx_rq {
>         spinlock_t                      lock;
> -       struct io_uring                 *ring;
> +       struct zcrx_rq_hdr              *ring;

Is this not a problem in general for everything/most/a lot of using
struct io_uring? Should you make this change to struct io_uring
itself?

--=20
Thanks,
Mina
