Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793986301;
	b=hwDbPbGL7PAy693M+3pHe+rhcKNR/9CYcxAPrxzXKkVE2Q3fbUbJjA+JgsmSiyVYVC9T
	 eFNx1XRylaeyWxD0wEseLlZQdmQ/b9GA/Q2R0dC9IRu6Mf0RJm9xs0KyX1tlwr5c1x+jn
	 hzLY+wTcrwNnogT7cjD7hrR5690YJ8Um93k+N05rrOIsDHvKzuZQCP8lYUOALt/YGFJxZ
	 KG2Jq5bXu+kzMH8j4sWP424rN63+9p1EgGNe2HDLGI0c6d83/rIiDC0jYFimG40RY97HF
	 /jQIC6TPoLgAUfwB9o2vcpoNYCEE7Rmid9h6kh3CQ2QZEWMe0Re5BoYICdnoHWADfWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=SAsf/HJnla1202h032Zyvwlt1FDI3cas1HI6elwtfA8=;
	b=1YkbFZDP0ZyD3Gh9hDyZcyveWvnGWyzwLNp9RXRrfMFY+KEw7SlCt4RGGzl2UYDkUPKx
	 giGw1BKToB2aL6N6PKqLgVqXO2WrmpRH71NFZI3hVmNrmwxLqOF9MPlKLwhKZVUKjGGDQ
	 CmHx1NUpcTniQIFindRuZExnFIEARyPlntB361+Iz6B5uygUsuVZp2LVsejpbdVuSkmW0
	 TO3vVPgVmO9d5dmhiqNHr71QHb9/dflVtSOGy2WyKdejAtxFmagyRLUJPyRK4Z6JUHVyN
	 Sv+udBd/HKXZN/MWC5EFXvB5A2S1eFiWVsqNhMkSzRqObqxpYyuzDJE4osVf1s9hacw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P4+H+1F6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.75
Received: from mail-lr2-f11.google.com (mail-lr2-f11.google.com [74.125.230.75])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2520606A329
	for <io-uring@vger.kernel.org>; Fri,  6 Nov 2026 17:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2520606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P4+H+1F6
Received: by mail-lr2-f11.google.com with SMTP id 38308e7fff4ca-3ab3277f00fso860421fa.1
        for <io-uring@vger.kernel.org>; Fri, 06 Nov 2026 09:31:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793986299; cv=none;
        d=google.com; s=arc-20260327;
        b=PIQxujO5SuLgwhOM2+8k1n4pSbcnF1rvmFMOEB60Xpc0X04c44MOnFSlAz3F/YPwX/
         ZX+IHmYWca4ZUlbkG0IVCWBGMZENy3POlpN3mYHFT+K0EIt6rr+edXUJQBZaBZ1PdTy2
         Qh40HMPo82fmLBLOys/OuVkCuSzHDdFDnQ9QBPYvvV9Bmqbf9RmyC7t8wKo5VnexJXiX
         rz40UsN+hgG8+6dFVyD7XKoAS56LhToeuggDVNz+gp0NOot9JrwuC+HwRTnZxZjWD33v
         76XYhjCEL7vOysXffhO3EYBVovR9U4dUl42SwztLs2KT3RP8GNDCXm6x6HHDqq7xZg96
         SkTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SAsf/HJnla1202h032Zyvwlt1FDI3cas1HI6elwtfA8=;
        fh=CAZqMpJDbRX+3yg/KgvHviAmPZJQz84wQEaNOj3jhS8=;
        b=KMkyFn74sWYwxcjSAYYesJPuCGWM+DkqRc5Y9r/ZHSRnpwdNCzP+tsCmK6tIuOO62Z
         Gy9u11xzu0TR9gXEKMNYNf9qtropIusy+VPwGS0WEhj1+ckDSkC8dYt2AHz5y178+ZeQ
         mTPQTRuaKRHsb4j708JHuoMjILoLNM5o3YQf73GXjR/PcMnjrCZAPpeQXp0lwngCCI7e
         gAgplvcfm8JCopyvnLcWwvNNimmXqf6QgxbXXKsyX4jOhWqh+KwlZFcnUgXH7gu7ASC7
         XyH10BcLcRpjrhB505hygln6hDXOqClkeN9kYfWgr7cb+acbDZGuLvfOQeDbmpvtc7Hd
         uUvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793986299; x=1794591099; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SAsf/HJnla1202h032Zyvwlt1FDI3cas1HI6elwtfA8=;
        b=P4+H+1F6M7rJHsIV9+FaNVlWRMbnr0A2JFUp/oXQo+O9VfDSgU3sggrd47kNd3izdz
         d5Mrfaiy+SAtJ0XQs0kQZFEYUKPt0ODDfvzM7p6TXF2c2XAlYfooVzjevL16c3ZblW38
         zXWvcRLTieY09hWod2jDAOopAiTQg3jiidCY4bdAreE7Pu/rNrkTtuyUhUv1okJqgUQO
         fLPxhF59vHCGN75NZIWLwPYa2uU+J+YjSKeDJma3SXKwJSJ4jIRoI3iqyptfowy1cW9b
         V93cb+9pCQ8GCV2N4d/83DzbIW78OTixGals2GDZ02LaNzO1l60H0doOBrBHdhL6YFVd
         I2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986299; x=1794591099;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SAsf/HJnla1202h032Zyvwlt1FDI3cas1HI6elwtfA8=;
        b=K8XgqRoSC001CSuBR+ALCp4cvy6uUjztTjAp/mJvXmSBlxpsCXr0YFvWo8JyW06amO
         6vN/p1NNnXKWLqrRldnGxcAcPQAdNQjlqZ1lst/LuHZsMF51Y15TTO83HAG1MiRLOJWE
         E667flLNZNsKRiqyEgDQQvoNcq3zNXu7tovkC4oyPHSi4j1iUutZandd0brCH/gg5l1j
         WcIWjXZHHpSya+hh7J+G9C7PyhvNbxp9ez+2wE+gPFhy3kpHG4FTEAx3qAwqaQy0ySqP
         W3UbPjFPdofQT7tBGiFNj6c4d0nV86z/hPaFYwqyPVk/i1lRgVdCQVU3n6aEE1vrbyG4
         7TMg==
X-Gm-Message-State: APuU4Z+dOZNFO+Qh6SvBGws/4cVnaYatYuPQuto2QmYj4KM1odA6qkvs
	497T3ml7ZTWCi/5e00Zmle8BbnBiruEQqT6XvqFwwDvqm2FugPusGU1052iDVh9bP8uiBOo1f4J
	p8S/KLNePjKVZ2Y99R4V1OtCG0Ni5zNw=
X-Gm-Gg: AYBFou2N0Xcn8eIK+elW15QNaEoubvAzVwYxSEjJecPKMkXyPSqNnoJ510jX1JXJxwV
	aoZ5trDEI+COxTS5Y6wU24dpt7D4azbevwI4BUUFvNvTObR5zqj4xN1VG+oN9S1AcmAekkoAtVW
	IJpuN9NQwOn5/7qr7nAJym/H1remQyhKO2AIjL8TDLbEbr+QqRrzEczrrlyRausxgV/nW+q+vZB
	M3yYkgh9uXG27BVjQHqsUgFCm5tpv53952/PeFg6p0IGk0En5+czQuyZybgsUzNyDnWuztknni7
	nNsFi38qug5LJ1vqR/05ST3mV86oXx6b5YsE5PdUHjpd8F07plBEqwsNCw/R/PznvQCYXCSn6cD
	fyy+9mMMuW/bEoqicfMrfB7nznGc/Wux6c1cEoNNqXb/vTgVDV8ihANB9tQ==
X-Received: by 2002:a2e:a107:0:b0:3ac:e00f:6bef with SMTP id
 38308e7fff4ca-3acf3a07eabmr6207661fa.6.1793986298519; Fri, 06 Nov 2026
 09:31:38 -0800 (PST)
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105061433.1947491-1-bsdhenrymartin@gmail.com> <3f0cf989-c294-44ac-8bf9-11bf69dfee45@kernel.dk>
In-Reply-To: <3f0cf989-c294-44ac-8bf9-11bf69dfee45@kernel.dk>
From: henry martin <bsdhenrymartin@gmail.com>
Date: Sat, 7 Nov 2026 01:31:27 +0800
X-Gm-Features: AclHuK8FDdjdShTooQaCgTiT2ZtXnpiQqMTbomZdRqfL2T5bf1xh8VVRWEJU1_M
Message-ID: <CAEnQdOqaGiexk6BcvU+L1xoEFDr1e6sWzm1VuH-JBJJKXhc__Q@mail.gmail.com>
Subject: Re: [PATCH] io_uring/kbuf: fix cross-mm interpretation of provided buffers
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 11/5/26, Jens Axboe wrote:
> This isn't a bug. A ring is shared memory, and anyone with access to it
> can write SQEs that the other side submits, with whatever addresses they
> want. Provided buffers are no different from the addr field in any SQE,
> and the same holds for ring provided buffers which this patch doesn't
> even touch. Sharing a ring with another address space means fully
> trusting it, that's inherent to the design.

Agreed =E2=80=94 the SQE address fields already grant that capability, and
ring provided buffers have the same property, so this adds nothing
beyond what sharing a ring already means.

Thanks for the review,
Henry

Jens Axboe <axboe@kernel.dk> =E4=BA=8E2026=E5=B9=B411=E6=9C=885=E6=97=A5=E5=
=91=A8=E5=9B=9B 21:28=E5=86=99=E9=81=93=EF=BC=9A
>
> On 11/4/26 11:14 PM, Henry Martin wrote:
> > Legacy provided buffers store a raw user virtual address.  It is
> > recorded in io_add_buffers() and later returned verbatim by
> > io_provided_buffer_select().  The consumer (recv, send, read)
> > imports it as a user pointer, so it is resolved in the address
> > space of whichever task issues the request.  Nothing ties a buffer
> > to the address space it was provided from.
> >
> > When a ring is shared between tasks with different address spaces,
> > for example across fork(2) and execve(2), a consuming request reads
> > from or writes to an address chosen by the provider, in the
> > consumer's address space.
> >
> > Record the providing task's mm in each buffer, and refuse selection
> > when the consuming task runs under a different mm.  The buffer stays
> > queued for its owner and the request fails with -ENOBUFS.  The mm
> > reference is held while the buffer is queued.
> >
> > This issue was discovered by Tencent CodeBuddy Security.
>
> This is nonsense.
>
> This isn't a bug. A ring is shared memory, and anyone with access to it
> can write SQEs that the other side submits, with whatever addresses they
> want. Provided buffers are no different from the addr field in any SQE,
> and the same holds for ring provided buffers which this patch doesn't
> even touch. Sharing a ring with another address space means fully
> trusting it, that's inherent to the design.
>
> --
> Jens Axboe
>
