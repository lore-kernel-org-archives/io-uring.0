Received: from mail-oa2-f1.google.com (mail-oa2-f1.google.com [74.125.231.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B53945517B
	for <io-uring@vger.kernel.org>; Wed, 29 Jul 2026 15:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785339583; cv=none; b=e5MF2hr7KH/Whbpl4uS0s1fGuTrmoHISFNFrOB87I8Y81qB9RwTISENHQZuKL/QenFL1uFF0LGiHBfDOiooL47oTm6PySp1a4svH0q9uJVT09bJbyb8DjM9P1T7WZEh4GtGdfp1k/Z3AQsWqYPCqkx2UxnYoo0miIG1tZuhTPGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785339583; c=relaxed/simple;
	bh=Buvb78MLeilA7v8GfjII4orSEtPBuLR9Q+/HBBsh6Zo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=spz8w985pgJy/Ok/KjROnPFWAAoj/hfLekyPfWpe07yDGgxobg914mDS752Yf/7Mk9uva2HmhrXiNOuRRLhP9xkxNYJipljqExp5VHGVc+xyXjJagKyoL9VgifDKUVcEYm3z8LbwLVA2TCQUQDs1Bh8j6cCaJ8cfXzA2CL99SPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=0TOScDI9; arc=none smtp.client-ip=74.125.231.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="0TOScDI9"
Received: by mail-oa2-f1.google.com with SMTP id 586e51a60fabf-4489b7aa0e7so114944fac.1
        for <io-uring@vger.kernel.org>; Wed, 29 Jul 2026 08:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1785339580; x=1785944380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GS17j0/tL0T7r5MZuQYpNYrMe7AhNMQwhW9AnPMzvM0=;
        b=0TOScDI9n3sxwahHdXx+iZV9K9K3yQ/ChB1aJfQ6S7h7NMEqANwnK0ajVHbyZCd0kB
         clTWxdAC0ISf65oDEtQEizwLVvqq/pLXGNUxriIgO0vkUGRwAJNv2B3156KUb1BizFhN
         xe6BLuyoi4ovMCu9VJCgtmaPxzo0/T+Lq78XWyGzX0tWloDA6tMLUkVmf1bGmmm/Vjen
         qmiDITe91ce3jhG+LIXa6EWmuN1ol9/aRalBcZMLms+SxaWdl+jFV6msSZiPzNnXZOcE
         eHjfpig6agGA8hjz1sMKuuEPqzYcRI7TY7cS0sFWNOoTuebyAMViTZ1tT4+JyCFiiDfN
         oy9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785339580; x=1785944380;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GS17j0/tL0T7r5MZuQYpNYrMe7AhNMQwhW9AnPMzvM0=;
        b=qpeGlhQRD4kmY/Y1t0tHUfgOjMKM0bw6WpZw+iTDeJxOdQVRL/PcLgKO4ek6iZku7b
         kTmSRJbqnZeYjl8uMLl6LBKP+quhZoYOb2w7vhYT/04RvSmfaF0NcvqzApIUF4aGP13k
         cFNQ9GlWMhEdS5XE+EBXDg/okc2wq/LnuA4ODOGlZ1b9fGnOsD035STxUqlj9zLMiSUc
         7ZTAGHRW20kRfhjUGN+sFBNiI0u8GoyzPAVpBm/ePu8GXiitzlt9sLa/pT1IAZxoauzW
         TiJWsrufqg52TmCTtP/5K8LWhNKlJ7E7hJveq55X6w9xYgU/IR5CU6GT7QydaSbxHSCk
         9+1g==
X-Forwarded-Encrypted: i=1; AHgh+RoV5vWue5DGzooAR6HDoeLufUHxKo+ldDwMFxq+0Kd1yKVDJazOB1UALCzYllFam8ETG3igukilFA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx0hCOwq/lI5bL5J1MVVe7G+kp1VmoN3pntoePBI5nHxrhgme0
	nHfDXzZgMaIfDE04Ngg+WN/FJ+R2zNxdehBqyuNNagWEhXnF+C2VFm4pmuozZYWDU3o=
X-Gm-Gg: AR+sD10EPC9lAgdrmO8Zf7l6I3GwZ50STVFheEQ0ve2lTXeLNiIpCSSnP8BW1ADogTP
	9F6O9wPbcDZUreXkePCgaXAt8UcIWHjO011pgB1+44iupzpyrODxA2uVznGycOt64zaAEWdjDfW
	NFAirVxbB/2gzBGh9M+QU6dOAoBGmVMB7RdqIfPM6Ar+BIITVhXlgR5e8FMcTK6H1VUlryETWpF
	4tfCdptsidDH8tOUXlrBlTeMTh31ybFBesqnuF6T0BKtU4vdtb89CPPLpNlZIZqG7qJpoddOCNW
	uwGOp5IxZA4Uk4Y6ussA8EZ5vEpnrDK4nUyafjg3DywGHdcShsar2HTx4bWQBYYssUqQXW4xSED
	hw3PqbMR/kVUS9Ck+cY/tHXCVQb826x7OBBg0mD8+P+py1mKxYyU0jb9AcK7YwG57q8keHxdtmy
	43xMjAYmtbLutpPJrGIx7ScI1QJFaGklwviEMUE796QB205lxxopJH3Ie4zqZdKdEqLVqUYmp7d
	FyiDsrGm649lz2352QUstwXRw==
X-Received: by 2002:a05:6808:e89:b0:495:4a22:f29e with SMTP id 5614622812f47-4ad5bb1c0b2mr4036097b6e.25.1785339579691;
        Wed, 29 Jul 2026 08:39:39 -0700 (PDT)
Received: from [172.19.0.220] ([99.196.129.79])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ad6ed2caa7sm2046581b6e.6.2026.07.29.08.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 08:39:37 -0700 (PDT)
Message-ID: <e82bbbe3-a1b1-45bc-b865-e3ff6ac95015@kernel.dk>
Date: Wed, 29 Jul 2026 09:39:25 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/net: don't truncate the bundle segment length to
 int
To: Baul Lee <baul.lee@xbow.com>, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20260729151504.47280-1-baul.lee@xbow.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260729151504.47280-1-baul.lee@xbow.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/29/26 9:15 AM, Baul Lee wrote:
> io_bundle_nbufs() works out how many buffers a short bundle transfer
> consumed by walking the mapped iovec and subtracting each segment from the
> transferred length:

Should already be fixed by:

https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git/commit/?h=io_uring-7.2&id=bc6d516abfe7085bf706aff22127859f06174f75

-- 
Jens Axboe
