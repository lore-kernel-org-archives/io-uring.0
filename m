Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793813134;
	b=R/iCsSZKQmVBk4fBHQFgxviYsJZImGrsB1NvrXDk1e6GGX5OC0v9LmKbOAE1a6R1wv1t
	 ebrBGuhxkc/O1aR6f02PncrFo+DDXiSyIS9YcfJ6OZUEFifHKVwHHrMmEYPPIseDTm2ht
	 6V//inuoRFv3ZBz03KTexBOskvAtPE8xxjanzr799Yb2O33Ow26Qavhm6aipXvPGOMNgr
	 ZRMK9CFly///fEqAXNHFyGyFYfILbJwS0hiujbz09XM383JcONnxfB29sO1JOLVM4tKmW
	 rGgNGTASdXaCvaLeHjHCCC973e6tyZj+Ny1B/jQBalgk/lFJrSUdnXHDIarcCULJ0aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793813134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=JR9FR7Y8ZGIM/Kx586GDDxG8hubel43MCCYiHjjhwQc=;
	b=4DqEXWd8ic35pz3JLKydcxcj9N+ysjXbh1l1661Sdvdvy5+ZC/n7xOsmxsvfTjLSSIkF
	 4ooeKZWLVdcsTg1CFpuBnLXmZwfGlOSKv1dnjfFELwTdA5X2G91eKldHF2y4YBi6Q5lJK
	 rbuB6PauvbhywOUSBcCC8AVF4tBQHgt+bkOobd/b/mjsLPWNYYjLfZIygU+leRFHff364
	 wF5kei06wB0J84d7B4l1lgwdAMtKSFIVYazl/nS8jenjLmgN2/MyQIZypYWK18XmLvDAf
	 WeJpJyio1rSPfv901rq2tohzEHa/JWoN2DilD/tw7H/BW0HINFgUgj484jN8j2Vx1YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NCGyZFH2;
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE375606A32D
	for <io-uring@vger.kernel.org>; Wed,  4 Nov 2026 17:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE375606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NCGyZFH2
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4a89b4a59a1so1616516fac.1
        for <io-uring@vger.kernel.org>; Wed, 04 Nov 2026 09:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793813132; x=1794417932; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JR9FR7Y8ZGIM/Kx586GDDxG8hubel43MCCYiHjjhwQc=;
        b=NCGyZFH2OA5UEgQGPZeCcVQnIxXDqUKyCRP8vcTEEjFX8UIJgPxXKWQl3TC8FiHyNl
         G5t+7XlvglJwVoIAVubQAw9fnMlTFXrGdXNHoV103fff2zlMD8Gsg+Yk0AjWjCSlfcxS
         RG/u+z1rcQLchR8mnITnmChHIgVGYeeSN6TKktGvd5wV/IMtFc6Bp6ariSgCaAXqdCf/
         dJ+BkUrRBLn7hNDnjTYu6j/12twMRpkOiJQQHTWDWH+oOaOeAr3Mwluga5UEVfqTLLg2
         vTYHKBGp5slMNzzoAwIZ3TZISOxOfcHoAp6JUasw6FidWAPe7V/ZEAQsbWHAQVnj/c7M
         gAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793813132; x=1794417932;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JR9FR7Y8ZGIM/Kx586GDDxG8hubel43MCCYiHjjhwQc=;
        b=jZTEybUXXOp0G/dKGd5DsxnTL7xjgRczgSM+RWmnHN/A+t9kAGWR0XasLhkp9MtU5W
         sdjAvhYsjXahYURqfsF4Qp0pJbhVlaNu8XZlvaqVcFZET3KRDzOxtsfVfeIAmRfq3y55
         dU0aGuq8EyrFcUv586anMm6YiXm3G5vPULQBMzumnMSuDTFzXJSnoHxuLlSepV5NGZlr
         XjaQVsn7ZGnRAMAiVC3Tit44ocDdrnBMsKjXfCHrQplH2y2VoacjG9F87iCiPOE0dXwd
         FnWc3POBZSU09u54qMsEVMj7tluoMF3LrQflTiegFsCPmKlshTq9sfZP/ZfXnrXIR389
         1J7Q==
X-Gm-Message-State: APuU4Z/R5cFzViWh1ZdUi5dqc8RfgeDpczFHYfmXQsu/KLDZmMsTWWR6
	EvSfbyqLBhSBIC3lyyW0mdJzBD7klg5K3KLRGJftZExEF1tiNqvvnIkdN83c1oT0hX+d/HKc80o
	gFTxlfi0=
X-Gm-Gg: AYBFou17l0noYftDwQvZjsMbrrfcb1TE1FUAPTyTSRklvoefeD31dusJBymRsfHkbJG
	U2teRGbSQTnwRe0XAG1XvzlI91ax0H02Nsu5v2QCEyDmTEHCQF1gyxue35rFpbtPt67n/v8Fgud
	bFAvu6Ugb++/CtIYpWSLvUuggSs9u4R5W8FPPP2NqZhg1VkykuvaLjp7njb8PerxdkDwsqwoD0J
	EImlIeIDypsCHCtWqRmTEH0UQCFOck8eU+xo3LYTqMKI/+QnIv8sxZIEgj6HpTsl2yy37Qu2G6V
	TFPpxzLfzRBDwzQycfVjqX3B1i1mYrBPKfqClhfJmu+jt9+/ZdOypJhVrxJBiW2rKpysfTBXuJc
	2buRZy+oChMRGpXuzQVeyMU+HYU/kx+t8kApADlVdE/9AGiZDhYIec1SAQyg3MOGtEa6vyeO1xy
	GMC7y+N/ctOVr1r8K5GSuRQ1KozG/wU1kF/4uZdH9YNzknMLsQgUf1pV3GJGDBQaLEqKVTrfI1o
	ESC4eYhmB2S7HvRUHZSpFjYn1BjLaiWw1dqHWDhTrn4+Wo9JGtUCxFOPZH9klInYlTxpPj1VbUj
	PiQfj0EvrXzMPZjOJbGCbuf6rDzv4rZmyFBB9SIDu6bgzdYww/LVYDv4y8Wr7EtVFKKANUUJf4o
	K86PD5cC2DxM=
X-Received: by 2002:a05:6808:bc5:b0:55c:88c:dbf0 with SMTP id 5614622812f47-567be5fc06bmr85940b6e.28.1793813131875;
        Wed, 04 Nov 2026 09:25:31 -0800 (PST)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567ab6a5270sm1979485b6e.0.2026.11.04.09.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:25:30 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: =?utf-8?q?Orkun_Emin_Sar=C4=B1?= <sariorkunemin@gmail.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261104-io-uring-wait-inflight-v2-1-f38f29fe8018@gmail.com>
References: <20261104-io-uring-wait-inflight-v2-1-f38f29fe8018@gmail.com>
Subject: Re: [PATCH v2] io_uring: only wait for in-flight requests if the
 closing task uses the ring
Message-Id: <179381312996.4111762.12728825247345389604.b4-ty@b4>
Date: Wed, 04 Nov 2026 10:25:29 -0700
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
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2


On Wed, 04 Nov 2026 19:51:42 +0300, Orkun Emin Sarı wrote:
> Since commit 13d3783a55b7 ("io_uring: wait for in-flight requests on
> ring release"), the task dropping the last reference to a ring waits
> for every request on it to complete. A process that only received the
> ring fd, e.g. over a UNIX socket, can then block in close(2) on
> requests owned by other tasks, such as a read from an unresponsive
> FUSE server.
> 
> [...]

Applied, thanks!

[1/1] io_uring: only wait for in-flight requests if the closing task uses the ring
      commit: cf6542493e35ab9e72ac07da10a178ac78db5a16

Best regards,
-- 
Jens Axboe



