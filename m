Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC72A4399E2
	for <io-uring@vger.kernel.org>; Wed, 22 Jul 2026 19:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784748118; cv=none; b=GPsDZxa97uazSmq8Y6238LEU/h3GTrUAHJTmuj7x2E8ADCmciIqBuHTJ+8MK0wnJPf5AMvAiNlZrkFVVZy5NKDq+V9CXzm279kTpH3D2qFh0n7PtfiQOQ/HTmZq47SgZ3LaFemjsO7/5zg8b409g529vM7OtzASGXgH0sf04RLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784748118; c=relaxed/simple;
	bh=HR40JckPYsJu6y0/sble+DG/jwp+ZjjL8M34PuugWbc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iyBfA1UQOxVTHpYeCKgV9HYB1psUNNdJU5EOu17bAfA8HNfv1fjNJEqImFZbeketvDToG5FO5LgtFMckvHT/e/i05dpU80MULhw9QhRtgtfABBL4L51KY2S770SqzzpWeRV0W4M9XSb/qCK1/XCfGN2XAWMd/w2x/KVI/RvMz0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=I5SAz4Ph; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="I5SAz4Ph"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8114a4542b2so79483127b3.1
        for <io-uring@vger.kernel.org>; Wed, 22 Jul 2026 12:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1784748114; x=1785352914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JMZJs6H+n20dZF248+v1ApHbQWAvxlskt5s7No5XK88=;
        b=I5SAz4Phn6/TnOjS9yo4auiW9bSFVblm8dvt/pfUqSfsB/9C580y92M3Q39UQu+++l
         kWFz2o1YT/TiQX2azxG15YhsnAq96cJFwbK9MbXhgq8wDB18p8ucjgkC1+3G50wedSjO
         7tJBSJJ22XX2rXUyMbeKcM4YJ6HY/3mGHDni7CLjz/jsXJcpTAWwWr2qOJrcptPhZPQk
         2UUvKhAClYG4W3++h6L43UWxbEbnHIjpBQYbL2qYXXA+StBK1KpPwa8VSpGvAI72eBqH
         2N9hjNCOJA54n7/OA001ZPaR1CqpkQSMXtvsSbHITo/Lncl+c1tYE5SN6GFcE17IHBD/
         4U7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784748114; x=1785352914;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JMZJs6H+n20dZF248+v1ApHbQWAvxlskt5s7No5XK88=;
        b=Rve1yqzZB688I5hqYkQu/OHimQ2UDtFZj03IIUcCH0xacGCG8ditIY4GP9agujihAM
         OGEbMv8x3Bb9hyn66z59/8zAzd0/VY7X1j1rr7PGbH5Q6cT37ie243JvxZerWBuDsh39
         J+qS2JKUKMVN/kLN/4TeEKj/ZGam+JYppWDWDGjsC7OjN4HAeVoTn+Zl2Vw9pLZEwQVA
         uaFuen94VLunCp5PAkBo4ixWTVu0htSOQlGJcMuB9ApjIIUb/EdWfX2OsPK/bfAbXgb6
         nm/TqSDxMwodW8GDWgAWRpA6z30c+Tnn+jxA4+eKX/6GHcbmIkat50gkHd25iqhT7KTz
         PVsQ==
X-Gm-Message-State: AOJu0YwsT81U9zR0A7/nh6KkCRaxwJDWIcMgB4iUbqeUjSuclhEMbiqx
	x+8f4dyx074vBOnV3lUZjI5eksXAOkCD3F4LSArWveG1AWTNy87fZ5MGydt3PFE8O2+Hg45UAQ4
	dvm4CGsw=
X-Gm-Gg: AR+sD1258yYQ5Egk8ZcKOfhyyG6kmqSc0Bu+1uG5epnBuDYORKMe1Yo+yY+uoEX7MGE
	76omBFetqlKlmB2pu2/+YNAy85zoZ1uqeWvHSXQm4xK2f3Ol6GOImHxpiEvL/uqUstcQhYlwUMM
	x5asf5lbM75kGXcB6j2R/GWFFpEqk05IER1kBN5eqdAxUr8ZodFyBPT2OabhmpJAeF8/D5bPGra
	CsLFj1t/AvA/WPFOYmyEjyY30W5vAJ5gZdlLZbERq2V0S05HOWWmFAp3RIdxxZSRUlDdKdPM9S+
	bPkIOvOTdW0GCcFcfEhPZH3FL7TySEkqM8nW3Ho5Hfu2Fm4KF6on3GodNg8aIzkm/O7Y6PLaiF1
	V1KhtOk/WuBwQ0+19HrZ0ja/9IuyYO6li/vEEZ6yo2NqGbhXwNfRFeDeYTuhTSsqO7x2Yei5aFE
	75szk/yAsFd1wnd9vRrrp1PjaSO9AlKn/CfACw06RefC+pAbA93agCupQsSD/OQM7bCalBrg==
X-Received: by 2002:a05:690c:498d:b0:80c:85e5:8755 with SMTP id 00721157ae682-81ef28b8aa2mr71703397b3.62.1784748114354;
        Wed, 22 Jul 2026 12:21:54 -0700 (PDT)
Received: from [172.17.0.108] ([50.168.186.2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33ef1ab1sm18024417b3.42.2026.07.22.12.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 12:21:53 -0700 (PDT)
Message-ID: <6f31dd5b-639e-4018-815b-0fa04a39b337@kernel.dk>
Date: Wed, 22 Jul 2026 13:21:53 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH liburing 1/2] test/send_recvmsg: Preserve msghdr until
 op_recvmsg completes
To: Gabriel Krisman Bertazi <krisman@suse.de>
Cc: io-uring@vger.kernel.org
References: <20260722181710.79099-1-krisman@suse.de>
 <20260722181710.79099-2-krisman@suse.de>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260722181710.79099-2-krisman@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/22/26 12:17 PM, Gabriel Krisman Bertazi wrote:
> msghdr is allocated on the stack at recv_prep, which means it may go out
> of scope before the kernel has a chance to complete the operation.  This
> results in spurious test failures when we reach far enough into recv_fn
> to reuse the stack space before op_recvmsg executes.  I found it easily
> reproducible when compiling with '-O0 -g3' to avoid gcc from optimizing
> further local variables out of the stack.

Hmm, but that should be fine as long as a) we submit in scope, and b)
we're not using SQPOLL, where it does need to remain consistent until
completion.

And recv_prep() certainly submits before it returns, and we're not using
SQPOLL. So I'm curious what issue this is?? Same questions on patch 2.

-- 
Jens Axboe
