Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BF537F8C4
	for <io-uring@vger.kernel.org>; Mon, 31 Aug 2026 23:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788217224; cv=none; b=h1SP/t8OdfusE4aj5dyxAE5G+l0LQXRQYDnb8koLqtS4lKRMQPqcEoh0sNsobcb6qx8D0toB8RFxg0xOlKYv65mQN63DS7gEFJGJVmj0ML0A7Q/8MQmTEdmYCso8G4lh79KrGGa4kfGuPxy68rVz4GvfbNkNQiSMizyFykTO5LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788217224; c=relaxed/simple;
	bh=dvr2ATG+s1MnkZGDuLGYBa2Ow4Nl8oVMxBHVSEzZVzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=owUuMyiD+m/unSn2h83c8dTIUPKlQc0fnJXjDSzYb9T49o1OkqIPuItIOFj96zXFEelH+tlqthg/KqeEW602zTtwysqCISnl3F5xNdAlBUk/5jTjh1xRUUbhBC3DxPLuIUxXiYJO1BHQjuQAZ2Z34wb7oSdZBgcfTArVV0KkaJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=amj4gj7j; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="amj4gj7j"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4af173320f9so159242b6e.2
        for <io-uring@vger.kernel.org>; Mon, 31 Aug 2026 16:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1788217211; x=1788822011; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qlB7ckFtH9A/qdjbPDaBlhw7dKBv8Xyo1HgBq+MosRk=;
        b=amj4gj7j+22uHGdPNLD1fBLeCLV6NSlErdom07UcX6OK4Q3RQwDBQTJmoq2QTfcoIv
         Iotbwo04ak7fJbzd6tx6MkaJLHLltj6F+w4m1jc0Uulozh48B7RXepmM2TxqJ18JJyQB
         /sCyEZroJvVGbVTfMsY0I77O5BJnSsQM+EfZoIq+N/6zOeUFKYzrGxjCgcTr5SrerztG
         H+LtnaGc3D/aU+Or8RrfLdCoVvPcHo+zYOHdwslY1DsKo67Mk0SMN7TfYCYPCgeAEAQo
         7IqF8dU1xPedl0FeV/yrBz3Xvc8/vlA48wNOtt+o0KgkMStO4zXPAmsRXK4zPQJV9Fol
         dOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788217211; x=1788822011;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qlB7ckFtH9A/qdjbPDaBlhw7dKBv8Xyo1HgBq+MosRk=;
        b=O1aSOc83NVr0TJUO9rCUKKvV5N/1WXad90il3huNliAMXErNAdkCudo5gT7/dIpNTR
         EZsTjGelU33gtDRdI5WH0TBDjUqo1zVscSa7asC3QOEObhn2TVbjGIx/NkSfuafl+Qkm
         0BNv30q1ShjLbd7bQAgSJIdjjvY5xr0hiAxWECTB93MCkNi5gHlVWEWwsB8f+CZXSaGw
         PDgzC2STL3ozkq20K43sckevmiU9+SuBnobbq8LWviqPqDhJZRoT+C6o2+2apY7sssiO
         kSA11Uc6Tmixtkf702ck6E+ldcKcTCpNnzNEzF3P0+cfuzEKCt+pjUqT3e45jS5xjmnf
         vXtA==
X-Gm-Message-State: AFuF++l9UAgxbQGVe2Kp+pYP2JYQtGzS5iA12V3JvneaqrtEjA+3YgQz
	ny4IBN4M4f5p2Xj1Wsxnx3o3zx33vi3iE4+UNgQpERg6q8a1+1Kct+4Bx4JCuflWIoTpjZ8Bhci
	Tzoig/zM=
X-Gm-Gg: AR+sD11mi2fBDnH6hVtfXnK5ggdBO0AKI3vcSh6sCaDJCggxvuwnJFC38sErqDxTAyK
	i4pF8QkPRUcWNwhaK/gaWAyX4Pq3k9+xUZT3Mg9zDD/KKQo7GXjRy6YJHfKXKGBpsLL3wAP/rWr
	6dUccdZJRgz/k2ICAXDh5mJw90L/zkppRSAZmR3+iop4Um+MP3UtaaB8qzFA4HuqsIOCjTxdSVq
	EOMsauaAmlbYsz6W9qZHl3yQ1fyoGL9i3L2YGyi9TMdKWr4mwGIL4hihNca1OMQhpsmzySVEBQ/
	o/rYhQZwEvGnuqkEIVO8077OadVFGT/Zvch0C2iejuTpcdfQzVbnhgbhMYbTCNNIaNsBCZBk0d1
	GJ+TdohLnlbM5lP0F/3uxYjAu21pcFU5QL9wneumj+xrm4BvzdivweiypZUiKbCJv73cvYKk7Sj
	gMOLcFXLtLfKfpCZGFej3Uc7yxF5j3/lvh3c9FcRDit6hie+CO1e6mUH8hoxSf6JfpwZMkVamaz
	RdXcB4tqbO46WZqqA==
X-Received: by 2002:a05:6808:250c:b0:495:ff85:d33d with SMTP id 5614622812f47-4b3982a99f4mr26356085b6e.12.1788217211268;
        Mon, 31 Aug 2026 16:00:11 -0700 (PDT)
Received: from [172.19.1.143] ([99.196.128.151])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b3a19949c1sm9650140b6e.10.2026.08.31.16.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 16:00:10 -0700 (PDT)
Message-ID: <626ca0d4-804f-43a0-bdce-d09f366b482e@kernel.dk>
Date: Mon, 31 Aug 2026 17:00:00 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH liburing 2/2] test/iopoll: Fix clang CI build
 failure
To: Gabriel Krisman Bertazi <krisman@suse.de>
Cc: io-uring@vger.kernel.org
References: <20260831155222.121857-1-krisman@suse.de>
 <20260831155222.121857-3-krisman@suse.de>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260831155222.121857-3-krisman@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/31/26 9:52 AM, Gabriel Krisman Bertazi wrote:
> Clang CI builds in liburing repo do -Werror,-Wunused-but-set-global when
> building with clang.  commit c5eead26 ("test/iopoll: fix over-eager
> no_hybrid check") left a lingering variable that was not used, and clang
> got smart enough to find for it, causing the build to fail for every
> commit ever since.
> 
> https://github.com/axboe/liburing/actions/runs/30404555586/job/90427017716
> https://github.com/axboe/liburing/actions/runs/30404555586/job/90427017742

What's this against? Doesn't apply.

-- 
Jens Axboe

