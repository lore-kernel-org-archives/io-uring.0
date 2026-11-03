Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716297;
	b=zwLC2T9wkuEtBJgY6+LSUJDNO1zy1GEsUQ1ZppfcTKOJCB12aGwV0r30rqMSs7UmrkZQ
	 8UGBJsbQmYkPFSkeSA0GA87GL4or2Iv8iANt50fvsnOF9CGeEqJWM7eO2UEB1geV0iv2P
	 AMqCQmQ5P0SLuovJDsytgw7C9YT5xF7hjUOJYjyhtazeof8GtqS+OKgFIliM04SHbUqUS
	 fb+qoM1TqzftcQHMWrgYQwxrFjWz8jan/MO54CA+bkTLVKnnOwEAr6ze/KA+MeK7sM5nW
	 Ig98Te6tg92QUBtOtJq41cqK6v0+ZIA/MBPyLr/aTPxKxp5+EVV6X/XJpz2CadnAYEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=uYybwPb89QwCww+5dp+JltAH+UFg4/2qC8d9/J9llBk=;
	b=RNHUiNTbZ9IhqKJmNzJatc/1cmBLlxcg6quPBC35a7yQfFlEMN36Z22BZBlci9XCwqyg
	 brz0atpxxkXVgQPFTT2GtqECNIjBQEqKqmw+yXUrBVWQShNcTx/idPWPcljDrbRQLdSKL
	 lBQ9vBMY/FmNdcyfRD13Y73pAmhfrPUxLs3nkwghXZpSwLDPlHYfKRvhUehBodxMPOdSk
	 TiJTXBuuNj9YBv/cs1wwMzLxitZ0S6ykfUhNEhr8tLlxDkwgGaR/aeNhWWEpfR0/Mqprf
	 AVNDKE2UJTRUb3qSE12jNq3NZkcUue760svhWie6q5mRgU67VIBcU4oAgYtAb/qBxtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="i35I/h3W";
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5979160A2610
	for <io-uring@vger.kernel.org>; Tue,  3 Nov 2026 14:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5979160A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=i35I/h3W
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15dd124bbe7so6038659c88.1
        for <io-uring@vger.kernel.org>; Tue, 03 Nov 2026 06:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793716296; x=1794321096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uYybwPb89QwCww+5dp+JltAH+UFg4/2qC8d9/J9llBk=;
        b=i35I/h3WiGP2irRIUqEFG4dVkgKZgcLvGR0H2bNMnIVIYlsOme4aozuauP0CWGqGQp
         cwkPoU3bRlYX44WqrNEIZKi0IlxOqkfckXBzGct7OQJTUOpgFPIycvec28JNH/OeenHk
         zcSa5FL0oePvH1Gi/X+5+HFc4OXMtMceb06I9L4mqXsD3jJ/kb9aUpk5BOagZEWX3OcM
         i6ysa6Lv6HC7BBA2EILnCSzNq+eTkOZ924CqqFhwlX7gpmaLxWdo+9DM2xh2VrZsx/M8
         V4B6T90//w6YhlFAcxGRzbRoWNgfvjFAUhc1VGhgpxCklaVKUlLR3uLlbXBv2IO440ou
         AEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716296; x=1794321096;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uYybwPb89QwCww+5dp+JltAH+UFg4/2qC8d9/J9llBk=;
        b=0rNuAkk3h4acMfNX2KF/7UzLgZ6ZcXhMc5p1mRgW9pEce88FwsyyqA99kqzvJ4yE0D
         Q/3Sg4wDtxlWkdY8vEMmVCUOJTAd0tjgjaxIsALCmq+hnmbBflddlRKwNU/Q05xSJbAx
         Ibk6fvlMcpl+mfG66mWQOz6MbNldsuiMfHnho89+h0PYmuT3d63lrQ6d2K3LAW8MKQ3C
         8NAISuTCWUTA0Rr9/RfzCtpJhULIoDL96k7sqTgTRvaFhDA7UxgIsFrfco3Bj7oRkbMu
         OdmkU3qOaXCBKhaFaPJ8Tez4tz3T8EQ8ndv0IDYIvU7XvQDzyofwd9003Iw661cU+tkl
         i5AA==
X-Forwarded-Encrypted: i=1; AKwUvBxOKie5HGXhgeJWfyRsAVtweBVo1HcT7eG8D3F3zww7t4fIOvzSi0vBS+qF+QkoDh5R9jXvBhUk8g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9wl4lx3i4JktsWklNyVYG7R3bn3wq0C58VBTSf1vrPR9DeGFii
	TEygFQDYAu3LFCjlzu47b4psfHnpcrgmmcxxwjQJYgo2QvJ5z5+hcn2ru6w294+cOVw=
X-Gm-Gg: AYBFou0coyURn7QKCeFX05C3o4Pj8+0Tf25PIp3UEi55sjedz3JCkx3EObcqeITiLQW
	F1Bfv9xwOYtkbnxnwlIb6oBHl04nmkw1ZM6AdVW2jocwamUVC9dCBZV1kjQCt7ATN158strpufm
	YWxsEW6jsdH5mYxb7rTl+P/5wMzaj6+Ny7Tk72i0aCNqUziABjcbdcRXYT6DnckW5RrR2o0BNFI
	XP5WQD5xM4ytDHWYmU0ep+C456DYWE+9CQjx3T5xJ2mP1l3ODeu1teIbIVrAKoiWxQW64sfrBM/
	mlPVhgB0fogm8NbOk3SCDBi40VCCVWBrc+Iyu5ElpldlQue/KjycSKdH5cjyIpdV5zAyitY3gSe
	foaC6t4GeXFSxpjpDmDivay/GbOxiuktCIJwZ/Zis9kuzp5abLuqni3lDPbL58jGKILwCKpBVFZ
	j2Pp5Lup2L/VjxwKyz8nvDBTlTwcKQibhIWfWGm8fEsF3QcV72yfRB/kjrZRVb19q3cnFwUVrW8
	LMnYbX+6SCJjJ4o4cWolE5Cc82xjorWGMHOnjo6ersqbTQEPCCEmbKnzgofxb+unasuvaqPl8EO
	14NqDABaTWPxvrmeQGqRRCcQwf65eUqnO0yfKRr0GbqZLvpc68TRlWu3QFDF7sttHDKcWlRPozZ
	3mMYSnGoaqAa/
X-Received: by 2002:a05:7022:223:b0:144:f089:b189 with SMTP id a92af1059eb24-1ac5c369250mr26670869c88.36.1793716296265;
        Tue, 03 Nov 2026 06:31:36 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b23b847348sm9534779c88.4.2026.11.03.06.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:31:35 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Meta kernel team <kernel-team@meta.com>, io-uring@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20261101022146.309201-1-shakeel.butt@linux.dev>
References: <20261101022146.309201-1-shakeel.butt@linux.dev>
Subject: Re: [PATCH] io_uring/sqpoll: do the return-to-userspace work in
 the SQPOLL thread
Message-Id: <179371629544.3691261.3795019117614680928.b4-ty@b4>
Date: Tue, 03 Nov 2026 07:31:35 -0700
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


On Sat, 31 Oct 2026 19:21:46 -0700, Shakeel Butt wrote:
> The SQPOLL thread never returns to userspace. io_sq_tw() runs its
> task_work, but the rest of resume_user_mode_work(), like memory.high
> reclaim and block cgroup throttling, only runs when the thread exits.
> So memory.high reclaim only happens inside a charge, with sqd->lock and
> ctx->uring_lock held, and not at all if the charges can't block.
> 
> This used to work. The loop called io_run_task_work(), which does this
> work since commit b5d3ae202fbf ("io_uring: handle TIF_NOTIFY_RESUME
> when checking for task_work"). Commit af5d68f8892f ("io_uring/sqpoll:
> manage task_work privately") replaced that call with io_sq_tw().
> 
> [...]

Applied, thanks!

[1/1] io_uring/sqpoll: do the return-to-userspace work in the SQPOLL thread
      commit: f013b695506491c5202a412a6568313549c81f50

Best regards,
-- 
Jens Axboe



