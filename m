Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793056654;
	b=ITlyVGMBpAXeJXbELPs1VJ4Rs2HcmqB7Kt3lvVk0Qh/59k1KDMnIanwJhTTbDQZ+GUfN
	 5Sy2xEnW1vucuCz1xET8zJadfMon3uiy6Xo7jbJGdM4U3xE3++CSazXM+EcAiix1r/J4h
	 iK7PZxdBxZmSu8sBoiC+PyX/LfD2dgu3YevWDOc1TcRSF6xpfSW4CVXeeyhjc/U4JbUYr
	 JnBN07Qa2IgiYZkbPeE13DQnTGTnW+f70IxKeCsvRgOfKyFE2/JXDfaO6TvfrekqX8xyk
	 yhPYvOBjaOy6BIIJMpq7N8jNvJwCr9KvtSsk8fQgiDikjhSL4/oCFWQbuK1Z8NtmyzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793056654;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ocSMFJitTHLYiF8HUiTTq/2SGtnm5oi8M3HgkaqWxwk=;
	b=ONX93QZlNt5VH3V8xcX2ez/zuk5TuMK1KwQO8XYWkjyopKighE8uM3HL/2zVid1w6Gbk
	 /ojgyxrYqekU+Upj9giJO8CvYj2vl4CPsJnIm2nOWGZUNZfd0xGl2QvCFGDRmLkRPLExU
	 BBjed8s4C1ed9WfoehjOAAGr0t+Zgecg+EcZmMaSOUnA4uPTvAd2tu4QnGFzlg9avt/Ne
	 +lRQRGsZOWUDa+SUy83ZQ2qiVAHdNtFXoOW8cMhSYOyw4bnYhGmtaxZSe02KhRZAnLX/v
	 FM+YjUF2u0Z1+Hd0K+2URHpfQWXsvFFGUIc5zBQFfR4IAVUrtaBzksP1/xtQ+fIcuaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LwqZPMZ0;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90EF606A31A
	for <io-uring@vger.kernel.org>; Mon, 26 Oct 2026 23:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E90EF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LwqZPMZ0
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so22040335e9.0
        for <io-uring@vger.kernel.org>; Mon, 26 Oct 2026 16:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793056652; x=1793661452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ocSMFJitTHLYiF8HUiTTq/2SGtnm5oi8M3HgkaqWxwk=;
        b=LwqZPMZ0VGuMpCHb11pqfADiE3QHngAGBSZEcKxe9PX41UYYCUusAULtFM+rTWUE8x
         xSSA37ZAKRoJe9r+zMmn+RFMKKMhdIpV7NEocrw661Yr5SGBtfKfqn7wCfCyklIuQqTq
         OwJy2pB7Aowb13BJueRjs6KKhNcQnE6hC0g/hPJSf3Np0k5hQjoESMN9v66yHWP2s0EE
         vARKIsfIciGFELYskmexCC38YfgWOVwD1v8kCFu7njrfhvOBm53IEMxVjCzxTvi/8Uaa
         2oUG2jwudR0/v72vs3uLt4QdpRgMWsDcqu3DFg3IRI9EMnrwOPZYHSSBpyRjs5dh2aIK
         MX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793056652; x=1793661452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ocSMFJitTHLYiF8HUiTTq/2SGtnm5oi8M3HgkaqWxwk=;
        b=ZHNpB6Gyb35N4ntcBynVvqZTQKs0gjaLOsuQCy82egpbkwXM1vRgq3r2EkoWxBz1lq
         ooqiWqgkBmj+Hp+u6Uqeq9flnqv0hn7siiYZwr6kz3KRvSbWv1dQfAn7HdpMOyVXuasG
         84z7dE5LikZvFdLRCrrX8DdGWmcaNWzR5HfSag2OG+AywcJEISrkbiChasRevk1P+9yn
         +c3+8Jg0Tb4sQX8vfItRWipNbn7Fm9PoGk+eJKdjDfAB6nV/5xO3YoTBrAxidjZXPJWD
         ukLVPt8KdrFxekNNHhJ1uBjJNRDBkrxOKln/ql3B18WAAQMK4aWNatf1jYIhN+k0cefy
         5ASw==
X-Forwarded-Encrypted: i=1; AKwUvBxMuHOuCS9Nb+pso14D7Ksg08GB5fUtWSsx0DXgYqmhbvBRvGfR8jvunw87FiZp87XEQJd+o+lBwQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKS1ks8CMZ1YF6huZZ2CbQ6EwxpmVhGflAF2BUkSAdG9n7mW0gQ
	lYjqwDi0vt8lHGruqhXgP35pKbiK7NNOfFjeoV1AT1w8CBGp4LXP3PdN
X-Gm-Gg: AYBFou122bbrerK2I5jyWbi2T06ei/bUywQNpEOnGoLO5zC/jiorOdXFMOOdYrn4Uys
	guZreCeGwqEmoT0fqWsDKbCETQd8vvqgczrNDlwaJ2rWAoGJWBp4vFRa56DC5f0+EHlgNStajje
	O8rOt4n+zeSZVzTbTg8ymTK/J5jO7qjgFvXg/sP0IT/3RYcCFtWw4DKAVjVYVIBt8MhvhwhS/ZM
	NgGPyXR+IShd+xwa7epnhW0HAIpuOWWyB17HFP6ClhEgPbgemOTOzbXGLhJF36mZINeq1CWYCdq
	8X4aVs+1z3GVp1Q1+buAE02fadlXTVi0dHKugTq9EYA9aaTD2GnBMKXg5v/Jvgo/cEj3EY81WIb
	cY0bawCKunTaNRyl+PWP7SHfUwmRE4vAbGm9R4anudNO9M4uLAcAzHjVIGjIScXqvkvpRVgea1c
	CZLBWJaehJQYPs+CDgMQEXqANnpR2fxEcV+TaYYC3GY4ENJi1s6Fb56YuwpRt5XCBsrl6bA5+M0
	2QX/bU47oz1uQp1A4cJbj2ZpGShYiDUJaoApbfBakeySW8Ksvjlyj1TSdPg95n+0d1UwKqykkHZ
	cQ==
X-Received: by 2002:a05:600c:a45:b0:4a1:e11f:b2e1 with SMTP id 5b1f17b1804b1-4a35aca4bbbmr163049215e9.15.1793056652381;
        Mon, 26 Oct 2026 16:17:32 -0700 (PDT)
Received: from prairie.home ([2a02:168:fe54:0:500c:846b:8abe:fa7a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a56992dsm213263975e9.6.2026.10.26.16.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 16:17:31 -0700 (PDT)
From: Cinq Prairie <notprairie@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Stefan Roesch <shr@devkernel.io>,
	Jakub Kicinski <kuba@kernel.org>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] io_uring/napi: drop the single NAPI busy poll special case
Date: Tue, 27 Oct 2026 00:17:18 +0100
Message-ID: <20261026231718.5092-1-notprairie@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <fe5bf816-815b-4a81-b765-2ed36cdd3168@kernel.dk>
References: 
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 26 Oct 2026 07:46:38 -0600, Jens Axboe wrote:
> Does dropping the single-NAPI path trade the early need_resched() exit
> for a full busy poll start/stop cycle on every poll?

Yes, and without prefer_busy_poll that is a regression. With loop_end
NULL every lap ends in busy_poll_stop(), which runs the driver poll a
second time; napi_complete_done() then clears NAPIF_STATE_SCHED and the
driver unmasks the device interrupt. The next packet raises it, the
handler calls napi_schedule() and sets SCHED again. As a result the next
__napi_busy_loop() lap on the polling CPU sees SCHED set and skips
napi_poll(). The hardware descriptor ring ends up alternating between
busy-poll and softirq instead of being held by the poller. My numbers
only covered the early exit case with prefer_busy_poll on, so this did
not show. Agreed that dropping the fast path isn't acceptable for
stable.

> but io_napi_busy_loop_should_end() is io_uring's own callback, so could
> it check an absolute deadline stored in iowq instead of the start_time
> that net core passes in?

Yes, that works and is way cleaner than either alternative I explored!
What I have in mind for v2: store an absolute deadline in iowq and keep
the singular fast path but drop the "&& !loop_end_arg" so the loop
re-enters for the remaining budget after a need_resched() exit.

> This isn't a bug, but with the special case gone neither the single nor
> the multi NAPI path checks need_resched() at all for the whole budget,
> and the only preemption point is the preempt_enable() between polls
> inside __napi_busy_loop(). On a kernel without preemption that is up to
> 10 ms with no cond_resched(). Should the message mention that the
> single-NAPI case now stops yielding to a woken task on those
> configurations?

I'm thinking that with the re-entry in place io_uring can cond_resched()
when the napi loop bailed on a need_resched() then resume, between laps
it holds nothing from the list and is in sleepable context. That would
mirror the socket path. Though it also impacts the multi-NAPI path,
which never yielded so far, so I'd like your preference: include it in
v2, or keep v2 to the single-NAPI fix and send the yield as a follow-up?

I'll also add numbers for the single-NAPI fast path when it is not cut
short, before/after, so the cost is visible.
