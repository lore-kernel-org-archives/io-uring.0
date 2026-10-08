Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122FA4B8274
	for <io-uring@vger.kernel.org>; Thu,  8 Oct 2026 14:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791470602; cv=none; b=ErEZbl4Rb1RtldR3cPws8rLNCS1vgjhcmRY4+0XdVp3JptQGbbP4u1hTYsuwXMA+gr5pOlAt0S0cmkj+AGhJzhjVGdahqCJN4OudFxHyWVG+w+g6nvSBWN0XwArO4X/BtzvoglvpPkSskDkPB7sP6Ptz1/HNR4NMGFBAZpys3kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791470602; c=relaxed/simple;
	bh=bVSz5b56bkzLjbvZW0ZLHPuGtjffYa78eWvGcdS66xM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p6egv28TVu4X0iLh+CQGX0amqP5k1pGNkpiq8jglHGsYrDUFUebmKL1+jDfadvoJjJzaSlHqgRRXyY1ApoHvpD8WaaZFdwZk7+ewq0ZshPq74SGr5gyYkcNJmIow+7kgTy6BuNXAfaJSd+uBgFjsC73VZSJRfU92FebfKh2KzKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fj9gfpeB; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fj9gfpeB"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48870973bddso563311f8f.1
        for <io-uring@vger.kernel.org>; Thu, 08 Oct 2026 07:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791470595; x=1792075395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=njenST8z+MlCZJXnP+cCIOtU5L3jm/Pu2Fkh+12SdlQ=;
        b=Fj9gfpeBbMrhhd0fZvS6MBSCZAqK7a3Hg7/wEwYoa/XQr25FSdqUhn5v0t+9DDzSBM
         gRGX2oqqqW+OTrtzobfz2Y6r/BD5cRsKoXNqzmu8rz+c7sJMZSP8UdRKVFU51rnIcRVF
         A8zV9e/mOEqhY3t3EgxzQxmTTxQmhVDzavLUrRYHBdeeiouRU5rXLakCrRX0fSCQLyLx
         a1AuSfLh2GFbUI6X8gQ17JKmbOBI4JZwLJwVCuBaER3Wqsp8nv6Yo8mJVzEENC7NcCa/
         c/5gtN8y763uHwpGzyRMPt9l7j6joXAmWaVttLhGICK0DsHplSE6XBjLFeYNAsJx554Q
         8i0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791470595; x=1792075395;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=njenST8z+MlCZJXnP+cCIOtU5L3jm/Pu2Fkh+12SdlQ=;
        b=wdHTYk56XR1lYHTfTCnb01yPgt6BIgPKjsRRSmkWQTOrVliUTkOQwfNMrK9YXYQ9Up
         EHi8NL8vFY4n5UsZ8KyrVqB3PrkMxMgDTO1vX+NBbTx2rvl+WP9k2EqsWN1hSAyBSAgr
         2WtTocDXn0kJLZUgMiY2cxpQFu23QccMtdHInHZiqwx5sVTfigKORAefQI5DvXUUuFZt
         lceFY0Q9kL1vsfaXgbIoOTY5qojWCHmoz+e4UFbCdqi8MOI0afJs7J0saOonKcHdNKSM
         3VANo+6ljqdM7669C8FGcMllSkCYJt5a9E/Xg+SbjYXPtDdwBA0pKS7sI2obuBW5xyQM
         xszw==
X-Forwarded-Encrypted: i=1; AKwUvBwmIinS+mH4yYoyB8XD/dxM6jAjFKWc4fhIr8Zb8f+jUQquUyc4pqboxjc9XSy4fYxBIKMYfAYR7A==@vger.kernel.org
X-Gm-Message-State: AFq9FYIRY/GGSukf2hGCeffb9Xz90/8yRHE4p8bocMK1UVGvpENnNY8w
	6s06dI3FgoDcaqPcrXmW1h23Prut/v2RC4WbwbYF/sKNynaYMkltff8x8urGKA==
X-Gm-Gg: AYBFou0y+BD3OKT+pS8hhMPshIrDJHXpXSDeie8hA8Nmufced3/EO9guysnPTMDXOtY
	uew0QLYdSiolBkooRFWFVtTh5DPUIi3mRjeI0b+fZd0Za5qqHWcDnF9BbpGXKOxzjS8VTBB46o9
	7inWxKPGIyxEde4fQOEnb+/Vd9UKoWbTOR61HbvjkqFCuTFCYeZZrG7dZcbZUYD4P7AmslbtwLB
	vx0G/tx1AGyqvIIOYxgB1NtwqhO1t7P9xCKMe8anstRBNtfesy5pl8AnDZNOWia5e+yKrnjxhsO
	2Dpj0WoTEhC56f1DAHMH2EsBoKoVjOCOtC0/1AE9D/KGuw9kjq1/+Ej1TNLeQ1Eks/1EURlQGLG
	IY8nuU4QNwwLn6g0mH3baJu+3NUajh1ZbKEwCSlKyIoVEJ12g7GDTM0F2nlnK3Efo/XmzHLF4he
	TLKDMf4IR/jjdX66lpKKBYf1XPEDID+zUYZ6TvIkpSgxXR2Gl33Kmg5/hD1CaMFxTQT2ZCUeWZ7
	rLPd0Pf8GQokNEumZ5A5gSa4V2s0enNkunBAZ1Jbz3R/tL6sHrCsAFmOiq9Yjl7Ht5mKDhC/4Dz
	H9rRAcqEGdS6QjFT+L1WGyaj7SHy
X-Received: by 2002:a05:6000:46c7:b0:488:8347:a110 with SMTP id ffacd0b85a97d-48c7ee936a3mr3668082f8f.7.1791470595152;
        Thu, 08 Oct 2026 07:43:15 -0700 (PDT)
Received: from [10.54.182.141] (82-132-212-209.dab.02.net. [82.132.212.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1ffd2sm11381000f8f.34.2026.10.08.07.43.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 07:43:14 -0700 (PDT)
Message-ID: <20b406ac-94ec-4b0f-a307-08082092ae08@gmail.com>
Date: Thu, 8 Oct 2026 15:43:05 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/cmd_net: prevent infinite retry loop on
 unextractable timestamp skb
To: Bui Viet Dung <dungvn2345@gmail.com>, Jens Axboe <axboe@kernel.dk>
Cc: Willem de Bruijn <willemb@google.com>, lollipopkit <a@lolli.tech>,
 io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261008050745.498415-1-dungvn2345@gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20261008050745.498415-1-dungvn2345@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/8/26 06:07, Bui Viet Dung wrote:
> In io_uring_cmd_timestamp(), the skb processing loop terminates whenever
> io_process_timestamp_skb() returns a non-zero value. If the failure is
> due to a full CQ ring (-ENOBUFS), the loop stops and returns -ENOBUFS,
> ending the multishot command so userspace can drain the CQ.
> 
> However, if io_process_timestamp_skb() fails because
> skb_get_tx_timestamp() returns a negative error (such as -ENOENT when a
> timestamp cannot be extracted due to changed socket options or absent
> hardware timestamp data), ret is not -ENOBUFS. The unhandled skb is
> then spliced back onto the head of sk->sk_error_queue and the function
> returns -EAGAIN.
> 
> Because -EAGAIN leaves the multishot apoll armed on EPOLLERR, and the
> unextractable skb remains in sk_error_queue asserting EPOLLERR,
> io_uring_cmd_timestamp() is immediately re-invoked on the same skb.
> This results in an infinite busy-loop consuming 100% CPU and completely
> blocking progress on any subsequent valid timestamp packets queued behind
> it.
> 
> Only break out of the processing loop when CQ space is exhausted
> (ret == -ENOBUFS). For skbs where timestamp extraction fails, dequeue and
> consume the invalid skb matching the behavior of sock_recv_errqueue(),
> allowing the queue to make forward progress.
> 
> The issue was discovered via manual code audit of io_uring/cmd_net.c
> and review of the error handling paths in TX_TIMESTAMP command.
> 
> Fixes: 9e4ed359b8ef ("io_uring/netcmd: add tx timestamping cmd support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bui Viet Dung <dungvn2345@gmail.com>
> ---
>   io_uring/cmd_net.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/io_uring/cmd_net.c b/io_uring/cmd_net.c
> index 90d4ec7cc761..a5a1b8b66b1f 100644
> --- a/io_uring/cmd_net.c
> +++ b/io_uring/cmd_net.c
> @@ -138,7 +138,7 @@ static int io_uring_cmd_timestamp(struct socket *sock,
>   		if (!skb)
>   			break;
>   		ret = io_process_timestamp_skb(cmd, sk, skb, issue_flags);
> -		if (ret)
> +		if (ret == -ENOBUFS)
>   			break;

Sounds fine since there are only timestamp skbs in this list, do
you have a test case?

-- 
Pavel Begunkov

