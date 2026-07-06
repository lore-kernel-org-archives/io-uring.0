Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46780371CEC
	for <io-uring@vger.kernel.org>; Mon,  6 Jul 2026 17:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783358040; cv=none; b=PTdpF55OfdhIfaeljD1ohNOKwcMnM6ft4f/zmbBeyH7+XTayfEKLv7XrmYSNnJxjHP+FEojF9HK0heiLs6OSVogqbf+3yYBLPrKgX2988w+izYFgX2o3BqLoZYp46yLrvlaKEbiQjxnXcQ0RGFZSfF41QsRDFTsMgFN2Oivh4Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783358040; c=relaxed/simple;
	bh=ZVocmk6RNP+ChHXqb3a5J4cdJDdP0bhVtroUOWHnQbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qz2K69daOdJJyru0BnrhhfRwbTIhp9lL156/JO3p13VUGSdYZPDOB9kSqUADMkKPP38RTD8d3xqijT5QijG6ddicabOZxRSEFRu5PNn5qCLi5t1vEzJSVpVigOb0gsZCDXGUxm0Dk4M1qeW99usSgtKKnrjLMH81ZwihmHCH660=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=F6EdURHV; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="F6EdURHV"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7e9f6e7846bso1410122a34.2
        for <io-uring@vger.kernel.org>; Mon, 06 Jul 2026 10:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1783358037; x=1783962837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y55l68CmPDl0DC8SKmlAonWddLkIdnce9nh8w2hSo8g=;
        b=F6EdURHV6QSJiz0+xj6siHP2vrv1nrVJGtyK7q+nK1lrrlgtUEviVhlbH4lYpW2m1j
         6A0XowMU+oQHkHI2sVy5arLdkq60SeItffhBfCH4OfbYGaxyVwCxLELe6w22qrHN+PcH
         rHGZX0ZGWCFJ+Rfo+mFOOBb106fxbs3rRk4OHwvEii5khkdwtTly2Lo/DkQnKk6yncx2
         DNCd9Tej3AlaSoxx28og81SzboBeGRnXccaGYVO/QrZfxmZpk6m7FsMl8HtWTYKMLf9T
         XM1UlnmgwYwc5YXmP9am/b3zg9ItfOmmLK6HWkfiEFiqqzWEzKJvDDiBoo7rg3G6R8EX
         b5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358037; x=1783962837;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y55l68CmPDl0DC8SKmlAonWddLkIdnce9nh8w2hSo8g=;
        b=aSyKjrM3o0Pn/SPgdKOApDWVV8Ht7wYgFjkCsFi+NeI5YlwSb9fT4O/zqNjBK4fifK
         KyVspvWaoXmmT1uj4Ju32XuS8x2wwe1pdPqb9XCchUJfbX1jR3Ois//QNqo7ORf9pdoW
         Zq34Rk5wxi/uGHz5PfAEI7mN7iIlLkI8uJ9AM19W60eZnTAysbT72uvekKLKzt28eQPq
         YAOYHd7MW4+DXrk0gSR9cUSHBGiXWrVHWcMRFUBE7K7YqxVCOT/7BDxwb7IZbH99U545
         4jrO9AIjm/R78DG0vbmTCFyZfJ/3GqT5L9TzuyRdkw6J4wU8Ymhj3Evi53LhonZmQHeO
         ogKw==
X-Forwarded-Encrypted: i=1; AFNElJ+ed7rxDjj3o5q+SGePjltNtduOhyPOu8Oz1+ypC8HpRvz49Inn1lmskpFscsNVbmtDg429ZPQSwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpXHlsZ9Q20lBoPA4zlonYOU+qNhEMVlhPWmwO3y05DteC40T/
	hZqw6XCZ5/hmzyBehEFafgo1xjOvKAd9JDMTtBTMKDdHKAfHmvT4EBXF1i9zZnhSmibfFCsNctV
	SqfGVkXk=
X-Gm-Gg: AfdE7clvjIyGOA1j/8JcvUxI2ffxj5XCkRA5GenXmZxzQUgUjFCFTYAF65h0utnry3R
	BYVb2MstjxYz45a4ToBHcE42cwUGkxy3kkQ/SBcvq/0YpawhJPHrkyF1AI03YsiGs9OrKmlAQJQ
	ycvGQBkcAVd5NpMaP4VO2DkubbvEcnToCACCsBFBvV1/0WM11Nm7I48Em5CaQ0D5JVGg4Durh6j
	Fv1dZWf+VC8Oou2JVqjskytsqcAEHqf+PWR+lqY4Q7CdS+ii0bBsG1aFriHrrN79gLdRPOZGKsn
	Qb/6cArJHg4ZlBFIaxB3gy03Vu2WYvDiSShXNLRo/4Hcky8fRdw21s0Gk7lUCitW7TCZ3lgq+Xw
	7LtUAfJprnqzzReeIitPy10ZQ5/XHp69GnMw71wqVwQ0zPhomlGJN/W8lmXuY0Fj6oJilCW913k
	B8HsnqQgsa3GBAd4LfO2zoj+elqhkQ4XjkNgOcnLd4VP5L+M1UoCw7/Jdj8FBKB4fmdOt1nfE=
X-Received: by 2002:a05:6830:6d2f:b0:7e9:b4d0:53a0 with SMTP id 46e09a7af769-7ebb23622f2mr885567a34.25.1783358037118;
        Mon, 06 Jul 2026 10:13:57 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb544fcb1csm12057174a34.23.2026.07.06.10.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 10:13:56 -0700 (PDT)
Message-ID: <dbf0ae11-ce9a-4c98-bfcc-ff3f8f12b26f@kernel.dk>
Date: Mon, 6 Jul 2026 11:13:55 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] io_uring: fix dangling iovec after provided-buffer
 bundle grow failure
To: Hao-Yu Yang <naup96721@gmail.com>
Cc: linux-kernel@vger.kernel.org, io-uring@vger.kernel.org
References: <20260705234534.768138-1-naup96721@gmail.com>
 <0a370728-f8be-4aaa-bbc6-276376adc5ce@kernel.dk>
 <akvfYLvrpF5104us@naup-virtual-machine>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <akvfYLvrpF5104us@naup-virtual-machine>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/6/26 11:01 AM, Hao-Yu Yang wrote:
> Sorry, i forgot to cc others mail
> 
> I discovered and wrote the PoC myself. Trigger way is
>  send1: Submit an IORING_OP_SEND request with four valid
>  provided buffers. The system will allocate and cache an
>  iovec array (of size 4) for this request and store the
>  pointer in kmsg->vec.iovec.
> 
>  send2: Submit a second send request with 8, and I set
>  the fourth passed-in address to point to an invalid address.
>  Now kmsg still hold old iovec, but old iovec object have
>  been freed.
> 
>  So this will lead dangling pointer.

Side note: please don't top post, linux mailing lists always reply
under the text for better readability. Top posting turns any kind
of threaded conversation into both a mess, and it's also wasteful.

Great thanks! Want to turn this into a liburing test case? Then we can
include it there as well, and it'd catch both UAF and memory leaks when
run.

-- 
Jens Axboe
