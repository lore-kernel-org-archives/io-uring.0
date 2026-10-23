Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792767967;
	b=BxyPWcy3KwhAQu2FG63Poq8HmeHV3QIGI8H6FUigvERJ0/dlDVKvEMtPOaI6L1MOSTTj
	 Mqb4H0CyJijCZCwFN06VvrXrihxiFKLeR9MAsZO8a1M4LFUxNVC3EAnidwDyR0yDQ6WWZ
	 rpB3ajIlSMbhsex7aOUlGyGrA7BjZBrxFe9qNGj75lbCfczXM3Z44SFv8PhjmArcxVUCG
	 UKVwaIzvAHSt208GkGuXlFq7PJAEdRlXbs893zujWqYwRjUrxMisKK8TgqB1smasuncOy
	 ea1nH5aU0VQi2+bmnR9p1fjmMx2GXGy6+exJ19XJTbUWVDX+yY0Mft2rZDhscJh1nRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792767967;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:
	 References:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=2k1a7mKLyAbZscrMdIu2COePeGDQgEl1qBd97AuWM3Y=;
	b=oDLjgMzkmF+CDGb1tSaZ9WrFoUkravSPzVDQ1ZitVxeQhR1DJrzD2/ez+kKdfXzLhhds
	 eRVzXMag5QeqJ0wBHJA1c39Ty9GU2bjM3PbtOU72pI6oScMc3qIOW15MlnaiF1YonuS2X
	 u6KDaudTImVtSAHU1+wjR2jPYYxIpeiVQgRBGHjFwO6wH/nBq8pM6zVX8dlaKvH3hOFze
	 ZD/a0KlmMmCltq8xW3YpLq7nOsk/QCQJXtWDuovSLq0pSW7Rj4b0lkkLd9rp+LwQi987C
	 0/zjGiIKJuXxmohzX0ctxeHAVAtBYXTMaghTmr4Es8BzRnpguHNBNXvGtYeMJgycOhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=krisman.be;
	spf=pass smtp.mailfrom=krisman.be;
	dkim=pass header.d=krisman.be header.i=@krisman.be header.a=rsa-sha256 header.s=MBO0001 header.b=19KTL05w;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E22606A31B;
	Fri, 23 Oct 2026 15:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49E22606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krisman.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krisman.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=krisman.be header.i=@krisman.be header.a=rsa-sha256 header.s=MBO0001 header.b=19KTL05w
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jB5ty4YlCzMlfn;
	Fri, 23 Oct 2026 17:06:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=krisman.be; s=MBO0001;
	t=1792767962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2k1a7mKLyAbZscrMdIu2COePeGDQgEl1qBd97AuWM3Y=;
	b=19KTL05wl9+P5a8YlafFGcDrXEVd5VXUJ4qKnxrbCTOBrBRHFPpXYblImbFC8KfmsUw+TG
	g0EzDSa8QGfEssbtvK4/e/rQxxdzNhN38S4Y/3c/7Pw3jbwil9HUTZwwUQKkpgUWO33frF
	8EqyMtecfd7fJV8lgFsZZUcywCyu5JW+gM+Z4oHZF8OpGpu8JRhHp9fJgy7AXnBuDdx4TD
	9djBTUJylkkB8dsbW2BBG+iNxAherLplPMS0mPr0smIIwXh6P+CjWz3258/VsR8uV8ycZU
	eD4bInO9uI/XpOa8/mLV6eTb7A9yLPQcaaMTR0X11+JDcsyoLmswekmPLXpkcw==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of gabriel@krisman.be designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=gabriel@krisman.be
From: Gabriel Krisman Bertazi <gabriel@krisman.be>
To: =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@meta.com>, Jens Axboe
 <axboe@kernel.dk>
Cc: =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@meta.com>,
 io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] io_uring/net: Remove useless min_not_zero() usage
In-Reply-To: <20261023144953.3584118-1-cleger@meta.com>
References: <20261023144953.3584118-1-cleger@meta.com>
Date: Fri, 23 Oct 2026 11:05:58 -0400
Message-ID: <875wyssbhl.fsf@mailhost.krisman.be>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4jB5ty4YlCzMlfn

Cl=C3=A9ment L=C3=A9ger <cleger@meta.com> writes:

> In the else arm, sel->val is necessarily 0 so the min_not_zero() actually
> always returns kmsg->msg.msg_inq. Remove the min_not_zero() usage and
> replace it with kmsg->msg.msg_inq.
>
> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <cleger@meta.com>

Reviewed-by: Gabriel Krisman Bertazi <krisman@suse.de>

> ---
>  io_uring/net.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/io_uring/net.c b/io_uring/net.c
> index f5f4f3ce6ef3..efc8ea5010ad 100644
> --- a/io_uring/net.c
> +++ b/io_uring/net.c
> @@ -1146,7 +1146,7 @@ static int io_recv_buf_select(struct io_kiocb *req,=
 struct io_async_msghdr *kmsg
>  		if (sel->val)
>  			arg.max_len =3D sel->val;
>  		else if (kmsg->msg.msg_inq > 1)
> -			arg.max_len =3D min_not_zero(sel->val, (ssize_t) kmsg->msg.msg_inq);
> +			arg.max_len =3D kmsg->msg.msg_inq;
>
>  		/* if mshot limited, ensure we don't go over */
>  		if (sr->flags & IORING_RECV_MSHOT_LIM)
> --
> 2.53.0-Meta

--=20
Gabriel Krisman Bertazi
