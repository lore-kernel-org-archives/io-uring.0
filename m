Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768794;
	b=xwo30gYvDP0w4nMd2vdCDzwEbslqXSHIpI61og2ioHYTOykd5IQLLuXuQ5VDlPlGae2w
	 3tgabzktSYXstcGCQpXSlxDVsBobngAPPuIf9Hsrus6TBiXavcHmJ7AlsxfN7rKHcKWnX
	 xWf2+kihG8dzOlfgaJTNgF3GrqnDl1+jUilEOSZ6CpYoY4sXWxCYvrslJN6iFRZiZdljC
	 k4Rxn/6whlperXYuQtm5PognTuoSlN9Efr01Ogifc/0/BUqgmMI61V07P6OpjvTt/76Fl
	 7cZdYTgPUaCe02KacuYHw/ZrAGr6dJ+uj0sTLJcZGgSq2GKuuXUWgf6eP+3StL378Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768794;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:
	 References:Date:Message-ID:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id;
	bh=G9SbOTabDOXeJguGWBk2Xg8NqRSPpI37mdB2J63D/HI=;
	b=e3nRj8BGQQw22xMoRCguaZd+1Y7J/CXCZH0sllECB+NZ6f3nV5fo8HG5mpd5Cc+KlN3o
	 PYxOxj/QkWPhcHHiXvtotdSWvpJSKWOjoCUBFRWWC0O7S5UxtipIi+HexJW9jV1S8kT4l
	 UoFjdXqgCResYEdILPP9c7gjaryuPOsyyZ4jZ6d14109q0+KXVz0z7YDwkustnSY9j97S
	 EA+z+aLS3ORXPtZMRnvimRhRo5Gkj6vquaG+mieXAXOVTx3Ehv4JLzmYTAxLfn3ZuFfQm
	 1oWc0EpvMNWX+fmXJLYYbnXzFRYCv1nTHBJTq9fL/y4yD8aPQOIuS/hB5Xh2BhZ0DXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=krisman.be;
	spf=pass smtp.mailfrom=krisman.be;
	dkim=pass header.d=krisman.be header.i=@krisman.be header.a=rsa-sha256 header.s=MBO0001 header.b=ILvj2oh+;
	arc=none smtp.remote-ip=80.241.56.172
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C694F606A31A;
	Fri, 23 Oct 2026 15:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C694F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krisman.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krisman.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=krisman.be header.i=@krisman.be header.a=rsa-sha256 header.s=MBO0001 header.b=ILvj2oh+
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jB6Bm03PXzMlpF;
	Fri, 23 Oct 2026 17:19:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=krisman.be; s=MBO0001;
	t=1792768784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G9SbOTabDOXeJguGWBk2Xg8NqRSPpI37mdB2J63D/HI=;
	b=ILvj2oh+X4ULvVlP5KJLhuQnSDHvtPkYcAzuxTBgp/4H/2fEJKyLRorGUc4TAdayfSn7as
	TAm4Ur4ohh7yM9AXFJOpt2TBdErpeS7HL7SHTeXE6mDyboRa9Ytrx9E+eIgnt4yqWrKDE6
	XGcLDcMLl/xeggvxDZm5o9KlrlQv3tjM8tu3GhCDHw34q9qejZWCA9hvjRFtkU/BbWh43M
	5a51QiK7DyiS5PxK+V43bYQkAsXSEkKqfX3ua0D1ylXr3BjtPOgfT/DsRGt1TyaE2CU90t
	FeCSV2w9XlvOHvmB8spd72lnuD+aKjTic6QT7uBqZ2Jx9XOakXZZByFU375I2A==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of gabriel@krisman.be designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=gabriel@krisman.be
From: Gabriel Krisman Bertazi <gabriel@krisman.be>
To: Yichong Chen <chenyichong@uniontech.com>, Jens Axboe <axboe@kernel.dk>,
 io-uring@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>,
 Josef Bacik <josef@toxicpanda.com>, Yichong Chen
 <chenyichong@uniontech.com>
Subject: Re: [PATCH] io_uring/kbuf: advance head when a pickup empties the
 buffer ring
In-Reply-To: <20261023091711.83481-1-chenyichong@uniontech.com>
References: <20261023091711.83481-1-chenyichong@uniontech.com>
Date: Fri, 23 Oct 2026 11:19:39 -0400
Message-ID: <8733twsaus.fsf@mailhost.krisman.be>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 4jB6Bm03PXzMlpF

Yichong Chen <chenyichong@uniontech.com> writes:

> io_ring_buffers_peek() flags the request with REQ_F_BL_EMPTY if the
> buffers it picked were the last ones available, comparing head to tail.
> When the loop breaks because max_len was exhausted the buffer was picked,
> but head is left pointing at it, so the flag isn't set if it was the last
> buffer. A bundle receive then retries, finds no buffer, and the request,
> which has received data, is marked as failed on account of the -ENOBUFS.
> That severs a link, and ends a multishot.
>
> Fixes: 35c8711c8fc4 ("io_uring/kbuf: add helpers for getting/peeking multiple buffers")
> Signed-off-by: Yichong Chen <chenyichong@uniontech.com>
> ---
>  io_uring/kbuf.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/io_uring/kbuf.c b/io_uring/kbuf.c
> index c9641b6ccc8f..abf44f5dba26 100644
> --- a/io_uring/kbuf.c
> +++ b/io_uring/kbuf.c
> @@ -326,8 +326,10 @@ static int io_ring_buffers_peek(struct io_kiocb *req, struct buf_sel_arg *arg,
>  
>  		arg->out_len += len;
>  		arg->max_len -= len;
> -		if (!arg->max_len)
> +		if (!arg->max_len) {
> +			head++;
>  			break;
> +		}
>  
>  		buf = io_ring_head_to_buf(br, ++head, bl->mask);

Reviewed-by: Gabriel Krisman Bertazi <krisman@suse.de>


>  	} while (--nr_iovs);
> -- 
> 2.51.0
>

-- 
Gabriel Krisman Bertazi
