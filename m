Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0C238B131
	for <io-uring@vger.kernel.org>; Sat, 15 Aug 2026 10:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786789617; cv=none; b=C5IFybkbeAY4Z9LutRxQpPajKmk03CmE0rKaz+UFX4kM5R4VvGhgF0fBCVlPAEkjTTTSFzSgTNR7m2ommJHMdGelkHu7iHK4zLL3yH3RW8HEEvXRHAr+bM4fkQSTPq0dFknhAAA/pjOVh6g8sMWxTJWH+g80Mbe70UpTlTJ/NMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786789617; c=relaxed/simple;
	bh=zvfg1aMBcL7aeIVRRxcfIP0e06KZv6Y19r5yBA73lWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DsZur6AbHYDmYty+CMxNi4RhvB0nfKovoKrcmHBwMCftjVW6OOI5CIZlvNFPVngADZUdE3VE7Bcn+Wg8ymXgzhtwIP+K1HeSzcOQ0oQcXojs7LblGGgcN7EkwoZmQY4z9pJLVR0/Zpa/nmi3tWwi3h87z/oTNbj6Q6hxr/DdDwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vs1+9eCm; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vs1+9eCm"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso17484595e9.3
        for <io-uring@vger.kernel.org>; Sat, 15 Aug 2026 03:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786789614; x=1787394414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5LwofxgwMbfokzic1LQKB96aMSrs/A5ouH+Ep8Gghec=;
        b=Vs1+9eCmJ7mDa/4iyK1WrQaifKAPpTCuvgg2MVNLFMpEGRKZoyESomJkOO7CcBSvu4
         DXqgYsSJHcyUaktZQtlTUP5ObXtS4XKrekvnFCm9GF3ox0z5zUgaElpWXcJGB1rkOBhC
         b8lAPDs8+OuBdUsyVyp085QXRxVt13wlrl3HCTB2hfZfZzeErMyHbA/njnDsl3uLaHnk
         F0ZG4kARTeICqZ32aAmUcY+90mIDBlaTBrhN5QaFy6YO5G5dtae/zIMr4HwjqhVRGncs
         M4AozHiEmwkt2U0L6hhmPt6gzKIDOdM24pcgVzlGFQpZ/KN5HIcNPNpzQvEBUYabGnF8
         FpNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786789614; x=1787394414;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5LwofxgwMbfokzic1LQKB96aMSrs/A5ouH+Ep8Gghec=;
        b=WFRUAPoqQMOoWUli4r5t36rsK5shxGU99Wu8HarMEei75ud1aZJFrQ0tTmeN6Px2+j
         kHbT+gkRgLImWh+eygXx0rao7eItm0D/3jtdnPDmTY9HXiMPV/KeqKJix/rKZh6Aq8y+
         mpgdIPCmQjGryNdON7A9FetzdefXcUQQf/Moz1Zc7ZIQHYihlzyjfMeVMiMdm0hzKxsy
         /OyBsyv0MBbEVEa4eQe7bFF2YRMgKmuogGSNRXXBo0QmhkU4iv3VxGblui05Az5NI6tz
         EhNT7R/RvPqECNBj6RzNH95QDizpm0X/hwTzPnThq0gMQ58Pe9c+J7z9oxPDw5N2hAeW
         TMPw==
X-Forwarded-Encrypted: i=1; AHgh+RpivrcjZIRndJbjPu5y3WYQAEw2o/EDS4GykkEMfYZupd/qppkRqOb6oEIIFBWwc6o/erB1oYS5nA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwp0Y6OW6SnwY7332pvPqO7M5IparRBDe+OguDYRz/5AKJDdd8
	fDtjsl5swYbFl1vd0hZkDKXKsLl+AgOaopLmrbM9bE9EP6qe9A/RD5XlL+ipGQ==
X-Gm-Gg: AR+sD120kFYs0cDUSlnnihVhyO1scJ9PanTMaKIHq2na3M3r2OJLoQg/2KWQCcF6qgL
	4BE7388DeqJ/86rfDx1vRkrx2LDsN7oineRqIqq3jMXI+2+GUaf4FOo4K9eTKkdMqnDgyD3vF5N
	XNFAZuB8fMjHrYUxeF92HmhzPMqQ5W6SHnv/dX28e+BQxUFGKGvUNxGkFy2/JxHOb2WQBrBarm2
	n06ZwSErJob7/NBT7ggMLcJILRHEGQ7Fvb7YFa/pP2ewsEHniRAlRv5Sq153K5QUtmcDa6LKi+P
	6wkt32Mnwnty6BdnSDNIZ5K45KPhVI1D7ZSikjQjXUkrnsz807jefIgna1tWqrC0Xozxeos4F28
	hpPU8VwpXsmQaXYUT2YArzPV7px/J3P1zq9iGfWJZDEzhclXO4J1DC+g3v1/6brKnCwnjjQGUCK
	ZU7awnOn2s/qovYIr38/pBAV+KqadZhYv/r2TlPR5c2Np6x6nc5zBmPyIfzd4EXZ/rt9h8jGeqY
	X3QzbwOz1ZkIKUAkXc0m1gHLJvxOD6ZyKVZlMMeczoRZxpl0WqCrjuxeHkvM6QAN9d5b8+Ez9FF
	IDgViA+nCLt31Erwmbp+W3WREPN1g9guDcwxxbY=
X-Received: by 2002:a7b:cbd3:0:b0:493:cefc:d113 with SMTP id 5b1f17b1804b1-4998794c02emr116543425e9.5.1786789614006;
        Sat, 15 Aug 2026 03:26:54 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49987b1a31esm139109285e9.2.2026.08.15.03.26.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Aug 2026 03:26:53 -0700 (PDT)
Message-ID: <bfb153e0-d3f5-433a-963c-da71c1dc4850@gmail.com>
Date: Sat, 15 Aug 2026 11:26:50 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/bpf-ops: wake up the loop task on eject
To: Sidong Yang <sidong.yang@furiosa.ai>, io-uring@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org
References: <20260814030421.61216-1-sidong.yang@furiosa.ai>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260814030421.61216-1-sidong.yang@furiosa.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/26 04:04, Sidong Yang wrote:
> io_eject_bpf() clears ctx->loop_step while a loop may be sleeping in
> io_loop_wait(), which releases ->uring_lock before schedule(). Nothing
> wakes the submitter task after the BPF ops are unregistered through link
> destruction or ring teardown, so the task stays blocked in
> io_uring_enter() until an unrelated CQE event or signal arrives.

If there is nothing to wake it up after bpf removal, it wouldn't
be woken up without it either, it's a mess up on the user's
side. What's the use case? Especially since you wouldn't
normally be removing it from another thread in the current form
of the interface.

> Since BPF ops require IORING_SETUP_DEFER_TASKRUN, only
> ctx->submitter_task can run the loop, so wake it directly. The loop
> rechecks loop_step after waking up and exits with -EFAULT. A spurious
> wakeup is harmless because io_loop_wait() rechecks the wait condition
> before sleeping again.
> 
> Fixes: 98f37634b12b ("io_uring/bpf-ops: implement bpf ops registration")
> Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
> ---
>   io_uring/bpf-ops.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/io_uring/bpf-ops.c b/io_uring/bpf-ops.c
> index 5a50f0675fe5..87148dbd3b3e 100644
> --- a/io_uring/bpf-ops.c
> +++ b/io_uring/bpf-ops.c
> @@ -210,6 +210,13 @@ static void io_eject_bpf(struct io_ring_ctx *ctx)
>   	ops->priv = NULL;
>   	ctx->bpf_ops = NULL;
>   	ctx->loop_step = NULL;
> +	/*
> +	 * A loop may be sleeping in io_loop_wait() with ->uring_lock
> +	 * released. It'll see loop_step == NULL after waking up, but
> +	 * nothing wakes it otherwise.
> +	 */
> +	if (ctx->submitter_task)
> +		wake_up_state(ctx->submitter_task, TASK_INTERRUPTIBLE);
>   }
>   
>   static void bpf_io_unreg(void *kdata, struct bpf_link *link)

-- 
Pavel Begunkov

