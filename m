Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E495145562E
	for <io-uring@vger.kernel.org>; Wed, 23 Sep 2026 11:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162457; cv=none; b=EmV7hs4aCG2zOFOlek6UB/w/HTYg0oddnPnzhhtjtQj+6fZZ5YqLPRvRCA/T4kYi53MLc6vxhGxfJ25/4OJrfPzfSA4TyQIvPFWCGTkSHWaD1b9p6+NMxthiijqbY/17QHr61XJ8qmEyCEBUfRkRrdeztwmzArXqar0CKGfegGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162457; c=relaxed/simple;
	bh=dkCYIGy7ewfey/y0ZE5AeYeLuJJKgxHtBTLg5EbYDFQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ABgq+NvfWz2Ye4ezGREaVbfuW/p2Q4Hrh9svswSaThY6JTVhtLwgas2uN5DWJ+/UbdH92bWUBQUETK7VXk8Sw6M5gF2ul4fvKwimjT2ne0ST12MJpAorl3YWd24LCeL/Z6QHf93Y4nXzmaVKbcOUlt/vEkPw6SJU2lFb2qH1Vk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=OFy2faL7; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="OFy2faL7"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33c0d931083so265648eec.1
        for <io-uring@vger.kernel.org>; Wed, 23 Sep 2026 04:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790162454; x=1790767254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aAEFPeLOj1rrdsBvLBB3+8Aa2ZZ3RTslVOp08bnnZyo=;
        b=OFy2faL7RphRkuZlM9rCGZZdBDH65oW1bkhK3HZgNh9JYrPclnpVqcFXCLbL+OuHEi
         TgF+KTr8/eGaZBuljnlNEWc7NTFiyrTknEMJqHwFdNYeBX9zZynhM1KHOqpNa+c4X/zs
         l5MxL1seBlGb3PKZUoD5BtkVGxNPjfuu9lX4LqQJdsTNtzHHzle+nJK2LLxoHAILjObC
         opRj2GI2tQ7xLAG1odHsbQX+UYgNimKnk+DOGLRdN17ghH7zmh5IRneksScThZITdF8u
         37/ZdX94gzIPqmh6psHAEP2IBr8GnY7OH0y3hpGrBop5+w4yyN9mgfcK7kG7l+c6DEiM
         EN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162454; x=1790767254;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aAEFPeLOj1rrdsBvLBB3+8Aa2ZZ3RTslVOp08bnnZyo=;
        b=XjE4sm8D+wGeVimXg30mxJ0UzyvzcCCePsKrXDkCN3il7vXBksZ4JBN0L/iGA/UnHC
         eyzwqwiSHlFZYB3Noi6R2AXVW3QeTXPBCmZJhSm+G1wpQ/N48CQGzomtvfobZhiWfdR/
         JfrKnn4QTT5kpzRFb215CjKYiWickARi9gE8b+7VAV2uL0COGhgX1x0MVGk/3Xa7UdwR
         3KzHULNC2v2l7hG7+hSPixXNhxfmpM6X4X2NdkQBnwErcqSuG7E7+NaH6frUvj2DIwYw
         T4+taNcVkIAEMg/ItJ3pIS93PRFPq6dQjc3ahqF8FS32MwFxCl/OWARXI3r4BWvmPBuo
         f3Sw==
X-Gm-Message-State: AFuF++k3TYQ4hJhBmMnWcJdr46y/FCHN7M9uUzHOC1nfaP+f7EIHyyxZ
	Z5XXQnQsSmQsaE4BgfJj4CuaywRxFTCDJOdKwgkixGEtjUm5qQQVLqrFfaHTU/vSL1I=
X-Gm-Gg: AYBFou2Wqli5U+9bCbiaNBCEdojvc167gQFYgySlUYuAqE3dy0Zz0PFecCAZx3y0QFS
	AJcN4GANAOCgyZzFvPGF0zPeP3p0bwqIbRyEAC0KyREzqiAZZXpIMb2d1XfKPqTY65pY39W6lUY
	rFTb/FmmWBqDcq7D83bN2D7OHHYvtEreLaEtiFkoOX4FrtOWi1Q8BdRyfFhNYPpYchSUs5m0L4m
	AOPDF2XJHaxjBiuugglggpISBjakWITgYL8zuYTXlRfPiM3t8VJFU14ROxe8wElvhBwAweWUC6R
	vR6+dH2RRdsC1iLqumbsfLmJPPXo3KnMTzQbJGmgoKohshM0OYSCFhtB1e7rW2arRfnfhrB0PIY
	hT/0RgNmhevyznMoB43XuQe/GDrfG9tboSTJagO/KpUXl9H7LpxBGHYsHiINJ2HHWYkl4HY5+LJ
	r9hY/zT2IEF8pIyXfg9MDepn5n7topH51t5OJGTVrw2/JdTBorcHvfDR13/+swbsxi+KMvbSx7a
	YJRCYYcspQPbC3toMFFU1+20lRvx+XG27d6c/cNqiNPsOh3OF+moBfcsz2omOE=
X-Received: by 2002:a05:7022:b88d:b0:143:37b8:5007 with SMTP id a92af1059eb24-144f8d4c260mr2325173c88.2.1790162453502;
        Wed, 23 Sep 2026 04:20:53 -0700 (PDT)
Received: from xps16.local ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm9585269c88.13.2026.09.23.04.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:20:52 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: asml.silence@gmail.com, Yao Kai <yaokai34@huawei.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
 liuyongqiang13@huawei.com
In-Reply-To: <20260923014310.591292-1-yaokai34@huawei.com>
References: <20260923014310.591292-1-yaokai34@huawei.com>
Subject: Re: [PATCH v2] io_uring: initialize task context before running
 the BPF loop
Message-Id: <179016245270.15533.17265529698615728091.b4-ty@b4>
Date: Wed, 23 Sep 2026 05:20:52 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Wed, 23 Sep 2026 09:43:10 +0800, Yao Kai wrote:
> Submitting SQEs through an io_uring BPF loop can trigger a NULL pointer
> dereference in io_submit_sqes(), as shown by the following arm64 report:
> 
>   [ 2049.380301] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
>   [ 2049.388788] pc : io_submit_sqes+0x48/0x6c4
>   [ 2049.389153] lr : bpf_io_uring_submit_sqes+0x10/0x1c
>   [ 2049.396310] Call trace:
>   [ 2049.396531]  io_submit_sqes+0x48/0x6c4 (P)
>   [ 2049.396893]  bpf_io_uring_submit_sqes+0x10/0x1c
>   [ 2049.397293]  bpf_prog_1a2a95cb199202b5+0x3c/0x68
>   [ 2049.397699]  bpf__io_uring_bpf_ops_loop_step+0x5c/0x94
>   [ 2049.398149]  io_run_loop+0x70/0x2e4
>   [ 2049.398461]  __arm64_sys_io_uring_enter+0xf0/0x710
>   [ 2049.398882]  invoke_syscall+0x54/0x10c
>   [ 2049.399414]  el0_svc_common.constprop.0+0x40/0xe0
>   [ 2049.399829]  do_el0_svc+0x1c/0x28
>   [ 2049.400125]  el0_svc+0x38/0x1d0
>   [ 2049.400409]  el0t_64_sync_handler+0xa0/0xe4
>   [ 2049.400779]  el0t_64_sync+0x198/0x19c
> 
> [...]

Applied, thanks!

[1/1] io_uring: initialize task context before running the BPF loop
      commit: a3bdf68feecc57af5c11fb599f860ac9790ffad9

Best regards,
-- 
Jens Axboe



