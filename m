Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EA12BEFF5
	for <io-uring@vger.kernel.org>; Wed, 22 Jul 2026 12:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784723811; cv=pass; b=U1QIObUzC5R+Wzhvm6PEt5iwce1TMyNsvkrK3UFU9RNRwKi+xJ6qCdlidzadqLaTDLWRKwK/oDomUXSgv+kuOhUh66AXcGlPzU5DX3rGD79glwFO/E6xjO0Df3nfyr8YIKFDLqqrgY9jx7oAiZW4VNSyFQhzXPby/P2Avx85+4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784723811; c=relaxed/simple;
	bh=9Oe/z2U5VVq7TsjY7mXnV7BA2CP2F8KjPa1Hidk1kWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QdnHoRzXbPs3s7z/R0fXQW2OL0qvyN652UVD9Z9N4uf4tNmLmC+Ra1uw2yAe65rr4vABOpdUZKEygRKIAmUw0NqcDps/3TSQP1SQSYv1gAi8wH8gvM6NY/quFPfucjG+bgRKj7BnsXDmnVI9xRjUgSkKXSNik/MMBURDaC1+Lvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LzEIJ04s; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LzEIJ04s"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-69c1220bd51so15142634a12.3
        for <io-uring@vger.kernel.org>; Wed, 22 Jul 2026 05:36:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784723808; cv=none;
        d=google.com; s=arc-20260327;
        b=nafPqH0NsWRYrA+jm7A1bKaqIoNNKIP+qkWIG4SMOQgwoHlV0tzYq7fUUTvsbm7h5i
         +57TBBOhbOqxLekjlke2R3pie7sldGVsSPjviREoeTKVzkW1xe2MDHXOluGjWo11e637
         Tv3i2ggxN9aRz6WrA+o8iAQdosRFzKuXKc9bIR/3AqPjQJRYz/XEmiO8HDMbS/QmRI0R
         pV2BSOj+0i2NMzHgcy1FdtwqardVSZJ4Mzcsk8VqLC8orksQMpBUwvfiPTnhmpZP313v
         zJ641RdPqSTKNplg5mWKksK2w537GHaAjoeXd0FCxLMc71htNXrikIpV9ucHL5PbehZK
         55CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9Oe/z2U5VVq7TsjY7mXnV7BA2CP2F8KjPa1Hidk1kWI=;
        fh=FmF192Sibvhgb1up8ehVqw35lNFr9teq9xcy/tHaCTY=;
        b=DzoC4MksjpYqBDu+wkZQ7hlhWm4XvZ47dsOmFa9yqvOJMyL/UUxToADa3GZr4B8uf0
         IfU/1hbr4iiXweYc+vbDmH/7E5kKPgw4fQv4Yf2KNEzpJbPg9iorWfa0luAMFMC7wRpM
         I0sJ2kHvoZCDnxbBre9XX7F0eAm9OSRHytRR24rtTmwQoYZsW4m0nxxCYOs578PuO75O
         zJLZcF6k0EO0eotCJePbBbhpPrsTKVGPNGsg7Wj2GIwp/WH/msJkOTfOqBi0fDEXIt7u
         SNg+KZ+dRCBKwCaodCDOPzXk/l22MPUsdGMO5rXHrPfeFlJZ5C56sjBCcv8cp68IBTJj
         7V9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784723808; x=1785328608; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Oe/z2U5VVq7TsjY7mXnV7BA2CP2F8KjPa1Hidk1kWI=;
        b=LzEIJ04s1HS+EtuiNqHuG/kWYfflqFIfC2sFsaOUd2XIvx0sm48Ks0v5y7IkN8HpIY
         JlfnFR9RE7T3wC1gttzAs8hCS5re74TEA3dW9bWrugIpH+bVkqsABP2LSX7TVk4aB6vk
         mf4i5QFBWFXBZ0RGNK7PCDUv+dIRxGZPbiA0/2hRNMPa9qdio/mfQsCeEt+mMI4ea13+
         R4ouV/Tmbx2fUpkgQCzOXJ6n5Azi+Luo5O11D4BrjG4zjeNkqpFG3efr1vsIOEiHiaRu
         LaZ12K/bEEff8/RKeUAyUhDTzGzUsmD/ycbRQQRIz/73FHVU/BscCIs+LrWq23d/v25B
         Tb3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784723808; x=1785328608;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9Oe/z2U5VVq7TsjY7mXnV7BA2CP2F8KjPa1Hidk1kWI=;
        b=U7uBaOhtU0jlljIxAC4o1YTl98PqaMF6wlAauz7Pj4ynZgekL66H7clBoZR+YLI9h1
         wGvTos6AYftG0yqyUVKUZG1aO4zOmpMq0Uuswddy6wj2m3yH1Ae9C20wZrxFVO6FO0Tp
         rJke6nFxC+w5+fKR1UHg35rTdehCkcXGP8oM7/PxzYqP0AxOW786a0ZuyW5Ohkghf32W
         D0rA4hPN9Dt5CT0UqGvMcFTFhuoAc+iWRFWQXMWrf7NYWuctmwytVCB7Eeot0L6I4J3w
         qM3zX9h0YOqj7Nm74N4RDOUsva5ygcJRLoOxIs3gvIvPuzhmsOzF9YUeIKBzfpaznigP
         Lb8w==
X-Forwarded-Encrypted: i=1; AHgh+Rq3b0WwtzHR9jRC96D+lD5mnY9QYQuaWLOy4AFbddOgagf91bbzNtB9TlT/zreVHOyhwodM/MPm+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLs334fNgewrZXWc/QbfzyBpH0uOfyWN031nIgIqzH4FXEnjTX
	XG8RR+REUYnsmRpwje2ifrC0FAM9E/MBVycPnZNZdgOrJQBES74DIdNJh25Jasb1uuwaZzI6pT3
	KEUHPfeV4RgoWfn2r6CyUN7LprW/CFYI=
X-Gm-Gg: AR+sD10lrHy2vOp9EOM7/i/x6JHsccnS0ylhbiOLqHJKIErawby0xc+POSO8aWRe8GS
	g2NHrV1qdOzg0ilmdULr1KaaQbiJaZmMkGyWRsheSbuTjXtig+Y3YHD1Rr1h27ZMMF5rxEUKrXd
	Fm7kzBnpWFmGbgnhRHvTfSCrYUmUn8Cp02YZE1zCdnj/eVWhaiiiGB10XLqrjKQIipEXg0YH7A+
	jDPgIcwarkTRhe0iE3xsOmlCCeX7S/bXJ6TcxTLPzydUKiLv/OrIYwlqgnB6+KCgESM9meI
X-Received: by 2002:a05:6402:454a:b0:69c:794d:48ba with SMTP id
 4fb4d7f45d1cf-69e65161367mr7289374a12.0.1784723807852; Wed, 22 Jul 2026
 05:36:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720114116.21830-1-yi1tang.yang@gmail.com> <902127f0-83b6-46d2-9e7e-71cee4d63016@kernel.dk>
In-Reply-To: <902127f0-83b6-46d2-9e7e-71cee4d63016@kernel.dk>
From: Yitang Yang <yi1tang.yang@gmail.com>
Date: Wed, 22 Jul 2026 20:36:36 +0800
X-Gm-Features: AUfX_myfA9GPubRg9Z7mgLfJi28nVa8ooiv3FGl4Uy3_2uu1Rr4vh2Hs4qMcGfo
Message-ID: <CADd-6Fxdk3Y2RyzvJAfA0i1Go5U-y=9__vCdy+FdzcOWwnK18w@mail.gmail.com>
Subject: Re: [PATCH] io_uring/rw: fix missing ERESTARTSYS conversion in read paths
To: Jens Axboe <axboe@kernel.dk>
Cc: krisman@suse.de, io-uring@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks! I'll send a v2.
