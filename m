Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA8F46DFFA
	for <io-uring@vger.kernel.org>; Thu, 30 Jul 2026 19:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785439171; cv=none; b=iyW/6Odqw73cN4IMdy+QZXlNzaiT1Jsl2sUtb+kf8F+wF9zsCTEZ2aCea3eiI+QMUj/XaprWkvQa4o/juz+ycBQmyZHKWmImXFLLBjxsIvMbo2pNQB6LxDThQDapxeOYCjjtoTwCArx+y1cLvPD9+ESuLV9ak/iO3kXYYguU5EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785439171; c=relaxed/simple;
	bh=5MWlkUscioaz4T7q6K7F2Izuv8Xf3+6P8tTxcoY6fiU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jlzEF7nRPStr4Ny/rnl0033+P71izeAaNaqZ5wkKBRLCeZyaiHQrFYWaQkX7+OK4MSnQXsZL4i1ajnGz1GPAicTUVZ1X3x/eoQDLUIIE5C3u9wEqrSY776HTvmECGOlZm1wNaKRAiGNJROCwRKS26REguht+Cn6w4X8dQXF7c5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=pgZYd9nH; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="pgZYd9nH"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6acc15016f1so36632eaf.3
        for <io-uring@vger.kernel.org>; Thu, 30 Jul 2026 12:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1785439168; x=1786043968; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b6IshN5/VXdxYv0X3fYgM6YON9yzW3236B5zgI/BdEw=;
        b=pgZYd9nHmxSI3TNj+2Vrco4n4CWwgRYpw9swtnRmbuhQKd5oP3em6xsvZUMLGuLc2t
         OgvkmTCLGPnjwwbYO5NcaQD2mXezzWvHTvODddXcPQEUItCbMOTmlFrsoCfbDlthMOJX
         TR6icgc0XdLRcQ52rTrGFXc0iQSIPnpdhh0wODc8Y1p/pOQ2LLrm9u4vT8vZ+N9avuTW
         KTI0uWva9Wwx5jPQdg4YYTF8dv+GOWHyBVhDxsAnzlU5ynxh4tI46mtQNypULNiLQNP/
         JTEKJaFFhbA/fiIQ9HCBFhZmxkIuLKyAW+zkg5k1vvtxSwzypCuETzzK9SXATKjUzL9l
         dSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785439168; x=1786043968;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b6IshN5/VXdxYv0X3fYgM6YON9yzW3236B5zgI/BdEw=;
        b=p1UA58frkZtsrfoNMmO4omtjg95GGDPUpmsOb2Kvs/UFpjLM3ERUU2nSjOsr8x0F6E
         52T/CTOQ9sHn1nIENBBF6aNsOlgNdkcbwjiv1287z+aPLyK0U1TVqBT3/1In8JNVZQ+i
         sp0NOi/BPY6WcyUwyoPuXvgLQNcyX+UNzb+Hzo2zjdrWMV+m8su5VB8gs/GLy9WbKJgE
         SVDUvzSsd91TgnSRPvL9Yvf/Lw6CB2RzpysnZ6rHl2UEgwuZclVO6MHO748fMKCmv1XU
         0o+1T3GwWYobPaqh8eHm72M88w5vfLNZhQebCMDe3xmHG4sMOGgbZKvCUxHDqhSC1nRF
         Z6QA==
X-Forwarded-Encrypted: i=1; AHgh+RoQRMBQQ3Z3EOnN8UULGUMdVdTIfnasExV0Q1u2nsbE9J0+nnouGEUm7eyeNfHXEFlsfCvOcZRNcg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd/zIq3JtJ5V4ESVWsSW4/W1ToEQjBuEJt/MuiUiQsKYuSGTt1
	fuKae40uB+NroUBOfo53kNFMmjuw6ARldOqdpDcUggUDQPH4xasH4D1W8pYBgM56Gco=
X-Gm-Gg: AR+sD12LpH1sFg1SQNaOY44xxa1ezjIXhjqoRQYZZMWIh8WgFUOGKVVUlbT3RU0xp9E
	q/5xVJzTfx6JU0FZcwIUckakQyr76Rt4LQer40SYz7DYR8vQEQiuH7vvt3hPhjFjljYlXsFFJH8
	VypPnSXv7GHwH4HAXC78r05DRHNqcgyu4clWr3YRt6ku08+0fzb6Eb8jC9vCq5jRFBtrprAsAZF
	UOhBPVnUaUT/iZ0XI7QVJv6GgVQiOkvMCV0FZt+Ld47fm/JQ7EHsXf/U+hbxHD9ZNuwSTPdY3NZ
	qBqktijGCQqKUejJGXWEXJxTUVU2ko6kl5pGJ02pKcB2Sn6bortCWtE5/eB6mY5Scw0fjbum6g8
	i7vzb9orEt016TSQREtFEJuF644oeV+IVb05RYNBhK1XTSOyYcOaB07exGM1smy8ZtwenzmCTQT
	1n2tpJeYZv5h6fOUu7ajWqc+Qyi7IFibTBNv86JQ5jCjf8vBG4us63Slfbjvv5ij9Az0iSKl4nH
	O87VD5dcAXTK6jdNmHYfkvg1SSGgNXv9BR1MOm+Rw==
X-Received: by 2002:a05:6820:8185:b0:6ac:afe4:80ff with SMTP id 006d021491bc7-6acbc0df6bbmr2522567eaf.56.1785439168404;
        Thu, 30 Jul 2026 12:19:28 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458c2948e5fsm2934332fac.9.2026.07.30.12.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 12:19:27 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Pavel Begunkov <asml.silence@gmail.com>, 
 Woraphat Khiaodaeng <worapat.kd2@gmail.com>
Cc: David Wei <dw@davidwei.uk>, io-uring@vger.kernel.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260730162741.1125-1-worapat.kd2@gmail.com>
References: <20260730162741.1125-1-worapat.kd2@gmail.com>
Subject: Re: [PATCH] io_uring/zcrx: don't clear master_ctx from the import
 path
Message-Id: <178543916694.3222099.11337731480734777962.b4-ty@b4>
Date: Thu, 30 Jul 2026 13:19:26 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Thu, 30 Jul 2026 16:27:41 +0000, Woraphat Khiaodaeng wrote:
> import_zcrx() attaches an existing ifq to another ring.  It never calls
> zcrx_set_ring_ctx() and so never takes the ->master_ctx reference, but
> its error path still passes @ctx to zcrx_unregister(), which clears
> ->master_ctx and drops its percpu_ref whenever ifq->master_ctx == ctx.
> 
> That condition is reachable.  A ring that registers an ifq with a
> non-zero event type_mask gets ->master_ctx pointed at itself, and
> nothing stops it from exporting that ifq with ZCRX_CTRL_EXPORT and
> importing the resulting fd back into the same ring.  Failing the import
> after the refcount bumps -- an argument page mapped PROT_READ makes the
> copy_to_user() in import_zcrx() return -EFAULT -- then clears the
> ->master_ctx owned by the original registration, which is still live.
> 
> [...]

Applied, thanks!

[1/1] io_uring/zcrx: don't clear master_ctx from the import path
      commit: fa1ac3b9eb62918f039276d4d11cc02f682bf93c

Best regards,
-- 
Jens Axboe



