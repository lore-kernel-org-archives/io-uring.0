Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BBA39A06C
	for <io-uring@vger.kernel.org>; Thu, 20 Aug 2026 18:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787252202; cv=none; b=YxpCeoNpqRG3YPrjp4CpgDNnM5pIllc5yKmDgGXWRK6POxysass3hbMzTXhVltCl1awy3896I3TgDZEJr4ttGqerUpH5KWWYPC9I9xwrV/FKTDt2X3QMS8DuIfx9Xk7tHPbF1wpttUx4PqRuNKp9P4qUS9UBjdg0grNBbiSoN8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787252202; c=relaxed/simple;
	bh=1lKcb0rDRH2oOsxC7Q0McjS57qFLR/Uzwkul9u01oHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bzGwuz3rQbzGWrKKDcW+noDGJzLsi+P1bKuFfWxTdCmWKk/ZR0GYd11wT3LHOZ0hjg5zTEaJo1hSLlPy9q9o1WNaKLVdcnfaFg+8b+cRUrSxvlgePEukZ6LYSXSx+/kaawldhQadikSCwCgzImjZhvmuxf+DfiU74JxVwxYBb3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GQ8ThPci; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GQ8ThPci"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c20e70a0962so28223566b.2
        for <io-uring@vger.kernel.org>; Thu, 20 Aug 2026 11:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787252197; x=1787856997; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0xjaiExmI2wqFMgRSLqirYNlVrnBpx+WSX44TSYh3CI=;
        b=GQ8ThPcirFA83v+jU3TzvE7g7DzyaFVjDin+cTVKsVZ4/JlFH4aoo95ymyyQWsBQNA
         dwZK/nWo+i48Ur+KhNL7pY9AyA8V0cco/1WWfhkRM5/8PAOshQQQH4CnC/SQ74Ft1bKi
         FYjSjHJpwu1dhirQgXf6rNUfXrQL4cXFLU8fDPfQzvZkjgC/rI4pbabOf2+iahsDTP74
         ZYm4MJbpi+UA1+7cfBpK3sU0PasmQmxsr7G5+oxf/Z3cUWiQ1BP+SFyTjy08f0aHn67N
         Ij3esEy5eSIBZ95OPbs4c0R0AcRQMoqUsF9LtN96b9zoYSYt8GXFR0jJP1yX/YGyU/EH
         PPhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787252197; x=1787856997;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0xjaiExmI2wqFMgRSLqirYNlVrnBpx+WSX44TSYh3CI=;
        b=OHEkYvwqFXVQD2arzcj4PQNeMEkjN09Vfyrb50YsUAifSTNCIQwPBQgIxSd6GTNWjZ
         RFqgFmLXc0aHccYcJYgZbSqdblmuC94/Fl5MMrxTvxVZ99y6igQnULJDl0+QDCCuvtvc
         Z8Yo3r8I2kYTcd5onxItFlsp7hMwj3zV4tC2/Wp0hhQSXU4mCEsW20xApcRgsQlkwtMy
         0X+y9RoIbNkdqzoTBeO+9UQ4C1C+aKgg700uOm6DAhMeAqXZCIDMqFkqSbazjnlkUH4H
         crNhSQgVP33K5oBodNVmWQezKfeukgbmk7bVYxKKxoUWKw16Wf3XwLtXCWNhyarC/K+v
         gIWQ==
X-Gm-Message-State: AOJu0Yy1BO8+9f6qcu1g4rVNrs4dentPHoHnMLmEMms47uhb6a6dKv3Q
	77oFLx1EoGzbptbdcT1EX16NjEYuBOJ5PydrLaGhis4eSdDTTBaXoiFf
X-Gm-Gg: AR+sD1284jx0eW0m+fpCBL9aGDyK4bb6VO04z3mKUJvvQgl4nPa4Xv1el+uUyMmeh7X
	MXH3VY0Q9Pejk76sca43TKVaOK9mhaRiOtn77p+Sipj5SfJRM+3djvVgzsqOHg7Avw6/7jGhLaY
	QNxrK1pykNUstf+tqri1NBA6nLOaLULxHT1/oPXDy5uKog0OM9qFumMagYYGX04E3LuVyuyAcwr
	Dx+28K5CT2YUaMtWxsbc+r/T3nS0UGCyYSNnZVVggxTBNnk2XJ/S8Af/ZEUPeTEfksLiNoATP9J
	Kwm19+0tsbqeIc4R1SiSP9DOpSGrZ6owKfrWSU8rxZXMVV8ZTEZlJ8Gzv2hG/1iHNID3vUucYmz
	3/yFCvV4oFU/mGaVYUyfRmY+pSwXDBlxJFXScUU+o0BYFeyRC2Rr5eIFfqCuJ/av/FZdJnU3zI9
	G4AdE9h+q/wMh3G/B8z3KRyvf/Y4iZPSnj1pFKmMo0j4Yjla0cWceL4WNMuhoMjgdSGTTmVxC6x
	WZrLhDkZ+SrZWdr1soI/SLyyOwHqrmPmLmZqgLahHAgyUlJDTGuzIVX3w==
X-Received: by 2002:a17:907:97c9:b0:c20:f703:c411 with SMTP id a640c23a62f3a-c246a4ad5c9mr39615466b.5.1787252196619;
        Thu, 20 Aug 2026 11:56:36 -0700 (PDT)
Received: from [192.168.178.24] (cgn-195-14-221-121.nc.de. [195.14.221.121])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2458b096d9sm112325966b.20.2026.08.20.11.56.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 11:56:35 -0700 (PDT)
Message-ID: <165bc4ff-ec69-4058-b6a2-3db02410ce58@gmail.com>
Date: Thu, 20 Aug 2026 20:56:34 +0200
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] io_uring/cmd: don't skip completion for a non-armed
 multishot uring_cmd
To: Jens Axboe <axboe@kernel.dk>, Ming Lei <ming.lei@redhat.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+a4ccdd7ebf452e4d4701@syzkaller.appspotmail.com
References: <20260811-io_uring-v1-1-1dc3dd50e0cd@gmail.com>
Content-Language: en-US
From: Vasileios Almpanis <vasilisalmpanis@gmail.com>
In-Reply-To: <20260811-io_uring-v1-1-1dc3dd50e0cd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi everyone,

Just a gentle ping on this patch.

The issue is syzbot-reproduced and the proposed fix has been run with 
#syz test.
The patch addresses the leak in the core |io_uring_cmd()|path rather than
relying on individual providers to handle |IORING_URING_CMD_MULTISHOT|.

Could someone take a look when you get a chance?

Thanks,
Vasileios


On 8/11/26 10:42 PM, Vasileios Almpanis wrote:
> io_uring_cmd() treats any uring_cmd carrying IORING_URING_CMD_MULTISHOT
> that returns >= 0 as "multishot armed, completion deferred" and returns
> IOU_ISSUE_SKIP_COMPLETE, expecting the provider to complete the request
> later. But the flag is user-controlled and validated only against buffer
> select, not against provider capability. A ->uring_cmd() handler that
> does not implement multishot and returns a normal >= 0 result then has
> its request skipped and never completed, leaking the io_kiocb and its
> io_async_cmd:
>
>    BUG: memory leak
>    unreferenced object (size 248):
>      kmem_cache_alloc_bulk_noprof+0x272/0x3f0
>      __io_alloc_req_refill+0x4a/0x150
>      io_submit_sqes.cold+0x16e/0x20b
>      __do_sys_io_uring_enter+0x56d/0xd60
>
> syzbot hit this via ublk UBLK_U_CMD_ADD_DEV, but it is kernel-wide: the
> same leak reproduces with SOCKET_URING_OP_SIOCINQ on any socket fd, which
> returns the queued byte count and never inspects cmd->flags. No in-tree
> provider of multishot actually returns >= 0. Both io_cmd_poll_multishot()
> and ublk_handle_batch_fetch_cmd return -EIOCBQUEUED,
>
> Only skip completion when the command is really multishot, i.e.
> REQ_F_APOLL_MULTISHOT is set. Otherwise fall through and complete the
> request normally with its result.
>
> Fixes: 620a50c92700 ("io_uring: uring_cmd: add multishot support")
> Reported-by: syzbot+a4ccdd7ebf452e4d4701@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=a4ccdd7ebf452e4d4701
> Tested-by: syzbot+a4ccdd7ebf452e4d4701@syzkaller.appspotmail.com
> Signed-off-by: Vasileios Almpanis <vasilisalmpanis@gmail.com>
> ---
> Questions / Notes:
> - I put this in the core io_uring_cmd() rather than in provider specific
>    code because the leak is independent of the provider. From my research
>    so far no ->uring_cmd() rejects IORING_URING_CMD_MULTISHOT, they just
>    ignore it. The flag is only validated against buffer-select in
>    io_uring_cmd_prep(). So any handler that returns a plain >= 0 result
>    with the user-set flag leaks.
> - Instead of checking if it has been really armed should we just drop
>    the >= 0 check? The in-tree code that supports multishot returns
>    -EIOCBQUEUED from what I have seen so far.
> ---
>   io_uring/uring_cmd.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
> index c14c22cff49e..a2899a852879 100644
> --- a/io_uring/uring_cmd.c
> +++ b/io_uring/uring_cmd.c
> @@ -269,7 +269,8 @@ int io_uring_cmd(struct io_kiocb *req, unsigned int issue_flags)
>   	}
>   
>   	ret = file->f_op->uring_cmd(ioucmd, issue_flags);
> -	if (ioucmd->flags & IORING_URING_CMD_MULTISHOT) {
> +	if ((ioucmd->flags & IORING_URING_CMD_MULTISHOT) &&
> +	    (req->flags & REQ_F_APOLL_MULTISHOT)) {
>   		if (ret >= 0)
>   			return IOU_ISSUE_SKIP_COMPLETE;
>   	}
>
> ---
> base-commit: d58772d8520c7ef247c4b95c9bd76d3a25da9ff5
> change-id: 20260811-io_uring-169337c74617
>
> Best regards,
> --
> Vasileios Almpanis <vasilisalmpanis@gmail.com>
>
