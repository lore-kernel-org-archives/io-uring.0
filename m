Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC5136F8EF
	for <io-uring@vger.kernel.org>; Sun, 26 Jul 2026 07:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785051068; cv=pass; b=cGvdvFcCLxJee0ghbLHAN2exph/afoZWFj3VzDtUYp5LGxV5KBEMQSeSkIY3L01issq5SWoKwc8A2l+RXDoI9LccgEhktNCxWCX1nld/buV4UcdkbhGgi1tcHe18P82EptswaEmbvTZ5YylPDxK8zXACW7efgWcDFznxRNsBdDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785051068; c=relaxed/simple;
	bh=i0lh72d2nmu3uu3VDQoHujJQG0QNixt9o8QmQUrkaDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CHecj8tBUd0whn9Qmyz2+UosVT8wGqxXxLXvgpTw1daq2FiZOFYRWBSeGrNDxX/xBpC5bnTN3uv2+ptjg9KWWyxWnQUF2bT4LQ/E9yA5yHAfKCg9m+pKKlSrGPvGzlxvERekuBWhJy3bWGSwTrpDKfItLZJ+qeW7gVtkFb2WB4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZrK5Lp6W; arc=pass smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZrK5Lp6W"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-848761b5897so989503b3a.3
        for <io-uring@vger.kernel.org>; Sun, 26 Jul 2026 00:31:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785051065; cv=none;
        d=google.com; s=arc-20260327;
        b=FX5KF6UvHy8R7CGf3Crg5uJP3scdmL+XShFtZmUf2QImwxj1RMi4MFTbf2Yu+R+TgX
         rEIKDzuhNQT2ysNxNbVePPjlTXc3kSNzG8ab/RFCMt/TG9u3gkGZ6ch6L794lEgrg2QW
         zbatObfUyKw67mPIMIvWRZfykemO64F+fkapPXqkT4U3xxWv42VNKHGj0qwaYTx3RK3R
         Hp1tVDkq4S4mzuuBktq5lu3q/pQpNKFQpI9pyd4kd7lxCs7bjRz2n9FWMnMSFjtaITmg
         IXGZkKbCuDR4pvjOhSQoZbu2Osg/2UzMOxRKXnb3/nYuv7EDdt6ubXyngJ5B6P+Snjz3
         uULg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LZTVSxKYFzxJZaYDAFPYkohl9eRKYUawYCXhr4l0HQQ=;
        fh=+Ni5xPMY0yzqQZAkzQEVT82oxAjrHYkmj9zN8dex1Mk=;
        b=saBI8NKwvBdlABwlzRHy1FF8IR8oSfWp4BtqPBuAYdZmpJwPIWTelb+2sKcsmbraJi
         8ZFeUvdwg0BC21xDPAfSPT9OTGxexpQ+8HREv8LSOeulYqe0DOeG9uwGsmgHUwu2t3gQ
         gDHxVuiQLT4lLFYF+Pjl27y6ZemfDKMHRuw72X1AWJjXfBXkELCDxqH065QyeTxqS2Zs
         yMpsBuYpqdQ9pnHKyehh07hFJakE4gq8gme5EtBUpTfW/XD7iJlssZblOu6u7hNhdYEx
         IG6ojf+7lnZMd+146cUCQDPSjuFIb9VxPR8MggQJcuS/eU3LDs2pvHS+rGvWBhe2KVRl
         psGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785051065; x=1785655865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LZTVSxKYFzxJZaYDAFPYkohl9eRKYUawYCXhr4l0HQQ=;
        b=ZrK5Lp6WqJQ4AYEUExlJ96qEozJu712C5w53xvpoTOGRL96QqYfaHp2RmF753iN5bo
         SpbMiuR/Rrr6NF/cirypL9oH5ccFJu5bTk5LzZmmXhUqeg7FVeM4fTLlYxpoITkSGNR3
         I2Um1YzhaO7tB+9iew+TAmbV46K8WlZPKgh13IKI/eze+xalGjRmg2DPm7Yb1PTuegy/
         MxmXX75YGz7gvyBYyFHTMjrtevUQ63b9cQ+XCIYw2mH1awAMLl2FHoDGAuf6Q59GTmyB
         e/a4KhMt4VrfzGIH4psfiIcGyicDjqv+g4+ML8pvR1lnV4M+UuNinfYSKlsY9SespX06
         E0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785051065; x=1785655865;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZTVSxKYFzxJZaYDAFPYkohl9eRKYUawYCXhr4l0HQQ=;
        b=VhGcLqsQa8qVPTkpsbSP7fDytYLy/h3FP3Or57DGLms9SiPUPGYVYJs9kqByfgB7LP
         sxKGMVnBno5ZM7kMzFSuYD9zsK4ssUda/EYmd174jB57P6/ys9oTnFynNyvayJ3OQdAN
         1lpVZG9TDI/xtzOcbVYnebKtRJkzK7UUC6Mk7d9qPGVgzjly9SdbOedI7kp5vLf4lrVf
         jdGO2wG2QnoEKH4lbu79hw4C6KwIzm1OzHvYe5EEu+VZJX62kqNtG3g54huNnQHLisOR
         HwCy34q2QQDFKFAOPpPbrufqzNXnZRvYn4p0eu7/6802BlXNQEP//Iq+Tn26kfQ25k3E
         J/qw==
X-Forwarded-Encrypted: i=1; AHgh+Rrrc7einyn9EbFYuy9jG0n97KWFOF/qb1wD3qLsRCyPX5OQmWpAd/YeAWLRdIC9Y7+lZB/AiCNehA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/paWld8fYgfqhcJHFrWILcwzDC0fYeSJuG6uZt6v5CRcCBmoe
	Dh1vGw5LJwHfl3LuYuO/TuqJ6EPvXatN3ogHcMmZyojKR2cZ8UsJI+3I+bjgtmto8VbOhXWDCwA
	wS0Tw9+yVz9RfyMQdwkCKGoEzVRqXxbY=
X-Gm-Gg: AR+sD11jeA3Mlh/1b/hLXpUdQY/bn52IIjeqW1cgGDHlFaGDryddbVCzEgVK4ZytsCO
	2ao0fP0MhLKCdQeI0/ZWIWwpZaOrExlUjPopnTyELJB8tmjQ42eATxUtwLvOChtcy9qF3Im2LfK
	y+Xq3mB1EZgnEeLap5ZPqq3kD+vsTcJ0RRGCi8sRfx28WbvbPtv3ClLOwjRTGKgtwnoOgAPTCF/
	W0xAygwTtXfIbM10BYvTHRfUOGsHBkSTZ1UuaTLt0nVlzpYqBKvrq5mn1+1Ng==
X-Received: by 2002:a05:6a00:4213:b0:84c:4d9a:ae42 with SMTP id
 d2e1a72fcca58-84e59498487mr3719808b3a.27.1785051064667; Sun, 26 Jul 2026
 00:31:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523-af-alg-harden-v1-2-c76755c3a5c5@gmail.com>
 <20260603133312.12848-1-freude@linux.ibm.com> <amOGWwdjnJqyxH5L@codewreck.org>
 <20260724160034.GB2032@sol> <amOTjPW__CNZui3_@codewreck.org>
 <CAFLxGvy+ec3nQLrQtwFZgGELhT2pKBDnHdD0pMvEGh-Mf3rjgQ@mail.gmail.com>
 <20260725220443.GA41199@quark> <20260725230922.GB41199@quark>
In-Reply-To: <20260725230922.GB41199@quark>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 26 Jul 2026 09:30:50 +0200
X-Gm-Features: AUfX_mwtxGS7a6c5QzhlmY01HvejyEPiuukikmfTBc_9wA_H1fyNyxlq8igMsLA
Message-ID: <CAFLxGvzT7jO+dxLSUgw0SOViuV7suY+Tz8m-RE6DBVfF-WbRUA@mail.gmail.com>
Subject: Re: [PATCH 2/3] AF_ALG: Drop support for off-CPU cryptography
To: Eric Biggers <ebiggers@kernel.org>
Cc: Dominique Martinet <asmadeus@codewreck.org>, demiobenour@gmail.com, 
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

On Sun, Jul 26, 2026 at 1:09=E2=80=AFAM Eric Biggers <ebiggers@kernel.org> =
wrote:
> > You've only mentioned that it "can" be used in this way in upstream.
> > Can you confirm that it *is* used, and with an actual upstream algorith=
m
> > name, and if so which one(s)?  And if so, would you also be able to
> > share whether this is for dm-crypt or not?  We should remember that
> > dm-crypt accepts keys directly and AF_ALG is not needed to use it.
>
> We'd also need to know whether the user (if there is one) requires
> unprivileged use.
>
> Hopefully not: these sorts of hardware crypto drivers have lots of bugs.
> Indeed, the CAAM "cbc(paes)" doesn't validate the key length correctly,
> leaks DMA mappings, concurrent requests race with each other, etc...

Uff, you're right. There are some nasty bugs.
I guess nobody noticed so far because the algorithm is only used a few time=
s
at bootup (as root).

--=20
Thanks,
//richard
