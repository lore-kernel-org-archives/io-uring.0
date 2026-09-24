Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76D849D5BF
	for <io-uring@vger.kernel.org>; Thu, 24 Sep 2026 15:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790262141; cv=pass; b=HxJJgoWEAp+GPWtyk/t/uVf/B51rGAmuMkr/ggvOwuEnx4q0djE8pX/n1VFC6e8CN8D8cRXhsNvZYgwLDn9eLYi7K2Q75rxRuBKXqil3LSqg1n16My92zFpSsp/ZwlhLt0Btbtn17pUNiamWdPbyLoxuzPKoLU1glbux6K0Sp1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790262141; c=relaxed/simple;
	bh=ShNN69DhaJyHp2DOgt/K2M0XTHi/ubdDgTbCqzMNj2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VOzWVZNN6o2gRFka26ahyBzu4qFDS17EXT2nEJZJMz3rZ5g/0yYM5ZhMoqgItSYN6CyS0BqV7n/j/GvPXFA8txtAzRthmpitCE82jEg0aH4kCELxQMsCa5E+iq7hR6+2yH16rzwO/DRg7sbaa+WgTpMDMM9Jp8qWHEhxK3/WyP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NS8IdrKZ; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NS8IdrKZ"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6aae147ef9dso541a12.0
        for <io-uring@vger.kernel.org>; Thu, 24 Sep 2026 08:02:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790262138; cv=none;
        d=google.com; s=arc-20260327;
        b=gJd8OpzItz7AI7xZs46wsjgAMp5xscSlwNW2BXw1uZjg7MaKm611cmG8eaxg1sw7dO
         ekwd99O8jOIbuaDg5DltKQ65pWb/KeIC2Fy0eW6RMldGNmy4COH3zBp8B0FujEoAX0l4
         OebWFhNgJEtuEuIIOlhYzrkM8PgMypevwei5pRiyi2DeBVvBJkdTC1mkDEL5Vm657YhB
         6E07+d3+2Z0Al49JSi/e1Dz/JkTeJS6+KHJbSOTna/08vHtX5e2BOEjcfJhiOEUP31Ps
         va1UnBfN4fjtC9SlrE4i06Ky1mt5l+mi5s628cxmn3Yu9zwQvDrpPCwfTHTPwK2gGXOK
         kwEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5ZR1ILn9TYPBwHk6m2pP3jOeJW2/wKuJF/ueaZTjeaY=;
        fh=QaMCO0UgALMBqdVtRAO5CMOf7ZHpKuzzb4JfEBGG4x0=;
        b=E3PnoOsi8wP5uk0T3n9h1JNrrPYSAcby5occM9QEtFvto9C0YyQiQukv5VKDK7y5MM
         E6RQsLcT6vEYfsvZWmu2yDfEmdTN7ayhnDBwRuX3WNDsoXzFxjHVJOW7smDPxErk/oOD
         y9m04xPr+ji8z52R291olD22InWo73M2XZnVaIGfatk+jSsB31xnZpIwE9S1ELs+YI0k
         /xIuaKLuV7ADdkxB5+O3jjHBrDT8+Qc46tEw9HQI9YdpgDKsz0wWuWY0TptqkauwjD5k
         k/QWhIgeDO1Mf0zQIBincmnfjJ4KvyhdI1hitkaUDlUdA5cidr+UKmhQ0CiMlXprzTfY
         1Y3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790262138; x=1790866938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5ZR1ILn9TYPBwHk6m2pP3jOeJW2/wKuJF/ueaZTjeaY=;
        b=NS8IdrKZgZidd/QpJbi/QcgDVNY3tt3WV8wv08VhUXql6HTO/VfH+wjnpNvyjJZkzK
         gRrkgTtBFJgc9BryrLZcUdx5yxZ73/CUS6i0TLPj2MKXbvTuo3lWVnSwAh0LwssIJI55
         8wki8zgeegOsHKatZgPpmbPSJRwiIJaQOd34aNpUCEvjxGxceuQJ1a8ecgOFGpAGBteZ
         LXtg6bZ3sP5lT94lNwMFL4xWv0/8tA6kQespdg5qzuOxknUOA6jpZpstyfVS/7S6EbCW
         IwnblL8KVnuX/vQ2e853fZx9hcv5K9HGGFPUir3kfEGCpd1C5WUqTKtqkDHt9eldXI3C
         HMfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790262138; x=1790866938;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ZR1ILn9TYPBwHk6m2pP3jOeJW2/wKuJF/ueaZTjeaY=;
        b=F5x+4w6Dl4Csi5V/4CASV/P4Vy2+jWxVUGMcLwScu8bXZoJ41tprJ4DvMCF/HtvCuw
         pn7/iohlIreCI3r2hjA3qL6MjlM37h2Xm5f14WwyLSfI/+7ehfCe4YLsTm1/iWh7FhBW
         IUxmrsacFPArGL4obuO19S9u7nD8Ghj1NQ3o9RVcgVu3A/92vOceKwa89vo188vkBtSD
         6gExYJuc+HSJRhAJ6XE5xouEN8SDnM47Oh5dkOTWY5R08WgOrf2CmnPabo2VqCJfEnkU
         HZzdASXmLryMh4lsSUG5nzf9RTU+FCgQ9P0v1Lt+72q/y4BsUEbmYXxxfIR0cfsOXt0K
         UEJg==
X-Forwarded-Encrypted: i=1; AKwUvBwyk9J5UCR1BkOgR4Fp4o4ToK61PGlSVdlR9CaVARWhqwyc6vvEX3nJQc+KTb8g3pXcPGwLmugbGA==@vger.kernel.org
X-Gm-Message-State: AFuF++k4Nd2OgwZ7Ob0UN+AmwMOzUa89/c6DlDsIi894P9Zp42Ql0C8h
	cFucIYAcQkVwzRgVz9VnJTMe0GqzpGfyR94uYN/uQXWQdWQvu/9zgnjDU0rtt78kPogJZBukRQz
	mh2ZTRPvuHVFd7tQn2kRBHf8vWv3N28D2zASVWcDY
X-Gm-Gg: AYBFou2DTM6Z60mBPBjYqyM2A3q8Zlr6CJ7IT0B4xhL/p5PisRWIqXqa5rHxouqtRyT
	jV07QLyIfJ8oytcKEJge2ZGyLZnqg0gJa1WC/NvHF/yOUrMoRMI0lTNQLzj3AjzsG6Ip/eJ3HC6
	wYdKPqqsNR/HJI7fMc/UfyIx4q3mrlyxyD1JLS7KYBQQiaLpZ4FLvE4Kk5XjNUxLV6lcki87/4s
	zN8vUzzsWYJVBU5vj2neAujPu5Pz8/EuPX8OD6gyMN2OgQezI0SQE/gQyCtBug5Le0mUqbTnciJ
	n+w6m7XjpoKF3FOwyP9I2xKMAdO4VQbrzfTI9cOEMXHBCjLvF92yK3EPazE1U/HUmehnZPAk07W
	+lI7bGA==
X-Received: by 2002:aa7:df03:0:b0:6a6:32f6:2841 with SMTP id
 4fb4d7f45d1cf-6aac7cd8562mr60719a12.14.1790262136510; Thu, 24 Sep 2026
 08:02:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922204348.717198-1-sdf@fomichev.me> <20260922204348.717198-2-sdf@fomichev.me>
In-Reply-To: <20260922204348.717198-2-sdf@fomichev.me>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 24 Sep 2026 08:02:04 -0700
X-Gm-Features: AclHuK-Rw22mmYVrW2dkDQdq_DFu4D5I5rl1QgSsMEN2Zfe2L0z7rCIa7BiKQQE
Message-ID: <CAHS8izPwLBCJXM_0Df8P6S-FVwAq+TaRKn3uTh1h=33Ffj8VmQ@mail.gmail.com>
Subject: Re: [PATCH net-next 1/3] net: netmem: add net_iov_area freelist helpers
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, hawk@kernel.org, 
	ilias.apalodimas@linaro.org, asml.silence@gmail.com, axboe@kernel.dk, 
	sdf@fomichev.me, bobbyeshleman@meta.com, kaiyuanz@google.com, 
	linux-kernel@vger.kernel.org, io-uring@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 1:43=E2=80=AFPM Stanislav Fomichev <sdf.kernel@gmai=
l.com> wrote:
>
> io_uring zero-copy receive and devmem both maintain a bounded LIFO for
> net_iovs in a contiguous area. Store the freelist in struct net_iov_area
> and provide common push and pop helpers.
>
> Leave synchronization to area owners. Keep devmem's area adjacent to its

This could be a follow up change, but I think synchronization should
be provided by the netmem/niov infra, rather than the area owners. TBH
the infra providing an unsynchronized data structure and letting the
area owner use it and shoot themselves in the foot feels error prone.
For now we could use a comment.

I also think we should not provide _push and_pop functions, rather we
should provide _push_bulk() and _pop_bulk(), and the caller can decide
to only push and pop 1 at a time if they need to. The reason is that
in allocation paths, we almost always want to alloc in bulk. If the
infra had the lock it could lock once and alloc a bulk.

The free path is more nuanced. I think _push_bulk() is actually not
currently that useful, because page_pool_put_netmem_bulk() ends up
internally looping over individual calls to __page_pool_put_page(). It
seems like there is a very low hanging fruit optimization possible
here where we change things such that page_pool_put_netmem_bulk()
actually does free the entire bulk at once, and if the pp is using a
memory provider, it uses push _push_bulk() to free the entire stack of
netmems with 1 lock acquire.

But these can be future optimizations, so,

Reviewed-by: Mina Almasry <almasrymina@google.com>

> lock. Use u32 indices and counts, which halves devmem's freelist storage
> on 64-bit systems. Reject devmem areas with more than U32_MAX entries
> before narrowing the count. With 4 KiB chunks, the limit is almost 16 TiB=
.
>
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> ---
>  include/net/netmem.h | 28 ++++++++++++++++++++++++++-
>  io_uring/zcrx.c      | 25 +++++++++---------------
>  io_uring/zcrx.h      |  4 ----
>  net/core/devmem.c    | 46 ++++++++++++++++++++++----------------------
>  net/core/devmem.h    |  7 +++----
>  5 files changed, 62 insertions(+), 48 deletions(-)
>
> diff --git a/include/net/netmem.h b/include/net/netmem.h
> index bccacd21b6c3..da885d95ea63 100644
> --- a/include/net/netmem.h
> +++ b/include/net/netmem.h
> @@ -101,10 +101,15 @@ struct net_iov {
>  struct net_iov_area {
>         /* Array of net_iovs for this area. */
>         struct net_iov *niovs;
> -       size_t num_niovs;
> +
> +       /* Stack of free net_iov indices. */
> +       u32 *freelist;
>
>         /* Offset into the dma-buf where this chunk starts.  */
>         unsigned long base_virtual;
> +
> +       u32 num_niovs;
> +       u32 free_count;

Why not keep num_niovs a size_t and make free_count a size_t as well
(so that essentially we can support anything up to SIZE_T_MAX - if
that exists - num entries)? Do we gain anything by converting these to
u32? I know in practice in really doens't make a difference, but since
struct dma_buf->size is a size_t and that's usually the type we use
for memory sizes we should use it unless we see a reason not to. Tbh I
don't think the size of the freelist array is a big deal?


--=20
Thanks,
Mina
