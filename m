Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134721;
	b=OP4TVgnF96aPcAAPAS7Bjs0ZlG8Stf9gpZTVBqr6uoDpnsUhrVN5iKxBLbQ2DoXBqe3C
	 pDtR4Ftl+RDhPgkSA7fDhj+KXNmYg6dMqDFksiaqPiDOUeeP40fPptwH1AEXW3LjllnTZ
	 BCpOg9Y8Waul0BfTn7tXXyh4K8qXRhTYtGqPwfCcTUMFetx+pevdQjpNamNVqWY+c28eN
	 R//Y4tDwc2CsTCc3XAvgYP8ByNIX1DqwtSy7ZFknqPKPtdVDhWm4/YAuCXpx5OzcpV+FO
	 DKmsqpG3EznMa1b472DVaZXI9Btylu1z5u7l2zpAX59h2Jt2BKHaGEm5izxMNmhfbnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=6I0dox9mdYstBqG9ky0WjIUXtlB7TLrMdzBHbsE5LOA=;
	b=x4Vgu6D+K0NYWkqRyYZjH17X/MMZ09STjRjyIQs3opPcSoAW19Naz+pc8D4+O9qEoeZC
	 6/cjGL6n7lRhIG/H00sdTp2afarujeCmYMiZlTLFndjNOgmCtybePbkjf36SOocsDAiOf
	 OMGNEso6jd/rlU5SZjWI4QoOSLpLM8NyBP/qz/YT9ZLLiUbPYcI3P59TUGlPQhWN1gZkz
	 mK60JnRbFYx5jk766acQJNrL10Xq3n+Sm92IhVdNa16Fx6ha+q5A7a/ThXdGPEogF5Qw9
	 fEn+2Fxbv+dZYaRsPEkGLrmhk2OC0aqSPjLtwKa7C+o0KfFukaK66Svl/Zj6b6VsBtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=glVrkyNI;
	arc=none smtp.remote-ip=74.125.82.65
Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0798B606A32C
	for <io-uring@vger.kernel.org>; Fri, 20 Nov 2026 00:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0798B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=glVrkyNI
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-18818daa3e7so665314c88.0
        for <io-uring@vger.kernel.org>; Thu, 19 Nov 2026 16:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134720; x=1795739520; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6I0dox9mdYstBqG9ky0WjIUXtlB7TLrMdzBHbsE5LOA=;
        b=glVrkyNIyYlm8wVTiuLIn+1R/pE2V9VJN825nkjbnVE7DzI/tklr0XR6PDNFu1OUjc
         A6P3ZfTwHJQxiHAjmoK4SpQIdS8Ir/katd03VOBvE+4swUu2oA+8IkTyyok1Pjj9/pPY
         jRHRWeNYDZ3yM5EUWHx+RVw95l+YNdToEWVWMBlDmJCQ5nDUi+lZAkU6M+KCBd+2W1HW
         fToXfkJkp8+luUW1MITx+x0oH3VnjO0S4X/xzsL89lshkI/VzuYPu9YudzfVuvXLiO7a
         PI2e6DkQIuvL5sJxpbyOQ9dBGmqKQnp3LSWMA4iJOQsw2EYyE1DA6dSJBL+RP9i6HuS0
         6Qlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134720; x=1795739520;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6I0dox9mdYstBqG9ky0WjIUXtlB7TLrMdzBHbsE5LOA=;
        b=hLrwFWJxpWH3JRx7VCVnSnq2RKyXO/0gHJUpeJzH8c4XTgqVgs5PWXivUNS3wR8+HP
         LvZZouHSjBHhZ8DGi9RHRl92/A6TC6pgzR8PJugJXT8SHYLKU/xT/2ZD+cLCLkjqg311
         TdZqzH9rAN7Jnf5J4Hr3l50vaopNE17D1SuarXbK0cwekguz3gAw/U+OZL7X4ctP/ojh
         azQMGWokDd8Ap6Po0To9WdcCUFzrI5m/rqkPW3K4vhrz2k8mbEyA4exTfCI+fVgqJCFj
         BX8+UDzGuvIf7RqbpxhZiNOnHl1BhDeSuaIiAlCXA7Ga3Ek7UUVbHoxDoRe7OGaMLxfQ
         vYaA==
X-Forwarded-Encrypted: i=1; AL+hErE5ix7it87X3DBa4RskqYvrUc+9PtmODOsyMe0sIMQ4+AE3FfvRroihL3NA0yVwAqlbv/XW/rTnVw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+8NYjn3Ln1TfP7utsKBGNhC9p5zGHNdKvZz2xkn4bC5OAz5u5p
	vrz1lliki7nMtgplZp9PMQioVQwguzPCk9QuN9aL5njEhVGul2LMPSQ+
X-Gm-Gg: AYBFou1JM+hgQd+gHU/NG9OV5xPKyMpSwAFJPjB4b08qb3OUc5IuvwTx100dU4YoYSd
	d58b9ma7v4v3x/URQL4wsaEOotLI2L4VbDZcHidRcf8AwWyaeHJ/kTJWpjLTc5ynqJ2MeZD/MBf
	bW2I9YYhrnpoAKzrc9GTWIg/M29jn6/LPLsogCACDPSMIw0z632Da/voH0/rJfsxAgsS+gZrhng
	GzaeQzmyIUB3fKhztyFoWsFz2Pi3NpGSBpmMNGm2E0AALTSaRD1wybL/o9gIg0KbfdoQrptSh6o
	OEw7PiORVbmaB+D5AGmXlxSUF/UzsKnB4qDs3MFVeCefs8hROSDK+d+g0OYle78BvXqGoSkUOBH
	qARZsCgqbyOejnERlBfqT8fCVA3/exkgY41QL7FUn/wPwdgHwnIfxfOOjKtH45TQXOc1mwY7Opp
	Qsjdap9Ot/le6YSSF5+5spfUij+pS1q6UEmHyKqpxJ7M5YqvSVtYRSnn3ue4tjq4s40Xc4NKnGP
	l0tHf2mkpPEzShyc53+iiXR0OgvNRnWMC4W1iQUc7g4oRzIhWH7U1rsRTG5ZBX3uX+gVKwVfVwh
	43vdsCfRBzt/Zsoan2Rja8E=
X-Received: by 2002:a05:7022:7f19:b0:19f:cc98:f603 with SMTP id a92af1059eb24-1b5520d7d86mr2448430c88.1.1795134719982;
        Thu, 19 Nov 2026 16:31:59 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:42::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm2242124c88.8.2026.11.19.16.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:31:59 -0800 (PST)
Date: Thu, 19 Nov 2026 16:22:53 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Alexander Duyck <alexanderduyck@fb.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Pavel Begunkov <asml.silence@gmail.com>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, Simon Horman <horms@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, kernel-team@meta.com, 
	John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Weiming Shi <bestswngs@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, io-uring@vger.kernel.org, Mina Almasry <almasrymina@google.com>
Subject: Re: [PATCH net-next 1/7] bpf: Keep XDP helpers within readable data
Message-ID: <av-SmgwQhAKI5u5P@devvm16445.scu0.facebook.com>
References: <20261117164700.2157816-1-bjorn@kernel.org>
 <20261117164700.2157816-2-bjorn@kernel.org>
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
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261117164700.2157816-2-bjorn@kernel.org>

On 11/17, Björn Töpel wrote:
> Devmem and io_uring zero-copy RX put payload in fragments that the
> kernel cannot read. XDP helpers must not treat these fragments as
> normal pages.
> 
> Reject operations that read or write these fragments. Access to the

[..]

> linear part still works. Tail trimming does not read the payload;
> clear the unreadable flag after it removes every fragment.

I guess this is technically true, but why allow it at all? Easier/safer
to reject tail trimming as well?
