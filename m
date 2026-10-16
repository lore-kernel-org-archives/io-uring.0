Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F32450917
	for <io-uring@vger.kernel.org>; Fri, 16 Oct 2026 10:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792147301; cv=pass; b=XhQAHcpywtKc9sMSNmnLeQ4pYGECLg0yJL0WpHjNcXFc1lCSLivUZf6y/Q4k8IvfBWahpyMnHyWqbJzFDxrYflkNUdco2uLqpKRE6FYOe/hUgE24yclXMvAVRM/opJSRY82eX5Xf5gu80N2qX/yFiOGfja3gti9JmPua8Q2/9cU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792147301; c=relaxed/simple;
	bh=yidpPs+IlsFe6CH8kkeaYDg9/bA2fKGHlODzWaB+2wg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fvzv2to4z9agAxSZCeNudcxqE7Zhn7ztC05bHGbjTTp3IMk/NFQSMmCJP5oJtlHX/QALhgyC9/4elKjzZjC6rb+v9R8pjq3rO3zVmJMTTD+MXqOcVEtrVgVsVmhBvPaNVLcx3i/K53mp2Gl1y4HgSsy5wWakJxQ03IRQkGitYD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RcBzKwY+; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RcBzKwY+"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so10174496a12.1
        for <io-uring@vger.kernel.org>; Fri, 16 Oct 2026 03:41:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792147298; cv=none;
        d=google.com; s=arc-20260327;
        b=GHriXgE7lF7i6jwR1t6R/+TcbCdrL/7AJU8p6tv4M6o1sLS8Gln0Yq4Yx7FpRi2h8C
         7TUPbR324ep2f2L7nBVmkbVSyArCKML5BqpBpt91KUiDVRHeaqwqY/3MXGun8nU47bzC
         4aa78lTPzz7qzdI5d3Zv7Wh3I6h0Nup/GBTKOXuBatSntYOXKCQWMWTL19vFnpOiVUzG
         RAk5cLCfKcJsrA+PbARpJLgVyD+QSadGsjjmdLtaxXJJ41ROmNEfV+u6Bu2P1x47KsSM
         ImVjr28xleZxWY0p4/ngt6NBTo//JnXXrnsmIRmUnb+mroH8WI9xgc3K1jycIS6XcJtd
         cCQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yidpPs+IlsFe6CH8kkeaYDg9/bA2fKGHlODzWaB+2wg=;
        fh=lkgSiYcCSDujy7yrA/QlL3UlBTgkaLpFCvRFbpf9Hz4=;
        b=YBSU06CIdk+3CMSitOtW7mwtFB2OjKOFGQvVTuqLpSf3wpAoulHAqSfx3kvZC1apRH
         JcD7/WTjbDLWAPiS9GUJCARciN5MqLh8wwkv/pnt06IE37hIMaMMZMUNYthXAvy8+KBv
         fAE5li+0cP+kQ8HEYTgYz4NYAZsGjb/3eacn8sC/RKx/AFx1PUUBbza0wsA0nr7SIQqb
         Q930XZ2UwjB+ItZAm+gLqojHZjIw3+5xb8yPrSEMybvtf11S1Ztaj5FUnoicHE7Ftjdp
         IdBdLidFdyiNV8fZ2Mz+mgmzc+XQIrrxC1oVFK9qfwpidGtZ1Skb3cON8ADuXkO7lv2Q
         yqaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792147298; x=1792752098; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yidpPs+IlsFe6CH8kkeaYDg9/bA2fKGHlODzWaB+2wg=;
        b=RcBzKwY+Re9tWtfa3LP0D4VBWpIl57mAaetOXQUUvAaPyeKXHX3ebbgSxJ8XfJg3ux
         E5Xn0NAdxhiEFDNt4bWUFd2XQ+5OOphkUMSz+vYAwZlzYC/atRSzB3AFZYwEOcdcukb3
         Om5um1lV/P8T1l6d2eLExlhTwiLXRGf20atYqoCxodCjEYuWq+lrL/FP/9UXEEdIQRIy
         1m4de4VAkK9YCj/71TebV5dVl/GGTgIzr/qs7KLh3SqKWQWn1BIInB8XQOflXshx3rnP
         heNMC011u1kC25hxBSWpUWeWUFBBnVnNBvo0Syjg0lvjFRWv/bJ6ML0tFEq5nPuVqCPs
         eu6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147298; x=1792752098;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yidpPs+IlsFe6CH8kkeaYDg9/bA2fKGHlODzWaB+2wg=;
        b=afnpGSvKWmGo+z46gENuwjYNE6NPX6ILltNv40iWOqZ5jv7AiYp6RbM+4uF1XFTu55
         G64vetUlL1AHOxVVzrLfGhukUWVbuZSzBqoWmpMkBd+XQvZsNcNM85jxwjMxbkTDXHyi
         5/WobxLqqPOi6xD1mfg7iuxvkA7Ub+NTHN642CMpEkHypvaRczPijAkM9gqbUI9pFT4B
         d3CIc5kIVWRVgeR4iXePMYyj6h0tHgJVqzECZxPPoGJfeDVEMWYtczGIvxhk0rCHRI9s
         WHPagR5p2P8TSCrvwDjHA89gky89z9yVK2W2bsrvYdTVmiL2F0h17fqDL5S1ih1GPTVD
         9blA==
X-Forwarded-Encrypted: i=1; AKwUvBxWuzJJDB3XF/yfsL4pdgO+IdRskCE/bxa7sbCTP7m4JVZo1SstxIgOgArmTdBgJyNyaH8vJsSDFQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJeh4NUsqu42bB1xremwhdRK9qO53WCN0gocxyS40HFmAcUEfjI
	5xvf/s5ozw2YixqQn5hAF8ZJCAxJmKt6ZZrLbYoj648geutVsHpwrvh+XN2qfJJG2mad55TRaxR
	t/1i868geP2jXptSMlxcPArzaF70ZRQ==
X-Gm-Gg: AYBFou303rS8l/tzDxDh0i3OzxaI6nKvsjKR1MmonnlEiNsnIHaNXzC4BrW/bS6FOHr
	2K5I4prsyK574yq8HezG/b3DshtNR+H+e9FePzxLKVhCBMTk2WqLG87Kh2EOnCAjnECkriEM/e9
	309w9TcdP9pJRvQdzYD3ZZJRgguy8ODUd5F1sKOSAYTX+XHBEyE2Fxu3y+sge8uq5ILDlvRBX2j
	oiCBCQxsY7nyH0MAOmCzvxR0JiJ4+86ioCPB8YGK8CUjfD3ru52ev1rAfzY/kJ+85LUtlFknUAF
	SP7THT/Zr1kkMlhOUNOAFrKUKW0v3rUUGP3H5w/oYodyIObzpKPJ9pvMyvGMGDF4dix96sXypBJ
	JS5nubtSwFNSnltVU+TEfDnCKup5TpqHAGYT60wuH
X-Received: by 2002:a05:6402:2101:b0:6b1:c355:c7c0 with SMTP id
 4fb4d7f45d1cf-6b1f9998b4amr8172527a12.26.1792147297855; Fri, 16 Oct 2026
 03:41:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016103453.1129150-1-anuj1072538@gmail.com>
In-Reply-To: <20261016103453.1129150-1-anuj1072538@gmail.com>
From: Anuj gupta <anuj1072538@gmail.com>
Date: Fri, 16 Oct 2026 16:11:00 +0530
X-Gm-Features: AclHuK_TBuGnsWkZyqNlpbVsORRdkyu1KED6frckw8PX5cM8wShBEPc2Ia-Ogs0
Message-ID: <CACzX3AsAKsYsZr7DoDTBYi6H2gYMzkktNkMi88O5GD457XxmHw@mail.gmail.com>
Subject: Re: [PATCH] nvme/io_uring: enable dma-buf backed passthrough I/O
To: kbusch@kernel.org, hch@lst.de, sagi@grimberg.me, axboe@kernel.dk
Cc: asml.silence@gmail.com, joshi.k@samsung.com, 
	linux-nvme@lists.infradead.org, linux-block@vger.kernel.org, 
	io-uring@vger.kernel.org, Anuj Gupta <anuj20.g@samsung.com>
Content-Type: text/plain; charset="UTF-8"

I tested the dma-buf backed NVMe passthrough path with a liburing test,
available here:
https://github.com/anuj7781/liburing/tree/rw-dmabuf-pt
