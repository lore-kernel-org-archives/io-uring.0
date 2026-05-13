Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB34740DFCE
	for <io-uring@vger.kernel.org>; Wed, 13 May 2026 14:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682026; cv=none; b=RGYy3h2Q5vO0bYGRYLbxn4Wg0qnLMZ9spvF858hVCNTnPq1bJvaZEbSH+il1NQcon+2jdD4QnVAkowOzriO4hsO72eWnNEyWtWW+T7pgBiN40D7nSVuIlabtSS2e+yiXejoalEXppO7x056zjSFC1pdVZ249tRuVxP8ImJoCeD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682026; c=relaxed/simple;
	bh=UCpYTl+hK0wyJuM9uv5iFLNTb97qvTTBn0xdj4QW7+4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ibYPzi9/17iMTw5AtUtPDn7LUulB209rLHRBSTP3asx2olsfXgJ9loHtwD1ew+3C2bfIz4h2nhmodKSZNpciqOirkGAr0uaUAHJNokaRU16Sm6hNAnDhku+QWNeluJcm2vGKwJnyeeUymMEsm2XLBOmMYD77B7IEfmTwWTMOk9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=eVGBnbRf; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="eVGBnbRf"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7de4a9cb8eeso5782795a34.0
        for <io-uring@vger.kernel.org>; Wed, 13 May 2026 07:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1778682016; x=1779286816; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hp7S6Qr9jx44kYcFnSHSzYhDtCJc9snTWpODvsgk43w=;
        b=eVGBnbRfOqAzJEnhvQm8/CRVd6IFGfOWKKX08cBnlltfTGTDFzKIcmzBNa1HpOHo0e
         weC27ETBiOAiAZ2RckdSgSAPlkxzEZZ9is61GwZKpKKm6pyQdVEInaOiRFMc9Jhil8O4
         IDyIji2lweAGBOoDwXyAU/ojUoMpqCHhyz/PKp1iIF6bwn0e23t3Ufm5GTbArH8Pcj7c
         G/+JWKMoQ42S9rogclY3kYOW6meKVwTECo1h68mBEY+WgaV6+EbmmggJ8cM2ZoglUvD7
         RGP97FLPbUJwsmO4/ZbCvMqLvBIdKZKpqOgiP5adP/BZdiK6hHOGgdv2Ycn4XDowPAJP
         EvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682016; x=1779286816;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hp7S6Qr9jx44kYcFnSHSzYhDtCJc9snTWpODvsgk43w=;
        b=Pj4U9nDvpnFa7ZcJmVzRS2EH8brosBD9yRFqjT5prvzyqUmEf7hey9y4f4laUrPgRw
         PfPwo21NqOxsY8H6NdEyJSyIHihNuOa3vH00F8+H305m9TwaueeBYhm0/WM49radQTuq
         6gM0id1pmCIr5WFe7GyOuCEcxlDKrgujKvT+wIqrmKj/TmQCEOZXDmHyBhlCZrdmf8XT
         Yq2HvoDGVpsg+dKDzYSvPJwBqj0GY1FxNXaEwQ+J7yDomWhJKBJG3jAOnEcbFu5rZrqq
         diBQ0nfiVxfD8rB5MUVSM6P10q7j/Sqyz+6azsOIEDQfrFBqx5Wrgo2vAa/Hl+ZNycup
         w5VQ==
X-Forwarded-Encrypted: i=1; AFNElJ+MgRHTgWJEMBD1OSrDi8ADL7n4ONuMU/PPK3obf/0lTJ+C18f1Q2X0KV7g9P8STWDz2R58oreKAA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd0sSj8/fs0PeBfVblwxSxAIGsmL14VDmCISiI3QoIatWrBwVf
	goq/VYRjLO7HpCLzlojTZW3gbnrhBzVbS4gIXlKBVN7sc9fuvCYysZaHJLxDxMz4p/E=
X-Gm-Gg: Acq92OF+ssTyYsvfZagd19EVbo+goQDhOh1x+wgXo1fw2U0dtmNyoHkDsoIHyVaaX8M
	ZGgvzoVczMsEU9pwalfPJ1aPiG0+mFOPAyhuUbX7iWY0ePZmXkx+35AV97rbd1Oukb6ck3nB0Dp
	kxWGPrurpt+HTEdrMWMcGzjqgnbKnTkvx3U9lxsZxqCfcqBoIDaagwv/XwpwBNgFTM0Nz2tpl2m
	i3ZgsOCTNfHhGroA+MqkqBRqNoo+i/Ce4ZmZNaSEGwQ3rbbz4IpI4tYaLrITOeLMGnbCljxMuDz
	MMzPfQ5h3W4IkJtgpr1w3M6VXPILLbKOGzJ7x+rUFzfpCMvDwUmm/gwUxaJr+V76dReNNZ23TjV
	mjhA0UrbgMxvbIe3rWG/hq25vfzlKQzd/5/Eo77RcdDlmNoxXQItTSOpi4yoTS5u3xVTCC0npxE
	5clr1SzcI2m9SHrLv/OQ+/wUKUwg6VnRWxk8/SlAlR8VCoQ2nKQ4m4HIQTEUd0xLzEo/ftFBOKU
	acgfKektg==
X-Received: by 2002:a05:6830:d17:b0:7d7:fbe5:e9b3 with SMTP id 46e09a7af769-7e3d9ff2e9fmr2295058a34.3.1778682016210;
        Wed, 13 May 2026 07:20:16 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e367d4fdf4sm10768157a34.14.2026.05.13.07.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 07:20:15 -0700 (PDT)
Message-ID: <36e2e080-0fe0-4108-8a27-3be8b10ef97b@kernel.dk>
Date: Wed, 13 May 2026 08:20:14 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring: validate user-controlled cq.head in
 io_cqe_cache_refill()
From: Jens Axboe <axboe@kernel.dk>
To: Zizhi Wo <wozizhi@huaweicloud.com>, asml.silence@gmail.com,
 io-uring@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, yangerkun@huawei.com,
 chengzhihao1@huawei.com
References: <20260513063254.1122354-1-wozizhi@huaweicloud.com>
 <f8dc69f8-7191-4c60-a2a3-2fa85a089927@kernel.dk>
Content-Language: en-US
In-Reply-To: <f8dc69f8-7191-4c60-a2a3-2fa85a089927@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/13/26 8:18 AM, Jens Axboe wrote:
> On 5/13/26 12:32 AM, Zizhi Wo wrote:
>> diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
>> index 4ed998d60c09..92e255e9e08f 100644
>> --- a/io_uring/io_uring.c
>> +++ b/io_uring/io_uring.c
>> @@ -710,11 +710,13 @@ static bool io_fill_nop_cqe(struct io_ring_ctx *ctx, unsigned int off)
>>   * fill the cq entry
>>   */
>>  bool io_cqe_cache_refill(struct io_ring_ctx *ctx, bool overflow, bool cqe32)
>>  {
>>  	struct io_rings *rings = ctx->rings;
>> -	unsigned int off = ctx->cached_cq_tail & (ctx->cq_entries - 1);
>> +	unsigned int head = READ_ONCE(ctx->rings->cq.head);
>> +	unsigned int tail = ctx->cached_cq_tail;
>> +	unsigned int off = tail & (ctx->cq_entries - 1);
>>  	unsigned int free, queued, len;
> 
> This looks wrong, as you're snapshotting 'tail' while it could get
> modified by if a nop fill before the refill happens. And fwiw, looks
> like the refill part potentially suffers from the same unsigned issue.

To be clearer, I think you want to add a helper ala:

static unsigned int io_cqring_queued(struct io_ring_ctx *ctx)
{
	struct io_rings *rings = io_get_rings(ctx);
	int diff;

	diff = (int)( ctx->cached_cq_tail - READ_ONCE(rings->cq.head));
	if (diff >= 0)
        	return min((unsigned int) diff, ctx->cq_entries);
	return 0;
}

or something like that, and then use it in both spots. Would make for a
cleaner fix, too.

-- 
Jens Axboe
