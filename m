Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793306565;
	b=VIgq9sv/X9sow8VoaOLmKUltOrDNcI0jCYG8UjHkKtfyMQNh4p6m259PpcFSBm5hQDal
	 m9uCwntV1THiYTA5COHS9iA59s9kAKT02TD84RUNkuH4DDppALTDD4RtKxGQ1HSXWbg3E
	 BVbctTlQEDTPC4jMcRR4wMPV4RJ145d2AToFu1Wckag6DMDnWXbw+2hXea8EfVBoUTw+h
	 rQcJVRo3e67WXUP77X7F4J1Oo10TGerCqpwh9NVZo28SqJEIVFVA3PWLRTVrx/pm3Y5v9
	 J12BV22HPUq0m3tCgdYoagvGOcjeFOgY4LC8aJi2hw5vMOn095d+joz5qwq/XPqGHUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793306565;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=Qy/UeVtF1bl/iPfDS7uaIZHWE3Qwqhm9BADNg6EFpc4=;
	b=bd/2789zKxWrZdHOl6aRyRdUuTd/jjHNPZuDs0ZcLQxnN9S/VNArHUUbU+WCWMdy4if/
	 1iI6nuIiJ6JlIR6BB7lMMUbTj8dspek/lbNzhcdZxotHPkkNnCEG4V99w1GEh8Qemp6Md
	 WG6MSiMUWB7pyyql15+2p2vx/H5Lfvbic3Z1HsauptkN9YoRdCDuSZbnlzCbII68ZA/wv
	 5YYuarm+0uAReb70pDahfjgU9vLTs+DQbENQQfTiBtXrlQf8jcgLqG5EawmvWonHjF4eO
	 hs+CPoEQyB/zO1x1/GiyfSuy6dX2cKIkZj0hRW32Ef5U0Rnx3urrmkErVT0F/45NGYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=lalinsky.com;
	spf=pass smtp.mailfrom=lalinsky.com;
	dkim=pass header.d=lalinsky.com header.i=@lalinsky.com header.a=rsa-sha256 header.s=fm3 header.b=HXsDHhar;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=yuJpX0FQ;
	arc=none smtp.remote-ip=202.12.124.152
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD74B606A31A
	for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 20:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD74B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lalinsky.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lalinsky.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lalinsky.com header.i=@lalinsky.com header.a=rsa-sha256 header.s=fm3 header.b=HXsDHhar;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=yuJpX0FQ
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C654D7A012B
	for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 16:42:43 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Thu, 29 Oct 2026 16:42:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lalinsky.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1793306562;
	 x=1793392962; bh=Qy/UeVtF1bl/iPfDS7uaIZHWE3Qwqhm9BADNg6EFpc4=; b=
	HXsDHharPQtNg03TG0cQksL1nQxIQgL/vnL+65Z0NFjicUbQSIrYMjQuEE+zWRbj
	LRxRS0aZgVnQdujYXr/27U6AYs/LY6703iEKJo6m0L7CoozPpkZDwN4XS6cmaw+H
	2B8FYozoDjDot2aBHnQEsR3jkppg303pDCoK3R0SnD+wr/uVVzNZ+GaDT7BeBt+b
	UN6cPaaVVR5iFiQD/G1pevmiuymBNfndszlQmvfHGms3quBVjd/LmbH6WJoO3r9n
	rMhQCLCcqYhU306hv+zQxQGdoY/YTZcQ4nu72ad39xK0XkahtD+bQvvui1Ft0WzF
	7HTqqVupB8CRurJhXZYZWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793306562; x=
	1793392962; bh=Qy/UeVtF1bl/iPfDS7uaIZHWE3Qwqhm9BADNg6EFpc4=; b=y
	uJpX0FQpi92HUvXVgig1hiQMaPD17pdy0bsuX1LI8MdQZpqv96WUocu66z50WdX6
	keZvUUF1rDNW1HAFW1Tyq4UbcwtoreIol/oYLoSR8Z3pTLwlyL2a8lSSYPI9zRz5
	j9LxzKBnECrl//1VlqRiUFWF8Gao4VTDzHcAQRHgCyzHCMCmpWddZLQH92JbN7rX
	gdxCS24S5CSdj7CpVgPLzOJYGuU7jnxCBrbPzXI+AV9gKCyv25xvzH4TzUmEqBFE
	CB9RwY5SD5BpjfpdRwsGbY7vdKpPJXWss9KbTs2m+Xwyx5QRFAujAPL0etvcBgNZ
	D7NWskNYW4Eb2tzI2jFMQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=lalinsky.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793306562; d=lalinsky.com;
	mf=PGx1a2FzQGxhbGluc2t5LmNvbT4=;
	rt=PGlvLXVyaW5nQHZnZXIua2VybmVsLm9yZz4=;
	s=fm3:rsa-sha256:OJG176LspkbxXIlRsqHz+aBZ2QzKo9AaDxvllAXQDQUoQSR
	amIqhHp8Q0Fsr4ZX6+t7ffvEukXFC4XM6btOgXbD8vepvQylVgClt+jtfksBn6uz
	+mf6fPndjhEngGH69yzZsv3koc/Tq7YOaE7G4j6uef2G0aDI3720ytCYtCX9VgIt
	kAH4PyXjkxPzenzyqnbdk06xjcCqcMZ+dhslGvBqWVAc11AM54xAU5d30C0dnxfr
	EYHg0frge2h5I4Jhk3eGg4L4uR2JcSkVH0HGixziEuiDneZFRmJuIOrh485PBu+Y
	MuREmnTN7nxHB9lU0izpy8t19+UPVNL0AUcJTMA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:3gIKGqDTSMKhaXAdcHoATfwxc03ezkLdBVWDDTR5VxM=:Qy/UeVtF1bl/iPfDS7uaIZHWE3Qwqhm9BADNg6EFpc4=;
X-ME-Sender: <xms:v6_jaqzcZwH3tKpwvONIcorTYuqH4CAPAo4gf2YP___vpsTQ-ODwIg>
    <xme:v6_jahFRmlsHA-45g236e48FfViVG00LEm2N0nh2VyzJrADWpcZx3jPQ4Jx31E53V
    IBOP1eSRoP07A0ysVdXce-HXgX8loxdyu8kc6B2gLfa2slYSix-Xg>
X-ME-Proxy-Cause: dmFkZTGhlP+LOHSzfDgdmEODTXtQIC8WruoAIyVd9SYmycjisilBIS01APGfNlVbVUxDFr
    YipCS4+jQu3beAJkx2NbLqsMZILy7x8htjBSZRWikxbnMnoH94fT/DsmmZhdjlX3cA8UjQ
    7XfDFKfHsTYOBKKVGFZ9h2JLqfM9/aE1mg7E69PoBz9oWiUhDmCrwekA54k82RI43wqy77
    i25aASkFOY8TqikjCeQ6bmLjVRmUXRG2ajA7Aho/AIpjzf8onw8xMmZ7FaGrEkr2MWVg5x
    JSrwbVkl17zwx9reV2jkEDuxc5tdjXwBAX+XPf3wxr3XK3CQEfJbcvTTl4Xsvhguyc1YMy
    NBCgXxOUYSZbYcp4+dUuKCkBWVu2QavP1VhU+LmSK13MT0QQge7mvspZkjsAn32wwMduwm
    toKpIGCZtXlWZv8hUy+QSNwnaVX1ydmw7scyW8p5jGPSuJtK9pqQp9CmO620NIADCHJTRt
    xzELTljR5da0ru50WFFKDfoiKUFGE7qj7Mk1p94fF4fi4yYp5ItXlaxe3uXzqyVpKaR8mp
    nZVmQq+tsJiWfkFAn23B2bfVSrPfrpy/suwy1BlBzx/LveoQ2IN6X25hBAAkYV3Rb4uUKB
    LUZTQ9ek7Pz5WxRXcmXQH8chIBQRYTRT8oaNLGM2mDc7sbH0VSsQCJUpZytg
X-ME-Proxy: <xmx:wK_jatfGUqTSSmwnN1w5GS4PFRQfsci6xaXZ6nFyEx1OIzpCZABrdQ>
    <xmx:wK_japIc8j3887thH6orKe0VC0rMl046P_29y5CcpdVvf_r3xN-mhQ>
    <xmx:wK_jauHTH8KO5O8hfghlWNEKDsVWzYN-FLABE-tHNV9oLgTzWEzD3w>
    <xmx:wK_jajpI7U4zdx89kSxD43daPjp5x3jRSKj5mLdelNqguT_0Qkaahg>
    <xmx:wq_jauN8eHLZ5iYe33bCWrPpBy_e--wht8TSqnyXf2jD7xi3bcVINiWy>
Feedback-ID: ib6f146ff:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id AB0E9F8008E; Thu, 29 Oct 2026 16:42:39 -0400 (EDT)
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
Date: Thu, 29 Oct 2026 21:42:19 +0100
From: =?UTF-8?Q?Luk=C3=A1=C5=A1_Lalinsk=C3=BD?= <lukas@lalinsky.com>
To: "Jens Axboe" <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org
Message-Id: <6fdd17d9-0ab9-45ac-b45f-fccf085372a8@app.fastmail.com>
In-Reply-To: <b06ee030-51b0-433b-9988-148615e35ad1@kernel.dk>
References: <a5589b66-9a20-4b1c-a0f1-1b5b31af3667@app.fastmail.com>
 <b06ee030-51b0-433b-9988-148615e35ad1@kernel.dk>
Subject: Re: io_uring: SENDMSG/WRITEV return -EAGAIN on O_NONBLOCK socket after peer
 half-close
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Oct 29, 2026, at 8:48 PM, Jens Axboe wrote:
> Can you try with these two patches? I think the problem is two-fold,
> each patch tries to reason about that.

Thanks for the patches! I didn't expect a fix so quickly. I tested them
on current master in a VM, each patch separately and both together.

Patch 1 alone fixes the problem I reported. After the peer's
half-close, SEND, SENDMSG and WRITEV all keep waiting and complete
normally once the peer reads, and the waiting requests no longer end
up in io-wq workers (100 waiting sends, 0 workers, vs 100 workers
before).

There are other ways to hit the same -EAGAIN though. For example, if
the peer sends TCP urgent data (MSG_OOB) that the application doesn't
read, a SENDMSG on an O_NONBLOCK socket that waits for buffer space
completes with -EAGAIN, even with patch 1. A waiting RECVMSG can also
complete with -EAGAIN, when data keeps arriving but is taken by
another reader of the same socket each time. Patch 2 fixes both cases.

There is one more inconsistency even with both patches applied:
in the urgent data case, WRITEV on an O_NONBLOCK socket still completes
with -EAGAIN, while SEND and SENDMSG on the same socket keep waiting.
So whether WRITEV waits or fails depends on whether the peer sent
urgent data, which the application can't really predict. It's not a
problem for me, since I always use SEND/SENDMSG on sockets, but it is
an inconsistent behavior.

Lukas
