Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.153.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921625;
	b=Pg5yd0Q6GXyuo3aHcDMKb35smHcP2elCKEsETVDijB09f6+1VZ2ix5CSBhsQ1ghfxDo/
	 PGfr0nlrIlMQ++8oenhyqTY9lAuQNz7V27lUqVv28i5pJ3BIgQ2iSjAIT5JwVn1i6+BmR
	 trL9UUiI8kWoMe89jN71JfUK0r/9nRp4mW5ImcZ/V8uNlkoRqHcDdbxhj8EtCmwgw2xa8
	 bAta9tqjNwhec6Ottun/Fx9UbtkI0S43LRH5M08Nh2QiXrP1gcjzS7LuADFa9LzCwEPEV
	 X1KIgfeGjU7PF0umsJvI14JI/7/eMbouNqZMu0fYtNoDf02txSgO50nq2CJ1WtVwOfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921625;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version;
	bh=hkiPQtDWTQmK+yT2ZeAiQij6vJvAYkyT+gJVfoUg3U4=;
	b=Jsaz9aTNySweet1ojomX1LsbSgDkR+GDBreWbLVcsmW37Qi1A3iZmDQUzzvGA7qLH4JA
	 WWNsXC38rD+GOwasDv8OON/19uVsif+ig/vE0RBYpvBufVNMJCUyv0z1qGXg7JJSRFxei
	 nR3dcEpfRO5HoGl2cvDJBUeKYkBjOYQxgR9ViF021kFeCf+xC+HS/Np6MbN9eJ0ImdCf+
	 ATEbOXJQO4N91g2M65zCPaQ9zvqcm+zNEU0Y4YSu/Tpb+VgzKNy8wdIhUV9V5QmqC+wym
	 zpl/8jpYAlozym466EXN6zzhUl8XWYX4sSMbHjFrhZIpiLbUrdqXhY72eTHo2cFrE/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b="PlibT/J6";
	arc=none smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DBC606A323
	for <io-uring@vger.kernel.org>; Tue, 17 Nov 2026 13:20:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4DBC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=PlibT/J6
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHBwhKK612597
	for <io-uring@vger.kernel.org>; Tue, 17 Nov 2026 05:20:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=hkiPQtDWTQmK+yT2ZeAiQij6vJvAYkyT+gJVf
	oUg3U4=; b=PlibT/J6z9erNdkYqb2ipa7vzXJDVya6m4J1GwdOg4XMEn93kHKli
	1nV/H83RAkTZXLeAcUPuNNCSxywNUbV827soM8NjfQEEWNhYfn/ewDbCxDPiGRaQ
	9XHBPxMwt/OJxdPgKv7CdUut7QArbgC9K9Y3nxNWH153G3udI2Z01sXlMd7mzRJI
	zbelm62apCzyooAE/tUerntU1bf2xbtvuxxiROAVm1SeQuGDZ91AJRXE5w/vm4lK
	Pkq4WD1DFaQot1SXiESq/tjsD93QGgD0WMZOkpOszNV9pLjYh4iE8n3qXHgOg9dM
	xhkNcon/d5h/7oYqowWzWOlkJgbod/0jw==
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j0mn0s0fu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <io-uring@vger.kernel.org>; Tue, 17 Nov 2026 05:20:23 -0800 (PST)
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4a4beb15836so15269f8f.3
        for <io-uring@vger.kernel.org>; Tue, 17 Nov 2026 05:20:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794921622; x=1795526422;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=drwtClem/ixRXVUJ+7hLDfDXifarjXGS/2diC05y1Es=;
        b=2jqskV1UPgoyZnb3Ck4Dj1EpwYL/MsW/chdJei1fXzBC+fOVHc7OM6HsAtcfrF0LXN
         9k3+ZLP4DbG8HBgz0TMa5eG0bg3Bvvl/HAUyGFt5S7FIT3DmR2G6FUsP75i5ohPg47AJ
         ZiDiENXZ9bfRo7I14TSJV+duYUNKheuHTvrZCnVjK2BNEirSfs38Ac0FyhBF4K8n6/kq
         NDwe7BCQaSmmJH/ZXmgtDLVqQ2xCffglQ2RUeOZ57uBcx7MPbk6PJSMY9n1sEHa7sIvU
         PopkFtckoFHIeTgEFMTlrVvdwOW1bptWP8faOmLjApysj1dkn+VgiGIDComxgtyL5D3p
         HI0Q==
X-Gm-Message-State: APuU4Z/w5NzIxs/PtVQMFoBplE0AkvKRPR+x2so+TFTcfx+paF35NBkA
	US6FAl8UUS8wqAQUVSX0gETnsadIke8gH7FUyf7wMkfN64dmMVFDqE6Jn+LPCVAKjiThwWpR9C4
	/kBKoroILy0mkF/8ZkIQUu276ewn1mw//ra8XYFqClsDk4G4qmNHkCX2Bw5M=
X-Gm-Gg: AZFdTZeJhalF3gjnIiuMuFYX7/fk6L2f7HUU3UL1FSUEGU3jTxhv3+uTTH1i/g/qlRd
	64CduAE5RJGStcqGbvFKptIHCc0qbOwXEh8EIvTBmunTwsD1bru5PLNkcNBIoVCv98Kx0eo0pmc
	7JvNMdbhdvLcQwr84R/6CIDKczyFUCcRFSVwjOADjrWc6cMbtOCKZlqhTXMcShmMghW7SczP4FO
	lJJNhjmDL1KckJ1fDPfi6RHu5KCqcuUqiaR9T459TgRPo4Hnfyns4kHc0INYoJPqifALsrXM8/w
	jT6MtWklEuh25IH1tdZw1JmZeUzjGLua/CkOpWkwP3BtMFA8Y1x4WKOuT4QVxmwV+Yt7p74d/7C
	vFUKWka7Mebg7ghiUtC/c1kYRZOg0VPCwrrd2bt6DfcPzDDEkup3j71ymOafB83rJWglkNRdikI
	QSTut5bjQnkMYL
X-Received: by 2002:a05:6000:2212:b0:48c:698b:502c with SMTP id ffacd0b85a97d-49c6d54973amr31394263f8f.1.1794921622049;
        Tue, 17 Nov 2026 05:20:22 -0800 (PST)
X-Received: by 2002:a05:6000:2212:b0:48c:698b:502c with SMTP id ffacd0b85a97d-49c6d54973amr31394217f8f.1.1794921621576;
        Tue, 17 Nov 2026 05:20:21 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:3f7b:7276:a343:d339? ([2a01:e0a:e17:9700:3f7b:7276:a343:d339])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c77393700sm28032388f8f.18.2026.11.17.05.20.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 05:20:20 -0800 (PST)
Message-ID: <adcaa022-50c5-4754-93a6-a4365ccd09c4@meta.com>
Date: Tue, 17 Nov 2026 14:20:17 +0100
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
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261116111744.702159-1-cleger@meta.com>
 <20261116111744.702159-3-cleger@meta.com>
 <19c6db06-d63a-4dc8-9b0d-11fba039b714@kernel.dk>
 <e29f42de-64df-4c38-888c-64d7c89a81da@meta.com>
 <9e96afba-66cf-4812-b14c-faa2958caa06@kernel.dk>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@meta.com>
In-Reply-To: <9e96afba-66cf-4812-b14c-faa2958caa06@kernel.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MiBTYWx0ZWRfX6tGpJuB8vXCi
 Hvfofj3mCBafqZNYozN7it15tH4Q4mrNblRFQ4V5eDwGc9RfAA8PMTclqbGSzh3xqiYU4atJweQ
 5FvR44RBPQqB3GF64vg5QYPxW3qdLvY/zE5PbvRReTPe4ZXQjaF/8LZ3jMGTpyAi2BvRfXOb2lD
 FL1//Ynd+4HThsAFq9it5KHS6g3qBc99Tj5PVx6wNtya9PkteKdmawwlytg9i1Se+LfD/ZxCXSA
 8q/3KM64NzfWhZGf/QtsL3CiS9E/WVQG2/tpGJPIuNtGF9LLkbvdlbkwicL/YoC8BAkKH/ejX4l
 pCSWgn1bLOdC7U8XgtMPX5ZSJy0Gbw8tzETt0hqBkbRvT4YNOZggeRnObfFyTuZfYYQnnGk6Hlj
 LRWWLBPUxdJnKcn6f3FFY075ibpTqI3nkdIwbQdE8jdlX4lXGlfJ24QXtRJ7+WTMuu7t2Jhzlr3
 ERWp1Ifylcl2rNLoxDg==
X-Proofpoint-ORIG-GUID: nsv1sRVZYxPkJ_i6VJq8NoDcbjF_SNR2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MiBTYWx0ZWRfX96EJj9apstiT
 y3E0UZHxdBoHGGv4qIzhXYXQysGFiK2daoF/PYMMYSzJ7isDqpmws6m2tsirFGpY2iYYl2nYph0
 tdYHwcN5Phdao9WaRB/POfiVj58ZQSY=
X-Authority-Analysis: v=2.4 cv=HcmB3SE8 c=1 sm=1 tr=0 ts=6afc5497 cx=c_pps
 a=CsXZvLRfiTx/ye2xXAwb9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7x6HtfJdh03M6CCDgxCd:22 a=xtH7KyWI9dI7BmFOsl-x:22 a=71RdJvaTft_VJkO67YsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=F7q00xkr9EfWfQvbdVXI:22
X-Proofpoint-GUID: nsv1sRVZYxPkJ_i6VJq8NoDcbjF_SNR2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01

On 11/17/26 13:26, Jens Axboe wrote:
> >=20
> On 11/17/26 5:06 AM, Cl?ment L?ger wrote:
>> On 11/17/26 03:45, Jens Axboe wrote:
>>>> On 11/16/26 4:17 AM, Cl?ment L?ger wrote:
>>>> IORING_RECVSEND_BUNDLE was disabled for IORING_OP_RECVMSG because the
>>>> envelope and control-message sizing was not implemented. Enable
>>>> bundled multishot recvmsg by reserving its metadata in the first buffer
>>>> and accounting for payload spread across the selected buffer run.
>>>
>>> Patch 1 is fine (though both need rebasing against for-7.5/io_uring),
>>> but a few notes on this one:
>>>
>>
>>> 2) Why not support incremental buffer rings?
>>
>> I deliberately left it since it required more wiring/modifications. I
>> can add it in the next version though.
>=20
> I think it's much better if it's complete. As a user, there's nothing
> more annoying than having random features only work with a subset of
> others. It's confusing!

Yeah, make sense, it is not actually that much work !

>=20
>>> And the usual, do you have a liburing test and man page updates as
>>> well?
>>
>> Yes indeed, I have liburing tests, just didn't to send them right
>> away. I'm missing the man page update though. I'll add it for V2
>=20
> Great!
>=20
>>> A minor note is that the commenting is a bit excessive... I'd prune
>>> that for v2.
>>
>> I'd usually remove them but they mostly seemed useful to me. I'll
>> prune that.
>=20
> They seem a bit LLM excessive to me. Just something to keep an eye on. I
> like them to be shorter and concise, leave the bigger explanations for
> the commit messages, if required.

Acked, thanks for the advice !

Cl=C3=A9ment

