Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787A74119E0
	for <io-uring@vger.kernel.org>; Thu, 30 Jul 2026 16:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429417; cv=none; b=DYQ/GSDCLr3g6hcZf7mttwQkHLsyMEKDe60uSZMel7dQo75TR25JR/KsUzoaNxKk/QiUyzoJn5cPW28jTQ2ALTXAoaNUnqZCw1pshlJcJPMU7mdwVdxdJFWwy891CRSXmyumR5wRd8OwCI3fLd4aEo1LsIutgcSoZUB01f5MtYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429417; c=relaxed/simple;
	bh=p0/z5/vKgpWuODVZDg2GMYm3qZvaKvu5WtLgAINXr4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LNzn+UbjYRMf1JgSZg3L30EidJrX8rgEwGfmBo3FtHt0Fl8FsDOxiyIi2DnzV+0fmjTCUYdczqKUSyBVLS9NKzR1wQeKB70ou2AmcOVINdSG+IDLMCyr7yedhc6IRdLIvN1+7tCtLzz3LDCrD9J75R/jPgcxwnH7ICve5bbl1mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=RbkDYXHH; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RbkDYXHH"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c16794450aeso306720066b.2
        for <io-uring@vger.kernel.org>; Thu, 30 Jul 2026 09:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1785429414; x=1786034214; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+pRs1V9SE4B3gxS7ytnfpQktSDKoQYwBV7VfFfoFRTY=;
        b=RbkDYXHHk9ALkBukF7wPRCWcG/ZZSS2sr8di7B2HWjcD7N7/yI1rMkxx7vzfo0D8oJ
         +cMEU7eNd1x1ZbvVOwUAZYpcL9TMo/xwMP70bOtiOiiFFryv26cT6uElTAr/nfKUMYnI
         yHpzel133bd0xzYlj7VfHoSGVI2VNgvm20HYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429414; x=1786034214;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+pRs1V9SE4B3gxS7ytnfpQktSDKoQYwBV7VfFfoFRTY=;
        b=UPOzmklRmOtP3Jrk1YKKOJiLcI+Tz/iACIWD87/HjOs8xoH5L/5iyUksAZp++L/7Az
         9AHe7sFjNlZRrcfLs9PqaTn9aP4YbCREpNleUu80GkQ0bHDM0ZWeiQdt/411QeRcrk8x
         24eezdtJoW2imkOhDacYwbwxf+r+L6ruQDhohj9lq2XZI2WCQzIv6p+m+G3l09PdeE1Y
         ISwmmtSHhINPi0Pzyp2qzL1zylOPXv5QZ/jdwsuQ0AklRVlgSVAeapmieOk0/MyUffeD
         q13vNKz0VvQF4svggVOZooEbneY+UAImSDBAh7H/e8UtbkaLnlfYXBXjAzP1SioTpL6Z
         bPwA==
X-Forwarded-Encrypted: i=1; AHgh+RqGaq7YG7P0ndy3rlsjT8DbBtnl89PAK10YVayp4BR+I7kH555pTIkU5RySsSV3Otvqjd1f/mTevw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJuuI1q3LA282gRkdI3R/V6eWsryIna31WcsBfysvj45EaEC2G
	+VejeGrnsQ9xTY+VC/re3mBIryWgfXFAeh24b1VnR7EiII7F6ZfHXOHhoTKfE4NC40XCQGGSuTU
	Idm4nQNg=
X-Gm-Gg: AR+sD10Psdq/hj4S894y6GjbW85ptgutlcly9TcB++yU+69pG77+xt0e4WN4VfSl+j/
	zoUPQg21e6S7jHkUdUGkCaf0x7nEkWLhs0960VtDGXKwYQI/QakrnfeMl+zB/p0tFV/Cj6SkzFA
	SydRyX8W5GXWjRIorD+u9IlvYiIMPYKeLjUZuXyslt7MuiNytr+X7DtWGeZqWWVfumyLOQMK6cp
	3FNHOZ4Z5J65BZC8iJdUv/x3oC+OEx7hJ7bPaaRUOob7y16OCcCX+HVoRa+NKT4fC8hjIRWSj0r
	xDhdgmdv8I/s4bX86CfVBbcSt3jSrJ0eklPUlYCNFttL7XGbBaDXWzsCYo6dXHzt9ikoHh7QJQZ
	gEi+j1LZBDd2wlBL0nJS1X6+614mD4fzteSxZpfjN8OmBWbrxFgPdN9/g8Lt2sEUmqusBFXGQp4
	oBMr+OEFo3YDqKuI3tqlfaQhfB1a15COBYK9u9oRAWz4JUOU9sQecCt23wSsUjqUxc8rRTliU7l
	2iNeRt9P154t184HD++raNELAw2ct/CZrTTeA==
X-Received: by 2002:a05:6938:a086:20b0:c1c:6f0d:5b22 with SMTP id a640c23a62f3a-c1fbca22069mr50385566b.11.1785429413775;
        Thu, 30 Jul 2026 09:36:53 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa857c8ecsm89361866b.26.2026.07.30.09.36.51
        for <io-uring@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 09:36:52 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c1f5208b38dso444883266b.0
        for <io-uring@vger.kernel.org>; Thu, 30 Jul 2026 09:36:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqTnTtgkjDQVIt1/dvRJERiLarr/N3aB9qdhpJTskREu6ffKwaLyoZ/cF09CLCOkSAqjVve7jy4sw==@vger.kernel.org
X-Received: by 2002:a17:906:fe46:b0:c15:abe2:e1df with SMTP id
 a640c23a62f3a-c1fbcba971cmr78194966b.43.1785429411650; Thu, 30 Jul 2026
 09:36:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <amtbpwrhlNGJ9OK6@redhat.com>
In-Reply-To: <amtbpwrhlNGJ9OK6@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 30 Jul 2026 09:36:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi7EccGaeo2Q5mdcvcQJ8VX7tcJWW2fHkg6vfmHGGX8AA@mail.gmail.com>
X-Gm-Features: AUfX_mzy442nCbl6DY_JVeWofFI0DxIj9F6qbkbC9XQHAttzTgn3vgqCFq2lWPU
Message-ID: <CAHk-=wi7EccGaeo2Q5mdcvcQJ8VX7tcJWW2fHkg6vfmHGGX8AA@mail.gmail.com>
Subject: Re: [PATCH v3 0/1] pipe: only enable the extra wake_up(rd_wait) for
 edge-triggered consumers
To: Oleg Nesterov <oleg@redhat.com>
Cc: Breno Leitao <leitao@debian.org>, Christian Brauner <brauner@kernel.org>, 
	Mateusz Guzik <mjguzik@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Pavel Begunkov <asml.silence@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, Alexey Gladkov <legion@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Jul 2026 at 07:12, Oleg Nesterov <oleg@redhat.com> wrote:
>
> Let me repeat, I do not think this patch can improve performance. In fact
> I only hope that none of (micro)benchmarks will suffer, they are often
> very sensitive to any changes in pipe.c

I like this patch mostly for the renaming, not because I think it
matters. I think "poll usage" was a mistake in naming and doesn't
explain the issue. That said, I'd go even further, and make it clear
that it's not about "poll" itself - which is fine, it's about "epoll",
which has that broken crazy bug where it calls something "edge
triggered" but then actually wants effectively level-triggered
behavior - wakeups when nothing actually changed, which is the
*opposite* of an edge.

Pure garbage.

So the real name should be something like "epoll_pseudo_edgetrigger".
Because "et" isn't really helpful either.

             Linus
