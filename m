Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B262D7BF
	for <io-uring@vger.kernel.org>; Fri, 28 Aug 2026 02:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787882617; cv=none; b=qQvC9qPGdun44bfXGK/Rzo5b1RpQ1zO5j0BirsUGm13as/9GMtby0UCtgLLwR7hsDt+8L87JHC0vblHiMoFyT1h4XRX7Bev4i8GEcfUxvaVmxEC0VPbFH+dsxY033vNPSYeP88MTPXW1NDh+zJJqSeD29zou0iLoLDhqhnBJ6io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787882617; c=relaxed/simple;
	bh=o8STLy72E4h/h+IrUcxPbm4uQeT9WaWvgLAmymwuyNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O3AY44wcUdXClrCCRwk+5PA8HYbUEuBhgGDL5WJWbbxvBlPPjPsK8XfM2wjn/kahHSY7ZTI57VVXZ3G81ygu42beHK8mfhsE8I0T1IryZcQ6+yABy3v+so/K9yPDUvBkOGX5R9JiVmoN+BUtk0rFyH3kbfj2ALrlC0mq8oJu4vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=GACq9F5r; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="GACq9F5r"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4864ebb6268so559579b6e.3
        for <io-uring@vger.kernel.org>; Thu, 27 Aug 2026 19:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1787882614; x=1788487414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C5ykKG2FA8UXE/CNS1ckuIh5z7Gwn0o9g2gdMHvGoGo=;
        b=GACq9F5rTn2dpIWeJ5f0BD38lDZ9aqOZ68HYacTD4Z7FTyP8ohBi7G1Ce06gapADh6
         DJ0nimr4ojrh03mPj2Ez0hJ3YBpTfmHeX0mv+e6GmLtWNBpCQLgGd7vA7WmlVUsxx+Hj
         MQ9H6ircaXEBiElbGECGry1kf1Q+Vq8gp5Ss4paRvPhVVZtrXuuV0NiSKu0NKt0lacUB
         GV0tvQ2+Hu5Qoebsa55mQiFXvTkobKlZGw5DFBiDLGW5bjMFabb5TDMUIXTMUxXZB5dU
         RPBzI57HeUCZxzVOx+g2GeBEFbPS/iUwNc2t1q2B/+xp1NR09a4hvRys+OxfVBdocWwB
         RIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787882614; x=1788487414;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C5ykKG2FA8UXE/CNS1ckuIh5z7Gwn0o9g2gdMHvGoGo=;
        b=NIz4AAfJIR+NpQeNf7MIh6+nFBDcP9wEpqzNV5A7aJb2GryH/iIyTQkgaJUM88NWiW
         k3BUIEs8GvmyKHFb/wgivig2QviL42AktZ0PHZ/hCb0zqkEkW2o0cXRUbocNBi97ldDF
         n6uax78mz/PAup7FjDitHaTRM+7N1k0OjFvXW5MX/mlSHq1rRBtffv+aFPcu83/inPtL
         KssMICJ1Z4LNC/CVVhGBc5myklPQLaYKMvciKcp1cnXCw8LbwuCrzmWPbqDRFe3X6dYD
         vkXncIdBYMwYrmKnkpPNVJ5BpQ2TXHO5NOpxCAogaUVd+jOmnTcXT185i6mgwdyOY/dM
         1qKg==
X-Forwarded-Encrypted: i=1; AHgh+RpvLIttD5H/7ph/1dOvDsEYY1ZZrO5GTV9RIQ1aMkMvWWioLc5qVHEWqf1Vgb8XGD59pVJHxLPFJg==@vger.kernel.org
X-Gm-Message-State: AFuF++l93G7ACsQBPhFg8Krug/F7I8SUI9AEQDUo8miaed40REsv2KUZ
	TeIN5Zvb0gXXlUtAMLeQw7bLxRK3aK+lBypsXWaSSJJMDPy2bPERSi1HWAjquL1gNSI=
X-Gm-Gg: AR+sD13FlUTulhX6Xept946VqoU3Qp47vZr6ZZTKsVANbT7bYfGbEKpekE6M41hT7Yd
	ZKD61DVeN+OpDRuaZwrpILb40s/WVASyc9JuuarkHScH8rlCNdq7+0qM3R5+RJyYY2YKH29JuRV
	DznmJwG9Ko5hMKwAD08KEk/upefxaOC+7rfaAJs+yV1YVcVR5gIjwIYjPj8lDW5hhSszmhWmoC6
	2fWxtMxrdUCz5TlHFaLfOEQ10EDNuroUdnpi3dQLBhO7O2CFVgntD0OP8fYO3WZbcoad7hiiv3m
	UvWW9QO8BVRwbOFceOp4a30uCeLrmDrLahBpyb0NNJVBtJ3F4+RAPPM/l2JL4lvfLyLnySGmnhF
	FgdxZiZYbd9O03iQ/fc3FzjH2ddpV0mPIhYVUodi+UDYd3q+ZFV3TRaWkEF39/64uMEsHy9Glib
	be0FxLW1VcB+sX3PVTONhJ+6iuW2ipr242iUaB/tcTL3ELdw4K8S9O2NBJBE1QfEfSAf/bibXWL
	tdeoSd0Xmz5/VN2+RTLBeFffZhLiH/EVWQNI6bitoRYKaU=
X-Received: by 2002:a05:6820:188c:b0:6ac:abdb:7f99 with SMTP id 006d021491bc7-6b1c66c662emr1322604eaf.28.1787882556695;
        Thu, 27 Aug 2026 19:02:36 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1ce35c529sm204469eaf.13.2026.08.27.19.02.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 19:02:35 -0700 (PDT)
Message-ID: <ea042ae2-f3bf-4f3b-bfaa-9a7676a9b043@kernel.dk>
Date: Thu, 27 Aug 2026 20:02:34 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6.y] io_uring/io-wq: fix worker accounting when
 canceling creation callbacks
To: Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org
Cc: asml.silence@gmail.com, vrazdan@openai.com, krisman@suse.de,
 io-uring@vger.kernel.org, gregkh@linuxfoundation.org,
 Vishnu Razdan via B4 Relay <devnull+vrazdan.openai.com@kernel.org>
References: <20260825-stable-io-wq-6-6-y-v1-1-c9f890168485@openai.com>
 <20260827-stable-daily-0011-io-wq-6-6@kernel.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260827-stable-daily-0011-io-wq-6-6@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/27/26 7:46 PM, Sasha Levin wrote:
>> Decrement nr_workers only when the canceled callback is not
>> create_worker_cb(). Continuation callbacks still release their reserved
>> slot, and both callback types retain the existing running-count,
>> reference-count, and create-state cleanup.
>>
>> [ Backport: retain the existing wq->lock protecting worker accounting. ]
> 
> Queued for 6.6, thanks.
> 
> I also used this patch for 6.12.

Thanks for doing this - and I'm assuming the AUTOSEL stuff is both
adapting patches so they apply, and pulling in prerequisites? If
so, I love it, imho this is exactly what it should be doing. Helps
maintainers out a lot.

-- 
Jens Axboe

