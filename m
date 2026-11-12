Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794472366;
	b=36GV7l0P64rcp2i1kyWcOomoKp3vI92zrjEC0+4z2o3qbsptktapZNaY7rRR8WHjmJpk
	 Hn0ehe4hGNeGMFF1f5zlp1KwVhZRg2djg6ie/f0RzVHT+hw+XvfaSwX+CICsbUXd1fVKL
	 1PgeOT7T3G3+kGQdcEwoSLops1mtUeNbmC5BB87fHeUWZ8w339J6ToR7PTzjXEEwBy8UG
	 MASpqhh2dOTJGq/6UiZZqQcTv/bAWMR8OcKDpKZTAd7lhhWddLqC9DEFqCMNoXGqCiMLf
	 tB47A7VaMf2SK8F+4xW4zMBcrPFuXj67ebml3VLf3bEKfFPj/jBYTEKJ3/dty+A1jbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0l9eWNYt+4OdoC01Aa/h4I10jx5l5dY/DXFWNFAegOg=;
	b=qi9+gBH2En8pWFlYCyLIcbN/CabHkSHjg3UfiYY6gYc4hra3SZFrYlB0l58KYV/RuvBb
	 +pcPyzRhqgGkl540KSuTtn/otglC3KTFxCmvcHZC7PwjBWSEO4PDEgmFrMyaqm0RyGwMT
	 V8UkE3h8Hem6TXJuajoTzCRNe628OonDj4vvF9Ei0ssgNW7K91VWEAp6l7RHToJivkUNr
	 CRCPS3LNuB6xo+tM0j+Yo/O+TXTvQZeINF6KCIF66dAOMdFaFsIYShEexSLhfHGpdXvFn
	 NYaMreK3Nj5d3/s2EPGkfZkjzXMuLrJrCUmEUJwD/EuFj3m34U5oh+VeLgSKjhIbdhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IjZZzhPX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA6D60A5BD3
	for <io-uring@vger.kernel.org>; Thu, 12 Nov 2026 08:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FA6D60A5BD3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IjZZzhPX
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b570ff3dfdso4336074a12.3
        for <io-uring@vger.kernel.org>; Thu, 12 Nov 2026 00:32:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794472364; cv=none;
        d=google.com; s=arc-20260327;
        b=Da4yDnUdNA9nubmxbQ6C7dM9itoNtZ8qiQPBz9SX8IuplmqjhX20NgcPrleGUd3JXB
         8oIHI3Ay2CTCIV07M/+LuGBP/yW89URnCbpWGehnp9nzyijOMOJntlDMqRzBpOyO2tQ2
         25W8wFjR9kjzc45wF/6cVJiETV9JbyR/9kaG7KWlCF3SyDsHkPjkA+5CXeImaZW/saAE
         2tFyM14CbKy5eu89NcFhEgUXDBOIxudocXikRwJoJteg25l9FfjX+GbnMHJB/k1CmaRI
         68IE5/isvVQ/xxWxeu1AI7FCFA7YEacqq/3k01fOfxi18Ey7/peEDmkjVRvSqG9IARrL
         J7bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0l9eWNYt+4OdoC01Aa/h4I10jx5l5dY/DXFWNFAegOg=;
        fh=IRU3tNCKTiTjMvIi7NACjqhFF5152zrouUG/a73RrRs=;
        b=GVuM9gQrVAJn22xdKW0h6kX6GjUJzJjsJXwhBTKR3hoiAGXhKF+4LRFlQF3s+UgGUq
         cI4oRWh/xrlKN3ATtMT5Ehc9uKCJ2dIIpVqm4nSmJZ+ilk7KPnsvTXv7cYzWFjxsUX/P
         s7GvMNRkMg2HJsgEQZOmnAj2xEP0yjkB/SpUCuNdzdEBHOR3MR2H4LHM6OIHz2z16YEI
         ERug1u6iTyCWkecP90zqcZCq6G3CmdRC5kh7L4n0N2Mjl5vRvLi88c5OwzGEe+mczZAB
         +QprZhMWDfpknPJ0BCoY/eQ38rQZHv3TUEpO27hJbdL/alQln6GH2vpofSJ40CkzRdy+
         eCPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794472364; x=1795077164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0l9eWNYt+4OdoC01Aa/h4I10jx5l5dY/DXFWNFAegOg=;
        b=IjZZzhPXrQb+C82MzXH+yaFZMdw3I1fS6f+ZKPUlu4rKAv7YGY/A4npfbHZ01BDx4/
         vehtR2RomeLqZqfjL08oP+6ImriXxgfvzxYVKbLJ5TeraSk7AGdN2BqZCr8Wfl8Y6rKb
         hLv1UqaQKCKAPrnqdk/3nPwU63dOGY6TlaP1LNzhv3oNk0/OxVEzF2RdbLEzQ5w9cEX4
         CDX3IJKXBPew0T49m9+pPKYVvmv1QcvsMgpSfZrVqfxCa7YIZusZzdVD8FqruquU+RON
         bGCSzVs/dSbZYdxZLgr3yfjig8gMvd2nyMgu+eUgDB2zpv7w8KhcsyyzDz+XmXgXnOt1
         V+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472364; x=1795077164;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0l9eWNYt+4OdoC01Aa/h4I10jx5l5dY/DXFWNFAegOg=;
        b=Z4tMvyL9B+tdt509c0vJKs2MEYnRx+8uwLn5wUzgGlNoRMJnNjjvk8cPpNqdsLKWvZ
         CtXNzif+4Cb/Icl2DVGVcKOpUMu+a7gK7+Au361s25D7MPrET4mx+E5Gl+pHKWRxUqaU
         4kr0qBnCnhcanUrfeQHqvoXTekBLfHVs4Bsn1jhKuNvdc771FgRiKw/WyX0ybnzkZrcr
         4BsKPG+HLgp9v+v2Utk0onbqNqDOYRtLfhCUMSbuIN3YHMW87ABeryujgpvA6R2a6Pob
         f3rMesftRg3fbD1EG+c8booasVuiVWjK82IRLg9GmP+Bkr040EGQDHs5bXBjGXNBBRBr
         J5yA==
X-Forwarded-Encrypted: i=1; AL+hErEO60xmSKaiMECrlguU+fjg/qYRr4vCo6VU8Im6lZqvDFJcnftIqmTJNSxnSZPI9KQxvw3eNeM1KA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/xLBZUgdigjD6uVeF9e2T7mcr1bUgkG1/F0+4rGXBfLKX1w0n4
	ybHbV+XRlumtlIAiIbJlaMHUQDgbkQarr1dEgmNDfQ/coQdJSij+1KD9em1chZfdi1+StuERR8W
	4JOflcYenCyV99bAREkRb7/7iHOzV01E=
X-Gm-Gg: AYBFou2ogwvSPbXnMwB/qD9ik04N0bnBUNcMNeM19oo/oehq3bsD20rEk5s0VHGvSOY
	XkSJ6L2VHysT/sqOOmXbwMBfOOj+XrzhPcmN2L5xrisifvzVW/YcoDwIoWz9ZPnz4k2jHU6AJgk
	aN6pFdirDqcuWWraCIKZc/5wBz2Rl6c6DQr7KzqMygXEXyW7hjSb/uiM2/HjJ1ghW1OceQGS1je
	nStQLDKc+naekXJW3Mx7eKAk5MbqMHz675oZeW1zOlh3RCupUCA57v4f8K9EhvcNqrMt9K466Zx
	JJ9dAdFmHUy3mgbQSJ0Qdl1POn8WkGotigJrzgw6xvDjR4m6K5Tnjskv/ZJ+eQPazXHcVTviyrW
	g9T17XlZzDbPwhg6Yia5U7WeFZmCXrbhCMRAY+dtKQD6hR1uZDJRK+uy6/lS/+w2ggygOiLY=
X-Received: by 2002:a05:6402:2711:b0:6b7:a357:375b with SMTP id
 4fb4d7f45d1cf-6b7a3573c70mr809364a12.40.1794472364208; Thu, 12 Nov 2026
 00:32:44 -0800 (PST)
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110102039.1002605-1-bjorn@kernel.org> <20261110102039.1002605-2-bjorn@kernel.org>
In-Reply-To: <20261110102039.1002605-2-bjorn@kernel.org>
From: saeed bishara <saeed.bishara.os@gmail.com>
Date: Thu, 12 Nov 2026 10:32:32 +0200
X-Gm-Features: AclHuK_JmHtMGasdG1MlcgZSR9JInf5KlnPcivwlvNEZTX0IPHWZAk1Q01MwQ2M
Message-ID: <CAHfVqdVYBbs8zu40nEaCDvGVNeXHe2DXh0dGxEcgL3kP8S8_HQ@mail.gmail.com>
Subject: Re: [PATCH net-next v1 01/11] net: Get skb fragment addresses through netmem
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, io-uring@vger.kernel.org, 
	Mina Almasry <almasrymina@google.com>, 
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, Weiming Shi <bestswngs@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stuart Clark <stuclar@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 12:27=E2=80=AFPM Bj=C3=B6rn T=C3=B6pel <bjorn@kerne=
l.org> wrote:
>
> skb_frag_address() goes through struct page, so a net_iov never has an
> address. Only unreadable memory should lack one: XDP and BPF read
> fragments through this helper, and AF_XDP UMEM will back readable
> net_iovs. netmem_address() also returns NULL, not a bogus pointer, for
> an unmapped highmem page.
Does this mean that skb_frag_address_safe() is practically identical
to skb_frag_address()? I assume highmem page is the only case where
non niov page isn't mapped.
>

>   *
> - * Returns: the address of the data within @frag. The page must already
> - * be mapped.
> + * Returns: the address of the data within @frag, or %NULL if the CPU ca=
nnot
> + * read it.
"CPU cannot read" isn't accurate, I assume that in iouring case the
buffer is mapped to userspace.
>   */
