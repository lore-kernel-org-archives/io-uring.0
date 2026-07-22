Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73053AEF47
	for <io-uring@vger.kernel.org>; Wed, 22 Jul 2026 03:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784689754; cv=pass; b=NOV28ZlXDGI0PHHF2nesnd2Q1hU1yAQRZjYbUGOlkbLo4sf4TLbEEyeUUsRSGpy8qVuFM4hJevlkQmb2/gcxihfqUcGuaHjesRBObZuDpAmXS5nzoGgEypcZltxJQZ2qOM85VCAFq6scbmFs4R4zDbAcW0Bx7q7Tuohqi6/HSQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784689754; c=relaxed/simple;
	bh=J/7QgPQ6cdrz0Z2X/O2pTLhE9B/IdwIzpsWupW7eWFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aDfDKRX1P6njc0dORaTkSxUWQO4LP33yzGFjZya4nCuP6nQhYzDPl0hkGT2J1G/OQQgsTZgU4EScZMRFQPtBPRzC/CiaTM5uaL7daLA46TY/RIOIIBOBE7bqSDcgU+OVDXAtlzQMXyZ6cI6rOhKLWdMRTlIRsraxKCKvNNyGKtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kHf3kxIw; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kHf3kxIw"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-698aa7ba3e6so11535889a12.1
        for <io-uring@vger.kernel.org>; Tue, 21 Jul 2026 20:09:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784689751; cv=none;
        d=google.com; s=arc-20260327;
        b=seOuxycwLIebhHZNfOgGD3XFXkqSSpfNnPfgKNeeC5VB1aokaJuZl5bWj7fKNJaHrP
         GON+NxE+G066iE9f8LZ/5e5VIs1XEjJlhWnaHDSt2wRZKTtA2alzWybnaWbjEfEAVR6i
         2x8lHXLg4I9dEsxRx9337uiLvIKgzlf4XTzu9MTE5Esyd/cr87aU0oSZw6RX5CLWaaNt
         G6rInZQ0hs5HmlaoWhGMafEn+u5GNRmBBJ0rM5UBhejVAQ4UmDRMib5JUR1AnHTizS85
         NNhdEo+/8aESU3ZrdOP3p7t2xbbt0Nl1nY197xa3puhSz3jRrFTKUMh7fRDMknU2W2a6
         LR3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J/7QgPQ6cdrz0Z2X/O2pTLhE9B/IdwIzpsWupW7eWFw=;
        fh=Y3R1wFsymQdE5TymRbhApORYXF8EHU5ICoQhIZb81sk=;
        b=JzcElxLruODtwrB6WZA290PGdvmjNt2cpxcjUakbA7epbl8aRn/LpfsJtbcTIqbDSf
         vg6uao+4KfOigo15OXlK8yoyeg/DBR9QulEFeBIfvEKLNXP2c+gy/dBmUtSI+C3w6HDx
         jTYGTt0CNItXORm3rcTlsvNMyJzNsiB1pWn68QsDyjTBm9xXw7x+/ZmlrPeIS12T7DPc
         fUOye7bhSGtIuD4OooiOg08uPkijuq315u/aPTW6ao7Y10eer45qqNn0larn50P76KFJ
         tkq0DjTmEF0aEb3C2n53OODLqzMdysFZcoyjPfKSe9WgE3zn+MrUULsa0l5ubWwzvqIx
         snpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784689751; x=1785294551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J/7QgPQ6cdrz0Z2X/O2pTLhE9B/IdwIzpsWupW7eWFw=;
        b=kHf3kxIwKtcK3ucIECK0/54WQDxS2VbuVvTE8hY5gNIoYIqii8/9IFlVGY24rr6uxM
         /1Olnon81f7p5KidqVpjEnFaRNpFZm0AhOwAKwWpdcnU4b93qUlUnFByaXyiFSx5PzU8
         4S1g/8iHcWOa6QqnminxKuLQWISjBZiyww6llqxXA3EuMKFxol5lvZF6NNVs9YmjpQNT
         EgeekLsvarwRP+dTa3aCH6BBFor90CkT2brIgKG7wVhR6M3dLuBaGAn5gfHWyPheoPB5
         txflr6hfje6dVqHDcJarBW80+9gUDAKYxeM9xfHaMI1BlqneAJ2JqtbkRYXyhusmNXHG
         QCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784689751; x=1785294551;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J/7QgPQ6cdrz0Z2X/O2pTLhE9B/IdwIzpsWupW7eWFw=;
        b=m/uVAoyXe8aNDOrof2mRa5YyXpgFCsG/Ii95jd5nhdjrKS3+nBWGPXrYbA+p5U2KOM
         6RKsloXtdjhd/YTgqmpddNTJH4YN0HHcnaE48VPdIosWrTnu528O/TORumUoHYcTirEh
         9ie4Q154WUqK2jHFeKSc8xdsZwom9NXf0MnCZXctTkM2027tFI1X4gU/8NKH4ujxr5J8
         G1DhrgqTIbqVJ93ed7zMsF91+b3HtRIWH9oeH9bfCfKWfNPswB1d1KxHuc5cOHBjAWE0
         IwXugwGUWnMJY1RNNe3LN4V/YB73kkVP0xH4BFsHI36QRx+HsdRJxJCsguLg9IZeuUQz
         IubQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqb+SMecrwNFxLL/63pS48DVermHdRflFc44sUpLOA3gceu9smMo6JwOK+shiN/CNMyHicvM7YbrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYtWYPXAu1wSLyTbHDxi+XY1eP/3nLHgBCIhUoOcftn5hvIqrN
	DqseuUnIDjwVV71aAR2vbvgI3vQsjMRiPAeEjazoqsyx8S7xLQ5ppISXYHGMrcRVWprLW/B/PgR
	dBNyVhDs9vk1jxOi5ABTtVR/BLiqx3tw=
X-Gm-Gg: AR+sD13DSqrW9P3jIEIMF7rrVgabaXpYgIMCbWDHfAe/KNP0LbhneWl7Cw0te41eNOX
	z5zmFUi2cK3pgg6D6xTg2fFjWfL+/1ZPd0bthLLRId8OdCnLKPHvSoYaT3hi453e4Emirvyqe0r
	iLdclUL1WJQcXL17tPYNZuHOt+T2Gl9MtWnbvmpjYJy8DmSZvX1CBRlR9/4135N4AOBpRBywQAt
	TxMcCONAoZvaBbFF1hW6gYq0jodErodiURGltRnlf1BdiQAVfmRPdusmuqyG8A=
X-Received: by 2002:a05:6402:5349:b0:69a:aa19:9e3 with SMTP id
 4fb4d7f45d1cf-69e652f59b8mr6050201a12.30.1784689746320; Tue, 21 Jul 2026
 20:09:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720114116.21830-1-yi1tang.yang@gmail.com> <a493a932-46e8-4253-81f9-2c849c7b2ff8@kernel.dk>
In-Reply-To: <a493a932-46e8-4253-81f9-2c849c7b2ff8@kernel.dk>
From: Yitang Yang <yi1tang.yang@gmail.com>
Date: Wed, 22 Jul 2026 11:08:55 +0800
X-Gm-Features: AUfX_mzkRQ0BFgBBryEd0VPU-ZdDZS3VnW22vNcIvcv69JEdTaM5t0OY2jtndZQ
Message-ID: <CADd-6FwNfTcar6JRrdq4P9Pj_5y-HzqsCgythMLjhhBQyO5FCg@mail.gmail.com>
Subject: Re: [PATCH] io_uring/rw: fix missing ERESTARTSYS conversion in read paths
To: Jens Axboe <axboe@kernel.dk>
Cc: krisman@suse.de, io-uring@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I found this while trying to combine io_uring read multishot with
userfaultfd. I wrote a reproducer here:
https://gist.github.com/wokron/7f75026e02792844b0bbf26b7e79c9ef

Running it with "sudo ./userfaultfd-uring -n 16 -p 10000" on
my machine consistently produces "io_uring_cqe error: Unknown error 512".

Jens Axboe <axboe@kernel.dk> =E4=BA=8E2026=E5=B9=B47=E6=9C=8822=E6=97=A5=E5=
=91=A8=E4=B8=89 00:32=E5=86=99=E9=81=93=EF=BC=9A
>
> On 7/20/26 5:41 AM, Yitang Yang wrote:
> > Both read and write may receive internal restart error codes from
> > the filesystem layer and should be converted to -EINTR. However,
> > when multishot read support was added, the error code normalization
> > was lost for both io_read() and io_read_mshot().
> >
> > Extract the conversion into io_fixup_restart_res() and apply it
> > in all three locations: io_rw_done(), io_read(), and io_read_mshot().
>
> How was this found? Reason I ask is that I wonder if this is even
> necessary in the first place. If you found this because of an issue
> you ran into, then that answers that question clearly (yes we need it).
> But if this some LLM find, then that's an entirely different story.
>
> --
> Jens Axboe
>
