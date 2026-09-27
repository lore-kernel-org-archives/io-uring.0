Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18806231829
	for <io-uring@vger.kernel.org>; Sun, 27 Sep 2026 19:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790536583; cv=none; b=et+1kS/6y4Acwn3KT3yd3cNtVwmXyAJz4fyrq9aNEzEBO/zZb9hX3HTyC5PS88tB0zTo4BdJHfFWXrbkOf3/dC/1i5Hrf65H9I84+tWlzBsBo+Yw5NmiWbG/SreUWOrTVxkIwJhKzHh90pq1dP8q7u2hr8B7weVFSF3pTThYDB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790536583; c=relaxed/simple;
	bh=T0JUWRzx57iOTA1KZI2poUKNYg5hQ2DvWkFi/iwU020=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WER0TISgLm2tpd457K8CzxrokZtDszsqeErevGSf5pU2UfuPwzDNX//7Kgq2BZoBgYVo2kUZbe2IpDgSYNVbMG6RyrNKjUobx6I+y7rNw7Lko+e5sfCPEeDpJqHoXo5pIuSHhZIwYLWuNH3itxApjwAGvkj7DhhxF1MrQAvLVAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PgFPX2Sh; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PgFPX2Sh"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so12821585e9.1
        for <io-uring@vger.kernel.org>; Sun, 27 Sep 2026 12:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790536579; x=1791141379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LP3SPyinwD8fn1a8RK+gsX1s+9bGZ+MpdPQLG7wq3ns=;
        b=PgFPX2Shy2UiLP3eP0qxk5y+ogjxxsN45w/3pj7qsPUMaAepJftHkpsF/A5scnCqo6
         baf+x7GXYXBP/jC10fV9HhDhK09eM8eIhCsihJeGu3qKWHSiCdBADEtMpEikX766TFX3
         8EPGOkQ7TUoWmv3APZpnNVmB8ObG9UwhAGc18iG1ngdOktZaeXug8b0pjns1JrGX4V0R
         FkzfnmizYZCPjLajLYfc8GtngirIrZF05Q7L7gQkHl/QXld/SjK1vr/eMhSY58t4aF2t
         zv4IplIyXiOXXi9/2ptTlYDCCaVEXGonuTFN7IMIuNwBpyX20OnugSwGzS9sbqm2Gr7S
         28YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790536579; x=1791141379;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LP3SPyinwD8fn1a8RK+gsX1s+9bGZ+MpdPQLG7wq3ns=;
        b=Xe2e5VkAODi7DzBvuNzvp9wOmwTbBTCF8JbFwV0jXxq2oIoXFoi3SUcMjazAq6TLZO
         xPpJ/WnKXqC3UYQem2rBGERT4DyERPy/1hNne1wFNZbwIBa1GA+DN9yxeAhRFOMApV36
         RCATNAoS+70G6RTL2CeaLPVSY8EHDu7wNetdhDJRmDDpbbeCrMl12b8rFFFQue6RrvXm
         vNkffCh4Lqk3XDMeltyONvs97KocRrOZn/E+71uQ6bUA03DyB24l6bUHZsu039Zg0ufu
         TJLUKiHiiSgIrv0DWm3+yuEfXijZiCGEMTLOjp8L2c3wSWwQIW5U/zKaG8DIT92fvrZY
         QLgw==
X-Forwarded-Encrypted: i=1; AKwUvByZ12NSKMmPyQUkam0uEe+80g4S4P2H4yFcH/xoxbKUG/Kpiq1anr+/3uJ/J36ZHFczmP6Az3Oc2A==@vger.kernel.org
X-Gm-Message-State: AFuF++nRqkV9GkiQQ44SEIRlcScj6afImBGkeLzqaSOdHgTZfuYfFdbD
	L2L7k5w10LkQSoithrnDg6c8UYgMWoYnjw4MjeudlVMlkTL+G+N5ti9F
X-Gm-Gg: AYBFou3eBviS3ks8mHh+jBp6li5St0QCEUcyAsYx+xSG6bCE7uKvO2+PhmE4nyppJwR
	Qqm67c0sLO4Yfnr3dtEijPIfk6s1utkRL6alRdLANbzNqYuKXrJUsXYpPHNpbFOPLNij/1/VBo/
	JsGA5VTtQyktrj3y2uaCnm99qWVmtKA8puo6xkW+Om6EdgsDbf0zGHpBO547vrDfX4KnA5YPmyA
	uhCbhuCFvlGbfcTzsHdcuEt0A5FzUGgU83CeJ90EwLEfT2UZiYHlTBjZUfIaTZtmMaky2irSbJ3
	OgRifMjT8SgpUF2VoFfN6tZBzW7E+xo8id1Djl7yqNeK0qvS45sq3dwAKtRo3S6qiRHbqWhmiyx
	lfTQJJAN/C0rtBDbAcgJ2UQecmBczRV/+oNxHVNy4izcq2zNfoRTebvQ+vATUdRJNjUmheZP3Q+
	RPg0TAjjc/Yh/QTIBNsdeinlGPF0Q+KR9QbklWvBtbTqQuQ7+At3BONTjtmrvBXjxY8R+gFdLdL
	CWi9kSkD/U0GC0NL9TxR7gNvDJy1zVghcyvR/aY1DdTUI4xTn0S/hpmcphBF8WjuYnyrjdN8Px1
	dpxA2qVpRPHlsyVTFX0Z1stTUZRPXYRkCBxQQH+xqGP0wShF
X-Received: by 2002:a05:600c:468d:b0:49f:f9d1:e618 with SMTP id 5b1f17b1804b1-49ff9d1e6b1mr76692205e9.17.1790536579591;
        Sun, 27 Sep 2026 12:16:19 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0018e6dcbsm75325005e9.6.2026.09.27.12.16.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 12:16:18 -0700 (PDT)
Message-ID: <e2e61157-896f-46a2-8c85-8e64b4cdb004@gmail.com>
Date: Sun, 27 Sep 2026 20:16:16 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/cmd_net: end TX_TIMESTAMP multishot when the CQ
 is full
To: lollipopkit <a@lolli.tech>, Jens Axboe <axboe@kernel.dk>
Cc: Willem de Bruijn <willemb@google.com>, io-uring@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260927074206.65427-1-a@lolli.tech>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260927074206.65427-1-a@lolli.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/27/26 08:42, lollipopkit wrote:
> SOCKET_URING_OP_TX_TIMESTAMP arms an EPOLLERR apoll multishot and, on
> each error queue edge, posts one 32 byte aux CQE per timestamp skb. Aux
> CQEs have no overflow backing, so io_uring_cmd_post_mshot_cqe32() fails
> once the CQ ring is full. The loop then stops, splices the unprocessed
> skbs back onto sk_error_queue and returns -EAGAIN.
...>   static int io_uring_cmd_timestamp(struct socket *sock,
> @@ -135,7 +137,8 @@ static int io_uring_cmd_timestamp(struct socket *sock,
>   		skb = skb_peek(&list);
>   		if (!skb)
>   			break;
> -		if (!io_process_timestamp_skb(cmd, sk, skb, issue_flags))
> +		ret = io_process_timestamp_skb(cmd, sk, skb, issue_flags);
> +		if (ret)
>   			break;
>   		__skb_dequeue(&list);
>   		consume_skb(skb);
> @@ -145,6 +148,12 @@ static int io_uring_cmd_timestamp(struct socket *sock,
>   		scoped_guard(spinlock_irqsave, &q->lock)
>   			skb_queue_splice(&list, q);
>   	}
> +	/*
> +	 * Aux CQEs cannot overflow and the poll is edge triggered, so nothing
> +	 * re-runs the command once the CQ drains. End the multishot instead.
> +	 */
> +	if (ret == -ENOBUFS)
> +		return -ENOBUFS;

I'd make it a 3-state return instead of relying on
skb_get_tx_timestamp() not returning specific error codes, but it
should be fine for now.

Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>

>   	return -EAGAIN;
>   }
>   
> 
> base-commit: a3bdf68feecc57af5c11fb599f860ac9790ffad9

-- 
Pavel Begunkov

