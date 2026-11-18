Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018071;
	b=vwyTg8OenddlfZr3kb6xZB0KgE25h+LyGaahJU/0A811caflvUv/22Inhzg+T2R8iT9N
	 HZepnRgJ40MvyXM1jePdIFsMvdruQ+H8mYXmIDlVBWpnbdNWnMoS0F+z9dDmJ7EWs7dMp
	 msBY2T7kx4stPduAeJqAhqPm3Vvi97CVacZ0l+GISEy7qhyjlcCQ66huYLgQb8cXKDtki
	 t9oldWXCsomy45ADotKMwvcNKWLTVzjLDGJzYvZoI9LNedZRSV7yQMl2VIIIb05Xe9AsN
	 0CIBI18hgmLTSO2Gyl+FFrYXCbLfkIpFdKLqRRg0xphfAxR63E0AAfHRY0MIih6wNVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=mrYL5WsZOMFb7NvjakVneJtwznSPE0xr2KZxBOzVkZo=;
	b=ul66ylVEb5VCbSnbgMHKDEM5KQCLZvHsieNqOBljepz+QSomQaefha+by1B7vf4ad9ax
	 zbJS4xTX3jDYpLhRCTE53GcMn87BAkY0qYbRAetcPm9/E2lcjEhXCVl/V2iVzhFsxOmhE
	 40dm/pH2B29DB9HRWwtmOfcK2x+jXPSZIupFc40+6OXZriHZj8khQz4Dwgg3qhGti1sEp
	 VKQaAmkosqPMUWh6llVFV2qEgNX4JnHR8ZAaXZQYSalx7PRGrdq3noru6cS1uQxAFcixH
	 onGPIE/SxOlbFFpQlO8/HQ9uZodFCADVW0sl9eIyiE8sSJVYDIVLWGUSwKaE8u+gL0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YVWFu3ON;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AFF60A5BCD
	for <io-uring@vger.kernel.org>; Wed, 18 Nov 2026 16:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8AFF60A5BCD
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YVWFu3ON
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4a77761ff8aso780619fac.2
        for <io-uring@vger.kernel.org>; Wed, 18 Nov 2026 08:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1795018070; x=1795622870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mrYL5WsZOMFb7NvjakVneJtwznSPE0xr2KZxBOzVkZo=;
        b=YVWFu3ONxADGZ1TCzNmmfe+iJS+iAMFchsUFgHqzrvGIenRCDA4yP0OeY5oGrttNMO
         slJiHcrBn4vK/OV4Wj1DXmiXQTMopiStBWArmcGzgF7YPGXGotfzkocwp3jfK/TMFmLv
         5Srg0A+SCJ+yXZRjjB7WCNe92jb0tltS5owxk0CfeBFdxEYmicaKS/5NvO1E8+CkTvBP
         tM1SjaPJ0iIQvMPxRcW3zVTg2o7DTQyMrnEDmLqFRbXTUvZVqw8ax1qdp55nbqGe6O1n
         OuZE5ZhthBEmxFctu10N1GS7oELzDXglU8hg+s2DO4/MNTnU2gWgaty6KW9J83D5xh6e
         iXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018070; x=1795622870;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mrYL5WsZOMFb7NvjakVneJtwznSPE0xr2KZxBOzVkZo=;
        b=UFtAsKI1UMggArZwHGQ7AcZBrlapK5I7qEdOf+zbkMLsyWKqwFSE5DRk5HNxnL4xyY
         nzAG4IUFzzzHvJVb6FMv0F3QMIIPEmW1ZKqQs2Ej9FaK8UjlxayN7yQ+DCDopPSWBl8k
         OE+2he3aRpK8repybLg7/8upYpUz7YwOEAZWrDgq/uaqrICFbE44Oo58PCE82dcGKVGs
         07pR1u1SGe/RiZidM9fLspdDtKHZGC1DPZT34gcUvpv2sWzAwAJ65HPtqeMww75KtRLN
         TX+2uzvY8o3mdhNkpzeC55i/oM/f9C9vPoL+b9tLW5JN5GtORkIKr7I5oZvmfOWPJrQY
         TyyQ==
X-Gm-Message-State: APuU4Z9bW+xwFA+wgoFj4BJfBhHSaL/VbDmfb2ZH++1vtVjQUvjv+ci+
	JpxEGMB2xmxPxvro7FhK9B47Q6rnTDJKcSgNWes81hSNXL9g4xEMss45/CkPQ6FBP8A+b0mJBIO
	Dj7kOA6E=
X-Gm-Gg: AYBFou2nMZ+8NZijyHscdAjIizbnBP/y7LEXA2M1HQpHA/OkX6/oNAPLNMDOLTTz/E9
	ZKOkhzLg1i+i6MQ5DY6yF854oYNSyxdrfLxcMno58+PPp4cJHdIESYmPomod7iVWw8uySFmZnYv
	SFVQeMdHJK5A6L8HEikGdtLHXIALQYIx4GRHzxNvvQqQP6SSZFugX1PXk6l7wQuYAT+i+J4xrlO
	0WjGMbj1a8fntSWv/7jSQwci0jBz57Nstxk5SE9bDgWd1sK3jbLP3CRJ0WKKRiOJG0R/2Vwu+ba
	b11BhUMtiusqlrOjcimdf+lHfu3OvidqD9IzlEpINLxyqIWyjm0GHLnxBnfGLPkWCN8y1D+pjqY
	MIXnllMa8li/TsP9xxiAiRVpwu/QogZPwmEHKtACgCyDfQX+zvDUTQIgZymjJomxPixnO2SvZMj
	B0ZQlUUy+LLn2PrHTT9quXinPPkqMiofOtm83vRtZFDcF5ST46vTNmzZdKtpfBPeDRczlEL+vue
	Y8bjuspo196R/MyB/6sis063icOScGvjXKl7Rc5LK0Ov+k86prqwLoAH5+RBnxkTC41APABy3wZ
	TiMsvgBDjrNxu1N+kqGjFYr7KoaVawJIsybdXxRb7wGCJA+drQaDD1eaEf0kxY7zEBaoLfyV/yc
	dAr37sQ1FqCTpRBHHIfnVprxpXFihifK5BLSeBM5VKbyX25JtT1c=
X-Received: by 2002:a05:6871:2ee3:b0:4a7:4324:1807 with SMTP id 586e51a60fabf-4b75da54ef7mr2618439fac.12.1795018069724;
        Wed, 18 Nov 2026 08:07:49 -0800 (PST)
Received: from [192.168.11.112] ([96.43.243.130])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b743721fe9sm2624231fac.6.2026.11.18.08.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:07:48 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org, Mikhail Malyshev <mike.malyshev@gmail.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>, 
 Felix Moessbauer <felix.moessbauer@siemens.com>, 
 Josef Bacik <josef@toxicpanda.com>, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20261111162705.1150983-1-mike.malyshev@gmail.com>
References: <20261111162705.1150983-1-mike.malyshev@gmail.com>
Subject: Re: [PATCH] io_uring/io-wq: apply the current cpuset to new
 workers
Message-Id: <179501806843.17649.11773219766773468762.b4-ty@b4>
Date: Wed, 18 Nov 2026 09:07:48 -0700
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


On Wed, 11 Nov 2026 16:27:05 +0000, Mikhail Malyshev wrote:
> Since commit 84eacf177faa ("io_uring/io-wq: inherit cpuset of cgroup in
> io worker"), io_wq_create() copies the cpuset of the creating task into
> wq->cpu_mask, and io_init_new_worker() gives each new worker that copy.
> A cpuset change, or a move of the task to another cgroup, updates the
> workers that exist but not the copy, so workers started later run on
> the CPUs the cgroup had when the io-wq was created, which may since
> have been given to other tasks. Workers come and go for the life of the
> io-wq, and a worker that cpuset moved is also retired at its next idle
> timeout and replaced on the old CPUs.
> 
> [...]

Applied, thanks!

[1/1] io_uring/io-wq: apply the current cpuset to new workers
      commit: 0659e44ce739ecd856164c75a5325b7959a2921d

Best regards,
-- 
Jens Axboe



