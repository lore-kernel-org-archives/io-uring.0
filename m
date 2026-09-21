Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191D14BD34F
	for <io-uring@vger.kernel.org>; Mon, 21 Sep 2026 16:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790006966; cv=none; b=BY7mlF61SnVTmsimYuTzAjRAoBIqglMaSaz1VdtWNqdylqfDnqu7wPofTl6JSyEquyeQA5eN/Kj166bTxyWPQmBsivcdMJo/9pnkXLFitMxbHUnvO1SiMxpx4keU4Lamg7znLbP4bMAYPCJS87A2xR0E/3pODzWMa9gdJPV0edM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790006966; c=relaxed/simple;
	bh=3LMw4T4W608eHVe74i57LLlCeTrnVHo2JK/BD0br1xE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pujW1EeQXX09W46Uhd2JUbFETZBRSPmzVNytj30MJRqQGMSeLCkSI/4hveL3TP+AOzlTrOAGV2IEC08HrZgalT2rDV9I63qP/KJo6yHloJCpHBAMKoh1gcFrlvck5pbwbPI4+Wf5SKkIPwQaeu+8FOsgbmxWNQt9W+e93kalqR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=K0YMifBW; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="K0YMifBW"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4bb359e6878so1168827b6e.0
        for <io-uring@vger.kernel.org>; Mon, 21 Sep 2026 09:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790006962; x=1790611762; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rtkQcjEvwfbB2YWb57GKh9JqxleBPJHBXHu8WM179d0=;
        b=K0YMifBWaKbotJyEtC9no77bBo06p37eXqiaMnQRdmD+wqvUeY8SKUAtQhOwpksbeI
         WmUCB9iJ3RHR3HXDDx0nC5vxqd8Or0MiMZyQCyDCWubN/oyxEQ/xskfDOs3zM6eFWMoO
         KwhVIvoN0jSVivggG9bnQsEH1ynEUKL+uZxfZQ5Yy+oe2GPOPox8I4z09sSRDSzsMyuk
         LG+v1XzuT1BQzVp2JCztsd8xlQ9UJU/dbSRVDSJjnjg/Flprb31ERGR5Ob0HGOXFvSUV
         t5GxEYLMs4OT6DdPYCTgx+H7RCLMELdN93uYZd1fnxKQlHlo/F1nDvchQkvXfLQEQzaz
         ih1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790006962; x=1790611762;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rtkQcjEvwfbB2YWb57GKh9JqxleBPJHBXHu8WM179d0=;
        b=veHpZ/KpYbGZo3iOL2RAWiAO4PrJWqfOyAPTjsIW/LyU5t+W/aXV1H9i5+QVGSVo9t
         ByjWMl9Y/NhxgDhpDdtFqs/pK2tlksnFj9BncCD+DJ6/9VEkcgRIDJNC3krw7DmzMqWP
         1Kv4t9nVvwsqdcVDGmBkn2W3DjwgVSCDg3GXJ+h10MJhDrx2CFpgQ8J9aRPMi+V5YM8g
         ktaFHNc2KUZayB0NjLV4aYxNPcMUqb6bdXS70iiAjnuiwdYg1lS6HbEM6g/wqSR1hhgB
         rVmHbNKES/E43wb2r8eq6cFE8bx0ytlhJ49obblD/YBHhXQnpDRQGazB830KFTcXQ8c3
         HThA==
X-Gm-Message-State: AFuF++llPlTXSz+5UTUVBDjWYcnmZUDOCTDuhz/lhET9E1epRYSHFEqr
	5l6x5lpVX21otyTL1DqF6VYktvahBhxOd8sD3bKOD/z7sG5ow98WxrUxhnAkKr992m8=
X-Gm-Gg: AYBFou0E3sxqIP3n1ybUT9l8LCK8lw69eNxDMJDuE0b5Yn3PA/nlz1t8U4Jdi2P/tvn
	WAg0bhCxts7Af7VHc/QsQTSPp70wABV+015ZQwnY/FlDWKjQkFRPWOzHDFYcVBc7qGUt6ZTnsDi
	HHIlwVnKmsMDk8LynTPkQk7SMhyKcn6RTWK9JM3bPgDifKjO0NlBCQgjQ0XadlIFP//SdIG8MWx
	r88rpK8/P7zz+f16pm6E0ASqVS1okOr5cg2DTIgMmb2md+dUFb7VWi2+nrKrNvfEp5hAjVEMB+O
	cWtKCkmUzNnOj1kMVZ6Q6/hY5H9Ju2qxh9I9lNNsB/Dw9zUaqkPjDn4Ovy5+8n42ISsuXN7TAmk
	DdGYrKHZ67XqvIdVtr/YW1MgtfCVsdU0vrNm56OXEBgJt8zj2lLTib2PR+0CyuMEZhZ65sPpY2D
	NdTeN17uospBAwYWvvKVedxw34v9PzkyyIe97J35RiZNqEhS3CuzjN9cEHHnUGY46EJeiRVuwVo
	UKRaZTjxzAvf/TXdWKSuwcJ3Q==
X-Received: by 2002:a05:6808:c2b6:b0:4c4:6b5c:30c3 with SMTP id 5614622812f47-4ccf25b39ddmr10875999b6e.0.1790006962306;
        Mon, 21 Sep 2026 09:09:22 -0700 (PDT)
Received: from [172.19.0.10] ([99.196.129.128])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d423d091d0sm401953b6e.13.2026.09.21.09.09.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 09:09:20 -0700 (PDT)
Message-ID: <60200f9e-0b37-4f8d-a309-65fd817eaa53@kernel.dk>
Date: Mon, 21 Sep 2026 10:09:07 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] io_uring/bpf_filter: Set src->bpf_filters_cow in
 io_bpf_filter_clone()
To: Hui Peng <benquike@gmail.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260919112523.3872581-1-benquike@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260919112523.3872581-1-benquike@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/19/26 5:25 AM, Hui Peng wrote:
> When io_bpf_filter_clone() clones a struct io_bpf_filters table from a
> source restriction set to a destination restriction set, it increments
> src->bpf_filters->refs and sets dst->bpf_filters_cow = true, but forgets
> to set src->bpf_filters_cow = true.
> 
> As a result, subsequent IORING_REGISTER_BPF_FILTER registrations on an
> io_uring instance or task holding the source restriction set bypass
> copy-on-write and mutate the shared io_bpf_filters table in place,
> corrupting the BPF filter rules of already-cloned rings.
> 
> Fix this by setting src->bpf_filters_cow = true alongside
> dst->bpf_filters_cow = true in io_bpf_filter_clone().

This one looks fine. But:

> Found by code inspection; build tested only, no reproducer.

run the test suite. As far as I can tell from your patches, "code inspection"
simply means an LLM looked at it for you. Do you even look at the code? It's
clear it hasn't been run.

In the future, don't send patches without having tested them. And tell your
LLM to refrain from both the overly verbose and alarmist writing.

-- 
Jens Axboe

