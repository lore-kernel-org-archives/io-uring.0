Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C2E42B324
	for <io-uring@vger.kernel.org>; Wed, 22 Jul 2026 20:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784751110; cv=none; b=Vnz92XA2BpeD5Np7ZcrXtb5EVMzYDeetHEaPdxpPv5HEF96clTJjAEKo7PhLLL97nj7bWKHvg8CU6wYMV38UXBO+ocMYRcsrJEWx3leDEbB2TRFMlDdZ4XLZ2xJPq+w+1SpsVqqzftVqzSFuO1O31c1QQW5jlPtzXrFLww16DCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784751110; c=relaxed/simple;
	bh=to1qsBweEh9TsWu0DT+PyBTBcOAdZYUU23MhU95EDlM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CFDp8WSpMJZat39rT/5MXF0Uq3Z5Lx5QWDZX2eDQnyBjy6zMwFbvT46IM2kwraYtwizg4/kOLpaX9ABNhNIk3uzCW27tLn2GOkKsAt/Fto5KyCyTFg6DTtt9KISba6tAeNyD7L/70DvR0rGbgHVfN6EHcMtX5prVHbDEFh+nHKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AIXdQvQp; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AIXdQvQp"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f703a9e5dso1739604f8f.0
        for <io-uring@vger.kernel.org>; Wed, 22 Jul 2026 13:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784751107; x=1785355907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MwdcQPS90h/Tl/R38NZKhd3nVQaFTUyvpFn8BQXWGrA=;
        b=AIXdQvQp/wH08ZAHcdpXtxtCnIlDDAwMOs0aqd5MGd2il5ON1sl1kgcB2U6L40k/rh
         B7c9kwwcxNRl4TtA6zzPdIoUWdPpPwtU3GNfQ+JJwZGwXaPRuFy+RmlnepbIK9CC55u6
         ebvREHedkcXTEmbU05RF18YLoWWloLjfeOwdPAWIJfSSqbeiZaJLdj6klv1NRdpz4khm
         704H4Q7JsCoVVQnu+bQ2F1c85Ig/hd60xA+gsSdOnIMWBfCZojjTr09S69EPbR95nMi0
         lW4gFXXQT/SrHMWaBMcB66r5srlfjx16rs8Lnu/PWRWxSogEgnONXRLBsd/QdH6ZB1F7
         gZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784751107; x=1785355907;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MwdcQPS90h/Tl/R38NZKhd3nVQaFTUyvpFn8BQXWGrA=;
        b=CR4g9+y6yno6SfuA/Cy9pfN9hleheV1mCeems1nsNIWZrvsIfeceuwOuNb1NkGbmg9
         bfTdldSTlzGPz+MRYpMhXT5hgb9380P9AXE3j5XEOl/NAfJDawdxk3mY4Ks/eiF6qZlT
         //ti8m0sk4BgYK99ec1sDWOTGsdYo9CZJ2HP0GiV3encSBxxuzhJPA9K6pGnn8gsNsja
         SdUzYDC78dEnAWJTEOXvOr5QyJWCgrnn5osEk/uXwSbS2soum9xGeyhR3Uka9s02cBX4
         lSQH/aJVorG7CpbZx/1WuBMQnPlHzCGkjctJK+461oD/RQxKOTezC7cLiMwWq9mS6rwc
         odHQ==
X-Gm-Message-State: AOJu0YzVQIn1mal0/VNakKxXkL/E/Yh/DHNNRM3pTnFHXp+CbZoOKKP7
	zebEiJG39mliWrNK+XRbfhXdEpQ+a5OlWXFsTbJFmLdy50gtSMinoGoo
X-Gm-Gg: AR+sD12YAMKSz7JjakhAJqy/qeHFessdoDSYIxdjEYKhHqnhXdkOTP7SldfL5FIvy0c
	JjwneVLqzKy0u0GBS0MWmqZiOmFjuewZe+HZyZGWjUHiby0Ij61x29Iwul49Xhs+/i506rBKgYr
	hhHxhvQU6nenx0ik/5Gf/ojonItENmfxeWlMSy0BNiEei3OfVWT3b7PEt7o8qXQOqZhs+Xxvzwz
	6BFZnilfaDezk/X3gEZLWb1IZ0JhjXTsKIEHGcnv/GUFBNafzaFrYZ7pWpPWzlrN2LYRO6P/sTT
	VlwxztXbavBkSPhGCcS1XoW5DEJcYW1E7vxLb6oi/+EPIA9QsFCUWpOh89uHUWFYVCVpMzBjupW
	O0bqZZa+OkmXUcJlOuOIPxeYIh7iv71G0Ux4G+opBpPEW278nqk76OfJ/xKZeVrOt1E80kzaSW9
	IYiFsjibd4i1c1tzzQmhW8Ulj20HerzLZB83OVz7Z8PbTwI2hwBvsN7MnBSZyaYcc9cihWBV9UR
	NlzOdgxtF9PXCeCjWZ7rTXuOB+WMdM3amIk8rOxwQP+zAAF0t2/QZN3
X-Received: by 2002:a05:6000:25c3:b0:475:f0f0:9ef6 with SMTP id ffacd0b85a97d-47f8d76f050mr368399f8f.59.1784751106271;
        Wed, 22 Jul 2026 13:11:46 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f8635c8d7sm7429248f8f.21.2026.07.22.13.11.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 13:11:45 -0700 (PDT)
Message-ID: <c3cf5d0e-103b-484f-956d-5f00c1e48be0@gmail.com>
Date: Wed, 22 Jul 2026 21:11:47 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH io_uring-7.2 3/3] io_uring/zcrx: rename notif to event
To: Mina Almasry <almasrymina@google.com>
Cc: io-uring@vger.kernel.org, netdev@vger.kernel.org,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@meta.com>
References: <cover.1784726895.git.asml.silence@gmail.com>
 <f95ca6717da3c8d3649a1a7f0d883a563f545052.1784726895.git.asml.silence@gmail.com>
 <CAHS8izOhJN0YzQ8ybYm57Hd-Mu8PMc2a-NZ-K-N504LzEeTpfQ@mail.gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <CAHS8izOhJN0YzQ8ybYm57Hd-Mu8PMc2a-NZ-K-N504LzEeTpfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/22/26 20:37, Mina Almasry wrote:
> On Wed, Jul 22, 2026 at 6:51 AM Pavel Begunkov <asml.silence@gmail.com> wrote:
>>
>> "Notification" is too long and the abbreviated version is used in
>> several places, which is inconsistent and more ambiguous for users.
>> Rename it to event, which is easier to keep consistent. To keep the
>> change small, only change uapi/ + do necessary fix ups, and the rest of
>> internals can be adjusted in the next release.
>>
>> Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
> 
> Probably a basic question, but isn't the stuff under uapi/ supposed to
> be a stable user api? Why is it not a concern that you're breaking
> current users with this change?

That's so only once it's released. It was done for 7.2, so it's
fine as long as it hits some 7.2-rc*.

-- 
Pavel Begunkov

