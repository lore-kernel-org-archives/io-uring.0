Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714672;
	b=u0tqXuzmcJpm0vmdYEmhivz8W8N52CS/uYi9mlhYT3HAofco3ZLkvjefPppoewgCmr5C
	 GR1w+H86aGkgvRIDn7rZWKOmf8eWsekk0Z/5Zar0G3NAbDiYnRKNRu9x7ecv3D0jNyDcz
	 kMNpRqff8Llh5tbFIhcMpgYNEtSJw8Ek48IcjWCOUMUu4bw1ifrz8rjesYLVpXFWI2ffU
	 6k9lYQANuNqQtstZXeg47i+PAR+AqYVPsTIkgciQ9zJZN2ncY62/S/rloTdzD4Ha4J0DE
	 GGKqEXxPhdIshYicq4nJyaHn+aQLEXxuFVzIhsqoeJT/CoSe03stKkDorhWZwbxhrEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=q1iAN0p5dieYdZLEK3xpx31mXg9Eu11cuHDKy4H/K8U=;
	b=0531C2pqbi1TjlthR/D7E5aK/IvGkWU6DCcs59Nc3SF80I+5XEqL84VHfKwKpdagXgF7
	 oEejpV+6C6fG/YD4Goj4m2HXBPIWZ+lYLWcJ1NspooXDo3Jle+bT1P+8sSqnkp+yH5KfJ
	 jTJUoNiPhf3ZlXsJ5QN9dMbqPhAvTGugN6fm+rRwkxDofaKoP4+Jy1OuyXmIdtnHCJGDf
	 y0w3R4x1gym1fcS1n+QNA5gON3F3PbutvBb1Xc0yIQDHq4dFK9XV+8s2GJE3bEjwKy4OS
	 H9yyzzXxV5+nQ2QHAaFUHVGr/EMc7g85XhiIzloN5Fdkg7aFLiUPLgnNJAXpL0E/qlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rj6JEnx7;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1147C606A326
	for <io-uring@vger.kernel.org>; Tue,  3 Nov 2026 14:04:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1147C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rj6JEnx7
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1438d9363fbso707394c88.0
        for <io-uring@vger.kernel.org>; Tue, 03 Nov 2026 06:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793714670; x=1794319470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q1iAN0p5dieYdZLEK3xpx31mXg9Eu11cuHDKy4H/K8U=;
        b=rj6JEnx7TWkYBFYP+ImUZPjHLuGTT7YRFLR4yzy8nMY6tZu0ZXElU88dFVYFkd9PSN
         SZaIVX4vt7gdo/0SgKWec+4gHZ/i6z51EIcasH2kLmiKHD+7fQtlHkqoHZklF447zUcF
         QXZsyyAVmTj2PU3UhJWuK51ylJTUpwwedxelXSwqm9jlOge3QxPG2f+noHfA9UZ/PGXX
         u4MdeBtqhl1La/XwNpB2fCLqKI70AgvHCq3Lf2lb0eGH+QtiepsPY8ObJisfzDRjrsok
         wVxRXo+YeubD0L3W3mVEbsjywZLGyOiHPzzrrbV7euwX8fGkKCFCJqQZxuyD7P5W/T9Y
         UJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714670; x=1794319470;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q1iAN0p5dieYdZLEK3xpx31mXg9Eu11cuHDKy4H/K8U=;
        b=wTAQ9tqWsf0b2IfRZVwiEn25wnHlmZgTlQs2IU29yiItBAl8ZbRDdOdGEINBRDt3+i
         qC4hin0ihyjfobEhvxXeS5OjXMkHBnXsEYdDRcNWr7tqTyTgSyjif4pOeg52ouDYu61H
         kFPp72R9oO8yJcmt2aFvjy+FP/69/RP5StgZQGekfnZj299lQTzLDQfKZFu/EhptB5/h
         n3HwBXd2j8o1PV9bKw5ciQDz88nordj4Jl0YAwHbC4KMIKDmm7TR5JfhMK0etwbUNE72
         gyuWtsJzsrnCfu8AGywhhaEcaCQHoIi/PvMN7ySjCivePY7YtI5jvy/yv4epjPrg3XMM
         cUow==
X-Gm-Message-State: APuU4Z/HkP9tZmgEN1OjRjanQZtwf5yxiDVV3y3/kDAFQzjBPQ5I0jHr
	GeP0wsb3Hbrq9glQJlJJo9i7D8IzOo3iuZxZdcFEVTbaH9QhqiuIcZmlYyJMaCie8AQ=
X-Gm-Gg: AYBFou0OpktMMgKOREGNW2itr+2WNP7qN/S3bBJKsKiyyqPxdKfaER7KZLJu53wkmA/
	mbDsxet1iECS1pCZ7cOPzsLVL0GzdUK4Zrp1EuX2Hd/EMwK+m5SDVwPlp8ud915OSndytLPPQXd
	46IaYLZldPOB3rBetNOe7FhyVR2Mi9m+96ABbNKPsfxhgceuWRdRIa9KuPIpVH/dTETIS1QEnJ7
	9E5spij9cR5INS8Y7+lRUyEzmhFmaxmF8F+lMOvvoQcCAr+4sQT9HnxmWgxAO55D+Ecn43i45hc
	5Hw95Ktw9EqGIuW2dQ2JbsacdpgJT0QLXFtcSQ1QQDRB4GWmCtwzIepvG0H+bU+TQA4jKmv32do
	MWq3JACAKN7r1Wz7nCvtQTW+J0Y+yR01Gu7MpHsALCCgELX1iaNAlmi3vdWA1vu9WnBru4q9YTr
	O1QSZX7O5MWo4HFwkfhiw7BXfHdxqYHpabN0mSxlF1BOeHDo73eWHnPTtYusKQyiup3bWi9e+0U
	WDWCrxhgUToYoOHuTMsKyexyhSaAdQ6dsPS7u3/k1Cf6A4PGWScZoBb5f58BbFFMWKieW2v475o
	479WoGaVJz1LgHntm9Bduc2sI3xEU5H2ePtsdrvQq/Xc76aNibGxqFy9zO8GoX5FjZ81dZ548pR
	vdMfVf2MnIvs=
X-Received: by 2002:a05:701b:4514:20b0:181:6b8:31f1 with SMTP id a92af1059eb24-1a9494d8c4amr21843054c88.10.1793714636313;
        Tue, 03 Nov 2026 06:03:56 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42952e1csm50764623eec.20.2026.11.03.06.03.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 06:03:55 -0800 (PST)
Message-ID: <bb881af7-4912-40a3-a5c5-7f4af35e59de@kernel.dk>
Date: Tue, 3 Nov 2026 07:03:54 -0700
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
Subject: Re: [PATCH] io_uring/sqpoll: don't set IO_SQ_THREAD_SHOULD_STOP on
 thread exit
To: Breno Leitao <leitao@debian.org>, Shuai Liu <847807867@qq.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+675af112519ca34f5502@syzkaller.appspotmail.com
References: <tencent_BB08960D79E0261B5C1EB1E589787734E907@qq.com>
 <auncyphG6lXI7rvo@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <auncyphG6lXI7rvo@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/3/26 6:09 AM, Breno Leitao wrote:
> On Mon, Nov 02, 2026 at 04:05:42PM +0800, Shuai Liu wrote:
>>   WARNING: io_uring/sqpoll.c:88 at io_sq_thread_stop
>>   Workqueue: iou_exit io_ring_exit_work
>>   Call Trace:
>>    io_put_sq_data
>>    io_sq_thread_finish
>>    io_ring_ctx_free
>>    io_ring_exit_work
> 
> I've started seeing this issue on my debug kernels.
> 
> Not sure if this is the right approach to fix it, but, I've tested this
> patch, and the warning went away.
> 
> Jens, feel free to add my `Tested-by: Breno Leitao <leitao@debian.org>'
> if you decide to get this patch in.

Thanks for testing - I'll get this queued up, but heads-up to the
original submitter, I'm going to trim the comment. LLM's love
their lengthy comments...

-- 
Jens Axboe

