Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA27377AB2
	for <io-uring@vger.kernel.org>; Thu, 24 Sep 2026 16:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790268402; cv=pass; b=Xpy0CNOYbhIX1Ace7J7T4dghIpqK1C1mlSqbJF7wsdur/eNqPZJDta1u3P1WzSgRrfF/8ZksdSmEHGm26i+zuvIXIANJ+Lq+PKT6KTCes0ko3cb6K4DRMHBGTVYO+pCo6Z+X0JCgq0STPkoQOvE5vEU7QE18hfmC2gMc068LYzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790268402; c=relaxed/simple;
	bh=1cXW3vatV8F+/xKYHsIZj6m0oENun3ZkfwN0yguL/Jc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l+g1KJ/Wp8MuR5EXP554vFd8mwinCq8v/weWJrr/JENi4rYd/FfvQJemG1pWYHvA7CKFtX71vRSEzLjQcVuh1Sfbp/ZBHeXjsKWXw8ZjNyeROtXGgGrivmANPNT4W3Q6RNCyHPjd4qymMjIj0nyBGwOV44Yu0xCk+MzGi30ur4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W/xn51l6; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W/xn51l6"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6aae147ef9dso49a12.0
        for <io-uring@vger.kernel.org>; Thu, 24 Sep 2026 09:46:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790268399; cv=none;
        d=google.com; s=arc-20260327;
        b=kWAtxvVHvYtSfS0tlwgkSiWab2mwFQRsE7uHZ3QObwp960CGsPuIVvywtoBpGoVcBe
         5xwIg9YYNgY+LQyBV2dboBXb3Cnf1hrdg4EewrENPuJPIfjfR0/ARw9BhIxK60gkfl4G
         mbo+jLJNmqYsKh34knIkzrAoiBRXBrAvTqs3JIkBO1wJbbJ0jbpOqS7tF6BVK+evkZZ0
         +g1xC2k1VSTL12jUWlz3veZ0lZR9kk3bIvh3XJ7ERORC1AyqCooLVyyl2VI4ysKvUX5w
         1yzQX+WT/gBL3YS4GKszUrRp/Yy/AON5YKV7eeC8ch9FirhESArNoBOhLDWVjloPadkW
         Mxbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1cXW3vatV8F+/xKYHsIZj6m0oENun3ZkfwN0yguL/Jc=;
        fh=f88vKOSANi9ZyRE8CuYwRi0unAjsoI6D+nQF6LyM79o=;
        b=VqgkhTvl/86vfTtN+TDQDzXKPZKbWF+ns27UlPJMMyz1irnJGPE0Hvh7i3lWQ5Bv4I
         gO37SxP9LGpGvL8WU9b+MRbMZt19SkQafFZ1/IQJIjsPVDY3iogc5YD02DvSAWoL8kB4
         3MATayV+zdoe1bM7eLdpvtQZpbB9DbA+lRkQAtPL2Gyag6G76VJrRHuMoL+3ScTEYchI
         fC5O0OKLgJTuED74E4E0C/eEX02uEyYs8DFHzXIxoxrF1REQ4tDYCwXFbALlUHZ7vCYD
         qFGEm5kumcY2ps+jrD3thYp/SRgrvIJ/Yk5nV6O2uSdsarZ67HwP4aQ79Aoh/zuZlZnB
         B4CA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790268399; x=1790873199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1cXW3vatV8F+/xKYHsIZj6m0oENun3ZkfwN0yguL/Jc=;
        b=W/xn51l6NzSVih2HqUKdXGxxmv4Tmrv+s9GKT+U2sVRnYb6kjsQqjfomhLL7OKqLrG
         iRvRfa2wKty6g/b69ByMQYVJfkaZnJPOrv7yBvpZBC95kv5LDAPdD4mAvJgbG51cHXjw
         QNR2KSdquQeqzvbe36+RKwMApMamenkJfN9UGRSSFBv+b7ffUEs/X9hBqqxpuwMyOhp8
         TeQ4RosMgzmFeCNPxn40ZB0/kwTyt9r9/DKs+bPAGkNQmVUmRb7rC7qlfEbTLPvM8Y04
         3uogy7aVb4Z+dNZ8w8hoRLMV78VdDBUXsRZ27I9ehpImH8BMlBWKy54iikmSfrpmuqZ5
         DFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790268399; x=1790873199;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1cXW3vatV8F+/xKYHsIZj6m0oENun3ZkfwN0yguL/Jc=;
        b=S0PPLy9BTQ1T0+YyGRWgNcswQZR2vacmDnKFyKFfvcjzfrL2XC2feS3Jnk7dyV9gxG
         Uo10xalE/73N0+Tm5HOgf3hM6hIPRmplKmIZEHAkgnk/k3yTR0L1Mdnw+kEpILQ0ml4f
         AFlBOnO7+n1fnUOUBaGiLx80xKkfAzQFdQp2mUt2LZIN6psMuORBGnyxQWT67dKly0zw
         uJIeB1IQeb+AbHucGNahuK5GFvfM0NBpZq+tyOwC2h+rVYSPDf/KPp/WZWBy8E2pYngl
         5wT/4Zxk+B+eOAunW5R/uaLtz6neEwgntkelbFPS4Xf+wpkUhFhnSoUp6bZ8NmYKINb8
         0CNw==
X-Forwarded-Encrypted: i=1; AKwUvBzRoTpAXAicg+1DL1jZoGQjptWYSj1WFtZ/PYN8ZuGjXRElWou9ngbjAuTLS703mx7386tFQkOuKA==@vger.kernel.org
X-Gm-Message-State: AFuF++lco17vtfDHmdpp//y82NRhxeaja7ktUy9EIkzWlrshBjpAg5gt
	a0oZbwu+4oqihHs3zKH1gFJkHS+HRm3WVk6iktHJ+2Ts2YNPsFCLdiavyU9GvYINi+lfa2qXEf0
	jRjDF2LIGv53nV/wos7cuA66laP35/zKO6p3684F4
X-Gm-Gg: AYBFou2A2sO85BVDtYAdOhgCtme3wofi+aHzBnCHCeX6j6LrB7jp6qJinngipzOX5zn
	0qV7UCh1XSUkEeSue6s1YGua4zWDpIa6E0DpjgU5cCkQrv8482zfCKh/kqsMnbtTQ8gX8otRtsQ
	gKlbk8jbpB6N+UUzwAAl/Wf/TVtCDA7kY1sm9iB0bJwmCjYsQB/BXBBswQXAt4hxeIe/zbwbl0F
	0HPEzuj+Uie9OCHi2Cln/U1+SGsZEiY3mC+cA1rK2whXF0XdpH7VzqASTJsDZ2Z36STU1wXFNbk
	jLUscpD6RK8U8tYBbVB9zMTNtINELPiYZRM/O7qeZ7/DFQx+OP5JUNRALVRYX2tREyVljZvjx9T
	tXFHQnw==
X-Received: by 2002:a05:6402:3245:b0:6a1:4eba:f09e with SMTP id
 4fb4d7f45d1cf-6aac81acde2mr45538a12.7.1790268398282; Thu, 24 Sep 2026
 09:46:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922204348.717198-1-sdf@fomichev.me> <20260922204348.717198-2-sdf@fomichev.me>
 <CAHS8izPwLBCJXM_0Df8P6S-FVwAq+TaRKn3uTh1h=33Ffj8VmQ@mail.gmail.com> <f566591a-cef3-459f-a39e-86addb0c5d7e@gmail.com>
In-Reply-To: <f566591a-cef3-459f-a39e-86addb0c5d7e@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 24 Sep 2026 09:46:27 -0700
X-Gm-Features: AclHuK_lFxOWKHj7XdxYi2ldzbsg0ymUR3nA9hy0ZeSa1JCd6RB5vZNVqgY1d-8
Message-ID: <CAHS8izOwo2NZGaxtxaMcjDu1APY7ERLjsHN4B_Oucqs4jZafqw@mail.gmail.com>
Subject: Re: [PATCH net-next 1/3] net: netmem: add net_iov_area freelist helpers
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: Stanislav Fomichev <sdf.kernel@gmail.com>, netdev@vger.kernel.org, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	hawk@kernel.org, ilias.apalodimas@linaro.org, axboe@kernel.dk, 
	sdf@fomichev.me, bobbyeshleman@meta.com, kaiyuanz@google.com, 
	linux-kernel@vger.kernel.org, io-uring@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 8:41=E2=80=AFAM Pavel Begunkov <asml.silence@gmail.=
com> wrote:
>
> On 9/24/26 16:02, Mina Almasry wrote:
> > On Tue, Sep 22, 2026 at 1:43=E2=80=AFPM Stanislav Fomichev <sdf.kernel@=
gmail.com> wrote:
> >>
> >> io_uring zero-copy receive and devmem both maintain a bounded LIFO for
> >> net_iovs in a contiguous area. Store the freelist in struct net_iov_ar=
ea
> >> and provide common push and pop helpers.
> >>
> >> Leave synchronization to area owners. Keep devmem's area adjacent to i=
ts
> >
> > This could be a follow up change, but I think synchronization should
> > be provided by the netmem/niov infra, rather than the area owners. TBH
> > the infra providing an unsynchronized data structure and letting the
> > area owner use it and shoot themselves in the foot feels error prone.
> > For now we could use a comment.
>
> I don't think we want it. The duplication is minor, but I'm not set
> on the per area index array approach, and it'd make changing it
> more difficult.
>

What is 'it'? I'm guessing you don't want the freelist array put in
the net_iov_area at all then? Because even that change will make
replacing the freelist array hard to swap? Or are you objecting to
just letting the netmem functions do the locking.


--
Thanks,
Mina
