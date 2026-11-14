Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794673525;
	b=5p8s6MzEVEzpaHb3WJnPalFIz7uU7wqrqrE6sZMSwMzEPlCBBy2w8LKGqcFixAeYikqA
	 my7XQxyplQPwvuRb2liI2BxDyErZ0yK296KOdVyILsRjkyb9WqOXrIs2wUq7d9qzsJqJ6
	 3E1EIiAudOMBaGBz38J7Rk7eIV0Eq1oszHl/jfb6vT4i/hI1As7zY/rckEN7yP5kom5oM
	 kXjLOeS10Mpy2Uz/FeHWpY1GUxtcySJuMIV/+AFYqJATudpf07WHbM4jRtYRJ7rPFfeLL
	 REjk4iNffW7foqFerCdXy5DnDD3MueHnvjKjdoG4zUTsEF7t48/YJvS4nbQmRiRFMRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794673525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=CTiVcC8eq7sdHcAgeRmvEDD1Pq5SKJgbfofygYvagp4=;
	b=R0f7ZPXSFXHW0huKrwe0v8fo6zspB4G0UuhElGKRzIUfJ/iwPoeVTeBBiQN1GOH+HLhu
	 aF4A777D50aywngwvhA4A2I7Q2GflzFzmf9OU/UC6VbBobKeBcq6KhhHQtEHwLMg08u38
	 u57VcLo8nHuGyYvg4N5vtcj7V/rmWsEjbWDE5jHcbqWPdG7LIlyIPdxz/okAofKLYI+Se
	 sS9TUxoYmtdGffYyDnIBqCx1sp3zf6sZ4tjfEkSNMYNc0zwpZwSBZ8vSnEgvbLsfyONbr
	 TplFgGuPAKQ/WWg0FNAmyC/Yc2gfslz5dsnFKVgrWd6jEfOFj8EuEjWomMYPV/gzD6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qzYPtFtr;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1815606A323
	for <io-uring@vger.kernel.org>; Sat, 14 Nov 2026 16:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1815606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qzYPtFtr
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso2491900c88.1
        for <io-uring@vger.kernel.org>; Sat, 14 Nov 2026 08:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794673524; x=1795278324; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CTiVcC8eq7sdHcAgeRmvEDD1Pq5SKJgbfofygYvagp4=;
        b=qzYPtFtr7LJ83eWFoq2V22IY7AVYMhmHa2H9fxtycrwRUBBTDkq1/badq8zD7cCX55
         HUHpmVITbjFIAUz3J9JtXArTr+BZY/TwBSfZxC25wcHllOupH1oJZvF96R8lFk4tSo/c
         fS6dg9GaxYo8rQlwLYvvzsHcYxk++ZAiAxIPEH3wPXGE2MM7oGotwonRHsVIgcUUO8hx
         kxoHL8ngcRDqTJN2uLXXMKjI4BtKGj8zqszrJQ5aBoLzfP6g9LHP2b0T/FlTBmemefvU
         tr4/sP7+VomAZuAdweenCmY3tKr/oRHnH26pEahoja4BEqEaFvkcAQmerG4VxhQ4iUhJ
         oIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794673524; x=1795278324;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CTiVcC8eq7sdHcAgeRmvEDD1Pq5SKJgbfofygYvagp4=;
        b=I4PXuopBl0iXDU5fbnDrQCwe/6vLDmaZr9Y2ij0W5YKRTsuGoxtJYIdfEa5JpjCayB
         TjdOnJv6epz/yqqdG8BaGLXAoRGwMl77AiPRwGkyQ20lN4rai8EJicIbVsxzAxRDM2Ys
         4y8hQ9gJ12TRD5+dg3SEncy63OODcdnhhNTmHAcHlnn2BO8aNBgqoM+Aix3lehJMMxRt
         FRcB/btLHKVlVZ/GfH4P0KJFY6WQZvzZ/8K6/d7ye6PfcSHncxWMTvJEw1o1knMoRwVS
         wuVLDskN5Ax5nJ8ntUweBKMapePAHKSq9HuZyUaaD+IPZuxBaOxOyb0NBWiWtYtBM9G5
         xuNQ==
X-Gm-Message-State: APuU4Z8hnSDEhto5/6BGFlSQoEnrxCuEL4cLMRzbwwqLi2oaE9QUkt5+
	s91fa4/A41FLxeMF3GOOKP6l/bx1YVXYJ+zDHWvI1Seb+4wH4FVn5qNYYM6Hh10TsHAsxClcGD/
	DGOV+voU=
X-Gm-Gg: AYBFou1mG0MWdd8LolaftHNKzKu+kx05zeMR6JV5vmOxhxSS3Prke+svtN9c0wcWNBP
	uNQLKmRUQDpDoT6/0kraKJet0Z88rYMMqCd6cGcfrx1MEAfnzUmCXn8BegTo07hqeV9jWavpnSH
	RpbaiB9sMxnsDXopM/tFqRIxT6BFMHXcNIiHysaRm9Brp0pZ0mIS/NPwuLTsX6YMHQ++lXeH9j0
	+5X616O3tvt8C44aY5H06+wB9XwlDJXuN0WyPrkF+0ZgiVspoFD/zWO8o+OCRPWRhZHwTlDr9By
	ddbROuGJ/Nsw+JF21eprYbdJognYIfDBnukYiBpK5+T+PvT7w2BlwpucJLHaY8jvlugtqyweib3
	zv5gqq912nUmHJjnXdhTJEP3QolZB0ecGSdiTaFXgd9d1hysUU8ApFlSzq0+hWWcBMLsBgMgjNR
	DD5e7uZ93KU5u8qv94rAYMLo+sRKGu4/DjJZCEkhr3OvrpUb/0Iq/vNCiqkNi3+VEd+oflxIXYl
	AU4FXMGhJnCak6BsB/UCRTd/6dRxObQnKE1E++gXDf0Cg0L0RTEVd+MrsppjEJchKFeZHanf/eE
	mq3zhDAHT5b42an14Bm1NkutqyfX8Cr6Xvt06wELT29YjpMcBPufMcl9jrAycfqKwiVcO6o7vIw
	luu+2eYynmtp+
X-Received: by 2002:a05:7300:cca2:b0:36e:371:8255 with SMTP id 5a478bee46e88-379603825bemr5071086eec.0.1794673523644;
        Sat, 14 Nov 2026 08:25:23 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d73dsm18603307eec.2.2026.11.14.08.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:25:23 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Yang Xiuwei <yangxiuwei@kylinos.cn>
Cc: io-uring@vger.kernel.org
In-Reply-To: <20261114072246.741950-1-yangxiuwei@kylinos.cn>
References: <20261114072246.741950-1-yangxiuwei@kylinos.cn>
Subject: Re: [PATCH 0/2] io_uring: fail soft links on more completion paths
Message-Id: <179467352282.50967.219991489846054582.b4-ty@b4>
Date: Sat, 14 Nov 2026 09:25:22 -0700
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


On Sat, 14 Nov 2026 15:22:44 +0800, Yang Xiuwei wrote:
> Follow-up to the previously sent:
> 
>   io_uring: fail soft links on negative IOU_COMPLETE results
> 
> That patch restores req_set_fail() for the common IOU_COMPLETE exit.
> After sending it, other completion paths that never go through that
> exit were checked for the same soft-link gap (with AI-assisted review).
> Two more sites still complete without failing the link: futex wait
> cancel and IOPOLL short or error IO.
> 
> [...]

Applied, thanks!

[1/2] io_uring/futex: fail soft links when cancelling a wait
      commit: 9a7cbe50dd95594d6fb3c57b8454ace58d8d8d0a
[2/2] io_uring/rw: fail soft links on IOPOLL short or error IO
      commit: 4d3db66c5363dcf42c3d43ebaea330ac2d1888bb

Best regards,
-- 
Jens Axboe



