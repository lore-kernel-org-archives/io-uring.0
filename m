Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443740;
	b=oHs14IbYrvUgGLUkope6g/L3eJZHlQiFoSQacxLnJoMTW+kxIUuQai3fspsdwtWRabYG
	 sU8SJt+aThJWqcGGiHKu2tkoPM7GlG3HpIzcBi3pfU5z+4s7FhJiJOkACqCk2o2Stee7+
	 pvdtPkFbL3zL9oRw1kz/t6Q9oN7LBwAoRJ7wNgA+GIPDbFcw1tYaWxe7DflUHmpddMGZt
	 tFXXEq7RYC434ZmCxOubQziy7adczguOv4omY8i3miAAErrbnIfpMn+HnlkY7H8X7GQaJ
	 jkrwxD8avkXRYK7m3PrFdKPyCk808chsVcWZ8DaHc78QqzDNWsrxiasmjzie6U4Begw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=a5Zw6ktfXVFvp9XzUCx8vjfu2vazOxVqIxziDU09cMk=;
	b=usMiMzknAWAn1j5yqr7ePQrr5Oa1GtM8VzOY0CTWsfWarQa7MfTfFba/Reks2z7loaJW
	 K96nWl6RHCTwS3Jeg3tHDWNopqr/oezoe8NTXj1lMlApvHcjRyGGJjuI1iiJipjeXtvxo
	 GFZ/dtLYearNqEjMhKKVTKV1U2TItYxg9R0gwC1STjnFbC5UPJQ6P+s95yEWhPtcoN2Vh
	 VKg3Qyug6SfuQ5GllcoZf3fWw2NXHeHPyGz/a8NsqLA1u3o2Werofg7i85yeK+Jpp6a6b
	 rZcbmscVgKtFhPLGj/NMgYVMxyJyupoakUaw8j+VDeYGJ/CSAVqRfngkYR6LjY6XugA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b="kfBVgYZ/";
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99533606A31D
	for <io-uring@vger.kernel.org>; Mon, 19 Oct 2026 21:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99533606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=kfBVgYZ/
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-833e671ee9fso1717686a34.0
        for <io-uring@vger.kernel.org>; Mon, 19 Oct 2026 14:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792443738; x=1793048538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a5Zw6ktfXVFvp9XzUCx8vjfu2vazOxVqIxziDU09cMk=;
        b=kfBVgYZ/vVPfg1QMFA9wUQmaXG++L0Rep3fUiGfuJPATuwfeCkmKpGRVusaCVDsJ/P
         e/9rVE9qSgAr4hstET4tZiKkjFtNbQodVUNZSgDxFIcNnxTe6Ja2OSIipnhqgFMgZdus
         W48eh6j4NDyT0gmw0TGeGBabs9+yy4Hj3ZTL+uloxMbDp6l2I2/uiD2go5jUdVJ3PeSn
         W5DLkD0v5uR8hpcxnFnomnwn4r6pXW2OU4Xio8GwXm3UYbvrbEI9m2aOqk99aqpxGLfd
         ozuonDyj2OlfYnvLXYyBl1ML2mw44ZzRWyboGTCWmZAOEmu3/u0XYwdk+1Vzy+dryHGb
         jXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792443738; x=1793048538;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a5Zw6ktfXVFvp9XzUCx8vjfu2vazOxVqIxziDU09cMk=;
        b=quaWnscyicW1PgKJVTMp9w3NoMqlMtA4ggGV5K+aNddWFho4NZFhBK43OL5bD41QdH
         30mjSLKWzueWjGTxgTgVrAwOmTHWZIUM2bxYZR91CTh05sCx4k555rG+RkiAtdeucFNc
         kouxra2zE4iz5KXZBa9w0FjwsW7WCAh3V/Yzz/AfeIXM7pDm6/N0rr9qLEhHz3+RY56K
         Y4zDak8O5qJPW6gO75/dMhflfAySi6/wNklKPSAbGOykG/u+ASN0ZaE6C2LzLFGVpxcw
         7wJQxTPdxwPrrY2AIx9KirDvV3Nb2dXyCqxQe755WVG2yA9i+S96shAqrwOiAsKnbZck
         5Jtw==
X-Gm-Message-State: AFq9FYLGUccuS1Vd0x0NrDw9hgQjX/peQCb/T3d+o9klD6StNruIEfR4
	F8aEk/XqlttBQYGbYjNe/wnwUpVVdnRmdoJMnF9N2JEXtNaTO7gdsuv/fEVyW9wM/UA=
X-Gm-Gg: AYBFou2XnjzwRVPTXeuDuEwhT2FxaeWya8l3jT3D2DDhN40P/OcFlp5Q4br34ZrzSVU
	C/IgnheQfyYOW0k+/qm/siYuxblAy/jhKSq3GAEflDDUELccPms5kD9xeOYkKBDtpQxuhXqFQbD
	JLs/Lvrt1lCR+we/8uxU2ph5YV8bYI7lhB3FSoTBd4/l5tD0XDvgYPIj4QTW1irsPIGfaifzKSp
	Ezl11qnPufCOFXHeZtHQXja/b8O74MrOnGSoQ20LkRPVJi6sxO5jAZHBiy7xmRd9O4SVjnzMQzm
	iQHumDwkdFNCgmUqtQ3PqVC2zA0//yAa7D5D41KD1bKwER0N5XRGYDAXG8Q2UnRP7u1rs39IRfZ
	AanA+2IgzqLPHgRKHH/zEWThhgX7d2RwgAVa5bFL/60s8kuGPc+6Mrd7Zz3stR4r4QI8j9QQiXA
	tB/NVGf4HPMT5/x2N2o3GZXGcR21CwiBSTkAnjxCRTzJLj1H6/OLNdSQuZhmIeM0TCIRoqaPPLI
	HzVmDTJ4GKAUJJf231FEVWDYnNklgfm6KRaiQLku9j/GfAi+6TEOCE=
X-Received: by 2002:a05:6830:64cb:b0:843:8982:9532 with SMTP id 46e09a7af769-84500b76ebamr7751284a34.28.1792443737619;
        Mon, 19 Oct 2026 14:02:17 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a4a00f15sm9832413a34.8.2026.10.19.14.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:02:15 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org, Tamaki Yanagawa <ty@000ty.net>
Cc: krisman@suse.de
In-Reply-To: <20261018042227.1105-1-ty@000ty.net>
References: <20261018042227.1105-1-ty@000ty.net>
Subject: Re: [PATCH] io_uring/net: keep recv buffer select length within
 MAX_RW_COUNT
Message-Id: <179244373518.3230223.790813677650935296.b4-ty@b4>
Date: Mon, 19 Oct 2026 15:02:15 -0600
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


On Sun, 18 Oct 2026 04:22:32 +0000, Tamaki Yanagawa wrote:
> Since commit dcbd1c054848 ("io_uring/net: let io_recv_buf_select return
> the length of the buffer region"), io_recv_buf_select() returns the
> selected length as an int. For a non-bundle recv with sqe->len == 0 the
> length comes from the ring provided buffer, which can be up to 4G, so a
> buffer of 2G or more makes io_recv() fail the request with a bogus
> negative result (e.g. -2147483648) instead of receiving into it. Clamp
> the length to MAX_RW_COUNT, which import_ubuf() limits the transfer to
> anyway.
> 
> [...]

Applied, thanks!

[1/1] io_uring/net: keep recv buffer select length within MAX_RW_COUNT
      commit: 96262cfab554cf11412de7a6247f0e82c94e130f

Best regards,
-- 
Jens Axboe



