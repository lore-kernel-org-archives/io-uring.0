Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794574413;
	b=Rrthng6LSEBDaSeRdavoOqBihmqCjJUGlVI5RKo8pS2NEj+KYtBo30KjE3WHtMQLBXN1
	 iJD2YLG3YB0n0goAOVhcik44si6Ujm9gYdT7h2RpTfEMtED1qkBPwW+YhM3BJvTbeEhFI
	 jsaxHSDV46pJ1KnNIaC4ptQ4BWtjBR7YsrKvoDYuF1PFcoQWiHuFoVjNO9vEznlAzpvBk
	 aunU4q3OIEi8omLkYpavUzz/qN8XgmbJlVxjF1k9VEYo2/kShYxu9IUDt52U4y3V84lEW
	 r938oATtmM2srUTPPXk9scgGnFvpBzSZNDcWHBQaxP5fsu/llyxFSeETW6XBseFARRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Content-Language:To:Cc:From:Subject:
	 Content-Type:Content-Transfer-Encoding;
	bh=25HiqHgkRVYOb5fWLdeo8mgsm2JsQB3y5C+/v9sRxns=;
	b=Kv2eVJau9Htg07lHiYL3GM6ngZQT9BheSWRKK+CMPT2hnr0RaY0ZHEAcWHxJBoiyhZGM
	 gyqGbTVdY0bqxNN5j52TUfmqOQzexmmNiDcKaNkOn+RXDhgYBjJi2CUjv64A64qFJsWqR
	 iFtGNVtNMNoRuR4nJnf+1TTUyMD6fCd/mwMrd8LXq+MZ18W5m4UTdhM9MxmqCryAmJkd+
	 xAuJOaKeIYoFSLsk/shQWnOEwvbeOUALuvkrUdWxPChtvghZA9522z/TU6QNLJloCQnYw
	 Ior0lyaqDRJIJze/EEu5zAUDvlgw0Iqb8YX5lgq+Ye0dDALmmNrbzqQEdeCdxrjtiNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=n7rtReBT;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC267606A323
	for <io-uring@vger.kernel.org>; Fri, 13 Nov 2026 12:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC267606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=n7rtReBT
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b244fb7fffso871799c88.1
        for <io-uring@vger.kernel.org>; Fri, 13 Nov 2026 04:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794574410; x=1795179210; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=25HiqHgkRVYOb5fWLdeo8mgsm2JsQB3y5C+/v9sRxns=;
        b=n7rtReBTMiHaN+Kc293rzsQJZRwpjHf65cTrDRjaOziUcvjDx1ICB/61OLgWKQg5ic
         s2kJj3IUBzwW3cqHfPebOI2yD2YTBRbAv6ZXlo+M0nRSaraXDoVJIT1h71/A0stPDAgW
         8XovMBe4+yzahbW3U1cyjnedZWIgmNaZX/xRhd8w/6+lOHddER7ZehIxkzvbos+ipda8
         8Pt2Q7PyWe16M3vtm1aUG23jKj5BO7iD4sLzHOscIEu1WIAdGV+Awod7R4QKKXNfiBEu
         IuIRHtbqdTyGWZY6N7sTV1id/a6Gn52+3a/pwZ4GGdYD0rsr9CUA22avgI9cYL3UkiiV
         IywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574410; x=1795179210;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=25HiqHgkRVYOb5fWLdeo8mgsm2JsQB3y5C+/v9sRxns=;
        b=NdUioRQXKpL1lezGdwGKQeyVvEYg/8LW53lJoZl9eTimZruAQ1mlD9xj7iZwMUZjYy
         /bzLVNjfy8JmTOYEUcBIcNctAad7voJLtLiI+4WXADGbHPKcw2iMW25FNerqQ00PH9Pm
         lLDJ64lwROzwku87iI5wbTvy5cUhUA0u/8REntOxX4bmMf+kO71fsyy4yPkI99itDH9A
         x/b+Ufk1lZO+hmbMR1oFmEgSIlHfb54bzuFj21YAI+eV7IFwBlHKw+W/R3LLQFgLQXSI
         /cFrK/YbacBaIRS9f0r7Wc5UPKAn6gO26U+svUHqx9a0XaYxnaRN/BkTyu35T8zhqfhv
         srAw==
X-Gm-Message-State: APuU4Z/rEIAD89jFvV1IwxqOf92AvLATyvLG1eY6+cQ4Y523CLqybjU7
	kYL8EoLvr58UYtjPdzn4rRstjfb2DGPtOwp/YLIUqIipQK4oyJsSEbcta6NrG1Du080O6iNxjm0
	7ku3EIMU=
X-Gm-Gg: AYBFou1SYUiGsgainOztElenf0Ip18VdJf6/qCmmL5KMxCtE92Ynh7s/Omc/tsr8QcM
	mdmSiVXiEYRkMhkBuS30KaneUzM/ouDBeQB4otgku7ASK/gFobPU/Or91xzIPen4qRo+r07J8Eo
	NLiCHUzuxWmUr+t8Th5C0YP7ly9WZ0TVCnqQZHYgowPfYLmkyBM/iK/YI1eVIiXY/E+EpduwfJo
	nR2x0MtCy8dtiFaaYB2JYSJv/hLi6QWakzm0tDeaTs0Ogg/ufi0lq43o0XtThOSPJE6WbMN/Op3
	tPP5kDDEGMvyiFqjRsenaW+5MSdGB+c/NjW1tVHXbAmxl71xor7i4rJ11oCrllBZ+I3VflVe5lH
	NQPUjjhxJEbN8bL+SGSQcNuItmiEiFIg8LpUOiuFhM2IiEQceelrg2YnHd2HT92WVn0f36vyw8b
	5Gre7fSHIMOTsJ0HRBrSc4EBiuKstfHXbzU5wiKFyno7b12COpciCCejHZl/Es3V42VvnQH5o3+
	T8yjEg2zMueXTGJLwksoVgTH+VaXYeGauT/CKIFaRUX0dqGFXAsNst8ZIY0QvQd3iCFbZoHEuKb
	gSEGPSBgYwNMTRw+2fADPI3U2UvOCG5ThwFcmGUV2o2nXzOydy0BLL47wmpimICfm7qbqzyeE2d
	gnUennLOunPvz
X-Received: by 2002:a05:7022:f905:b0:1a6:53cc:7454 with SMTP id a92af1059eb24-1b50311d32amr2229131c88.27.1794574410317;
        Fri, 13 Nov 2026 04:53:30 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm8678488c88.8.2026.11.13.04.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 04:53:29 -0800 (PST)
Message-ID: <44acf7bd-441b-4852-b92f-d90b58a176d5@kernel.dk>
Date: Fri, 13 Nov 2026 05:53:29 -0700
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
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: io-uring <io-uring@vger.kernel.org>
From: Jens Axboe <axboe@kernel.dk>
Subject: [GIT PULL] io_uring fix for 7.4-rc3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Linus,

Single io_uring fix for this week. This pull request contains:

- Don't end the NAPI busy poll early on need_resched() when a single
  NAPI is registered, as that left the rest of the wait timeout
  sleeping in schedule_hrtimeout() rather than busy polling.

Please pull!


The following changes since commit cf6542493e35ab9e72ac07da10a178ac78db5a16:

  io_uring: only wait for in-flight requests if the closing task uses the ring (2026-11-04 10:25:14 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux tags/io_uring-7.4-20261112

for you to fetch changes up to 39c7210e970200f8b17de3767c73efe64173a95f:

  io_uring/napi: don't end the single NAPI busy poll early on need_resched() (2026-11-09 14:48:18 -0700)

----------------------------------------------------------------
io_uring-7.4-20261112

----------------------------------------------------------------
Cinq Prairie (1):
      io_uring/napi: don't end the single NAPI busy poll early on need_resched()

 io_uring/io_uring.h |  1 +
 io_uring/napi.c     | 31 ++++++++++++++-----------------
 2 files changed, 15 insertions(+), 17 deletions(-)

-- 
Jens Axboe

