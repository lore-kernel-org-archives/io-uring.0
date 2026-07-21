Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F20372EF3
	for <io-uring@vger.kernel.org>; Tue, 21 Jul 2026 14:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784645663; cv=none; b=gUS2+Ayr6uJB5xt5bJmCWDle9/sxELs+5TBeRN8rfw5ZmGIgnzpMmzn9ATOGADf408Z8cBlj1Xq208vhz4LOTcZdCexpoHpxKcGjpw5mwjf9BCsAH/GtKlHkWZ0HvuQZ6cFg1uAEvLwKXpm3avxKGNkO1ILrqj+BKt3/YBJwYPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784645663; c=relaxed/simple;
	bh=o7w7siPLQORZZFzNQnYMbQ9SCOa0EdaUN8YHwqTpwXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=igmf6iH0qdFiUe1Y1899ZZswcf3CNPUFx8ny0aF2qzWG/5YfyUTdXt3Xbs+UlKEh0FwZPdilnwEP9tDA466jEnr8G+llNUqGZE65t8Itifxabrr1N12Mc2qa6C1o4vgzXzWlZZdjUiu04OG4PHvHhFAv5s7JjULo2sPtlEUWFFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=g30IrdXC; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="g30IrdXC"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-495c63c41ceso5498686b6e.2
        for <io-uring@vger.kernel.org>; Tue, 21 Jul 2026 07:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1784645660; x=1785250460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L6X3u2rc2tTqgs5eIuvvmqbkRqItWjduEZ4GfSwIM4k=;
        b=g30IrdXCpW1hc/wU4pEES15R5MDKdBs0uB4gUgrZhoKnhJr42dbdY2/MseOxK54QBT
         kY2H+kICFFCypF2YD6TWm3LyVm3W2GmwhjlVbygjc+4OY0C/ZEPdoQeLqwxvdKbmRvnl
         wh+5kMNP54XqJdEsDa5LH/YEJXdLxSpegCdz45ITSF0SAxv6iJCzJsQHRiYnHqX0UAyz
         HN9QaR/365QgX3N8/XEkN1TVpBdljkP2WFzyOp2NZ8nJpd9g43kAZh4bi6OXgUAGKlOa
         N5NkyUBc+UnlHKlfXemKiO6cQl4p+QCmEJ1nrBaf8/qV79YKmxtEsu0XmAL0biDVPOJr
         ze6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784645660; x=1785250460;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L6X3u2rc2tTqgs5eIuvvmqbkRqItWjduEZ4GfSwIM4k=;
        b=c2Mq83yt9BJ0FLRhFP/vjlb+ei5kBxefHGqMuDEGI3Vy2NvT7F4wavEomtpz1UI3ZU
         9d6Nn746U+UJtiIAoPMFHV5rugBH4Zm4o6tcp9NmqYG/s4lf7GCi46UFGND3XrDmHclN
         za8y2wD9Z2ZbjXV4aQlvayKy2CTpONNNTDPTJzfvSaiUrcu+x0RXIaQB2xS4g2x8Ufcr
         wcMLHnR+h9ykk7MS6ufoDc2bvq427Kcc/0DjaQh3EE2ywG31ftxR9ZvFkBCBbJldYnXy
         a2Iyhf24VwuoGziwrjc/FxLRCDclJuVJ1lMViDMASwmF94vaYADN1MAujuWahD0/i2Zj
         k9LA==
X-Forwarded-Encrypted: i=1; AHgh+RpCtLPRKWNjIRiEt4YQC0sjEdRDhx9LAoczoweLJOpAPZgSRWfFs3kwgFTjNPZTlA3WH9KTXJPuvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhoLYUsCYXUn1vaYk+cy6zUUXeQeMhzFOjTC4RJrOULzbCMkfc
	QjyIi0ihuizA3vjnajoI+exBR8OCOgiTcP5Ebdj9i33c59HCiH6c3XQ3AWn/TDpKCfCOZGd+vzk
	QOoQG2bs=
X-Gm-Gg: AfdE7ckj+ce7L5JY2f8oFrDbGieJ16KZFzS5Ioup8SOXespxcA3xVkstpPw2c+NKpCg
	/9KDB0eS58CIkLmf9Qurk849wGpm6v4Smto7Ur2xO663wf1SfIDa88+VAPdxb3VWmMs6qp+PDb7
	D+X4iedYq0/NFCN1W06SOOQqf5FPbQfVjfqPM3dxfMWTkZek8nDHwW4iy8L0BKcl9tRVm+wIJtM
	D288LtfmgBtJadmxJcfVsPdeq/LurRk/B0MVyh7k74naawnPMV4lswc6vHYN/5Epun5XSRAl1Bo
	vSS02cQAO8LoGNS1LXcZz5uyQVfq+Y6VuU2pSEeq0/HGqrHyK8IIwzJAwrdNR3pCRno9axsIGqY
	4YWqW4cXNkpi8HvXMFppgLzy7cOLw1+n2zi4jHmElb2Sg4GV7X+ja29kWXsycg+SeExcjzOXx4B
	OpUl1EJZslo7hcim0Jo0LkdCzhcgkvvF7zGgFsqZIMh7Xh5TsUqlYqtBR07J8o
X-Received: by 2002:a05:6808:4fca:b0:495:4a22:f29e with SMTP id 5614622812f47-4a4d031b280mr12987232b6e.25.1784645660242;
        Tue, 21 Jul 2026 07:54:20 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a4d3cae815sm10163636b6e.10.2026.07.21.07.54.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 07:54:19 -0700 (PDT)
Message-ID: <0f1fa2f1-34d9-4ee1-8938-50703f684ae3@kernel.dk>
Date: Tue, 21 Jul 2026 08:54:18 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/kbuf: fix UAF in buffer selection when access_ok
 fails on expanded iovec
To: Aayush7352 <aayushdixit924@gmail.com>, io-uring@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20260721095711.80711-1-aayushdixit924@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260721095711.80711-1-aayushdixit924@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/21/26 3:57 AM, Aayush7352 wrote:
> From: Aayush Dixit <aayushdixit924@gmail.com>
> 
> In io_ring_buffers_peek(), when the buffer ring is expanded
> (KBUF_MODE_EXPAND), arg->iovs is set to a newly kmalloced array.
> If access_ok() then fails on a buffer entry, the error path kfrees
> the new array but does not restore arg->iovs to the original value
> (org_iovs).  arg->iovs is left dangling and will be reused on retry,
> causing a use-after-free when the caller retries the buffer selection.
> 
> Fix by restoring arg->iovs = org_iovs after the kfree on the error
> path, so the caller's state remains coherent on retry.

You sent this twice, replying once for both: this is bogus. If your
LLM thinks it found something, have it write a reproducer. Then YOU
reproduce, and then you can report it. Don't waste our time with
garbage like this.

> Fixes: b3e0216c97e3 ("io_uring: add buffer ring support")

This is also bogus, this sha doesn't exist.

-- 
Jens Axboe

