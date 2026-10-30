Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793387466;
	b=RN6KbosRm1Dh+UssKd1kwUULYj6H42F7mZQhAcjNb2Cyaxg45xuvqzg4BGZTsDRe1FRK
	 XW3tJO2A6jY1yHh4b6EBwWhMIi3nRbba5p6vukiuOmhhi73Fc/fbYl2+pR76QS9SdiJFQ
	 o45SvV2TY3c9HXCtLfXoN+4Ep05MUpT0ePhZPYHHNDlCfj6DKKvXU0wpKwjbwLs/N02of
	 gglmVgaGPNb3gn298EAc9RyrVtAZVG4aCxSElATkLvwom4K7k/sO6jyAfKa5tPmXpkbuQ
	 Lx1SEKuMD56y2jr6iONb9c9N9bWct3M3Cyy8ws5hOB8XozeYfxWwDu1vwfAfet+j3aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793387466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xnAZnLjXVLGBmOA417nCi2RZRGu8ePkUYHjR5ZInZ2k=;
	b=ec3f2K1dFOz3Xa0sq1quqTfrYjUr412lYw086z71/SJDW49FdJXpnyRU78xG5X2jfKXH
	 x9cHxbK7llHqLlZnpR8HiXKyUO0EcRV5jljc2QPByGbjSzBkd2a26Y3jhPSXeEmH0jfrs
	 Z6Wl8fgtcmO/injFmLBIcQDU62yxqQGG+wr2ulldMwoSs4CbinLQJ0dQxEUamhSIrw85g
	 YOirP8yENac0bngia3uD9ief4+rAWguX+iidW5KXj6KRVX0dB6N0ruqirYHC4Atxe8K5r
	 KBuBlSme6gpgINCL3fq30BtHuSOmWcv28U/H9Hghz1sUTHelK6DnXZp7+5LoxQY/dBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NvL2DEoT;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE81606A31D
	for <io-uring@vger.kernel.org>; Fri, 30 Oct 2026 19:11:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBE81606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NvL2DEoT
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso13046435e9.1
        for <io-uring@vger.kernel.org>; Fri, 30 Oct 2026 12:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793387464; x=1793992264; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xnAZnLjXVLGBmOA417nCi2RZRGu8ePkUYHjR5ZInZ2k=;
        b=NvL2DEoT7+iL1nO3iIGhDLDyl2BkL6S7kW3XCkWuKXgzW05lwqRJrDPPomPPZf8GHa
         yRVTFUMy+FVD1cBR3C4vfP3cmsyDPPC6YTSAZdAXJNQDWzm1gb+p7tgVClGXIjcWIeZO
         4Ox7e0u4b7BV4o2VHoRFz3YXCnaJs94H3+5tTef9KZefI8bX+ipAf6xT/Ko2LHnfqz4a
         tXMNS6nv905+/9IiaT3n5+jWLmDOpH173klSL7G4Dnvbi/s31BGTtNED90DmILHQtYqe
         UhkUrhAoF1Xta6KPTlzPkP7+6QhmvjpE3ZlYpDDFDokGetoF3A+sHTm6Ao773JnWGqsm
         uxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793387464; x=1793992264;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xnAZnLjXVLGBmOA417nCi2RZRGu8ePkUYHjR5ZInZ2k=;
        b=OI17lhKwpOn1oiwNY4t0sK4K/FxfeEivrfkZdm/9fesyUC5JzR3EpbLd631nRPDXEy
         XAZLMg3mIVl66kFC8k300nr2Joq59qtjCqGCXsdYsafgMf1X5EQLjnY7StepIGXhB1MM
         YhqK/3VXkZdHdiCqAZd5kVMM67Wkt8b9kWt6pIVx257j12ORWv3DgTJwOgYJsxjDHtcY
         BtdIbj87RbeOh/6E+C0gUwrfLKC6RDX2UH1Di5SZuOw7BeUIldpy356rpy+DOkKTIvdX
         29GmJ9Eeb4hAGH7mBFcNMYPuzK8V9rfHOeVjaSkof6Kx6BmG1qrzvZfnn1JOuOjuGWXi
         tn+A==
X-Forwarded-Encrypted: i=1; AKwUvBwaN4TrS+jC9mgZD5hMLKKTZe4KQ6P128T6u/lyH4yCMdZ0B5Yp5FaVwQL+4RpPRXBxfGgPsE3P5w==@vger.kernel.org
X-Gm-Message-State: AFq9FYLY8RLW4Ic05uVdnDybvVu60g9zsOhkwoDqpq6sylO2MKVjMjYt
	Qgk7YfJ8wOQ1JcDpqwQmTGkP0p2AoeT+QVaCJicwOFiK3HCNpbhcsIkuzyNd0GE2
X-Gm-Gg: AYBFou0bX9tIKfqluUDh54plFSbcNCB+tSY59JYniE3G52oS714IdQ6tEoifro3XjXE
	o5l/MMCnX9gVpJ4cN5KczHKirpupaKcgHdcnUQtP11jF5+qjQJ9bY9kNhkwQKIJ0vZmJLQG1aVL
	TBPbPJlijiTIBfWrkpGyNm7+X8Icgl7vbUfL/RhPZXgK4iS3kVDm0gc51tdBXXoaxRvcjWT3Xbu
	oyOKhLjWrwsA+xCjcLgt7mT0yXd9uQ99oo1g+nBojSMy10kE4gwjlmfFoDEegJBASNWvnYVS82d
	jFcRq1k1Qfm/Mq5/YDTn1FXsHWqrPfvbPgpFeIjIhJl2W5PU+f8lxeQp65Uhruypja3nrL/DOdU
	Vm5WY+UQNWn7nZzaFcHPFlkBArqlWfWiYbGFlrHs3HlmqNOuRpMElG6ruvjtjFKoRK6VKU8Emzm
	NDQ74OKJg6q+uH7hxIKfCXHL4wYE2G5JTIBvY9W7PM96YQetsiNIgo0eYJ1U2DanbUIdZbRGHQ0
	BlXrU0V7ONiINSui2/tkrz5mKjG+PA1CqKM8ip+cXVPliefjuCcR/xU6QtbpAe0ANCkRZ/SXlRT
	flxCW0BTtYaEwtZVDzw7u+5JKMPC8sw90voM+QMtN5wA2maBnP6wNXCkK2t2HroLvLnqSgfQ69b
	x8Syb69fejRahlAUDxuexcI+NG4zWCHOJp0nQ5HwAGnFzrC1DJKe85u379hzUL6PEgdph+Seryk
	khQDT4oB4CXFxJ4J06QxESQ09pcdTzC2ID3yG9
X-Received: by 2002:a05:600c:4f52:b0:49d:1fa8:b266 with SMTP id 5b1f17b1804b1-4ac18e5d029mr80802365e9.26.1793387463990;
        Fri, 30 Oct 2026 12:11:03 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a086-2e01-5d3f-e84c-2983-d02a.310.pool.telefonica.de. [2a02:3100:a086:2e01:5d3f:e84c:2983:d02a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f047bfsm154914565e9.3.2026.10.30.12.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 12:11:03 -0700 (PDT)
Date: Fri, 30 Oct 2026 20:11:01 +0100
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Chris Mason <mason@kernel.org>, io-uring@vger.kernel.org
Subject: Re: [PATCH 08/10] io_uring/cancel: drop sqd->lock while SQPOLL waits
Message-ID: <auTrEl1ahq53QKrz@gmail.com>
References: <20261028164732.1264069-1-axboe@kernel.dk>
 <20261028164732.1264069-9-axboe@kernel.dk>
 <20261030012506.10611-1-kmehltretter@gmail.com>
 <8d7eeef5-7308-40c2-8670-733a69e24fae@kernel.dk>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d7eeef5-7308-40c2-8670-733a69e24fae@kernel.dk>

On Fri, Oct 30, 2026 at 07:34:06AM +0100, Jens Axboe wrote:
> But no reason not to make the check see it. I've queued up the below,
> what do you think? It sets IO_SQ_THREAD_SHOULD_STOP in io_sq_thread()
> before it cancels, and tests that bit in io_sq_offload_create()
> alongside sqd->thread. Then no new state needed.

That looks good, except for the WARN_ON_ONCE() in io_sq_thread_stop()
below.

> diff --git a/io_uring/sqpoll.c b/io_uring/sqpoll.c
> index 49c52284ecdd..c833e776320d 100644
> --- a/io_uring/sqpoll.c
> +++ b/io_uring/sqpoll.c
> @@ -433,6 +433,12 @@ static int io_sq_thread(void *data)
>  	if (io_sq_tw_pending())
>  		io_sq_tw(UINT_MAX);
>  
> +	/*
> +	 * Cancelation drops sqd->lock while it waits, and a ring could attach
> +	 * to a thread that is on its way out. A fatal signal doesn't set the
> +	 * bit, so set it here for io_sq_offload_create() to see.
> +	 */
> +	set_bit(IO_SQ_THREAD_SHOULD_STOP, &sqd->state);
>  	io_uring_cancel_generic(true, sqd);

Setting IO_SQ_THREAD_SHOULD_STOP here on a fatal signal means
io_sq_thread_stop() will see it already set when the last ring drops
sqd->refs and trigger:
  
    WARN_ON_ONCE(test_bit(IO_SQ_THREAD_SHOULD_STOP, &sqd->state));

Regards,  
Karl
