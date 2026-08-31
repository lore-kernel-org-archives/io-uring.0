Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83FE370AE1
	for <io-uring@vger.kernel.org>; Mon, 31 Aug 2026 18:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199792; cv=none; b=Sjvp24jI2EZjIvR7UL5Q75vZ6PZBmeCq7VSPQ6fuknAdsWIcCvt34m/nihDiGXxSvn5Mkw0iO7goRHe+0mTptbebjPi2/UbBU9AXXvE7mUzctyQeROtZRA2SKDT66PJ10BE13r+jCGjB5b+c6PzjrjxJvEPb3jquIDEU41o0yhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199792; c=relaxed/simple;
	bh=UJIjx7Nd6UnwIEMkfyx4MKf4iq09kir0HcuQtcBrn2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sWrD3QF+Fzs/ZCQS47iPRDcLDjthJOW1Vd1IKO+FnjNhCL9dmnm//oosnT4DlmzIfjxdyfableHl/HIeZR685oqfdLH42stzpccIQEeju2Q0AxKee6Sqov9kH/davr+EIBTEqDYMZgSgbVWez8g2PlsvX6IBg+iOmq8l8v86SCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20251104.gappssmtp.com header.i=@davidwei-uk.20251104.gappssmtp.com header.b=iVEvvpsU; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20251104.gappssmtp.com header.i=@davidwei-uk.20251104.gappssmtp.com header.b="iVEvvpsU"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc1cc97b84bso3394852a12.1
        for <io-uring@vger.kernel.org>; Mon, 31 Aug 2026 11:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20251104.gappssmtp.com; s=20251104; t=1788199789; x=1788804589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nC5kpux0BtJotabIv7/q6ESBCBij/ueWvvNCaE5KD0I=;
        b=iVEvvpsUvxnmcRK29ZjpZSEpPEm2vClhvxxeTzdnVeei7KCow9+0xf8/AZjeIDHqDr
         cLulgo2a4L0lBiTu7C0mdT7nnVVnnGI5Orp3ylhNsKQwwuHtfjEcfKaE1z91ACuS0V6P
         rJnCZwnmiVF4oMzr7w/hoAZ+OmaVWpvyfyRXI1bXINhuLhsySUWx4/s21KjMeqGYbgZ+
         I3OWQG+0HLe801ltuyrQAZr8dyJVrR/N2yU791z3NMzsFg69hfpIFFcs8NyQGxnDE0+Y
         V56ktEZuxcFtxkbqLFzJwWbBWE1bkrBxqpfagWnqQ6ueOKA/6flMppmw8aOBZr19DpGz
         tEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199789; x=1788804589;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nC5kpux0BtJotabIv7/q6ESBCBij/ueWvvNCaE5KD0I=;
        b=ec/tnFJYj6FKAOkMYa0YqqH9LXom6d2jAeQbv1TWLhvj7sD7oFO3eVEzoGmboDass2
         lilk4MIV7cnd13ynt2L74Lb6BNgIby2dEG7BCXflXdT55JzFYpMfBBUKLgh/DQMW2dPq
         YayBg37jUqMPDYO6PWDebvpU7YdBURf1ZSl+6UbX2xf6qztwdaSUdyn6T5FTObprZM3e
         g3fc9KFPCng3Zx/420dBk2qIGsEEdjuzUvco3C99rnj11SurMzC+I21FHF30bGvUnB9X
         SdW8CRGIHC8qr9lRkKFuE1n13TQpGFaBO7Pxznx5jF50aRDNMyiD7LbsHhj9lYaWt92K
         vITg==
X-Gm-Message-State: AFuF++l10/FOG5ld+o4S/Pj7KGeFWLdVvdVm1rtpR6LD17uCs9/r9DNr
	sZzLdeNEVsZqB0A8nZSpe5XgfgnCLTuY20eAn3yf6jADLOg9YZfKlcjatiDyOQhzM3E=
X-Gm-Gg: AYBFou39qXNPUkGXUjc/igw8aX4RNxxeMBKG+UGCB4pC3PWCmfdDUwcMG6ZSOaqpQzR
	bvdsPAClQ/V4GrA2IWiyq8xlArj94NwAWPfGfYKC/As+PrG6AeiMSeaAdf2YG2nolVUZqh3oCN1
	ODMEChmYxxcYgmAVCvjllmMfa8XiOQJAb0JO0SOe/GW6GihP5tfRvvB2WUdpqb7tVhx0h1pBIrz
	mtDmKAjhhGeIkbbrgUBg0M6H1d+1Ah03OegntWtbST5smmvNGXJ4aSSSH5ZONy8TBIBhQ0jpkOX
	sCZJpsJE+cXksgvQHwUExROjJcmKMT8yEwtHrbaq1UPgifE01ryMGiRAUMnzOyeT5YkyCyob2Z3
	mrbJI4f57vr7fOcp3m0IeMmfhbtbVuCfZmVD022dhyDdA6ng/7Iy9bx3ldbQLsMPSBYjtdDuyzp
	EGb0lk+nWsyqpZUUNAWYZl4jH6wZ92PIOffORlPCmkTtFAGv08A4JjE3i5WdpjIWR3A+8/L9SAa
	Ok7ooq6vDMYukEWmXlaShuMAqNPlS0KnNAYFMwkblxLy5TYz2hOvXafDX0bEg==
X-Received: by 2002:a17:90b:2f4b:b0:398:a486:81ec with SMTP id 98e67ed59e1d1-39907b77747mr3516597a91.11.1788199789044;
        Mon, 31 Aug 2026 11:09:49 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1156:1:c8f:b917:4342:fa09? ([2620:10d:c090:500::7:1753])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e2a95sm30252869eec.23.2026.08.31.11.09.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 11:09:48 -0700 (PDT)
Message-ID: <25f25b5c-fbdc-4bd5-ba97-85248ea8d421@davidwei.uk>
Date: Mon, 31 Aug 2026 11:09:47 -0700
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 1/6] selftests: net: fix
 get_refill_ring_size() to use its local variable
To: Juanlu Herrero <juanlu@fastmail.com>, netdev@vger.kernel.org
Cc: io-uring@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, kuba@kernel.org, asml.silence@gmail.com,
 pabeni@redhat.com, shuah@kernel.org
References: <20260831-iou-zcrx-v6-0-02d1d012f0fd@fastmail.com>
 <20260831-iou-zcrx-v6-1-02d1d012f0fd@fastmail.com>
Content-Language: en-US
From: David Wei <dw@davidwei.uk>
In-Reply-To: <20260831-iou-zcrx-v6-1-02d1d012f0fd@fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-08-31 10:34, Juanlu Herrero wrote:
> In preparation for multi-threaded rss selftests, fix
> get_refill_ring_size() to use its local `size` variable instead of
> assigning to the file-global `ring_size`.
> 
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Juanlu Herrero <juanlu@fastmail.com>
> ---
>   tools/testing/selftests/drivers/net/hw/iou-zcrx.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
> index f6a8fc5fac24..df6b62204343 100644
> --- a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
> +++ b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
> @@ -132,10 +132,10 @@ static inline size_t get_refill_ring_size(unsigned int rq_entries)
>   {
>   	size_t size;
>   
> -	ring_size = rq_entries * sizeof(struct io_uring_zcrx_rqe);
> +	size = rq_entries * sizeof(struct io_uring_zcrx_rqe);
>   	/* add space for the header (head/tail/etc.) */
> -	ring_size += page_size;
> -	return ALIGN_UP(ring_size, page_size);
> +	size += page_size;
> +	return ALIGN_UP(size, page_size);
>   }
>   
>   static void setup_zcrx(struct io_uring *ring)
> 

Reviewed-by: David Wei <dw@davidwei.uk>
