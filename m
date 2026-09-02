Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656E947D451
	for <io-uring@vger.kernel.org>; Wed,  2 Sep 2026 22:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788388056; cv=none; b=ljUR4oUf0hpArWUaar7uGTpNVQSKiOyeQmP6MTLHs3nO4Pcp6YO2R6mTFewGd/4btSyuic7a7O3hss9NVVHX2/tkhfFCSyW0aOYOVCki1cBCbDqVfyE4dbSj1ygLrLcsT5b2h2Qr6JmGpUdEXAIqiBIrU72QfcKp79MkyFfvews=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788388056; c=relaxed/simple;
	bh=hgQYBnxVVzecB0cfrEUApUQPNAwIKycJL7Q2kf8vbQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jUbsIv+egUThT2kqZZLNQXYLVCeNEJVu/LHTMQxo9405uN0d+NSE/CQFhXU1vorZJr1uDZBxsuFr53VHqY8uJ17iV1g0L2es3uZYq7nMGuMAvVx5isN80ghJs5ySIjBscG+4jiCHtMeOd3/w9QhbSig/PM9Qd5UQyBdLIbk8xd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=i96x7lXc; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="i96x7lXc"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-398a5aad413so1523615a91.3
        for <io-uring@vger.kernel.org>; Wed, 02 Sep 2026 15:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1788388046; x=1788992846; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bfkrA0BRhs+9ankPM3GmlmxAVq8PzGSPSiCGF0eeRIc=;
        b=i96x7lXcwKhcQKhlp4r2PmYzmG3GRq13WPXTXwsyHz+uIM0ytmV2LRSNAmHT/pTNw2
         tZrv9GN54Ki4p3q6PgqLwlKORUe1rxRMbH0inLGIASoxMyzGtkMPD8FqdyO90d7J4vSa
         HqS3EsS+ORWAPLXe4Ri8wi6I1lGspfebY4nHuK6EyDIv8k7mb0/w+tpWM9gor54XYWWa
         Ef37VuoBPVYHgAiio/dtS8htq/xxs2gwyalO67QL1mm0bCFTYcxCQMdgtY4ZHMS7t1XT
         XX4SbLr9t8jpHdGsjCgclTCpX8aTBNEzWx5tA9kiZGVUdR3r20gBbHapwVQvo9guLIJN
         M5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788388046; x=1788992846;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bfkrA0BRhs+9ankPM3GmlmxAVq8PzGSPSiCGF0eeRIc=;
        b=VADdrovkGC9jA2GzzxBMfixCbkJCrf/RzLRnkp7bsBrrrke/SqfzujooRC6qRNBko6
         Q9FT4Chw/djNOH+jGWLPoEy0weCtqEBpl8GaYweUXc2iOWu+pfoL8D/x3+l+qY8tvjZD
         hJ8zxiXIhE6dN5iJ/ARR/I3WyRlxYFJ8wjrftl9AHy9sD9H9iU/Rvc6/csk2wkLVgFtl
         URjRJMgu8Esqd+09AgshWIlxheqsu65ccnnfHYiZryUk8VIQEnCq2Fc62zRWxOYS4EKR
         28i+SXvstpKnrYcvdOoOXotZnss3K53ciZJ2WDDb3F6y1Bge+aHODbBxVeVRTf4UQVii
         LrEA==
X-Gm-Message-State: AFuF++mM4eV75BTXFw8JxN6hWzYR3cbyBqi37lukyWb3TvR3NFSih2nT
	t5TYjWXgeRHRIbu4r5BRANacVrvmBZ+dSG6ua5ScWvlsiOlMhMEMeMBi0NBA8ZJd6QV0P/SfKwM
	ivLYo
X-Gm-Gg: AYBFou0o9tJkdr9+nicjg2g0u85Vkt14ba1L7MyHYjyzcbyBMqay9IQF8kD6A4k9m/s
	PCGoTiZayul73pZSk585MY6jZ2O7LzRam8u1JBA7vauk+qE7wgu2STrGZn5QEJSN6lguKpI8irP
	fR1mkpmUgk7T1P2r28xIulhGKHTRnyrdZiCcCQkJ/IlsKIqCRgU+4oZLM23AtzWIP4RZNbkdbt1
	WhABegziq6glkeUzAnWGpeioZ5J6EioA72S3+gYgDcs3LmmyUROmgrJHNFDUyCBoGdfn8qzgabY
	2bgFhTiyO0x6UueWlxE0JW7IxazBgnW+Gy49huXqHZIQIawypGmb6u6ozJIs0bHarFItvCJa3/R
	EECa6vT2HbGvKtEJnQJNqXKzb+Pd3Swn9gfo6hmnaKsXpNStzEa22ISHCqrtFiJqvuBVuMQUCyw
	lEm2tEKbMJtMSk5wgao06Zw+lADO934NBldL95N6b1m45O2QQ9YVkQ7oJX28b4MfXtjuO3YKrsj
	YHXMAvbXLPHBJ4rxCMWnvk49O/UFgGbu6IG1X2aI9AhCG9ZVO+7SX9B
X-Received: by 2002:a17:90b:2b8b:b0:398:e86b:ce14 with SMTP id 98e67ed59e1d1-39aee1237a7mr12666935a91.20.1788388046257;
        Wed, 02 Sep 2026 15:27:26 -0700 (PDT)
Received: from [172.16.1.190] ([63.82.143.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256416caasm942352eec.25.2026.09.02.15.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 15:27:25 -0700 (PDT)
Message-ID: <79a23f41-0263-435e-91c7-477d742c95f9@kernel.dk>
Date: Wed, 2 Sep 2026 16:27:25 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/futex: Recycle ifd on failure
To: Gabriel Krisman Bertazi <krisman@suse.de>
Cc: io-uring@vger.kernel.org
References: <20260902172717.1073059-1-krisman@suse.de>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260902172717.1073059-1-krisman@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/2/26 11:27 AM, Gabriel Krisman Bertazi wrote:
> The failure path doesn't recycle the ifd on FUTEX_WAIT for no good
> reason.  If we move the free above done_unlock, we are even already
> holding the submit lock.  Recycle it.

Does it matter? For performance, it should not, unless you have a
benchmark that deliberately ends up with futex_wait_setup() failing.
Any normal/fast path will have all of these succeed.

Is the motivation just to unify the cleanup, or..?

-- 
Jens Axboe

