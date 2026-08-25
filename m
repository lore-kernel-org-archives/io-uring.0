Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA8D442B0B
	for <io-uring@vger.kernel.org>; Tue, 25 Aug 2026 17:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787680379; cv=none; b=UuAxBKGNfhDkkgZwx600zPz4fXDFblyKUNxdoEeLpTJtrsA7SpFdZEBAZCGRiM1/f0WGa/YoQdbwLxLUJ6t+VEV0VnqRj+zOIlOHn9zK0HMZpMxc/xyuRfJKRo5ZbHBsO8BHfUQq3eQxD9A0HdvEESUjo2pIbGX+KPQiCN9KY+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787680379; c=relaxed/simple;
	bh=600ujPlfXVj1neFneB1ayr5PWYKjRheWsQwctxB22BA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WV3v5YX0Y2rOu/YbivS+UMoL1/B7edAY0UyPBSXbWA1MUzkPblqfOg437Ao7aCJe3DN8M6emy/T5uEHZDfNQ/qmhCbSrzPlbvyMKo95arehV7xucNEKJWkcL2wwAf0q3s4NkWxZtcnvTzLK4qpFhVT4yP+x/L/Vl55IEri+dMis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=Yu821kg8; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="Yu821kg8"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-455ee8f529dso73877fac.1
        for <io-uring@vger.kernel.org>; Tue, 25 Aug 2026 10:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1787680376; x=1788285176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k9q1W24juDM89S16rr95JMNcB1mXlCHAJ6sYvr2j45M=;
        b=Yu821kg8ulXf6GnbCeWjjexJArA+ekbD3nykFt94gfHfzb6Xj7PXZuV14xjvhKX55N
         ZMf3EHjFhjXZYbqZeu1+DiQk2nVoNlEgurvHKWg4H95bkqGIZxAlXyMuikRJMBfdK6un
         /YMbh9xsS63DojrNfggFrdI4a7kKgTh94AL3PRIKmhZb+9fO9uRlEHXi5GLtTD1Jf+q4
         /gdgDqearkJGjB2Gup09Fwen+gLt0PQwbh4zDasrwhEVt7q5qehk1YJPa+T4br0Lt8Ql
         8GdqBBRz2MXZQYnRBMAUjYk06WhYpaQ//MH8LrBbSJBwZmKS2+gFMhKKEVD8x34vgAea
         wnIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787680376; x=1788285176;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k9q1W24juDM89S16rr95JMNcB1mXlCHAJ6sYvr2j45M=;
        b=Aqczxx1ngTJLWACj50gIKZFaccGM+17yf4Bmg1UM+6UEPBAYoj6T7dnMaW0c81uKrD
         qvTaCFBuJiGV6ZTNVO4MYnwnIyImLjSJNq+qXsa6zpPLwg2N2iR2v0/qgq2mCWI8ph9u
         rjpXMAgm4gZnKlfO6BaeTlKFQkD5DYhDUCg34Lew99+kMhgAGzN4kFt7PjmJICgBtdCX
         STfr0iOKM7P8fwtdt3J5NdKf0ZRnJhw6RJ/r73SVfKXh72ZBrJ9w3gWKy+OWYWA3ye06
         ppxICuNTkm/DifbfMwZoXOwjQJ7BxbuqhEv6pdjTTMignL/4dzAYdQZPVnQjZD5x0nSr
         lTkw==
X-Gm-Message-State: AFuF++kY9DfaI06jxTI+7mnHE+6a5w6PfIYjpv2531y8PkVQs+sUcLWY
	f539Adk404CYyqodV8VGAi97ozpNiC8AHG69AIRFCUH/zOd1ki9/X7x66wy3lahA9X8=
X-Gm-Gg: AR+sD11h/wpIex3IKtnZEtnPOQujk39ZT6C9gwJmurEWGZWSU4U2Gwz783igPzsZ0dK
	omBnSszFICCVNRPmkzB4Cvf/YDFuXUGtvQEpkNsl6oJAk2zwVN0NGPxTjcUz+7juDOR5cfS1Flv
	VoozayUXW8xulVkTsOBEy2ksr73tGXYeGawEDD9W3q807roWSH64OQjF+HOYasK2evG8YJ+Mcl1
	roNKkgjm2PvBUUypRbH0sjKHTSMqVCh8aQL8CDGRWSbCZrKQC00yvTaUhAcgqUm6txSEuhY5P9s
	B980PlOsrTFAIoYpCC8lw3QYV0oCeQ4bCOXB8DualI9hF9YzzE5iFzwTILMrqKVBwVyMvVY/k2w
	lBAB6iHYHf1ZtHpmtd/e6H7TPTG2WJATUyqYxDFT9Kx4YiG6l/FULNlflX5D5Q6ydndR4UmjwS6
	mnaRmTemZMUTUaiCT3GjzGhfqFY4QdjQP54eyIqUhlm8yNc1kjKSNDKQxFq2eqGk3JZa/eSfOeO
	NIoEuuxqeCherHrVkFT9cX6RArUJyC0vkMJSlI0P/G0kdM29daH8sT6
X-Received: by 2002:a05:6820:7085:20b0:6b1:31f:b0b0 with SMTP id 006d021491bc7-6b1a037461cmr485086eaf.6.1787680376185;
        Tue, 25 Aug 2026 10:52:56 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a0139d2fsm181000eaf.6.2026.08.25.10.52.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 10:52:55 -0700 (PDT)
Message-ID: <29d8d38f-cf2c-4216-96fd-546254c48332@kernel.dk>
Date: Tue, 25 Aug 2026 11:52:54 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring: keep memlock accounting while regions are
 mapped
To: dejamarina@proton.me
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260816-io-uring-retained-mmap-accounting-v1-1-44e5eedd7ad3@proton.me>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260816-io-uring-retained-mmap-accounting-v1-1-44e5eedd7ad3@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/16/26 1:07 AM, Marina via B4 Relay wrote:
> From: Marina <dejamarina@proton.me>
> 
> io_uring unaccounts kernel-allocated SQ/CQ and SQE regions when resize
> replaces them, even if existing VMAs still retain their pages. Repeating
> mmap and resize can therefore retain memory beyond RLIMIT_MEMLOCK.
> 
> Move each charge to a refcounted record owned by the active region and its
> MMU or NOMMU mappings. Release it after both the region and final VMA are
> gone. Keep direct accounting for user-provided regions, which cannot be
> mapped through the io_uring file.
> 
> Accounting stays region-granular, so a partial mapping retains the complete
> region charge.

Patch doesn't apply to the current tree at all. Please send an updated
one, if needed.

-- 
Jens Axboe

