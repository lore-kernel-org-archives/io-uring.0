Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5773654652
	for <io-uring@vger.kernel.org>; Tue, 21 Jul 2026 16:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784651566; cv=none; b=nTsAWH+c57qw0nUfV52Zx4fb4wlhxKS/KmN1TeBdXRRpAk/c1XwCFgLh8fVpwp7wlize5tj4l7JpVNmDY2SwdA4ueheuv7ehe72JbBwpyAVJtcvWRBlfP/lPnEQaFHGQX73R5eGvR8YIgO60MoqzCqH7YWBENaPH7WeMv81jPBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784651566; c=relaxed/simple;
	bh=Msz7oGLz9AN+Vg8OFMcpMiKDVuyHP7UmepaAfxdBwlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dwk6YnXX8gLVMT/I9YBbtKrZa6h4XphbdQD60aobEbLNetAdZRH88nl7A8aUKNZH58KF3X5iHQdm7BiHuQSfWgMAfiqAx24gCSj1DQQZX6yi7qaTQVEmddAYCAsZhhrsxbpIpXjmsyTHlfoGL6Qzhf0JALtyZy7rRlwJ8nR8GdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=HwybwX8n; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="HwybwX8n"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-497deab2d66so3933598b6e.0
        for <io-uring@vger.kernel.org>; Tue, 21 Jul 2026 09:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1784651562; x=1785256362; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NTLPirVG/CLQA0bXx9MKJ/pka9/uC41PRvcgEwABcW8=;
        b=HwybwX8nkUrnDQFPtEkeJ+RCMkbVnnKNESQ573E47044HJPpjAu+JUlPHI5i3dVuPc
         uZEtvl9M305a1cQ9i4j4jrRMTxxKhM78xZCJqjWIA1LPmlQdWJoRVanujejkNcCfl3i1
         YDI8rQWF+zU+n0fTSx1rIfUAdbjnT6cFINTuJ/bOoJSojX/jUd9Wudj3FRA7C64vFqaa
         YqS1FLepB2ETSK7UgysRE37jpp8S3omO6vv0Y6tSWfj/KrREFpgdNpIPVTh9mYGJVjZk
         ROfR5J8mOOC7FSH9xXVQy350CmS4oZ4EsrWh2kVKF7mbUWVIuoQh6drtTyEV4JIqx2DK
         SwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784651562; x=1785256362;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NTLPirVG/CLQA0bXx9MKJ/pka9/uC41PRvcgEwABcW8=;
        b=TlKoz0AF2ty2+1Dpdq5ahOnoboF1i3NIfAATRn8RqfSIpti/9g3laCJVn3kZTCZ88A
         RjQqGtECWFu9MmXcXMX+o1Bu7flXTgumzZRqWcrwt97YhWAS6ot+5CkdY9qqxBPS6ko2
         J2gwu/D+CRGxtdBMow9hKMp/Fnewc4+d2kte3nI4Xyb4gUR8Q50YU4dRq2ztuPR6MsuE
         oPao874JYAWAOTeAc5pD5qmOFOObwZnqs9xZAcxiCsMy7+hsQ/iUYNBOdQ0/z5FgevQg
         EEHB7ERikGhUdHfpNT1WAgWtM2qRN6Dbd3a/nNupRl5vvnnKjCtLBj+T7GehvNVELeGf
         fjGQ==
X-Forwarded-Encrypted: i=1; AHgh+RoGC3VBtI2034w2T5cNQJCL2IG67J+I3yIpXs1l1Q1BTcClVFX38hPzAORPRkwigIxEUJiUwKk+Rw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0CI1dgL8VGDdVq3GyDQd15dS7cFppkkO4wD6d1vCrQ39ahLYv
	hmmvpl9wCKwjReDspkeVLIOsTB9eQTEp/eZ2oo9zaquuT3oMCV9bIMiUKllEJaj+Twg=
X-Gm-Gg: AfdE7cksq69RovnljYV4/DJuy6stHvh0qw2AYCnXRVBsHHz9qffJW4GM/ld2XWvG6yj
	66jYBB1OHPIArlXF4x3HAnhasP6jEzdi2sMO1+b+88gFBnaTGeVj8BV0O9T5oBOK91o1r6ZFAPu
	w2DTBsuFarKBGgyGmwqGSyrM82Sz6VNCj2ze4VsczANTSt+KkaV8ouCp+h9x1xSQARFpEJfvoxv
	C9HG9zXf15yuqLCFpxm6q7u9/QBGMf4ta2h6GgcokziHPc9N/oS3MGT0TA2mVUmxYmyYBOKTKZj
	T8o5+lHh+OC8BsnMRS5lNl9TsSppZaVDgt61j7QT3fYAKs1h7VxbTtT/4Sn8k5a8brB7PfMCvBR
	iAYeFUHVZFHraCtM3Eg7D1d+5CVNmvWZz/uIILH1cIv6ukSrqZHHXfbEuaoivy8Ql/9Ildjkj1z
	aMPXT3kxCbR33av+Xz7SAeUNXubKBsdSvBU8eIr/SI6ifvwMM1hgcJvsbYQEAS/YsW60sYAw==
X-Received: by 2002:a05:6808:2227:b0:49b:24f9:c024 with SMTP id 5614622812f47-4aaaa25e74amr168851b6e.5.1784651562239;
        Tue, 21 Jul 2026 09:32:42 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a4d3cb030esm10015455b6e.12.2026.07.21.09.32.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 09:32:41 -0700 (PDT)
Message-ID: <a493a932-46e8-4253-81f9-2c849c7b2ff8@kernel.dk>
Date: Tue, 21 Jul 2026 10:32:40 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/rw: fix missing ERESTARTSYS conversion in read
 paths
To: Yitang Yang <yi1tang.yang@gmail.com>
Cc: krisman@suse.de, io-uring@vger.kernel.org
References: <20260720114116.21830-1-yi1tang.yang@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260720114116.21830-1-yi1tang.yang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/20/26 5:41 AM, Yitang Yang wrote:
> Both read and write may receive internal restart error codes from
> the filesystem layer and should be converted to -EINTR. However,
> when multishot read support was added, the error code normalization
> was lost for both io_read() and io_read_mshot().
> 
> Extract the conversion into io_fixup_restart_res() and apply it
> in all three locations: io_rw_done(), io_read(), and io_read_mshot().

How was this found? Reason I ask is that I wonder if this is even
necessary in the first place. If you found this because of an issue
you ran into, then that answers that question clearly (yes we need it).
But if this some LLM find, then that's an entirely different story.

-- 
Jens Axboe

