Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794598334;
	b=lCYgpwrNT7yGQ1rw4sLHtBGUXFD06vxiD+k0ES3lNcjRcoSgVVA/neGYbjEclXbcajDB
	 CcaIC6cb4fq0Hr6phviX5oZJyy6JEwezTqm9eMlEMb34BoaJUXyBhdKhqHZXDzHc5zlrC
	 dXoIXPzio1iriXufzeeyOD5wQxqKSzuabRtIBqRWfAJ7lHx4tmLGosPI64PyGLJiBPoMw
	 t4xlIzj9mBy8YIitz3ibaPBq4BqiTBoAMwuoZwxT6aKLO5fFcWPJfcG785IcVdTS5AJU6
	 64xkuGC2ckG9g3sUJRKNcbLukBs/7TUYoBerLfL2/lMeaILaeoKvxDY0jBk2EiXKRqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794598334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=bnlASUcVZVQjeudfMK53MjyqDP2Xl4cY7Qkr6/6buq4=;
	b=sehIR7FmpzajCO+88QRiWvju2BuRqfQIixRXkJ+P6m1bX1LnCOXq3ei2KFvxhKh7xQJa
	 68AaK5kzXaRtf3V3JpQ5N/zr5vewd1DZTJAVrHpoY4wrNLtJhHfJx+dA/fVuLbg+uzHJU
	 Lp0XWKLGNtPPgYXBHe7cQw0B4J3Hm7WiZSkp+QzCbMsR59wEtOmSz/ge0Cq4pZ1ioI7HT
	 TQ3HLRMkUdboBFcv7REfmWLtSnqmyl8iU+IyxzX1QsUMI1tR6EsEQ3w7DoSv2mebHiw7+
	 trz7HUfK1RVLW0OzaKW9QeJ+x+EXkZbcVOGO1Ut2+kMnb77+H0SdXPUyU5yfFi3ufRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DPhYw3qf;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9444B606A32D
	for <io-uring@vger.kernel.org>; Fri, 13 Nov 2026 19:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9444B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DPhYw3qf
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-37071c0f42aso2042219eec.0
        for <io-uring@vger.kernel.org>; Fri, 13 Nov 2026 11:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794598331; x=1795203131; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bnlASUcVZVQjeudfMK53MjyqDP2Xl4cY7Qkr6/6buq4=;
        b=DPhYw3qfwLnJCkl9fJo/MyrHc4TuHJa0JDWBGUxtIN0puyGyRTD6VZ+W16Dcl5DTqi
         7Q/bjhVlrR/mhnMIdOgqKStjfzkJiay+Q9MrOWEYjPPJuHqP7f51D0zLWChkSErrfanx
         vH9vodqlopWIzCk/nAuLoGuKicQVSUF1Tqt8AhyTGvFpxT/zVnAryWQ1Gu9T/WKJiAcL
         9XNWKaKWzBSXa4cRzPrOliMINgQBaAOB4lLr/6BLUVqvdIGjOwpImvEzrNEP+jtEb5JW
         pS78Jxomrz5HfDIrqheLR4qWkrZiAYRVjiX82VFYRYpbVvGq4VYJZ5j9FzdOqxVdSVRB
         1YWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794598331; x=1795203131;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bnlASUcVZVQjeudfMK53MjyqDP2Xl4cY7Qkr6/6buq4=;
        b=H7Pnp/6Syhcj9u+tKVf/aFzc7WetwACI28XU/z0AWquWxbPGr54Ly3dkz7YXjrcRj9
         eLd0SkScgJDOtEb1sfCKKDcNMFiC6+8hr1ncHMfAIYj3Koxqq92mddrCoA7SQ78ov1AB
         8v4/Mn2pPvcxCqyMv4jgJ9e2vTox/yPNjznOYClf67LxIiG7yuYU0xku8xL8I7c6rdeC
         JqtorgFDe1s6pNkmriF5ruhoe/628QkhlFcc+KQIJ6rBNWx02JuzAgstMuJaS5DPseTx
         bjJIqLSr/hBqFxOlbAMC6AqwchXBfmbHu3MCBmElgUGTQzavglD5qG9OUKaHZMkl/5Vy
         +2Vg==
X-Gm-Message-State: APuU4Z9i3dkvn3/9XsgGgOx3xAHew3646SbKMw0epFFBM6RNKcNDikMC
	qWOyp9ASKEIdzJeGW8HDDOD3WQvCBIhsV1ffKQUty+C7wHjxpMXCGjzY+PGiB1sT9XpFNQtD9XJ
	+J1EM+6Q=
X-Gm-Gg: AYBFou1D9ryAt2glx8cnDWDxKNS7u5Gab6v7gUXGS5wq3Z3pXRqYBZkbRpjdDdrC1MC
	qF3b5Ns3+mZWKUyFqhck5SKeUZGli+vNj15W+1a26kwWeCfr4+94938FQTlihFtLHiHz5M+2mjM
	i3Ox+OsplNVdAPbOEtu5Ywz+jwJnPTcZ8CdDqxsRSD2yu5VxQHdT0TidjdaY2PurQKOR/azNaU/
	v8gnf3Dh2kInqRzw9/R2q+EhOzptXoCVSTxRLT8kF0cjpKbCxMUEndwEOZ1ohCTHkoU8cpIJC7N
	gIazoMdbVBsGoit8jstA0IQSjKEp8VJoyNok5Vu0gHjRoGl180dNc7IgKsRlv67mYqIdmb4ZUOz
	xVMEz8FssaMrEnoSHC+e1v6hHVN3TFWXjKbEulTmpuWYApq50GcHQm1wenMS/29KwDmFHnC0xQw
	Ai1n5xp2phZ9ohIivnZBHQjoUXb8vlFzWS38IT8UXiLagxVnvD6YzrTfoJzyKuVmpfHceu8l1bq
	bxK34w5ovIFlwZLgu0mRJ2j5K9C7LmFg+BXO+0/50GsDP5CU2j/Zzh0tl3/6mSekTkjKvzZOpJT
	Yyadfo09OhdIdcBqpm7TRRcCBHjuETD3Qzij6lgzp/E/U1vT0flcUuP4MrWvpGxDKfbi1dqAX/a
	UtJ6RO9zqlykd
X-Received: by 2002:a05:7300:f694:b0:376:203e:7d7b with SMTP id 5a478bee46e88-3796337436amr4436023eec.2.1794598330478;
        Fri, 13 Nov 2026 11:32:10 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm12579074eec.19.2026.11.13.11.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 11:32:10 -0800 (PST)
Message-ID: <d0106b31-ad9e-414c-a32e-00877a91a0f2@kernel.dk>
Date: Fri, 13 Nov 2026 12:32:07 -0700
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
Subject: Re: [PATCH] io_uring: fail soft links on negative IOU_COMPLETE
 results
To: Yang Xiuwei <yangxiuwei@kylinos.cn>
Cc: io-uring@vger.kernel.org
References: <20261113094805.1881266-1-yangxiuwei@kylinos.cn>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261113094805.1881266-1-yangxiuwei@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/13/26 2:48 AM, Yang Xiuwei wrote:
> Handlers such as fsync return IOU_COMPLETE with a negative cqe.res.
> The old io_req_complete() path called req_set_fail() for res < 0.
> After completions moved into the core, that check was dropped,
> so IOSQE_IO_LINK dependents kept running after the head failed.
> 
> Fixes: 97b388d70b53 ("io_uring: handle completions in the core")
> Signed-off-by: Yang Xiuwei <yangxiuwei@kylinos.cn>
> ---
>  io_uring/io_uring.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
> index 5db57bf675f0..742322c1fcc3 100644
> --- a/io_uring/io_uring.c
> +++ b/io_uring/io_uring.c
> @@ -1540,6 +1540,8 @@ static int io_issue_sqe(struct io_kiocb *req, unsigned int issue_flags)
>  		/* not all handlers take care of the internal restart codes */
>  		if (unlikely(req->cqe.res <= -ERESTARTSYS))
>  			req->cqe.res = io_fixup_restart_res(req->cqe.res);
> +		if (unlikely(req->cqe.res < 0))
> +			req_set_fail(req);
>  		if (issue_flags & IO_URING_F_COMPLETE_DEFER)
>  			io_req_complete_defer(req);
>  		else

Why not take the chance to improve this a bit:

if (unlikely(req->cqe.res < 0) {
	if (req->cqe.res <= -ERESTARTSYS)
		req->cqe.res = io_fixup_restart_res(req->cqe.res);
	req_set_fail(req);
}

?

-- 
Jens Axboe
