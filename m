Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793355971;
	b=K+FWfHJbleIQi3P7TQtUMaFMjNIkhf86Enszm/72OdDP3HsmdPPtQHXj971OVH/DEs85
	 oGHqMuYVjcchvn+r0ZcQdkM9lwv+UxiWxkrvMUDCUtjZKZbAJzuJkWNOHmp5f63H/5XJh
	 0f6U56MTf9pXt1dc9jU/npju2Gh8NzLNo+r9iNuZOcJ2Z9feXe+foHBzNoFL+0dfpZQlv
	 S9aCCGeLbkhRNkQz9JLYkEzGAN5pyCeneEZRRPLNF601lklmMlMvAbcCIImIulHUFXnO+
	 k2+TVHVld7zix1ZBW6CwysgKfFf2lLK+zUbyqhR8x/cfsekwfvstVIaOaiRBiCx+zNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793355971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qUelzvzI0I1/N8qXjV1BcthIIh2qTCSRp7SQgDbPekE=;
	b=Yz3t8a5MhFS8x9ATW2R04+XKO04qCMdIn0CC8PqeARLWNbTuJXZhFaFnbZXt5rp4hhYw
	 +Hc9gRYeSStidiOomvdY2x9ZlmhBRsXqv3ja2nbeWLWPz6LezI/XO0xUPoXUlkudYeriK
	 3N4+dMy8szs2XSt9b1hfaLoTc0IyQ3Vu5mCwqMWJ5/C+Fo+YMEJuN5YaWubZJFyTyfvJ4
	 TNXfrfrg3nYby4wdfVJJ57wOpfFZGWThFyeOUA9Qllt45rcdD8eiHgbDGFteD+RGfrB6Q
	 5uoHLVyk3UQLYK/eXfAVV7vB2olBD2g7p3DxoTwaLOyo/rGaWGdPJbb2uxJSfEUeYCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PhLMcOaL;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E242606A31D
	for <io-uring@vger.kernel.org>; Fri, 30 Oct 2026 10:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E242606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PhLMcOaL
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so980591f8f.0
        for <io-uring@vger.kernel.org>; Fri, 30 Oct 2026 03:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793355970; x=1793960770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qUelzvzI0I1/N8qXjV1BcthIIh2qTCSRp7SQgDbPekE=;
        b=PhLMcOaL7tR16t9O6qwnKaq504i2yptLi47qNgV2oTRgaJFinkcAjXKqL5IyImiZtT
         SP97MVdHIjdTbyfAFuD7U2d6bVxWfhydX0ZOhHdPc0l5OeQ+E9c+PSj6Rf4MLvAV9dRa
         cLD8CqB18+b5RCnqDP/SbF9KotPj17RkpymGVZef9iNn8w/r+UfrIuj6Nep9ElZ28bjf
         qKWVOaDHUGTmSZuLNgsKzw0EgGZFipgVCdG0lzH8bCGTiciYoyATJl9h748ncbkk0418
         WE/xegpkV4LyN4mWZ3GeIFEnBBrL9gjhvziGkyy0ia56EMIZDyW6cn4RHfAnJFwhE41Z
         cFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793355970; x=1793960770;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qUelzvzI0I1/N8qXjV1BcthIIh2qTCSRp7SQgDbPekE=;
        b=beTT3qz7Q2G+XaL9WZa0qs3pfF8jYiW19A/UPDC/8EZ9xG6hyPhDck0PqZQz3mti7m
         uOI4i1qmyEkh6HjEZrT5AdCBldD9R3utgmSTplFp8Ctqc9hEzBd96FC7S4fFApvedSja
         slrKS2pdF/Q4anSqIRMwH3Knv+KPRfIH88xZhG+k10sN1xmYX51jmgs30gLz9P4c2xrk
         i4KEtdRg2Zq/qQ3HJ49qG5Hf565KWmZ0mSlAlSXZyZooLYEVmMi5UwYqS0XdI7OubptH
         pwsR1pxfvmHRLaVqLvLw/oqk7TPnyhPMABopAEdyqUQEbVfUUm00uDqaCJurTBJZYXxf
         Ef/w==
X-Forwarded-Encrypted: i=1; AKwUvBzilrGuVhnodaN1uxAQAqw7o9DbK8j7wEziY+i72wgNbSmQOU0AfcjohjWk0nZQHwCOCxxrpL+iDg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIusuvItxm2BPftV1630S36LJ13gOPVpwG7Jv1jaqy8JYPNzSY4
	Zbq1bbD9jDarn9m4D0/LJVxFLGi1PthryvtJRA0GhTlY0JY8agw1jPgF
X-Gm-Gg: AYBFou1Y9DUJpswTYxDDr0leIjVgjvdI9BVT19zDhpK0j+yACqAOZS0rbURakoHc+jM
	D8TgSz7cAdVDm6L8ft7hSGAlhWk2h96JDVgL8MSn42ISWrkl12qwaABHDRe7Is+eCwCf9nyJkVq
	sRk78m+t2ikhvv9b1AR9fHCXeY4TS/BjZGhz4IMvg3WFXKcIRuRJqOc8IyBlmxrGOBMfHrB2Tja
	H7x/5TpVGvqraBesDHO3GzKLJdXrPYGwsa2Wl8NOHxOfYPAE4uIRaTQsl4JkK8edkPOeDnWLHy5
	ThCtib4Lhm69U5whLDJE7oTYL7pTCc56GN7jeA92QmAFCiKDXT2LkUfXmUKHFUE6vdz9FaG1mZ7
	2Zpwj2BAnb9iHCZK6PCdsseOrl1WNB/4Pn18JDeqhZOudZAm6NpXio2U+c/Q9LReaXqEUInrD5Y
	YrXNUhUp/F4rWMDCjPwtYB/MqK87FhqjYDnYeaJYS70uXnQut5uk9CNjBtkhD3DF0M9ogi61fS+
	noHFt3/DnMYkuntg9nPS4xDpEKIvh2So7/sTTRRxA3dMswUKP+RcNweRESrE0tidWi6+YT9J+hK
	gUD8gVPtMGOSVO9C/tB+mG0BijjzYV1Y62swIAA9Qdm2Lc9qHfx3Lw7T2qS4ur0DwM/u34uq2Jx
	Zhl3oCLu8kM2eEJCCcB7o0NOIG0rFF6Vh7SWKTWcGmP6afvxVBJxWvrALODyNrSppy7AKo9yGXy
	o9RQ==
X-Received: by 2002:adf:e011:0:10b0:48e:6c3f:f7b2 with SMTP id ffacd0b85a97d-48e6c3ff7d7mr5879996f8f.23.1793355969523;
        Fri, 30 Oct 2026 03:26:09 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80ecbsm2527884f8f.35.2026.10.30.03.26.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 03:26:08 -0700 (PDT)
Message-ID: <bcafcbcf-9503-4fe5-82e4-ab9f8a3cb687@gmail.com>
Date: Fri, 30 Oct 2026 10:26:09 +0000
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
Subject: Re: [PATCH v2] block: only fail dma-buf bios that need block layer PI
To: Kyle Bader <kbader@redhat.com>, Jens Axboe <axboe@kernel.dk>
Cc: Kyle Bader <kbader@ibm.com>, Anuj Gupta <anuj20.g@samsung.com>,
 Kanchan Joshi <joshi.k@samsung.com>, Christoph Hellwig <hch@lst.de>,
 Keith Busch <kbusch@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Tushar Gohad <tushar.gohad@intel.com>, linux-block@vger.kernel.org,
 io-uring@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261029155821.2983229-1-kbader@redhat.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20261029155821.2983229-1-kbader@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/26 15:58, Kyle Bader wrote:
> From: Kyle Bader <kbader@ibm.com>
> 
> All dma-buf (P2P) I/O to a device with integrity data is rejected
> today, at registration and in blk_mq_submit_bio(). Only a bio for which
> the block layer generates or verifies PI needs that. The block layer
> then walks the bio_vecs, and a dma-buf bio has none.
> 
> Reject only those bios, and remove the check at registration. Then a
> submitter that attaches its own PI, for example with
> IORING_RW_ATTR_FLAG_PI, can do dma-buf I/O to such a device.

Looks good,

Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>

It's also enticing to shove it under the existing
bio_integrity_action() check, but it can be done later.


> Link: https://lore.kernel.org/all/bbb87d6b-b7a3-487a-8be4-27f3f9ce4a1b@samsung.com/
> Assisted-by: LLM
> Reviewed-by: Anuj Gupta <anuj20.g@samsung.com>
> Signed-off-by: Kyle Bader <kbader@ibm.com>
> ---
> v2: a shorter commit message (Christoph), and Anuj's Reviewed-by. The
> code is the same as in v1, so the tests of v1 still apply.
> 
> v1: https://lore.kernel.org/all/20261028181412.1919506-1-kbader@redhat.com/
> 
>   block/blk-mq.c | 9 ++++++++-
>   block/fops.c   | 2 --
>   2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/block/blk-mq.c b/block/blk-mq.c
> index 7fff1305b..3fc9fdeb3 100644
> --- a/block/blk-mq.c
> +++ b/block/blk-mq.c
> @@ -3138,8 +3138,15 @@ void blk_mq_submit_bio(struct bio *bio)
>   		goto queue_exit;
>   	}
>   
> +	/*
> +	 * The block layer cannot generate or verify PI for a dma-buf bio, as
> +	 * that walks the data pages.  Only fail the bio if it needs that, not
> +	 * if the submitter attached its own integrity payload or if PI
> +	 * generation or verification is turned off for the device.
> +	 */
>   	if (unlikely(op_is_dmabuf(bio->bi_opf) &&
> -		     bdev_has_integrity_csum(bio->bi_bdev))) {
> +		     bdev_has_integrity_csum(bio->bi_bdev) &&
> +		     (bio_integrity_action(bio) & BI_ACT_CHECK))) {
>   		bio_endio_status(bio, BLK_STS_NOTSUPP);
>   		goto queue_exit;
>   	}
> diff --git a/block/fops.c b/block/fops.c
> index 01bc8afe3..5c8024011 100644
> --- a/block/fops.c
> +++ b/block/fops.c
> @@ -947,8 +947,6 @@ static int blkdev_init_dma_buf_io_ctx(struct file *file,
>   		return -EINVAL;
>   	if (!disk->fops->init_dma_buf_io_ctx)
>   		return -EOPNOTSUPP;
> -	if (bdev_has_integrity_csum(bdev))
> -		return -EOPNOTSUPP;
>   	return disk->fops->init_dma_buf_io_ctx(bdev, ctx);
>   }
>   
> 
> base-commit: 45b716456dd99488a0cef58482120dc0474aa696

-- 
Pavel Begunkov

