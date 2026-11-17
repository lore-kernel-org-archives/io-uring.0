Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.153.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917209;
	b=kWnkiAhoAIwXJb0qWaaRG+uueGp6MceqZKDR1xlWh+dyPzB6G1wJukJWvT6jcH9Caao9
	 VJDyiyRUAWeul+sxK12NxDfV54Oa3cjXaM7zvbuHWKZOjs1M2WnimtsW4QFkVWbwDzIOU
	 vtV7+Z1vfHST0buoy14UGZSk3liGG6yGjWBV9BtHTJAt24dVPatDGgdrEEpBfoJ22MYzW
	 p60HPPqz0zaQnJANK525kAquTPk4JfWpnTWCp3qegNvyUaNeRvjzX+zp3xuOgfMb/F3mJ
	 25C+gbBW23nvUmMRkYnt1iE0+0XigYN8+ysGSEBM8jkwwo3op58vVo1jvipEot+aCWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917209;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:From:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version;
	bh=Bne9TlcWx9lJkegSeA2PEiF33AOi34cRImm9wek+4bg=;
	b=brZZsi6thzy7/eiF+zmlvvJ0YB/Nzxp2dfxmDaPUnDNXcvgQqbYBx1rWYX5bPabnkrU3
	 35YDljpTvhxbEWurrKOuzfsM9bRnhZDhGeRRtFY7WZL6xt0mlOdU+3hUic7hJCcj0Rm45
	 /012v7VkxeOiNUNLez1XFYx01p14LSCiTjsO19TFBWK8TDZp9PPjSNq7id2F+sz3H4N9V
	 yGUqSbbnRqd8O5zFSqj719lYMdABO1BzckfFubkYSV6eQcjl88WxKEDks4/w2nUD+Ee8P
	 eH/d7Frftyc27kcza5e/bxGw3NMPiZ0Xd4ekvUeJxoJFo3beOHiPiyacFCddv8V0vIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=PoQwf41z;
	arc=none smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3D1606A32A
	for <io-uring@vger.kernel.org>; Tue, 17 Nov 2026 12:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E3D1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=PoQwf41z
Received: from pps.filterd (m0528005.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC0F824065180
	for <io-uring@vger.kernel.org>; Tue, 17 Nov 2026 04:06:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=Bne9TlcWx9lJkegSeA2PEiF33AOi34cRImm9w
	ek+4bg=; b=PoQwf41zrUq3frjRBEqRzaFXs/5Hi65V7Osk1p5yuhkak0G7lYEd0
	Zg83nC65gjlukrrI42+RgoM0v+WsEXhEnkukInT7+D8ju31cjjhJPEAGr9DVYbA+
	UCFpIui7NNbOAgwaOtuZGPo8j4+sBw5RymyqkqJlYBBFIKm8CiwVM+UNfdMsE+x0
	bijjtr0hNgsuMoMVMaW18HNYtdU9Q1dgtsfqp/g65JrpSfapwCKXIYfu/zJ5lWLE
	xQALLon9EKBCsNe92IKdElwd1uF0B/OdIsZBeJQVX0XhQvKX/PwuwRyCAGzVH14X
	hdQ3ZAETQuNTUNGE3c4wb3KarsWlFq7Iw==
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hya3pdpnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <io-uring@vger.kernel.org>; Tue, 17 Nov 2026 04:06:46 -0800 (PST)
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-49a4e506dddso444461f8f.1
        for <io-uring@vger.kernel.org>; Tue, 17 Nov 2026 04:06:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917206; x=1795522006;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rbyiXdx+10NL01ReJBrbufipXpKDZVNSkw5joPNn8Ok=;
        b=vqI6iN+yUNwRr0x7pqmXd6WF2SP0poDXcigDjnda1l0oi5+ROrOZvP/ED5wO4igEnY
         gyFNJ9BErFquGbCs8LU0Ty8zGvhqOVnTpzJ2+fmIHfjJWoPB1WGlE43hHg7dpedGIccX
         yXVcSQOqbX0iCcsm0Y0qd7rg7Tky78IYhqdi8CkCYNFESvk+rJyvayOxn0H8C/XXZG8g
         kLfRZQcrMGHnmtJC8exu4VjtPsy1vv+KG93jKBgEBFA+VRuW9vYWDSCXRXdfqLa1T3cG
         +4nfoGgfOVPN9LH/5ZpuzX6qQ9q86XeC+JKQSF6BYXL4lcP89ZLRK17Y3a+JOk2RDftZ
         WS5Q==
X-Gm-Message-State: APuU4Z+38cGSkKEdaf5uvcbvaZmn92Xea5+u5BxqHRX1jeGT+A/kpZMk
	Bms+3xyLcAzlEkkgqh18i5NYabsyUBJI/eEmMzGBt5DeGOmM+6F/wxp9GlK2WPTqMqA79dgjvNZ
	va4dTRyIgTOBxEcnF69R4R7iUk2dxYpXYgZH6Qq4dkfuOO4nSH8n84BuTpgSXEbz9nMg=
X-Gm-Gg: AYBFou1xDAoICV1AJV8pXwXRUM8MV7LJV1GYL7VPMNBFrjwLghDhpzy3jayHjoYLHYx
	vqbp4Oj3gF7WRC/4vB06nLQbML0fVrSd4YHzdW/1JhOvxMllYq+rqWd93j7kBxxuwmvq1KKN327
	xwc9z3PlwLalNCkx4nqQZ2/68BScDpEvbJprU66kzCoGWj7gTQ53/ccFThCH3CO5KbB7p8OY8ip
	oJ02QfzHelmVe61t9SJPR+tcl9F9Penw8lxSuX7Zb+QsU2sa3hpLuC+lHiA1L5ujfa1LUrOzPgN
	j15zd5r0h7JdofiqUGdHX1Bg4sIof38wWGibJ+o6o5w/akQp7tU6WtM1zIqZEUCXXxKcLeBkUSK
	TE40EAJjQUWKFhA6iVipabYDdX51J6DqFF95czd7xRU5MZA+grpjvk8mxEhx9fJi7LRptPQ/Ka5
	oKIrcgvu8CQAOv
X-Received: by 2002:a05:600c:8909:b0:4bb:7ad9:301f with SMTP id 5b1f17b1804b1-4bb7ad95f8cmr16122795e9.2.1794917205759;
        Tue, 17 Nov 2026 04:06:45 -0800 (PST)
X-Received: by 2002:a05:600c:8909:b0:4bb:7ad9:301f with SMTP id 5b1f17b1804b1-4bb7ad95f8cmr16122395e9.2.1794917205299;
        Tue, 17 Nov 2026 04:06:45 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:3f7b:7276:a343:d339? ([2a01:e0a:e17:9700:3f7b:7276:a343:d339])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783862d6sm56905345e9.2.2026.11.17.04.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:06:44 -0800 (PST)
Message-ID: <e29f42de-64df-4c38-888c-64d7c89a81da@meta.com>
Date: Tue, 17 Nov 2026 13:06:42 +0100
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
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@meta.com>
Subject: Re: [PATCH 2/2] io_uring/net: Add bundle support for multishot
 recvmsg
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261116111744.702159-1-cleger@meta.com>
 <20261116111744.702159-3-cleger@meta.com>
 <19c6db06-d63a-4dc8-9b0d-11fba039b714@kernel.dk>
Content-Language: en-US
In-Reply-To: <19c6db06-d63a-4dc8-9b0d-11fba039b714@kernel.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0NyBTYWx0ZWRfX/EhgI1sqDu4S
 mMRKJheJ1foGErKso3tjpNLN0svDEtjcV/gCd26Vj0ZSYIwtDqPmOKiPIrNXcB30tQVbf43ejX8
 Yvy5yGWwMyZDmE58rZCHiEAxwU/CkRg=
X-Authority-Analysis: v=2.4 cv=YK8KWhGx c=1 sm=1 tr=0 ts=6afc4356 cx=c_pps
 a=CsXZvLRfiTx/ye2xXAwb9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7x6HtfJdh03M6CCDgxCd:22 a=jCddH8ec0KUNCymVuxII:22 a=6KMpyRCIwqAuzVE73isA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=F7q00xkr9EfWfQvbdVXI:22
X-Proofpoint-GUID: 0d_YwRxKsVLf1tuZkawJ-71t1PlCaToQ
X-Proofpoint-ORIG-GUID: 0d_YwRxKsVLf1tuZkawJ-71t1PlCaToQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0NyBTYWx0ZWRfX5APyh8E7NbYm
 KSbek7fEwXn+SGABgr9MqhtXr+J/+w4I0mlwt71uXIMSr1j1aON71TkDnP/XcDjT8Ah8IWghXzV
 0ySrnXnIlFU7urIHFaYAGXIqXfsLR5bFT3HSal5ED7yPz48qpG5Iw8Trfkm6RCP5DL76grJ9ztc
 K9Y48yrDHlGjYbMOMSuZ+TMEonMh/f+AzVCNiaPV6R7B/YhSswpAP2qPvP9bSxLlxzRKWz9RZaZ
 rND74hv6EZ8ZsrQRtCvrbfzK11eiOgTqv4kx7/9XFwjpll9Qful/gsXpGhuQWF76bfGnObU7+VK
 auPjIw0dQQjr72ip1jPMP17Lc0mtxl9aRCUq//1kETnCuuYyNmA/6ZTWF5CGzPNlTWShiR+lSdN
 HsGIHRXlnEZHHBoxCx4iRWUYCLar7tYr8OsrH3l8yrR/RQ010LnL0PMeaIvw7eOP+pF56wb3xTV
 LiEv5YFWsJCIIaL8fog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01

On 11/17/26 03:45, Jens Axboe wrote:
> >=20
> On 11/16/26 4:17 AM, Cl=C3=A9ment L=C3=A9ger wrote:
>> IORING_RECVSEND_BUNDLE was disabled for IORING_OP_RECVMSG because the
>> envelope and control-message sizing was not implemented. Enable
>> bundled multishot recvmsg by reserving its metadata in the first buffer
>> and accounting for payload spread across the selected buffer run.
>=20
> Patch 1 is fine (though both need rebasing against for-7.5/io_uring),
> but a few notes on this one:
>=20

Hi Jens,

Thanks for the review.

> 1) This changes behavior for UDP, which has no inq as per a comment
>     in here as well, now it asks for MAX_RW_LEN.

Agreed, technically, it doesn't change the existing behavior for plain=20
recv but differ for the new recvmsg + bundles support. I'll try to match=20
what's done for plain recv with max_len =3D=3D 0 and use mshot_len with bun=
dles.

> 2) Why not support incremental buffer rings?

I deliberately left it since it required more wiring/modifications. I=20
can add it in the next version though.

>=20
> And the usual, do you have a liburing test and man page updates as
> well?

Yes indeed, I have liburing tests, just didn't to send them right away.=20
I'm missing the man page update though. I'll add it for V2

>=20
> A minor note is that the commenting is a bit excessive... I'd prune
> that for v2.

I'd usually remove them but they mostly seemed useful to me. I'll prune=20
that.

Thanks,

Cl=C3=A9ment


