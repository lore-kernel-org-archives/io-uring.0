Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805320;
	b=wC2PydPPMKKOAPAMyr27gfhov0rGvDuxKEIdT/6+r/Kaajyp2Zqfq/2LrswRVpI8p6ol
	 wWiE+bqEw+ROBWnNwgckj6WmjWumaMB4MK78XQFAO6L+C2myJOJXfMlsjOmzYmSNdFrfd
	 kyYwOWYlu9CmwcRuJ9dAh9NkQhLk7VB0PDt7tvhAI/3dftYvB+KXGiNLbXPaZyk33RIgm
	 rlAL9AMGuxG9Xhg+nLluSLI02CtRtf583bE2OwuJt9N5GskhbiOQZ7KiYFyluLDueeF5+
	 aWxu9t92Ej7nC0bI1H7PRHMQWKgEWxwNNWjzLJvp1oMpbK9VQtdtxYb09hdZOu8C+Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=0gro88bVjgpS9PImXHUesfvn8PgtBvOLbzKklCGIDb0=;
	b=PdS5F4lbyAXTXkGnCqiD77wRluw7YEYbXsqR2PRc8CUqj3tdtzjyOOJKe6+ZKlAbRjVx
	 UdSNx+K1/I0Brv39wZGMh3HFOFBpvikZBWklubjZN2EoSGvRCFPDj7qye4yQXa/qfFIhK
	 1t2o4BvCe0FXUjS3D8RFmjVfbmtXkzd1reszX5Zm4fHlfv5yWejZ7TeniTAbgo8xsxd+c
	 hrQzsQfmOZcJKUfwTKvPyjgj++M8p+XPMhUo39ydaena1QwszyZWyRr5BtoH/CO1TbG2x
	 csJ2ss55Fy6aSbyz0XzRm7rLTCnkzMUVw6Q/DtrdKhsu8UbZH0zJyYPsdhm0+nSYXdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kEjV88t+;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621BF606D80A
	for <io-uring@vger.kernel.org>; Wed,  4 Nov 2026 15:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 621BF606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kEjV88t+
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6ddef424972so615988eaf.3
        for <io-uring@vger.kernel.org>; Wed, 04 Nov 2026 07:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793805318; x=1794410118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0gro88bVjgpS9PImXHUesfvn8PgtBvOLbzKklCGIDb0=;
        b=kEjV88t+x9D7SLkFzZtS2GEBJYrKUhicTeVFdU+nx9HxZXSCSjgg51J6UZWec1boJn
         v6FJQXQpXvazU/oUgvdiLyfBhntSBfb+yf2tJuGuGosySR+LR3u/JC2bfGxrr49T0jWb
         4IefDG52WoZIliCJpbga6VU/YtHN2uUMq1jajUQX6J1mfx4YfpsTAUAkIIPe0SuCYnxd
         sIYsQnOhbaM/ksUp6Tovd1031cO4Mmo5sz4V+/5MlvgEfakEcSZdstY4bdVvzzT1XnSs
         IpXuGphA+0h6KdpQ+hj3aDD6CzuRE7JeE4yZPU9gohdQt9AulZft5nWN7ljV6z31xv5e
         qmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805318; x=1794410118;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0gro88bVjgpS9PImXHUesfvn8PgtBvOLbzKklCGIDb0=;
        b=2ADg5424taecib+YG186uRh36bjPZz5ETdC+qCr00pHZEGR2xg6rCdKmuckqUjYCzY
         z0tUr+MU5CusBxXmscRsLJc3VlOBXYPXClzbwtv9+v4ChHDeRnuiqCzK5/wAocujbFwv
         Jl4DiVFA4uUvKF78VkP0hgGGcKvQ+gPeDEniXJlKePLEgJNnOYQ5Ko86lzZPCuhJp6xN
         +/xGjp1Au9aeBzNUksJfVEo+rnLJdK8ClRJEKHzIcNE/RRXUymmezGqT3sHlGLzr6XLf
         mcp12AQkMP7Ceb6HX4/KclWbrt5ieekfhaNdg+mHC/Snok92WTCjrxhN8VAk8PmQliDD
         2+QA==
X-Gm-Message-State: APuU4Z+hnvCYFcHOjqMxarsl3TmUV7NWEBh/y8rZUP6n6HHsOWDn7sKm
	JA7oTBd3r7oiyEqsZxiAdNSDcC7w02f0vTjT2rTW7HGbt/Xz3t3TllI0/Mm5JslskHo+y4xj3pG
	wsXOff9Y=
X-Gm-Gg: AYBFou2KZ9tXbSoVvUYjgtslPKN6dus+ifL0iKtvYJuh4WeHDpt1LWxWciv75JDu6k7
	WVMZMy0x7vXax558hUYCaOSoZJM8U4R8qDByp8IIrgVPw+u0bx1jJSz4ZTVJfHnWSg2o1fauFSs
	RzB7NmDnxLJ2ZrEfSvRWmvFGB31UEeuXNCyNO1BWZ6uUoMNjyYav1lQsKt8nV3dUgF0Lh95lhGI
	4wEDW0DKjsAyxxG3kZjqed38emJa+8c5DfdBGzNZ8yuCEia9mD2Kesb3lyFD+ZuztMxAs+SNz9V
	1FzSP6IJ4MZNcBUmA3n+6lheCN7ap/DOlje93G8wIHYOB0C5gJ801Qh4X/oIap727j/3Elv0zxd
	EnRUcqAnE0unT8Hlof6dJMIfa8aWbyxRm+kBi9prOmE6om/h8nFIjSv7z8zDhQZ4mzDEW//T30D
	aKAJaYPaS2eKoeBaySFC/vq3u/hMrrvgYThahZW4Tt/VS73wt8WU95/0CPpu/17PGEhD+bDOLc/
	TioEadq2WAEC7T7HMzZv9zDqlUuUhQv4cFtQ6brguQhasT/Pgnn5HhNWDf9r4fXoAAavquSFLpC
	LpTlg605YEg8JfIeJ+cTfFxOBL6ZrukHT7Le+l6BwFKaG44tAWM7YKDh4slFOvmrPlFPXWaNehQ
	nZFmnsfOA
X-Received: by 2002:a05:6820:615:b0:715:21d1:b81 with SMTP id 006d021491bc7-71521d11e6cmr5123920eaf.80.1793805318210;
        Wed, 04 Nov 2026 07:15:18 -0800 (PST)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716c1254321sm1833033eaf.4.2026.11.04.07.15.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 07:15:17 -0800 (PST)
Message-ID: <f1d4cf26-a603-47fc-bac7-c7257630717d@kernel.dk>
Date: Wed, 4 Nov 2026 08:15:15 -0700
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
Subject: Re: [PATCH] io_uring/rsrc: hold uring_lock across index-alloc
 put_user
To: BeaCox <0xbeac@gmail.com>
Cc: io-uring@vger.kernel.org
References: <20261104092818.70521-1-0xbeac@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261104092818.70521-1-0xbeac@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> Signed-off-by: BeaCox <0xbeac@gmail.com>

Missed this - that won't fly, you need to use a real identity, not
some leet handle. Please resend with that corrected if you want
this patch included.

-- 
Jens Axboe
