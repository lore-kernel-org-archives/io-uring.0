Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794596072;
	b=zRNIDOmrlqb3QVdCgTTo0E79CHBiaKTjNsPWMz+3AUsBWCAY0OKPLMM2Aa3wsodBdZII
	 gQ7vJK9VnuNTOIcm0gX3K0r88HTszuY/X9cWNWgHqrNQ4NFgaUHkKqpGu0mAq38oacSiz
	 nICgij3TJfPTWzLl/H8CgY8n+tZKb+elWeDeMP9MN+lHob9eupjWV5ToKO02B1DCvrkDz
	 v6s+10smmU5jN/wYSg760BPGg+4cEWS4Fx4qGMM4pUtlGTOCdnMZZ3nUVWTEzZUPdz8I7
	 uv5cINrSV7Hvj4EhWC9B+M2foGdo9FEYYgtadKxAolAxurAtfJ3OHXW6GObKs7BpwLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7R1hXZXnbTwKM70quTRieOgRc26BuTodcH8VZYBkreU=;
	b=OFSzljn8zA8qCj2PU1deVXzTt47PPUzJyR5T+AYzYoILh/s9aCMJD7xhln7eLp7RyESj
	 qK8KcX7P70g1/z6Ov2ov7iWoLpsL6Ipe00zhlpw2dxEmEYyDcG1FqkbHElmquV0ySVVG6
	 wtDD1RQIT6rou6T7Nqs3T8Nliw1u3g7d6B2TpbMyQIh5S/bT8rhWOHlmf7IVQl/kV85W+
	 +G99FHjuKeKSlz9ZaVvIL8hRVto3/RSQFLxyBGWurWaiY4Zw3hH6GG3WEstSjp306DMgd
	 l2vxKJN2303S7okJYKxKaSpMTyMwbmHJG3ItckxRMTh9+pnyIQsgnLb1FFRvyeJJh8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eisEEVVM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081FF606A331
	for <io-uring@vger.kernel.org>; Fri, 13 Nov 2026 18:54:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 081FF606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eisEEVVM
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b56c90b38eso1365a12.0
        for <io-uring@vger.kernel.org>; Fri, 13 Nov 2026 10:54:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794596070; cv=none;
        d=google.com; s=arc-20260327;
        b=OjUbxTDoUN5RcoINNuw6z/fBJUOxdqFzQltUHAVqvSJ/dy1RvJox6EBRUyOl0hrgpS
         SPm3ZbCs/i4kYgLzmZibLvyvo4ROJn6ztuOe2K6RO5ql2eWVa51JoRiHVVueJ67oVlt/
         qSrvoqrpzvT67ATNCj3pFQpeDouopofaBaS+/Ar2Y2fZ/W5X+ANXqurSkC5AgXqjsVvb
         aOZRloVY7VsTUq/JmqPmrK0Iei4qamqxJGGNc/Fjl+C1QpqGKZ1LvVuXT9/oYrbLy15F
         IhKXDdt1l2puPTdBkYrnemoB856DcqlPGZ38UdzOa9au9U+0JjRRdmFe94xpU2drn5+R
         PC6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7R1hXZXnbTwKM70quTRieOgRc26BuTodcH8VZYBkreU=;
        fh=Ndclh3WVq+070MXVLmLFpkPPeTLMueKx3gbnlNrFWus=;
        b=R5UFI/uIFB8US1tyipWliWQzsbrQqtJJWdE/58UpRGe3scq4yInEawGuN8wlAVDVOW
         jcfBNOEazfmDjBgzufo6nFblmVJ4hAETTpMxTCp4IF5km4aViT+hcvoH31iKMU3LeUEo
         SqfJONASdxqyv9vVos7msvqcd8olBLeyGIx/6RK9DmPxZ2jWJQUL2Ghe41MJtJenV4t6
         1u2Cpz4GBz9Us/Oyod6xYN6Q0GqC9uj99ulftSa/lSP8IAbXfatss06eZBz0TOYLHgAP
         6HTtlqd5VskldCVI0bnJiWHnu+b2Oo8jwwakrRpAqhDUi+wzsNJwQjOkO6sl7w8auhNv
         zfGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794596070; x=1795200870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7R1hXZXnbTwKM70quTRieOgRc26BuTodcH8VZYBkreU=;
        b=eisEEVVM8PCaj/Wxux+iAJmBT1k8bHNU35jNjvPdKn5A1HLZOH5LQ1EY3BcJG6WJSd
         zQJHCca5ZSW272RR8ZqEnxlJfsFyhdrMZusl8QaA4c9HP+xH6avVjT/oc3dDYcv5aBdd
         PX2GBBsx7FbYnffDffV/A8+nFo7zh1u9hueKZ40B79RrQ6sNRvq4xDRAPGyAjZ7E+JEP
         dHQD/L3wxxC2OFdsSm7Io+s1kd8AHRbV0NiLsOq1oDTCRUWH6uhuvzES4DspcfRe/mVS
         XpFUSQpVCuB+A/wp38W4sFKkIzI7LAQear5+guYAQ2EbAMwuzP8+PeaJ1TbqOdpbCAyr
         OtWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596070; x=1795200870;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7R1hXZXnbTwKM70quTRieOgRc26BuTodcH8VZYBkreU=;
        b=F95oBcTn/AjlvEbhcw7qYXo7M0sgs0YXR3ircdLacvYjMUSlf00z1w2NHeyIzQ4G3j
         +CbR7d+uVNHKtyMUjY1IDlfPPxVR3XXR3SjGhBGPvE+agfLyjwjyDlK1n3fVYQ0a8R+t
         6hQ8v/boOX0/LH/KERlyRf5372d96CvInMTvSSjrepkaaCeng5bHYqAW7fTshc96Whms
         WmdlSrJY4taCuXl1lWHvCmpyQ0CPVGHiSY2mi4kor17wBdVPXED7H0UtyOh0MTT4z8ld
         YazRO88sww79ybRKe0eCDTRJNUIMYV9VMC0VOh7Gapvg7ICyyPI+qvl8Msj1mPQrwr0D
         oKUw==
X-Forwarded-Encrypted: i=1; AL+hErFmFAosJF1eDVssLuRv0f4P00wO4nBtLtDkasOlglpm0Jcjw+9WIqp2fi3Aqzj+AsX9tIPrgZuBsg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9LSBgU1PTq/v9Aob6MKYYCdHRKyxyxTW5u8rGF2DkJLFjGy/2G
	hOT7t8RriqL3Ep0xmgrFzy//bRo4hZ/ipyFWlWD2FENDVaCNJ10VE+3XEJ5LU/nBbYlSkUNqMd0
	W89cGh9iyFEvr+tZ7CJtHWe1c7s7de3uc2D7R9Ikf
X-Gm-Gg: AYBFou3dkJYk4qwKX8m8spG0WJ6NhCh1xKIPDpLVC8V2NW5KN6zoQt2ZHkF8ofT5zCv
	5EvKJC96LGQaSAYC+ljVCd4zW6pGV10+qlOwpSUayc12ovA9+Z+cgDJCnAMOPWMtIZaNt5K+dX8
	00XqJFwsGo3RezIE2bvoUukBUE/umPl/uaVcH+ljDJdKSuWrLQb/AwoaJNSc0HBfRPxqr/1YAuw
	uQpisMGBSptrvenAGiEMlVCn8vFBP6kXD/44IAJEPyG7Djc3//8+0M344tuCJzCWYwuW4PCs9Et
	3Gz29q9ouybOiIENp+x3fJGSxT7y34IIe7LtWK1M6A/CJRmAu3vUGPUYpnZl/tkq1Q+Dvif6i9L
	fyHAH16jB0cZ5pO50QK8eG9ttiqJgs8+jVaBe0oKb7I+5l+X3jWVnTeNtsMyGe7IxsoA=
X-Received: by 2002:a05:6402:a512:20b0:6b5:76b2:5e18 with SMTP id
 4fb4d7f45d1cf-6b7e0367708mr7837a12.2.1794596070008; Fri, 13 Nov 2026 10:54:30
 -0800 (PST)
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110102039.1002605-1-bjorn@kernel.org> <20261110102039.1002605-4-bjorn@kernel.org>
In-Reply-To: <20261110102039.1002605-4-bjorn@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 13 Nov 2026 10:54:18 -0800
X-Gm-Features: AclHuK8hJZjvI7zpL7vkOt-X_2SsoIeZHCGx6Ao6kGKYFChdzs729uK5-y6t5Js
Message-ID: <CAHS8izMhFEMu+v4zAm6VqjU=Lz=vMn58Ft6HKya1L-uNY0hL-A@mail.gmail.com>
Subject: Re: [PATCH net-next v1 03/11] xdp: Copy buffers with restricted lifetime
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
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, Weiming Shi <bestswngs@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stuart Clark <stuclar@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 2:21=E2=80=AFAM Bj=C3=B6rn T=C3=B6pel <bjorn@kernel=
.org> wrote:
>
> UMEM stays mapped writable in userspace, and it has a fixed number of
> chunks. The stack must not keep its chunks in an skb or an xdp_frame.
> Mark the providers whose buffers the stack may keep with
> MP_CAP_RETAIN, and copy packets of the others on XDP_PASS, on
> conversion to a frame, and on redirects other than XSKMAP.
>

I'm not understanding why that needs special handling. Devmem stays
mapped and writeable and did not need MP_CAP_RETAIN. Also, today the
stack can keep any pp page in the socket's receive queue for arbitrary
time without _RETAIN. I'm espcially confused you're not adding _RETAIN
as a cap to existing providers, but their netmems can be retained.

> The head chunk is writable by userspace, so it cannot hold
> skb_shared_info, and virt_to_netmem() cannot find a net_iov head.
> Drivers pass kernel memory for both to xdp_init_buff_netmem().
>
> A static key keeps the check off while no such page pool exists. A
> frame copy is linear, so a multi-buffer packet of such a provider
> cannot go to a device or CPU map.
>

Did this actually improve perf? I recall that when I benchmarked the
performance improvement, it was questionable.

--=20
Thanks,
Mina
