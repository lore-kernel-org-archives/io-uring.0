Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D82A4457AF
	for <io-uring@vger.kernel.org>; Thu, 30 Jul 2026 16:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429009; cv=none; b=QYC3/I4DkPqBR3cykzA9PK4w/iy+TbvrcbxJlqyx55J4uXkD2zOoo41LczDkk+YqXEu5iGrFfsaYetL/1It8KLtsqQ6NoBhFwJ4WpJia6qt/kwdgmONSoYKLUdhN0Hf98h6FIIZ4TrPOVlyWfiJoUDxHIZwFudE9i689LSfcpic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429009; c=relaxed/simple;
	bh=j929Td4hajJuv+QUhdI1SNg8U3FSolKErsuvAFPYvts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hD3WXLbEtMeGhyTaF6AVe5WPoQlAOLAOv2a2ixKFNLh8Z+cT6Bfq2UxfDYuo1WQn/JVYpqB2+LC6lYWgqUPfu0cxqm4MyjG7cZ8vke6ge1EbAZdEZF25kby4iZTcOzJrxO8XLThowtFPgjM7/VKLkcZPVTdkwntpnDTEFkDI2yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=C1MdiA5p; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="C1MdiA5p"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a082b3671fso33897a12.3
        for <io-uring@vger.kernel.org>; Thu, 30 Jul 2026 09:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1785429005; x=1786033805; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JKKXILLclmc3qNlg3jUy1gcZGJ6n7s8aAYhXOiYG/9o=;
        b=C1MdiA5plKcq614t5OR2KqDB3YkfJU5SH7dad0bu4ETvL/268D5FPAEVIJrJnus6Z3
         pMs8jr3nvjoG2dgRrUJaTBlWtn2BwPqudN7wdgY08Yb30C3XGU6c9uPiBOelJBtOHxuI
         nBG5uD4roUX4+OnCd9HyTt0T1i9foUzMiqoh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429005; x=1786033805;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JKKXILLclmc3qNlg3jUy1gcZGJ6n7s8aAYhXOiYG/9o=;
        b=IQGEGA9aaXbcGeWsGQJtCj9IVM8mlzkkpVvE+eowiuMdFK0Bj4mfIJOIteJ5983BpP
         GOnMoqoQkBDhYbntUfZ7K5LZm2V8SdEQoYu57mu/Bk/BKJUTbEpK7RTlkZvA5vYfdRdl
         Bwqj439O3GteJR6dMcJAO6saKwwnIsRSnhTn9DSDTWIh5LguCzwlAo9VPv/18RZOV+FX
         Tx2s8zz1Rbbmvvhu5ibDO3wwlHMYVpHtgQy94aL6TLpsqHilShYiY6MfZRBaZuGp7pFf
         QtzgOcXQZTROY3FVd5806dmZeENnup3Us1hx3TvQv49HaAiWDkMWolcH7YNLo6UEkCqF
         31qA==
X-Forwarded-Encrypted: i=1; AHgh+RoYVp381xuPYcsw1CYbzE2FcrfERkoB+rQxTy3c4MayFFL4tBt6geR4P6GO/UmH8KUIgWmulnOtWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVwldVH4g5MQe3xPtCY6d31QBjKZYNuDVPKEU5qsdjdRQGVlIz
	6yVymWJhI6aDcFt0DTEmeWcJn7xWijkwJP4kA3rxQmQZ2+ReDHdce2zrcFnS4XqlZXXiUtWEj++
	DwhaSTy8=
X-Gm-Gg: AR+sD12KmdmSaR0xDcFdKCFXtXP+Ks5GRfhx+aekHQLCiMkAS4kNTrphOBUkZQ49dij
	tTMtP+m6OFlzO9qalPbE9MmJ6p/Xo7VhJ2+18U3qNNKBdE7/5cj8VUc5UCN9W2lj20+m9ydRt21
	MvRfFWD5SH35ng2erlxzHq5D3j9ixGvpSyXd1UVgC1L2+pgfx7cIMwvfrzuVNF2rjtbKwR/USIB
	SS+fCt7VB6C8NHZC2939GG6ZCzsD+9WKXFepAsuvy8cslSYIxvlkDqZfIzGQ/+R52Zbe23Zgd44
	p/W7DX9qDcG2/+VAPRztyxyynC+DlWl/q30EgEguNy/dssoN+UKE3TCfHW7pJq53UBp6/SCi/Cu
	nSiXEdFztBTil5evkQdc74daguA4SK2wTibXUhTiBLBjTeZ5gviqtVmB5vEgwo6EVFv69yLGIu3
	8D/KJ8yZ++vxmBH/iTeyrGPQS/9fHqtycRgfsxoeLH7bQv72/uPVJanVW7vRldBI05qJyTZkyBs
	qkCn+CTzt0yxN7zdFgTHMdA7z3e2+mFtr9lBg==
X-Received: by 2002:a17:907:9613:b0:c15:fd85:c5f7 with SMTP id a640c23a62f3a-c1fa54f3602mr234717266b.4.1785429005131;
        Thu, 30 Jul 2026 09:30:05 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa857c8ecsm88926066b.26.2026.07.30.09.30.04
        for <io-uring@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 09:30:04 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c160420289bso328122766b.0
        for <io-uring@vger.kernel.org>; Thu, 30 Jul 2026 09:30:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrvrMzKojKTXtsVsMv6hRIrC2Sag7ZPX4n0AXIvikhcTxGjyMj1bPDo0IUbOOZesnIyTXT4+jKpag==@vger.kernel.org
X-Received: by 2002:a17:907:e1c1:20b0:c1f:6f31:37c7 with SMTP id
 a640c23a62f3a-c1fa57683f8mr118873866b.54.1785429004279; Thu, 30 Jul 2026
 09:30:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514140817.623026-1-axboe@kernel.dk> <20260514140817.623026-7-axboe@kernel.dk>
 <605939add4dfb674bd7ab39ef8dbd3fd22e754e4.camel@xry111.site>
 <427b15c8-c168-4e2a-ac38-b00dc00400d3@kernel.dk> <CAHk-=wjeSgFEr3WSO1C1sPP+fy+Mt5_EL9WXW-s11BOhD_S5Ag@mail.gmail.com>
 <a50c6a4d-5c25-4cbb-baac-f622728f2693@kernel.dk>
In-Reply-To: <a50c6a4d-5c25-4cbb-baac-f622728f2693@kernel.dk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 30 Jul 2026 09:29:47 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjr6LoL+k1J076cSvRHVOdR5Wvh2J1HbwZUQ-BY5vxLKQ@mail.gmail.com>
X-Gm-Features: AUfX_mwr5GDmQnErKjwQ0Dunyz5Uw2GHS2KisR_RTCds9nNDzKaWdeGII3C9Lq8
Message-ID: <CAHk-=wjr6LoL+k1J076cSvRHVOdR5Wvh2J1HbwZUQ-BY5vxLKQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] io_uring/epoll: disallow adding an epoll file to an
 epoll context
To: Jens Axboe <axboe@kernel.dk>
Cc: Xi Ruoyao <xry111@xry111.site>, io-uring@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, brauner@kernel.org, 
	=?UTF-8?Q?Juan_Jos=C3=A9?= <soyjuanarbol@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Jul 2026 at 09:25, Jens Axboe <axboe@kernel.dk> wrote:
>
> Exactly, no other recourse here than to just revert it. Unfortunately
> my io_uring-7.2 branch is from pre merging of the epoll changes, as those
> went in separately. Hence I can either prep a revert for you separately,
> or you can just revert cfa1539b24af yourself since you have the context
> as well. Let me know what you prefer!

If you have other things pending for the next rc, let's do it in your
tree and I'll get it through the normal channels.

And if the answer is "no pending pulls for rc6", I'll do the revert here.

             Linus
