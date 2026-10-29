Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=89.58.62.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793302218;
	b=BGnp58pbHHv4JDzkLm1n3PNM7dTaeMLxV8u0em6vGqIelkteOKReh1zHBFYWRSQY0YuS
	 8+oU4bWPhkho/tu6Gm1qBxEa45OnYJHZ5E8/lXbw9ia5kcnocJVFoiFkGJOcC/8uKqTq+
	 j8P+s8OrRKTliIWMGOyo/pJWE7kK1F41kQun5hg9C8EnUGnf67G1oWPIycNcUw0v86xBR
	 Up0g4KCkDmk3FeJWOm5hdz9F5yoIB6XF9EgQTOOQRn7WEXytw09VwZD/unLXMY1a4tfu6
	 eIpsGeIUbKFcxOZYhwzphBwxMSMRB6jtt5nnM2eE+l3RxqVKozI+bXbCZLvKnfLY15A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793302218;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Mime-Version:
	 Content-Type:Content-Transfer-Encoding:References:In-Reply-To:
	 Message-Id:Subject:Cc:To:From:Date;
	bh=xqisFqBSljGE0+NnpC7r0K5ZPpKIOPXDTw9uVea5BEU=;
	b=HwH0D1vUN+xTMRaw4MRRR+2lxtpHk+A3hbBbCc0qFriLBRnSPrBkPBgbAHQxa8iLeARF
	 3SZkvbDS6ic/3UZKSqMHoUy3ElbxT2RJAzAsxM20KW4Uv4mVlDdy6vIG+KZJBL2SVC/9M
	 4hUaAM4VKEBdB0tgL9s6YLvqW4mrWLpLQlLmG6hb1OEqNUjFvv+99rbCDhqeYkiWFapsU
	 4fibQDM0EsEFUwAv/gLKf88EFPrmUF9XiMR5vLID5SZ5fTb/757ZKoGCtYQDmnBJXXZLP
	 7lrR9ENT2j/6JAFwS6Zm6X81ePFsOj8ycFpzUGlooi+SrcnulGVdNgYV9xAYqvDyB1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gnuweeb.org;
	spf=pass smtp.mailfrom=gnuweeb.org;
	dkim=pass header.d=gnuweeb.org header.i=@gnuweeb.org header.a=rsa-sha256 header.s=new2025 header.b=i4G+S5Op;
	dkim=pass header.d=gnuweeb.org header.i=@gnuweeb.org header.a=ed25519-sha256 header.s=gt202610e header.b=oNWch+27;
	arc=none smtp.remote-ip=89.58.62.56
Received: from mail1.gnuweeb.org (mail1.gnuweeb.org [89.58.62.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF66606A31E
	for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 19:30:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AF66606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gnuweeb.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnuweeb.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gnuweeb.org header.i=@gnuweeb.org header.a=rsa-sha256 header.s=new2025 header.b=i4G+S5Op;
	dkim=pass header.d=gnuweeb.org header.i=@gnuweeb.org header.a=ed25519-sha256 header.s=gt202610e header.b=oNWch+27
Received: from mail1.gnuweeb.org (greentea-greentea-1.greentea_webmail [10.45.99.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail1.gnuweeb.org (Postfix) with ESMTPSA id 4jFvT33CHMz3DRK;
	Thu, 29 Oct 2026 19:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gnuweeb.org; s=new2025;
	t=1793302215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xqisFqBSljGE0+NnpC7r0K5ZPpKIOPXDTw9uVea5BEU=;
	b=i4G+S5Op/WJb9h2cx8MFToVz77/LDsD9CtF42s0M2qYAF+s/llVNy/v/eg0qjxuLZwpVn4
	0FgQKyIiLyGGdse3iAtPFDoEW71Iy07C1qA4qlNXOy71089FzPAtuRLynit1KA3VHHN5+W
	6itfGvIrHa3NIC5wIZeB3A6LPjmL/LHBffP8jQj95GWIxIqY/KCvyq4KbrjNGPEQcrpH+/
	uXpakel6BNNzST9WrOc3PMAzOeh5A8JweGbMcgF6uYJdmwSRTWfJIIehtis2sMaoGSJPXL
	HS5D/u9BtHpc8nmIEVV6DwRTceU4vvqLSoUP1Z32r6xaKzobOXtdr314VPZdpg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=gnuweeb.org;
	s=gt202610e; t=1793302215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xqisFqBSljGE0+NnpC7r0K5ZPpKIOPXDTw9uVea5BEU=;
	b=oNWch+27FiGRk05G+JaF1VtxRwGvAbjs0I2yUfdeSqL+a8vHUxowc4H1XZXBaHqXgBn8ax
	g7OqsTN4kSypiBBA==
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
References: <20261029192003.940655-1-ammarfaizi2@openresty.com>
In-Reply-To: <20261029192003.940655-1-ammarfaizi2@openresty.com>
Message-Id: <hx7hcr2iwnkvcz4p2kizv3kzcq@gnuweeb.org>
Subject: Re: [PATCH liburing] ci: Temporarily remove alpine-musl-build
Cc: "Jens Axboe" <axboe@kernel.dk>, "io-uring Mailing List"
 <io-uring@vger.kernel.org>, <gwml@gnuweeb.org>
To: "Ammar Faizi" <ammarfaizi2@openresty.com>
From: "Alviro Iskandar Setiawan" <alviro.iskandar@gnuweeb.org>
Date: Fri, 30 Oct 2026 02:30:15 +0700

On Fri, 30 Oct 2026 02:20:03 +0700, Ammar Faizi wrote:
> gitlab.alpinelinux.org has been unreachable for several days, which
> makes the alpine-musl-build job fail on GitHub CI while downloading
> the static apk-tools binary:
>
> Download static apk-tools
> Downloading https://gitlab.alpinelinux.org/api/v4/projects/5/packages/gen=
eric/v2.14.10/x86_64/apk.static
> curl: (28) Failed to connect to gitlab.alpinelinux.org port 443 after 100=
02 ms: Timeout was reached
>
> These failures are unrelated to liburing itself and only add noise to
> the CI results. Remove the alpine-musl-build job for now. Once
> gitlab.alpinelinux.org is back up, this commit can simply be reverted.

It's already up today.

```
viro@lunarlake:~$ wget 'https://gitlab.alpinelinux.org/api/v4/projects/5/pa=
ckages/generic/v2.14.10/x86_64/apk.static#!sha256!34bb1a96f0258982377a28939=
2d4ea9f3f4b767a4bb5806b1b87179b79ad8a1c' -O /dev/null
--2026-10-29 19:29:15-- https://gitlab.alpinelinux.org/api/v4/projects/5/pa=
ckages/generic/v2.14.10/x86_64/apk.static
Resolving gitlab.alpinelinux.org (gitlab.alpinelinux.org)... 172.235.166.32=
, 2600:3c0e::2000:fbff:fe05:2323
Connecting to gitlab.alpinelinux.org (gitlab.alpinelinux.org)|172.235.166.3=
2|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 4791392 (4.6M) [application/octet-stream]
Saving to: =E2=80=98/dev/null=E2=80=99

/dev/null 14%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> ] 663.46K 134KB/s eta 3=
0s
/dev/null 14%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> ] 695.46K 129KB/s et=
a 30s
^C

```

-- Viro
