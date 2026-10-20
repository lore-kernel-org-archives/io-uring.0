Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792507102;
	b=rXLOtQQEZA4CtneJVuzZydo96tDrU+1xIvPDkrSy70bRFR92pLGjW0/eHmILAFTSShc5
	 ZR+iEsT7hArvTzesgRmmunGb6lSSvZnL3xeTmuQlbSWAwd7wVwKlpmBwA9Xi5hxWKfli6
	 7jzmrIGq3CpcCrWD3jDfI+LCVKMJzv8xkmgPqCb3bQX+qbV7Y3A5m7e2cdHREHJxXwxsz
	 8WRJ69l2MazL9EK9QbOPYxhrpWn0nLPu3p2awUCyF5DByMfkCdgSwg5TYlaVeCdLabsLb
	 BrHBsrzq6Nco2YwCrcKzmU9XBH7MozQhTdDHr0UQtq+ProPj8t0/uTd6CoV5zRJvCPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792507102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=Ydds0wfIIdkgoDQLLGcqP7OMvBg/Q29sYJtmtfAyW88=;
	b=Olw5XF3ho2zU6nEcxWCapKlRVCuEWbJcOF6QWDQhzBPV0wZ1Ywk/epbX+4xw+O4wX9x2
	 RP3MNvqkBxW1NuAFzDLy9r3fd/3ZyLmiQ64l8aREHEPEGFeAmuYThKzCPzwhpra7PZHck
	 3U7+bbvOyL+3mTXZBDU50K6koGnOnqe0KczwcBpGEV0uhrllYc43+f0N3Gz+XAZXTiaR0
	 CNAsiAPGOXa4VEkuJJsr4I2PWGtYUspFDUwz8HVnjd5/yIZM/zVBVF/wclR2vKMKHNPoc
	 K+H0tBQRrosY0pv5OY9YgZyn0tmDkQ2BtkOwVv4RflHM6HEUgCz1Ovhdec+wspHnPZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=m2NZWL5N;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A641606A31B
	for <io-uring@vger.kernel.org>; Tue, 20 Oct 2026 14:38:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A641606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=m2NZWL5N
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1517bda04a0so2794257c88.0
        for <io-uring@vger.kernel.org>; Tue, 20 Oct 2026 07:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792507101; x=1793111901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ydds0wfIIdkgoDQLLGcqP7OMvBg/Q29sYJtmtfAyW88=;
        b=m2NZWL5NjZ2r44cDJg2ObJXAzX8Oq7pwI5/+OjSqY7KwPjqMRunLc7Vhw0EY2b9Hqk
         xjD5bWNFxLECfk3ZmRFjfa9XUgZWC6U2K9+mATCHQCayDCAKzezUqDx8GGaIvpm2kkuL
         HH1fVsLaQ2z0mG10qre2bnVOfZ1AbPvF9mLHeP2dIaF4VPwOOIwlz8QO0puMbf8BeLM0
         b5MJyZ1GtmsDfhCfHMVWCfmknH8dSyYHlXib9RUBtNGz/yK75cTsoJQ7ZyPMitV9wMr4
         Teba6QRNK5aL4RtwtGEm5JGbwjFpd7eE+7w8i8spYh9D0ow3AJzP1UwopyiEzRwbLB+k
         6mCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792507101; x=1793111901;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ydds0wfIIdkgoDQLLGcqP7OMvBg/Q29sYJtmtfAyW88=;
        b=C+WfV9+5e5lHTgWxe15Rx0J9lLEC4UzGD+Tjmy+OJG1ZiM3GNKLlQSCj1wuCfblOVy
         m6NECCx/6YSr4vngYFBgOH970pkb55+kDsVyi350uMafX2x/oVPfZ5r7NVjqRIn2JjAW
         E37qchsJ3omwj6dAl9ets5/LraY75hNMEnrSXxKAIIHTXOZU6jKGNwhL58P2bmeubGUv
         ZTDqd2Ocix/oSLdTV5XcWKklMYyfEY9m0Hz7GZSRwjckg726HDp6pGNLjVSQLgryH2W2
         whgnnzhPEZpQa+3/3C0r8OMFBb1KWXTqBmpT+slNDpM7kul8RHn9WP0DJmZ38/JQb/KK
         H+hw==
X-Forwarded-Encrypted: i=1; AKwUvBwI2D1Jqj3jht+gQPoZPbxVq8iRqOaC+Z+y49tOYdGGBauIeE5S1D6kHVC6pxttFcOFSM3t1UQvIg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLqtozhzD76sKVi6Knb5QbcT+KyyszsStj3CKz0W0L4/5TB+b/L
	zl41klx9tYFQq++he/YWNmLw/1vS+A2e8w8UPdKX0kzMCNK8Moa9L47/A3q/HY3ZwBZPRY3QsmU
	iRvU+z1w=
X-Gm-Gg: AYBFou1oYRQZfhzFLBYoNYnbx9+XpNGPYph+JYryxOQX7XwuD9mUmHxRUVxuzKjR5vq
	R7UY5+hBIj5s3Yak1gZWeXC8kY2EtGW4tL6xUvVjZq8jgtt1PvB305NzduWPDGmmqAY+Z2C/DzP
	ua2k+sxiZ84HhhUWzA4wgsT6zxQLxxqaav35MrRV4g33wwjbiToPUW+D9cD7eyeIeyBKel4MLhn
	sgYehuLPa7F0L81R5RIAYEAN/r47bGGR6JtEMQA4UjUAtgcPJKmYz8PLkfT0R+qF990nhNDI15n
	4Wn4nw2abjheNX/zjOh7Zbclf1xOvdymSsOn4R/lvJ3gZqWmVKDs4/WVx0t7g3wplsSC1RIG+HB
	AawIv4n5y+BK51HgtCQFO57KzEnR4fqzBl3FA4Dr1KmgLJwtj8jpQYSCd+lKKFatQ/CwNYNyc14
	oZg20u+eDU2DUW82YxSB+scY1yX63PWVFAGuZSdU7y2fZi7BrssHXcVjqV6EOyvUu9T3it47Auy
	HXDxu2nqbV+yDHSpZ5evjhAXNcmUjtug9qUt6OVwxcOfpkCeUQ5bAHcOujHnr0RxRoUd+YVF20=
X-Received: by 2002:a05:701b:420e:20b0:144:c123:4036 with SMTP id a92af1059eb24-185134dd5f7mr15402776c88.35.1792507100657;
        Tue, 20 Oct 2026 07:38:20 -0700 (PDT)
Received: from xps16.local ([155.98.132.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082f7f6e0sm46679675eec.27.2026.10.20.07.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:38:19 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Austin Schuh <austin.linux@gmail.com>
Cc: peterz@infradead.org, io-uring@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261019231243.802569-1-austin.linux@gmail.com>
References: <20261019231243.802569-1-austin.linux@gmail.com>
Subject: Re: [PATCH] io_uring/futex: return a wait's data to the cache when
 it fails to arm
Message-Id: <179250709922.3332995.6640113026967245594.b4-ty@b4>
Date: Tue, 20 Oct 2026 08:38:19 -0600
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Mon, 19 Oct 2026 16:12:43 -0700, Austin Schuh wrote:
> io_futex_wait() takes its io_futex_data from ctx->futex_cache, and a
> completed wait gives it back in io_futex_complete().  A wait that fails
> to arm kfree()s it instead.
> 
> The usual failure is -EAGAIN from futex_wait_setup(): the futex word no
> longer holds the expected value.  That is routine for a waiter that
> re-arms with the value it last read, since the word changes whenever
> there is something to wake for.  Each such failure takes an object out
> of the cache for good, so the cache drains and from then on waits
> allocate.
> 
> [...]

Applied, thanks!

[1/1] io_uring/futex: return a wait's data to the cache when it fails to arm
      commit: 02caa5922184e99da04b37fd3336066625ea8e2e

Best regards,
-- 
Jens Axboe



