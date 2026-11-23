Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440052;
	b=YW/O0q2vp8Wc61qFNxRzI8Gy4+X0B5Rx8BnHqB+EX5IiSQqIvZSedqL7eTqtAx25XKyM
	 E6AP+7d2r/5UtaGVq2oJ1URKBaX43S1H8Yqk77z6q1AJZuuCItPns8KWzMtQqn2tTRPip
	 +YmbpUE/7lLGmwjijUREBlzBxDoU2nVrEr+CguVEcHZ42lOS31632mTP04XLqWGTt2JNE
	 /K9rEZdZGEliE51sXZx2lY4wZ3LX8GJApihqUu2urwNAaNyAi7659oR200IpaDVXNp1P2
	 0osvv9CgdjC7zcROE8g3IgznvRRL90T3s3fJghl6DtLjpIAI26Kqy7k35EQbeWnAJJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=nQkJhOs7vzIhcJTG24G8BH/pwTyzsvnAwV9M0zA6cJk=;
	b=tlOto7B3/L9uOuBpnBuCY3MuPjw2hB9dFg24X+nnp+7BU2mpGAUoBYSA70xUMXKL5qbQ
	 BGtnOU991uajcQLFDUBIHpenhg1I8T8ARs5DQHxk6s435uYG7g0utvLyyBlb8NfqB4lEl
	 V7vi8BZmVBzvqUgUIYAik4wG3UwN4QdYmMioZQuUefY612pw0E8EeNOpMAm0obH2pxuc9
	 7tE6U8rJ738fXUQjLjTXNNkXveM4jsiOThWsHtU9rEJ0/8iVAKL+KJ7f8+rwOrQwe6cCs
	 CSI1c0ZGoWIL9OhhmFeXQsNsRZBnTEFuK9umKgzalJZfVLDCi/HfcHAB2KjtvnmAlIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dirbU1uV;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC974606A32D
	for <io-uring@vger.kernel.org>; Mon, 23 Nov 2026 13:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC974606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dirbU1uV
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4d581da0aaso435074066b.2
        for <io-uring@vger.kernel.org>; Mon, 23 Nov 2026 05:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795440050; x=1796044850; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nQkJhOs7vzIhcJTG24G8BH/pwTyzsvnAwV9M0zA6cJk=;
        b=dirbU1uVg5XYaOLNs53rZEhqmiBZ/CARf2od0etpll4SmO5f7QaZ0/3zG0qKgtTjnG
         R6348TQ9464RhMhWmuw0QyPZooAwoBfor/MDsoFFQkPYtqp+g3fQVbSnScKFGSsT5ZWg
         rik85kKKtu/yQdPGauleEjV2J50e9ubejPI5wtkcEPJpyi1K5UjJMPP4r7MzbF512huD
         wKDL8/EZrESb1ECauFwmkW1ia5m8KZEu7vMWRbZZXOlBBbJN2zV5RrnqF2pll6nV/NxZ
         zvjAGjz5Z/9qtriSKjDuOjzHmx8/tWB7GxwiZx4f65IGcP5p3dkyU5YA4TAAtlnYwskA
         n+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440050; x=1796044850;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nQkJhOs7vzIhcJTG24G8BH/pwTyzsvnAwV9M0zA6cJk=;
        b=IUKpctR1WEE6JrFrx5dT5Kgj99Q7uPujgN+DuHnXtb+ooriVM3s3yPRWHitnlkzaLm
         mydifQM47GsjLRSMxsgG0WcglOiTsOfZRb8Smaz74ANmNaDOu4IC8a9A3EYVBXFM74WU
         0Mv8OMtd/hXiJHtZNEgwAPhEYrTPWwKeDhn91WoNU6EA+tkY+873Zz0k4+sQbPlvm65H
         +bDWaXR1mnNxtMPOoLy0cAPELN592/z8yS+bK4cw2A+mwb0PRR44+vhaSQqxlxXGnsbs
         /V8y9H/f78ohGmhqz5BoApW64jI6lJUDunFpNXR9MGmMcugjXqN7ZAfhYE0wqj9clNgs
         /w6g==
X-Gm-Message-State: APuU4Z+yyILkZYk5xE0IH3IzB1O5uyQT3xh/qbwDpNL+ckht+ZZC7skg
	yhb+eLkpSClxGFdQWm8UST1Hvt3LLF02qWEmMlLb0EW63Urchaa7o7T0ByTzeQ==
X-Gm-Gg: AZFdTZdprQVIJYZqfLq8rl1HIrD2e8rA58bjrLmiTlOspBF2rkdOGLUDypj568xN9AG
	2fjBf7YVGun/dH46U/M+0uQr/C2EZjTjI1Ze1rumKK/+wZCsVwNGQr2X/+5bLJqrt0bZDqQvfKy
	zZGhT1wNA+8py67GG5O7kthSZFZiprYuOX4bwY0lpvxFWuMb+OfcJuFUKRx6BCwukhKoSJIGDNm
	apuLMJ9nJoDkNfB6NMm9gdkc2oCi8GmI0L88Yr4gBu0KSmmKVL0s+4zHsEjKWiCa30eamAK7JeE
	UpZNQm2DOjom7HrvoB1m8XYEQ4rqapesO8UghKxUfN5tKzEkdRM2m+C5aM8nMFMvZIEhk8BtmNK
	RcLn+6+gamZvVzSq3CrEmOvZ3dBznb3D5iLclKuHlFp2+0XCt3ca9RDLz6ZlU9EtJfGaTJ3NB+J
	8rV2irVA6xdhbIgCO/PQSBbbr35H49G/OTAN9RF9/0t5k1Yzcg0bNU7Q6Dz4RaJMLQ80/7+qgyg
	CilaRVCy82lZAitWJ7796iZaH0nASFbyA3wKavxAJJgfnVPxf99SjOVcA+aWIpB4mQANzDrz7IL
	TYOh9GBY/VEjSrsXOpBJn73I6GSLthbYKENaXFcVUya6U2n4GT/b2odfRe+UTXAMtY2Ujg0rCdZ
	AcYvFVsRH1e4HQRgyIFPzUZLDbwqNIGXx1cwphkMKgDQK5WmqK+Ui3Qssp5YaJzKf/7unWha0j3
	I/i/SNYPmmsXJXTiiBB8gfNjdKlQ==
X-Received: by 2002:a17:906:7d42:b0:c4c:d6a3:f4bb with SMTP id a640c23a62f3a-c513a999e3dmr691793066b.10.1795440050008;
        Mon, 23 Nov 2026 05:20:50 -0800 (PST)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022e84sm411477066b.84.2026.11.23.05.20.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 05:20:48 -0800 (PST)
Message-ID: <2784354f-34f1-412b-aa95-70603f2f8cf8@gmail.com>
Date: Mon, 23 Nov 2026 13:20:25 +0000
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
Subject: Re: [PATCH] io_uring/net: don't charge the folio offset to truesize
 for managed frags
To: Louis Thiery <thiery.louis@gmail.com>, Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261119232935.1708458-1-thiery.louis@gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20261119232935.1708458-1-thiery.louis@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 23:29, Louis Thiery wrote:
> Registered buffers backed by huge pages are coalesced into one bvec per
> folio, so bv_offset is relative to the folio, not to a 4K page.
> io_sg_from_iter() adds PAGE_ALIGN(bv_len + bv_offset) to the skb
> truesize, which charges the socket for the whole run-up inside the
> folio. A 64K send from 1.5MB into a 2MB THP folio adds about 1.6MB of
> truesize, and sk_wmem_queued fills long before any real memory is used.
> 
> The visible effect is a socket that looks full: with a 2MB send buffer
> only 4 of 128 queued 64K sends complete before the sender blocks,
> versus 30 of 128 with the same buffer registered as 4K pages, and most
> pipelined send_zc requests come back short.
> 
> Only the in-page part of the offset matters for how much memory a
> fragment ties up, so use offset_in_page(). This matches what
> zerocopy_fill_skb_from_iter() charges for the same data.

Looks good, thanks for the patch.

Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>

> 
> Fixes: 57bebf807e2a ("io_uring/rsrc: optimise registered huge pages")
> Cc: stable@vger.kernel.org
> Signed-off-by: Louis Thiery <thiery.louis@gmail.com>
> ---
>   io_uring/net.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/io_uring/net.c b/io_uring/net.c
> index 533afd335..8afad1b2d 100644
> --- a/io_uring/net.c
> +++ b/io_uring/net.c
> @@ -1501,7 +1501,12 @@ static int io_sg_from_iter(struct sk_buff *skb,
>   		struct bio_vec v = mp_bvec_iter_bvec(from->bvec, bi);
>   
>   		copied += v.bv_len;
> -		truesize += PAGE_ALIGN(v.bv_len + v.bv_offset);
> +		/*
> +		 * bv_offset is relative to the folio for coalesced huge page
> +		 * registrations, so only the in-page part of it matters for
> +		 * how much memory this fragment ties up.
> +		 */
> +		truesize += PAGE_ALIGN(v.bv_len + offset_in_page(v.bv_offset));
>   		__skb_fill_page_desc_noacc(shinfo, frag++, v.bv_page,
>   					   v.bv_offset, v.bv_len);
>   		bvec_iter_advance_single(from->bvec, &bi, v.bv_len);
> 
> base-commit: 0659e44ce739ecd856164c75a5325b7959a2921d

-- 
Pavel Begunkov

