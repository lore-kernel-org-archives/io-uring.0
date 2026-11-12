Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794470917;
	b=eLuOdZ57o4UV4GhTzbbUXSzRB0lEgvf7LdoTQjCB/oQ0rN69jRIGelutF18aqtTa9Vah
	 dDyhE2bQNg5euVOFhWaYTIZ51138a0LCeINH9PzLu4YF96OVwfru1bI57c6KgmPl6H7IP
	 0YychJoDLYbF8GcNofK8GhDsp3O7bD1WNw7wRtfZOjRfI4QrfXmERbk79rWUI7GtGthcj
	 EXoMeUOwk5SwvWBywDUyC3DzbYuynYQQto9Inv+LNwyaWRvYHd5TZglev0sKk2e6RVcZh
	 5gk3KqeefycfDiUrbmcj6CxWDg2Hj1TtP/y18do9739a9E4WIM7rdYYF/3Uc/UOCz4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470917;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kDMtd9AuZgk5VE9f/1gIA8QVaFrQdHJET/5OfnQ2nBI=;
	b=EOsE+5/l/kJ/zmHE9PZlewNd0EVgXh8aWq/XTUBdyGzm4zC/QcHKZa9UAawvRlunDfFs
	 V/6u6ZpQmvGfapDOWBnbAeAWG9NWnfrPXq3cCX0XjtxssiCyS0bLUlkt5JGkkWfdiswC7
	 1jYTyE9vge2X+6U2/GwAelkujF7Xzh8T8z+gfyqTcwJyhsh4647hu9XRboQ1uTmapvkZt
	 mts2j+IxfDp0WrGwzk39kfgXKaTEmjxygUSxTu1WSQkRyBhc9yU8NtGA/UXkTZtV6gm+7
	 yT2rtcxsZxeDno0Vzja+sCn6TI2ULgvYHwVEerWfFsvtfQVKVilwhLTNE3fSRyNRVIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hq1aCalB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8772E606A327
	for <io-uring@vger.kernel.org>; Thu, 12 Nov 2026 08:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8772E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hq1aCalB
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so2009184b3a.0
        for <io-uring@vger.kernel.org>; Thu, 12 Nov 2026 00:08:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794470916; cv=none;
        d=google.com; s=arc-20260327;
        b=fhNO/z2It6VmybvOc05mDtkb+jm+RqYJ5ThRlhavShPkQM8PGUnE57jwQJn95FqPB6
         AlDJCgDFOSwCyj9zkxnOnL6gIQ4hnTWTebRp50spf2W9eiC3UPoAJHWo0VmgZWvMuCqr
         MSt6GS+PflPvThqGrbW9k6Jdv2nnELNVvyIpnKIAxhrLg8C8f8clOwVKlQNO1i64HmRY
         uwQIY8d+aRUXmpvb4H/8Ak5mVTjBPzs1g+R9f6riXNudfW/WH99RwFoqXegXf3F5ZagY
         opVTFz6SenuCK9DSfM5a8Q7XWioNxZ3ss/DLrEePyUcijoeAo5M6iflIKJU5k+T81ZKs
         Lrtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kDMtd9AuZgk5VE9f/1gIA8QVaFrQdHJET/5OfnQ2nBI=;
        fh=kSkCXosG2S+ksG5C2J+8wkjGgkqrXcwf+Q9VdVFYKvc=;
        b=mpiulL52XlmzSEFmTTwNdSvPWGEwAjjg4+E/QeKJmHWOFcAAX0nmQV6sPqNY8hGkcG
         eD9VtJvyo4X9AmthubjJzbGQd2mM08i+QoBZyYHiTNNwDim4smeMnJ5BRRcBlNBk8o7m
         My0kwjyJpmlIx2Op7n6C9i1L7XbKzsBVZKbszzBdzQgn/PGUtJOvyVGxO9hJUPo9amPy
         HZalnBup8Dca9N7GLKU12TblQnbrAzyg7x8x07h7TU8durLJc9TTKrLub4XPuw8DyAts
         NYdrrQQy/8LJjPpcAtcp/4dGa9EmywIPxkN8S3xKCqrWkJ3DZ9112QKgCQj71pYLpYir
         RjbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794470916; x=1795075716; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kDMtd9AuZgk5VE9f/1gIA8QVaFrQdHJET/5OfnQ2nBI=;
        b=Hq1aCalBjUX+hftGAF0sQQvOE5y/T1N0TfViPwPBboDD/eT0ynKEYkdVjhd7Co1CAW
         iL5JHDieuIsiIepq75M/Ty4DMIJzCobwGeA8sC6YmiUgTTrc0QJE2kCM6wfvbclgFpAu
         ZJNbAwo/MZH53DIjLbUWyOdr4YxWkT7pmm7kmEDEkM0ziWOjpbXG8gvRw94C5tyt8lKN
         /yJn9UdUQ3e0S843pAIH5fn1WzRVkSnLEsAyi6ouE1AUzY5VbwLz/atxipHHhfXZKgI7
         80uJRVNdM5znG7ZsC9xoaN6eizYfIg0bWkMqVp2KpO6FY+QyxVCGiy3CEhMwN5jAm6km
         9OJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794470916; x=1795075716;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kDMtd9AuZgk5VE9f/1gIA8QVaFrQdHJET/5OfnQ2nBI=;
        b=2e9zCSRpHdZoHLv36g7J1cKONyC4MsH9hDHds0FzXddarlRkm9HgOWywWTu0vTrx3d
         Z52Qp2pcmBUkSetcKs5gJJBLm/pvTIdXuIsfeEfxA7vvyh/KXeqmuEaMnpQCCcaV57/T
         lIBJJYxBsq3D0GO6sr3iaVXu32tQsYsLUhLzHwyORf/F748w6Bk+ayg+Jzv1xP4eJxjF
         O6EV1MsiLonVe5iUZ1DJSEFuATtphDb/PNgBWAc3x25nvrcpA9pfRb+bOBlHObT69ZJK
         xDUW4j7u8qdfOKNP4uQKntob9rjZq6lEb4G6rGqET+KTQVQkD10W3dPF9EzwneGi4YRD
         X29Q==
X-Forwarded-Encrypted: i=1; AL+hErHwFGV7EpqGXj3zwBSSzoBcuZUxeCjYcBDG5AhbzyLTCpiJyg1u6Dz/ZTWUEwpoh9mAvGy+Gr/W2w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Y2Lx/uDeySURp08s5P3VXsui9VKFn0Qa4HqiyoZA+2D64xwVZ
	ZacIc04QGd4+tECUSLRPLTKtbR5N/LZcpAbM6neC0jxFQ1fcKCvsgt0yPVE/Me68AD07I7Purar
	jvyca/oCpeHdd1G6roHNPijHwDpXNUJ8=
X-Gm-Gg: AYBFou1DFX2z0y7nYuwrXCNqVn6MvDUzR4A2xkMAFS5JllFxK4Q8LgF8cjb3rp08pE3
	E/50EVXOhD4yER+eEzLa1/D8VVNgMAqhJOP3i1YmwdORrefN4cCii/ycJWYtdS9i6JE8z+T4p0L
	QnPZ+KkU0+Z0DzZA/71yVkRd+6doLjxWHbYKEK5zWTa1ULKrVU9InC/842IdnuYXa7vZNvwhxAt
	z8NodLuJg1mTyB/a4xpZsc66694/E1SiJ1y4WiRQhlZv9BwZZfyb+P1gOVwYJoMFCwmqvlFZGYf
	YW3lo3k+jw7TVqStRKlJy7NyjrHwkpKtpyWMNmUiBdCVOqZm/J5QkYiYarD6ckmZJrPYV8VfTLM
	S2Tn5KD5Lzh5phVfj68m9VcLz8iMwWQGrlOXmrRw=
X-Received: by 2002:a05:6a20:eec8:10b0:3e8:ef7a:36 with SMTP id
 adf61e73a8af0-3f2fe1b1765mr3423325637.31.1794470915725; Thu, 12 Nov 2026
 00:08:35 -0800 (PST)
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110102039.1002605-1-bjorn@kernel.org> <20261110102039.1002605-6-bjorn@kernel.org>
 <CAJ8uoz2JMEKkzO-V7jtreS9q1Btmo0URosXzBGW7f=jhFnUzxg@mail.gmail.com> <875wy3890k.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <875wy3890k.fsf@all.your.base.are.belong.to.us>
From: Magnus Karlsson <magnus.karlsson@gmail.com>
Date: Thu, 12 Nov 2026 09:08:21 +0100
X-Gm-Features: AclHuK9uAFcDfAXPRS66WSxOqj4MPsdyk4TznHA4ZGIRxwNJp8XNoIhiQkWvOq8
Message-ID: <CAJ8uoz3MYvKnrHrPee3pYHx5HGCteisAauah1+wjYz+eH3EKCw@mail.gmail.com>
Subject: Re: [PATCH net-next v1 05/11] xsk: Install UMEM page pool providers
 in the core
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, io-uring@vger.kernel.org, 
	Mina Almasry <almasrymina@google.com>, 
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, Weiming Shi <bestswngs@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stuart Clark <stuclar@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 11 Nov 2026 at 20:26, Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org> wrot=
e:
>
> Magnus Karlsson <magnus.karlsson@gmail.com> writes:
>
> > On Tue, 10 Nov 2026 at 11:36, Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org> =
wrote:
>
> >> diff --git a/net/xdp/xsk_buff_pool.c b/net/xdp/xsk_buff_pool.c
> >> index 18966bbdb5b7..c620a0c32c17 100644
> >> --- a/net/xdp/xsk_buff_pool.c
> >> +++ b/net/xdp/xsk_buff_pool.c
> >> @@ -104,10 +101,30 @@ struct xsk_buff_pool *xp_create_and_assign_umem(=
struct xdp_sock *xs,
> >>         pool->fq =3D xs->fq_tmp;
> >>         pool->cq =3D xs->cq_tmp;
> >>
> >> -       for (i =3D 0; i < pool->free_heads_cnt; i++) {
> >> +       return pool;
> >> +
> >> +out:
> >> +       xp_destroy(pool);
> >> +       return NULL;
> >> +}
> >> +
> >> +/* Only copy mode and driver zero copy use heads */
> >> +int xp_alloc_heads(struct xsk_buff_pool *pool)
> >> +{
> >> +       struct xdp_buff_xsk *xskb;
> >> +       u32 i;
> >> +
> >> +       if (pool->heads)
> >> +               return 0;
> >> +
> >> +       pool->heads =3D kvzalloc_objs(*pool->heads, pool->heads_cnt);
> >> +       if (!pool->heads)
> >> +               return -ENOMEM;
> >> +
> >> +       for (i =3D 0; i < pool->heads_cnt; i++) {
> >
> > Now I get why you are not reusing the existing xdp_buff_xsk infra, you
> > are removing them here for the PP case. Please mention this in the
> > cover letter of the previous patch. There might be a good argument for
> > it at least in aligned mode. It is wasting memory versus performance.
> > Today when memory is expensive and also for umems that are shared
> > between many sockets, the current scheme in the xsk_buffer pool for
> > aligned mode might not be worth it.
>
> Will do!
>
> > I have two questions for you. What would the performance be if you
> > moved the aligned mode over to use the same free_list as unaligned
> > mode and then use that in PP? Would reuse more code, but would it be
> > fast enough?
> >
> > If that is not performant, what if you instead decreased the cost of
> > the current pre-allocated xskbs in aligned mode by just creating a
> > single copy per umem and using those in PP? Might be a good thing for
> > regular xsk drivers too these days, but do not know if it will work
> > for you.
> >
> > I do not know if any of these suggestions would work, but I think you
> > should examine them as less code paths is generally a good thing. You
> > might also improve the non-PP case too by optimizing it for your case!
>
> Neither would help the provider. The page pool hands out net_iovs, so it
> needs one per chunk anyway, and the driver brings its own xdp_buff.
> net_iov, reuse and state are 69 bytes per chunk, against 128 for an
> xdp_buff_xsk; free_list would add those 128 on top. Nor is reuse on the
> hot path: the page pool recycles in its own cache and ring, and gives
> chunks back only when it is destroyed or its ring is full. The hot path
> is the FILL claim and the RX ring flush.
>
> I don't like the reuse[] fixes size tho...
>
> One copy per UMEM doesn't work either: an xdp_buff_xsk holds pool, rxq,
> DMA addresses and cb, so it can only be shared by pools of the same
> device and queue, and those already share the pool.
>
> For driver ZC I agree, heads add up with a shared UMEM: 32 MB per pool
> for 1 GB of 4K chunks. Unaligned mode allocates a head per chunk too,
> though, so moving aligned mode to free_heads saves nothing by itself;
> heads would have to be sized by the rings. Worth a look, with numbers,
> but in a separate series.

Agreed, that would be too much tangential work for this series.

> >>                 xskb =3D &pool->heads[i];
> >>                 xskb->pool =3D pool;
> >> -               xskb->xdp.frame_sz =3D umem->chunk_size - umem->headro=
om;
> >> +               xskb->xdp.frame_sz =3D pool->chunk_size - pool->headro=
om;
> >>                 INIT_LIST_HEAD(&xskb->list_node);
> >>                 if (pool->unaligned)
> >>                         pool->free_heads[i] =3D xskb;
> >> @@ -115,11 +132,7 @@ struct xsk_buff_pool *xp_create_and_assign_umem(s=
truct xdp_sock *xs,
> >>                         xp_init_xskb_addr(xskb, pool, (u64)i * pool->c=
hunk_size);
> >>         }
> >>
> >> -       return pool;
> >> -
> >> -out:
> >> -       xp_destroy(pool);
> >> -       return NULL;
> >> +       return 0;
> >
> > Agree with Stan that these changes should be in a separate commit.
> > Think also about if it would make sense to put your page_pool changes
> > in yet another commit.
>
> ACK!
>
> >>  }
> >>
> >>  void xp_set_rxq_info(struct xsk_buff_pool *pool, struct xdp_rxq_info =
*rxq)
> >> @@ -212,9 +225,24 @@ int xp_assign_dev(struct xsk_buff_pool *pool,
> >>          */
> >>         hlist_add_head(&pool->dev_node, &netdev->xsk_pools);
> >>
> >> -       if (force_copy)
> >> +       if (force_copy) {
> >>                 /* For copy-mode, we are done. */
> >> +               err =3D xp_alloc_heads(pool);
> >> +               goto out;
> >> +       }
> >> +
> >> +       if (xsk_pp_supported(netdev)) {
> >> +               err =3D xsk_pp_bind(pool, netdev, queue_id);
> >> +               if (err)
> >> +                       goto err_unreg_pool;
> >> +
> >> +               pool->umem->zc =3D true;
> >>                 return 0;
> >> +       }
> >> +
> >> +       err =3D xp_alloc_heads(pool);
> >> +       if (err)
> >> +               goto out;
> >>
> >>         if ((netdev->xdp_features & NETDEV_XDP_ACT_XSK) !=3D NETDEV_XD=
P_ACT_XSK) {
> >>                 err =3D -EOPNOTSUPP;
> >> @@ -267,8 +295,10 @@ int xp_assign_dev(struct xsk_buff_pool *pool,
> >>  err_unreg_xsk:
> >>         xp_disable_drv_zc(pool);
> >>  err_unreg_pool:
> >> -       if (!force_zc)
> >> -               err =3D 0; /* fallback to copy mode */
> >> +       /* An old page pool may still own chunks of a failed provider.=
 */
> >> +       if (!force_zc && !pool->pp)
> >> +               err =3D xp_alloc_heads(pool); /* fallback to copy mode=
 */
> >> +out:
> >>         if (err) {
> >>                 pool->umem->flags =3D umem_flags;
> >>                 xsk_clear_pool_at_qid(netdev, queue_id);
> >> @@ -301,7 +331,10 @@ static void __xp_clear_dev(struct xsk_buff_pool *=
pool)
> >>         struct net_device *netdev =3D pool->netdev;
> >>
> >>         netdev_assert_locked_ops_compat(netdev);
> >> -       xp_disable_drv_zc(pool);
> >> +       if (pool->pp)
> >> +               xsk_pp_unbind(pool);
> >> +       else
> >> +               xp_disable_drv_zc(pool);
> >>         xsk_clear_pool_at_qid(netdev, pool->queue_id);
> >>         hlist_del(&pool->dev_node);
> >>         pool->netdev =3D NULL;
> >> @@ -474,7 +507,7 @@ static void xp_check_dma_contiguity(struct xsk_dma=
_map *dma_map)
> >>
> >>  static int xp_init_dma_info(struct xsk_buff_pool *pool, struct xsk_dm=
a_map *dma_map)
> >>  {
> >> -       if (!pool->unaligned) {
> >> +       if (!pool->unaligned && pool->heads) {
> >>                 u32 i;
> >>
> >>                 for (i =3D 0; i < pool->heads_cnt; i++) {
> >> diff --git a/net/xdp/xsk_pp.c b/net/xdp/xsk_pp.c
> >> index fdd55265a6cd..c2214e718cdb 100644
> >> --- a/net/xdp/xsk_pp.c
> >> +++ b/net/xdp/xsk_pp.c
> >> @@ -8,6 +8,9 @@
> >>   *       +-----RX ring-------+
> >>   */
> >>
> >> +#include <net/netdev_lock.h>
> >> +#include <net/netdev_queues.h>
> >> +#include <net/netdev_rx_queue.h>
> >>  #include <net/page_pool/helpers.h>
> >>  #include <net/page_pool/memory_provider.h>
> >>  #include <net/xdp_sock_drv.h>
> >> @@ -15,6 +18,8 @@
> >>  #include "xsk.h"
> >>  #include "xsk_queue.h"
> >>
> >> +#define XSK_PP_DMA_ATTR        (DMA_ATTR_WEAK_ORDERING | DMA_ATTR_SKI=
P_CPU_SYNC)
> >> +
> >>  enum xsk_pp_chunk {
> >>         XSK_PP_USER,    /* owned by userspace */
> >>         XSK_PP_POOL,    /* owned by a page pool */
> >> @@ -30,6 +35,8 @@ struct xsk_pp {
> >>         refcount_t refs;
> >>         u32 nr_pools;
> >>         bool dma_need_sync;
> >> +       /* RX queue of the provider, NULL once it is removed */
> >> +       struct netdev_rx_queue *rxq;
> >>         u8 *state;
> >>         u32 reuse_cnt;
> >>         u32 reuse[];
> >> @@ -236,11 +243,225 @@ static int xsk_pp_nl_fill(void *mp_priv, struct=
 sk_buff *rsp,
> >>         return 0;
> >>  }
> >>
> >> +/* The queue no longer uses the provider, and its DMA stopped */
> >> +static void xsk_pp_detach(struct xsk_pp *pp)
> >> +{
> >> +       pp->rxq =3D NULL;
> >> +       spin_lock_bh(&pp->lock);
> >
> > Just curious, but why this protection of the fq here?
>
> After a normal unbind the queue is already stopped, so nothing reads
> FILL anyway. It matters when the restart fails and the old queue keeps
> running; I have a net fix that keeps the provider on such a queue until
> a retry succeeds... but maybe it's better to introduce the lock then.
> Let me noodle on it for the next rev.
>
>
> Bj=C3=B6rn
