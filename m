Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEB953D0C5
	for <io-uring@vger.kernel.org>; Tue, 22 Sep 2026 11:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078295; cv=none; b=IGU7BY+I8rlqS288CGF5eEt2bDe4wq1+IHLpqbxDy5+4deDTlutmP8G4xjbql+sKMlx/N5zR8W1VTchaAETCgr2OHfECpbt9B2WxczruAGDa8gBnGr3yFvnfPOWwCSFXjilczl5Wyrk5u7HLWPhG2FfPn0r6qilzsWzQhjlCgdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078295; c=relaxed/simple;
	bh=RAkfzGCXN6pWO0EfBm6z3Wn5nFucYngHlXoDrgBix/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y8Vf+ftGGDLGFV1MCHrFrzXA+Q3x7+nFY+kBUZVz/BaZjzANpoTbyL58FN2THWcxDFhEk+UT4j2oOHgjvrzafbKWSnPFldPQYLdmpFtr1SprlZdatCVplQh4/vDxwuVjh/3r+qI0VyMUpVvGRnV6ofujktgQwLXuQUFy6J8AV5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ltPWyzLc; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltPWyzLc"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b91369d18so30279475e9.0
        for <io-uring@vger.kernel.org>; Tue, 22 Sep 2026 04:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790078291; x=1790683091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WOtgqwncF6XihHwgRKkqX9nGF5AEwjzyzvACEifWDFw=;
        b=ltPWyzLcKM5IYwsV2Pu4KUQxBCUNCbcPHZ8xzUnikvQdW9gLP7YpXQ1QUbXsihjcap
         HqlDT0r8t/wTx557An42D5ESKntxQLdJ1IhKxYL8EXYbJrSfhFPqT5Dh8aDHZrlc54mL
         hoNxneUxcpPZXSKDG0gH8tx1SKcShTJeSf9AMV86tV1I9PCdsjQCb590If3iVhE27l8X
         MBekM+/w895fjstqD+E/MAD1jUF08h10briVWXxPtz30gLOdjg8WM2tgavIeHiUj7guF
         rYVwbL7J8VRdM/Bo6RpLDUjnMNKC3c9zMI05pybKopy9mlTXZK34qViRUHQxvUgltYZw
         O5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790078291; x=1790683091;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WOtgqwncF6XihHwgRKkqX9nGF5AEwjzyzvACEifWDFw=;
        b=amFDEPY+QPDUZjN8ZV9g9gxJ038ZdmELioYF/CHA7kNJMrcJsoCA+n4to/1GprXkDm
         9Xd5mWVjEVP92gkhzJLFQltYAeewYNBDja529XcHRlhhqrwD0c2j4dbZbNuv/mzSGRYw
         OxS3ICTWshvEbwxSrlOjYNpoRebRELyGiUOhyLirLsgweMBpaEs+q7FrHd/uX752FQwk
         xvy269w53/Q68tGZIdyeXmKDjbMi4UiT7c/xiLRS3Ufa0YynVsV9gTdeePfgLv3vvHP/
         JomxmAgYGtzeustUfwCix+eEQzYyESj0uB8L92sDN5v6FJEzyUvMXv2IdbM8Vnq0YbwL
         uSuw==
X-Gm-Message-State: AFuF++lHVVHo2PJI2o1Cah6GLa9EBNutEeMj+HMrWFJ1pC2zlMtcT4n2
	3nAKjteXF4qkFmKqze/zPe2XUO9DIPin2U23apz9nNBrcFYQ+Y5HH3Qj
X-Gm-Gg: AYBFou0lUW9hQ0aUd/L6nC2A7D962ZGpOq3c3wmelWtzd7FOFf++bLGJJueRy79bt/6
	jGw7uFk5V+QjzfU8kmhIewMfOEWV7b1MQBZInKkHgwSYFDhoLetZ131g07bLJ3RCEN3WSyEwOyb
	003ckYWs+kDz2n1GnUD1ipHy1yIfXITD4VOkdlw57b7w4GySYmXdvlx6qlgnGlPubENmHncgj1O
	Su4xJiYFzBUJyfJ7F2Fnp0PocOZ48tx20YadTRxeR+2VfvDCThN95tuUKUkBJA8Oq9VYo9g1gj8
	O42EyAbOCiYTW7UTqhrVJuAR9sO2zhiXKdHWNNtujqHX+thqqD1Xqtt/ILtF2giugc3rPbQOyg1
	pooVOBG7Gc3foRKIcvICOQ6zppiRrR9PneHpJY0dOLTMEKkQBUV6ROIdl11iJbff/VACZh8usPc
	kj4VwvNodBis8pZ0EdAJQvTSpcaQSvxOO05CTpwmCUhaYILQa+g3eYC6ke76oLF/XjNFFEIJW7/
	G/P7qiWEHAQaYthDrq/tdbIefF19rbB+0W8DPDta5yRRCzVUOwWps8WypcIvcUQVDCrk5WDG1dL
	BuVLxSWY/+fmcG/Q28kxeXMu5s0Eksu4GnPxySXtRXB1QXqJ
X-Received: by 2002:a05:600c:8b8b:b0:49c:fc6e:a3dc with SMTP id 5b1f17b1804b1-49fc584fd80mr175912595e9.27.1790078291186;
        Tue, 22 Sep 2026 04:58:11 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdad3669fsm52023855e9.8.2026.09.22.04.58.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 04:58:10 -0700 (PDT)
Message-ID: <d6d9cb28-50f1-474c-ba11-d634fcaad394@gmail.com>
Date: Tue, 22 Sep 2026 12:58:07 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring: initialize task context before running the BPF
 loop
To: Yao Kai <yaokai34@huawei.com>, axboe@kernel.dk
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 liuyongqiang13@huawei.com
References: <20260922065443.359417-1-yaokai34@huawei.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260922065443.359417-1-yaokai34@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/26 07:54, Yao Kai wrote:
...> ---
>   io_uring/loop.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/io_uring/loop.c b/io_uring/loop.c
> index bbbb6ef14e6a..c923cae6dfc7 100644
> --- a/io_uring/loop.c
> +++ b/io_uring/loop.c
> @@ -2,6 +2,7 @@
>   #include "io_uring.h"
>   #include "wait.h"
>   #include "loop.h"
> +#include "tctx.h"
>   
>   static inline int io_loop_nr_cqes(const struct io_ring_ctx *ctx,
>   				  const struct iou_loop_params *lp)
> @@ -84,6 +85,10 @@ int io_run_loop(struct io_ring_ctx *ctx)
>   	if (!io_allowed_run_tw(ctx))
>   		return -EEXIST;
>   
> +	ret = io_uring_add_tctx_node(ctx);
> +	if (unlikely(ret))
> +		return ret;
> +

Looks good in general, but can you move it a couple of lines
up before io_allowed_run_tw()? Thanks

>   	mutex_lock(&ctx->uring_lock);
>   	ret = __io_run_loop(ctx);
>   	mutex_unlock(&ctx->uring_lock);

-- 
Pavel Begunkov

