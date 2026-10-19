Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443773;
	b=KpTSg0CcBiPPQXkSZGoLOkX2DHQzD71WdocvUqF49YRy7lUhW3WmSGHhDr/yK0tIhVbs
	 y4PcMTC4y7ZyDL9FLpnBOjV2UE8Znfe3uUiq6yq024zcWvzX2rvF08QlXVSfn4ShoRO0A
	 6fbxC1e1qzU84SpTDhMKIjRsOvVfKjzc16aViH55xT2shp2DS4hWA6LaA0qRXw3vdslQf
	 8NVqQubkrdIdO4LRfTh9oM8Qhg9nA+hWUPlDsWLaISjU0KDdxhJ4PqpZNV9eJlL1B9St4
	 mUHhuFwAjF+ahEEkodNqllnDZ3Sr+PWYew4YOi5YCS4HezTAa3QPlDz856Y4ykYGggw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=xFtfINSonkJB+J7cDg4OJ4WdR4XOLP+Q5XiVEZloT04=;
	b=rFu4oFXUY9Gp91iVQxZDPNiKHYCIV5poIkq8iwj6k5ZcgXvwkdP4V5ejkrhZptLx/b80
	 JauuY7BSyvPT2oe2pMidMAiqEFmOUF0rkZA7efYvfnCXWxHY2Yf3Vomvd4khV44ygngMC
	 PQJAMHTSEtM7nNjFVJZcBYPf69TR+pkvNouUa6YE7mqb4zQTnDGASETSdMh/xbvD+D8Eb
	 cpw8s/tMjAmKMkU/LrDNazQsaxnCCUz8NzDzv2nezqZF6Vz++70xVFWxkL4xwuAXREgmh
	 WulGuPVKsEmsI/MlPHoQoJ9mtr7lTnaB9Q5yREK2FoC4R28g+w77o2FeH99VPO5a/5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC038606A319
	for <io-uring@vger.kernel.org>; Mon, 19 Oct 2026 21:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC038606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-841dd2f6848so63606a34.2
        for <io-uring@vger.kernel.org>; Mon, 19 Oct 2026 14:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792443772; x=1793048572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xFtfINSonkJB+J7cDg4OJ4WdR4XOLP+Q5XiVEZloT04=;
        b=jImQWPC3wGvGp7XXq92FOXS7nSbS3U9xLvZBYBQo9tST11xBrcZbnwQ3KGp69jL44H
         ZQUMXcDxaR2otZqSs8GBSsHaPtGUe79c829Fb7P9u8/4JMYyiqlERDGNBUInlVzD3Ry2
         2ckD+2Z8Dstp6mmg4BNF1pduhkKtoVSvv94mDjJQmfUNllTvaeehqERlnDKw3gYN7wVQ
         +uIJ7W363U9fIJXTd2xgs7Sa/JOXqskXvJaV7RvYtSf3ZwwAOwA2NhjkWocEy+OT04WI
         /Qvpb22Mvbf7fYkfCFqFWBbXPPfOcgp2BXw++u4ey7jmfGiqhuVP57ILuH3lU0ZylCH9
         QzYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792443772; x=1793048572;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xFtfINSonkJB+J7cDg4OJ4WdR4XOLP+Q5XiVEZloT04=;
        b=LmuYJjPPCZGf5XIT2XG05PxzxT9d2hAHcBB0FMdYtaQIbNIhzVfWgPoCEAvpSMwcxV
         zrl2cV0xscA3442EI9j0hZUTE2S2CyhuOjZf6qEeuw1Gr5bYydwix0EwO+CsIR3gbtmv
         mBZbhFQ72B9sVBnVr0WviDbuG4k2/TH6B6eULUEyeFJ4mk8IWBZWE9PxjwJEkqbIadRH
         Dfl1psoimv7y7vdIM05r+BC2GdLCO33J0CHWhAoUNQEuA0h1//oEsacploEPqgAWlU+U
         j3svrZLk6P155v8swOrYMm0JOqoRoB3TdG+HFlwJp5T3xVmD92nmp9UCrBYwvViunGW0
         aEwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxz+ukPspY7Zw+POCRs66e2cwWLK/pPzj4lmyEAVxGtZg0NYJqR1VRavHR9g+lztIsysaX3zWN4wQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLd7IMcPUgrPs04e4VplIf/g8XObesKz9o5gWWhimr5HjP7BVyV
	GI6Mg8RDDYBNuVzwcZu1boHU05m++kDWMe96iK5njXATf2PYoXNKScX2jJVueAXAxbON0qA9JP0
	xr7UBGNs=
X-Gm-Gg: AYBFou05fbBJCLmkkwi3R336S9Fp4G9Tbc/vefxK81WpJpqwA8rdCXWYp13GdDiKRe9
	1TycSMbGy5V1hXm+S0gPT4jOveEEpmTnB2Ip33GZc0nnOdv/ejHVAf/qfytYdwJDUmNpsuzWYw+
	5psWY0eImMx3FG9itqvvY2yertz3dEcsv0DrQyXArJsehYGh5Z3IqHFh7a+phaoOj58SMsgC6BR
	3rxRK+q2WynIzkzHd3HCFizaa468thBwje34tWZZPc84lrIZ7MKaPgx5fS9Bf0iQld+jWt5L3OA
	uYk6ewe3TQgLbGeMB1tcgxz+tjpTUEhOXfWWRuaxqQxx+dNG7+PZ/WRS36IAd4i+vhC2phkWdVh
	4b/337q8cHzZ3h3Y5ejiwq9mdghMrbCyklGgdodb2nZwmvMVQhybwpM5DQ/36N3CeG0EQV0HRFS
	GoEWKC3yym1yoZvxaQbKPa7LNq0PBg/acGy8Z/yvPg63ZGArI+ncEmJRqgRcFXUuBKX+NSr0MDn
	CAGgcbLb7TUaA3WtLYqRvqzRBRpGoKHzZTuai9084aMI6VBqr4pYcc=
X-Received: by 2002:a05:6808:17a5:b0:4fb:c2dd:c7ae with SMTP id 5614622812f47-53cc2aa9259mr8493736b6e.6.1792443771712;
        Mon, 19 Oct 2026 14:02:51 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388a5572b4sm7960424b6e.6.2026.10.19.14.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:02:49 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Austin Schuh <austin.linux@gmail.com>
Cc: bigeasy@linutronix.de, io-uring@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev, clrkwllms@kernel.org, rostedt@goodmis.org, 
 tglx@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261017171726.601443-1-austin.linux@gmail.com>
References: <20261017171726.601443-1-austin.linux@gmail.com>
Subject: Re: [PATCH v2] io_uring/wait: wake real-time waiters from hard
 interrupt context
Message-Id: <179244376847.3231032.17554903346880483813.b4-ty@b4>
Date: Mon, 19 Oct 2026 15:02:48 -0600
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Sat, 17 Oct 2026 10:17:26 -0700, Austin Schuh wrote:
> Since commit cebf123c634a ("io_uring: implement our own schedule timeout
> handling"), a CQ wait with a timeout sleeps on io_uring's own hrtimer
> instead of an hrtimer sleeper.  On PREEMPT_RT, an hrtimer that isn't
> marked for hard interrupt expiry expires in the per-CPU ktimers thread,
> which runs at SCHED_FIFO 1.  A real-time task waiting in io_uring_enter()
> is therefore not woken at its deadline while any other real-time task is
> runnable on its CPU: the wakeup waits until every one of them has blocked.
> 
> [...]

Applied, thanks!

[1/1] io_uring/wait: wake real-time waiters from hard interrupt context
      commit: 5b01d5955ac206e38097f777eff6ab2a8b948c41

Best regards,
-- 
Jens Axboe



