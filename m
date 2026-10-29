Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793274693;
	b=H54ic9gNhQ2+XmMiqmfwpIjjSuJzl02y/qwrBVAkyk32NOgD0Nn5vrkeGAJNdBUiewaQ
	 J75lkH0yZQso7PRNXTDDqSt3iUTSWAU1wZY5kneJyRzNOP7u+BvnjMUT9uh2N15c3cz1N
	 5rKCL96tAz/LPzW+wZEopZnsBeCSDKC36Z0CHm5fnfQOUEdDPds92A+QjfvM/Og3eHvxL
	 zI6bH+cpia8A1328y4MiO0GZgr4RIMmhoOrH1xatDYk9G0Yld844KoaMz3SwocojXVk1Q
	 MUQ1jDy1w9L/yX8R82pEMM4HYBwTDK0xqyDPSNgL6xmQ+GQzhJYkgxEdoTIJG1Sx1qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793274693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=FK9xnQsk0+KWozuuwP8x71kNiKRFmMpgW9T43Fhprkk=;
	b=sbmWyr+JsZTsvyLPT/AfsAqeuNvvu9HTatLwRO1oFT6eeqyLYnI1gWEhYAWc+AlnI1k4
	 fWFQK1qEzlsOwjU+2seqDvTJN3w7J7MR0LUgsC/xg0YTycB9BoCHBLdusJP7NB+pqiQtS
	 uz/7+mtK7VO2UFWOBX8tmBI0KP1lqJgdf4dgd2HF+/svcVbv7mrvbUNo/kELTWKh3SlTB
	 kVTF8Kqaj2/Gn1AXvYLhS8lpn+A20mhuzpEFvBLLL7WUf2YhCfeoAVvDhMiPpVjQEV61W
	 PJaxk6LH7BP4FWwoA+07JYFYK7RVk7UzZ8f6VTWPpzrBlR3S0xEWiXfYoX3D/VT3Z0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p9KFT7Yn;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B254606A31D
	for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 11:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B254606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p9KFT7Yn
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a214af2076so16893245e9.0
        for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 04:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793274691; x=1793879491; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FK9xnQsk0+KWozuuwP8x71kNiKRFmMpgW9T43Fhprkk=;
        b=p9KFT7YnaqPSxuIbgTURifQthiDJmRsyZlWBb8zu051M7e5522WXQRxy7V0aWT5qyP
         VRRLLUIwp6qNXOHjhdajIOZolCj08fY+kWHhAbbexIT6ffXvMFTI6fJEO5hzCWv04vd4
         LduCO1+t4XaMYF86uxEMvmJ1OtpjboW09KHa8I49zbbMN7fhMNw3nNAKU91wnnAaDy6p
         zWAfNPS/DZNTT4yeisNpGslRrg7Cp2H2+odFA25e24STpGbldi5/AkvCBqPP17ikw7st
         8Eer9aARnSKPheDTL8RTJfT/lfZ+u4kMCWIpepKzy0wiggmYsay91QFPvj6HtPvowbwA
         HthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793274691; x=1793879491;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FK9xnQsk0+KWozuuwP8x71kNiKRFmMpgW9T43Fhprkk=;
        b=Lba1KFaXjAaLGu8AGReiwR9DyNvzVnD5JywQFqvsuLRKeuNvz+Awuo9eeikeGYcoy6
         omm7rZIepJz/uvWNqHk8win9MINIjksrdbe5f1hsaGAKaMgVNIGBzcbO9B9IKWSkLTOU
         YQYC46Go3kP47I1t+yUo9pXuuZLBnfHlFNZ+rxTWAn9GyC9oJq4cKw9ggsO7q5yXO8qM
         G9EgQ5lwnrAhLZO14WHGX2ry+NvU9JC2xkUhKBkK8C33Zwb/+/EmM4zBOmcxk02EyciK
         pkyXgmKPmS0yTYPeVW0mfbgmbB2FYjrO7diTBU/KUbJN1RkugvaHUY8kRlwv0QzZARUG
         q5AQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIwEjMJ0s60dHFXGjbsiyhhq8oUD0vFDDZ88G4UuiEeVmLswKqJwVbHZYPKtiCXyrv1zSskx/UAw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLNmwXzSJbilprz6y2TRUbV6LMH/ITt2+lQ6uK+47xdvrRM4riB
	jyPqWD5q9fPrZHLDt3Vx408MUsxlqOrJPirfUdvuUE9INxONc59bRdQ94kAOog==
X-Gm-Gg: AYBFou2kurREvBzCs+luEv0LNHY6MsU4iCjx/FkwMS9v9O2oJ/5z9WVMhrh/qkHorGe
	5xTCXHs/mpjBPlfvE0bhyEnDpgJr0O1I24vAxMAcf/40X31CRj5Y0UQ9fNufBJCbXhtWmNY4Coa
	sE1za9fQhiYN8Tseu8L2J/BPlg+vei6nrOnt+OBu6XqD+PosBtqQ7ixowoLjDTc6MwV2+UybQFg
	ceTxdnmncyC4qKF8ESuv7LQgkjLrOiGS3NkOqR77bsuLIBnb+5P2IIZlCR13Cr+CZSJ/KVOwSeu
	80bcLxGgJV7q2L+lMTjny4waX/5L4cKAbvjZxqEV7UqNxE75a6zl9lF0UatilOpstc/km/Vg76L
	9LdUkYCAqNdVn+Tz5eOixfHX29jHItDKadxz73n9MtvcQtYofEscAoc1R+vStn57hgg4NUOiZa5
	m/NP8EmKfC/pRtpIqlopIRvI+/hE3UjAtNkN0wR11KVh5yIJ2xqgSEkE7qGKtslI3P2jkACvXpH
	KrIVCZZFdldMb/47I9Hb0SNXf22rQ2Dq4c/kgeh3zQ3+VF8ky/Lsz1FaKkHC79Ufo1qhe9n7+ij
	4m0Lnn/EoZsOKFkT8G6Wr4eLSoML3r6OeTHXvnu01Wqp9OGNe1l1X9mfQ63wOSpp2DpF20T/RhR
	rEHa1/uSa0oxHnOY3dtzRFNZX22o16/3f/qvF8cNoYMYw51Nlg0elQvQYEkEL4SGe0wz6dSrpY3
	EP+w==
X-Received: by 2002:a05:600c:4692:b0:4a2:167a:c939 with SMTP id 5b1f17b1804b1-4a9667756c9mr115880235e9.21.1793274690699;
        Thu, 29 Oct 2026 04:51:30 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm59046015e9.11.2026.10.29.04.51.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 04:51:30 -0700 (PDT)
Message-ID: <134aa376-7441-46e1-8d04-be327747b4a9@gmail.com>
Date: Thu, 29 Oct 2026 11:51:31 +0000
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
Subject: Re: [PATCH] block: only fail dma-buf bios that need block layer PI
To: Kyle Bader <kbader@redhat.com>, Jens Axboe <axboe@kernel.dk>
Cc: Kyle Bader <kbader@ibm.com>, Anuj Gupta <anuj20.g@samsung.com>,
 Kanchan Joshi <joshi.k@samsung.com>, Christoph Hellwig <hch@lst.de>,
 Keith Busch <kbusch@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Tushar Gohad <tushar.gohad@intel.com>, linux-block@vger.kernel.org,
 io-uring@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261028181412.1919506-1-kbader@redhat.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20261028181412.1919506-1-kbader@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/26 18:14, Kyle Bader wrote:
> From: Kyle Bader <kbader@ibm.com>
> 
> Any dma-buf I/O to a device with a PI checksum fails today.
> blkdev_init_dma_buf_io_ctx() returns -EOPNOTSUPP at registration, and
> blk_mq_submit_bio() fails each dma-buf bio with BLK_STS_NOTSUPP. The
> checks prevent a crash: bi_dmabuf_map shares a union with bi_io_vec,
> and bio_integrity_generate() and bio_integrity_verify() walk bi_io_vec
> to compute the guards over the data.
> 
> Only the BI_ACT_CHECK action walks the data, and a dma-buf bio does not
> need it in two cases. In the first case, the submitter attaches its own
> integrity payload, for example with the io_uring PI attribute
> (IORING_RW_ATTR_FLAG_PI). Then bio_integrity_action() returns 0, and
> the device checks the PI as the submitter asked. The block layer only
> touches the integrity buffer, to remap the ref tags. In the second
> case, read_verify or write_generate is off. Then the device inserts and
> strips the PI, or the block layer allocates an integrity buffer without
> PI in it. This is the same as for any other bio.
> 
> The first case lets an application read data into device memory, for
> example a GPU buffer or an NVMe CMB. The device checks each block and
> puts the guards in host memory. The application can then check the
> data, or combine the guards into a checksum of the whole buffer. The
> CPU does not read the data.
> 
> If bio_integrity_action() asks for BI_ACT_CHECK, fail the dma-buf bio,
> and otherwise let it through. Remove the check at registration, because
> the integrity payload comes with each I/O. With the default integrity
> settings, a dma-buf I/O without an integrity payload still fails with
> -EOPNOTSUPP.
> 
> Link: https://lore.kernel.org/all/bbb87d6b-b7a3-487a-8be4-27f3f9ce4a1b@samsung.com/
> Assisted-by: LLM
> Signed-off-by: Kyle Bader <kbader@ibm.com>
> ---
> This applies to for-7.4/io_uring-dmabuf (45b716456dd9).
> 
> Anuj's check in v10 fixed the crash in blk_integrity_iterate(). This
> patch keeps that check for the bios that need block layer PI, and lets
> the other dma-buf bios through.
> 
> The sysfs knobs change the integrity flags only with the queue frozen,
> and blk_mq_submit_bio() holds a queue reference from the new check to
> bio_integrity_prep(). So the two calls to bio_integrity_action() give
> the same result for a bio.
> 
> I tested in a QEMU 10.2.2 guest, with udmabuf and with an NVMe CMB
> that a small module exports as a dma-buf. The namespaces have 4 KiB
> blocks with these metadata formats:
> 
>   - 16 bytes, PI type 1 with the 64b guard
>   - 64 bytes, PI type 1 with the 64b guard in the last 16 bytes
>   - 8 bytes, PI type 1 with the 16b guard
>   - no metadata
> 
> With a user PI buffer, reads and writes pass on all three PI formats,
> and the data and the PI match. This is also true for a 2 MiB I/O that
> the block layer splits, and for four commands with one PI slice each.
> A write with one bad guard fails with -EILSEQ from the device. Without
> a PI buffer, a dma-buf I/O fails with -EOPNOTSUPP. If read_verify or
> write_generate is off, that I/O passes. Pavel's rw-dmabuf test from
> liburing rw-dmabuf-tests-v8 passes on the namespace without metadata.
> On the PI namespaces it passes with read_verify=0 and write_generate=0,
> and with the defaults it fails with -EOPNOTSUPP on the first read.
> The tree builds with CONFIG_BLK_DEV_INTEGRITY=n.
> 
> Without this patch, every PI case fails at registration with
> -EOPNOTSUPP, also with read_verify and write_generate off.

Thanks, looks good from a quick glance, I'll take another look in
a bit. It might be nice to somehow support kernel generated PI
as well later, looks like there will be a good bunch of cases that
might want to have CPU access.

> If a liburing test helps, I can turn the test program into one.
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

