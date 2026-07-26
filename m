Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CF4378D68
	for <io-uring@vger.kernel.org>; Sun, 26 Jul 2026 20:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785096663; cv=pass; b=F8EmSKTJkgTQ/Wg3fHs/5pGblFiuIf97TvMN1y1qqnYevEFmChaKQZ2mzhSuvSHI4kRWmgCvuSEc/qSg2tGsML4TjRKzXNPZvuqIWo9c0QXP0P8/Ns/BtgAqFNsZkpc03AzbD3JISQBOp84pV523eYIR3ZrM6VQBH+cMx9c78eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785096663; c=relaxed/simple;
	bh=kWd2ZlnaGIqOzhBDtr6CPo+wqxbzhTWntedFRzAihME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pdLDemwrQuW51osbEC1x06+3PXYYcdg6LBcMB2kS29MkB0poGEXdbo6dGWYSaRKi0DCdK5g7vQNkY+F3R9TneWPy9tBxuM9z6xaEjcvANcLx29+9juk1BHFXtOmCGYBCgV93fFbzGPqnNKdy3PnsdI5BnaJj0QtOTDlNxbmDR2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bWjNmrzf; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bWjNmrzf"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso2892275a91.1
        for <io-uring@vger.kernel.org>; Sun, 26 Jul 2026 13:11:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785096661; cv=none;
        d=google.com; s=arc-20260327;
        b=VmjCpzgOEdO5h42tMqjD/xIq6twx2cOcRIuud7RnQTs8O4GEEvXy0AzJH6igdaIHoI
         NnndUhs86+YbTfSbbdokFKmMWY8HVVLTBX0shyOT49Vq7+g89rl1G9O8FJP3g9MuJwOa
         Qocp0Gv/zGwj82cC0FeccKFlrOM8N7opTDxN7jS9kZzREBreCcTZXFPFv82i/UrHGIp0
         Cms+x4PsGOkse0UjvC7+lHG4eZmCXBfTOebFx4KU9XvQH1aii135TqK1KvamzMeSiQbi
         jj24qstCUJJQJCEZD6wywbni7v6s0Cz8kgsI0ZCZ4sk6W9msViDWA0XYoZmYhyVf57MZ
         G5EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2+Bo0viCEB2m22FDhwGjICfsYsQ1DUFzTfnhxFo1SU0=;
        fh=4z/nooOAijVAhEqXY/NV5mciwAD6Gul5G+aD7neq4dA=;
        b=f7t6sha0RSRjPkglt5MR/ObtX5buYkoWVO2/BJn18iIp/ZT5TzxYNwWqkgp7EeSWb2
         MNrPWjDU11UBFCk1W0FKzhn1OeIfRRzTZcatIipu7rzVlNDNxW7gzqMr/xhwwrEwRLHA
         I54a9TIoGKdjTrjq9hFhWRVd8H53joN9UgR9f6bO172XS5ryX2OUK9ZO3ESpva/u3Jg0
         VPLIzH6QLCusD2IT6Cyp8yCnjCN24h3z2aqQhhPnKOvcTuV3zVHssxbgIApIY13Efdww
         2MJZeRWHDmznWF6xASFoqECZwKSWAa5C6jGnSkr5NJdgmzD1tYP4uIQgrkTey33I9HMD
         S2oA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785096661; x=1785701461; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2+Bo0viCEB2m22FDhwGjICfsYsQ1DUFzTfnhxFo1SU0=;
        b=bWjNmrzfOcznBPitgGj/HS0xLXFm9c9EvME+U9Y38WewNosDqzxcptmAggNl6jtEYm
         THi8L8kT7chED9bWcXg7+qUv/N7TMowQCnPZL3LwK7fkr6tym+6FhlhoxdYN4k1BD/Uf
         9qaSxmxHi4Sjq3UYpbzBwI0DQFesqVWoJqU2jiPsnBPApLeCtmNo0OUMuH18+2f9+5LA
         oo9hGHabcykOJDdvexQexzB4IBppCw9JBRQRZdnqM2zqJLAfzdlDvLn0nywYK8qtiGOj
         x9pUhyT/uAItjv0TDjAWjuOVo5/1tolIctW/xUEQ+wdpDz9bPsJdIrkZuxbm8Nu+sMBL
         pOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785096661; x=1785701461;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2+Bo0viCEB2m22FDhwGjICfsYsQ1DUFzTfnhxFo1SU0=;
        b=LyE4r6e4aREE36HFW2Ra8wuNsVzpk/V6Qo8L5hnam2g3l+WrPnRAzE/wxoXEWJyH82
         3y67HFtvpfskLvc/LLwuxh4CdVfSaV/aPDZvvPMFRt5rvJj9AYh6s4X9ZhQOJkHnRfU/
         7IFV/XBH3edLCO3qzsEcl9uocItbTOFR8/+dQ8NzfwaDMUZXhiNHTGa/1nPu6ZRTvHqc
         1lJXLfupGQ5MlPzk0rvfskjLjpjQ9pBoM67CIa72jILURBhrciHvEE5QJn7jTg8BgbpQ
         JSO8pn0elDKHQbo5EHom/vEKMWZNRGuOfzeUbGuBs+awjau0bzY5tFNdAwGt7njEECMH
         eSSg==
X-Forwarded-Encrypted: i=1; AHgh+RqyRVH+oP8h6LyzqjFu3HVFbvarpairjnQwRVC0c/ML6OCVCbNjH7Ui/U3wxR7uECLukvVF3TAnlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQNHKPyq4a8lB9H2wUFVK1HuisInW9CAlw2JVxUG/nJO932zuU
	JxTwruDavaz2wy3JdqLDMp0PMpwpzZwFBM3p4MCXO5YBf4XqvYQxb//+GQ8KZ8S0ASicrTrqP8j
	YjxhpLd5xWwFfLkFfZaFn/sTabDCIHrQ=
X-Gm-Gg: AR+sD13TY/mpG3kGPBYlyPhQrpRTGCkI77p8uJ/z95BON8mJ2QnV4tnxMxPlQShiwhO
	P/dH6oLfr9U5qrnOkKxlTixv2m6mI2fxsXSQa5Wyb1wIcDSoqsK87YDDOSDBBpEul3k6wCspTkO
	/u1KfN1G4yE/QK0vqeeiINnzNweDvHmBiqwJFLOqSSoBk4US4+5B2LqDTrLdIpZu949hlekQ2j1
	JFWjK63ShKNmnLNWBr6dOcUKzy7as7Malinv7g9OZERE2WSAr0VYhNNyA4X6YZLmMv5N70k
X-Received: by 2002:a17:90b:384b:b0:38d:ef48:b04 with SMTP id
 98e67ed59e1d1-38f294ea3c5mr6088330a91.10.1785096661118; Sun, 26 Jul 2026
 13:11:01 -0700 (PDT)
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
 <20260725220443.GA41199@quark> <CAFLxGvyBGzfwh61F5YkYqctNPCQJCpFOwTtKfDs4L+iK8WJZpQ@mail.gmail.com>
 <20260726155024.GB1673@sol>
In-Reply-To: <20260726155024.GB1673@sol>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 26 Jul 2026 22:10:48 +0200
X-Gm-Features: AUfX_mwZurnXooec2A3FqadK1K8O_igYrMZGYhDFbqwtbTaFK-ATjGnI_bmWgHQ
Message-ID: <CAFLxGvzaAH+ZGr-OFo=Li1aOxgwBjjR76T7m1CjFaL-6w3KPPQ@mail.gmail.com>
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

On Sun, Jul 26, 2026 at 5:52=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
> Then I would suggest that skcipher_bind() should check if the name is
> "cbc(paes)", and if so use 0 instead of AF_ALG_CRYPTOAPI_MASK.  Please
> go ahead and send a patch against mainline (for v7.2-rc6) if you're
> interested.

Patch sent.

> On cryptodev/master (future 7.3) it should get an entry in the new
> skcipher_allowlist as well: { "cbc(paes)", true }.  That would be a
> separate patch.

Do you mind a new field in struct af_alg_allowlist_entry which indicates
that  AF_ALG_CRYPTOAPI_MASK should get bypassed?

bool bypass_apimask;?

> With those it will keep working as root.  (And you mentioned in your
> other email it's used only as root anyway.)

Agreed. While I don't know whether others out there using it in
non-privileged mode,
let's be conservative. If something breaks, users will speak up, I hope.

--=20
Thanks,
//richard
