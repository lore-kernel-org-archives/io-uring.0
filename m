Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711252931D6
	for <io-uring@vger.kernel.org>; Tue, 14 Jul 2026 19:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784056709; cv=none; b=L56q4tijFSDFDeM0RxSye16FTFo/9SseKOARC5nqfjW2glgWwaRo/lnpgdn3JHYGk7HxuQdnBLrorvi2ga32aoDwyWjtxEYYbC72cXM6zHTeK/C7kzwBvY6ZBZfvEr6FNR8+Vik3Q05aV/LCVCbWgxy3D8g+kGH6A0T/uqdSf/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784056709; c=relaxed/simple;
	bh=ipk/gohqCOHSmsJLMXs6vgTNfzXtiNd2uBL1RavFw98=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=djrFFhIaxQ2fAj5Gwfn+yucpG9Zr9g1qdNMJSbdzl4JGypwbBa47SmQsUUcj+VE/+wOfanG6eAC9sKKmjmtbCw8CtOeRmTPiJqXydIsXMwUy5pdSZPrOAk8krfrz7I3U2FDh9Go91YH5EkxFItBA2cYjSEYh/riHpIlxFxGuikE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=FcYWI2WJ; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="FcYWI2WJ"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7ec49608332so395785a34.3
        for <io-uring@vger.kernel.org>; Tue, 14 Jul 2026 12:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1784056706; x=1784661506; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2rLff8H+n0AAjgF5sQfPaTT6I/KrV3RxEYm25srKBKw=;
        b=FcYWI2WJigLsdyX2MVfaEeVKUwzBAT7QfzM58WwrTfyjEUENHURKn/e4/Dmpg0C68h
         54sbuWZOH1ogQypv5DsSTC95yT31O3oG4XoE3n2HSQX05PjMaSLNKGtJVwUK8T+4UjoZ
         Grn2jUHpsD99/Q5ufgJaNvW+RJHqj9k92/aueZURqNcPKwUJF1v2xQ4KxOqPzyrUUlCW
         O5MQqiPMvAG7S5sOXjyCYNlkfbh5hrnuXK6pEP/FENQ7HvMmXg3rHjPq+a2if/X9wvqC
         NeqA5Lo0imzRWxgJ5RBxdVWrGC7G8gjUTtuMC62D1khpzp92sLfWnngTvGhuXrkC5suF
         SOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784056706; x=1784661506;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2rLff8H+n0AAjgF5sQfPaTT6I/KrV3RxEYm25srKBKw=;
        b=ZXhGpGNitcMrv98cwiDiOkXtvt1vR5+oTk7L+WCCUiXUKGJ3JDvCMx/IxMgeReiihX
         S0IsI7cC8hRZrecQwECRc7iFg2d7Je+kLkilXKUpjoTq6Mf9nNIcxLsYems0AS9qwyw5
         WXrgKnhHqyi4f+TwqXFEkkpOQgmSxu78FBDUdB9jUc6PB9hKw4itgrZUk0+Ssa8x5rBH
         ORs0DLDCnNBj5XtEYvSzwW+D1wgU2w5v+hthvbcg5npB3e7++Kqatkqni/phyxnvjFkz
         9Qb4K8j3U9En5GXCLLMxVgLWY4Ansqo33S4I8fVx2dVJG4iqm8bsYeXwDr3NYfp+pK4z
         8/FA==
X-Gm-Message-State: AOJu0YyHK0QXVjwoI6v2p1soaUa8Jne/G7hv6VnYVal4iBU12bgBvm83
	PZSPJ+EJP4Zh7eWkPAI+7SRIR9NtewTGDlsF6Bo3EemBT7tLArIXQilXMFmZTJ77e2M=
X-Gm-Gg: AfdE7cn9VzEzaz4qd/BRRhfuIdkK7eXLEv1UEKBjFs16lsOEz1qN+zfiiy/jlOMeOXw
	Xl6LbfayxBTsb+7AJSojfoV1jayj/DuOlpl7n3foXsel3XwLVfzwhoT83pvwLc1rMaICPeJgDXX
	1OdrRbSYvEl4FYa6nt6Hp/0Kqczkd2nU+espifThHsUKKOA0GFn2HlhEFf+LRfXfKhgyQtemtM/
	VZmX3uOzzNHrIjAYHxXLEXiulCwmarnvlDFY7RfP47nsTD3ZOLHpG5iNsPy0n1N94Z/Bz/w7LbX
	6BD/0+ONlCiBn64UxSuT9s/pNFjHZEIomzrdyc9HkoxS8dZWIjt13bqz4kFRym7njLQVUJT2Xj3
	eBZ1K3yObGeOx1co3SMw6CbD1FqFIjIJE4eAo0Wb9NhZkzOGOuLQriO1JjpIj5LvsLDAfvlOw2b
	7DmPnG0/pj+foCgFywwB8vUAvnMP/oTsT6c+n4Ye3OZnP4zXbCB3HWM1cHZePAI6XHIg==
X-Received: by 2002:a05:6830:650c:b0:7e7:76f:3ec0 with SMTP id 46e09a7af769-7ec4a8a394fmr1950243a34.15.1784056706367;
        Tue, 14 Jul 2026 12:18:26 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ec2229b4bdsm6549845a34.1.2026.07.14.12.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:18:25 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Yi Xie <xieyi@kylinos.cn>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260714030306.64820-1-xieyi@kylinos.cn>
References: <20260714030306.64820-1-xieyi@kylinos.cn>
Subject: Re: [PATCH 1/5] io_uring/fs: check unused sqe fields for unlinkat
Message-Id: <178405670555.1304589.10253626982577091711.b4-ty@b4>
Date: Tue, 14 Jul 2026 13:18:25 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Tue, 14 Jul 2026 11:03:06 +0800, Yi Xie wrote:
> Zero check unused SQE fields addr3 and pad2 for unlinkat. They're
> not needed now, but could be used sometime in the future.

Applied, thanks!

[1/5] io_uring/fs: check unused sqe fields for unlinkat
      commit: cc609376e9a43166a2fba2aef6c5f9ea262ce722

Best regards,
-- 
Jens Axboe



