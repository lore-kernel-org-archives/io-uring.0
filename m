Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793745818;
	b=GdJnTBL9UjmY0jM02JNAJw2iG50qY/HKpbEHBr8RpOwpDF4CLc6wFGxXFY5ASg3eltGF
	 9mcN87v+2NWIVTIo0xVyXfcxExleV9D2Jc+UXB17E1f3fBiHp2/OfEKPPBF/qpsgKRAxT
	 ZN69FMa/HdI+1xgJHxp84HXZhm0Ih72wCWgYYwdOKl/K8e6qWvMt9nn1XCe4vxXe2Uwuj
	 wYjoJMhlGXY+r+UiNTPqEaOh/47HEipMtYz/1dc7v79PbLXcbEpIasvJkNitiDYJhywsl
	 mQyedP+/LEN2fxctR0ofy9TgppAsApJpsb9pQhAXfCGDx9HpCnhGEBZFJaZ6zYO3Xmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793745818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=TEsmJhHG6UzOUAsN1CLfuPQCNGFTSJjKfJhnGZfHeUo=;
	b=IqI/3ZNVMYv4En4Ln0sbwLT4o4gcUpMMZfJCUBUQBygFeTU/QFp2qqXE+42KnfHF/wgp
	 s528O6/amNhS+1Jkhet6SGQyJSPJJJRFKAUEZSLTRdDewXp4zVCPV1hz1KpKB4ZNFHC4Z
	 Bn2SpR7bJHCDm+f/OF4HYUFmatS17gke9mDDybY0YbZ425UWLMScMOTSRLRu1BM4pylnh
	 60QIY8hEBMTr58VpbV6Sx062v9PVYy3b5aLHn4f/M/QA0TXoPoDiPku7pMIGxSKpocubb
	 VZ6QRnh0JkkmrMnnOzPYjKYNMuaruFsg0qfCcDbMsLOMz/nETUqNYqg6USi5UtBjoQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nSm1Ta/L";
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587BA606A328
	for <io-uring@vger.kernel.org>; Tue,  3 Nov 2026 22:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 587BA606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nSm1Ta/L
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-369f126a526so40646eec.0
        for <io-uring@vger.kernel.org>; Tue, 03 Nov 2026 14:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793745817; x=1794350617; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TEsmJhHG6UzOUAsN1CLfuPQCNGFTSJjKfJhnGZfHeUo=;
        b=nSm1Ta/LRGVYs7LSmDicg4qmLY+G3QKwOL6aUalRgmoK+cIOBxQOc6eQQ72XYNymGk
         1WjM6CiaaNZpDFPIYFWywDYD28bYZqKUI1qOJ9/6cCvuKVnmzVEIZtYlWX4uQeL4rDrQ
         In/H52J/vIpQLculr4W56KeYPDFPpiXr6NGH8+4lDLej8vMr0dCSTMnR7J8/gsJvj5wy
         fduWdiVgaax7kmUfpEagXnqcGhgF9AnPobHCc9NBLlWIWb5xxZ2OqVEMkisW5E3iVAmj
         sXonf6pxJ8mRtSHNJK+vrB0K0nak3/2yF3P+RlcjY2hdbBw59GdWH/6OmT+LHjGpWCo7
         S7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793745817; x=1794350617;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TEsmJhHG6UzOUAsN1CLfuPQCNGFTSJjKfJhnGZfHeUo=;
        b=2ThIeYzDTJzdonr7ZL9HGaIIi0CjXQ8DeMjcyJZ2l9CvIHxQxlw7vODv06EkE2qK+q
         b+g5I3YrSJqnAsV2B522bNa2InjVeMUXHwpkIFZnm5BP9aiLXgIqPvQS6whnLhvS8O0m
         Qx1RTuSxO02DZmcWhxdiKyd/bx6NHwmGUiDMkwoQr2KmXOARBepYaa8Vkg+HEPR/PnWu
         ljlCA9f+cWluH8lmZUf04peASf1v2uVlVvY0k1D6B8Gdt0+dPLgPccPFItaH/dab1HCh
         Jnfkmz2MKRSthv7RMk4xDC/F4dvNAAzwoPKZY553uXQSSkzfWkRMW5YbbaD2ScMGs6j1
         bpVw==
X-Forwarded-Encrypted: i=1; AKwUvBx4C99FuTL1YmxBqN9gTjJOi589VJDiuTezCl0C8xmLeBkwriML/4fbRG1oSj7S+YzshcdqLIRFXg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Uqs9OBQwxHr1xpviMq5dYPCc7Fv+RQHyUSVwa8r3LS6LUrTSF
	S1nPgRgdERf28NTrK3kBP3ktlZBqjmqvR+SV/K3Flms9BoDqMJOI8UY9
X-Gm-Gg: AYBFou0ZplKd5pVfpxJDemkvc0mslcQ1hLjIPxmNVayuKbeM6y9/wwiSDcpUtYC/Bj4
	u/qaXoccy6yKxkQRhnbXnlmYez3EV+1fN27K8ynXSjiNjOyK2tMaNliEIyfLIvLFuAkkF9Ww1zg
	VGRWp+RzbvcRv/DZfC1cR1ElfnePPf6sV/sGDNbgLuduPuCQ/jUG6qbxfr6NYJeNwJsIzeb764o
	e2EMrLbvuEbsvGwjYIJ+v7hGnj1Fnz3frq+fwgFKTwIyjCIR0vxh086Wk+9DzjeDjNx8oZxsfWt
	V1z+VVhhjfeRX0CSjoRUQ2H0aFpCvoMsOAK/XIINBySzRBbRkTdd1C0ePmh+v8Jiyew2MLSkbFI
	C7J+L1vl7TBPkMivEhTq+1gR6j1ZkpfmlvcvDyjIT73aAGfsK7uPJlUDvxdpUqdZ4lKVRzg27yZ
	GSUlw8KcqCMuJeSOFO7FAHbypWKs0ZWI+zF8VOV9e6auU6X/hGhib2uMmxWubG7IpK+eZTaUgF8
	D4HjwCCNpFEoNVw4HcldqmIu3MxTAZ/PNhZzt+6iPOzkI6Zi88RKEVAS0S0HcI62kl0pMNObQRD
	a8t4dYyQn7iMi+YBzYsYjg==
X-Received: by 2002:a05:693c:87c2:20b0:36a:6ae5:23e2 with SMTP id 5a478bee46e88-36a6ae52e67mr10824936eec.17.1793745816953;
        Tue, 03 Nov 2026 14:43:36 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:64::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b8eb3sm1372736eec.27.2026.11.03.14.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:43:36 -0800 (PST)
Date: Tue, 3 Nov 2026 14:42:13 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jakub Kicinski <kuba@kernel.org>, Willem de Bruijn <willemb@google.com>, 
	Eric Dumazet <edumazet@kernel.org>, Kaiyuan Zhang <kaiyuanz@google.com>, io-uring@vger.kernel.org, 
	Stanislav Fomichev <sdf@fomichev.me>, Paolo Abeni <pabeni@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>, 
	Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>
Subject: Re: [PATCH net-next v2 2/4] netmem: store memory provider private
 pointer directly in struct net_iov
Message-ID: <aupiPcDWNkZAucKe@devvm16445.scu0.facebook.com>
References: <20261102231827.4088254-1-almasrymina@google.com>
 <20261102231827.4088254-3-almasrymina@google.com>
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
In-Reply-To: <20261102231827.4088254-3-almasrymina@google.com>

On 11/02, Mina Almasry wrote:

[..]

> Resolving the memory provider instance from a struct net_iov currently
> chases niov->owner (struct net_iov_area) and then dereferences the
> provider-specific container struct (such as net_devmem_dmabuf_binding
> or io_zcrx_area->ifq).

Chasing niov->owner is true, but I don't see another dereference you're
talking about? net_devmem_iov_binding does container_of to get from
area to the binding (and the area is the first member of the binding,
so it is a already a nop). And IIRC, iou has a similar arrangement.
So I'd vote to keep things as is unless you explain what I'm missing.
