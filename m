Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793068378;
	b=E/+wqqdqgudK+Xj1CIkiwANCVJj/WcneAHvBTMUNgvNV1NzJE7WDASiSMx+T0myxqyJb
	 biNlBvbRk+/4u5p8vSnQwsQii4Q6h4PrHNmW5k/9MVX8Ny6vDLPUpWywvvFvLZ6nTL49v
	 hpq+Q3AhhqvQOOxgVn4rsUnYFlSrzMgffo9/2tqZuoGiQCk6HocXaGyc0J8lQNFHmZlcA
	 wIO1L8FxofdPAiHhSVSrdpjxAPSp9XnFjGvTiWrkKEcdM0w7yyPJmTy/caYbhc1PmrL7x
	 IauGKi8M26F+zoFfaMvz8EFyt4/skBRh+GF1ji8ZpwpRy8EmcPFntc5OW7rSCRu7gFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793068378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=WlmAS3/2b/zwkyDjZK6fZ0f5Hqn5BoF9hu81Kcora6I=;
	b=Xp2BHgfePcnLr39DytJCgXH1QDF/92Aerd8bStZmbXWyTZ6do3wOPTMcIc8cBldJEUEs
	 NQagKTWPpFKdHYV8CPLJvHDrMFAgx7js10sILRp0Ee1gM0UUjTfW+vc4ng36h6BkfQU+v
	 hGROGrJdX6nSNBjDE1/ZU8DtfggnRG2zoXEo+lv2nYjD4SokLzDCZl4Zrg5lxJ/626B+Q
	 WWou7vvXQNmXgTulxGk9WK0odpul7eYb1em95JPCl6Lqa/pTLVfMr4TCwZY1HN/vJZ1ym
	 R51lSRf7GBzRUdHuhDo5LKYiIF9r6Yfz1TFeflfri9Uv9eiDTAAVL6L7m4GN4jqay8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b="V6w/7g38";
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA79606A31F
	for <io-uring@vger.kernel.org>; Tue, 27 Oct 2026 02:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CA79606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=V6w/7g38
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1846bc43c28so4062678c88.0
        for <io-uring@vger.kernel.org>; Mon, 26 Oct 2026 19:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1793068376; x=1793673176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WlmAS3/2b/zwkyDjZK6fZ0f5Hqn5BoF9hu81Kcora6I=;
        b=V6w/7g38m5BsENKK5sMkZ5XIWtJMyxWCywSxzJ0LMTXUITYy8n+ECwqOowHVNRUs20
         McrbIMNM3zYdr6erQ86IPnx88ygmhkfWLojyFgq/Gy5jgvHg2XABzDQztha0UgPt1VYK
         IZ9Gi90UxfRnqJuGGYmPR/Pm7Bp48Ms+zV/DQPHC3iYdphgOABdkXXsC4SnTu8es6CnR
         9/+r1ziIeqdDgvpjGv+BfDp55w0+pY8QMkA6LJnb33+KBzpBEvzHZMqk7y9QuULVPkBD
         o3qlLojB+Gs0Q0dTG1IQxv1EPILrPwH1G+0yJP6PamhxIvMowJTQo3ezbCwOXsq9KXtk
         0ZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793068376; x=1793673176;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WlmAS3/2b/zwkyDjZK6fZ0f5Hqn5BoF9hu81Kcora6I=;
        b=lut2dyAB32xZQ3Br8J60pSTJ8LF5UWL7UUp7JcK4DdcZsZ0nxALcSaAZ3esmiXiktK
         4T7o1JiL8xthKURBPVhRmY/abwgbhqoCN8yIs+t4nnBWQv6h8W5DqlA58QIkGRvWYgd2
         ZZHLyysHgTHruH7Y8SzYFGAf+V2U92tlS8jn5zvV0E93RNxAjsrsH46Z04mISZTwNJzm
         YoJhGhcKeXY/fZcDGGeWP02gQ5DYiXFSHneWRZGyb8vxWOxCZO3rD0n3ZfuqG4FgdhKU
         NZtQpwbPrOFPGcaq0/vr/ApO8bYnAD2STWHEVwcRZaSZvXc2YoLqQkx4OcKBYMNW9TOK
         bH3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwPeii+amPDkiP1xY3tRqFJW20IWWbTJfMOsTr6R2RY2XJzyIIXOSl760MIZq7i0tw19ihzXtE2BQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIEukqPWDDaqvx4zWlSoql1PkmxCNbTQxvLoK7oVPBD8LhvbKTr
	Fbt1FbPYdlJfDGmMaah4uFC3BXJXgDDLP9O5QNWbUPT/ib+2VOAF0hLzmpQxAnPZjN4=
X-Gm-Gg: AYBFou2qwJjj9USpwLo5QVwlcHFrXC3xnp4K4Qd6WyMKw2AK039yVrVddzW7NkbtI/7
	boAi1Q/O/O4EvNKSxbU9kuuvIKvnCAWtFQXAc2paHok/g8Aw11XczShNhJvOhvudZa5rDKhEnle
	lNhQG6XinnBA0PCcvOgXtaVWPF9ftVxyIWi0fgt8XPMHdhn5/U/XM9P5h7COtOcmhgKP36GDw0U
	RCmnRjSOUkWwPBL9eFRNxh/qqlM3yCuQaIPKB8l1kSq9cYtZFW88xLIAEIaeBpV+JhmGHN9u8z5
	lxI01fb7ZKVyYp56CfpEhOXKmj8wJ66t0RXfEP9ilUq/eU8kuaGOum1pBH39PknzfvboJWrNdBN
	tsNi2Ktu6kBO8lbnrDYEd8uSCIgi0dQZGHNtc4YcQhnuWSMEbAG4NGG2gU9iHrai2Osb7Las8Bc
	PgwxJt/FR/fOyGrqJZqDsgzzKfIObmQVAX/idjfhGuJJbIzZ3dSGR0iihVMVAvWoU6cuAc9ANKP
	m1SDcmy5G/72Ibgp68sxPYYCV8TBVbT/Ff0GOsxNe/Bo7z0f6eNrXFYxRQR6XwoqOaP4rZ0+8Vv
	Q30FhoQj55N0+WSdrloKjHxOvc85MObd6S6en9M=
X-Received: by 2002:a05:701b:21c3:b0:148:302e:1bed with SMTP id a92af1059eb24-199377d6199mr10284764c88.38.1793068375785;
        Mon, 26 Oct 2026 19:32:55 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a21bc6cbsm28324365c88.16.2026.10.26.19.32.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 19:32:55 -0700 (PDT)
Message-ID: <51d9c80e-1bfc-43e5-a195-46b4b7612de1@kernel.dk>
Date: Mon, 26 Oct 2026 20:32:54 -0600
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
Subject: Re: [PATCH] io_uring/napi: drop the single NAPI busy poll special
 case
To: Cinq Prairie <notprairie@gmail.com>
Cc: Stefan Roesch <shr@devkernel.io>, Jakub Kicinski <kuba@kernel.org>,
 io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261026231718.5092-1-notprairie@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261026231718.5092-1-notprairie@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/26/26 5:17 PM, Cinq Prairie wrote:
> I'm thinking that with the re-entry in place io_uring can cond_resched()
> when the napi loop bailed on a need_resched() then resume, between laps
> it holds nothing from the list and is in sleepable context. That would
> mirror the socket path. Though it also impacts the multi-NAPI path,
> which never yielded so far, so I'd like your preference: include it in
> v2, or keep v2 to the single-NAPI fix and send the yield as a follow-up?

Let's keep v2 the single-NAPI fix, and then you can do a follow-up
on top of that.

> I'll also add numbers for the single-NAPI fast path when it is not cut
> short, before/after, so the cost is visible.

Sounds good, thanks!

-- 
Jens Axboe

