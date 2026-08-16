Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85CC4B048A
	for <io-uring@vger.kernel.org>; Sun, 16 Aug 2026 00:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786838537; cv=none; b=oXKBMB5kK7IObAkvxwatEiV6XF0w9ZjgH9pDamh4sfoudaY1JuDePVMrHVrGcOeoUiSxwcJ/9WYn3+1opY5rS4vItYccIiQjA2JbRpp9KFdkApJ5svj2JtLfoRan6nGKnznkfSt+npLn+sAGYz3HpvTXFBXFRUCLwp1ZVgxgnc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786838537; c=relaxed/simple;
	bh=OpOkY6QGDFG180MLsbhcP73ax2MMp5P7OvE38KtvBGY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iun49EAOcVx6N2hD/r4vwHjjEzEUd/2ChIrSSROeRjgG91dO5+98rn3UjZgbp95kwpOn2H+Co97OTcVCAoEkw6EQRyWKOhyubodb8/M+CUeRR7nAAGjjkYqGpxMe6k9f5cjgjNGehlypacuYu8BXnKRUuk8miYmiBMss7z+Vo28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=MXmX9Eln; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="MXmX9Eln"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7eb5bdb50fcso1511195a34.1
        for <io-uring@vger.kernel.org>; Sat, 15 Aug 2026 17:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1786838534; x=1787443334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8WyStwPIERDnfKnssSEsDt6fwN4l+p55ktIH7n9Pj9M=;
        b=MXmX9ElnUgiIk6HCf4/Tc/ckUod2uEV4UGbBCVNjhOLmiUSQBWHad9Op7lMmD7o72u
         EPg0BZRNGVem4ED+d4I86kxzceX47JNSWvIAwAoTk0+7exBfkykJc/DG5vdeK8WGMNna
         8Gt3FQTs1/Otsv0yi7bopXKCg/AZZ3KAdkHSosZlgdTbvbHk/JeN+tA/EVwGQZD46KFa
         1Qy0PNxHBF6aAZnPgZsQut35QgKn2t+wb5kBl3yp4XWzkNlKeUrPg2+ZQ/v0Wj7HUG2k
         RR1ZqA3CKhR+m2N5Bq8r0Gy6yJKVn2zgS0mjxxs+l+Tlm9hrcRkNLhJZqzWiurP83REO
         wgOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786838534; x=1787443334;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8WyStwPIERDnfKnssSEsDt6fwN4l+p55ktIH7n9Pj9M=;
        b=NSQnTfPldVJlDjw8+FnMRnMOXJSTRbB28WM5TVFvP9Ld9pzVGwDMlWFyEp1JtT1a4A
         Kf9YL1y4li40TYua36JKHzORSCduKPkoQygQbekxQmNrE906X4cEtlY1migDQIx56ghW
         z+VZfEXx7BGxgVTYlBd4AzzlI+KkL9QHLeEjJCGuFVdhfCxwNnIw02ZrdbDgR0vfwbci
         FkqRNt/iLo2PEAaXQdxmnl0Yirovd7RzQyLChnvPhO8f8TLedAcfCfrSyrqhMcSMRbvf
         0WlHxL/jeiVcABr7MC6LNSoi1aUQpMd/ssQ8YVruR+arTcf7dTmgPlsogULVY7NmVxQl
         YWtw==
X-Gm-Message-State: AOJu0YzI5j0pxYqE/lpWsxtalyzR4msTvKI6ChaC3FtUekvuI4LXQWeF
	eT5x5wdmXD1aqdf5kOm5ZxrSSgpyUO0G+zPIbUZJ0y/vadWEpqQIVctMhipXunSGpMho2upOgjS
	nJnRzO22VGw==
X-Gm-Gg: AR+sD13jUTDhS/7t9fGD6K/lbRut5gFYqEfPD/UCN/zuckmvQ9Revy36SKGy3BmVI9C
	uNqTY57n9+VmXxu1hsX3S+KOp0cyJfurdSljaIStx4bKuvTvXgPDeIg2tsDIqgA8hY9pEu0e/YZ
	K/QqdbexqFfBTDuFeyyRZHavFYKXzwnP4EHcPlk0/NGPaHv7ZmWTQdTIoZ/kD5xEX8qWzO+9fcy
	FXXjxG8lO2OWejJYwKA+H/SgVMUZJqK7sMTvEY42fMiy8D8Pqx/AQ4ytyKEG1/b1Y8jdeLjlMy+
	ILJ5y8RH9vToDS/Pgssvtr+gDboyXXHFiAd9UCrTS9xL+ZdiKXYA5Z2nstshbVGVGnhjanq9ffG
	P6wsijX9xR7dg4E930XAmiZNHkN6SkiOqao12sVVvd93ZnF14P+YGrWKPLsV06tqwqxN9OVVxDm
	p0FdZ02M3X49N2KXLD8l5cfo+TLQOLK8sVP95iT9uNwHeyvKTXWTSA0PR3QDlfAv4QKA6Wj6n7B
	qUylzW7hsSaj284cqpWJHxmXHISm0o2n0ri3PuuLg==
X-Received: by 2002:a05:6808:1484:b0:4af:5d69:1cb4 with SMTP id 5614622812f47-4b241e09a94mr15425282b6e.15.1786838534651;
        Sat, 15 Aug 2026 17:02:14 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b24d92462dsm4347729b6e.5.2026.08.15.17.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 17:02:12 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Vishnu Razdan <vrazdan@openai.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asml.silence@gmail.com
In-Reply-To: <20260811-vrazdan-io-wq-b4-submit-v1-1-719ced16c921@openai.com>
References: <20260811-vrazdan-io-wq-b4-submit-v1-1-719ced16c921@openai.com>
Subject: Re: [PATCH] io_uring/io-wq: fix worker accounting when canceling
 creation callbacks
Message-Id: <178683853100.1984298.3484031206299917415.b4-ty@b4>
Date: Sat, 15 Aug 2026 18:02:11 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Tue, 11 Aug 2026 00:01:27 -0700, Vishnu Razdan wrote:
> create_worker_cb() reserves an io-wq worker slot only after its
> task-work callback runs. If the callback is canceled before then,
> io_worker_cancel_cb() still decrements acct->nr_workers. When an
> existing worker retires with its creation callback pending, that
> worker has already decremented the same account's worker count.
> 
> The resulting undercount permits worker creation beyond the account's
> configured limit. On an AST2600 OpenBMC system, an unchanged sensor
> daemon reached 4,291 threads with the original kernel. With an
> equivalent downstream fix, 25 passive samples under its normal
> workload showed 6-9 threads.
> 
> [...]

Applied, thanks!

[1/1] io_uring/io-wq: fix worker accounting when canceling creation callbacks
      commit: 297b5ccea4acacaa47c150f043bce695202afbf1

Best regards,
-- 
Jens Axboe



