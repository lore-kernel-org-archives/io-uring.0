Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0E412F585
	for <io-uring@vger.kernel.org>; Thu, 26 Mar 2026 02:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774490948; cv=none; b=NrcCQ9u8b+vlwzgAg1kY/zQSEXKuJutCFhZdiok/ulvyY6RGEdhVpxNg2cjH4v/nWqS69RWTzVmBwNEDGI2FiNim6CvHaj4gbb4K/Z95Sm669BBYblFYE/TLd/1ZFkl7QW/YD5qPM1ZQ6/iY90b0z21ollRJhY/u4ApyPnYaTgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774490948; c=relaxed/simple;
	bh=8CtA1BAah7T7CAmtZQCzfJlkSKfvDWcJhiWhNoRCb6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AKeJ/8Tvygf0XYKDPx1VE+f63fmhcVeN3bFjmjkjkIvFq08/josBGGEgvZm53tnAKwGB/oOwAzXaaMQdERjEVJpNJv7lpItxurCs3/sTZ0ELGb4KaCMsFzJJ1HLTqTtkmRAuLEzZf72FW0FkLI55ieR5cOvIj5TCVN6tyyTfwq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=XZTCR6yo; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="XZTCR6yo"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-41c420d1460so220898fac.3
        for <io-uring@vger.kernel.org>; Wed, 25 Mar 2026 19:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1774490945; x=1775095745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/JLU1gejQqZao14J8ooTXxU2npvtEHMcTdwtYoGa0cQ=;
        b=XZTCR6yoF4SfzVzvKZi96HuQsADCXc86YUN/3/bW65y7VwizK4CAc1e9IvV7LMFZJv
         bUOUl+oJlhIf3qQ5iN212G/8ZUv0KvXgjODEFbk4NM887waOUO8XaAVwp/C5LRfyUJAA
         bHBHHsR6HinoAcaFI72tBtJ2r6YTTLNL+b0Q4g1ylvTgsxJdc2hODc5aVGlBDVvx5y/M
         HpdiY9FF3txnJnQU4ncpVldUnHQGQTCVD90TcXagDkknxlMo13PAva7fuTcK8b8hzVWm
         fUiuMyKAX8hmpNEbNN3I4YDAOnSEtEt80jnQ1Tl+ilsKKrJJPQkp52lIS013nuy4x8cc
         wLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774490945; x=1775095745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/JLU1gejQqZao14J8ooTXxU2npvtEHMcTdwtYoGa0cQ=;
        b=Ca6PSRulyHENP5nWhPJctK1RFquw+jG0KvuoNz/UcgOCT6LbQ/3Hdqr1sXmI295TQE
         QpSNh94QkCEX7YwiqMcQGH+KZxYR3yrCxCr9n9ld392c9ECOKhXQq1tIu4+3iDSAMc9n
         VeIUK0mNZyZ0yID/ciQdZSBbZyz1t/4kw9zsxd0ZFxO7KK9Wouprm4N0HrCyQn3MiKV2
         SSIJpndUSycczb7/VvQwTTH30Nr0Q1QEjz4BN5p2WwS+2gfpKqND6Jcf5uwha3ocJcK0
         JxT/2ay/40VfRvFb0H7PNgrILaOK50D+FhMzHYzU5XHuQCSf75uYwBY0EcCwKkbZxJPW
         VXxg==
X-Forwarded-Encrypted: i=1; AJvYcCWk8fsrKV7yXJY3X2I8uRLavIfzZdLbikmwbjIMpsoEPgmZkpoABHE2z0Lq7+gc1hgefJksmkbJXw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/UEJmc3jVWk7Ox+YRB++/Panja1aznm/a/8GdsVUBvcEWlSt8
	ffFTC12ZvP/35/njAuwEvAqI3QK40Vw1o4glYh8XpRHOgKx+4O1uGVIhpb9zHYqwO+k=
X-Gm-Gg: ATEYQzw35fwq9SgAWMI8BPbAL7tGnJe09QSiXs+7q9m6KYZbv+YcFgaN5V3G3mIkXtK
	szCLdcibOvASHxC2rZH5lSasH5Q+tht0ddJZCcUe/euqzbCtSHeQskxaDOsO5OkhawapOb0d4RS
	xU8DVaRoy+rO/TZtnNgBmV/aTXHZVRTWIsInXfHwBp/X+zTIIc0cakqMJahMw0QmHaOq4TTiSck
	2maILNAbEguDDg727k0NNSdeHkp4pQTKxIThGCuF6K/Dz0vzSg5vC/cZdUBD1Zy3hs9M/i69YQ1
	6Josnucn2O14S5Snj3Sb8UCyHaS9qFsUaNFRGybPO4ruGW8pxopjdoZqIl6FVPYFM8bSKpkByYY
	MIyUQkrTNFb6RLwi1/63G1Iz94DG7dHfJcuYoDIdgR1Gs6zPzjVgsLaDB5DoZHAJAg7+msR88vx
	1rXwaWJ71dskVZsFYev/fMR05xHbb6U9ZeiDSyaWL1y64J/jMhNaPkcPEzIXzhNRccXRYI9QC1/
	D7qovxLTbkrlfGZbFN2
X-Received: by 2002:a05:6870:a797:b0:40e:dcc9:c3a0 with SMTP id 586e51a60fabf-41ca6df1502mr3200041fac.17.1774490945480;
        Wed, 25 Mar 2026 19:09:05 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41cc7b3e55fsm1192963fac.14.2026.03.25.19.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 19:09:04 -0700 (PDT)
Message-ID: <b7216cd5-68f4-4ab5-b1c8-b1c71f38fc00@kernel.dk>
Date: Wed, 25 Mar 2026 20:09:03 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 05/12] io_uring: bpf: extend io_uring with bpf
 struct_ops
To: Ming Lei <ming.lei@redhat.com>, io-uring@vger.kernel.org
Cc: Caleb Sander Mateos <csander@purestorage.com>,
 Akilesh Kailash <akailash@google.com>, bpf@vger.kernel.org,
 Xiao Ni <xni@redhat.com>, Alexei Starovoitov <ast@kernel.org>
References: <20260324163753.1900977-1-ming.lei@redhat.com>
 <20260324163753.1900977-6-ming.lei@redhat.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260324163753.1900977-6-ming.lei@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/24/26 10:37 AM, Ming Lei wrote:
>  int io_uring_bpf_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
>  {
> +	struct uring_bpf_data *data = io_kiocb_to_cmd(req, struct uring_bpf_data);
> +	u32 opf = READ_ONCE(sqe->bpf_op_flags);
> +	unsigned char bpf_op = uring_bpf_get_op(opf);
> +	const struct uring_bpf_ops *ops;
> +
> +	if (unlikely(!(req->ctx->flags & IORING_SETUP_BPF_EXT)))
> +		goto fail;
> +
> +	if (bpf_op >= IO_RING_MAX_BPF_OPS)
> +		return -EINVAL;
> +
> +	ops = req->ctx->bpf_ext_ops[bpf_op].ops;
> +	data->opf = opf;
> +	data->ops = ops;
> +	if (ops && ops->prep_fn)
> +		return ops->prep_fn(data, sqe);
> +fail:
>  	return -EOPNOTSUPP;
>  }

Any early exit should ensure 'data' is sane, so that the cleanup doesn't
potentially touch uninitialized crap. This is something that has bit us
in the past. Not an issue for this patch that adds the code, but it will
be once the next patch is applied. Better to clear ->opf/ops here
upfront, so that we never leave this function without 'data' being fully
initialized.

-- 
Jens Axboe
