Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0F3357D07
	for <io-uring@vger.kernel.org>; Thu,  3 Sep 2026 03:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788404685; cv=pass; b=Jn0BjKOtutfNxQ9VgwkGBURbjqh+kDTxr070aSYHT4T44wJ4cegx8LntnRIkIL8OF188xVn9vAKuyt7PwLOBtsFyj/9+ONLH1Hsy1PtFvy6hA/ZsCCnD69Jr1H9ZJuIjpUVyoncBzmO+AFud6+QZk4SN8PQar6XXtEB6YXKRomA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788404685; c=relaxed/simple;
	bh=QQYTUemsDne+BYSAP9dnTyI3rj9XcbDoRLebNglDc/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LvNmsX2BK2KeTVzDebT+fgoR/QKunDy7HwrCeAYVl5zmZ1YSMgvnZpzj/7Zq6Ldl8priGguRzAkHGGkLYoK0AuD0cQg9YFAUHPE/gR/YGVMbfFkddE14sTal0/4+ABWYzgSFAsug5VoKB2wKVWOqPkdofEviWekudlDDwtnwwq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MANcOnQ9; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MANcOnQ9"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-495590dde14so19198255e9.0
        for <io-uring@vger.kernel.org>; Wed, 02 Sep 2026 20:04:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788404682; cv=none;
        d=google.com; s=arc-20260327;
        b=a4q1X7IFx8mALuNr3ejlM9jQdP7bsar/huFLaNboxXjdef/392N9JLXcT9uElkLSsk
         Ed0Z1FhhzZouYauLjO4uYmeemMHSkWLTnQR8rE9Pll0V48NzfY+LqJxiTezeK4pUPEAb
         Hp69ihllU4r0IgbUuI9Knqvh1LD5K2z0kDgLf+igTSkhdsEo5zNY6GyUW8yD35rC8p9c
         AdiFi9YTDNe0uJSOpbkKcxOkqPj1O7zRW0wA0LGUw0Pp5zGglYJO+MCZLyiW8mZi73xE
         Lf5g6HcD6Gjsmt9P7sVZS+3PkMeacn5gqJ8l7Qybv0Tz5tfKXW8LMcZ08/tawC22IZAn
         v3QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kp5kiEjY56bVt+cQGrCKMjWcI/IoAXkJImRk69V/Bb8=;
        fh=TYdS5zhe7wXeP+JFx7Msz9lurxclbc2n7ppxJ5V0q7o=;
        b=WlAFCpaWUOkoZnGgvifl2Dwculwg+kUerxLEKNvlC0IWrrsKQ6CE/lfOv3sMfDj5ce
         hSENMJHPO3ogKff2w3WIcTpfHa9iUSD0E5wBGw/YN6SBll91IP6gKYENvW0023FtTVQh
         UwwejkTvtpj62vLuJYXoulRxKbxLOIrQOrEX0T+RMKCJmESOCz9Nxl+CbdlBDzRAE1a2
         2IKrzHRRAIvEMsXn764SOqlcEavR6aa7hDwBkdBMHJuU9YrpQvXwqKlwRCJ3fJaXI+Hx
         K8/64tLJNe5q+K2iLE1BnvL2CSOikVAnGFMD36bIb+dC38XzuKu8kALKWihOzFeEPzc4
         PpPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788404682; x=1789009482; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kp5kiEjY56bVt+cQGrCKMjWcI/IoAXkJImRk69V/Bb8=;
        b=MANcOnQ9GeWgXxYPg53GrybZsbkDTdD6tHARQ5LWvHVtnA53hZb1OMz8J/gYlB8nX3
         XqN9wlePMJcvS9d9A9BbRSKtX3s8PzjlU0v8eoRVOxRjU2N4nh3FGXv6GSymVhJ/nOFg
         yvd9LChLh5+he7FqHvHxeAgwa42EK+KQ/FfB2fuYXuxNfnLvxbbWRZHgXtrPM5I8yYwc
         uLePJe6t28CklkV17FAKQTcEzo5LOuFx8fSfHCG5GGMifQ4SNX9Y3S5akTYZ/fr2D30W
         G3CUbRkRSDCEBdURh+816BYhWW9wOi3IVNaZwQ1oxr2wsRQDvroh9n4nPN9wJqVk1Zxr
         1+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788404682; x=1789009482;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kp5kiEjY56bVt+cQGrCKMjWcI/IoAXkJImRk69V/Bb8=;
        b=KIYdB86iiPSC4GTdz/IN9acLfiSdC8Oun/EHDevElnmaC+p2OWvFpVc6yPp8NVCg4C
         Wz8Off1tXSlNpcLXJ5dkwl4jqR8PLl1r0CtqdsqnvXSR1Acdx8uWGNgNmvEADqS4mBY8
         iBwVmhlGCefWWbq0ghgWbHS5NBqLRmCR7X+mBH5ZkCzygT8uIbr90y8lsJG/SNHSkuf7
         +pi/1d3GR+c837Q5Sif24tW2ZcRwgYlwMKlJcmZx2qwkDi5Luf9MGnidrZP3EiGltXU8
         mMagFtqJEpKT+VJzxdLQubw01om7dVSndBK8hA5WneuuOQ2NVO5ARV3VDdvysrCGfHQ+
         Ji+w==
X-Gm-Message-State: AFuF++krs4h66E2Prh1HQx7/qkLsJmJ/9sbzbpWqU6cT43+PLZfm7QbQ
	DBAe6nkjSjZ51ZriktrobT3YY+BUBEw/JfdggOo+e/hq7Qrz2oleSgPrtEQZWijLWLg29flpu1q
	8gmzOzdYmh8GAh35JDytoZzK8NslUxtw=
X-Gm-Gg: AYBFou3SqcVSG7otgvlhgcaQZxMxPMtXJx7e2ypEI670bwXGFiEJzNY2oChtibzV6tO
	J0Ppc2L0W6YSQeT6Pr0FHCg/HuiYbtf9qiw2RpcLDT18h/0XQ3vkElo8kyk8lp6JnqUZuXtOYhR
	Ixg7efosGcjCnoJks95EhzsYZ52pKkX9d+sFv8U+3KcRVl3+jqbnwi/UVekGFVKUTKC2MYlLtbX
	P5t/UMjEsrXom32GmC6Wawpip0beIrscO14J3mrbhIhx6Xy+F4bpyuyPWh9w9H+zx1XNI8Vw3jD
	hUylmR0yozHZIs4RlWWENk+BIqka4B6mRSCWM0fRy7Iv
X-Received: by 2002:a05:600c:8b86:b0:49c:d27e:8f7c with SMTP id
 5b1f17b1804b1-49ce5843b42mr158801755e9.12.1788404681727; Wed, 02 Sep 2026
 20:04:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902022552.1890610-1-ljp1205831794@gmail.com> <871pbb7jqh.fsf@mailhost.krisman.be>
In-Reply-To: <871pbb7jqh.fsf@mailhost.krisman.be>
From: Jiapeng Lin <ljp1205831794@gmail.com>
Date: Thu, 3 Sep 2026 11:04:30 +0800
X-Gm-Features: AcwNN1Xev_k7J9nlKujPtipk9X2OZQxab9Uv8jnqbiEPEiDziqp2e25ShUhAhs0
Message-ID: <CAP0_7L1Tmoww7_gprbP0naNevsh=Crvx7iBfDrbW92dXfjuPUA@mail.gmail.com>
Subject: Re: [PATCH] io_uring/net: commit all consumed buffers on bundle recv retry
To: Gabriel Krisman Bertazi <krisman@suse.de>
Cc: io-uring@vger.kernel.org, axboe@kernel.dk, 
	Aohan Mei <henrymei@tencent.com>, TencentOS Corvus AI <corvus@tencent.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gabriel,

Yes. The trigger is deterministic (no races involved) and needs no
privileges. Recipe:

- AF_UNIX SOCK_STREAM socketpair; register a provided buffer ring of
  4 x 4KB buffers (bgid=3D1, IOBL_BUF_RING)
- submit IORING_OP_RECV with len=3D16KB, IOSQE_BUFFER_SELECT |
  IORING_RECVSEND_BUNDLE, msg_flags=3DMSG_WAITALL (and no MSG_DONTWAIT,
  no IOSQE_ASYNC)
- peer writes 1KB, then 2KB, then 13KB with ~150ms spacing, forcing
  two positive partial completions (via the io_net_retry WAITALL path)
  and one final completion
- after req1 completes (res=3D16384), read the ring head via
  IORING_REGISTER_PBUF_STATUS

Unfixed kernel: head=3D1 (only the first partial round was committed)
while 4 buffers were consumed. A follow-up 4KB RECV then completes
with buf_index=3D1, i.e. the kernel hands out buf[1] again although it
already holds data from req1.

Patched kernel: head=3D4, and the follow-up RECV fails with -ENOBUFS,
which is the expected behavior with all buffers correctly committed.

Verified as uid=3D1000 on v7.2-rc4 and on current master, KASAN builds,
dmesg clean -- consistent with this being a buffer accounting defect,
no memory-safety violation fires.

I have a self-contained C reproducer (~200 lines, raw syscalls, no
liburing dependency) implementing exactly the above. Happy to send it
your way off-list, or to reshape it into an io_uring selftest for
regression coverage if you prefer that on-list.

Thanks,
Aohan


Gabriel Krisman Bertazi <krisman@suse.de> =E4=BA=8E2026=E5=B9=B49=E6=9C=882=
=E6=97=A5=E5=91=A8=E4=B8=89 23:31=E5=86=99=E9=81=93=EF=BC=9A
>
> Aohan Mei <ljp1205831794@gmail.com> writes:
>
> > This leaves bl->head accounting for only the first partial round
> > rather than all consumed buffers. Buffers that already hold
> > received data stay visible in the ring and are handed out again
> > to later requests, corrupting or dropping application data.
>
> Hi, Aohan. Do you have a reproducer for this issue?
>
> --
> Gabriel Krisman Bertazi
