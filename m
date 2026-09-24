Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF6347ECFB
	for <io-uring@vger.kernel.org>; Thu, 24 Sep 2026 12:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790254637; cv=none; b=d1CqtocDt/dwr9hbuQwIMLn81bfR8CrSixlTYVtyMMPuJDYRoKvyDhAcmgpJ9Wv/mGrg0Z6AC39CSNvh8SW5tZz9OxpRlJPqI8VMEkFMLiySA9OQFoUlJwaL94rfN/1tbd+XSgGFBZ07/EAqjP8lE4grcYvaIIlJD/KgR2C2nXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790254637; c=relaxed/simple;
	bh=qO0kj9PE3B3BHU7L9oKJMgaMPTafszLp+ZSfz5gzDLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q5WMdSBXS6jne3Uz1SNGufGxNj6YUI0azbCEdHVIgOP5AcuoSndiHWqcNwS1LMrgz8ud8TK/iTg8LbvOl3f6NwHPEFinVe1gCvFkdb2s4DneAmCNjkjotFOUrTXk+gw6hueXV2B5IKQVVuBXKJuz4IQmUYJVGAlmbEvE2yDGmCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=LW7QsO6h; arc=none smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="LW7QsO6h"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd046b87so1631333c88.2
        for <io-uring@vger.kernel.org>; Thu, 24 Sep 2026 05:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790254633; x=1790859433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pevCrRcNO3jk1yVeVzTiK99o69tfb2DiDsJdfsvZ4aU=;
        b=LW7QsO6hNJO5D72KAhOv1RfeZJ+a66q4U23s4dQ3+/aepIHGhuXeAcBpHsHzsK9nPe
         HUZb5e8AckQ7n/dBel5MsXyT6XxyEPB+Vn/VJXG9Nq7K3h3oCkkdyCxU54uZEOowhTSl
         SifJxz6dkZHbrWR2Mo0JC3aDrCSFgy6uOH2B/5zKvRygjP1rpQ/Wh8g1BGKsZ6HTzaYb
         yjfRlqRD5Gvm4OuDc2YfaFznXbE41KQVrwavUWv4CkFk4VWQ5/7bUy6c9OA/lvMAeUga
         c8HHo5Jm7TFkQdyovVDkHCtoN8OwHLaSCPjqAYdHgJjU/nqDyV90FUwLPcKM67ReZfQz
         JH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790254633; x=1790859433;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pevCrRcNO3jk1yVeVzTiK99o69tfb2DiDsJdfsvZ4aU=;
        b=Wg4GNBQQ/MtZ6KwajSkHhkOlvMn5nZZDqCSbfb+MeXuKsN8IY4tiPRyR7AZK4hH6YU
         UMk679nrqmnDY074AJIAqaJ/lswkELGKa7KHQlgDagZwAAxFThFE4jbO6zpXe4lBQhUW
         /aFwEQiaehhNH1+rg2DwtxMJaAkEeH41pXshehi+e9MUo5xx5dec9/y3DxmzixxVtTXt
         x2fnD2VSmfbIO6gQGhbmgHgXwAG4w4EFDRjSta76Uyk81D4SSkhJBoAg9n71pNxXWbPM
         V8dyDn9NR3lOsDNBdCyxsJ0172UuEZORc2y/Jp8V1ZDNndnoNnk42cW2io3DM938Ub/c
         jAAg==
X-Gm-Message-State: AFuF++nPx3Ylk6BJ7AZnPuHt93eBdBi88uJyaEQInB+Yy45dbwBlLRHS
	I9/VqyEkFB+YTlKvx5F1OIZpNTKMLhrpcdSWIk2whQL5Ewvesmt+DnvQ5imCmpeYrz0=
X-Gm-Gg: AYBFou2RmE3oLjqlOKQqFetSHee3ENcFyQejODtYVF+rHISaXVbS5graxM9npFbLH2r
	rBZtaPblr6a6oQV8P8iTS8Us0c7RoBJwIHq40SWUBk8O/8Tq27+X4MWqCRiccqfEW1HMljQ9Exy
	JDaSWrWFTK5zHL3YRHx3G2Xm6/aLLzORbi2/pxPlx7A5wS7ASYnUQpIj5rcRESurC9m/ywCxRVF
	27bendlC1m050e+14TsI4cMg0N6woGCPCx/jyjC0oQ/BUndWXZL5jfNtBm4F1/VatiJ2uuJu85W
	J5MP7Pjjvlc0n+sKkPc5WpqFXeztcUGWpi4HHBNW9U4A1X3P5GuQyQKAl447aY10EiGzpduFMll
	nLDzUUSF1+DfcJMpT1fZnWU9dzWWtsgg0HxbCxoVQOAuLXfsc99ZGmziD9uMqxkYTh2U/NXXCdX
	1EZqpWtfDrKIWRSIEAfwJivbRKYdq1CCOMp68fQHhv1IUHYEI+d29cY1eQoTwbtndrYqWVnC4iI
	cCoguH8gNDdxBOeS4A+6iwDpbgkyeE/mUxoPQt/BGmzKvUhRZU0fGT/84v62CEb8WS3
X-Received: by 2002:a05:701b:2083:20b0:137:f532:e360 with SMTP id a92af1059eb24-14504030c73mr2106323c88.3.1790254633130;
        Thu, 24 Sep 2026 05:57:13 -0700 (PDT)
Received: from [192.168.1.125] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98ca0edsm12812367c88.15.2026.09.24.05.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 05:57:12 -0700 (PDT)
Message-ID: <73b530eb-ae36-4c20-b9d1-b657410ead97@kernel.dk>
Date: Thu, 24 Sep 2026 06:57:11 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] io_uring: fix CQE32 and CQE_MIXED ring refill
 handling
To: Hui Peng <benquike@gmail.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260919203516.2581409-1-benquike@gmail.com>
 <20260924063525.2500081-1-benquike@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260924063525.2500081-1-benquike@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/24/26 12:35 AM, Hui Peng wrote:
> This series fixes two issues in io_cqe_cache_refill() and
> io_fill_nop_cqe() for 32-byte CQEs:
> 
> 1. Restrict skip CQE insertion at off + 1 == ctx->cq_entries to
>    IORING_SETUP_CQE_MIXED rings so pure IORING_SETUP_CQE32 rings do not
>    emit bogus IORING_CQE_F_SKIP entries.
> 2. Require 3 free CQ slots in io_fill_nop_cqe() before emitting a skip
>    CQE for a 32-byte CQE wrapping across the end of an
>    IORING_SETUP_CQE_MIXED ring, preventing an orphan skip CQE when fewer
>    than 3 slots are free.
> 
> Changes in v2:
> - Split into a 2-patch series and drop the third hunk from v1, as
>   requested by Jens Axboe.

Sorry maybe my reply got lost, but I did do this work for you and
split it into a 7.3 and 7.4 set. See my branches here:

https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git/log/?h=for-7.4/io_uring

https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git/log/?h=io_uring-7.3

Please take a look.

-- 
Jens Axboe

