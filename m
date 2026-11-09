Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794266057;
	b=oLWHqm4jCP5pGKRe1wZ2UqZnMuoOdK/9TaQsi4MzRW8hzGbC4DBg2uF5f8arT/GVQv1C
	 DsBV+UXqdDWozhoyMT+K7GVm3RnzGLro2+Lj34xWUH8k1jq0KbfaeYFrWtQ/2dcs/Ei/Z
	 8Cq5iK6H5JAfEWikwkdMMFzkmM4h+8Y7X5AYHouyuZFS5WqmIaJ9NIgaylkwdW0XNP9bW
	 /g0Bqv/9Vcg7eZi2Utq5b2BhOrv20dqzEnwIyJVgRomf5z0TuLushmoAah2nUcUJeZgOQ
	 EK2wvu1OVyYmU+vaKvnHemdhBMQDXrtYToMZPNiEA/7ozwhGPu6ilYgraZydr03XsEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794266057;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=fqXpBBcqphrOKEoud7aEvUgTXtSFkrkdQ70VK6Fy8AU=;
	b=H1b7v4PReBPag9gC3vbF/kyE0l26oflupgBWLc8M/QljYffROdzpCIiwvs30gFIUZ/yQ
	 +xKKSmhS1ieMm1VY3NFnTk/zVarJ34aWP6w0aUBQzhYTBem/3SUlIPnaSaMiUc81hFkUs
	 s1gySOArn2u6XDHCAVAOXimlC96DzVo0ORqI6/ZPGIQ6DFKKz4I6mHcBr7QfvG2CKzqOt
	 siRjhbstETwiDghnhEDOif3wyyV7BsMpMTbAIVARLXzQj3Y3mxfd1qc5tTCegrhjryjXP
	 LV/N0STuULUpbNBvN+KD/N+fSJnus+55NdWaGOX0RKvYHglWl6UgX0XrOLcwnboPA8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=DwtENfGg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEBC606A31C
	for <io-uring@vger.kernel.org>; Mon,  9 Nov 2026 23:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFEBC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=DwtENfGg
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-8212fce7258so101778a34.0
        for <io-uring@vger.kernel.org>; Mon, 09 Nov 2026 15:14:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794266056; cv=none;
        d=google.com; s=arc-20260327;
        b=Tsrq9MxeegEp9egtJasUoS7MafobAohp0ko2fAonxRZA9+0VBna7aTsBufBnYou3C5
         0HJXtmDWw5JZWUxdG8JNXXifeqhm1+Khqrt+YVGwe0LxzSIz9X1eUKfW7vqjYbYkFw7F
         bbGs1laZybulShQaompzkkP1oSgGjDkj3lpJSVnqH08wuegDWxK269IYK8+cdIkfLu5n
         Qm1fQN5KCPaHv7IF1693oFAcPiRL8cKzVO9zTIFxAD/DohgQKfmhclumv4fZgZLgdbUv
         lmbmViiT4x1hGqcx+8GKcQ05Gg+Vc0SYujb5F9hHpIjwFdgLmdcqXBTaYLLtfRTKf4af
         KgEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fqXpBBcqphrOKEoud7aEvUgTXtSFkrkdQ70VK6Fy8AU=;
        fh=UjUPYjCyuUY2Mb2LfpQI9V6TSxwVKRTjKeLIVK2k6xw=;
        b=NmvuvSAs7KWi9O07Z7syuP5Zprpjm5YXqTo2C0Dd6vQP1uk2gk6WQdunqQUd8OSo+c
         N5x3Dia23WlOS3aoA/g5cz6cJbqx2/3vnmXbD+jNm3KHQ45fgd3O46/DSTPZhbDaDAGA
         QzkoiAePzU0AW+KCeO7V/tPiogPhoo+4II/GJoGgglbBAN2mEs2FHwClXnltl7+l47Fg
         tbRc8/ZogxRFLai9NZGHHK9qbjEHbpiJbOC8mBH1jZOGjSU6FFmSaxFSEprBzk/NnQPE
         9t3O+Qo11M604cmv/GUh1DCkilhdO8NT7KakBXS3KNDJP5dRyO+hbloPuywz0Dn86s8z
         xTlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794266056; x=1794870856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fqXpBBcqphrOKEoud7aEvUgTXtSFkrkdQ70VK6Fy8AU=;
        b=DwtENfGgn/NifVR+l4lo+XZZdcGmJC8tTVSXqNdsdA6i8m8W+Dv9ecPvuwlSTB31wx
         6ku5yGMyTzKSRJupRVLul4hg1JefpxqtJrVsuxX5sSOlJucUOnPJ/GPG+FzCdawwszCY
         LipMJ8lbrfk+zVuosVWfEUNtkve0h5ZSW6445e/SFfWJWST4MIVEB3eHs1Wi5dUoAPWv
         Uv1tVMFDgquuVXylar4+3pY6D5ytbU7MRAb5KM/J7GbrAcdpCQAmrb18BsrE+oqIcMt3
         jOmVQFYri0D7n68w1/WhFNT1WvPTNyJDKp9lVheyqnACtFtWmYxDAOikG/9BTjS/nG6t
         8w/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794266056; x=1794870856;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fqXpBBcqphrOKEoud7aEvUgTXtSFkrkdQ70VK6Fy8AU=;
        b=ugxBeu9BSSKrrCsCJNFwuXLq4DWzncqk92HrLvz+flQaxM+xJ730it+S9AZZYY9hDl
         ez0vqJq67T+zHOxHjYyhOW8KuJO5VNxAzKVF1C81qEzhI8EToY6i8WUf6ejvuM/tdujv
         DHdNDCTNB9NUW5rww4oq4VJSaYhMScdxNn/qV8GHwAO9LbTRB6W212DCKE9Hbk0IfEdq
         neHeTway9DzCZwADfYpgRSAyJsNkyfTwAEZlbrR6AhGK66iPHhyrT4oR2r6zfwV/KzW5
         nVNFHe0JIz7YXeEjAzDgTZGvRweSaq3nMGPTDjT1L0PJvbO8vL0vITdcm50taJBmkg4T
         Af1Q==
X-Gm-Message-State: APuU4Z/pia/uArcMj/qZQqptkLRrCDTZ1tUHANjs1iUr8VmHn8rWvFYj
	7hZO4k+XXLK9FAIqjj/7d0TYT69PQA5kSRxsLCy94pK1mlu4ikIRtnyqzAH3gb6EFSbDqQnSZDs
	Nluz2Tb6ASmRGg/IQiYEF/igPDZuN8mBWqAF2lvsmN4TmcF0Uw/koO2DIrA==
X-Gm-Gg: AYBFou0W4XeRB8X357bDsTzVa+YVDFKttmiW2YWe+EF/Bt7c0p9ykH+3exUWJNXFQ3i
	/RdjVEMgtDGj6mU6w7PN7JQbMiwzQL9zibcKlSPw91BGxPM+rz6yUHTWC+wUAgCvyTBN8zixLYV
	z3G4isR3sN98VUVg9f4qKitoPWdzmswBow+6kR5eQ6w43QWzSxbB95TZjA8AyTumzHs0xNhSVf+
	wbJmQXmKl+7pi8rIiHIKffdP0rS6IU2mUClLvpZ8ofz1mrRVYorR7aW7IT01ytREgxIOs468Tti
	6BNeNuk5rOb+qcBFKK6S72lI96at7l8I7PTu7kNkaTe5TTezvoKf8402wlMzUbWha25OJaZXrNa
	k2JaxSpKEgkCRQdi2JcMtFAmPm4aIVTvHD3BW
X-Received: by 2002:a05:6808:222a:b0:55c:866:20de with SMTP id
 5614622812f47-5683c769dcbmr1387251b6e.2.1794266055753; Mon, 09 Nov 2026
 15:14:15 -0800 (PST)
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103211031.592745-1-csander@purestorage.com> <628e574b-9d79-4997-a147-51ccbd11e35d@kernel.dk>
In-Reply-To: <628e574b-9d79-4997-a147-51ccbd11e35d@kernel.dk>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Mon, 9 Nov 2026 15:14:04 -0800
X-Gm-Features: AclHuK-SlGEp-bvZXvBEMVJrExajAz3zz8HUTT2xD3smMVlf_iPp0ddqJu9OYaQ
Message-ID: <CADUfDZqoWZDjpZ5B45hkkstw4sjKU4_t64w-TqbbUsCvv2ZM_g@mail.gmail.com>
Subject: Re: [PATCH 0/4] io_uring: improve alloc_cache branch prediction
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 1:37=E2=80=AFPM Jens Axboe <axboe@kernel.dk> wrote:
>
> On 11/3/26 2:10 PM, Caleb Sander Mateos wrote:
> > A call to io_uring_alloc_async_data() that provides a struct io_alloc_c=
ache
> > currently has 2 unnecessary NULL checks in the fast path:
> > - Of the struct io_alloc_cache *, even though it points to a struct io_=
ring_ctx
> >   field
> > - Of the void * entry popped from the cache, even though all cache entr=
ies are
> >   non-NULL
> > The compiler also incorrectly assumes the success path in io_alloc_cach=
e_get()
> > is the unlikely one because it's written as an early return.
> >
> > Avoid the first NULL check by splitting io_uring_alloc_async_data()'s c=
ache
> > logic to a separate function io_uring_alloc_cached_async_data() that us=
es the
> > cache unconditionally. Avoid the second by returning a separate success=
 bool
> > from io_cache_alloc() instead of checking the NULL-ness of the returned=
 entry.
> > Also mark io_alloc_cache_get() and io_alloc_cache_put()'s success paths=
 as
> > likely so the compiler can avoid jumps in the fast path.
> >
> > The final commit is a small code simplification in io_futex_wait() noti=
ced while
> > touching the neighboring io_cache_alloc() call.
>
> I hand-applied this, as it needed changes for the post-7.3 trees.
> Patch 3 is somewhat marginal I'd say in terms of rewards for the
> churn, but churn is cheap these days...

Sorry, this was based on io_uring-7.4-20261029, but I guess that
didn't include the dmabuf changes.

Patch 3 removes an impossible branch checking for a NULL entry
returned from the likely(cache->nr_cached) branch in
io_alloc_cache_get(). (I verified significantly shorter codegen in
io_uring_cmd_prep() with no jumps in the fast path after these
patches.) io_uring's whole philosophy seems to be going to great
lengths to micro-optimize the I/O path, so I figured this change was
worthwhile, but feel free to drop it if you feel otherwise :)

I think we could reduce the diff by adding if (!entry) unreachable();
in io_alloc_cache_get() instead. (Or __assume(entry), though that's
only supported on recent compilers.) Would you prefer that?

>
> Anyway, check the end result, please.

The conflict resolution looks good to me.

Thanks,
Caleb
