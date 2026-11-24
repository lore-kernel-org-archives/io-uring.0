Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540639;
	b=bs4EuyCpL5f0nPEzp+PJ1bSON1tdjBsaNUS4sIRvRQeMATAlqc7OwZ7O8+mQYlD3krOQ
	 HAD/i8Ni0689Ytb9sZu8nun8yDcVPI4e5l+KCEbMFFgChsrZuUYNdDw4Jzsd1vd0rw4JQ
	 Wx4kXJ1D4x2H69ckNaWE23kLJHiu0Ms4gkD4XYlO1zcZSMeV1vv4Zl8y62m0+rSlva8Ov
	 ojq725BKnuBdxctJF465g5aMpg4XlSxX7XHX1/0G723JJ++7vhrrsEXfIXAeNQrj19lxt
	 9lhTSTbMNDcwyeG0M7g1N7ZiLKopt6eHbqbUdbRwqdyMo+b0EippHgzUDmwdQU/syPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540639;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version;
	bh=2kbZ1daghVq/jTpQQaRq8WPTs1DM1ouWO34muq4qlDs=;
	b=WhThLKQOkGmAQgm0Xf6fk8RUIoReg/nI2GAgKbvlENhOWYeeLHmlL0NO+PR/odSvLeuP
	 asH9au7t+oToL+o3lhSnHKTuT+zIRaacg2UNQJkyW24dpMCeAGJyg3eHQDOVnqxUE/edh
	 B/EfN0nkKR7bph1xyHGsMtInnChLYIQzrgqhp+dff6CONjRw58yiHFupdka6b8B9LIj12
	 cYoJGSPjgzEW2NHgqNsF1C1bAUrUPUIYGZ2/1X1P8aruVlseS5ZyPna7JNAeUqgubIAg/
	 9e4OBocAYvCHgZyMgkmAKri9XDK48E1oWtvWbESSBB5Iu8FmFCqLzUHABv3ZMep44CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=cfV0JxHv;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5D7606A321
	for <io-uring@vger.kernel.org>; Tue, 24 Nov 2026 17:17:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A5D7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=cfV0JxHv
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFPgLk2601601
	for <io-uring@vger.kernel.org>; Tue, 24 Nov 2026 09:17:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=2kbZ1daghVq/jTpQQaRq8WPTs1DM1ouWO34mu
	q4qlDs=; b=cfV0JxHvo82k46xLI8NSqwXbKTnafYvccvob42Rrp5sjIEXdNM79h
	KZnuagIldyQrUun6AfcCKANqmmmRGZOh5dhPvaDBUQMvoaqjVX94SitGlSo1683v
	4KThYEGP7BrkPsXKCFh+BDkAlGolvP27bKv0lJ0MPC0Iz69tD3AXbQ/sli7KiH6o
	0ngGp9anR1fX+J+AB2WyNyzOaHkRGiPbpcxc65jAPaNYEWlc74OGk5rHOmH9Rdl1
	z6zBDxpvwO6th4xoSGKdRxdWT6hSh6Q3KFWfxdPyDxZ4H0JFoG/iAjzK9QvR/soy
	/UwWulrVPf94So43broU5PXtT+N7Mx6/g==
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j5d78s10n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <io-uring@vger.kernel.org>; Tue, 24 Nov 2026 09:17:18 -0800 (PST)
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4bb93bf724eso4612525e9.3
        for <io-uring@vger.kernel.org>; Tue, 24 Nov 2026 09:17:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540636; x=1796145436;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sLybSdI5qjTND8zPaR4Rg194Q2UholF5MWi+zjXHA68=;
        b=pM2UMWJjbLhNT2U2+ZjFaHZJb1Bkfn6+DJJ/rdZP5+eavBHkKaQ92Ke3KE5+md34Ry
         dPbH7auhntPRlIuow7mKDPbEm67iSsYpbMg6RoOLp/Kzr06Ljm7PXx3hJAsOuMLy3Fhs
         7mps5UlVx/2IE+jt/UopOMNY/ni0DUBsm0R28oeATpQau6cWdGAJnWc8kMW4PvgywW3P
         oMokdGxzXEnVV6WbNcStxnOCxUKqROGutQqS/wfsn9dlsnDqbB0+mpCiZ52oKPgaPZVb
         0i4xgTQrQB5AssNpm6Rc48BICMhK/HJP0VuZs8Qr7+SBi/3f5RB7a8191EDIOn/tSl1L
         m2tA==
X-Gm-Message-State: APuU4Z+Ft1G6GhxOZmR6zkFvV/8yqyvQ/D4ikS7JEvlNBEN5yKSLniYG
	xoXVpV7xQLOpuGlPGhOO0ZpODSAn0McIxaGr6ybXP5+9HvspalM5wAQbK0CWNWimeluXSMUbfNZ
	/fU8vSeHc1hj68J/sQ0pxXvsgvruzykIURiH5Q/NaN5PtB5tvTuri9jl37GY=
X-Gm-Gg: AZFdTZd9XxAQjRIaSJ1RsBl5rZVSYOfeAsfufU24EIblHuRyA6jmWiLSbC0iMudoBHC
	TCVHeDs05JTE0gkJNxPbo4+43UGJRQuTbHf+wfa/6FI6PumCzNWYUR3v11lu1xtf//YreOV1Ln9
	YrylKEVdWxBOjlLtfiWpp0ecQ4nN+3Kd+iOp/7F725EdJQvv8ut+jd6u5G35EB7/YZKEbRO2+du
	8mYYUNFQK8yeMEOMJ7ZnWmqA+LrYIq0fVhQUDKTIy5UwVKuj02mdf5oErQRHMjE8pS4oSe7E+NY
	HJrMroQl58MM7uzJXRbZxNvsCQN2UR1SIxJ1u/NWpIXPw+wX6Osu/AI/DsmXaDUOe0quOrx0BMW
	C+wGb1dnxg6tewxJ8qeWMNg9Lbt86L7n3WxTpB/8bNd5W0VdOzs54NlLBrfyV1L51SoJ6GCr62x
	BB1qIDhuvH9axf
X-Received: by 2002:a7b:c84a:0:b0:4bb:732a:2837 with SMTP id 5b1f17b1804b1-4bb887ec609mr231590605e9.1.1795540636427;
        Tue, 24 Nov 2026 09:17:16 -0800 (PST)
X-Received: by 2002:a7b:c84a:0:b0:4bb:732a:2837 with SMTP id 5b1f17b1804b1-4bb887ec609mr231590225e9.1.1795540635965;
        Tue, 24 Nov 2026 09:17:15 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:3f7b:7276:a343:d339? ([2a01:e0a:e17:9700:3f7b:7276:a343:d339])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm449546995e9.5.2026.11.24.09.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 09:17:15 -0800 (PST)
Message-ID: <7d6fec4b-e9d7-4d95-91b7-0319d44b25ad@meta.com>
Date: Tue, 24 Nov 2026 18:17:12 +0100
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
Subject: Re: io_uring/zcrx: copy statistics lose updates when one ifq is
 shared by multiple rings (Data race)
To: Pavel Begunkov <asml.silence@gmail.com>,
        =?UTF-8?B?5b6Q5pmX57+U?=
 <xuhx@hust.edu.cn>
Cc: io-uring@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
 <2026102727-data-sequel-ce41@gregkh>
 <375d4b.2ad09.1a202324f3e.Coremail.xuhx@hust.edu.cn>
 <c60f3a12-4a54-43ec-b1e4-45bf43deff57@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@meta.com>
In-Reply-To: <c60f3a12-4a54-43ec-b1e4-45bf43deff57@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=d/1gWhjE c=1 sm=1 tr=0 ts=6b05c69e cx=c_pps
 a=Q4jRaax7EcWM5fECTC1wcQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7x6HtfJdh03M6CCDgxCd:22 a=PAz_-FQ8hEVmOPYdF0yf:22 a=0yPqhiTJd68MZZuF_Q8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=nJq5_VNI1X7IEIKzvdHs:22
X-Proofpoint-GUID: bVjHG5z8jP9Bfx_JWeksfdw008mlhbR9
X-Proofpoint-ORIG-GUID: bVjHG5z8jP9Bfx_JWeksfdw008mlhbR9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NyBTYWx0ZWRfX64xuWzCLLpTj
 3DrGXPT1CQ656Vn05enss9TzUCcyQ4Qazo857QBntKpJAdKcTJvseVavTMqWiwdbBXS/keeeELF
 eWUQ1jdRsTZBoDk3vUToZ0zR6q6P71o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NyBTYWx0ZWRfXwAHsU/tx8ySy
 n4amV4tkmam7XI+4hAqlUZla1dL4eSdEqJxs8IXffw0HzVNTyvMLbL7DHlq7eFuGU10oX2/FR88
 cpOiQPgZ2A782EsFUG4O+dfEl/9T3OnilkP94yh4N3OHvfoGX5VU3lYQN7GQ/NKVx2eK0WnmZdl
 Ei7tkl54N5Zt18EjmnSrxHet8uxR4C4rx7CQsbMYqJZyxWWx10bsG7LZ9ATzJqstVTB8fSeDwGK
 5GmJ7orW9NgW/Zrc/TqBc6ibyOiUuvOOvhare/Syd4bKgwdeH9AIIW511b60EklOYQ646T0f1iT
 z2IfdCG0eW8IPTjEexZHFaEHZ5YxepYbC5DIM4+3qw6vrFOXxe4REt4v4a4vnOQYe7ghvRd76EY
 UJunGESsfMBVn0sG9NIzBSDowQwWWx3TINhsJoeenx6h/7yDu1TELeBzySyW8vcC2yoPNjFKPKg
 tlfM51IPPxZVoCNmGBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01

On 11/23/26 14:50, Pavel Begunkov wrote:
> >=20
> On 11/22/26 07:39, =E5=BE=90=E6=99=97=E7=BF=94 wrote:
>> An io_uring zero-copy RX ifq can be exported by one ring and imported by
>> another.=C2=A0 Both rings then perform receive-zc on their own TCP socke=
ts,
>> but they share the same struct io_zcrx_ifq and therefore the same
>> ifq->notif_stats.=C2=A0 The statistics update is not atomic:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 static void zcrx_stat_add(__u64 *p, s64 v)
>> =C2=A0=C2=A0=C2=A0=C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WRITE_ONCE(*p, READ_ONC=
E(*p) + v);
>> =C2=A0=C2=A0=C2=A0=C2=A0 }
>>
>> io_uring/zcrx.c:1337-1340.=C2=A0 It is called for copy_count and copy_by=
tes
>> from io_zcrx_copy_frag() at zcrx.c:1770-1771.=C2=A0 There is no ifq-level
>> lock in this path.=C2=A0 lock_sock() in io_zcrx_tcp_recvmsg() is per TCP
>> socket, the ring's uring_lock is per ring, alloc_lock only protects
>> fallback niov allocation and is released before the copy, and
>> ctx_lock/notification is taken after the statistics update and is not
>> involved when event_desc.type_mask =3D=3D 0.=C2=A0 Two CPUs can therefor=
e read
>> the same old value, add their own increments, and write back the same
>> new value: one update is lost.
>>
>> The effect is limited to the UAPI cumulative copy statistics
>> (struct zcrx_stats at include/uapi/linux/io_uring/zcrx.h:83-86).=C2=A0 T=
he
>> values are user-mappable diagnostic data; the race does not control
>> buffer lifetime, DMA, reference counts, or packet contents.
> It is racy, and IIRC Clement dropped atomicity at some point, perhaps
> for performance reasons. I don't think it really matters though, the
> main purposes of the stat is to be a flag saying "something is wrong,
> setup steering rules". What's your use case? For precise statistics
> I'd rather prefer to add a trace point, which would be able to do it
> the right way (e.g. per-cpu counters).

Indeed, I used atomic first but then we dropped it. I don't remember=20
exactly but we didn't consider export/import at that time. It make sense=20
though so atomic would be fine as well although with an additional cost.=20
I'll let Pavel be the judge but agreed that we do not really care about=20
the value itself (there is nothing the userspace can really do about it
except check that "it's a lot").

Cl=C3=A9ment

