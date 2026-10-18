Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD772931C1
	for <io-uring@vger.kernel.org>; Sun, 18 Oct 2026 22:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792361183; cv=none; b=iwbqY0R69t3Gqs7ObYwUTi0y4csRahV7bmPU2Titn5QQpsR6rGycMvtalb5rNcxXhPmCeL1SfRpiAHBBY7u6leluWp/6mWGkZECWRfRFOlmrmShLU3p9lUBXnFofiGVBsO8YJiD9KXwm9kaihrdryI8VquNytIdOqSXWrrA2WPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792361183; c=relaxed/simple;
	bh=oJ1RCHhDuQhTIDQynHe5EJ4gPcOndxffYpI9KHfJzjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uxfsszLq8VAV6u8z08t0vy/a8510FdsN0ixpsjyCAQKrWZgmZYontBkCWgbAkKrmUpql14DbIf+BJMqxCoEdwgLGiqCLsuk2XktH1UuMMC+Z+N6Ksp85Dpp15efLEqizZj1l8LRjC9lwYm/m2BPDY0jqLUmlQL7VcM0HPDtE2jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mOCy5R42; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mOCy5R42"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1e1dade31so4250735e9.3
        for <io-uring@vger.kernel.org>; Sun, 18 Oct 2026 15:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792361180; x=1792965980; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OlFIPIWO5LZ2jnM7OrB0Ju5d/51OdDrnxk5mdcIulF8=;
        b=mOCy5R42uWdMmJdDDeeDO+XFQ2npg08rQWd7zAxdBWBhzEgX0f/4yUXxgcJUAze5tY
         ijeZkUjZTPnuDHoyM2LYvuDYU0gCtneZ95ix+nmnfrDNkqIFS4NONRLFF9caqzXi2YQI
         QRu4TxSxH9/N0QXI9/yUmKRUX+0R/I+FkMXifMyxhIZWi4dXadmoumfn93Rk9l6VMymt
         Q7918YJ+FAjHKn8Vtxi+Eb2vbFLZDxAC7/NIgi0UGWXD4EsT3f+PzjW3pWTgNlyDxYlN
         H+Kw8JP7ckvjOMTBSNbetaF7Ozjn//qlTbXeoqq1JxM3V+IUBFcqZkptJSxM/Oev7phu
         U6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792361180; x=1792965980;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OlFIPIWO5LZ2jnM7OrB0Ju5d/51OdDrnxk5mdcIulF8=;
        b=NHLE0yaSZOawUfqLHUMHUbubR7a28ZR6rSzOlbYogv1b40OLxC9b7CjgrSFvgNkbc5
         Ol7s5TlALxAaDC7tKrbuBpAkt+7ZswW+PzWOkZiMB/QcMA19g4+F2ZMrucyYYNEwrUcN
         RX3k0sRXCWw3OJn0irLANscXmLw9WU80rDr24Ktf6joF5IT2RL2n5nwxfjkoKgw8aY08
         cvi1HvRiLibA+FpHeLaGUUoV7gd6gUkVjKmYT9779EwSEYFMGjvN2E/R7X/r08k55/Vp
         hUYM5jCzTbOe+/vAXTp96gNfykYEcHT6N6Y5qwwg8izex5spz/dx8Jegss455GBi8OH6
         FDRA==
X-Forwarded-Encrypted: i=1; AKwUvBws0If5Q/eVARt+BxJqVSwGOcYeqgXoHjOGXddTTlBdIR9rWzo1EZbg9JLmQeQ8ufK5yBCbNi5oUQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKcwqVi9Bz2hDxLGFjf31eBVtAss4YRlYMxiIsM1quprwGRm0hB
	5vOp+d8ACoa+1oWbuIR3YXjymimi8vIzZiUAB6Rc2/wMmNiKHc/QTcEij3Emsw==
X-Gm-Gg: AYBFou1GPxGaVruhkTxj2Rzs94RvGCsBM2MnNhtGAqpBaysv9NmB5z6pZKg7sD7lWWI
	eCKLp7RQZtJ1BbVBBZ8eyfBVHALUwqX4XAHpeqrJR8X5rNIMzFDvez1p6asq6TaneBzQ1wv7TCE
	5zcBKfjD1wkxQojviftT7KX9Bq+bbbxQQ2rrn3F6xvgooK0Z+y+yh7a+xjXPD+dadQFf0MMrIex
	xyqT+fgZAtma1sq5okgIjO7bqLIU7TjffwdCt2vnIAVb1pkSL0TxbYCY2fVCPlPDLC+7S6Z9vRt
	rVDzk5OssLJDlePVtUgwLgflBf5mLa0lhMBlLReOO86Fhn3h46JoTzcDKK660wO/laVJMjSFNac
	S5eQCyKDqLP2ObIBLp4UCIBZ+l0Y4BouajllazmlYiPPNgo1SWJ6VjUjtVYI2qD6SACiuj51WUl
	TfD5H8G/xdJgZYH5Zktd2IOAeQA4PtGZo/F5xIDX6wMjsJ/IP0x4ldvmac+5bWUWEgUDkHBtDZ5
	DnjTqEVeuTXqjYQU4YQSXNMT/dxF7sMgJbrnaQRU/HDmn6M3IVFVssgVla8cZXSb81AscXoPTu/
	6gRK9npDv27mv7K6OjQztpfmMDyFwNZSAeqTuf+qX4bX5ueQ
X-Received: by 2002:a05:600c:3b23:b0:4a1:cd83:b240 with SMTP id 5b1f17b1804b1-4a1d75ab20bmr158328355e9.1.1792361180038;
        Sun, 18 Oct 2026 15:06:20 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cf05009csm199694925e9.10.2026.10.18.15.06.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 15:06:19 -0700 (PDT)
Message-ID: <79627452-98d3-4e8d-9c37-ceda0796d59c@gmail.com>
Date: Sun, 18 Oct 2026 23:06:16 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvme/io_uring: enable dma-buf backed passthrough I/O
To: Anuj Gupta <anuj1072538@gmail.com>, kbusch@kernel.org, hch@lst.de,
 sagi@grimberg.me, axboe@kernel.dk
Cc: joshi.k@samsung.com, linux-nvme@lists.infradead.org,
 linux-block@vger.kernel.org, io-uring@vger.kernel.org,
 Anuj Gupta <anuj20.g@samsung.com>
References: <20261016103453.1129150-1-anuj1072538@gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20261016103453.1129150-1-anuj1072538@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/26 11:34, Anuj Gupta wrote:
> From: Anuj Gupta <anuj20.g@samsung.com>
...>   static void nvme_add_ns_cdev(struct nvme_ns *ns)
> diff --git a/drivers/nvme/host/ioctl.c b/drivers/nvme/host/ioctl.c
> index 3aa5d2f2dfbb..6343da1f6c05 100644
> --- a/drivers/nvme/host/ioctl.c
> +++ b/drivers/nvme/host/ioctl.c
> @@ -458,6 +458,7 @@ static enum rq_end_io_ret nvme_uring_cmd_end_io(struct request *req,
>   			status = blk_status_to_errno(err);
>   	}
>   	io_uring_cmd_set_res32(ioucmd, status, result);
> +	io_uring_cmd_detach_dmabuf(ioucmd);

It's not great spilling the responsibility for [de,a]ttaching
between nvme and uring_cmd code. Is there a way to stash it
all under io_uring?

...> @@ -275,11 +284,16 @@ int io_uring_cmd_import_fixed(u64 ubuf, unsigned long len, int rw,
>   			      unsigned int issue_flags)
>   {
>   	struct io_kiocb *req = cmd_to_io_kiocb(ioucmd);
> +	int ret;
>   
>   	if (WARN_ON_ONCE(!(ioucmd->flags & IORING_URING_CMD_FIXED)))
>   		return -EINVAL;
>   
> -	return io_import_reg_buf(req, iter, ubuf, len, rw, issue_flags);
> +	ret = __io_import_reg_buf(req, iter, ubuf, len, rw, issue_flags,
> +				  IO_REGBUF_IMPORT_ALLOW_DMABUF);
> +	if (ret)
> +		return ret;

Let's explicitly pass a flag allowing to import dma-buf from
nvme / other commands. It'd be feeble otherwise. We can create
a dma-buf for a block file now, imagine someone adds a command
for those that also uses registered buffers but doesn't expect
dma-buf.

> +	return io_attach_dmabuf_map(req, iter, issue_flags);
>   }
>   EXPORT_SYMBOL_GPL(io_uring_cmd_import_fixed);
>   

-- 
Pavel Begunkov

