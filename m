Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793271188;
	b=zq7Q4wODMvYBNU8P5dS+Dpb/DSW6A/Yd/GgQ/2CaW9MRLgospzg29oAZIQb1C2tX4Xz6
	 2Sib7M8zyYp4jwjaUQzHVhl7FQI4KeWFedtcZDuIo+FcL/hWQB7DPG2T1yllmP1tK0GJY
	 v7BTSltEzb5KiQ/r49UocBklnHCS8kQ0E9Rih3s7piKixD7nygkWAqItECQd7OQmaZjIv
	 NTJr+Dl0N5UmHZxRIGp9zGo4AgxbOY6iQ+uRVCqbf5r+p0l3mr+lYug9rZ7C+Y53lqpWi
	 4gIksOjyIh9n7NHRPG0rVrTjGZOSJtN15RJi/eKLoYR/F/0eeMB/7OVvD0dMOOXtC3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=z0T3u86hkedH3eaRgGYwzQ+GOmGeNII7gwe8E9j9n9o=;
	b=J78pEO4T3fTFWfjgo6YJpZctm1OIlWu1Zg45cNSu8DHg5NJOOb1WiJsL1nkHhkGQZGe8
	 pVuu6f3LaKggxeI9IwYML7RBR+DyY14a5LbVEu1JOfVx16e+beD4TkNYUv9sPLgmAjqT8
	 HHl7UU9jNzawo3DKyRgAuuKzcsefnEBL5sYu6vtiLtDiPW9ixW55iigxFMD4H60K1+Am6
	 1Q2vw+crHDh7mhDzs+tYDvEQZKgBTUzREDuawu3+XCZg1AvImXSeqJmlYJt9ZZMB5Q3sW
	 MZVGR7xgvnKqUzG2iiDeJRW1DJ0kAuSmF9sF4wP0BPXeUZdX7nIdURYCgi84z/tkg3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gEWQuLGs;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFE0606A329
	for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 10:53:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FFE0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gEWQuLGs
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48b042c0759so1015820f8f.2
        for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 03:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793271186; x=1793875986; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0T3u86hkedH3eaRgGYwzQ+GOmGeNII7gwe8E9j9n9o=;
        b=gEWQuLGsb2TWmX0i/zb98QqXRohpXAUBYFR15k51NTn882zLijJLOBqff8ZfnuUmyt
         6RfN7+niFBOK+6GRKUBK/NQT/i9XIRCKwnU8hfjqfyQQ/MiFetoiPQYssIAQt9sF1tFd
         LX02L9zCnUP+FnGYH3oCTfUMCTASFM4uXCwKSbuqeAfeA8yt1jJPqyGLcozcFXrk82hf
         86jjryjNii4aQuls1B80pjo+fV1Z7k9ENiktohfS+inmtjbGv7lUxX/5v6jVKBjFGycZ
         fQL24LEvjAxaLKAy1GJ4d3OKLkXUfZXmrKaPpK9M0BqiMPdIyyTI2mqFlnHk+arUVi6n
         1i6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793271186; x=1793875986;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z0T3u86hkedH3eaRgGYwzQ+GOmGeNII7gwe8E9j9n9o=;
        b=cfofhZWPka8KFuMHNlQUcZeRy5MKlew764f8xJugw8vTxxqXG0xV5LbYK6RQDawYeh
         AGnRAsCeFSz/emm9wj11CRWTlbQzGLB6gYLoeiJz9RABDPiopniohO+d9Dfgo1CZo5io
         TQuOW7iHiJ/dbaDOwAj03NMGUQICgPfp5Hv5fnFfgGO2ddRe3FQ5XmlnnN7J+7lRvPEY
         I8YnFtiHjV4htDOFKKJnVb5U0lZv6J4zMbixyd+jNIvBoSlFQc/lui0pap6GvUPJ2BbB
         by81jVHPPoS5QXkgeksGn7d8v7WwveJumORzC1Kkd/aFJzN2PcxmAOp6cwfGD0SB/eO7
         Y9XA==
X-Gm-Message-State: AFq9FYL8nUVXT9Xrra64zGvt3AeWyWAodaBQK9PL+bCWBERgO3widvgH
	67+ePDdXDYCv5dIdY+ANhXrH+D2uj/d/iGiutIFGJBT7zlH4lsV5yrwHQ5fYyQ==
X-Gm-Gg: AYBFou0PgWbH4q8lqkXgDvQnffsyB1BIRSNUNtcam9xCql2trYdZiyrVMN3IP+edfw+
	XhsoGHjwKwhM/0Z+jm2Vk5zKhULkbJALGX8eH3MQ0IG7KnYbPteWg1Uw3skksskFt+qo/5PG/tQ
	8jWEbUWmQqTpCe6RX2CIYs8rYyjFUXwWe1KcJxDZwhtsN7bCIwjzYHiFy+qPfztjdx2sxP5284S
	qIfFhTeQKgfEUQiyYLYMjRvCAPdEZZIfEJQyAp0IpC4kfEhMRyCy4xsNeMNVZmIFiLQSp7qpGJ2
	cYECo6b2WyD9/wOydOg4Ukh2L4LJ2jMHr9B+qB7OsQtXl/1FHyoNCtLsc33apH3GekKMjTye6Qi
	Bz2LlUmAY2wSb9ZMqzs1u3T20oCIoCEqtfZyc2/rLEcMFapQJFUc+AWS+pGm79PjLklKSWOLkK3
	YhivMkXVLrzRPoy+Z3CMCR/a4dx3bwUmTAztVOjj0YKg/ohNZM7mct+Y4vafVwSCvgk9CN4KARM
	HYso7lANKasP6nI/gG8Bef7O98/I00DiYrnf6gh6OhqehciahKqoOntzEKZukMn8jhzDw71Hs0e
	HZFWFDhipnvxGMWWEoJ34uAnUZTjRIvg3JPt+aUMCjWOskFH5Y1qBDzqGxeSeGE2bpjt+7WM8cP
	D1UnTqotTvid1ExQD+tngX+Ttbs55yVtF1FhxtlSYGwzOftxVMy4tFxssT+Q1eeu7C086RgNsoL
	3oO8j6M1eWzGGYxbMBT1hTdK8=
X-Received: by 2002:a5d:5f52:0:b0:48c:69bd:e971 with SMTP id ffacd0b85a97d-48e5d2e6d40mr12705105f8f.16.1793271186318;
        Thu, 29 Oct 2026 03:53:06 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e412cc164sm31889960f8f.7.2026.10.29.03.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 03:53:05 -0700 (PDT)
Message-ID: <7fb73a55-c7f8-45bd-b12d-e46f1efcbe67@gmail.com>
Date: Thu, 29 Oct 2026 10:53:07 +0000
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
Subject: Re: [PATCH v2 5/5] nvme: support dma-buf registered buffers for
 passthrough
To: Anuj Gupta <anuj1072538@gmail.com>, axboe@kernel.dk, kbusch@kernel.org,
 hch@lst.de, sagi@grimberg.me, James.Bottomley@HansenPartnership.com,
 mkp@kernel.org, bernd@bsbernd.com, joannelkoong@gmail.com, miklos@szeredi.hu
Cc: io-uring@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
 fuse-devel@lists.linux.dev, joshi.k@samsung.com, anuj20.g@samsung.com
References: <20261022144501.2478417-1-anuj1072538@gmail.com>
 <20261022144501.2478417-6-anuj1072538@gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20261022144501.2478417-6-anuj1072538@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 15:44, Anuj Gupta wrote:
> From: Anuj Gupta <anuj20.g@samsung.com>
> 
> Allow registering a dma-buf against an NVMe namespace character device
> and using it as the data buffer of fixed uring_cmd passthrough I/O.
> Complete through io_uring_cmd_hw_done(), so the dma-buf map is released
> at hardware completion.
> 
> Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
> ---
>   drivers/nvme/host/core.c  | 16 ++++++++++++++++
>   drivers/nvme/host/ioctl.c |  5 +++--
>   2 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index d81462e864a4..6157ff839929 100644
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@ -8,6 +8,7 @@
>   #include <linux/blkdev.h>
>   #include <linux/blk-mq.h>
>   #include <linux/blk-integrity.h>
> +#include <linux/dma-buf-io.h>
>   #include <linux/compat.h>
>   #include <linux/delay.h>
>   #include <linux/errno.h>
> @@ -3982,6 +3983,20 @@ static int nvme_ns_chr_release(struct inode *inode, struct file *file)
>   	return 0;
>   }
>   
> +static int nvme_ns_chr_init_dma_buf_io_ctx(struct file *file,
> +					   struct dma_buf_io_ctx *ctx)
> +{
> +	struct nvme_ns *ns =
> +		container_of(file_inode(file)->i_cdev, struct nvme_ns, cdev);
> +	struct nvme_ctrl *ctrl = ns->ctrl;
> +
> +	if (ctx->dmabuf->size > UINT_MAX)
> +		return -EINVAL;
> +	if (!ctrl->ops->init_dma_buf_io_ctx)
> +		return -EINVAL;

Let's return -EOPNOTSUPP for consistency, with that

Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>

-- 
Pavel Begunkov

