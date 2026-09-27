Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4956F2F6920
	for <io-uring@vger.kernel.org>; Sun, 27 Sep 2026 18:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790532835; cv=none; b=ROwPhmQQlve2F4YUIp4DO1uO8Cu2ZftePmP8qxQZo7f7uUbDVPfmGLOd/SZalS9MRLo+U2C1/VPzBDKJlgyWM4rY4oW/2BjIaqDJUSlP6LaMjMKu9anBdHgyBQLd2WR7QB242Ruq2swTglvLzb22nnaqvJk9FVys0v9Ncs62x9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790532835; c=relaxed/simple;
	bh=3oTqZsbJwBRoOJpwLKg7GnbiVVZPitNE8J6RjqQk/4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uy5XbwYPIB/7FAdHOttajeKvGy0quzvOLX+G+J2VykBNYOyuhkqwieVEIKena9Y9w5OhGT2QX26G0KDq88fvrXFpWjE8aWNgfz0LDqfqvrGW0r1shaUINbBS9FgUocTxpDmiygiEBgBg7KWc0Wh/U7ZGoauWicJqI74W+BqyqAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JF9gFlGp; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JF9gFlGp"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d8239so18879555e9.0
        for <io-uring@vger.kernel.org>; Sun, 27 Sep 2026 11:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790532830; x=1791137630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yF3ar6bs1d3X9n2jCLXGnKhuTUv7JBFcQdF8WKwyH2w=;
        b=JF9gFlGpgwPJb82PVdfCZRfJ3WDPJZTdO4VhQ/I64R3nqQyNoHTIU/TUvxW944Tf8G
         gdtXvAsgkx1kTuIVShCwvkuPvzbySf8OqLTsXMNY8ttU574BLotez4mM77FWagv5ESm5
         a+XMKtIaOTAqqTavfP8qSxxjUWqJ4gzn/O/Mp3TJ4Q1zh1A8XnhxAE4ZKuwruXtxztmV
         K3hl9eRg0uWIoQWI1HE6DwZUIACZdUpZjrtxuQ1slvCzwz06+ek0JEwyg77OXAadJg9B
         ZewnVUsTsGUQcRjvbLKi/3vDn5Ak9EnuGPoNpx+JVtKMw0OqK/cWttbkbSl6ijFROE/+
         IUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790532830; x=1791137630;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yF3ar6bs1d3X9n2jCLXGnKhuTUv7JBFcQdF8WKwyH2w=;
        b=GmiKVZTsBFnwToCA5ysWhV5WFkimgkmn2nCWQray2XMeN3O6RNnebYcXH7jqVqbg65
         tqo0Sbg/E9wHc5Ww5Sa3mZkQsG+24aycqRXtrIE7b9XlvWiDQg70sdLWa3cbdlKUknUc
         8SxK2gBFcbJ35XLHKokt5tDfi19igr+X60aC2yUYH2Spno0O9eyEPhwd/2bE+eapHQ0n
         6Ge9U9mAKnlo8UucYTfgogda2PMBD8FhuPZEq0vwe0oR2VvnBr7g/2jD83+jcv3A0x9F
         b4StdAC95OyDNqdk499MpGBoN+peeCUVtOhw4NkOsJklQUm/uONNKPRUnVs4fmHguVuH
         Pdbw==
X-Forwarded-Encrypted: i=1; AKwUvByoH172l/uSTlaJJj1sxnt2bfu0jOjKh7KN0yWc6AoeUzkA0SD11coN1XHIRLVg83e6iUznWfVR/Q==@vger.kernel.org
X-Gm-Message-State: AFuF++lSFA2B7tEsCnDQxLib/pmuCmEjwGkdBf96pAYnFh1nn+jBslP5
	e+eUDCEcFpMAm7jec1N3WyvSPRgTQOR+xvMYIKaW/8RwSqr/GIm4D3Xh
X-Gm-Gg: AYBFou2rerxpax5gujEFIQ66Qp9N4aXSu61IsS7FFoIcpoGTjn6pvKQGcEOA8iPgaOs
	EPF4XmWSyz1AliTZTBYENP7yCtyM5ZT+5btvR6K/Oj7OhiDzvpf1vqcOAchJ7Ya2DmMjkqLXuYI
	C6IDkrxuDDUgduiQeb3ofsxbN3xGKpMF1cLOShgozQziezEMK6aFXZsX+087tKdwZ/iyLN8z7wT
	KV8FDXv/JE1IbPXK5rUAxmyXQoKAfMKAmuUNnsDHLMwKTsOgif1Uyy/ESSCUyEueTfvG+cwW6zJ
	PXnC014b8/BzPan8mygdQEQxvg7vs8q+Aj6Z8RCmOf7wc1KL/KRen7ViwWZh3Jk9uMgx7H5QD3H
	M7AQWfKPU2WVJoNff6a/EZs/peWWRkPCLmALxjdIOVdQ+vNlIT1/TmDWx/TR7IFISfnMlhZCOzE
	Ar0tqrtYqP4JSCDbZ1jLVXMCbEllOihbI4UIdgXIff9jqW14O/dNOteBHZHSjSCMZM1SvVoqBFS
	PYXTVchfdimlcauv8/0ggB/xq9kgQkuM4/qAOABbpyIcLsmIQKcliwAW8lKhqyfZEI1uKexKPVD
	J7aM4mHrqdQOzR5Fsw0TV8YF5sAaTpQGs078KUhr78ae3+74
X-Received: by 2002:a05:600c:1d06:b0:49e:69ff:c6b1 with SMTP id 5b1f17b1804b1-49fe7bcc25dmr179111265e9.31.1790532830326;
        Sun, 27 Sep 2026 11:13:50 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff141948dsm89612395e9.1.2026.09.27.11.13.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 11:13:49 -0700 (PDT)
Message-ID: <e6421d43-3388-4e02-aece-42fb7034746f@gmail.com>
Date: Sun, 27 Sep 2026 19:13:47 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/3] net: devmem: use memory provider helpers for
 net_iovs
To: Stanislav Fomichev <sdf.kernel@gmail.com>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, hawk@kernel.org,
 ilias.apalodimas@linaro.org, axboe@kernel.dk, sdf@fomichev.me,
 bobbyeshleman@meta.com, almasrymina@google.com, kaiyuanz@google.com,
 linux-kernel@vger.kernel.org, io-uring@vger.kernel.org
References: <20260922204348.717198-1-sdf@fomichev.me>
 <20260922204348.717198-3-sdf@fomichev.me>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260922204348.717198-3-sdf@fomichev.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/26 21:43, Stanislav Fomichev wrote:
> Use public memory-provider helpers for DMA address storage and page-pool
> association instead of open-coding page_pool state and accounting.
> 
> Zero the net_iov array because net_mp_niov_set_page_pool() ORs
> PP_SIGNATURE into pp_magic. Reject DMA addresses that cannot be
> represented in net_iov metadata.

Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>

> @@ -247,7 +245,7 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
>   			goto err_unmap;
>   		}
>   	}
> -	binding->area.niovs = kvmalloc_objs(*binding->area.niovs,
> +	binding->area.niovs = kvzalloc_objs(*binding->area.niovs,
>   					    binding->area.num_niovs);
>   	if (!binding->area.niovs) {
>   		err = -ENOMEM;
> @@ -274,8 +272,12 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
>   		for (i = 0; i < nr_niovs; i++, niov_idx++) {
>   			niov = &binding->area.niovs[niov_idx];
>   			net_iov_init(niov, &binding->area, NET_IOV_DMABUF);
> -			page_pool_set_dma_addr_netmem(net_iov_to_netmem(niov),
> -						      dma_addr);
> +			if (net_mp_niov_set_dma_addr(niov, dma_addr)) {

I'd do this chunk as a separate patch with stable+fix tags to
keep it minimal and help backporting, e.g.

if (page_pool_set_dma_addr_netmem())
	// fail;

Looks like the bot was saying the same (with an extra wall of text),
but I guess it depends on whether you need it backported.

> +				err = -EFAULT;
> +				NL_SET_ERR_MSG(extack,
> +					       "dmabuf DMA address cannot be represented");
> +				goto err_free_niovs;
> +			}
>   			if (direction == DMA_TO_DEVICE)
>   				binding->tx_vec[niov_idx] = niov;
-- 
Pavel Begunkov

