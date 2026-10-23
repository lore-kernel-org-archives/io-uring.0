Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792777688;
	b=uIDod59bCyA+Nny1Cp42MccJRyhRsHXvuaRKTHQvUZEFAOaZ0s91MGd1O7RkDTpLLRqY
	 me+HangabVRw8d7rCfuahdZoCvyv7jo9IO8mOmljqrHl0vGXPXinMc8/HuWELELfvYBqi
	 8yw6Vpym2URp73QY61H9BNvyAhJ9FQ8tIy7ong6ElOAqZ85J6IAHpGHz0TyuwhvUUPZsj
	 x0NxzYHENJRDx6TBGJBLm8nydEYGald1WFsvoObEgOMHOkPTdhK6vRfNurNmJd6UvaDhZ
	 qtJJYNr7SjKlJewCBh6qeQ1LMVuzlOsEGrAnVaAHBEeQrVQ2A6obqxoRsNemVztrVKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792777688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=K968U6wefdNsROZuYyBkq7UZYJdpXh8piNMlJTGcGqw=;
	b=T7w+NYcukJI7ycrlqmc/9KjS8quISlxMV83ZBP5Y/PmOcDLthGNqBeNQ6C9BXX1tz+Bu
	 /SJEvA9gafrQM/Y30eMpsBNbE77kqJMmbtvChuIxSTBgg2BSuAhDWY4njMZ+JMv/gVddl
	 rd4M7LBcWKVHGjejevX3PvNUDKXslVHVa1LpEs0ytcCwzWUJR7GjSloIE6iy439sJIPZi
	 dmagSFs6ksdlJA1y2bdwYmKSeadPTJd90kZtD+x0xUza4W9mnyKaWS+Xzb1N0e+E5midL
	 L+JpjpiEUbyOLE7LA4rU3igZOuuj6XTVCYqbLPHLrmNwP6xd+A48z2w4ulB1r8syvsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jRf6kFde;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8FC606A31B
	for <io-uring@vger.kernel.org>; Fri, 23 Oct 2026 17:48:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD8FC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jRf6kFde
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so1388995e9.2
        for <io-uring@vger.kernel.org>; Fri, 23 Oct 2026 10:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792777686; x=1793382486; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K968U6wefdNsROZuYyBkq7UZYJdpXh8piNMlJTGcGqw=;
        b=jRf6kFde1pl2oOOchZQTBbiTHE4Un/nHb5TRWxkMNmjl1bhfEpmXBn/Qk/RdZDJ7gh
         xBNTcYfMxbZX9qCjaUnjn4BDvoyzfWZIKB6fc8hu5AkU6ye23VCTaHx7spqGlBFbgvd/
         Mt9l/e0BNbnDA9bifKNO2NpW5d/Yp4meDzPDNZcUlReecLUTcWxWj8Vh9meSnJYibCVp
         Crw43qngIYeoxUfK+L1u3kb77InnpS950bJwHj0SA548bQHlh8qwaZuvKjTmvjys2Dtv
         LXCX3fMKNrgjXA9LZWVfJ8pbOOmOht6T4VANzSXZqFOrcRgVhhAjKw+pXkCwTTmV2XS+
         SkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792777686; x=1793382486;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K968U6wefdNsROZuYyBkq7UZYJdpXh8piNMlJTGcGqw=;
        b=hVGr5LrjRF0tJbhx1RO9e8F8tVwDNpA4VJJnewMbiHpBpf3LjnR5Uphyc5ElvTc4P+
         eUsXyaPyzQhQU7vTQ9ylSz0GyHcjfyhmy/pq6ase0JYpkjAmodn11uckBTDIRuj5+RDx
         gcZ3yrZH6wUBLWnRMx7FatRAl1PN6OeEC4xvLvFomwT8FkzUBVvHKhmv6DU7d+5ne0MF
         uHKhP5xtmHGIWQuZIGWBGhz0M2RSy3mGefj7hoRmHbLc8j+wEv4IM/vQUXRNrtwqkhFI
         y7aQUyrFdeJB2C72/oWWCIP2uzfzsLamtF2BUjtrNS1Gv8dBu2dHdXeF8G21MnF8e3wQ
         QD9A==
X-Gm-Message-State: AFq9FYKAWu0ETK+qw/msf5oK7vc8B+srfUkf7GjglhEk7Ccm04eiYPGU
	31mWRB6MSzeXtxnWjSqQQyEPFQu7/5QP9P06HxdotHW0ZlPX4rOX0tj6
X-Gm-Gg: AYBFou2c3aWcPP5x3YljtGF7gFc4E6KjzXEMWufZVadrSeYuHxET9RKbAhenjwnNsia
	A1A11zTXEbeN3QYjvoPQBCQiSCZtU9pD266jCcDZTt+it+6ICSJ+KV+iBGjrVWFMAV0ojy66u3C
	AdIBbxwf9XIkS0tiFSRGDR44xftHKDOYEZzf87wfQWuErLzEG3VaQI4YDMf9f3AB3CcyPmBRR2n
	SOZXlEAFNEs6w6fHNuFbay3ZAlxu0rsjTKPaRq1GWK8PBYc/vGNCBWHU4NYNyWNcWhCdjAnB7RO
	qSGiIcS3Q00lizGBLatrnNnElWm1EqRCi1Z+zsEpAH/k0ZxhDE1dv5j6gavvwtp/jvaZABoE5jJ
	XVXYTuTr+36rYUegcQKr2NMIi/JobTiNnoONOpixSsg8JWvkJjsEN95EJLIYGjAtz+y1w01Pwy/
	pdBOAX+o1WF/MDIXIkmINXk+oYoBF6HeJeusjKrkay0cM/rO/Jjip6WBYF9Z4vQcbD1JRGknhU1
	trRS44Hd9MbOlXCVrolubYfuYYsXVMWFU5s3zm4T7cWdy6BzB2DWEBl1/uvo+G4xsYqZ69AtH9o
	hcPi+qW6lDATX80a2ZWDg+1RP0D6tXvj7SaPmK41kR1lvvRLpAAi7ox1v8bql/P2jeQYAHXsDyW
	Kk2jMoUgbF4aqisfx0KqC2N0zyOncbQ==
X-Received: by 2002:a05:600c:4e8a:b0:4a1:e7ce:10a4 with SMTP id 5b1f17b1804b1-4a211eebdc3mr52532865e9.29.1792777685999;
        Fri, 23 Oct 2026 10:48:05 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a312ea914esm7147655e9.2.2026.10.23.10.48.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 10:48:05 -0700 (PDT)
Message-ID: <8a039861-0c0b-471d-9129-e9e4e549d213@gmail.com>
Date: Fri, 23 Oct 2026 18:48:04 +0100
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
Subject: Re: [PATCH] io_uring/dma-buf: don't fail fixed buffers without
 dma-buf support
To: Anuj Gupta <anuj1072538@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>
Cc: io-uring@vger.kernel.org, Anuj Gupta <anuj20.g@samsung.com>
References: <20261022132027.2293931-1-anuj1072538@gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20261022132027.2293931-1-anuj1072538@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 14:20, Anuj Gupta wrote:
> From: Anuj Gupta <anuj20.g@samsung.com>
> 
> io_attach_dmabuf_map() is called for every fixed read/write, but returns
> -EOPNOTSUPP when CONFIG_DMA_SHARED_BUFFER is disabled before checking
> whether the request uses a dma-buf at all. So READ_FIXED and WRITE_FIXED
> fail for ordinary registered buffers. Check REQ_F_DMABUF first.
> 
> Fixes: 62e4bf5b25d4 ("io_uring/rsrc: add dmabuf backed registered buffers")
> Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
> ---
>   io_uring/dma-buf.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/io_uring/dma-buf.h b/io_uring/dma-buf.h
> index a876a9e5e272..534c06b6879f 100644
> --- a/io_uring/dma-buf.h
> +++ b/io_uring/dma-buf.h
> @@ -34,10 +34,10 @@ static inline int io_attach_dmabuf_map(struct io_kiocb *req,
>   	struct dma_buf_io_map *map;
>   	struct io_buf_dma *bd;
>   
> -	if (!IS_ENABLED(CONFIG_DMA_SHARED_BUFFER))
> -		return -EOPNOTSUPP;

Good catch. It was supposed to be

if (!IS_ENABLED(CONFIG_DMA_SHARED_BUFFER))
	return 0;

as there shouldn't be any dma-buf registered buffers
when it's disabled. Looks good in either case

-- 
Pavel Begunkov

