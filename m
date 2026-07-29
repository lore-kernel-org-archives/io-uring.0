Received: from mail-qk2-f2.google.com (mail-qk2-f2.google.com [74.125.230.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB351472541
	for <io-uring@vger.kernel.org>; Wed, 29 Jul 2026 10:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322474; cv=none; b=PRzhIN/yfk5OOm7seWqgNSkdrkG2b0aF0wzuVpUDEnhQmGmbWEdKZ1Yb+fDKpSxqpLZ3+ngQK1zX1azGIy7XThXHHHHYqHQ0bivjGQojAaJC0e8OkKTF5InqesYAy/tXgfJMdwK1F8JhWCcok66hUHdLkMs+DPbKSvLSM1bIWI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322474; c=relaxed/simple;
	bh=5dZNZBYM5Zqvq5VYC89w2dXp5JVZGlmW/vvBEC/V4gE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MSfo75+sa88WFf9exUG00JzDqPzrTjHbw2D8paLdFLINOCJ5Xk8qCRosO5mBgKKrV1J10lagbsQywzR3BLLjQSDGPD+YkhBsllEnVR5ZK+Z+eFakcDIlWZL/q4rOu/aXJXi0S9hoGOBXGxsv7hGzfNxD61CTte4NosfRxPu3OO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=vykiBsBC; arc=none smtp.client-ip=74.125.230.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="vykiBsBC"
Received: by mail-qk2-f2.google.com with SMTP id af79cd13be357-92e5eef2abaso10205785a.1
        for <io-uring@vger.kernel.org>; Wed, 29 Jul 2026 03:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1785322464; x=1785927264; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=we7VYo6UQ9yJKk9ndegAj5yb3VOXk2NTtu8lueNDwdU=;
        b=vykiBsBCA5DrxJj7IHBiKwEFbr5f7D6Uv7EgGk89UQjyxCGVnwAEDJKX5NvaD0/CC4
         ss5GHA2znC35EOVjSZchGijSTt6AO2Vkbtqu8OrJjcPhHvdSNea1ls5/xV2vit8yK/z6
         AlipbAtNIoWoZgtL3dp2TCRhrSI2vJZtFB2kgvuPThmctwgidWo6zJhwPqVuq8aWfPeB
         LyFqf4IJZvcmwGek32krwKjKvVzgUjCcgkt/AaiQMNxBZju/EGzT9Xg3c0B94NcaL7ud
         GEy3W1f3avT/eHnkh0bc47n+HXM3Q9E3pFm+bFSEVGqhyMX5VV+zZEWjtVvxr62ZGzYa
         3Fyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785322464; x=1785927264;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=we7VYo6UQ9yJKk9ndegAj5yb3VOXk2NTtu8lueNDwdU=;
        b=Ka2YNbTFQcY5Ed+W0imo8OpEwrrvB+fczjs2+X9xa8LES/KN5o90o0f0Fnk67vJCY5
         3Ci424evkRZBDPnOuEP0Cr3qNjaevO3+0TuhB+zheHYDYyzFn8kcDIXY6nDpp9XCKft1
         NFB85uORn0kOkcucclKRWXAwMB0Gzqs+rAm9DjPOCnNVcPdDe60hiLJ86DfheYgxEfSY
         y4GtDs9WUl+zGUSbo0JF5quGxxx0bv8jFaDc01hkfbUJKXuoKU4xp82xSuOB5yF1jTK3
         bburkFgVQCAmRuVVdoj9RODRr6iaM2RjoaDe0OPF312a4m4kh1wRFlXYWJscv5TmhVOJ
         BV+A==
X-Forwarded-Encrypted: i=1; AHgh+RpLpsqoOy++uyP2+7phE5/0I9tOR2ICOy+5dDRV1ZbYV8J1rsua79jeReIblaV3taraWenoiLx/PQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx62MW0aSmVe4CthXpHIycFK3zRk6TPef0QenwJdhrkig4mNJi5
	aEWNN3wmci8i7/wnIpn9qyJ2L52O0ckoSpgylrvmdlp1s9IHiBR6/Fcd1K8/0fEMftU=
X-Gm-Gg: AR+sD119wosFLFA28AhiAabZcl6SfnCKiZ71/nQu+6DymoFM8jyH0BokyXSyFmVhZsK
	DEb1Gp640KkuC3hPjkjouJquJ67vcx+cTp1Rbpt57HlbRlv0ua95C0c8pDF+VJdmPmzDHcArHt6
	p3EIRVt07y2O9HL+Xu/VJBLPfE7P744ba3kZIhbGg9z+rBaMgp9uSW+lAqwR+aVMLVUpveDhKU/
	muDV050FpPp1wCHl/uM0Xjq5QN1j3+CH14AbSkOxilZ7K0+vE0c3ZLuiFxMFm5husYqc3KHKq17
	UDHz1b6lWAJ62N+hEUatJAn9nMGNrbOH94+8fLrgj0YWlvO6TTNjwH9uTfb98mNzlqGyI4sAVFd
	neuIEIi/x0AbY/DmMyDvTc8aAG7qXRmQAx5g7+uPYIIBz2CZw579ra2JzPCAlu31m8H+aOpQcMb
	gJHHDrDbOei4RIl7z+M29Pg5YPWUjzdVXJVLtgnfsOqtTFtE5HEj5nAa+jtGtgh8DYX/GaDoVR8
	qkEZsRD6CrghunRDDzxyshLGeiICf9jIhl17jomsEvAFTA=
X-Received: by 2002:a05:620a:6016:b0:930:8e2e:f3dc with SMTP id af79cd13be357-9330267968cmr533651685a.68.1785322464252;
        Wed, 29 Jul 2026 03:54:24 -0700 (PDT)
Received: from [172.20.6.160] ([50.234.234.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933e7366979sm140029785a.45.2026.07.29.03.54.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 03:54:23 -0700 (PDT)
Message-ID: <427b15c8-c168-4e2a-ac38-b00dc00400d3@kernel.dk>
Date: Wed, 29 Jul 2026 04:54:22 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] io_uring/epoll: disallow adding an epoll file to an
 epoll context
To: Xi Ruoyao <xry111@xry111.site>, io-uring@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org, brauner@kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 =?UTF-8?Q?Juan_Jos=C3=A9?= <soyjuanarbol@gmail.com>
References: <20260514140817.623026-1-axboe@kernel.dk>
 <20260514140817.623026-7-axboe@kernel.dk>
 <605939add4dfb674bd7ab39ef8dbd3fd22e754e4.camel@xry111.site>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <605939add4dfb674bd7ab39ef8dbd3fd22e754e4.camel@xry111.site>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/28/26 7:29 PM, Xi Ruoyao wrote:
> On Thu, 2026-05-14 at 08:07 -0600, Jens Axboe wrote:
>> One of the nastier things about epoll is how it allows adding epoll
>> files to epoll contexts. This leads to all sorts of loop detection
>> code, and has been a source of issues in the past.
>>
>> Arguably adding IORING_EPOLL_CTL is a historical mistake on the
>> io_uring side, but we're kind of stuck with it now as it does seem
>> to be in use according to code searches. But we can at least minimize
>> the damage a bit and just disallow this part of epoll, where nesting
>> issues can arise.
> 
> libuv uses this ... thing and there's even a test case against
> exercising the code path adding an epoll file:
> 
> - https://github.com/libuv/libuv/commit/3b6a1a14caee
> - https://github.com/libuv/libuv/blob/09591002d38e/test/test-poll.c#L690
> 
> And the test triggers an abort on the EINVAL at
> https://github.com/libuv/libuv/blob/09591002d38e/src/unix/linux.c#L1360

Thanks, I'll take a look.

> I'm unsure what to do here.

I think it's pretty simple - if libuv is using nesting already, then
we will have to revert this single commit before 7.2 release.

-- 
Jens Axboe

