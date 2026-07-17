Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115B02F6565
	for <io-uring@vger.kernel.org>; Fri, 17 Jul 2026 17:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784307948; cv=none; b=JjOx4FUcUG3Cy2zJXRRQzq2/setqT6o6CusH4tnXkupkELhjchIbgDo8Vi2qmhQNXnG+c6z/DDoPstTezjV6Cr+CMU/gJLdzLSyaUMW3i8u54lDG39+XFOrNiIw6RAy2UI7wCfXg1QDrvZf67RZ93AI7YLYSbtMttyZY7YMWmUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784307948; c=relaxed/simple;
	bh=3ujNWZ5VkSnk0lQ6pxutjqp3P2rHpQZdizD8vh2M45U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dOfzbwK4GLIOg/tuMbTO9n7HpsUWwI1njnKB+eHVkGMTFB+uimQapcmbSdBcIfetROFZ5gR7CnEkqjEPJUsneOntzzknckIDKdxchTLZAsDNMLPdmk1VOajp7Gw3J4xgYBwApEJYgbg8sP/V1ezVb8k5LKegKLe76DbP+VVjsbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G00zH/Pd; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G00zH/Pd"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4954c0833b4so4633095e9.1
        for <io-uring@vger.kernel.org>; Fri, 17 Jul 2026 10:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784307945; x=1784912745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xtYmWhwRFDnFf2xP6RqyCOzPERkNJJW/5vo0xJcn8Qs=;
        b=G00zH/Pde7/2b5V1QlhKrpcXVAoaPSltm625DFKLbAFZy1DokyHRjgNWkXTQYDmCQZ
         Z83xq3YHVnditS8nPaVPyVZ14zN6fWTzGy4sISlclWpPUqphnhHJhX0qfWl7KSh/BNl4
         hik0+CoNqo/QCugdivq3051pkI4HZSxIK5aPNQcdzM7BoWE4x1pMOm/+aJ8UqxuQce+S
         Q35rEDKJaROEU7Ppk9ns8HvWoiH9f5acXcyBeQiQlh6qcQiOxLKohCZRt0qiQ2zOxBGI
         MjzfF6xJa8wU7IbwK0XrVJzjGxLRQ/KczHBlOaHsgdrd6sQgW0rSPvbZ2j92gaD90sXa
         fAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784307945; x=1784912745;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtYmWhwRFDnFf2xP6RqyCOzPERkNJJW/5vo0xJcn8Qs=;
        b=D2aKSyVFge8EWk+xpagf2KaaSiYusZbnRWqDrFxcsq2dpwh8BDpO5jSLv9Hjc4VKjR
         5YHyUItgHMtkaG0zYme4tJqMh1x62+SNuSGbRKgcNx36OXtqDYqkDwQdA692md+JI3K/
         dqEwd5wjTrjtlMDCz9oZtALvCVzAP7pO4jMVRS0OAA5KuNOF1RK8bFV78+VL/BR4fWWD
         7X7u7BGiQPnoED/Y87Ph2EVQTeLOyyvfGOyTm4GoclFOChjxNAgOruXU8KXViu6PTTQq
         WGv00Lav45gHp1B4EOM/45dVnnCRZvVa1VkKzIP7LdgbuY0GlaON3KmLZEmAFUBV2kWp
         Y/eg==
X-Gm-Message-State: AOJu0YyMmw5f1qYQ/FO654t/P+V8c/9oJywYPcitumlfpY6/1EPWD2Jq
	QlEsJzGTR8MfVDlrLYLPQKT8wp2X7tdNDLCTrtzkSloizHDVKnxkU8w/SdUS94kdk70=
X-Gm-Gg: AfdE7cmqYEYG/wM2OjSUvvZxoQ+w5HCyOQsCmA792Kob+cVvy7uKJwwKzz72oVoN7FH
	ay3DSuy7at+8uzjxV93/2yM+MO2fMwLusJzEAygT0RH4IVzU5XgeGpOt57aG1wf9njdV9IRRanL
	Tw15xOdyeDsTlxzjhEdXTgK9kzkOInXjJjzcBqE9srOXME22ITBPyaE3ZzAGGUvavyzg/mjBqor
	KO+Snlkw5eRxz2j1S8exKaFxL/FdKUMrE1i+ZHIsImf61nyRSFCnzjRvcKLPlFp3JzaebOTiqu6
	mNtBWVga987YXgjTUlrQaMKHn4+sp49RqGBVUmUvI16CUUnv3Ij4klKilCjz37RmOJ7l4r04Xk6
	4viLoog289SFGlChF3ddocQCszYpUUqZKpDDSa8Zyl5QTimmmT/H3O9oi0sR5qhBFFSHEnN8NGV
	aHoy3ZEWeJQjXheG7t466NaWU23liEwjruePnBHHamLwP53x7JI4Q6gcEi9U8GZSpItlGPvpC7n
	dXAwN75I00STovDnN0ayMZSL+6Gyh4Bv9b5mSJwgMur6Y/7gw==
X-Received: by 2002:a05:600c:5943:b0:493:c4e1:40a6 with SMTP id 5b1f17b1804b1-4954a514619mr27893855e9.32.1784307945217;
        Fri, 17 Jul 2026 10:05:45 -0700 (PDT)
Received: from [172.29.218.251] (net203-139-071.mclink.it. [213.203.139.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49548e0fcdbsm65416895e9.2.2026.07.17.10.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 10:05:44 -0700 (PDT)
Message-ID: <4704d3ec-d392-48bc-99d7-33400fcd0000@gmail.com>
Date: Fri, 17 Jul 2026 18:05:42 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/bpf-ops: reject re-registration of an
 already-bound ops
To: Woraphat Khiaodaeng <worapat.kd2@gmail.com>, Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, security@kernel.org
References: <PAVEL_MESSAGE_ID> <20260717154537.129736-1-worapat.kd2@gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260717154537.129736-1-worapat.kd2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/17/26 16:45, Woraphat Khiaodaeng wrote:
> io_install_bpf() only rejects a second registration on the ctx side
> (ctx->bpf_ops) and sets the per-map back-pointer ops->priv
> unconditionally. The struct_ops link path never advances a map past
> BPF_STRUCT_OPS_STATE_READY, so the same io_uring_bpf_ops map can be
> registered more than once, and bpf_io_reg() re-resolves the target ring
> via fget(ops->ring_fd) on every call. A caller can therefore point the
> same ring_fd at a different io_ring_ctx between two BPF_LINK_CREATE
> calls.
> 
> The second registration passes the ctx->bpf_ops check (the new ctx has
> none) and overwrites ops->priv, orphaning the first ctx. Teardown
> (io_eject_bpf()/bpf_io_unreg()) only reaches a ctx through ops->priv, so
> the orphaned ctx is never torn down: its ctx->loop_step keeps pointing
> into the struct_ops trampoline, which is freed once the map is gone. A
> later io_uring_enter() on the orphaned ring then calls the dangling
> ctx->loop_step from io_run_loop() -- a use-after-free of freed
> executable memory, reachable by a task with CAP_BPF + CAP_PERFMON.
> 
> Reject registration when ops->priv is already set, as hid_bpf_reg()
> does for its struct_ops.
> 
> Fixes: 98f37634b12b ("io_uring/bpf-ops: implement bpf ops registration")
> Signed-off-by: Woraphat Khiaodaeng <worapat.kd2@gmail.com>

Thanks for the patch. As mentioned, the patch is simple and
should be safe to apply.

Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>

> ---
>   io_uring/bpf-ops.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/io_uring/bpf-ops.c b/io_uring/bpf-ops.c
> index 5a50f0675..cf2bd068e 100644
> --- a/io_uring/bpf-ops.c
> +++ b/io_uring/bpf-ops.c
> @@ -168,6 +168,8 @@ static int io_install_bpf(struct io_ring_ctx *ctx, struct io_uring_bpf_ops *ops)
>   
>   	if (ctx->bpf_ops)
>   		return -EBUSY;
> +	if (ops->priv)
> +		return -EBUSY;
>   	if (WARN_ON_ONCE(!ops->loop_step))
>   		return -EINVAL;
>   

-- 
Pavel Begunkov

