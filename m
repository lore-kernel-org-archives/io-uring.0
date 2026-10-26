Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793038400;
	b=inYNFbbWtn5AES1I+wSNKImKYG04BZ4FPdLBF9hzldmRIglWrQ3QQehdY5eM0C8iDGzi
	 MFxizhoz9Yst5dL1N17/GB0iN0a9GF33vtmY71v8/ZpBDdwxaD4QY5Rj4EnWxKNut22Hf
	 HuJUfQ2lqW5WFDuUGDSlEDuYG7k/hxQ1u2aF+RD8TQlUHQryCc9sclBZTh1/HOttpfhv9
	 Sg42PAD1Onu62kIK2mQiFU/I4zHixDzKdKrc8TKUB8xsfMgdNZOzRns3XHK4NG0qqsXip
	 wqJkQeqYeosY6AESAr1papYf53xy4vBM491uxs7/23CxoqyqWdAirZTdZDYu053DqFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793038400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=BGZxAd03i/0YaHod1b+jkyBQpqIXL1mTYVcUoIY96ws=;
	b=NW9ErD1dC328AJPER40RlX2nB4RExacxneERqIm+oOQVgQ3SQXS9NAiN7Ay7xNPM/SYV
	 c1A4+OV8KeYAkeV2/R0chXUlpTJShUJWJqa2S6WChznd27VA12K04bZUzziWZ/FkiQ+sp
	 k/5sjJSCzv/2jy0gHUnESlUvRWupS3ZI2DMlPAPuGawcWRMNtSkkbGpVxfnkvP1y1uxZR
	 E6MOLCYTuvwswpu3zz7mUsfg9v1ekgLeZ8ibjJuTY2zDInVE0+FTM0jZYSSIzZ/bFaon+
	 wbn7exGeGDlFZ6NJuZ9TcIBFqhxal09QXEXv/Yq/NOtUXsA2b7qLFpFi/1bSBM0khRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=mIc9FYhy;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02291606A31F
	for <io-uring@vger.kernel.org>; Mon, 26 Oct 2026 18:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02291606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=mIc9FYhy
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1931ff67a29so1465357c88.1
        for <io-uring@vger.kernel.org>; Mon, 26 Oct 2026 11:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1793038398; x=1793643198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BGZxAd03i/0YaHod1b+jkyBQpqIXL1mTYVcUoIY96ws=;
        b=mIc9FYhyzWaYR5N6/tWYI0RadP0uQbgwAcPY2pWU7GWToD+eIc6TXd26yUsExZMw5/
         N9NS8qYKOQVKGBcTyGnSJst2lhOIrNU8SorUNxHJ7kzbcVftxGo4VAsLRwLqMSUuo/jh
         jz2OZuaQnCwVaqxAyLpTHxilf4yAxcVZeME2NuM09dUkjKuIOkeHKyb+luIWhqt0ukG6
         E2MCyWnUgwWl5ld6CYwDXPyfsImc0TvJrKIWjNQbYBbtnUNPBcAbuGLWwcoysd2l2eIX
         qh/9zx4XItyYJ+Flsdt1zCKsZVjdkb08FJe+gaBy2fTiDhitJzwuRRLwQJQ2ydE8j9JP
         ZvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793038398; x=1793643198;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BGZxAd03i/0YaHod1b+jkyBQpqIXL1mTYVcUoIY96ws=;
        b=KzlRI7YGht+bsgBUKuyhJ3yix+ezqBFAXkRSTpHS47DW0FOoTNVXpPI4qTZwcomaYl
         +QBWURUfQOmRYXpNKGJpT0kpc2PcwVJ+iuid+dLOCt7NycP6Hp6OWAHchntuTdKmqJpy
         HNZLoqUZHdfiqfmVsJhfGZK5SRy/+V48WjwL87f/1bOxVPUNLP0UWi20qOO7g17V9j3I
         WOCpcwsp1YIKQTuCKgCrCOmgtAmtka06sGMaiqINiWXUo+/9t6+e/65dTWUtjhZxk+Sg
         cWFaze+Zia04wMq1jnyEHePsvxUH8AE4fKXF84/Xhl02E629+RINsc9ltDkh0y+GigOM
         aWTQ==
X-Gm-Message-State: AFq9FYLQEaKTUuHtJ1M4V5+UuYfSVM4+WGOQXdCtR/1lyFNzA6DhskQV
	WaRIV8BBf8MLhZETSsAQOfXQ+DO0Yd3kKsYc6yRoHLnFco6+HOtMhZ8bQqr/SN7s+yY=
X-Gm-Gg: AYBFou21fAz3/DdDw+al2BbnDfNOwyGNPWYTRZeMi9AqwuZRv5KcYtAMXL56VpOcDCX
	xYLfy/4iJ0L2dmvCY0xf9xoG2ejDLwe8GgbdCeX/MguNnFvWQNDmgoadokcFyDHRed6pbM/yO08
	y5p6gVwvx/WZmElbsmL5ITOErL52fRjo3GZYj52KN+03xoeeWl991r6V2kWgyY2zCpB5q4/g4qE
	Jm8HRBk0pgHSNzSmCTNdsUN6y5nWR+IGiOsiyKX/138ATWFmlQLpB+BXPMdXeP8z3pSHLp++HZc
	/ZR05N6++cFKcFyTTJbtFNItsFpZm2FSpDyvhfbYNVSeXT18BHMUkY/iZ5U2rUq2/G+J8K84G4W
	C8FfIDgOHBaMK8/gqJGtsQdedr4KrWP5dNsc1tHeZlCwwtpEvD554mafrnFu9ru1b49476dwD4C
	/RkGlD2X3PwR3zqzXyxSSJMg766Di9TMrATMKDqVt2L5mAvFSYLAdAaoJTIo8EAtJitgxZe8rTL
	Fxe6x9RUJCTvth/3YTl1bha9yq5Epyovg4+l/gMMOqA24nGRo3aYFyScF0zYEu80cBaRar/OYp1
	Yg+1JxtqKAzhvrswqARvgTJpkIpK92bHzhsLDJQ=
X-Received: by 2002:a05:7023:885:b0:16e:6e3:9a9f with SMTP id a92af1059eb24-1993639e6efmr13695821c88.34.1793038397474;
        Mon, 26 Oct 2026 11:13:17 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee5asm23576455c88.8.2026.10.26.11.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:13:16 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org, Yichong Chen <chenyichong@uniontech.com>
Cc: linux-kernel@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>, 
 Josef Bacik <josef@toxicpanda.com>
In-Reply-To: <20261023091711.83481-1-chenyichong@uniontech.com>
References: <20261023091711.83481-1-chenyichong@uniontech.com>
Subject: Re: [PATCH] io_uring/kbuf: advance head when a pickup empties the
 buffer ring
Message-Id: <179303839621.792754.2729531624854221506.b4-ty@b4>
Date: Mon, 26 Oct 2026 12:13:16 -0600
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


On Fri, 23 Oct 2026 17:17:11 +0800, Yichong Chen wrote:
> io_ring_buffers_peek() flags the request with REQ_F_BL_EMPTY if the
> buffers it picked were the last ones available, comparing head to tail.
> When the loop breaks because max_len was exhausted the buffer was picked,
> but head is left pointing at it, so the flag isn't set if it was the last
> buffer. A bundle receive then retries, finds no buffer, and the request,
> which has received data, is marked as failed on account of the -ENOBUFS.
> That severs a link, and ends a multishot.
> 
> [...]

Applied, thanks!

[1/1] io_uring/kbuf: advance head when a pickup empties the buffer ring
      commit: 8742f4b5a472c347fe568a73468a2d9e4d630b33

Best regards,
-- 
Jens Axboe



