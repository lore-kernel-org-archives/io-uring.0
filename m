Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898613;
	b=EOEMDy9wK68FiQCnaJqu6Q8D+DYtwTz9Q3CVtvQvmDmKW91CVIQaHtEn9bCP1GK6ZXTx
	 Vpulq2Nsuf9MGdkG8eaojCLtc568ILrciTOjiIRIKzVnB6y/E4izoXqzw29Ot1E0FiWe8
	 sM2pQlpqHKU81OnwlzzvZqR0nm/2bVQ3z2i3ZzcvgGCIDPxU7Hk1PrGakrbn35RJG25Vi
	 TzwThH0OFPgFVADA5tJjURNe+DQtPdp/JlfqQdTG4EEBjsEsYGK5pdk59izrp3TskIhCT
	 ynRsRijmDDJ/LZtfqNoKqjs5+XG0AgYZMHeo+MUajT+JECXE6/ijuCboTqYBIxEbL9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Tg2aVX/fsHYcOtjwdgzppnsVVZWuPIkX3ZOv1oi3AEs=;
	b=0ROECK43Rk84BgtuCoj1fyxN+MzLpBhwaIAesCqut6QzvG9HA+Rff+9JsWb5EP6jCsnN
	 42WfbgEsMIpQ7w3Vp08T1mIi9+EmD4pgB/K3m6mLdw7X/lfx10EfYqyX/meeMOmFb5zV2
	 wTadWEzSOXuxIZ3iRy8ujPDxip5NAuuMFGCiOX3sKSiquTAPSSs63+m4MQL+zDC063hYv
	 Om+hTWpPQ/psO9AO/NrbyhMgN0BAR7jIDFx8REkvOPnRB/oNphXOrITkWwiwXjAl0Kt2E
	 b0WuBbp1gl7RWo5qBx5ocPDwVJSq6mbfB0oR6v1A+23eixwJynFx/lVBCW2Gle9yQNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=LtPG7PQm;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A1D606A31F
	for <io-uring@vger.kernel.org>; Sun, 25 Oct 2026 03:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21A1D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=LtPG7PQm
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-156cbe59622so1282762c88.0
        for <io-uring@vger.kernel.org>; Sat, 24 Oct 2026 20:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792898611; x=1793503411; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tg2aVX/fsHYcOtjwdgzppnsVVZWuPIkX3ZOv1oi3AEs=;
        b=LtPG7PQmFYnamYcvAMmtqKk5Gls+3mQidrCDZDU1V7q+raihxD55VrAEPAAmNSR1Il
         OZLyu3scNvi690202ZBIp7rP4p4Y0wbAUxKkOnllrBA1d9j3CUtjRsChIFpAb5a8ot++
         SvRjyNM6Md4hz5xgwmYCTA+E/t9x0xZyld0eRObLxnmi6DFgPMjOxrlt93vvkCQyQNbv
         42ePX4esfIl4w5CmI+TKPGTII6Evcm5T6IKblhlgPBgdWf3Q74GZG3oRwJQey89NGQaL
         Ezeu9AHp/QRUbYBm/aBkVjfV7ocULTN88GsYg6Q9zSrAagiqYxVdUJb0zPCQKHBoVEOV
         CAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898611; x=1793503411;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tg2aVX/fsHYcOtjwdgzppnsVVZWuPIkX3ZOv1oi3AEs=;
        b=M43UT1U9yvVGJNk7xA+59De4pNbHyf+sZq8NUn9XVe85XE3w6NeXhMQ5Yh08cZNUSF
         7xmBuQEJmYiHSTNWnuZi+K3BT2iVNgOlB9l+oRaPiKHKbABx0Mho0RsTPhBMMwJ2N/2K
         BZpkW3rI1E6Kzk079lGlb4Zfb0mu8JDzgklF+CAZvDWwEoZWEBaw8XyMKDKtn1psyVDZ
         BXVls8llB1yrkkay7fANnZmq9PZ4GeyXGLUTWddb1oup0sXUYlgSxd6wX/c4CE2PD+PR
         Lf8GtImzHp0VeZuO25pz7bRWJPjqgjTFAPA7Rk5xega/3J/pIJ0HO7tGI0SXI6TTHXM+
         Xo/w==
X-Forwarded-Encrypted: i=1; AKwUvBxnRD5ukZKSE2BRrdhdvcTkxjMHLcbODqABfb/ttpiMTOqa/h0UKIm2auv82FHXvutrMj++S4qlHA==@vger.kernel.org
X-Gm-Message-State: AFq9FYItwrKqGCd6hRSturyI3RaqYLhkinHCAsCSavttUZXlSE7b5yHU
	aQUjVPpRk/RuMkCJWcvw3iJ5dGIIHBTPBw+4J4WIFsSkfcYE7MXjogahmeSZsNAp5JA=
X-Gm-Gg: AYBFou3cdn64NRSe0E3O8Qapn4gG7e7i/V4XDcLv1gTYLsLtQHDM4ar/CkOTtq1AXGC
	+kwJBmDodH0MYwDVVhk0pyOQvO/Lj6Fhf2lSCn/hPavCj+dDHHaCGs6mSVhMR7LQwvhSYK25JkV
	pKUgxvGaA6rHf5PgurTShK3S9072b9yrzw0OCtqP0eNrehFmeuP9M20rCCXWLhTp2wwODlprIUY
	q07HRPxbW3LZSFYFbGGGwX6CPPmT3C2Rm8dIiA8eAKt+8MJodbKvTKSxaXtkgppSTZyqqvZtq3Q
	kj55UUdEX3GNpBbPd2cZ0WkzIQvx63rP2o/uHiIMwIPDARlKUZjf0NT99fy+t10wgWnoLuA8B+o
	Ro5/RYSuFQ0gKVfVIjVqfdUmaUrjpZDxhdFURNcA+v5IE8IocrTSxf2dwi4qpMqHv+TXFvgx2Ec
	29ElLYUDLesbXmyeIVcQCpHkElGAZaBuuSj9GYIrbxN1IKlvXHC24DMVM5sNwbMUSg1RaDJLC66
	Cj0PzTIqeOWnXlujbCkBrXQg9b1tmo8i0TKTqjYa8KosTu3H0dieAfzQWqlyBCEzGD9wRouxFMU
	JsIRF5V/VV/vhP8T2lYwkZpTDWMnjH4/DnAoqJU=
X-Received: by 2002:a05:7022:7e8b:b0:16a:1fa:58cb with SMTP id a92af1059eb24-199290fe419mr5187678c88.1.1792898611030;
        Sat, 24 Oct 2026 20:23:31 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a249c331sm26808459c88.17.2026.10.24.20.23.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2026 20:23:30 -0700 (PDT)
Message-ID: <9c1cd77b-8a00-49c8-b3c6-625c0ecc6694@kernel.dk>
Date: Sat, 24 Oct 2026 21:23:29 -0600
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
Subject: Re: [PATCH 0/2] io_uring/cancel: futex and waitid cancel results
To: agxr <agxr@disroot.org>, io-uring@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
References: <20261024163259.19372-1-agxr@disroot.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261024163259.19372-1-agxr@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/24/26 10:31 AM, agxr wrote:
> io_futex_cancel() and io_waitid_cancel() return the number of requests
> they canceled, where the rest of what io_try_cancel() calls returns 0.
> Commit c74193430feb ("io_uring/timeout: don't end a linked timeout with
> 1") took care of what that did to a linked timeout.
> 
> liburing's futex, waitid, io-cancel, sync-cancel, poll-cancel-all,
> cancel-race, futex-kill, link-timeout, timeout and poll-cancel tests
> pass on both patched kernels. Unchanged liburing tests pass with patch
> 1 and fail with patch 2, where they check for the 1.
> 
> agxr (2):
>   io_uring/cancel: count all canceled futex and waitid requests on
>     CANCEL_ALL
>   io_uring/cancel: complete single futex or waitid cancel with 0
> 
>  io_uring/cancel.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

I'll take a look at these - but please note, that:

Signed-off-by: agxr <agxr@disroot.org>

is not going to be adequate for the kernel, we generally ask for
a known identity. That's either a real name or at least a well
known identity, above is neither of those.

-- 
Jens Axboe

