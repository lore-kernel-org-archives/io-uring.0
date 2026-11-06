Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966676;
	b=biL/aK4zT+JXeng+Ts2uIHHsWFALWtEUiRyvbyqnc/eH/nkwgKZng8DzOL57fDy34dc9
	 T6Q09Fl/veXDB2s7CcDIAqk9+9tgb+2IUFgzcan42Jhc19YCZuq7rUEUV1tJI/gW+OOGz
	 RxbSExx+hZ8DXhgDt/iUusm021hLHGDWR9lzz7Z+vptbeARysd5F9lgOjAFW8yE9SMM4h
	 Qd04xkkNA+vRIfNpJngFk/S+je6aO3PqWnJnNz3zC9HkofifN9ir7bUt7H6WDRvYpf8CL
	 YMZWxVhxY85eX9dR5DHsV/crL2AWb9+14a0I+ATmKjSKjzLeCfqLrCuZkGQp1s/pD8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966676;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=mQPghIdCwc0e98l2yQke423qVKfB2niFRxcXLsZIMCo=;
	b=zvBp+JCyWn+/+nhPPtM9LCHT7+VZOiJVhnROnwgE6jG9BZUcYCQuAAjXZ0OhFDdnsaSH
	 eOXuY2JtvBOuPGD5c2oYQPQ5vijD/f6xQyHqTEQTU7mmZkkA6kZnte8tuE60gaJqrKwun
	 qTy9jDKdlvKRQIVFt2Xo+yPrkIgkiFi6vE/rMHA5zcwYrdYctalPUTlVEjqfwwm/92eUU
	 GXHOzvskym8L/h/RZ0jley9+iPOBb5NiHCCyWjgxN/NYKBWo0jXUuezYAW8pjuNpWZYbN
	 Y3ZyXDrVHxDypFNuVlskpQUM4KRmKpl8EP769OUkKQvCPolE23g89517xPv1qM0I4LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=lalinsky.com;
	spf=pass smtp.mailfrom=lalinsky.com;
	dkim=pass header.d=lalinsky.com header.i=@lalinsky.com header.a=rsa-sha256 header.s=fm1 header.b=QQ9lAwef;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=clEt2v3f;
	arc=none smtp.remote-ip=103.168.172.150
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FB7606A32F
	for <io-uring@vger.kernel.org>; Fri,  6 Nov 2026 12:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87FB7606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lalinsky.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lalinsky.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lalinsky.com header.i=@lalinsky.com header.a=rsa-sha256 header.s=fm1 header.b=QQ9lAwef;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=clEt2v3f
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 6F95BEC0181
	for <io-uring@vger.kernel.org>; Fri,  6 Nov 2026 07:04:34 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Fri, 06 Nov 2026 07:04:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lalinsky.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793966673;
	 x=1794053073; bh=mQPghIdCwc0e98l2yQke423qVKfB2niFRxcXLsZIMCo=; b=
	QQ9lAwefsWJa2TZa5LNG9Dez22OxRiTOihFS2faBAqr4yVdm44gmzWetEhkw3eUF
	z2ZT+kFYV7SK9VcdKfyNjGzI9jLMb8PURG/9e75wOvlTCrTnvTOcCvq7rh5eMG6H
	HfSvwLDJVcy16ORgvSFyM8Bc8c0Ur4bzLrfH17FIT0zBGceevGUFr1F6fkbB6BY/
	6Mx8CwdLGGgWfrdn1HQrv/gAiDQZRDRc87r3baqWTjdvG5xwf+nLtjkrbgIqcU4v
	/CFxOnL0awr3zUtlTuu/zXX3L0sC6TOvehIlZIEMOJSlQwESaSKbPx0OvQEzM6Oj
	uWGn7dG2bzUMvsVmP2+dzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793966673; x=
	1794053073; bh=mQPghIdCwc0e98l2yQke423qVKfB2niFRxcXLsZIMCo=; b=c
	lEt2v3f2pXb8xFLk+fvZ7GnvL4+NTuUMxKlfhGJNp6p2n64FrZE25DP/u4A13HrY
	RKG/mEF9Z7XpRAFE3Tt8gUKBbyFOSeiVd9NmeIk3XQ5He0Cd6eOSRCuAquM9beHS
	/cBlSBsoWX46j/qAp7wP4TCghJcLj9O3e9nXLAulEpIF95kQEpE0TifB2EjPxgdn
	xUHQ7TqK2EHfKJQbWMhxyIRBvJ6gM6jMnHTvet3NIydcgFC95klDjM38PEfkmBVe
	2RT0Gubvpz+gf55zVrPc2gejVT6OUeQs1WnIPypm6HPlBqD8La2t4F7Nh0deLUtB
	JZ4gfyIhPRNcOShOZKQwg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=lalinsky.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793966673; d=lalinsky.com;
	mf=PGx1a2FzQGxhbGluc2t5LmNvbT4=;
	rt=PGlvLXVyaW5nQHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:ldWBtBmoxkuY6Yq3MluIgRDVjQsX2y8rGrMr76tmWNxEdmZ
	k7Wu+Y9GeRJE3ab9tngBFKGAb/VaJQiZbSWyZ9DFh/hTEE3x9OnWa3an7U8deZhT
	YYX/PmLN6rb53MDwFjmdP0s8eS/G6JG6/DrNjZNusBwyu+wXqOTxbOEjZQEesZvx
	p8BmGhXSh8WQUTOxpeFRhEGQvCla+oVciHriu3rx0Y/oWT7wX7+Phd4013ePQh8S
	74lrRQCCf5fOpAjwhuzfkDxZKgyKJssri95Y5VDsqpqzGSLxCJGVUTdQxhmk1YdH
	E+ZDA4AGhNiJUpPFA7N4QRYrr5qW0TLKW/pkQrg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:IXYcccXNY5OJPpwBE+rUgxPHAVjooj/HAyV2KKk06tc=:ipSWFawutvcQb4mcvK7apMf1vYlc6AK3sxDdRFVZpYM=;
X-ME-Sender: <xms:T8LtamBrZ3WG4-E3-SPnWxP4FdUrWMjoY0PtXcqXf_ZNcMeeACUlKA>
    <xme:T8LtarXLj_-51pPCnEdwNT2VArHv33O8n-SKuHt2kmUn89Rr2WWcpt3OMHyE-aDhK
    rXDPHkD8FT5pnnKFi2o2rGY0g4mRmINqNr0gZNu366u4McFVV035Xfg>
X-ME-Proxy-Cause: dmFkZTGEYWpCSGjGEAv4I/tdYgRv9Ippwo2xEaZcaLEnjppE/CQNocpi6p3YUWBrdApUMW
    +t7OByGauxw/pmKoQAB62M9dUncaUpJtJVhdroCFrduUvn0njACrB1Lil9Z9fsl7agKXHC
    nt352o6XEmq+Mk5PgU8RCkgtZ8KVirLtX5fMdNIDx4Xo42Z76qTdcUxk8gZ5gn9ccFGhUR
    mvF0jz3mA6JIAtT5QMbdxFOyn1xFvtlJovXx6Ayky0ct8662U4VgtAQ63tT/L2AadHObMh
    05I6vhCT+sOyiwQkJt+OBzPUIkEordgoK6a9DU5N3lWrFKgEvMFkwKJWb9sFfKq4MNJsKw
    G2psegFak6ESQS7tOseOa7BWaXjR6Sn8QrVFJQKBJIwuTPCP1m2AROAytEN1NCjXAB7tJe
    mHlMMdejn2AxnSSxLHmynlG3OB4t5nqXEr53cv1j64/YQht8f2+azIfBMY3eOdFpXXwH+I
    mlE7D7GQO9wxBxTlHeWLlLB/tvgvazFBHsZ08h0sWTqL/KaucaLyLPanCmLu7uMbVGLn1B
    Db9tdDpCecdjVQuyeIv4s+Tqq4768+RO14bxQxiN9ltanSSKLp72BOnOe7S1kPI+9CoouG
    maVMPRx7EzdOLoClXbXhPEYVQDOvoP9kMAziYiwHLj2C/wUXT0Uv7FtVTPaQ
X-ME-Proxy: <xmx:UMLtaotq40BWFGUZWUIwBlmAISHqoTomG69FP4-8ClBzZetRLscKdA>
    <xmx:UMLtajaIi9zcN02aHux79BzVeGMjw7AgirlAtQMdZuQHtVfJA51KXQ>
    <xmx:UMLtarUAWJM0M0agO2TnHToy9crGOXqLRaXZ8RoKAJoJlsOi6R-C0Q>
    <xmx:UMLtan7Wjgd8Y5750Aa-h_Ca4-zgfubRNcdVT1H-v7sMRBBm1LT7kw>
    <xmx:UcLtaicWQ2kUL2wczhWGTyiKYN9Uqk_qyyNQMKXCe33RDgmfavQGxMCA>
Feedback-ID: ib6f146ff:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id F239EF80096; Fri,  6 Nov 2026 07:04:30 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AtQvM2r7VJWF
Date: Fri, 06 Nov 2026 13:04:10 +0100
From: =?UTF-8?Q?Luk=C3=A1=C5=A1_Lalinsk=C3=BD?= <lukas@lalinsky.com>
To: "Jens Axboe" <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org
Message-Id: <7526dc5c-fbc1-4b26-96a1-f416d5bb4106@app.fastmail.com>
In-Reply-To: <3face247-a7b6-4f87-9863-5ad40cc272a0@kernel.dk>
References: <a5589b66-9a20-4b1c-a0f1-1b5b31af3667@app.fastmail.com>
 <b06ee030-51b0-433b-9988-148615e35ad1@kernel.dk>
 <6fdd17d9-0ab9-45ac-b45f-fccf085372a8@app.fastmail.com>
 <5475728c-6cd9-4d61-bcee-5c8a42f1951d@app.fastmail.com>
 <3face247-a7b6-4f87-9863-5ad40cc272a0@kernel.dk>
Subject: Re: io_uring: SENDMSG/WRITEV return -EAGAIN on O_NONBLOCK socket after peer
 half-close
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Nov 3, 2026, at 5:00 PM, Jens Axboe wrote:
> Can you try with this on top?

Hi Jens,

I tested the three patches together on current master. Everything I
know of is fixed:

- After the peer's half-close, a waiting SEND, SENDMSG or WRITEV keeps
  waiting and completes normally once the peer reads, with or without
  O_NONBLOCK.
- The same now holds when the peer has sent urgent data that the
  application doesn't read.
- A RECVMSG that is woken repeatedly without data no longer completes
  with -EAGAIN.
- The cancel now finds the send, both after a half-close and with
  unread urgent data, and the send completes with -ECANCELED.

Our runtime's test suite also passes on the patched kernel.

Thanks!

Lukas
