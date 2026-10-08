Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52081C2AA
	for <io-uring@vger.kernel.org>; Thu,  8 Oct 2026 04:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791435483; cv=none; b=lmZ6d5vWZJuNoXv++Yykmg8qanFXCfk8ES9a9AV6uEqnW5Yv4Ks5dhGwO8YmNL9XAR9YLkh4xH8609FbhTuyMPiLRTQjeUpK1BvLtXiZRITTohsJnRLeu/SSB5nqOMka7zoa5crmJplXehhe3dg9qyLSQibgXPq2gugfjjp11YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791435483; c=relaxed/simple;
	bh=ry7qcL+KTYlKF1LPNpZq7A6xD2fogGghfV5zWwdZN8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SGLKov5ksrolpbIoK3v/VlIYVkG7YqJsC1JUSH5zRZoNOhriiJJQzPjh3yDGVU+bUGwnO/tAvGqrp+T2WIFVxzZA3AO4A8Yom3jqhAZ9S8gZL8D8roI9J8kSzFeeaVN1/Xovt20wkNKedSNxZGEgdZTBCmCKcUbhQKXazJ686x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=HYgaP9YW; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="HYgaP9YW"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-535199ac562so23089391cf.3
        for <io-uring@vger.kernel.org>; Wed, 07 Oct 2026 21:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1791435481; x=1792040281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PY3JPfz0mZiAP588/fUPy9pcwAQqSqz64bfxasIy4mQ=;
        b=HYgaP9YWWNK1FVw7WE/Nxby1AnneOsngfBTfd9XnJpNa7/G3LinJonzw1zXChUatOP
         ejg9IJhxnDQdVmLV3dV3ng8Eg00WkhNvRdNbwox6KON1MUGq0hDrbdcMZdmBphFsPX0m
         0bl944oq+oZfJvKz3AVdHhAYEq3RzRfaB2d5+L+cm6Kc0O77dMTwUO4MvZKZMWdpzwyX
         MgMuKnUju5yDXXwbseKE4VYuvuSQ5R1qJPDESBAwW7XK4vNfcfaOKoKGN7K9AKxL/QcJ
         wphCDosfQoQTWtTgKB9Bls9bQGD+Wh/hH/RBvh7C41h5Zvs9VbTkQdAQ/vGMkUU2InvV
         btAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791435481; x=1792040281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PY3JPfz0mZiAP588/fUPy9pcwAQqSqz64bfxasIy4mQ=;
        b=QJJaRSgC7WTLO+zXg+v/UYGLDtV4a6gD9LIa3VCpn+pAV9IPAyzvwSl+MWveaJYu6H
         XcdrnIG3PLZGFYuBqk9HcMhT1xzsv2arwKiRW2JPTPA1q5x85zn4YTNIo/jbF49aLUA6
         NBsCpsFKE+TEWsW82HXJIca2Bcbfc5GajSfNaWv6EIB4S4W1DUN8EPHd5QqiZ0e1VAVa
         tojBJcpDA2HfcJSqTru5U7lA76naxAxpdROn7e9WBecTV5faM92rmnCfo2ul7i7PRjGt
         RALgFHSV78VfWX+xYZW47bnDGDlDHsT2O7G/aH2AFcTKG04M98sWfXSniABApJOo0rXA
         Tiig==
X-Forwarded-Encrypted: i=1; AKwUvBz2G41OItG4mN+EcnCJpdUS2v09k+D0euq2FhekbcQ4BxUBi7ALxqMnxM7HbjpC8PGqkE6JH7/7Dw==@vger.kernel.org
X-Gm-Message-State: AFuF++kH6rTbaSZRHHxcu4zXBkMQkulN+/pbqS9ILLnTcUAHh5aDA6Z+
	jMzysrd2ODJQsEDhZUi7WOrISWp52Q8KS8nssjjb9ybgPwR+hbAqFN6lCLkODa7Y3w==
X-Gm-Gg: AYBFou1yegcJtA8JzWOZ0XSc61rCSdu8AsiPy9RZYN8lE+3hiXyMAc3ejjUl0mrhWDg
	J59Rf4R2DcG9e8MbMfKMGqAnZgdyQB1hbNGu+wjAFhrNkMrHGC/+t2gte6wDSwcS8cgzKi8fz1V
	1f2BeHSjVgww7JNhpsTA561tV1ln2I6oHtk9Rf0H23EyE/XR/9Ctvj7NtyfnaGesj2S2vLmphqr
	VxQWNisQXw1ifucfBvWfCDCqa9Aiaaiwyv1iVwn+OLfLkYfFX62mBaCpQzQyaf+3lKI8w4ApKLB
	tKRC9UN2Pna3Oq2NTjtFWMhekuLbYENh/I73tYPkNrASqzgVsZGju3Z4Iabh10tRGF14VMb/65d
	ZfuW6Q0mTprgRGUraXLEwKmX3wuwIPy6ZD18m6Al9ceXwen83e8cbbGzDA7Pk1clFqZ86LjBd+z
	d2pJttuDhIYAlrj9kqWNCpt5l19hHR7kgfiWY0clk5yXJKrLgKJbzdxbfMmmBOpIu5VgpzJNWJA
	jVajg313G0jzx7BxmtZ/w==
X-Received: by 2002:a05:622a:2592:b0:535:70b5:2387 with SMTP id d75a77b69052e-535756c1070mr78376951cf.71.1791435480618;
        Wed, 07 Oct 2026 21:58:00 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91996d82419sm37532046d6.40.2026.10.07.21.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 21:58:00 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: axboe@kernel.dk
Cc: dw@davidwei.uk,
	hengyul@cs.unc.edu,
	io-uring@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] io_uring/memmap: only charge pinned user memory to RLIMIT_MEMLOCK
Date: Thu,  8 Oct 2026 00:57:33 -0400
Message-ID: <20261008045733.773725-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261007213903.445430-3-axboe@kernel.dk>
References: <20261007213903.445430-3-axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 10/7/26 3:38 PM, Jens Axboe wrote:
> Charge RLIMIT_MEMLOCK only for regions backed by pinned user memory, which
> is what the limit is for, and leave kernel allocations to memcg. User
> provided ring memory keeps being charged, it is pinned.

Sorry for the late reply, and thanks for picking this up.

I tested both patches on top of v7.3-rc4. The test case from my patch
prints "64 rings" again, kernel allocated buffer rings are fixed as well,
the per-user locked_vm count is balanced after ring create, close and
resize, and the liburing tests give the same results as before, except
that read-before-exit.t passes again with the default limit.

Tested-by: Hengyu Liang <hengyul@cs.unc.edu>

One case is not restored. v6.13 did not charge rings created with
IORING_SETUP_NO_MMAP either. Number of rings created out of 64, as an
unprivileged user with the default 8 MiB limit, 4096 entries each:

                                     v6.13  v7.3-rc4  this series
  io_uring_queue_init()                 64        16           64
  io_uring_queue_init_mem()             64        21           21

PostgreSQL 18 is in the second row. It puts its rings into shared memory
with io_uring_queue_init_mem() whenever liburing has it [1], so I expect
the failure they reported to stay. I have not run PostgreSQL itself.

Would you take a patch on top that leaves the SQ/CQ rings uncharged for
user memory too, as in v6.13? I can send one, or test whatever you prefer.

Also, kernel allocated IORING_REGISTER_MEM_REGION regions are no longer
charged. They have been charged since they were added in v6.14. With the
series a user with an 8 MiB limit can register a 512 MiB one.

[1] https://github.com/postgres/postgres/blob/REL_18_STABLE/src/backend/storage/aio/method_io_uring.c
