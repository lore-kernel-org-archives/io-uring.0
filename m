Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0154A0903
	for <io-uring@vger.kernel.org>; Thu, 24 Sep 2026 15:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790262954; cv=pass; b=RlgI5jWwX5me2/R6ND8bSmk9FYsSD72/dvp/e+OWBKdXJGvfeOovk8ZtUizZFPb/4h5J0f0dXQg8U7RMNgbUExzmmov0wd5GEYXE6NXxWrpLX8wwREcPa9Na0cEXpTXxQJndoeeIK7P0kEiNXZAiVyGYQpB2BZX0zEStiHK8M/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790262954; c=relaxed/simple;
	bh=RECHEgWIei/jxGkLITuUpx9y/MZ6IMst7oKgmvhC2+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V+DLJVr9hb7dlLJPqfS5X3ee0JW9s3s3vWJNshprP8Lzf/TeJGwgzfvpkYF35XT1tIBQR0DfunNDVLtfL6iNZ/uX8pJnWyF+prn0CPF7IwiL7oGq0b/+kQpXNPvVD4F3EajMYU5NBBM/Nm5SaRftSrFHwikx8kex0xWd7pmfuUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PlvLe37Z; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PlvLe37Z"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a9d74e8292so11764a12.1
        for <io-uring@vger.kernel.org>; Thu, 24 Sep 2026 08:15:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790262949; cv=none;
        d=google.com; s=arc-20260327;
        b=mkx6tDq97yMetgalnucYIHLIAHx2g3S2nOqJP6e0JYWK0QY/x/j8hYgWz0YYJbE+5M
         rKO+NgdHlkTBKB+z1RL5Ah8S9qsdtOhJgXZSONXeWMpBtLIhv1f3K9LpBPsbltpKgD87
         ZIqBjtLt8YpF/iCt0S+992nfibWdQFdvN7PH90291DAJ/bttNo9BK25OGKDFyIRH+yyg
         L9EqnTssHy3jaNp2v4YCXLdj889ZfWU+rCH0KtmvZyaFisSKtz1KqRafkY7/USbzqv92
         TDiAdie4ayUQzQ1A7lpIsLeobJqSQZ491EJ5p2AQAzpfgTYeaxG7s4JJLwXxnzhciUdV
         qpqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RECHEgWIei/jxGkLITuUpx9y/MZ6IMst7oKgmvhC2+o=;
        fh=Nawcv6latSrW4iPYca1exDuzjxuZCElf7qnOKf+gmjM=;
        b=i4FCw91ptl7VAYKuB72Vq3tER8vOmY/jMuLrBZDRUj5stZrh0BBUbhqB+LC0nWIzxe
         f4xYY8pABt30pOP/3KpjlM9SzgVLfknHpaD4y8P1OwOBPER5hNENMIdGmoUTvO34la2i
         /YHrC8KUnsgh7LRZipk5aj+fwxylCoT6tTcBt+QdXTCiyUxNv78xlAZsqKHqoYrg3AD9
         mJjr9VVufR8ZVXPM/Kx1PgcudYATcSGnfe4m/09ITKz93bz/w2ZLiPuyvx2EeZJ5qAP7
         GNBa9OJHMs65dFtrc/zenOm0qVGGsjcJsxCrtKNcueOrBa+4KG6D9+XjkVfK6kfWAX04
         YrCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790262949; x=1790867749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RECHEgWIei/jxGkLITuUpx9y/MZ6IMst7oKgmvhC2+o=;
        b=PlvLe37ZJmj7FZABwp/4xMFVlPs7W5a/XCFT2Q3ViZwnJ7mV6NhWJw25KhbfSEafe1
         NqK/Kxfw1nUuLhrhCXkhov6Ek0cm7nsAcrfc34blyv78IkmgEgWjl2fm+AKviwoZ3S6T
         eiWZ6FXvtYCa/8yELRdeHPn7cdPiw8nptTsZKT5P2LdawvoQZBRvUYA10MP4cJeXIVcl
         lIjOCQKN+9GCvxWeoSnD/MYUguRqfr2IVIpLt0yfp5Ok8s/NHwt7sPgWUxNtt9G/VH+s
         EU8dPy/l7wnWdR5nyRThT5UYOV0/xkNISOQ1qpp+PXBauwT4CjwiU6wYxRlIZfk5zBtr
         2urg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790262949; x=1790867749;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RECHEgWIei/jxGkLITuUpx9y/MZ6IMst7oKgmvhC2+o=;
        b=AfPEaiS4r/kz6XUCizfXZCIIgJVdYiCV39Ig9n9GVcbAB/t5u2f83XGsjnOdBeHKfc
         QFJs5pwUJJBGMBYzSnQtQ3VGff6qo7MewladT06pb3uAWq5oLw2q66QzLu3QTqYXiuzZ
         kPRmZ5IpEaoU0LUlQ0A28yG58nBuO8wb28IjkWbjDBHTAPiKXFJtNzGzfJWV00mn859c
         eaKF5melCtqlsfOrgmopFpT7PQNXHocNvDsU1VzXwXcrEc8+jtmzrKDIYlADqtOYoXUw
         jjyTOgnqxMmikPxib0CccAiMDjU8kN/J2C3G2wGh0D9nHE/CJnqgARPefA2M/4tn+JhH
         oyPw==
X-Forwarded-Encrypted: i=1; AKwUvBz9QE/g0xWgn8VL0EOUAM8gta4WEjnasguwJt1zo/iWzv0v64uAPpTLa5UA98kXnzZPrxvTKOmTiA==@vger.kernel.org
X-Gm-Message-State: AFuF++nr8b9e7BIhGfey7y+pcy2gM5QyElsXO+zRd8Nwggw7TgeXkxrb
	uEIM6uXvdHhZryC4lGsTJRjspDYOr0lGRxtwfuDTp0HdxNFrntE6fW5yGQAy8uOYZ5Ju5K0Y3an
	cahcpOaByiys0bhBAnhP4Y046KLLP2eqT+yKVM0QN
X-Gm-Gg: AYBFou2kLEt7NSSZPUjQo19yKD6VxDV6VgzKLRJM9QIMCq7tRXZuOmg2KLviv1v1FGl
	DzqjxKr8MdldIwalkWcFjmZow1TQgQvl3xaXX+8vpqB+9rC0j/lrj1sU0oFI7degR5q5DgBNVR5
	U6/EDUAXJOpnvx7ll+s8ssR25+wvwd9Rm/9a3B9+xrUEHOv0fCzq+hvYWo8tmrYQos0oOrNya6y
	OW3i38vsZG0aDSieQ9jWLcUDcTkF/BqtQQKyRkIBOtQMqFPegRk/guZdlhOoFapOHrTkESPoF1u
	JvmdI46mxgJ/zwz4XTJrArc9mRY33dWX8Sc7UDLikeqF5b/8X71k3YoYY0+13bSay2935SyLADF
	acUKtpA==
X-Received: by 2002:a05:6402:12:b0:6a4:abe:b08c with SMTP id
 4fb4d7f45d1cf-6aac7cd8cd0mr57363a12.12.1790262948354; Thu, 24 Sep 2026
 08:15:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922204348.717198-1-sdf@fomichev.me> <20260922204348.717198-3-sdf@fomichev.me>
In-Reply-To: <20260922204348.717198-3-sdf@fomichev.me>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 24 Sep 2026 08:15:36 -0700
X-Gm-Features: AclHuK9mQ7wBmLYlao53PoD9EwGQUdhafzCv_xaq_MELOi3IUAiIHmHh_W2Qu6M
Message-ID: <CAHS8izMA5p0EsAv7zDZPabwLWtSGeELjS=r1wHUu+2YPsjQ-+w@mail.gmail.com>
Subject: Re: [PATCH net-next 2/3] net: devmem: use memory provider helpers for net_iovs
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, hawk@kernel.org, 
	ilias.apalodimas@linaro.org, asml.silence@gmail.com, axboe@kernel.dk, 
	sdf@fomichev.me, bobbyeshleman@meta.com, kaiyuanz@google.com, 
	linux-kernel@vger.kernel.org, io-uring@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 1:43=E2=80=AFPM Stanislav Fomichev <sdf.kernel@gmai=
l.com> wrote:
>
> Use public memory-provider helpers for DMA address storage and page-pool
> association instead of open-coding page_pool state and accounting.
>
> Zero the net_iov array because net_mp_niov_set_page_pool() ORs
> PP_SIGNATURE into pp_magic. Reject DMA addresses that cannot be
> represented in net_iov metadata.
>
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>

Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
