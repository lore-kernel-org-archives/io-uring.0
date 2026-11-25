Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632285;
	b=C4daniWjYYkcTBkIO8qbZhxTVniNDX9ikKxkhQ06jjeb8bV27t5YymiEqAipWqd5NmKD
	 c2cNqP8O7pRSz7xjODiq0QhjL1bFs33hm1wAtnIZQHntNdTqhNOrgspUizmDqBDPNl4Rp
	 YNXJmkpd1v+FKpbWVN69L2T1vZZEZ5ptorr1Uu7ngoT+y3dd/s1qIG5cEBHn3xVfADHyD
	 rEo9nQf0qzAqBZSgmJL0bU/RBhcWPTve+6DRmXDwJ+3dF0ODy10l7jVnhor188TCMCzuu
	 lomiTBgjEjBkixEXx5QLUc474fwOtheTc58u/C388rvfSXmgqA7chl2+RC0gxHwTHXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=VRHDotmexHWmStlQuV0AVH4J6d0ZvIRFZ7yzD+Oxl00=;
	b=4VmewF/imt7f1EAqJ6yzVRGsBrY1sgo+Jg22LJZvcsTqfML1sDyENZuHTgDINlDegCk8
	 XJ29Zt0JQNTkWYEKOLLl2jz8vuNU3ya5DrR3FE36BxElNmFk85S71SuHJ7u0kbmgEB/QY
	 aDbUe+Dcrvo2NUtfFnNhFPywBqWUiAhB/mtLFU3/5tK3LYLVQZRgxqClsWzw2lF/Wj2CC
	 +NJto5TPCh9CDA8BHNvU6ctX4F8xXHZ+ekB91B61qWkuxP048t2dOuz3BgBui3sgt81EE
	 egr7kKIS/mYaE51lmygt7TFe/Jl9N+5miZ2JOZ7jl9l02CNmqCboQE4EVz+9mckn3Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=K7DapBO7;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77084606A323
	for <io-uring@vger.kernel.org>; Wed, 25 Nov 2026 18:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77084606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=K7DapBO7
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-70b875f6f1fso4860418eaf.2
        for <io-uring@vger.kernel.org>; Wed, 25 Nov 2026 10:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795632282; x=1796237082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VRHDotmexHWmStlQuV0AVH4J6d0ZvIRFZ7yzD+Oxl00=;
        b=K7DapBO7s1eQrtaADyqVpSNhQRlyB8m6g06KWYqthv/5BGGLWpIKAIlFac9qgWLB7M
         Wpac9mNRZkegJPaCSc7kQEVyp2NP6KoC2ma6aoPqZ2FAoGxr80wsfLI93Tf8HuIjNcWE
         Pb+Ili1uGwOwDvy+4zzFPq+os8+R/YHWtxkKIZHCjdnWynzhcsWfg2wx1Jpb/ZKqqaKS
         4A7Bv4PvTYSygrOkkfwiUkh/xJBbQUqrtw2u4B0fZZ60dEtd369mqy5+9zqQnQYUmcjX
         xGFothwHuVQSUNkdNLKXsyHhpInL5a2ummoeVqLaS1DXauqGShjlfnIJE2k1ceAe2IJ+
         hPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795632282; x=1796237082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VRHDotmexHWmStlQuV0AVH4J6d0ZvIRFZ7yzD+Oxl00=;
        b=ywHJgnKdiM8Q4fC9E8yxLoK82CdbT05E9dDayGKeKuUVMGYKUo424ct5ZTORfekC+i
         naYMnn84Q+weG62NOocb5eWTXLtUBWFNl2b6HopsypLdb6myp5SxPzcOgD2Ajo7J3WeE
         Yc2BZO+FZU4xpTO7MC4DqNoytgUTwQUiILFM2UI9oOXL2R+9hShTDPanaOLFflG3E9dA
         OukznH+yCx0Fi+CCD10ZpysQnhAmynq1Q12T8lGGNPjmVZQxtRdzdgt0o86fbzTZjXog
         PBYbzvs9G6rjVikZZiPYOA+ahParPjndk9lcrmQ1D9wCYNP2wKi5DXP165K5kO4h3Cf4
         rtOQ==
X-Gm-Message-State: APuU4Z8Z2Ebyj4aZEusalJn/K/55lwQJlryL4ZCyKdRN95CSzy4vZ8yD
	NkW7uDY3uJISwBYuobPpXgoqOS5GmGU0aZfVCC041ESerBfgmagCnXi27HG3ujvQezq0Q1Ruf8v
	IrK7pqNY=
X-Gm-Gg: AZFdTZcmdY/9w5N4X2wp9WqHguubtsZVwS8i8DXIpDHm1ii5o9kqndp1P7kW5fR9dgy
	7Q4SuK+XSErnI2HoYyYBneudK5j6FI7J2lgtdK3RMi45k3tX/cWqgbHRYELFXOsfSP33Tn6PFiM
	d77Ct8igXyP3YrhJFh4VEku+/7PUvoqDR2m3Qj+v9Jc0DTgwwz94SZtHDHwYQLji3hp6fsygjm+
	qoQJCZuflhvFs4q8ujNwW8JrrciY92m09Mpn2gNo+KzqG9W1X714JAAG4hlkbBO0P98GvrF8qTL
	m7POtLhQOTDstU4uK4rBxayir+TjHxDHsTSXpalE5zIaKeop9fO8x+EQB5/DSnEWHriSaKJy3ah
	jZXUgg4KC2eKWCPSpXI6zlbZYQd7nN0GHAywg3BVdlZFfWdWTG/rPsNOkXU+KDFihcy85F+ONxM
	X7fKp70eAJ3L8UXkdtatjpwp/gxl7j1H806JMw9GKZ9rmihohPUhQPtDbWxR/fdjiyypTUtXji5
	OFkJIC/iKUch3vLe/PuPp6Af86xRmf0gIOaO8Uuwki0hc2zgKfXkgwW7hA//cNXluA6BcAzdF74
	1wX5sWd6w+wDTi009QmCZnu+MhQsL74M+qSVBnjvIHGjNCb9mQoaujm8eITIa/nncnCdhFAp/id
	+mTHYkqcck08DZl9lmkq3lkm2HTKYF9vYOQ==
X-Received: by 2002:a05:6820:2488:b0:71a:f390:ae4d with SMTP id 006d021491bc7-71b3958da33mr11464637eaf.75.1795632282373;
        Wed, 25 Nov 2026 10:44:42 -0800 (PST)
Received: from m5pro ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b37c52ae6sm12332828eaf.0.2026.11.25.10.44.41
        for <io-uring@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:44:41 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Subject: [PATCHSET 0/10] Various fixes
Date: Wed, 25 Nov 2026 11:43:09 -0700
Message-ID: <20261125184439.58077-1-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
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

Hi,

Various fixes that I'm queueing up for 7.4, though one of the patches
is a cleanup/improvement after moving ring free to after an RCU grace
period.

 include/linux/io_uring_types.h |  2 ++
 io_uring/cancel.c              | 18 ++++++++----------
 io_uring/filetable.c           |  3 +++
 io_uring/io_uring.c            | 24 +++++++++++++++++++-----
 io_uring/kbuf.c                |  3 +++
 io_uring/net.c                 | 20 +++++++++++++++-----
 io_uring/tctx.c                |  3 +++
 io_uring/timeout.c             |  5 ++++-
 io_uring/tw.c                  |  2 +-
 9 files changed, 58 insertions(+), 22 deletions(-)

-- 
Jens Axboe

