Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883691;
	b=vp8xFEmz2q/GKoKjx1HBvftSH4DsTOewHNjWfzJypzKMJhU9OEJLU4yw/ed4EXrxPO2W
	 WMv009oWbxyJqID/SVxR2yOmzgli3AY9a4MYhkmmB+yVaGJXFLL8SFHKbxVs9JpKWoD8N
	 FgI6Wj7ni/WgYYlAeeYqj7bms8Nl9n9wmvMQt3z2gwnfuAAonlYncciVMEw7fil0UyR80
	 pwzCsCacwxW63e23L2yOvgNJHQ09JOSM0x2rD/I+g49gqW+GOCaKER4ayL8JU+/Rk3vTo
	 bv4Yno2HieI6mPfz+TkHaF6NUqbGi10W9/ER3HubEl8HWkPZa3a6DEN3DPZwb7YBVmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=4t8Dxk7ZnBbbKz64urGxkXljcZQSrvG7czYCvU+jEOc=;
	b=5GhBQe/LR4ZBB8RQ0kvgmqsAf3cWzLz8ViCgkEMAtcG5kSpMEEK8/VbVxBv7MI3g6wnx
	 vfNSFwrQzzWk6Xmcp0wW0jC7/jKM7NnjLkcJenBPtX+Jj+LX+Qf/WaELye7Z7g12FlCv1
	 nFpT+j0JTYH8O+/tGnMYC/gUjhhgKDhqFj4QFrS1vaVv+Z9owvU9l41gIBwiRspbTuZCh
	 bgtUgwTpGOrcB6H1wNOcfVk30UKo7ftKZObLlEY608/8eRqeHrZMzEdttiVsXYr7TAkjB
	 9slJ6QdybvMA3TvZRS2qhsl4NgYZ+GZf6EvOuKG6iLSXTGArqjYgEuZsV/1SLuua93Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kApX0D8O;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA3B606A329
	for <io-uring@vger.kernel.org>; Tue, 17 Nov 2026 02:48:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DA3B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kApX0D8O
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-372bdb942dbso3736041eec.1
        for <io-uring@vger.kernel.org>; Mon, 16 Nov 2026 18:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794883690; x=1795488490; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4t8Dxk7ZnBbbKz64urGxkXljcZQSrvG7czYCvU+jEOc=;
        b=kApX0D8OJDwZh/CtQPB38h2IwjXuQ3A0/kcVqfYMpIUcGirtA45wcQomHDuVC7Nq0l
         35ndnHMyRIhpG9v2Dxeooy7igVSycYuJIOvLY6oXLwog6Gon6AQokrUufEzg7cVCZAM7
         5G6jAWB/W/kkdw93e2YvN1wW8wxbhWaLydxZKwhZXeV1ZO993Gd3kfF7T+z3/WRYDcXe
         enJkXQFpZyNjwb1yFezsveUX9kE+vJMpIPjzJTeSkLDwlVui+Z6Xmp1gc/oos2bmR+Sq
         YUrtdPQPc2uaHkElmt2bl9e1XVws4EzsQU95L61mw+tKTLZv9GvE2FSmRfLEbGWXYY52
         2x7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794883690; x=1795488490;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4t8Dxk7ZnBbbKz64urGxkXljcZQSrvG7czYCvU+jEOc=;
        b=Ujj58E+UvoIwMHztn4Eq979rqEIbtXYYZbT99Oa9sKdAzTfH4KalEtYNei8nj6isXM
         rxhvkkClDE5CEHYnptqc3AMDDueinTY1Zy2/NYNycmd7JUxYaW4vfrLyVqG0PYKE9oHk
         LMrN2p8c08i5XSPa1b5iy5xj9Eu5+Py2AwAR0B6+ajljRO7Wnblo6525MJL4suWlpukV
         ktbIP8BvY1zOSUqYgtD41w1ZozxtVUinAN3oyChpIFtF+dRBZRJ9aMvD/fKZPBQfxlxB
         Sn01DeXWjoD+ifXl5I2YIwurNJEAAGF8mZYknSgaqKMS7zvmvQNmcxlKP0AVkN0HrAQI
         JrbQ==
X-Forwarded-Encrypted: i=1; AL+hErEC196NxTY+8KdpKRYB3s5GJNgAWEt7EAUhBVZ8P0N4T/ofeGuJ2/qqitPhJPKwxog8mtp91tlpKQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8kMpx53KbnKIH38Fk6JQ1tsi95+2WMLeIB8dSPFDYrllY2T2WF
	wmEkLqQpShFfjPxTC65pavGDTpvnyGjbTycfpLMw0Xt6zWswpEXLFYIiF14BBvwhP+Y=
X-Gm-Gg: AZFdTZfunHwdIPNfed5GWnTG+e7iRmVizZTviLDH6mLIQ9Lx2rY7oa9p7CWjO/SvAHo
	MXEZ9ivItFChMt6Akp675zYDsDbzSCA4//fgjTZgqLc98EyFONQuhklYn49m1yIfCrQFqPdP7fT
	bRaAIWy4j/RHoWuGA8USCg73ymD++ICTcFMhINcQaTeRbjHPvHORbuqJuON47/uo9Bza5V7oJX3
	Zwnj4+FBRAXI/GpZzhEBsV0WExnVjp+CZh9i0RyUT4vMP1ElYr1syZRldrrNiBq7mldQyoR8aCk
	kQiZQz9Eq4/n5UXyA4Y2blQEYkgtOTuahSOB4tljwLQiITkazZ6m4ZIegANv4HrLdlS7Blx2ry3
	Cn3gjFDDjBRy2trMW5ScWNdTaygs3nU+8GaG08SfQuMwvqBZ+5mKh089amhW4DSjxLuaoTBvZNe
	Ne6Q/uSlkNa0EII7rumYP+AhTCPjMaQVkEYme4Zg+tfbki09vMTYffQSigzFYRyE0FQWlW6AvJy
	8RKNTDXAwZNLarXdtRnalOZHghpgAWL5hEE3nnvoqd5BGRhk84P2As8ZAzuITD9AF43JtbIsjDa
	59rMgJcgeyfyZxVjpirTY+gAOganxDBw6S/M8IKXaodhim1A8dGXNhVK4guCNtmQ+wjtW2O7fhF
	rk+pfXHhMxlfm
X-Received: by 2002:a05:7300:b284:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-37966e3abf5mr13168307eec.10.1794883689835;
        Mon, 16 Nov 2026 18:48:09 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm34396443eec.4.2026.11.16.18.48.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 18:48:09 -0800 (PST)
Message-ID: <903b7861-a0f0-4b56-8e6e-3c7ec915c686@kernel.dk>
Date: Mon, 16 Nov 2026 19:48:07 -0700
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
Subject: Re: [PATCH] io_uring/timeout: don't rearm a multishot timeout on
 cancel
To: Cheng Yongkang <teel4res@gmail.com>
Cc: David Wei <davidhwei@meta.com>, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261116044519.281756-1-teel4res@gmail.com>
 <71233dfb-bcac-42df-afd4-45b65dabbc09@kernel.dk>
 <20261117024643.478059-1-teel4res@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261117024643.478059-1-teel4res@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/16/26 7:46 PM, Cheng Yongkang wrote:
> On 11/16/26 7:41 PM, Jens Axboe wrote:
>> But why would the app do that, to shoot itself in the foot?
>>
>> I think the fix is fine, but the premise of it is very odd.
> 
> Agreed, no sane app would do that. The only thing that made it look
> worth fixing to me is where the cost lands. The drain runs from
> io_ring_exit_work() after the task has closed the ring, so the time is
> spent in a kworker holding uring_lock, and the app can no longer stop
> it by being killed.
> 
> Without the bogus CQ head the timeout is still rearmed during cancel,
> it just stops once the CQ is full, so the change mostly makes the
> timeout handler skip the rearm like the other cancel paths do.
> 
> I can reword the commit message to lead with that instead, if you
> prefer.

No it's fine, I already queued it up. But it really reeks of odd
and bogus syzbot test case, it's most certainly not something
that any normal application would see.

-- 
Jens Axboe

