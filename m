Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883558;
	b=x2L4ftPdqpFgmVpNIQiHBbd8a9ceLKsBO1khalWLz1gjsFLi07PWALIrdZ2i0ZxN5zAJ
	 WjE2Zfhf1XdukJvR6kryu7bD2Qfs4x/qZ1qNyNTu/vCE6oU/RmuCU7F16Ths6dJTzjtaQ
	 EZZnUP2hd202fd6D6Q+c8wIqk4/cKLUW9Z/yhndxHzhkcpmjDI7sypx0AEfJM1VgK3N4X
	 zs1/jBy7HGdf2RTdEpNugTZMxSoDVidHHG5HaVCqkEKVNF2p+tdcFUkIk02S4aVSBCbHE
	 eUVboAA1b9F73pmbF5NS6I9lSt6RV/gW6vb3Mu8DqI4lzruQlkWBbDDiuavWFpnWxFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=HSeX2aFiqx9nRUhyo25kThMdo5FnVAQ6iA/k79stPrw=;
	b=hQY+PoqITPkldoji3qr8bNObp/E9o0dkAihnwBplh4pZrp5d8bXQIW02kZc6fXBti2XZ
	 JJpoKahPjMbZ4PLyUPXrXALGVxtNPztwcZtnN3MrwzHaUr8wSOZwA0EOgf4Z5u5iIGhs4
	 IOriv1mh8K3xY3oVr/PevODFq+qvh92o2hxJfFtPE/aN4uT7PUNHOKALP9GbYaKusX9x1
	 BdV4rgcCoJqJXCW3rXEhi8O0uDylhnohTygELYglWJUba8LzqdLZ25KxXGNjG5gsSORrw
	 xlfFiCt8HFlkTomNfxjpSTlCqzS+IM8Tj0lBj0XsD6cg7fiqKzr3TmAUmWN+n6+JfIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gQgedVEv;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C9E606A323
	for <io-uring@vger.kernel.org>; Tue, 17 Nov 2026 02:45:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57C9E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gQgedVEv
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so4763599c88.1
        for <io-uring@vger.kernel.org>; Mon, 16 Nov 2026 18:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794883557; x=1795488357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HSeX2aFiqx9nRUhyo25kThMdo5FnVAQ6iA/k79stPrw=;
        b=gQgedVEvP4NsoQGbpXmXpwtNykLoXhSCcwWCoxBy/YaPLLm4rwH/YT79l0YR5aY8tr
         dqkP9QV/xkjsyjLVTyaWmpHp2D3akNOgPrmPJv442hygzBEDHeM8/fRBF3vrC5p877bN
         BTGLY8M2PRakDcDdRD+q2LagYIRAvHn00nshol5r8ln0PbqGw8VwHMo7lcqP9/obsQih
         GctUlXZgbZ/EzlN98ynDubIswra4iVrRx3Eh2y0LHkIP1OTq2K6MlqRiBrgF3ClAECVg
         JiSDWP0Hv7FdYHcQBVQqf2AQ6IJfaRXljyJICnx6Vj8UqIrlyR2sZB0i0QfU0SPlPuNb
         +KBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794883557; x=1795488357;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HSeX2aFiqx9nRUhyo25kThMdo5FnVAQ6iA/k79stPrw=;
        b=1lSNyQfQ5r4hkk3MLih87KBJlmYUpvbvTOl01AZUSoMt5tdCzdox/Fd0RpmZFZ90zN
         nk9EEQdi2s09rfIaxx3oYClpqJ5roVhtD74h/QLZ5g5Tr3bk2squUc/AVOL1rqJXWggI
         R1mNSC74b4UnT5BSyxK+xmkOGqfCNzXUpry2MdIqRo88mDswVY/lrb9lM75KY00lw0DH
         g88HfNnWSmZyUdf2eJsLsZKvX0bhOsIig/lgqvPJBV/3548b74QFbWXh/EGQwV7A3Pni
         Tm8DTF5WmNXgaqlQ96IjGyx11ICKJ6XZ4xz+DurhAxayHk0gNgt1xt8dDrYlqyLmxgQl
         tktA==
X-Gm-Message-State: APuU4Z9C6GCgbfreLTT1G6ACZHeLfQ0hpuW1G3VJ7entXD3oy39v+RXO
	5zexs+owTm+D2ngbWJXZgSvkujUch2vfAPg5cGnmS07fLT8Dmd7cp/9teH6mCBjmp+0=
X-Gm-Gg: AYBFou1hjEfhD+vEbTMEQVWW+LQUiU4kM9T8iGDyrJCtrGLBNF0iCs+F3ggENoBcfw4
	tZhCL2IBJSdy/UBZd4oXQt6CR7TtC622TlBOOE6mFvOe2Sfsa0KRuDdp/IrBc3zndU1y2qASixl
	mlztkiGoD+kSCr4qFHwUpA3RWEilwYv9Eg037HjBfu3bNN5TzNzW03t8jN1cE+mykluM3hqxTNE
	m+4MXSbN8P2Be3sGkWrYOinF632TfWeTHAQ5F4YYVi/aYH3r3RAbWG2n9pis+opUqBhnL7/7P11
	tCznsVOPWGk++0tP3+aSPP3DT3yN3rvT/8QRB7zOLpBsYcNa2Z/Bw9eY8m89XPixI3Va/9wqHrt
	qOAvq9wfVNk3Zd5Cx9b7jKoD5FaXxjmRG+8aJvoLREESrIaTYQ+iA9eCD3dSFrH6tR6EF6XbuoR
	/XOmKQ7763WIchRR7G1v1HJ+xffELBZX823kvmV1uldyNhYChKcpjS8uqOfqO+FxAEtFK4qlREK
	2hYBhmUOTm1oilJtdvFpat+L+MfoUqIvHqNVu7nJLwsuf8CGLQKPdVT1vvmjknBhaMa2dPtDwPz
	uPX6mEOklWH/e2qqWUv3KH8worQ1VG8PeNNoSVfC9YrsrYl3Dpxr7GYLIR9Rgp5sAi+lscFRxiv
	BO+4KDWRQ0fD+
X-Received: by 2002:a05:701b:4194:20b0:1b3:aee5:20c5 with SMTP id a92af1059eb24-1b5030fbe7emr13399292c88.22.1794883557324;
        Mon, 16 Nov 2026 18:45:57 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm41527305c88.8.2026.11.16.18.45.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 18:45:56 -0800 (PST)
Message-ID: <19c6db06-d63a-4dc8-9b0d-11fba039b714@kernel.dk>
Date: Mon, 16 Nov 2026 19:45:56 -0700
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] io_uring/net: Add bundle support for multishot
 recvmsg
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@meta.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261116111744.702159-1-cleger@meta.com>
 <20261116111744.702159-3-cleger@meta.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261116111744.702159-3-cleger@meta.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/16/26 4:17 AM, Clément Léger wrote:
> IORING_RECVSEND_BUNDLE was disabled for IORING_OP_RECVMSG because the
> envelope and control-message sizing was not implemented. Enable
> bundled multishot recvmsg by reserving its metadata in the first buffer
> and accounting for payload spread across the selected buffer run.

Patch 1 is fine (though both need rebasing against for-7.5/io_uring),
but a few notes on this one:

1) This changes behavior for UDP, which has no inq as per a comment
   in here as well, now it asks for MAX_RW_LEN.
2) Why not support incremental buffer rings?

And the usual, do you have a liburing test and man page updates as
well?

A minor note is that the commenting is a bit excessive... I'd prune
that for v2.

-- 
Jens Axboe

