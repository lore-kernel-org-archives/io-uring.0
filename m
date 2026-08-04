Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF913F9F32
	for <io-uring@vger.kernel.org>; Tue,  4 Aug 2026 02:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785809839; cv=none; b=YjdR3YEi7qLV/d4C88Vj/gmjMuCmnka/jFDoEdFHWY8IxXB+BbupwFrGEnA2eXDY70j3Bc/2AaD105h6PLSkDmnCD5ZNoy2A36jhsAVscoqn0aZO6zJAjJy5fS9ZgXmb1xkghg4v9n+d4ThDaPxqekEslQQXTV047Ubx5Ty6R10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785809839; c=relaxed/simple;
	bh=guG5wGSGgehUpGOTPeyxEWPEjO6+bFcAy5mYnbnBxOQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lJkuDIAehVRnDonVCMqDOK0PPNT8yJF9qunPm/xPY3wBwqlgpu7203GE9FotcJH/pK+AwCdGhp0OkMoeniZWIjNBqgjlv6CnFioMsfkksCOjWt0WCHF6kcwgDot2cVoPvMcGo1YnjzLIpWNDn2qcn64bJwmhqIro+Bq01ffNvug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=c6kwxSe4; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="c6kwxSe4"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7e9f69ee6f4so3625193a34.2
        for <io-uring@vger.kernel.org>; Mon, 03 Aug 2026 19:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1785809836; x=1786414636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QZdXBAcwzRvpMNmypeuohu6GLszlFiczxSZjKK3L42A=;
        b=c6kwxSe4rAuE+J1385DUaBHkfxoU/8i+HFstELwLNWeQofV+5Ywb1JiIvotkCLNA5Q
         j/2rphIibfPW4ZWpIaKHA50cG0OOnIx//TXXQrGIdIuyuG2qDgOs6CG9p/fMyZAwcy5l
         WY3fg3q+hRLEifyP41yn41ZBFUHBEPNtsKUSzhmNFXashBpN8jQc/NCc00epOu3zQPi7
         PAwOw3YmKxr7QQe2d6GEzsEiqPwp987aA2xuJIB4a8gzZudN6f+Uw0brZx/B8uJOO1IM
         SaDtHuT5mu2so4Vh0CgkODm3Nd0YwKWMeWWAh6PGOPGUbW6VBEsyOP7TcSBk1IMOhY1F
         T8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785809836; x=1786414636;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QZdXBAcwzRvpMNmypeuohu6GLszlFiczxSZjKK3L42A=;
        b=iK51C/pUSUeEp5inX46Qj8nMXCqd6GPdbkYYY0oiZ8DOjwwX5NWjrPA2AylbQ0XRit
         5UtGBWV2Lt30Ee/Gms2OLHkGdGwS19mNHDEgDBemBM5mn0XMnUpdacZPfLGpPc5/fe1a
         PtJhlTsYty2jPMpg+kCjJU2TN+TjfuKItDpl34FZ0DPw4su8eUqeV2rPv3v/9T6+1Gi5
         U8qRsAlgygyaOn3EcvejacUV4a4aGQtPrMzLM/SRV3uhXctAqv+6rSAIFTb+po0KFSJw
         ovX5Cb2MsGtB3YeQg4oio7n4CEollimKDBKuV4IL2vrmMnH4151/AcHD1wFTjgIaZN4/
         Q8ng==
X-Forwarded-Encrypted: i=1; AHgh+RotUgRcgot8tTxmmJfkceVtKNLqg+UXndNl2+1Mmtz/ZLuZae7WIQJRFKbGLVzbftW3O8IJOBjgbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtcfSO/ylQnQswcl/eaKnUO/KrivdcfWuElnC+Eb//buc2P0G7
	25tgrlMTyn5kmETqy7mCSJFd5/QoE2wAKn2sjyaaDVl5pf73OI1oBqYmwNI2GxSKBhHgrWKjt6Y
	PMS+DeK9VFQ==
X-Gm-Gg: AR+sD12yhE+VqFXggSautU+0I0dvZIpvn1pVoYJWtpaUBJ1CgVSP6+sQdKi7l16LNSB
	NQFZL5rcXrqDl2dAyGxRKJ2UaigmJJW+KIS718dLroE2/FVP600C/xuHKrzSvubM4TPFRG3qFTj
	Jy2TvMgydT2hMSUv7cUXxbRJ8oj5MPGtWHHy+SZ5fp8YZiK3XDxwdMDCTjUGaqvKCkWiBt6yWRf
	YspIr5O8lsNPi5ScPvkpUBYOCh5n+vVr0SiNuzLigu0b0oflZ/wj9YAdpTjM+KAiNcC+t878mKy
	miVxV05qecSba4xXQvZB8F+DSYmIN9mpHNwjydT2xqhliGSKAf3wsxo42Xkl7/U99nSwImRz1fm
	+GyPmFpvBsh7dJyYAHtEWWngifyRR+zgmduvaMYJ7DY2Wh89ttBAhK+uZ6SNq66S1Mnoq9ELlKE
	upD8vxOLz2yoQEqeMVAHUpsuoyQKN0kA1RBXQ990twjQOZfTQszX1MMNUEXEVtrk5lO1kndSxWl
	kC3+5P07rNxnEwIl1j3LCR4kkyIoJpp8wLPrMc20VlnQCZpjeS4
X-Received: by 2002:a05:6830:67d4:b0:7ea:b8c:4198 with SMTP id 46e09a7af769-7f196ca46b7mr23355946a34.8.1785809836367;
        Mon, 03 Aug 2026 19:17:16 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a55asm8914812a34.13.2026.08.03.19.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 19:17:15 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Ali Ahmet Memis <ali@iusegentoo.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20260802163030.51005-1-ali@iusegentoo.com>
References: <20260802163030.51005-1-ali@iusegentoo.com>
Subject: Re: [PATCH] io_uring/rsrc: fix folio size overflow in
 io_vec_fill_bvec()
Message-Id: <178580983549.518281.3281041637140008411.b4-ty@b4>
Date: Mon, 03 Aug 2026 20:17:15 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Sun, 02 Aug 2026 16:30:30 +0000, Ali Ahmet Memis wrote:
> io_vec_fill_bvec() computes the folio size with a plain int 1:
> 
> 	unsigned long folio_size = 1 << imu->folio_shift;
> 
> imu->folio_shift is unsigned int and comes from folio_shift() of the
> folio backing the registered buffer, so it can be 32 or more on a 64 bit
> kernel. Shifting int 1 that far is undefined, and on x86 and arm64 the
> count is taken modulo 32, so a shift of 34 yields 4 rather than 16G.
> Every other folio_shift shift in this file already uses 1UL.
> 
> [...]

Applied, thanks!

[1/1] io_uring/rsrc: fix folio size overflow in io_vec_fill_bvec()
      commit: 3f3a6a16bbe8bde76532d9415438f8cdef439e5d

Best regards,
-- 
Jens Axboe



