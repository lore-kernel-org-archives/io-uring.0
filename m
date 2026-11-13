Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794547076;
	b=yM7j4y1z9izywpXHhvusbunabW4Ukn5QpJK4llCjPr2XU8PxRothF25QyfPH6Sruux9P
	 pqOnKpa7HsSqIvhU0s/7wHLy8DRb4gJ1rgI+MAs1KgfVZFUigrqtq6TX6fpLVEMRg9MKA
	 8+6NCB3KSayeTFlKj7FTP/aV0CChhlY4Lym6gKrQw0pUBnWIyENPzOTk6KCgvHL40gFvu
	 t0mGs2T6wpAzZlRPWVtGtBTFVNkTJ56nAEhvRPZr5RNm0PihHd1K2FywaiPQ97xoAC2T0
	 cbKFowI+Ry9YalmdEwM3D4zRhGhyELlkQYCQqYOD3/C+hgXEmmPOZ4xG6pOA5FtLKgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794547076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=f+W0yRPPh5LN5Rei1H2okk7m72K0RoxQKNaAvZ54EI4=;
	b=Fv1GcnckWsSNCgxwuW4t72gQGheYfvO/G9qVCffs8Exz4EBxzoNCnIY0YyYCnq/677qa
	 c9IpeCpe0RYdrIQezk8k6ejMqrAh4i/4QshQpeJPuWqzNNW0wB4mSeTd5QnL4AzWd1a2V
	 Kc2iISDG/QU6RbKCbZb2AM8MoCVqf787PZAkWKvBhlkj/beNRTBCKFNq1LgxVpB5phpdU
	 Gjcu5BRRKhtonY/CKLIIz9klTkbyVqMUFm6dwdgcDKT421ioznIPGGoBn7AUquZPXK2tR
	 k1HcQiFZEaaz1lHVci7Fl6pmoOm3IP+PnQIQ0TE7YAhTGIDos0ChiP+Dy1qzlV/jtYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XkcAxtUC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A955D606A887
	for <io-uring@vger.kernel.org>; Fri, 13 Nov 2026 05:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A955D606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XkcAxtUC
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b571a45a2aso4467a12.0
        for <io-uring@vger.kernel.org>; Thu, 12 Nov 2026 21:17:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794547074; cv=none;
        d=google.com; s=arc-20260327;
        b=izU7AmTEbeY3BSYOKXRwrx3bN+YLUkUsXfzJL0TBMscI7Sw1/fVsoSd4JoWBTnovth
         BXA/bV4d8ylrXwz2pM+7ZoFecpdwXV+W1PbrZXh5j1g/hPuRBQBQHEhq47+RPMNoeSTa
         nP4foBindGKF07A85tNV1mcGkPwNJvAoel/0ruZYgzedX/aIoKigzFvTMLVAp8H07FRf
         OaJHHYbaWRsrLtWTKLrBEV5KEa2nWnL7sVMzvXqXx1T6+FtWab5VcXR5oGau6q+gt2Vu
         GE6RwWobX8VtbJMg1PlGZUl/pny8+3kqDg1Jav8StMDGpzK+ZzKtGybOmqeoOIwhbng/
         Gpug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f+W0yRPPh5LN5Rei1H2okk7m72K0RoxQKNaAvZ54EI4=;
        fh=ECq8TM39qH/uaEJjbwFNdHsEZYtPDNGWxABefE34AIk=;
        b=K69H7H47i1zTmmnrKgH8ru20c1i0GZb9kGk5m37vbexr2hf/DvnddKqo2LRfiiPqIe
         zPL8BCKbsk+gSyeruHtnx4y+S+R8JfbX7tWaXcLdKA7uEpOPjRWk8dACToicRplDM/wg
         sO82/sNGQVP0TX9KC4Y3FiyWDBEZAZ5EFHkaHOumpGKJ7H8Lmmanni6HzdwvatoTyp6p
         UQE8YcRZWXxB7CUxOY5CHYA6Mx9C/23tggaTqA5rlu0WSiBG1I45BDiSfwimZLWm6wk7
         YNdKINb4jwFrEXr1zHg/bXNh3beIFwYznxYqTuya4xaFU7BAN7t6oEhjahINhJ1M7ONU
         Onnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794547074; x=1795151874; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f+W0yRPPh5LN5Rei1H2okk7m72K0RoxQKNaAvZ54EI4=;
        b=XkcAxtUCanemul+RicaP/aozebWZdnRnipw0ipFQorOt0CF/BrSpgOa8erBdCdQ4N4
         VLN7NIrJsbUZs5/qRbv6PVx8HdejsexGCcXBvZF9JMwInu54ZTGyLTXV4CP5Khnt6ZmY
         KtwFVLwvIbCaIc+i4hJo68hl9fk2E5AG+n1NWywpxM5HEwL/Sh5PnG2wSuHDKvMPj93c
         eS9Wdn4dxDybUNs84KncdG8MxZzbqIualdyZuYd1d9+Jv3B6t3kVQ5SHpDpkkDeOs8Hr
         TJbLqq+E4fLdgNwbW0RukXF0HL4RUXNqvH0YKSicntzdAKQfXtwzBHxp8r6Xg1qJ7l/Y
         8paQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794547074; x=1795151874;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f+W0yRPPh5LN5Rei1H2okk7m72K0RoxQKNaAvZ54EI4=;
        b=rayPVel+eByNoVmSPksY7OfjdtHCUioQAfQD9FOgaYON3sX6xVFgL3RMmBm/xHfJQc
         o963j+BqMURhuZ173UthnM8lnP9JpeYgGpIKPXChueM5UE/WgHeiWdSZJ8eus2kM4q/c
         ICXbKnSUuy7cSbTO8qgtTTUp1lPAcSWq1/HxkuqM6p4Sb6ZCiwpVlpeMrGbxzqw6vyT/
         E12iRJMjVB2W12ZZuWikHBxtoyCjEuKnD4gx3y4NkpPupB1npPIxe2UzIRkkU+hgWlHJ
         2jloDlztNgL71CAujAeNjd4R/ENjKTqN7SVldshLaTdnLVwEeWcCXUPN9Yj47cv1SRWU
         ErUQ==
X-Forwarded-Encrypted: i=1; AL+hErGyBwhoqW7ANtu0Dg77jQFCmLlBkbtHp1b9QGc7aPegLeCONk7r1zd/IjHxA/UaufkcxcNiLBCOxw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9CD4jf/M8IjEd+vRsTYXNp0taZasnIQOug6/e/9HetsmvuEEY8
	HcQxoj0OiirW3TRCdbiYB7dsV5wj3BxeMOuIj9EsBtK1tnHXApjpvdvL8MRJah6U+t/9Wc+L8fj
	u/hQmgb9NEIZi/Ut1aw+BAcRopY32IOjlGPDy0hih
X-Gm-Gg: AYBFou18MEywaYE2Xq1CRWjbV/0l7mEM7IqRPLf8behKuSVZAQ2wYwLF038ARftFfZb
	ct34IW8guBYle78tQbfkiaeawlvT6EI3wWMhdUHa402CBmselgFJhwcrJi7uMrYKz1mEZY4CIqG
	duT0AaGadQsvEfd3NVL25Q2c2rs0VaABowIkjishoA7yUjRjKm5/C0qjCGeRj+QwFLDlRcpEVap
	5LAWlSHS0YSRH2fcFZu7vUyN4yjy2ZbZn0c9vqYJpmcWGf3UyJiiut+WLhY7XZ7oyK7GXlzS9OA
	ylaotb2ZV+lZ5mObiY5iD5rcACgYbr1syVy7Va/rh9MCQB2YefJPdGA1NtMhcGzUgcoq2lPkykd
	MhuIsrGi3m0P9IeNvv292uCCpsi6Zr2Fp8n0=
X-Received: by 2002:a05:6402:160d:b0:6b5:70c1:650c with SMTP id
 4fb4d7f45d1cf-6b7c34c6eb8mr48079a12.4.1794547073617; Thu, 12 Nov 2026
 21:17:53 -0800 (PST)
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
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 12 Nov 2026 21:17:41 -0800
X-Gm-Features: AclHuK-EmG-vcwSjI4xi1-iRc2SNUCp5kahvZ3vW1cJ6PmqMOttCBZ_NEdrFdlY
Message-ID: <CAHS8izPnmy4W6f3dWp2NCkmNYxtP8jKm5rxjvPbQc8VdFm0Wng@mail.gmail.com>
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
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, Weiming Shi <bestswngs@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stuart Clark <stuclar@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 2:21=E2=80=AFAM Bj=C3=B6rn T=C3=B6pel <bjorn@kernel=
.org> wrote:
>
> skb_frag_address() goes through struct page, so a net_iov never has an
> address. Only unreadable memory should lack one: XDP and BPF read
> fragments through this helper, and AF_XDP UMEM will back readable
> net_iovs. netmem_address() also returns NULL, not a bogus pointer, for
> an unmapped highmem page.
>
> Generic code needs the size of a net_iov to find its address, so keep
> it in struct net_iov_area instead of the devmem binding.
>
> Suggested-by: Mina Almasry <almasrymina@google.com>
> Suggested-by: Stanislav Fomichev <sdf@fomichev.me>
> Signed-off-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>

Are the changes for niov_shift some kind of rebase error? I don't see
how they're related. Otherwise changes LGTM.

--=20
Thanks,
Mina
