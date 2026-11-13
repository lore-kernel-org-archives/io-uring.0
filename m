Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794587034;
	b=zpDBexCWE88Xe7D7KMhr3iDB19TniNqD/1cVRE0Fe8vgBjCUoTASTZ0HXKCq+IBkD9JL
	 RnO8Z8AChJP0UmEBgzOLu9pkJGwMVbvxcQqzLNDRAxB5ZshUgVOULn7GvbEXzMdyoyiu3
	 sEAD7eReikY9rzWSjAP4JNanGALzI72uxAPzvSNf4or8yRtq9I7BmIQgjl01qDIP5IgOE
	 O+VlI9lkuvo4trCIHlxBL9DyFeYkM743hJt0a4cSieSPfTKz4gIIf7aZ7DWDBRNhgpZp+
	 iZa+xpOaftfvfThNl66SPpebijYY95LOfK9WASYUeeyFEwskiixSiXbGy2byePoKV8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Uql1IwsaB/smSAybqhDdELR2T0MP/9M8xw/lDlV6oP4=;
	b=gr9+NhuLW9xHIg0AW+GD4m9e1hr5J+0rPsiwbOhCx4fJcADBWE0NHckRFTskr3J2dWmy
	 GgkMxI+Wyxv587tAqMzU9ZMzGwkykfXZb5v2ztIT8kyPwnxH9VyobSMV/Y9nbcQlQFCoF
	 +T+3DaWbOyOghbLReLRNubxVfYBgV9qbRiMpOAdGOQ09tnRh28AbNWgIOHbIWRUK6Lwg0
	 Y5RfmgAleK3B01RYIzlY85U5GIscsMN0xYNxfFj/wT9N7B79rFejzSHU0Yu3Kb5ClbHu0
	 X0diutwSdypGK2Pxu9Nkc+Zw22VgNYgjKHKD9fag16sw86eKNqiYJPQHgWUeGYJIpuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hxBQmMr0;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CE8606D452
	for <io-uring@vger.kernel.org>; Fri, 13 Nov 2026 16:23:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4CE8606D452
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hxBQmMr0
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so17289555e9.2
        for <io-uring@vger.kernel.org>; Fri, 13 Nov 2026 08:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794587032; x=1795191832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uql1IwsaB/smSAybqhDdELR2T0MP/9M8xw/lDlV6oP4=;
        b=hxBQmMr0tP57bm8fa+eZI3vHzyrD10SjeZKtGgb/4cLOQNs04zYPzLvlFezEV1SBAm
         87C8HfyUhvJHBmBVAwujffVoDMw0Ov4lTbTxTpVjMJUnGG8WzEA8MN/M62866IsAA74a
         osGa+PAF286bRMcEKOKdpYm1g0w0nxnAh06ejcuJ0UJfnrVn+IX9rihwePthVAX3882x
         PsyhX0Bpo38t3u+hpI92U1cHWbmVuFMkKS7sutzsEfWb/xg6RMNCwov4cXdE50jLjMC7
         o3kr7k83DbUvpMll0JoLCmQ0hStNESDhH3Zu6Hbkg5qxOFawOjB2OHO7gH96mri03X3U
         LuMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794587032; x=1795191832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uql1IwsaB/smSAybqhDdELR2T0MP/9M8xw/lDlV6oP4=;
        b=s/LimQViTsm/cmgwJHUORTwa/UYwgWHgiYKiDIrdRAvqTzXraOsZEJMuFCFrHQAnJR
         eBD8meDEvYqXIme2pBdKfF5+aCscakvs+ttpzimU8p8KFpmjJuSn6pm6MGQXpFLMrXqe
         XBo+jD8YJxBdvE1XxscbufmtkjGuJvWZQh+iL3RyNZJHrmdfU4HnpbVJHEGFJxBPY+Vv
         mBYyOSxbGzWBb3wUxP7V75H/40D9G8QjAomsyZTHzveRvP15UEHU+MOdPK/bxyGo9V88
         NvlY/bGjudDgMJPkyHfhr8RVQlKDeUOZ3wrIMDv9ltoiUT9yJK57o8YYuVXiyeNF2qYl
         ukkQ==
X-Forwarded-Encrypted: i=1; AL+hErEakMEt54gnlZtPKjJwKrsPuMAm777ks84KGWQqwHgwK2DW0zAHbhDao6YsEqKKuELYp5pcSYFVIA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+t+xtgfKmIQnrWUFpD1NrhxQxB+Q60VVDLhd22UAvISP5GNpwg
	HcKE35U0ueQPHRFrSaTg5AepuIdWXbI1fy3vPOWGZTqhj/Xx5q1qzJEE
X-Gm-Gg: AYBFou2AC3xV4cRH4QLZKbYsG4yXakZCp7fxblGjmsBRvovFdXH4aLQk+7/Svs+Jkrh
	fCchSDSR4NKNpCxcEPhMMswp8H634KZ/utu/jk1A0SjlXO9qb6MhzYUcWfofLhbn2hsJd66YitU
	CfFA/1p13wiAX+9f9t4oHRTCz9bXEYRSfvT1CHtF0Zng3dETahgE4uX590nltWbiBwITb0KLWja
	Gnbj45skhVsSHTWuatjeK+/Fwel1WcyVsUdo0ehjSBwFEfybjbfLutxBhFCJFmv7bUiC5EyQz6S
	DgZNvCKpqoObihpwx/Axtrf4bHImYsP54+6/FtKc+OSeljMo6ZiLneEfSZeha0Atu61814Qc0Uw
	KxzVd1a6AujP5y+S757rFpHMKbHcXTkZdhgPAvkrrI+USbmG7iA+FAtM0h/TG/etCOtWPMnYr6+
	hV4MSD4iUqFQ20W49WU4X1EH2I+wHEJjOpUaZ3lpTlndLB4gzquz1u7ZAZx0/2rL3cj2O92C/nB
	CW+YsomcFheqlB7/ZkLGYvdBfNW/urihuUCDnUvvyz3kv+WJHRCCDJ9W5/eOTD7B9ssc/OEsPhy
	SATpjMaIJWyWWZRgIkt+NQ==
X-Received: by 2002:a05:600c:4e15:b0:4a2:1612:636e with SMTP id 5b1f17b1804b1-4bb55a4436cmr62229995e9.5.1794587031993;
        Fri, 13 Nov 2026 08:23:51 -0800 (PST)
Received: from fedora ([2a02:168:fe54:0:500c:846b:8abe:fa7a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac1159sm65716205e9.4.2026.11.13.08.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:23:50 -0800 (PST)
From: Cinq Prairie <notprairie@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Stefan Roesch <shr@devkernel.io>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] io_uring/napi: don't end the single NAPI busy poll early on need_resched()
Date: Fri, 13 Nov 2026 17:23:47 +0100
Message-ID: <20261113162347.5617-1-notprairie@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179426098226.155418.4382559329615606121.b4-ty@b4>
References: 
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 09 Nov 2026 14:49:42 -0700, Jens Axboe wrote:
> Applied, thanks!
>
> [1/1] io_uring/napi: don't end the single NAPI busy poll early on need_resched()
>       commit: 39c7210e970200f8b17de3767c73efe64173a95f

Thanks.

On the cond_resched() follow-up: I no longer think it is worth sending.
Since 7dadeaa6e851 ("sched: Further restrict the preemption modes") in
v7.0, PREEMPT_NONE/PREEMPT_VOLUNTARY can't be selected on archs with
lazy preemption (x86, arm64, ...), so CONFIG_PREEMPTION is always set
there and cond_resched() compiles to a no-op. On those kernels the
need_resched() break in __napi_busy_loop() is already followed by a
preempt_enable() that reschedules, so a yield between laps wouldn't
add anything but a dead cond_resched() call while they are actively
being removed tree-wide.

Unless you'd like it for the few architectures still able to build
PREEMPT_VOLUNTARY, I'll leave it there.
