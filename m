Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF8F175A99
	for <io-uring@vger.kernel.org>; Fri, 24 Jul 2026 01:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784856321; cv=none; b=I3oqgx9xPdf6pH23Y4xhaCGJZaCzFOE6p64TEcGdFBV3fVe2TbxhZBStvD40rdGwVUR6/TDantb3nWYAr60/Lm8Aj6wgGGYRTYohmyNYrIoVinNjRwXzWvNGs45+A9+TlYo0z17v9QpDFLdQFTtBoTiLLy2WJRMfbdoZKWW9WMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784856321; c=relaxed/simple;
	bh=+4BV34k9mjeuyi1Dnusi7nvzDv3ZQHuY7Z9Q5DQto5s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GjW5KxAG9RFC/wwsLD1zBjZhzD+NgVs/F7Y4jGHcBytTZQ8EY5OoQLzzRyPZaNigslX8sx7d1JBhFzPTmRceK6suNdg5+x01hUTl++XJijr3SdoPT2PXRSqiw5HlueJl0yS7Lf7jLEfRfZSQ1/MnqLxISmnGL6mwyvo+qkrl/qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=kp7IOkFE; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="kp7IOkFE"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-81f36179dd5so11323597b3.2
        for <io-uring@vger.kernel.org>; Thu, 23 Jul 2026 18:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1784856318; x=1785461118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wg9jt7ilbpC+8aFBRGU7U3yonjzvRWqN31jTS78VK0I=;
        b=kp7IOkFEC+zpXTVV5YNAgDPfOZQUediEjtvoq1E6r+VggZrRkrsE57FVvQt+Zea/WR
         gSnVTcEpHaOVEDIpM6J3dXlI31kcKBJwLGOhmu17GpdUqxClf3aO6VrcutEz3Qqu6ZvV
         rpxn58ibUDuKX1XybD0v02W6++cTkChYix+FHxn58LXaNhW0G7wTDJtZRlXScQfQV50o
         JQzcidbqH1BOYOUCNs2jbrNVHzv+MTOPqq6vXUsV5dSHymUCZWkXrzVxBI8dWZCNfwwS
         YDGwI31zxZJXZgU2JA8+rPDmvz8PC/8PWL+niww87mrA00u+Fw22XVRawnyOE0q6G8La
         +BQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784856318; x=1785461118;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wg9jt7ilbpC+8aFBRGU7U3yonjzvRWqN31jTS78VK0I=;
        b=sAq92FjUomkxQkJ6Xm+kSmd9FAVGaARBR02JAypEDVRJytwP93rHRAvOsUSlN1EPed
         bVkjAzXTYnPsL9dwrTYyDcnQP53ko5r6Gtx/VvdzETIAQabnNxiXnM/pdein42ioEn6n
         21OUF/SMa28OoJwomj/kSN/w74wuRX0XRguNjnEaGlCbYeQU6Yuu0BiHitNvbgP+m/JO
         MAvvQ2sz0//sjvPI09MVJZ74u65+CejeuAZR4FuZsfmkO4Ne5liXSYXXqGo1seqryynJ
         Lchn0IMi1Lbh8O5FxwkAU01j1t5cDFw/OO6DEt7LlVAn75knvLkA+gjNAZi/g0gHMy8x
         XGkg==
X-Gm-Message-State: AOJu0YyBaGBM6Hu5aX3Xts5JO74crXXHYM1WT7SYK9JpkqjUjXH8kWbP
	WWhABQ+55cYxxcipGqzGmNA5n74XpMyjfIqk2EzCfBeyertfoRI2jkn50/yIuiOwDDo=
X-Gm-Gg: AR+sD13P/bBp85XP5dJfV5COvHnyO8nMejdhBe7hQ5aTh5hkv0zpx89zMBvTvZSX2TA
	VMhJ9VKoRzL6WmMN2rDyQKtkBAw1U/+Nzx1k+YEJj3EPa04EZF5LSOVFNhffapJMbrc50XgN6Z5
	ChZhW4L1Sn0Y6ZbYYkDS4rnz6GoMmXOL8MHPPH3pPXnQUeRsKA0g4Whm+1K/LNVUFGydBC7QJbw
	3oiun/pNPKegC1Rk0H2v9aNKXYwKXO1DNnnwmQ+/j6a/63lNqdYWU3rBLeB+wk/P46kVVn3zyfG
	gBAz+Y5W4VT4lj+8X5xWR6mK7uQfmlHY9OWq9B+pCSqmfJjEaB1HtO4bJl0FxMJFTIp+H0ZEuwB
	9KftvjtwhYtUU99TUqeQ2Tdu4nx+lJhqWnTds6l6AMIOYJZdo9iLaVUKGOc+S5j+vyjja+urlxe
	y77BiDtQHlyXc44GtveojyfwzvCdDVdqgrHtkhMf8/dsYO9//IzSEGnIlOYVcAKs2DPQ==
X-Received: by 2002:a05:690c:4b11:b0:80e:bd63:178d with SMTP id 00721157ae682-81f4c1635a3mr16034077b3.2.1784856318104;
        Thu, 23 Jul 2026 18:25:18 -0700 (PDT)
Received: from [127.0.0.1] ([50.168.186.2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33da0546sm36428617b3.27.2026.07.23.18.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 18:25:17 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>
Cc: netdev@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@meta.com>
In-Reply-To: <cover.1784726895.git.asml.silence@gmail.com>
References: <cover.1784726895.git.asml.silence@gmail.com>
Subject: Re: [PATCH io_uring-7.2 0/3] fix up zcrx "notification" uapi
 naming
Message-Id: <178485631736.1078734.694232566420857860.b4-ty@b4>
Date: Thu, 23 Jul 2026 19:25:17 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Wed, 22 Jul 2026 14:42:14 +0100, Pavel Begunkov wrote:
> There is a degree of inconsistency, nuisance and ambiguity in the naming
> of the zcrx "notification" API. Rename it to "events" and do other small
> adjustments while it's not released yet. The patch set only does
> renaming, there is no functional or ABI changes.
> 
> Pavel Begunkov (3):
>   io_uring/zcrx: drop "notif" from stats struct names
>   io_uring/zcrx: rename ZCRX_NOTIF_NO_BUFFERS
>   io_uring/zcrx: rename notif to event
> 
> [...]

Applied, thanks!

[1/3] io_uring/zcrx: drop "notif" from stats struct names
      commit: af78c0020480aba3132fb9fa4db0fd1fb949feaa
[2/3] io_uring/zcrx: rename ZCRX_NOTIF_NO_BUFFERS
      commit: 201e30810223a40275f17c5e6ee410fa857b6b44
[3/3] io_uring/zcrx: rename notif to event
      commit: e366c15e1610ef11d0717ecd875ae63050282676

Best regards,
-- 
Jens Axboe



