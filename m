Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793271567;
	b=wWpqxllO8baNqDrxjRLaXvpp6k0o1LxSss2gk1W9HItBHsuaCz/VZsCLqhDRrmvA5MLH
	 7BVcEsZBQj0085aZ3xIYBz4vDHOI6Ng/Hv+LnnybbUm+/2NBwTjt/fcb59PUyaYrEZrQk
	 QTOuRGrGhLWlDVX0UZc789kfKf2wS4O109CQe5SZrv0ip64DYBj7jfSe2B1TIZgJGRNcC
	 GCZN8fy0les6Mz2ocdlqGudFxTeKGe0uCkWxSzAI4fsXj1aZ4V3Td9MRngbl/GbwDbDiJ
	 UkgygSfw+4CcdvXHEpDTuAMgeSaUcSZpnuO/iApSYAhsjktsuQ/Wvvw/EhRY0Tok85Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=BjLzw1kM6LZTzUaUxJhqUTMufk3/F/G637drKyKaiJE=;
	b=okg4tqbBE2n674ajFTbmEtvT2hzICweCDTyLj2K0NI22/SPo5X+wP44dZWjGxnoGeOVw
	 6cPSZpfNixruJXCtiXKG7nJy95tSMRVMZzGIIvpIxivRSAk4Mw/vVhvHoHwtpj3pkTfSE
	 xnuF5DKmJ5kV2IYDUUdCj876N9YTH0Jb8pewXOfOIi6+B8R2EfmJGPoqE0uZcB6KXO9BY
	 2Vb4pag/W7Vr+uQj1cbprS0o1W7pLVuBcICYXcio1E75uosWu1EaeJu9asQ06Ni41wenC
	 F83Kq08azvuq3R+ZNqiBARmW9kQuTlTP4F4MMoVf8pT9rHJsn6ugEPhxoOXQ84tnCgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="p/QONaBU";
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF8D606A31F
	for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 10:59:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EF8D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p/QONaBU
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso1258334f8f.0
        for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 03:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793271566; x=1793876366; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BjLzw1kM6LZTzUaUxJhqUTMufk3/F/G637drKyKaiJE=;
        b=p/QONaBUeuWz8ele7CgjVKq2RtfloFiauiV98PyQcOH/LZQH6jHOetr6yagJOYtMUl
         U1YtJGLhpSHmKRtFecnJbcTk54YPpHMUaqCMMFdyrVxBNn6EosuSX2WN/D5tNqtutHgk
         W9OsYWZQSpV/NKOSfCBOurFMr6wNFE+4CgRjaWrhI66qcpSQfxiVga0/CkWzGPI0cwx/
         yCucYOlC47cPL9VNX7PosOHYPolW8v5+1x9wkBF+bXv+pDpzZAChsjjB9MrcK9I6UEVD
         GXz+Ns6XSlqwvlwjqn3oaBCKeTht+Vk11lmzuYCghqfw8nILm3+AI86vOVzmK6p93dhA
         hYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793271566; x=1793876366;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BjLzw1kM6LZTzUaUxJhqUTMufk3/F/G637drKyKaiJE=;
        b=r+AxP2Mjro1w3ZC430Uiiwi5KK1JebvaaxQkBPn32kzHLFjzNQaQxrIIxCsT0cxTxg
         EWEADSWvMc8FFV+3ZrZn0h93yMObtyubdO5tl9ZTMLWBaaSWDECAHn5jteXt+UZWC1yn
         6fd3mKQbfdS0gpF6lPRHaSgZx4BgNyqMwU1y+z4BAwnNQwXoqbRrtA1spamoLVBJf+sU
         ozBZ5ENtArGwKpbixcRVLWOUDSKmq8z97BcWmOe7wZwMW+N25QpOf5Y2AIW3I0NR1DdS
         wN4QfHEW1CB4NCtUjm75T1cC5P8lXRTX8NMUGgK+PjAMc9thJGg0D6bHo77r37o9gwp1
         EFqg==
X-Gm-Message-State: AFq9FYK1ViMKBhgh4dsH4293jrjXybWtkJDinGUvjvQoGafQ1hvd0Li7
	68nFwzXu1XM1XEZent/tk8yTbhh1KYTPmDpuegFx/exs3mFhDsLMqaR6
X-Gm-Gg: AYBFou2hKcmxKFjnLQ3AOap4sEnCL1roscJRp8+yBC3ovm5DvQ9yyoDQC1Gv4gLtbo8
	NdGtxjiSyDzFRtvLcTqYWAFSM+T4iMyQO9eB2J8xOEo8zBX6VJIbcHLJxfZh0NbFO4kMi5H2eup
	aVRCrLRHImEbA4hHtsyiIlbU3+H24QE0/xdkbiYxkoSUQxAnCnWx7TP7q8VyRbx3BiFGyFYuH/D
	+YW4C6klNVIpwy/lFeDG2QzHwYf5JH8GbTnPqRwj9MMH2pInMpvK3H7YzhAVa7CxqQwajopZWKv
	A70yUmWebsfq0jrAc3zLYDa1O9eE7elkBwvvdVGXRiJle1JBq6HTLblubpcAG14zIafT9exEiyt
	c+t0v15b/cgYkz4O5APfAl0EKW03YM2CvK/mPuuKErLs1XyM2Pa7tHJO2zUx0maa235wRtv/4Av
	vmuga5EGByhdNN6thRM0J9pnKL2Sac0JTWjQ4PujMGxtn4R/DtVYsooQ3K3rN5BziAGmAOStyDj
	eMvkPkxj4fsTUrp+mez9G6UVrX0JOebWoIu2zH+y+sx1ZWyjOYGrCdRDmn+V2J2vxvwWb1ElyOq
	rgoB9Gjd6WuaHp9xiViBqQutmDMbuhTCqYhrAP7xe5yhb7hgQy2LaBcRno1e72SsgTcqDM8ZRDs
	CJvIIdIbrfF2giw4zDImX/Hzb7bAEiYvcovnFNsmHuDJyrd9opz2b5/aPXyZO7G7MT5iuVj4fHt
	W1Cg==
X-Received: by 2002:a05:600c:4f89:b0:4a1:c6fd:4db0 with SMTP id 5b1f17b1804b1-4a966c41836mr125002085e9.19.1793271565710;
        Thu, 29 Oct 2026 03:59:25 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7ee575e2sm58301065e9.1.2026.10.29.03.59.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 03:59:25 -0700 (PDT)
Message-ID: <c4acc3b3-be8c-49c6-b1ec-b25431d28d8d@gmail.com>
Date: Thu, 29 Oct 2026 10:59:26 +0000
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
Subject: Re: [PATCH v2 3/5] io_uring/uring_cmd: support dma-buf registered
 buffers
To: Anuj Gupta <anuj1072538@gmail.com>, axboe@kernel.dk, kbusch@kernel.org,
 hch@lst.de, sagi@grimberg.me, James.Bottomley@HansenPartnership.com,
 mkp@kernel.org, bernd@bsbernd.com, joannelkoong@gmail.com, miklos@szeredi.hu
Cc: io-uring@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
 fuse-devel@lists.linux.dev, joshi.k@samsung.com, anuj20.g@samsung.com
References: <20261022144501.2478417-1-anuj1072538@gmail.com>
 <20261022144501.2478417-4-anuj1072538@gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20261022144501.2478417-4-anuj1072538@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 15:44, Anuj Gupta wrote:
> From: Anuj Gupta <anuj20.g@samsung.com>
> 
> Let callers of io_uring_cmd_import_fixed() opt in to dma-buf registered
> buffers with IO_URING_CMD_IMPORT_DMABUF, and attach the current map on
> import.
> 
> The map has to be dropped at hardware completion rather than from
> task_work. Add io_uring_cmd_hw_done() for drivers to call from end_io,
> which drops the map and queues task_work, and warn if task_work is
> queued with a map still attached.

Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>

-- 
Pavel Begunkov

