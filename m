Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C634908C0
	for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 15:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789142152; cv=none; b=A6wKnXQvnoRRlonDsyCHNFfjybfCAO+CixuP/WkQl3s1znJhqvYslPqF3ETjttB5I7uxjLiIINUn4lf/0M/NEKEsJwPbL0x8N0imhPzpEnHrPOLjj7wivixULbxVdNBB4+Q4QRpZyiT9Nl6syy0pw/0u5LGbAGW5SZv7fY/ZaAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789142152; c=relaxed/simple;
	bh=8nM+GmBzGntH+3kOs1PPNBx1jMv7LwAWc/7uGLUaP8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DYlHi9Tlm9gpj48NPPRPW9PxBG59SUbDs3E13iCMJnLO6Jy411sX6NgSeUob3/g5IzYWWWqoAmCs7LktzvyPb1okTJu3j5LMxDQNZGobU+Un3mheXLSt1QxPWo2s2k/rzmnAeZctHcqnewpMCcpCtZvBk3ZUNGgwsZZZHxiz+Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=BBh/JCCC; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="BBh/JCCC"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4b381337e1fso1309590b6e.1
        for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 08:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789142148; x=1789746948; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mY3mJsu9HnEYIUkDsYXuRTX7CMGRl76Y0CJF/rnIbRs=;
        b=BBh/JCCC1kbCjsAOrpWjtnAZNMhnqz/S6JMu7rMVxv57hq/WSgTfxSRQzzX4wGfobA
         JIokX9U7dNHq4rrB2yJJC5QAsffXzxLlSN4Or1m09T7A5fPu1+F8x84zahBZYsE4IKea
         8OZ8K+XgpbnVPxAozhx/s+jGc9x6d4yTQZ4smGzKxTYghTvY17h/JEFJCBc+QZ3ktKPp
         UJ+3pZX0db2TtKAFz65vi55yeoJi8lKwUie8oMRop9KdbvyuGsYkbR47E2/Z1pgHJExw
         BA/AJhrA4rKXBYeVA9eaJbQTnK2pDBAwNj67SSwnTxdBnwNGa1vWAkhDMp1UMHIxuuDB
         Wo+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789142148; x=1789746948;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mY3mJsu9HnEYIUkDsYXuRTX7CMGRl76Y0CJF/rnIbRs=;
        b=b7/qDkElOcgQ0BcfUAxlhLAf7yQ5IqQRfZgnO0AMnF5ZnznQYL2n+Zu8EnpwW+i1Ar
         IZoqy6vrLevWDIoFDOdd76AMm3YYy8IHoXLboBVZNoJDjpRSa39PLQRt/T2TuZ2cS4jz
         aO0/KbwmusTI4v+iKFAKuT5RD30FVmhuaL9vk319wPUmIZ6XKW7hYyu4yOYW8jqbiYlr
         A82yLCyZ9nPAc9AZT/UXpQIqSMySMr9y4yqUdI6rIV6mrU37F4AnmgX/QPac/FvaNPwT
         EBnkXkaI18mx+9CBG4ASTzXua2pM9kCpHyGIk+ETRVZ89bq4YwHU0zGOmszB/A8CsYxW
         3PmA==
X-Gm-Message-State: AFuF++lk4vJcFN/dvAd+6FfD/w/uvTTOYL4YuOp0/zTtWojC186dA5Ej
	yQkaFUQPJv/22B5Ja7cvVYblXHLxjaJkP5QuPBqyBGzcI7iq2wVkadfvNvrkNMjHqlM=
X-Gm-Gg: AYBFou1fPa/J8aSN2B+qHt9KnBgQmK30owvW+vwVW7T99Av1ZBo+RwLHqqVIYBaOCTj
	nD4RhlTEK5QXU6yRLb2hHi0N6LNTqe+lm6A/vras24LLxoacDDpUMYH25mH8rdPB46XjqEwAssG
	pnrMKo1KqjnmdM7O3qlYov71pf2pk1JwQtrtQ6X7/jvDOKPVgukSWpqC5h0CwnGOCvGqBQKbJii
	IMRH1ZyyqFconAnB+s5ZjSqo8iI06uk9freUpIuW0BNt+rU5fJYk2xFMLlNkeZ/F6YYGkAbjZg5
	pazvoAhjhYJSgJi5GkcTnDjmh17qIYyEszo9xRXnvkMf2vx6UbS/zKcH9Xl9Qe5JR/sUZvXBhO4
	2s1bfixti2Ncrnz15D7hiVW3+nMx1fy/nQkawdsZhQdHlOgNElKNPx4R4R0t/1p3pSv1cdJC0Mm
	u+22MEFbnbrAh8wS0SRALrIUKlHhxmEiflm9ReVnBSYscT95z4e1YCi1JOanlIoE4q+vOoBVyeh
	XcyPk8ef2tP3jXo04/6ZeSeyLZehaVy5Cn58Fs1OfTXa4PF06QLFbo=
X-Received: by 2002:a05:6820:f00b:b0:6c1:d6a4:9268 with SMTP id 006d021491bc7-6c1d6b3fe38mr785366eaf.5.1789142147951;
        Fri, 11 Sep 2026 08:55:47 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c09a31f6b6sm3457138eaf.11.2026.09.11.08.55.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 08:55:47 -0700 (PDT)
Message-ID: <962249a0-f5fd-447b-a52b-f5bef28f600f@kernel.dk>
Date: Fri, 11 Sep 2026 09:55:46 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/fdinfo: ignore IORING_CQE_F_32 in last CQ array
 slot
To: Jann Horn <jannh@google.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dominik Maier <dmnk+artist@google.com>, stable+noautosel@kernel.org
References: <20260911-uring-fdinfo-tighten-v1-1-47c62a154aca@google.com>
 <CAG48ez1dbEXQgvvAxchiiakym7KJntGFJ3f_obfnDwFouYZQnQ@mail.gmail.com>
 <5a656a9a-afff-4309-9007-2fcb6d3ae1f8@kernel.dk>
 <CAG48ez2J-MwLCS1NHV1+Yu12JpxiiL7_qfN6+37CAdeVZ8wJRQ@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CAG48ez2J-MwLCS1NHV1+Yu12JpxiiL7_qfN6+37CAdeVZ8wJRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/11/26 9:52 AM, Jann Horn wrote:
> On Fri, Sep 11, 2026 at 5:50?PM Jens Axboe <axboe@kernel.dk> wrote:
>> I did spot that as well, thanks for finishing it. Your fdinfo idea keeps
>> on giving, at least this one doesn't really matter :-)
> 
> Ugh, yes. I hope it is at least somewhat useful for debugging, and
> doesn't _just_ cause lots of bugs?

Lots of bugs was earlier, and to be fair this one is caused by the more
recent addition of the mixed size CQEs. Everything is under the main
lock these days anyway, so it's more logic bugs like this one rather
than races, etc. I just like blaming you (a little bit), but in practice
it's not your fault.

-- 
Jens Axboe
