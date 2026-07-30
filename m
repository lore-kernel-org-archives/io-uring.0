Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C0346C4A9
	for <io-uring@vger.kernel.org>; Thu, 30 Jul 2026 19:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785438970; cv=none; b=mOfzXZXAvzbNhOLJB1K/3lCfcC3e22x0ZjKfia2fAwaP47WMrIsPnfThd05f1YuR7AXoETxybhyJ3jYLh5RPCcES9rxMEghZ9tvXM7A4cOCPJ46/thprwOBJ65LBCq5jnoW1H8aF5RRhthxo5GQim3lmUfYbXS9dkNwDdHgD908=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785438970; c=relaxed/simple;
	bh=5WHjlG72d+xJLtqAx/ToykbvdBP5gcv1x5UevJqlPeA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pImu80ijr6OBRbGyYjaSWsI5ht5GVGdy2k1fd6hVsiQlttrOz/NfTfA/N4s3JJA4ORqcttcoeIOA539VaxDo7UPK0c8wEb6i8O2QwLaLsvHgU9HRWRldFLx/crYb2s2e5pbCP5fUpohYvm/RcIAjuq62ytyJk5pDDKQN03aKINs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pWKLjyvU; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pWKLjyvU"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso74399f8f.3
        for <io-uring@vger.kernel.org>; Thu, 30 Jul 2026 12:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785438963; x=1786043763; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xgXPviuoYbN7EB9Py/8KZMntvbdaAe2VnJspeF2bwTo=;
        b=pWKLjyvUqApeKZOf+YV3YGlJ/HSoUaK8wo2zVPjscdGnrVJ1z5g7m5MWsWUYxXjb10
         axNFTrZXmV0o+RjwAJvO5hhNIMs7CyCLf5fs/8YkLbG0POg/PiOpMwXT7aAJTZvI1GQO
         qAvLmCFJVm1dIqs0B1Ep7VMxIEjM/0W7UEMVlWFp7OHMfpooqXToGOgfxMiP8fuPc9nd
         r5nZjG0niVDQ0K3trP4RkwWxOZjHmvHrg555PpGCMSGVtnj2+nTvezYC1bEybthBfyHc
         BWcqiJarzZPljPZ4d0/I91NdcWJtceK0hdycu7mvmFH8FlqXhiYkPKc4S3+XF+O4pD2F
         LJhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785438963; x=1786043763;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xgXPviuoYbN7EB9Py/8KZMntvbdaAe2VnJspeF2bwTo=;
        b=Gg4U3ouSZYnSmZGxOXt/fGUbnpBVIddeZ2gSvxh66GtDY307mtyeTk6iGotFnO+V/E
         G3+Dd/bAsRrHQbySW19cI3iGysyzesfj9KTISOEcLDjaJSGDbLU44HofQZFEkk6q8lS4
         o0o2gliTPE0IxHWNlZF2wTV2SqDXQzPqHsCvi/qftRB9KwNAoVKTLon8F+pDFw5GQHjO
         IIHbiX/48/9SCH+VNzQLCeXhAPF2SaupVH3hbzBUNuHC5Q/iYQW5MLlMPf2vvBtRsxd/
         5lUZNVNzJBAtWrq+2si7E2rEYkJM20DXobOpHD4PnmdkAQK4i2Kd/9ebe0Dr7ZYOANPk
         Pyyg==
X-Forwarded-Encrypted: i=1; AHgh+RqtXZN9VWc14yS3SZk6s/v5yu06yqUbGAbPJMsK74qyrU7WeHSRVkPjjqSIwHCydeHWYrUhctLCbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaYHKrI+63bSC0mVOxREGl+tz1V50SIdjxfIsBl7o/iECncHlB
	xBpQCQkl4Wc+WanvIdGC9i3lBO1T4WR4g8l2RwlW5pvdEh4/v2dLPLVXUGFJvHLJ
X-Gm-Gg: AR+sD11MKEbO7AwnEafM6UiP21Jlz0LYn02Nqp0nCqAhd9LKgg/PTYriqNB0iVoGABK
	Cv14iW9QiFM2UVJ0gTgAPg1zp0XsqSwdECGhJyxB8m0teJGOIbmJyG5z+I38UbVP8VsAmYjyMr7
	M5R1SVQHqbfXe+PEQ7h663qqQIYGO313eGbBQmXr9pqksLh1j4TeFI924cv/XMGotylGqYKCCs+
	h945CH8H+AUXGetfOsp/uj7ZFtcPtNg7HCXHTPyTJ+zO6e0dymf/HELE5wZGphAbsZocjfH9Kwf
	tLo89a8u4grbZt5sH6u9OWKnXs964EtdiJzjUlV35FUZJgDsoN/gakHVPpQKwz4mSEQhhJqnoCC
	AEq7qrBdi+cKcnRi7vDpUL8wzM9qO2leurIYnEmA22g7JsyGY8v+QWzrV9XXHJ76chdQj4cRAPb
	ywHPCzEJCNDjmKTR0Y77FFbPRqOMjqsO33/miq84uAHg849w3bGEbXR5ZWrLl0L/3tM0iDwrLg1
	6Sk22qa8D8tZlgCaqqb/Jm+CIM4qHH8hYXJVRAI0e5TPDwX98nJHgmAduIpejtzfEjrJcFBne0O
	fyCMPISDExTPUZZRCXSUlNZ9h/57jhHj1h6+Wsk=
X-Received: by 2002:adf:e18c:0:b0:47f:921f:3a35 with SMTP id ffacd0b85a97d-47fcbb4c6dcmr2947822f8f.37.1785438963078;
        Thu, 30 Jul 2026 12:16:03 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc88d6e68sm8231813f8f.7.2026.07.30.12.16.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 12:16:02 -0700 (PDT)
Message-ID: <7cdc0130-6dca-4e18-8f0e-1e7221fb9853@gmail.com>
Date: Thu, 30 Jul 2026 20:16:07 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/zcrx: don't clear master_ctx from the import
 path
To: Woraphat Khiaodaeng <worapat.kd2@gmail.com>, Jens Axboe <axboe@kernel.dk>
Cc: David Wei <dw@davidwei.uk>, io-uring@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260730162741.1125-1-worapat.kd2@gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260730162741.1125-1-worapat.kd2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/30/26 17:27, Woraphat Khiaodaeng wrote:
> import_zcrx() attaches an existing ifq to another ring.  It never calls
> zcrx_set_ring_ctx() and so never takes the ->master_ctx reference, but
> its error path still passes @ctx to zcrx_unregister(), which clears
> ->master_ctx and drops its percpu_ref whenever ifq->master_ctx == ctx.
> 
> That condition is reachable.  A ring that registers an ifq with a
> non-zero event type_mask gets ->master_ctx pointed at itself, and
> nothing stops it from exporting that ifq with ZCRX_CTRL_EXPORT and
> importing the resulting fd back into the same ring.  Failing the import
> after the refcount bumps -- an argument page mapped PROT_READ makes the
> copy_to_user() in import_zcrx() return -EFAULT -- then clears the
> ->master_ctx owned by the original registration, which is still live.
> 
> Refcounts stay balanced and nothing is freed early, so there is no
> splat.  The ring silently stops receiving ZCRX_EVENT_ALLOC_FAIL and
> ZCRX_EVENT_COPY: zcrx_send_notif() returns early on a NULL
> ->master_ctx, and ->master_ctx is only ever set on a freshly allocated
> ifq, so it cannot be restored without tearing the ring down.

Yep, it effectively disables event CQEs.

Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>

...> diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
> index 76b9b0d54af9e..fea2b27272ec2 100644
> --- a/io_uring/zcrx.c
> +++ b/io_uring/zcrx.c
> @@ -808,7 +808,8 @@ static int import_zcrx(struct io_ring_ctx *ctx,
>   	scoped_guard(mutex, &ctx->mmap_lock)
>   		xa_erase(&ctx->zcrx_ctxs, id);
>   err:
> -	zcrx_unregister(ifq, ctx);
> +	/* the import path never took the ->master_ctx ref, don't drop it */

nit: I'd say "... it never set ->master_ctx ..." as it's about having
a ctx and not references, but it's not worth of respinning.

> +	zcrx_unregister(ifq, NULL);
>   	return ret;
>   }
-- 
Pavel Begunkov

