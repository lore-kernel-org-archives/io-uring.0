Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFA34E9C29
	for <io-uring@vger.kernel.org>; Fri, 16 Oct 2026 16:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792168751; cv=none; b=tszZVGr3Iix+osmI0BBoMShg+o5Ovbbr/6RtjZK7EfIz4p33SRYTEAUTc+Iu6dnh4igMvJXhj/KALi/rb/j//ZdtL66MAWOZ4PGvLng9tGGevlUV+D2ulv8ku4dzfCkw81vGZxtsha9NUOw8T877dlUS2G34QVxpUtXPBGKV5a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792168751; c=relaxed/simple;
	bh=K7eBl38ei1HB4GX/8hAcoPdehjNY03dZkwgnqnNJDgE=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CogXWcF/bAp1f3E8XZLUlP4vhFU2MUqofwB+a0yCapuBawPyR0tyvR0EAkbV0tqmo0ehOOJwU6viw1I7tX7mYCiuY1lfx0WJlzfvuZgiezYxMQiJeOPifHLFlVeqHF6B8ZLvfJhnbmoTAZlBedK27tF6L07Wa9Z/K/rvcJaksnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=oeEX5nnT; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="oeEX5nnT"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-141395927feso170546c88.0
        for <io-uring@vger.kernel.org>; Fri, 16 Oct 2026 09:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792168749; x=1792773549; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O8YTxVOfhyZ8wZ6H1V+n+R3o1keQkopUOLj2efHvdLc=;
        b=oeEX5nnTREQ7fE6UQV4bw4yluaKkdV00toFvjiHh2W7GnIvhPOKISE0oxKMVeaGKbK
         CVUJGtbrYRpfM+s3QqJNhHj3QZ67MOTCrtAMmFhT2gQ0R/WnaJzpLoN/XacvT8w5zYU0
         qR3Hke83tIrYjFrn2hC7J4zmPqK3WsrI9+69XnginWwCXbPYM6ESEo1DznxC0rvdWe/E
         mmjJqnf9ynLZUwI7L4kSysfu5A8r5o8DXioVakmSD/hCgXF5kRs5tZ/f2nhse6i1h3kO
         r0vEVYk0Aca2EIm5iR4+Uht7LS/Gj7GjTrL9LOUz65s4v6EhqScAZPbQlY+OfRF++rwi
         K4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792168749; x=1792773549;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O8YTxVOfhyZ8wZ6H1V+n+R3o1keQkopUOLj2efHvdLc=;
        b=zx5a2pNCs8hA3EdWPXpBisFlfe5Q58eMBqfmYxSQHgS5lV+3jxpTh4K76/FNm6ven/
         ZLwSYfs7GAI8+XdvEx4J65yHBXwPopFsRmyEWH2BstIkr+b6UEuUbzWm3YiCA85FyFCs
         H6x1ojBLg+p+KZ9OLddBCn5JqNvx40mjryKVOkHjEv3rAz93crfRoTbWDjW2S1Bwdb/c
         H7tpA6jkz6zTUY+1JkcI2orGHuzSsKIEfRmub1n0vlvrodIQltywAWlA+k1kJynNJ4hD
         xw+PwQXRaf/+U5Dysbh7sIgUyAB3Zj1exyhvmLvLacFEBK3JDLPc6aL2yfRteoyc/HTZ
         Yh2Q==
X-Gm-Message-State: AFq9FYIw1DwnorlGAdP6jZgwLebZZQW5jU1lU6B6jeONFCmBCTWBG+dr
	Y8NUCGLXPkDkHZiU7mUXF2u1Hyp0d7QIWEoXBGOcTbXwBgPmkS6tHxMRoyv/QaLke0rhFH2IMxY
	c2PVRw/M=
X-Gm-Gg: AYBFou165vu0G0cp1umRft/NSfczKmUf6e+pG4drH8apvOcb9/e4zEVzqIBUGr383OI
	l8u69PKRz4wHsKhpsKmgZ71Trc7ZGRQ8KL3r4S7EfCHGkTolngjxxWmcVSOo/iN9WA/Yy/YwDCU
	OwR2iSdHERSmRvhM6vyzxMWTbDJxVoCBQKgXB/b+haOOaXZDulYjp4xvGJXaXhkhAlCIDLG6CIx
	yG3MA302QkkTVGQV2yearM2n1USDppFLm1gJEW+5FSrYP6Ohl1EWlWRbtSyIaRU8SHdEL0NdScM
	9sP1ywe6JD7NFI54XkbCc2g+66/Pc6kh5ZxQzO55SaEmTGSeX8a0g5RcVR7mClnomNWPZNcvWg0
	Mj9hfLsyOrVkjopDhrY+bmHSbfapOSkpgOo0GJ+1CRogNbUK/QEqDaxkmAS6RCrqSIPUe3QIeiR
	de7UwPhxiAzQEi25hn9xaWhYyoTVsIYrUrgR9L22+L3erVLT+B6J3wAnYT58ZBpufGuawDj5fBJ
	epoxz7xm0B45rmIX7fpQcTqG863cbfzJ1U4KZU+pb7qsdMxpekD8Jd63w==
X-Received: by 2002:a05:7022:ea81:20b0:13e:6efa:78f7 with SMTP id a92af1059eb24-18511eb69cfmr487717c88.15.1792168748770;
        Fri, 16 Oct 2026 09:39:08 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831919fdfesm7025843c88.7.2026.10.16.09.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 09:39:08 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <73b2654e41519acb2ec310ba1d6dc99cbafcbdfd.1792167723.git.asml.silence@gmail.com>
References: <73b2654e41519acb2ec310ba1d6dc99cbafcbdfd.1792167723.git.asml.silence@gmail.com>
Subject: Re: [PATCH liburing] examples/zcrx: don't forget to sync dmabuf
Message-Id: <179216874802.2305112.17933570189028514637.b4-ty@b4>
Date: Fri, 16 Oct 2026 10:39:08 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Fri, 16 Oct 2026 17:25:05 +0100, Pavel Begunkov wrote:
> dma-bufs are not always coherent and we need to sync it before
> accessing. Use proper dma-buf API for that.

Applied, thanks!

[1/1] examples/zcrx: don't forget to sync dmabuf
      commit: efa5f5efbeef6967d0a69e3b2c620650e76f4624

Best regards,
-- 
Jens Axboe



