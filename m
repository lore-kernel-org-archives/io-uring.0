Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793809121;
	b=0mqhtCfjaNOj+VC7Tx2ZkKXmnxFr9sD4Em62PAdqPt+sOU9PNQZJAyHSueiWrzgEcuy7
	 YUhGG1Iz0brYflj52Gkb1ikz8Bb4Qw8gUxEpny56FwLy1PONSeJlPj7jzBqy/9oQvIo1W
	 tcI+YS04zgKr/+Tqu4Y3Tm8hqW0Km9hOECgGk0PVri90h/U1XMt61x6dy9+HLYLB6qBIj
	 zFJyTfN8vFmD/12Pq5lzOxqL912eM8vLjny+lmoGmBBzxY5PsOo4cuKfodw7Knygrj4PO
	 TcYZM7qqq5i0JXE/0w4fE6oYzlhAy0vim6pSxks0Z486aJbQYp2IkIFJDQmA+wIT3mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793809121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=gUDWtRvLEMbgq+kba5RWito0ySlToH55yE8SufGyfR8=;
	b=grpddrMFlgoYADU68xF85B6ZtBfgi0LM5xS5wLyQvOGjC7q0yzaYRY5VgWaygcRvtLLt
	 s+ZLZCdHf3aTL1ty60JA/h7UPriSZN/EfJVbNopu0036n+jsXsr3QuzjFmQCNDJCqhEcd
	 dyTqnLnt9i00x299QDSshf/uqarDxLd62CUNV6zUtW99sChJkk/cFiOovk+KdfkHOu3ez
	 yxb/GEhpS/J6UZENVYn0cSnOEg0Ia5tmJwrv1IAYjzOaL5tGNM0KCGhcdY+cLKOHVmgFe
	 SNsYddGwcyCpx8wCvv5LzQzH381JYVdgmf+5vJ4Xo+fTaO7WMJ8LCe+jq4tsnJpAlzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=i3tB4qLl;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D2060A5BE8
	for <io-uring@vger.kernel.org>; Wed,  4 Nov 2026 16:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84D2060A5BE8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=i3tB4qLl
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4a6f2825dd6so257032fac.2
        for <io-uring@vger.kernel.org>; Wed, 04 Nov 2026 08:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793809119; x=1794413919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gUDWtRvLEMbgq+kba5RWito0ySlToH55yE8SufGyfR8=;
        b=i3tB4qLlhkL0ozAuIJeEJbB84RH9UsJKM5Hne2/N8lUVCUc0NXnDU+LWHqBk91/qiU
         uZ9fD1CF/W78mUr0hCzQl6ABqSvv6BcYjVnEXBMvzB9gYpaWtsWwKECYb7XjtFwNYGWU
         QtLmM8fe/pP1yOBRLIGQ9hFp0sCQMIwRzWKDIrz5t7I0phbLT84nU1EHjy7PyP2rAXrx
         v/+XeL7kbYR92NrvnYKucJ3CbHJeEIuobWkenjFZPCHR8/2//fViGVG4pPLKXLLL0d+E
         O9bTlsSnJxvMUmWr2j1ZaYk7ZLVMgMo9F0uTjBZCtKJjObD6L0wTHrf/LudOK/WvAY58
         NZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793809119; x=1794413919;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gUDWtRvLEMbgq+kba5RWito0ySlToH55yE8SufGyfR8=;
        b=ZjNp3Z7bjJ9fDXuWRAUwHmOGXAFZJ6nhCEOmSbrAfoliSEhDe6VLVpvDSiS4H/PEIM
         jfRRoxzgIBvYcjwNRURF7/QUoFWGLCDWQyMwMrWJtUrnrd8zX4XphXM5r0wilDAXPN0o
         WnUXY+uZvSRn+QidWCS4flnj+6yFs8rfkah2gHentDg1t7vn5dtYFHjKKnODH885krEI
         6E1yuFQ3jBHlxHL0D/xnxmiv1uoz6nYetI0lmnhq2Y0eAp5NJhaQQwtvXgztTF2FK/Pj
         12gyXbuvzZJIjHRor/enk3eokaBg7Doqm5wP1unVoiPCbTiyny9xCrQNfhyqrijI+Ubq
         5GSA==
X-Gm-Message-State: APuU4Z8wyozDit0HOSYSFbavqefRIP1OTFx4odUIRjQWM6nEVRSURCf1
	KiML6fdUsPcCR9Y9Ba0mAK5Vsw8Gm3KWdv9ykx4O0zdTdV0mnnqBOvJjX58yzqlStnlcMY1oQer
	Pmet0qTw=
X-Gm-Gg: AYBFou2F/lSDxleh5CaM10ftHKLmqVa/+nUr0pLjHDqdlNoBbhUhhzpGKr4ki9WKYK1
	eZVZPeh0VBGNYGO7yJQrjnr7l7UvSkw9Kud0I/nEV3Hz7L+NOC79tEcDoC0NQOdAIAUj27M0RwI
	+Rbq/SCNn7Yvaw/licvGNUlWLMsGbmt6nF8QEog7zfi9hW9Yv2c/z/XwDIQ0NVqqXdUiC0ZYaeG
	qNmFNu0A853xC1t6jevzQM0bL3jlLObFsm4tfs9+O2gpNlV1xhPjAdPJx6DNTUTOGuKpb20/7Q0
	rv0lFie2cXszwr1IW+CG+lXMPgiUYeKSv/FeNJFMu+Qx3Ho1Doilc9XNDH/aZIAxIIvbItAsayg
	G7dqz+Htr1pVvYk+dWUsTZvKCIkDN19yo5+KYr+yatPgcEZEHba34oPeyajVEXe/4oFDC0mJW6v
	gw2bEoWJLu7k78jlqrW8i8Qt4CYfRsqT9sKKQ/fV6czkF+m49ZK1Hk3cZ0TxKPxlrwYpnTydayj
	OqvTRNUXHWxmYbms0q3jfBOyVDfLqW8Lvw1SDpAhNKE2MCQos3rY6gqEwjPeKHRgUFnGbA4QBqA
	ANF7CrLrnwFIqql4FcXMKJG9ZNl1Pm0EoKk5l7xch/qkrX4JDIMmrKTPGSYDPyRTImGpr12piFs
	qgc15Cafh1Q==
X-Received: by 2002:a05:6808:120a:b0:4d6:90f3:74ae with SMTP id 5614622812f47-5640de2dd02mr11902194b6e.46.1793809119301;
        Wed, 04 Nov 2026 08:18:39 -0800 (PST)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9fdfa53sm1897499b6e.15.2026.11.04.08.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:18:35 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <1b3ca4acc350aa5a397325d066533c4e5743a0f7.1793623347.git.asml.silence@gmail.com>
References: <1b3ca4acc350aa5a397325d066533c4e5743a0f7.1793623347.git.asml.silence@gmail.com>
Subject: Re: [PATCH] io_uring: add feature flag for dma-buf support
Message-Id: <179380911407.4062229.3332172119957361790.b4-ty@b4>
Date: Wed, 04 Nov 2026 09:18:34 -0700
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


On Wed, 04 Nov 2026 00:10:49 +0000, Pavel Begunkov wrote:
> Add IORING_FEAT_REGBUF_TYPES, a feature flag that tells whether extended
> buffer registration and dma-buf buffers are available (see
> IO_REGBUF_TYPE_* and struct io_uring_regbuf_desc).

Applied, thanks!

[1/1] io_uring: add feature flag for dma-buf support
      commit: 21662435a5ee49c49a5ff05f2ddcde87acb7b293

Best regards,
-- 
Jens Axboe



