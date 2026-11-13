Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794598046;
	b=LtIvUxXmquqX6XWDDTSTwZiQgJf49j1C99/V5aB9jjuJx9wWKp8sP+vo0S9RTH8xPFy9
	 fwpZ0T2DOskRj6y+SUzXUxqoKKCHspqBNr3UosvJDUl2YnXkzoBFDdHIKnkJh48FZlODh
	 HAyGTzZh2VXyfjpxGhhSOizRTHesiTtvusD0olh3ZyupQWNSQOco+OaXHX6W7A9z6m6+k
	 DXRlzPIaAElaHbOJZh7TiC4s+ivrMEN1/e3GLS0jHLV3bL8B7X3lBKrUs9CphFZH0DBrm
	 q21w5cUcOFg8AYd2NgbAp2yQajGNXO0QUBBChNKScZG5NVS/w1N1RNy7iM8kwbdrsyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794598046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rWNSB/aKf2gXUDjDW2lO9uiQwvj+Xxn71g5+dKmym3c=;
	b=hf1vBEjLi4AVnJdzvfYBduL/Ac6ukgZPahYRm6u9MLq3wnTpkhboZZJy0W4ti4oF9YUV
	 K6zVI1NylXSbWB3lDN3N4EiJqTF8spIpFE/OsYEugA4avxlLGaVsBIS/DKjgkuIqKWHNk
	 LN7cGtnGO19atTILuNcqojO4VcXWieNdnPNRurc9pSVqJCGoiIw2nL9h642mKOjVrQYcl
	 VzRec9w04CrXdFF6yAf5QY5VzUsDyjggqveoTcgNuIZ9sKaWbBeUhFb+j+MSOkZLqDXpD
	 R1HvGhThn2gnI6ZmioDXWUEkYN6rjtxtS1uhBlzDo1tS/suJPULScRxw5+VA5184x+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gL8jZDdW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A467F606A339
	for <io-uring@vger.kernel.org>; Fri, 13 Nov 2026 19:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A467F606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gL8jZDdW
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b791a4b732so1170a12.1
        for <io-uring@vger.kernel.org>; Fri, 13 Nov 2026 11:27:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794598044; cv=none;
        d=google.com; s=arc-20260327;
        b=AQ9zVfi04kMw1fCNzMEPQn2yhhW1S8PHriQH3z1updS4OjbRAlKhhQ0Hg9a4kRGRBV
         d59Xg08q4eQdEZm69hC7cLTlEy73cuqhjoro1fN6fGXard4BOs99mrygCKrsQya1+1eB
         m8UD6G6N5jXD4SONNegYji+vynqfA+rfUlGjCX0i55gbqX+n4RmdweSLXIIt/1r47/Ad
         Sdg8rpMa/5VNllM1rIT9xF9XUBWp0x0BdH7WznWWeQjcf8tjF7MgY11SQTUrUBbvuNft
         41Ha/0Zxcunkpfa8Do17RQCRN5IL9s2nzCFs2QMd0Y/3MGMtXpSBhACfhJ5Yb0JG/E/7
         otlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rWNSB/aKf2gXUDjDW2lO9uiQwvj+Xxn71g5+dKmym3c=;
        fh=FlAYoAfL5CTZy/vZGg+yX5f90490tq2JTyLHe8PNBAk=;
        b=PmyhnTyLlcy+SpwQe6FSPwZtSUWGc7DiVYvmtJh5tRwpkP0Ci/Ez8gMFIckm5eAAaG
         MKaXtu2iG90YY+ovXwhEn8Os+876ZszSwgNreDX8mV+zdPbPsRiZY/fm7PXk2jkyqzlz
         6DOVrQCMuZ8yhx2LkriTNU9t9bDeyOLGjB+4FNWSHnCu500MjuGxgNLk6/zbK+jnS1NO
         1FeMQ8a5StSHwA864uLfRzz49WzqWz8s30X0bfVvukQZvi3sBtJWwCD14ZclahmGeSk8
         ZmUFNYVclfW1b1JTRpsHHbQ8UGIOHWaK0vdHlzPLLaePiQzAyHAqTu9ZR4eForQxMEaw
         SqOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794598044; x=1795202844; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rWNSB/aKf2gXUDjDW2lO9uiQwvj+Xxn71g5+dKmym3c=;
        b=gL8jZDdWoijYOUqqlj8DOAFvK6zCt6P1zN7hO5bgTFypZZ4sQKlyeApMVL5tn//P0M
         6kW3UYi9iCdBDhHfk6wKFTzI+2CfsAFBw7Rqv9Vk1nFOxXNXN/aD1X2E3ajfnJ6UGuBm
         glDsl536MTl2iP4zdDhrwJ/LeGsb/n7BT1C7dJ/ov1VxHcpDm2TAmCZoixEJlYoKVorI
         ShfqoCaCnn5MgtpAfxRcrwijJhRmF2tjMYr+EO4otzUnXlUcb3HThkZkliJTv9xT5miG
         cFjd4sB1mm4TKPqC2fzbcGlemMbI6HKTVpEDf72EISt32sXh2M3a08l80d0nxf1IFaH4
         Jg6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794598044; x=1795202844;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rWNSB/aKf2gXUDjDW2lO9uiQwvj+Xxn71g5+dKmym3c=;
        b=tEkV1sN4FoATBsehUYypkxtxzNOl25u2IHBT/Qw0Qovrrf4/opNsWN6mckcI6d2LTm
         p1S5+JtpEMcopMDWGte9blcsYkE5oGIYpILeIbvPa0jn7EQITf9b690Ckc2WV3Vks8th
         r1e5KmJsrA/3C9/Z3ky6KSTy5ObXajIqb8OsxTIDNIeECu3cGL/8CFArXM1pIhbMZzYR
         LwhdlGmVMc4Gp9D+jBl0NESz09jmXB977d7i3FDRHwrouFCKPzbfpwxvFBcstueJd03u
         0KnEvMYhPv6RuvCLUh9KTXnIMaAM1ztv6kd7qffg343myA/SKMeWhKDuv8R9Ft0guYlX
         psEw==
X-Forwarded-Encrypted: i=1; AL+hErG0LxThMHoh59vSFSKHU/Ij0gCYy4K66ZDqAqkj2VuoLXO3X5wSoQjAdl/ZkXOZllpYVk9NSSj/Hw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9GqOEryvlm2FBoZCr8RnEq6ZCUiyLs/CiV+UIH58+NdAl0ZMzu
	HACytrVPruSoC5m6d9djKbia29VFZL3BCoHZBiofVDG8PgVFzfsQBvbFdS0k4K5YLkn4ITdK9zv
	2tcayl6w2Y/cREobKxlBwFC4a3r9Ad2enFVxpjj1n
X-Gm-Gg: AYBFou1/mrGXdFuC47zLo+pJX7rHEzbRiHC3VvBAGkfhUrx3Mv0fCBX8Dqwt2XiLSA4
	nmKngNEcSsG7sgtkEpCzGuhzdVolm2FByVn7UjYdBhM+VvrT7icR/oZmDFf6snQFSIfV8b8jmnk
	Zu4szjq+9KUVBjuXeqejjXL4Tc7egamnOyCRs2u6gc7X8cqgbQEa2iIoMgb/naLqCi+3w3jpfB0
	MCTopcNlWgGCQcgq82NGBXLlWdxgAJb8yDRdOpiNbaWlhCVyK02PTDYMsVkJS1QXiF0sYzEpdB9
	XG9wenKTl3RyENw2x+IT1PMq8x4bADYajSAFaPOtpQTfqQ70ahgCM551R2AoDCOEG2EMFeKfXe8
	KKGKNONWAwXFwS1d5NxIlCJxsdbDxX/Jagr7p47Ij4jMKoQQyQf40TRVQarneWLoZxEM=
X-Received: by 2002:aa7:c60c:0:b0:6b5:5d24:5d90 with SMTP id
 4fb4d7f45d1cf-6b7e064b605mr11515a12.3.1794598043562; Fri, 13 Nov 2026
 11:27:23 -0800 (PST)
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110102039.1002605-1-bjorn@kernel.org> <20261110102039.1002605-10-bjorn@kernel.org>
In-Reply-To: <20261110102039.1002605-10-bjorn@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 13 Nov 2026 11:27:11 -0800
X-Gm-Features: AclHuK8F8Y_DVnfmHCZelVEZmvLdtuJXie3zRJu-e7GqKDc7mN1PxeFQiqOooCY
Message-ID: <CAHS8izNyMM3pSJJXZga+OL6QMHFgnF-gu-+vzk6DO=EC4CLfuQ@mail.gmail.com>
Subject: Re: [PATCH net-next v1 09/11] eth: fbnic: Use netmem for RX headers
 and XDP_TX
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

On Tue, Nov 10, 2026 at 2:22=E2=80=AFAM Bj=C3=B6rn T=C3=B6pel <bjorn@kernel=
.org> wrote:
>
> fbnic reaches header and XDP_TX buffers through struct page, which a
> provider net_iov does not have. Use netmem for both, and set up the
> xdp_buff with xdp_init_buff_netmem(), so XDP_PASS copies heads that
> must not leave the RX poll.
>
> Signed-off-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>

Acked-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
