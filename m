Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794547871;
	b=nlmgxEoiG57UW1dTpkUwmrQtnYM5IMPBLJ3l9/aqWmoPZmBLjgfDun3SuTHiT0EBhHbx
	 zM7BGK5sB6IUvzxIpqKdoR09p3cqt4GOhCeFhl/bdVdLDW+HMxfjRsa/eR907Q7gyEyF+
	 4m8DJllHR6w7Na+hz2yixunTk4saVviqnKIE6ZXz5FOtVnxJXfX+22m4p8XPPN4Ro6iH2
	 O6fZ3z/soltZKZuxt2iWlOqKsl6uAnvk1S+t/xehBeXYCJNlXAq77pmeYquap7nvXqR5I
	 evjDrhdsVdnwXHtdyWXo3NNPCOV68pvM/SFJNzT82OQOwGfuwoBnyVQTULjIC84DR/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794547871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=w43UbU37I+5iOET4dygwr5SwGRkUmEoClUGG8OTjGgI=;
	b=3SyvtYnqGAQ0l5Tb4qqGw7tzhQR4ZGbfxbDFpSoutA/yDgFrfIzqxsHlpTOhaIriZMXf
	 31IT8FtupAcFOi+da1vQlWxv8GStBNhd37aB/xOXiGF3x2phALe76MxykpzqBs7CuVA2l
	 iqLmUs6L/5xpj0FBOW1vJyvNDSGwUuT7TGjmsueYWuTGdRwf9ohRfsY/hRBH55gE74U2s
	 nPVPNBVRI9NM6n8wo+nLQmWRfE9Iit1zfW0cE1LXVwqOj7uMoPrR+d2v46/Nd24W8XH+s
	 HP1Xw9afmXEY9iKFdsQ395KGy5wIJxbgoLJ6r3pFHMSJIhzXtvmhmEZG6hhQhHUz0Hw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="VTU/Umv/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC425606A323
	for <io-uring@vger.kernel.org>; Fri, 13 Nov 2026 05:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC425606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VTU/Umv/
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b571a45a2aso4593a12.0
        for <io-uring@vger.kernel.org>; Thu, 12 Nov 2026 21:31:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794547869; cv=none;
        d=google.com; s=arc-20260327;
        b=N6nEev0ZJQvQx7yja1k52nGVAnHOEbfiEMNa8/qixK4HWJIRdVlZSdFADhiCqTex5a
         1xwt3R4pDKoU0bj9F7Mrb+wa4snYTNqfLaMYp6UyAt/vAGVWICmREIqLM/j0fzr6BujC
         soaYtzVihZtmvSIIskEY3gBJWdduKhsI6vxXHENW/40mPH/+IlUrQduZZbzqOnTVSZvB
         RjTXm8XYHoCyhhz6HnQJiFdBcnJ6ksl50wqjfDwSbYIyt496FdCj0wMfwuUb0YxjNq+y
         8kw1AZ6Rlg/8vB6eqWMT5AX4MAa8jnsQ7mwIk8kqgBUOB3u0KkwlzPG4AdJhCCUuDPNs
         XcCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w43UbU37I+5iOET4dygwr5SwGRkUmEoClUGG8OTjGgI=;
        fh=u348RuWsz+23++LvzyZ/9xrV+0gd+DEijDQYxP3BAXM=;
        b=NcSQC6T9FZ/2+zjfQd7xSyqGMozMT6tf2/UaL8QYXAcg9dToecNgbpr55q5C62blsl
         Kk46fWOUhh2tvJwhJ99k82+tETJKAkS37gQ3LH3ZDM+XdCvq57Q97fdLLGQs2oSzLV8g
         XC8eJvKxdGjyQnGFfXjLwqRciVCSFahPb/OnVf7bbl7duct2kNTT77zP65b4mRyHsNOF
         0loCIqE0oYM6435Sv4doRK4oE1tPeD1XmCVNHX87vs/OD3l05G71GrdBCmIlC3mZsAl+
         GYR01wVks+YyYPx+QKlhOfxHlNacullTNSyo5s1zTW/aS+QQGn2/JyOgRsNhiX+TGf2g
         rz+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794547869; x=1795152669; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w43UbU37I+5iOET4dygwr5SwGRkUmEoClUGG8OTjGgI=;
        b=VTU/Umv/XxRmtX3d/XSHHHzSkVNlCjGAiWWmvRpYtATJbDMspOvWRWvSyyqUeqeGeO
         Q8uCINspbjVgU1zSuH+9UnHcqxv8cjRjT4BNbJxmhaQFB8TeexUJIOYqLp4e6zCgNF7n
         GqWGMPJWmhxv2jXRWVtVDAZqa1EhqIWzuIWQ7K3QsEysQ+usM5G4CvZUur47OQUqnPpY
         PP7Up96FsigDTcgDAk4n7JTplwxHbQe689kspsrS0geT7o0ItGIgt0vez+TupVh2sN/m
         e+JFPSRT2SGGBWIOmeouwuXUS1RYlIiX34y+UZSFFdexoH4xWaCTbeVKnfpyGGT5KVCu
         Qs2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794547869; x=1795152669;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w43UbU37I+5iOET4dygwr5SwGRkUmEoClUGG8OTjGgI=;
        b=N5pQ1tMRp3qxriM4Tn3iCFLISad+kJFosQJmDky6rkzlq55SEFiIUIjlAgdaC59PUa
         z0lJ+e3a62HPaYOyYkUkkuP6YcCDysMd2Cw6GIuZnPM636zYKg0XOeFRsV/dZ09tnZH3
         4D9qUUpKsKjPyN2O2KRYJnDRtFHdgD+dbRk97oXQVmL4YGPDQiB3vldFXiV0ZM4jGLJi
         KLrChBTTlkBtZoJbP23z+qB3hltNOasdEr/ZDTfkAbZ4uMD3Tk8dtLpjUrKzap+C7/Ee
         M3FUx9kspIEDPZmVcffCGQOh1XCDtHtV6TPwJXLMfYEm9Tap1vedF2zwiRD6pKArq8Z6
         4yLg==
X-Forwarded-Encrypted: i=1; AL+hErEQkPc87aZso8K/Kmev8ChsQJKKURtKZup0QXknVh6c8x5Q5YQs+6+sB7BPE9bJ4NuFPW+c5fDIsw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+V0Wjc9fxyykHNEQYbuqyy6ehoETbidHFbRMgs+JJEcgDckq1X
	B6SqCBF56cYhYIIJFsijqMPNtg2cocwzxbP5IIggEW6B5cIvbwxbWWDZQz+sAZFv1pGcZ+VOEiG
	skAyimmlOuhx/shLzezIjUUc/VOGKqC/X8Vnij/4o
X-Gm-Gg: AYBFou2cseR/EPOqGVdChv5gQeASuD11YP+1e+0+JCJc3dRJ/k0NwzLqUIrezHwFMD7
	ubvB/VjlS6rz2B03p4YJoqcXJVEAiU7kL9mKMVjInRfoQf2NcibJ769qFyhVJMPy14yi58rD+9v
	jwEcJo6VSWMLT8znhw2sUn1O7HVmepuHjZgXB5uYYXNbbBeu/GA8ILwk50jXNEIfbfiOEVqrk0l
	dX90iuLopmZJmrg7/B0I34U0XITvcoiA6XTNGybKDqUExdOikkVAHYdMbVbhgBld23m53tDX1Yk
	2jKA3BuR7OBB7BN6EqHOrpswfiJBgH6E7VymXqSWH0fcXoC2IY8oc+6OfrbmNFyKTe/jp0+2k5h
	Y3jXmVzR0vZ7u+kWUGAb94nGOAV9uUjrf0b0=
X-Received: by 2002:a05:6402:50c:b0:6b1:bce6:1220 with SMTP id
 4fb4d7f45d1cf-6b7c82ccc67mr31403a12.12.1794547868632; Thu, 12 Nov 2026
 21:31:08 -0800 (PST)
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110102039.1002605-1-bjorn@kernel.org> <20261110102039.1002605-3-bjorn@kernel.org>
In-Reply-To: <20261110102039.1002605-3-bjorn@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 12 Nov 2026 21:30:57 -0800
X-Gm-Features: AclHuK8G8jI-cBJtcQSxvGp_Bq701GaxLVhNUpqBJGdSCTN97QaxO6J0E1uIQ_U
Message-ID: <CAHS8izMaAv6gX1NeJR+QCf43CL+DC4DgePRNNxSLoE31jxHU0g@mail.gmail.com>
Subject: Re: [PATCH net-next v1 02/11] net: Add memory provider capabilities
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
> The core treats every memory provider as unreadable: installing one
> needs header split and no XDP program, and any page pool that allows
> unreadable netmem takes it. An AF_XDP UMEM provider is readable, needs
> XDP, and hands out whole buffers.
>
> Describe providers by MP_CAP_READABLE and MP_CAP_FRAG; devmem and
> io_uring keep their behavior with MP_CAP_FRAG. A page pool takes a
> readable provider only with the new PP_FLAG_MEM_PROVIDER:

Why do we need this? I thought whatever creates the pool actually
shouldn't get to pick whether the pool picks up the memory provider. I
thought if core has configured the rxq for a memory provider then the
pool is forced to take it.
