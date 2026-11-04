Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804854;
	b=GnXWzqpcz3ovRvhwvn39AWVStfWMIpU8JIEuz6XbIzNUsTqLVd8U/xzwX6pBBCiXXLyy
	 wbE/66nlSSpbK22Kl0+OJO/qqgTDue549tZd6hhv4MNcB0ZWAKSwktKiDnpMrQ8slJ8YJ
	 rE/EaVtJuX8D7CTiML0R2sPAykR5rKS57fkEuUAlGMtNPRC7t80i+wB1WwcFRJNmz1Fab
	 dST1ExzTF2ld5MsFeaIQaXcEvlOjI5sX0daidGhtPPycM0/yvfaXrb6ZJbMycRJeUYIPj
	 m9fReYHvd3zrisM87qNyPqAPGL0Mq2s4wjQHT3RIG7fyfN7jQ5342FxhNhRjZJt8kVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=52M0Mx3QqLQFvHEpAisibJWPHYozvMJfANyGg7k/AzQ=;
	b=AAzRDCLCcUzKcS+fvC3GENzR1Oo0alCpbsCVUyhGPC6BaCDQ5WMrhMrw3DxrdhIXtEKK
	 y0tDXQxa5dbl8/KCXzqboYY/QSvEoW0qocMvkUv+QKJpVyL57Wg4WDJq7BefzuLWbqps9
	 j+skCPdw1K5udU+U6P+M/8yH8v8O1Aa0YckgZHBEIBRfHBEd34lorFImbGI9PPUvWIxh7
	 1zn9WFGx0NDVCeORySqapdLiZpokVyLrq/J7fh5CzYWwWETp6j+j73zz7iWeN4qXSsg/1
	 wKwnbzya/zjBSNvaj7JG2WrVaNTDMLK51m/3kN9bzJ7pquEOkBRDb9t7QT0Wv4lrNsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KOx9SHdU;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7A6606D818
	for <io-uring@vger.kernel.org>; Wed,  4 Nov 2026 15:07:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C7A6606D818
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KOx9SHdU
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6de2f213b7aso364850eaf.0
        for <io-uring@vger.kernel.org>; Wed, 04 Nov 2026 07:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793804852; x=1794409652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=52M0Mx3QqLQFvHEpAisibJWPHYozvMJfANyGg7k/AzQ=;
        b=KOx9SHdUEll96Op2QsIzCBrIWWCmZ2+ruKEdyzkwfLr2LjnDrSJIV4Ay9x00LI/xDj
         eAB4pYrp3HN1ACvtIv8hAR7KIr3wdGmByYgXxUn0nrT2Zz5Hv9gxFWGrNl4ryqg9U/Dh
         5cQC77vJkN3xKzbs9h2/y2/o9Tnddr3FsL86inDGwNQSzTPfE76upOHgw7mzAc2GXfGS
         GWQyCmRGzR7/y0LupP7NQalHleWahuN6h/3rtQZeDG6dLNO2mPcziU2U0xTUb4NjL+80
         yVEtPauJFpSjvnaRpCLFcWS1f3bwVu64DfY5zzrTSTAqKvNzcLFIL7hJF1lJWwv5Lauo
         hFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804852; x=1794409652;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=52M0Mx3QqLQFvHEpAisibJWPHYozvMJfANyGg7k/AzQ=;
        b=FNZ5IX5viBJFTHsWztOaGsYfhAHTBbUs+DMq/ewKPzTTh1D/kfnsdcf/abZVRhyrMz
         OU1glBnL1AAlxycoABSlDdZveTdJNiac9r1a9abi9I00k1uUv2rOdzYvJDcpOZUKF3xL
         3x2jKG0MyaAU9KSVZ6KHaiDiN5+6b2dP49zQWN/zVg/xoPNej+0PyNCsbchSyDjd6Gup
         3op8GBbMQMVKIE7VrmfkKuETlc3K9hL0FSG8FUHaK0jxqfa2apjVIOHc1vkOzQIwwMn9
         hyUyOXSV12EdLTjA8OcZKXfx++5srCt/7SOvu6sSsXVed9kbs9d7xTwXheG8vO2YHRnp
         9qJQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6YFgA2t4n+yYSGrpL8B0UJ9FPcNPxntJ0kHwuKUa2Bv332sO4GoWWQP7mrlxz4B2mluG+Z8up/Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Rdk9bGgWgJAFgbZuMBuGeoTq64Wo6/zxrdFtkkBJ163YLd7dG
	lhyOK/FszB2Sd3RCMQPGrFXdJm4BqKJJJYS7950zFpCPNLsGl2erAmVf6iE06CFOywk=
X-Gm-Gg: AYBFou1bCVj30i3UFzJsJVGegdXLjhZvWXXHmVFDR04Pjeq/vtut83p8KBPDcKS302z
	BUvaA4qAk/YrRl3GtLmYkbxNmhYjepWol1VbUPdZ5alUspiE/GZ7Xhp4eRFt3eubhhK8RaW5STG
	ya63tsP+GOdafye0mJGpuEJaC46mEpUtozdrNAs8RlckeuQ35Sr369MUWA7Q8V3Cv2mmMSr2xZU
	uecG726rf9cPkUwSwCdWXKKx1WClXBdO51MQN5Dcg08fjlozlP19eQP5sEZxuJXk1M5F7ugwEAF
	HNJUAU+SqhWKegYPd1/wCzhSKenXxSuVTUFX6wVSjxgzQXpTYFLe4wzOft2MIordQgQPy1tLvMJ
	Ui/QdLdMUY+5oRHsrCHHk6IQBzGlu9u3JzL36W7g3ugvX7Ct1GKpzJQ4DNVF7BLI6MXNEsXzc7O
	xmeDF4u2cO0v9TVsIsVFcPOLmIQcnha/hQtUftACACnrkOkl+pIAV6yWZ7oeRGm0MhiopetJYUZ
	gDyhfUBFNyjfGxkUhuXa9GL2hHBJqNdaegxqvuWLIMf+UDf3vAzzQWAOM1OglPnEOC9GrBJNRGH
	BrRPpCvGuLxZ9sZkcsmzWEq/k8MYXxZihgJVeqQXTNRJFdbYE/m8GlIn9fTUayQM72ZGYWiLX0H
	JLwhNKpdWGw==
X-Received: by 2002:a05:6820:a284:20b0:6f6:61c5:d929 with SMTP id 006d021491bc7-714f29beb3emr6788172eaf.38.1793804852411;
        Wed, 04 Nov 2026 07:07:32 -0800 (PST)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716c0cdb22dsm1886033eaf.0.2026.11.04.07.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:07:31 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Sasha Levin <sashal@kernel.org>
Cc: Pavel Begunkov <asml.silence@gmail.com>, 
 Breno Leitao <leitao@debian.org>, io-uring@vger.kernel.org, 
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261104144623.3803717-1-sashal@kernel.org>
References: <20261104144623.3803717-1-sashal@kernel.org>
Subject: Re: [PATCH v2] selftests/io_uring: cast optval through uintptr_t
 in mini_liburing.h
Message-Id: <179380485099.4021488.15926225621505501263.b4-ty@b4>
Date: Wed, 04 Nov 2026 08:07:30 -0700
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


On Wed, 04 Nov 2026 09:46:23 -0500, Sasha Levin wrote:
> io_uring_prep_cmd() puts the optval pointer into the 64-bit optval field
> of the SQE with a plain cast, which warns on 32-bit architectures:
> 
>   mini_liburing.h:272:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
> 
> Cast through uintptr_t, and include <stdint.h> for it.
> 
> [...]

Applied, thanks!

[1/1] selftests/io_uring: cast optval through uintptr_t in mini_liburing.h
      commit: 699e7ba5915c8b2c76e257e157464f2bfe7ab8bb

Best regards,
-- 
Jens Axboe



