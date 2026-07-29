Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330B43B0581
	for <io-uring@vger.kernel.org>; Wed, 29 Jul 2026 15:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785337803; cv=none; b=dZeXCDZaJLG7EttOzX3d4CFgx1znfpGMwAYRLMX0otwO5l0ai62p5hjrkdwpxRT4ruSAoV4zog7jfR7UXOsQfQjmjl5oNWnLGqvNVYrfiAKfHejXyhd9ffvEOeqoCwF/A+iS9e2Xu9Zg3KsyWWENQJHJ+yhhArdvEc8Q9nNfzrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785337803; c=relaxed/simple;
	bh=E/FLQXipQ0K2+/SZsSnDyNxS4/Ll61lf7dZ4IW4dJIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EziH2t7VkKCbT+/pQ5EBahsqel4ls+Bv7U6DABUjrvjsmyhOPAba/qUtD9bWVV+ldxM9Q6EaXY+SfNJBY0ohxPYKyZRcbup4mgS687Y7+X5vVDp9FaFRFE4IRXNpQI/urvPJda+sJAubvODT/zWdKDcicAuFBc/zxbR4dkQP/YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=CmYuaXqg; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CmYuaXqg"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c15f47e6297so127693466b.0
        for <io-uring@vger.kernel.org>; Wed, 29 Jul 2026 08:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1785337799; x=1785942599; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bbUgySyaXxdCM5TiDxVMfKO2Pl7MWD7VCGVOlsUNi5s=;
        b=CmYuaXqg47EbYq50JRGshn20dxkc2FSOx9wT9qy00HQMCTznvf4PqPOlEPPRWWToRI
         gUCBJaqgjuG3UhJo2JyqqNdcnjNMFi8Iw6/cPTGEYAWOUBGdoD6cGUTYPTYBFxTm633p
         5BYkMD2bbb+lXy6saEiTcGsr+6U7PA6EsIMqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785337799; x=1785942599;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bbUgySyaXxdCM5TiDxVMfKO2Pl7MWD7VCGVOlsUNi5s=;
        b=L1WJaVMEbZEKfhQFA0I17v3FHHShn/Erz7p2veKCn3b+31kTXzYYVlF/BCjpzTQzEc
         YeCKgyfYgiidYGFITl2zhDm38AyYtPiE1ud6u4TxjQpc11oOP3H/H8HUfEK6306J1ySo
         Yg8VemsICJOZXfHcNPP6HG9dWU5TOKM7ZeQ5+cXpoF+Xbiv6B9Y38k/OuWNBGBqEyz3o
         A6w+BQBjWRBYuhRosdjEr+kAUlHQ9xqpO0Nta2EKnAbD0H56pG2nmtVi7ehToDUqFFLz
         IpM8Kv8QIf8COKikG//Jyc+0wvxxOEKNQ8u/QhXZ1HDwSQ/hG6BZywqOgcnX/8sIm2a2
         dYbg==
X-Forwarded-Encrypted: i=1; AHgh+RqXx4zvzboJ9NyUN+2FlvZ2SRged+ZAZcLwSZs3OJMeRFMy5J1SbQq6QbNqyJw8dd1byA+Q8eb/mg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLz7xhRUzjRueFBtbLdvMC99e/CdGshscw2nyD1X3nVmVWzHhd
	fwTtTTY88FkkQdn2/rPWYa5pWBTRhY2dyUF2w2fwRMgZGyGP8EJxS3U2p/MwrIvB2PVmpFe5iet
	xRs6Ah3c=
X-Gm-Gg: AR+sD12ps+doWZYHQLT2m1Tj9HGDgQDa8hwy7VVs+YYbIDCy6dvEB0a8gdtuWJyMt9b
	8fDOgUyRt2GHvOtFtno7V65mGVoBkiWa9N1m1KrR/Yu/YywgOVfqJ5UZLU3hErjkpeqWrOIB7SW
	Vy8QksbwF2m+Imy4bsSorJ3eHAUclqEBd25uHWj8stPFRuGEF3Q3uw58Ys1zX3cWS+SuXHpA1Lb
	gBGQdsgePxThX9wcj4PLTERxi8qxpsoA12HI3tJ2neudtxbMIa6h82AcvGeLTo9Dq6LfBY9W0Yy
	ICvAuGNyyJJAAFLdJ8y+Zba6tjetvpxqhRu2sENiSdy/YtP3MY26wUITvgoWozeii87XNcI4Chj
	y+bB014K6+VvamEjmGrdrvAt7K5PKPpW2n+d4jB9vGrQV/7sDcvKT8E5jGhKHczPvzFuX2urE+G
	y1iP//bEEqKjwWYqvFNZXDPrjV3X05CMkkqdcd14cNd2V8cXaKXn9HhPAy2rYo9H9LiA/oyHtiI
	iFtqX9WzaqkbR7hSI7C94w3HU/wYBiLgT30ag==
X-Received: by 2002:a17:907:8b92:b0:c12:80f6:7fac with SMTP id a640c23a62f3a-c1f72223dddmr387721166b.36.1785337799372;
        Wed, 29 Jul 2026 08:09:59 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83cea5f8sm128956866b.24.2026.07.29.08.09.57
        for <io-uring@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 08:09:58 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c15cf78d1a2so127217466b.1
        for <io-uring@vger.kernel.org>; Wed, 29 Jul 2026 08:09:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoRTGGccuXnL98/hyJtQHNWueRP0G/1QN87t5nq+5446PVzm7Up67uMXx7ADT8kYz7ZGtj+LMkDPA==@vger.kernel.org
X-Received: by 2002:a17:907:6d1a:b0:c15:f376:9642 with SMTP id
 a640c23a62f3a-c1f724ee1ecmr389008466b.65.1785337796931; Wed, 29 Jul 2026
 08:09:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514140817.623026-1-axboe@kernel.dk> <20260514140817.623026-7-axboe@kernel.dk>
 <605939add4dfb674bd7ab39ef8dbd3fd22e754e4.camel@xry111.site> <427b15c8-c168-4e2a-ac38-b00dc00400d3@kernel.dk>
In-Reply-To: <427b15c8-c168-4e2a-ac38-b00dc00400d3@kernel.dk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 29 Jul 2026 08:09:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjeSgFEr3WSO1C1sPP+fy+Mt5_EL9WXW-s11BOhD_S5Ag@mail.gmail.com>
X-Gm-Features: AUfX_mw-kTtyuQrkUq67j8f_qvo8wTHBUpDqR2AVQRqJeAFNQym68SnG2Gs80B0
Message-ID: <CAHk-=wjeSgFEr3WSO1C1sPP+fy+Mt5_EL9WXW-s11BOhD_S5Ag@mail.gmail.com>
Subject: Re: [PATCH 6/6] io_uring/epoll: disallow adding an epoll file to an
 epoll context
To: Jens Axboe <axboe@kernel.dk>
Cc: Xi Ruoyao <xry111@xry111.site>, io-uring@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, brauner@kernel.org, 
	=?UTF-8?Q?Juan_Jos=C3=A9?= <soyjuanarbol@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Jul 2026 at 03:54, Jens Axboe <axboe@kernel.dk> wrote:
>
> I think it's pretty simple - if libuv is using nesting already, then
> we will have to revert this single commit before 7.2 release.

Yup. What a horrible interface epoll is, and now it's made io_uring
have any bugs it has. Oh well. Horrid or not, the first rule of kernel
fight club is that we beat ourselves up to keep compatibility.

            Linus
