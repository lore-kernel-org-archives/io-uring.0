Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203452;
	b=b9X8wsB6iDQum4ONpaJUJwbHupyqGMonlLxTgmzTA7F0yH7jIppvo22pZYzTmukdoT+z
	 5A/KjIJaC7WE0V7ai9gBIaQQZbr6K+QEdWUqUeNDECrIGPANwdUWtXgzT0qwWLWaktj2g
	 eV+msvm7CqKmALhLB1zpffHtCqeH54r3kUGxuJTsDVDpXJPMyK/ceGvpHeEvdvjRen0tO
	 5BX10U4Tu18zJi8BD4CAxb0x6K4jdP3zX35lHCRSoOXg9SRRLu4zzEjd42HuinEzIb7e5
	 Tjr5eBQpCH7z9O/mvSM/IQKo2IZYwEK1uLv1cyltrdV0Je36tFKhwUA8GCadK7C1Q8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=HLU92PpOXK+Ktbjntwj6K/wKzrqD7ZTq4i89OR79Z88=;
	b=NrBVEdTFbBI45pTupb2BpxTteezoZlgcd4AoT/7BXNnbp6howR2h9g69wT1nDeumYPmj
	 cczzN/ISY8QRnmEJAIt4r9vVbbrcacbU7EBgfd1qFDg02nL3ynSSKLJv2MNOCngil27YY
	 awOTK3ADbiYV2dB2z+QfNoB9pf9o3zog01txLMKJoYoYlOWP/6I5UmyVxeE/wExIliX35
	 1HCA1VYEu3a6cI4vRUgZU18KP12ixbtVdZQ4fn91hcDsvkhmcQ9R708We2vWwmDI+GVqA
	 QJ6rgjg2iMUvJYcAQzKNK/JE5jmPbRcrL6BmZDQY1syb5pZIpx6t6cPPH4rojHa6zaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ejUUxyfM;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91A0606A6DA
	for <io-uring@vger.kernel.org>; Fri, 20 Nov 2026 19:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B91A0606A6DA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ejUUxyfM
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b421e8d111so801030a91.3
        for <io-uring@vger.kernel.org>; Fri, 20 Nov 2026 11:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795203451; x=1795808251; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HLU92PpOXK+Ktbjntwj6K/wKzrqD7ZTq4i89OR79Z88=;
        b=ejUUxyfMijObmR/uk71uc7wEiWG63666i4kANiVWLKS7e/TPrrDFRbh/lojYHlKQwM
         HNgjBk6ieOzaG6ss2SQE4W8DWwsk3WblsgjSaxY7Qp7+nfp9DTkAonaPZOp8sbG+q54y
         c5TDKfV+9GA/zeJBnGq8yYq5jZ33RdGlI/AJtHE9SD+ABUzjhinTq5mb8CvP767E2jOz
         LfvKnL2r3Xm3oE23U5QMjMHdqNNcpz5TOnNcNbSBqx9IS1ZJjS16NX8ZCGX6PC640YBt
         wH/V9z4epp7jQSKsNe+VwJpqiItaoWSEEIkjebRHiGz9eoJ65r7GO5uf9y1CWJ2PBXvZ
         L12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203451; x=1795808251;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HLU92PpOXK+Ktbjntwj6K/wKzrqD7ZTq4i89OR79Z88=;
        b=zTXFW5DMdLaPGsgqZ2fAxulfMfrwIxCRDbNuK1XBtJTGuFs5W5/dvrI022ZGWmpSlz
         HLiEzbdbs20K6JoZGW4r+rMbC/9SnulW7u3eAWsn+2fg7LokvE6hv0zknLactMLcj3rC
         O7R18STqke+uG3lFHgNBV1Ld9eBFnTjZefAiTRns3VJuvawVZFhZYKect4IWMWNuQCfn
         54bC9mNk6VxlkfZSY/sbXmwiz+EutMJRnW4dPqCmKF2UfEiATFEoAdITx7SgsDQW541d
         IaLYpkQz/6oZ2wSwaxRYR2idR2m/6DKlkkOQful4akys7ez9siTncADiiF7/b8hDmt+6
         liHQ==
X-Forwarded-Encrypted: i=1; AL+hErEfPXgwObhJe3anEEgl5tzEFscqmKCbU0DH8d8OKzRnJSKPwXgazcoxJWajnGCgNAo8yMYyNg4OMQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9SiID8rwgiLK3lMW2ibiK6ez7UMfWyRbppNEH5aaZBjeGyBz0l
	gHoLpNgqCL1gtM3HpYrL9oUU6azAs1nBNoC+iq60kH1s7/BY6Fok69E1
X-Gm-Gg: AZFdTZeJrjmOznBr26ebWrn2Qz9Ims3GY1CakkEb57Im5Zd7wHgx3WXhcMYH6cccUlf
	lYCUHqUU1HQvxQg7J6+vNivysE6qhH4rOOWl4oVB/CweFAe+rvRxdTER9qQ3xW2KGB9hN7w63XO
	gLCL28iRAHItpv+WpowExpUuBRnD+zThKoGJVLEGVFUG4yVEWzc/i58CY03kK3NSZYU7vzP9+lw
	PGde7/BdCa/ENeCiqx2EhnCXVXBUUPPeBF5nxPRhevfILcaztX9JBTKnBH7tq6YaHM5csS/QwsR
	D7Yby5PJGsg4bfUPeb/ilrASU2XYvOdwCufXcJXVlOJuw2bnii/S/nEFsIsnu0ZP9bgL9m80oSj
	y0ZeeSJbnNmlu7OoMfrRZbQDqvR+DDPUdOBk/T9+WbbvEmxofwlLDxBazgc4G/k5qgs+yNQal6G
	DEYwQSSpsRLlOjM6M6mNKNqui3YZE2fxjmrO3La8IHSR/HEWHB8N8hJruhfsOPo3MoHv6NdAI8M
	T5/+LHaCZ+jj3XlEqd7OADiTtVhOeThuNRjaDA3/FNoXKDJCO8FQ/tlA+K5cxJ2sZS6MHGBAq3q
	dVKP2yPyzQTvbPkZqii3GdUa+O2T3Lx5WqFgsFmnpS+HXn3yFoP1XBJGhXJKY57Ve8baMPc4HYT
	VQi+B+5dxFooSX94tal1FaRg4oVtLVdjwcw==
X-Received: by 2002:a17:90b:4d10:b0:3ac:9669:846b with SMTP id 98e67ed59e1d1-3b41c852826mr3992020a91.9.1795203450819;
        Fri, 20 Nov 2026 11:37:30 -0800 (PST)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecb486sm8290165a91.16.2026.11.20.11.37.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:37:30 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 19:37:29 +0000
Message-Id: <DN0AIFQ82CFP.34SDTH6ZFZC1G@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Xu Kuohai" <xukuohai@huaweicloud.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <io-uring@vger.kernel.org>,
 <netdev@vger.kernel.org>
Cc: "Kees Cook" <kees@kernel.org>, "Andy Lutomirski" <luto@amacapital.net>,
 "Will Drewry" <wad@chromium.org>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Stanislav Fomichev" <sdf@fomichev.me>, "David S . Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Jens
 Axboe" <axboe@kernel.dk>
Subject: Re: [RFC PATCH 0/3] Introduce a classic BPF filter cache for
 seccomp
In-Reply-To: <cover.1795139109.git.xukuohai@huaweicloud.com>
References: <cover.1795139109.git.xukuohai@huaweicloud.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, Nov 19, 2026 at 10:48 PM Xu Kuohai <xukuohai@huaweicloud.com> wrote:
> The kernel repeatedly translates and JIT-compiles these same cBPF
> programs, wasting CPU cycles and slowing down bulk startup of
> identically sandboxed workloads. cBPF lacks dynamic instruction patching

There is no VM startup number in the series
which makes me question the whole thing.

> features like tail calls or tracing. Its JITed instructions remain
> immutable at runtime. This makes it possible to share the same cBPF
> filter between different processes.

Immutable is not enough. The image depends on the caps of the task
that loads the filter.
Also any task can time seccomp() and learn that somebody has this filter.
seccomp_get_filter() needs CAP_SYS_ADMIN for that today.

fork() shares the filter already, see copy_seccomp().
A launcher can install the common filter once and fork the VMs.

I don't think we need this.

pw-bot: cr
