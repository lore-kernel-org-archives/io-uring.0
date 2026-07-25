Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA603655C4
	for <io-uring@vger.kernel.org>; Sat, 25 Jul 2026 20:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785012919; cv=pass; b=nfrpnhB27+6N1ZuVbY1juG1Tz7IYATaN8x8Uw65829NQ2AherMPx9Bcir5GLrBPOM7PxZqNCsNuP4QpTXy0ywWiKMQaRRD+eQGuBbs1nySCNVdn/9dXbrsUQqaVnq2IAaDsDEFDAQ+3x79xW0ZUYYESnb+MHDalxW4XWDGlsWr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785012919; c=relaxed/simple;
	bh=zw51gC5xIPlAb+ehmicqnY9g7AruYRjvzVknaMunE54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ijN8PG5zPyg5YI2+GUlcwHxXq7cRtNQff40mjO2wXj122Q/1zSB+2W/JgD2k5MHjIEAuz9mp9/M2XIrJoZNn852B5y+Ze7v0GtupBSiiyE7hu40uMD3AY+ELVRXeRsHQcGo3C8Z4YL+1A7U3IKE7FcTd7K+KahxQE+Sl582G0e4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CCfA16sJ; arc=pass smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCfA16sJ"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84830c774a0so1520266b3a.1
        for <io-uring@vger.kernel.org>; Sat, 25 Jul 2026 13:55:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785012917; cv=none;
        d=google.com; s=arc-20260327;
        b=YNTE2gr7dPharlR5GYK3OCSjwjU6FZbv8qVi8Yl6L9OKDxzqTfeDrCxLPZOat09S1N
         BcfYNGYc044TMOqrsf3h5YaAD9IRyPNc4K9W9wz6ud8XeG1gohzbocLAKezGUrUWSeNA
         u5UnR6oozrcvUhsX1sDMZpJsjqd54xgrEHcPX2CwmVHPIf2ybkIIundh/FO9w/SFvI0V
         plHzCw5Q8eMLQQ/42jKu8dsYg54P4uGwoptRF6KYoE58/tTYpllxODx3NQzu54IyLgmN
         Y3kyNa86t7rF0lltK9+qvUjRkwwoaB+8Op8H/rhLCNPEpMnzeMQ9ra3eSsOvypwuBH62
         PXTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8WOQSahUV2FdjC/IM2f0n66+R/EWHlwNnk6q/oqvWX0=;
        fh=VN0guRb2okLvIN83B/6/UcIvGsDkbfRr+HJYRBYn36k=;
        b=avC9flTpm9s/IElCZC58TN5QSGYYuV8YEjNhldsxbQwlsbDvB7Ia8nojYZESI96tcF
         gZGRrE3MetAFuBoMlJMjuduvDlolQGmX52neNnKPmZBzqWNFlH3vZ6/tshp1Rp3BC02k
         IygkNqM0np6QQzSMSa23pReji/2ONjqVo+dzmf1sdKNTjz7lZaKFX5vUp2MzleT5lHy2
         zCOoxG0qp26bgYLTv8szVpfizNX8Zu7So5VqdojynRfYqRlM+S1gTR5t88FGLtHtMZqw
         e3MFYlxXCn9SnwUTzS9FAyqWiTDMi4NI2YQGvigZimdwi3N83HivqXzIV+yw4vCXnXqh
         KRgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785012917; x=1785617717; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8WOQSahUV2FdjC/IM2f0n66+R/EWHlwNnk6q/oqvWX0=;
        b=CCfA16sJBtgz8hldzWHYxUcyEjDqG0Y36DO6tVDS/ExmfNKDZzPZL53IiAy2HXqw2O
         KGAlALuZKD65GL9IxDdiAKuHMignZ6WXOsZx1samvNlbskdHpyC7TijOlka7b7Ab7JlX
         9DOirbvc9OUcRek2FGlvwCYNbjCSoGUKFnIS+mB249msG4ov5+/MS9llmMgoi6gXo4wR
         SQnOgz2SA+68IAreR4Ru1Uk0nfis315U2LA9sR0U72Iezp+sgkabMYRYXpfdgB4JiNMS
         jEuo3pZ0GvvmCxcqlnHbjxszgy/btfDRvWGt+aeO2Q/am25HTFd9D96Xz6Fy0N7YIeZO
         Yw5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785012917; x=1785617717;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8WOQSahUV2FdjC/IM2f0n66+R/EWHlwNnk6q/oqvWX0=;
        b=TChgWXdk556EJ0MdXfU2l6UTf7ecCDlD27iVkNPfTkvCLY+Rqe3X6hPDjbilKrY9eg
         Hc1eCHROCN5nO9/nOUohxShybbCvg5j8jELJTGUAAWCrLHO+8EnnGQfrHaPa8+O2sLQa
         lPhy8mDwY9LpO2qN438ou7PgEmBN3z+g69bZPbcwznVig8cBIvwEUU55pioMsADvSdIF
         1Aus45r+CCT4D8G6Zh47TaRIdbGfIJ1qRu/IwFBgLr7wKQ2k8Zh2EqE5bKTYetT3tDQP
         WJh/pzgZOyT7Fgnt/WSlLh+bBujwyVhM2z38MavZ5An5Kf7VG0Y0yZRjzGWxPwaQp2Mc
         snZg==
X-Forwarded-Encrypted: i=1; AHgh+Rq13SM+TwBdD+m3p6zygmWPWDGmw5+d0ozWSkEjfkwjfctoPHuwAK2J++dkO1l3ulX+QA1uDAViog==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4a+x8OugoV3SOTvnID/204jSh5kng1vOp0vZLlKNIowhbt6dA
	eYKoiozTDD1cFiCY9DFdgdj3pUjKzkT53Qw5Qs/OaVjAB+T/EegNgmggtlqjePxa6mMsUIBjz0u
	QNHYuc+BsLqo0wQrKX8ZoKIhlUfr3NpM=
X-Gm-Gg: AR+sD1368TxcwbBeIH5wusMECvSQbcrHlOMMyOeX7xhgRM/wuXLhkYZjXKnPkEwZ70O
	ppIC/UGOcV1RzDMG/k1ADQ2IFZl+2xBmXBFR9Ht3uIbu/6waisaWgfOmndp+QHvSWlZD7iqJmx3
	Ln5GwGGZctX/rdsq3D6E7VUYjstq8faFundBdVaZWhKDHNv9fylJBqEBi0EjTmYVlV8aqWwq/un
	3seqFT3sgkKjrPVUw7qSraGwyrCo6foJ0hFwuELps5m9qMfIUGpkKT3MpSO4Q==
X-Received: by 2002:a05:6a21:4784:b0:3c3:990b:2292 with SMTP id
 adf61e73a8af0-3c67dfe6723mr2903792637.57.1785012916705; Sat, 25 Jul 2026
 13:55:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523-af-alg-harden-v1-2-c76755c3a5c5@gmail.com>
 <20260603133312.12848-1-freude@linux.ibm.com> <amOGWwdjnJqyxH5L@codewreck.org>
 <20260724160034.GB2032@sol> <amOTjPW__CNZui3_@codewreck.org>
In-Reply-To: <amOTjPW__CNZui3_@codewreck.org>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sat, 25 Jul 2026 22:55:03 +0200
X-Gm-Features: AUfX_myV9AV5bwxaPxDCds8CpJSSwUUfrEfnR7d5D_zQ_thbtzqC3K-k805u5U8
Message-ID: <CAFLxGvy+ec3nQLrQtwFZgGELhT2pKBDnHdD0pMvEGh-Mf3rjgQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] AF_ALG: Drop support for off-CPU cryptography
To: Dominique Martinet <asmadeus@codewreck.org>
Cc: Eric Biggers <ebiggers@kernel.org>, demiobenour@gmail.com, 
	Harald Freudenberger <freude@linux.ibm.com>, acme@kernel.org, adrian.hunter@intel.com, 
	alexander.shishkin@linux.intel.com, ardb@kernel.org, axboe@kernel.dk, 
	corbet@lwn.net, davem@davemloft.net, edumazet@google.com, 
	herbert@gondor.apana.org.au, horms@kernel.org, io-uring@vger.kernel.org, 
	irogers@google.com, james.clark@linaro.org, jolsa@kernel.org, kuba@kernel.org, 
	kuniyu@google.com, linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mark.rutland@arm.com, mingo@redhat.com, namhyung@kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, peterz@infradead.org, 
	skhan@linuxfoundation.org, willemb@google.com, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2026 at 6:41=E2=80=AFPM Dominique Martinet
<asmadeus@codewreck.org> wrote:
> > There's no "tk(cbc(aes))" algorithm in the upstream kernel.  So, it's
> > not possible that this ever worked with upstream.  Given that, there's
> > no regression in upstream for this program, and it wouldn't be
> > appropriate to consider a sysctl knob in upstream at this time.
>
> Bleh, you are correct, it's an NXP patch in
> drivers/crypto/caam/caamalg.c that they've been carrying in their
> tree(s) since 2018[1] and has apparently never been upstreamed...
> [1] https://github.com/nxp-imx/linux-imx/commit/6868c9e49c1854028fb46022d=
aac3b1b10ca2c70
>
> Sorry for not having checked, I was hoping for better.
> (I should be used to it by now...)

Sorry for joining the party so late, you're killing AF_ALG faster than
I can follow all the mails.
Speaking of CAAM, there is a legit usecase which exists mainline. No
vendor patches needed.

You can create a CAAM BLOB (a generated and sealed key) using the
trusted keys subsystem and use this BLOB
later in AF_ALG to perform AES with a key invisible to userspace.

e.g.
kid=3D$(keyctl add trusted mykey "new 32 pk" @s)
keyctl print $kid | xxd -r -p > blob.bin
Then just create a caam_pkey_info in userspace and feed it into AF_ALG
and perform AES with it.

So, pretty please,  if you kill AF_ALG and all this, offer some way to
achieve the same in userspace.

-
Thanks,
//richard
