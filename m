Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BF52773E5
	for <io-uring@vger.kernel.org>; Wed,  1 Jul 2026 11:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782906156; cv=none; b=qITLTiPFivNqGVwW65MnULLiWiea0PWxfrAdI/DqGNTxid5knWr+S/KmvzX1tRl6gcytTXaeamqM9KMoCQX1+g325+fjTKLJXrVhHqJyS8Wf0TKOVUxZCtaqQHUSvlPUmHA+pyKieco5fJRzvcd2l7nJjNlJ/zjFPjywTI4bu9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782906156; c=relaxed/simple;
	bh=QfsyRWxDX5ywfheIbHqbzMVfbQXD09RH22N9SnMHKzk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DlJTO/t+l8Ywb+Ai6CRkJRdL1QNSChTApfdW+koyAWHZXWxjFQQDXKXcxuVfWxIf5jwIhRYm/e1pkSJ8pH+7Awg+ipuAZTjbq3PhHlfQgcfVRfLGYQ6L2neMUNxr3CqPPltbSsjJwopbfpdJb86uS5MIdrSV8c9ob+S/E8536m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=nFU/1fQn; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="nFU/1fQn"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7e9483cd614so464300a34.1
        for <io-uring@vger.kernel.org>; Wed, 01 Jul 2026 04:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1782906151; x=1783510951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwtsEahTPL5jqfaqXp8JzpFcpPqQYNIPQ32MjLQLw7I=;
        b=nFU/1fQnJcz01UMaeaOUIBgASNLx60URPg5QbpSyrZx40c7hywEVw8fa50mnQ3HrbN
         6uSKa6PE1V1wYJBWMYKqxgMtn5bfTgJLUV8+hA6EVo+/pQMDEDQ386P0kpBBOKtytvFH
         9zzOXp1JJ+vEszjGaouJpyhuedQRx0GxfpjUiWgLfA4wlUz12blRfM7YyRTDlf2vSX1K
         qkiYYa1JBfX/N/Md/k4ZY+S/R2lSI4NlboQtvzgMZbtV36EB7fR5DQ8B2nT5/BJ125XO
         7vxaYoOmjj32bXauWHIND+bEIAiUOy4hXLphnV2IJQIi+bUijXeWYCRbWfo7p8ZRfcRN
         l4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782906151; x=1783510951;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uwtsEahTPL5jqfaqXp8JzpFcpPqQYNIPQ32MjLQLw7I=;
        b=YHzdOeb7p6G9iwVz1MTwpAM0ZXC8dIvwA6G5YwfDPUGdG7AMQI7u1Oz6gYZudNEnlZ
         0Pz46isqIjVv+jpVIZxY+VhXhL2bl1WMnY4M6lb+1KLgBdrHFp+B9lPd0gEYowfRNQBP
         6Gt16KMoMC1zL8tXqe5Zk9OoEE7y0EJAU0BnIWwriI/V28fPw0vblJXhc/hO+DkrBlpY
         sXARGKjWnD2KXiWIqng+BEbz/MMEw+oZdQaRmIwEHhFM73/9qihuVspDcrlE/ogQx8C8
         L4vqgGBd9pnRoKb21RxxJ2BagIf15NNaHYabq0UoT0j9VOD1vSxE0Jy6rxBiJFyB/pfp
         kZEA==
X-Gm-Message-State: AOJu0YyNLQBf+CjW0IQrfSx/0jkAFYxlXw78aPUoYk2gdYK66oKkExoa
	ZqiLv7A/nf5uC8Hs6i/tYLGNkqVYHpe+bTuPW0LdgF1Snjh1pB1hVBiveSjJuNq3k2x/30bTXg7
	E3HvuxfU=
X-Gm-Gg: AfdE7cm/CGAVw0MEu/z7uyNQ4wHprzmhbmA1xaBYXpmNknNz2XzuWfIxM3+htAw2a1x
	XFNfpUEmD1pcL/liQzCO3VjTQlfwwl4skZNaCOWlu6WBsjE+jNcTSUnwJ6d2yawXqVCIHd7tnrc
	q+dKsQqWjinYiXKiMuC0iB13P5i3VkPWGA9nLpw6ncrW9bnReb1xhcTpdkQZW47Ag+4UpRCzQSe
	5ctHeSVp4jcx0uCcS1KvovGINbFzrtzJuoF3dv2Cbli/+m8Zno+9rB2IdMWSlsu7zD3jc20TWw1
	yoFC0hNd1ewAEY3RAl1wkpUvbxCHDAdcCq08gdzbkX+a/m0YszzIPfv4R/8enhahly5YzgPErjz
	cQUxuUN7S2mFVbBECaKE9ZRYLZkh4Iey2c0WdCJD0KjN7nJnwqQ2+XKnGpI6OAU1PP2uPH2JQoq
	A2ultdW9KhNxr2mDUZpWqP4G0L7RbU8uAV6007ow0wDDfFon2ITI38XBWaHlbFImUQIUCF1k9zV
	G3A
X-Received: by 2002:a05:6830:3811:b0:7e9:cce4:803a with SMTP id 46e09a7af769-7eb3d04f4femr651848a34.10.1782906151432;
        Wed, 01 Jul 2026 04:42:31 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9f328636dsm3668677a34.9.2026.07.01.04.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 04:42:30 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: krisman@suse.de, Yi Xie <xieyi@kylinos.cn>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260630091206.126206-1-xieyi@kylinos.cn>
References: <20260630091206.126206-1-xieyi@kylinos.cn>
Subject: Re: [PATCH v2] io_uring/memmap: return -EINVAL from
 get_unmapped_area() on bad mmap
Message-Id: <178290615011.198657.2277099553649847509.b4-ty@b4>
Date: Wed, 01 Jul 2026 05:42:30 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Tue, 30 Jun 2026 17:12:06 +0800, Yi Xie wrote:
> get_unmapped_area() returns -ENOMEM when io_uring_validate_mmap_request()
> fails, but validation errors are -EINVAL. Propagate that errno to
> userspace, like io_uring_mmap() already does.

Applied, thanks!

[1/1] io_uring/memmap: return -EINVAL from get_unmapped_area() on bad mmap
      commit: df645b745941ea829b39134ac342f730f4d9d978

Best regards,
-- 
Jens Axboe



