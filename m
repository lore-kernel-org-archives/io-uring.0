Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D613B8D75
	for <io-uring@vger.kernel.org>; Mon,  6 Jul 2026 17:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783359996; cv=none; b=IkaabUGsnAJoV9EZmMxMMBcQ5d/1yXJm08wVIHuPCWdkfRPhJx12qXqX4zz4I5DFbCC+Zh78VBXah6rFB3JY/iQ1xHe1a4LvxtROyDV/KdXylkdxisUA6X6rzMEcSP4WygFeMvX0mNgGYPrgtmynKl1ga3rb6DBRkWsCMpeqsVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783359996; c=relaxed/simple;
	bh=Dnp9YGDXKwdEom/HDVm38NXpfaVPjJSRKqwsi2+SVbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hi2Y50iEnt66Ht5tZor+2JSs2iQs2hdAIJN9TqcZYC85tAOmMu/R1uYJmjY/98qEvyiWlkZcxwyx2Vp2Wz4S9Vs1YSpnHnM4JVvJPtzRnJnpLMwljXY1zHouWlEa/DpT2/fSX6McgsmL9KJO55Jr8vWubV3FJabYTkCgsn8rcmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZAtzp+i; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZAtzp+i"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ca7aaa4b85so30669785ad.3
        for <io-uring@vger.kernel.org>; Mon, 06 Jul 2026 10:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783359995; x=1783964795; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g/jwzTq7dHlHr8Ep6V1gbFVGPihF9p9J5knAlWs/rbg=;
        b=BZAtzp+ihr620TBilUF0b++d4MVwj1UJuHbXdCtsBj7v0aq4qjSp83COwEiAW/aqJl
         TSurMuoS815vWfL1GegZYtxb2LkxQoYiN2FIo0mp29yPSDDGP4tazCzUvgaWR0eoPpT6
         5FlhvC2kaOfdQjWEXenN6zhKW8NuReFSe5Y7xJdOwRYkt6AnHS03YSnUMKz8uVyxR4tz
         pvDTnAQ7GessHttCHCqgj2tI9X3qCVo9kq+nbzEUYQpTVa7w17VHBDXFplmB94ujVERu
         SWtaa6tnqAMmPhpoGI31haGlI1cyahWRKdYMBmOYMYcImC8+Aqk5ONEjJCl24MjV9uq1
         dSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783359995; x=1783964795;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g/jwzTq7dHlHr8Ep6V1gbFVGPihF9p9J5knAlWs/rbg=;
        b=euXlGZdoXdyk7vXVR4PQeOdwJvAIVS04mjI9q+lckz9kjzgneCDQoipp2qjnljcYTl
         78N0HzuLEcmS8Jxjrzt5Nk7rnm+YJPN9FA2ksc6Z/cq/+0NBzpCV8OrWglRv3YcJaErr
         OrgLxomL36aPjwITP5A8MxKo51XIczb0hF43X1vK0AK0YQjzOpN+pEfaGLKTQDcx1crn
         iqloOhn8fotMvto9F9OMSMXMtz5LnXnarTl5o+tYeqmmcKMc48oD5bTbThdx/fQOHRgm
         jj8X3sViE22xrKHX9b8vhF37Dt0gwum7f9/U7o6MRmySWjrpTDMJe0bORynk3Yw2yViw
         Thmw==
X-Forwarded-Encrypted: i=1; AHgh+RoC+E+o0Z8HeGZSGLsV8uNIJrIn76LHpGYkKDm7iW0nnmuu7SnBWAyoTZD1zd5R0RlFI+g8F1zr9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMGmQH2HasXFuCH9zHBmPPrGQs3MyrDGnISRfSNl0Z724jBw38
	xefqdPM5seIr0QnxbWEEGWXsNeZk6RlfwmXDFNtELKu4/ITT7rsAjDac
X-Gm-Gg: AfdE7ckaa5ABKoH64TBmx+Hy3TPZV7txx5/hkK3RnPR6MAejpEjfTptBQfzSKngo+36
	jiu1x7y28fSYM6EpZ4JVNm0vGleFHv7oL8L97pdduZmmkmAOZd5uNr4HNUZVV+CFpEOxmRndaSi
	DJNr05Tao6lWz1tQwW2ODuk+x+wVQcQBV1B4nS9EG98oD71aGxQMZFbWtouQsfmXsZk//kkZv2B
	IgBj7N128L1asFX1j4gEhqjt7dVuZHx71UMX64sh94v5sJ2mXlh5gKEaJqZqlovlDhZYlnxuD6S
	+w3hdMqpRZJhSdjvIUQ4W8jkUreGTqLv7j0jnCMCBBiTD2tDnTcjGCzoBUdIZ0Yr8xVRfg7MYsq
	TAcJuZ9g2e3+Tyg32YsWtz5EM9I+A9Sl3R2axS/RcTZNJl1eniCqemG2I4pCZAjH0Hpc5mevShq
	2V4JvSCrcFUq2p/IIbeyqjsaDbtOkzxSccH4OPfAs=
X-Received: by 2002:a17:902:f712:b0:2c2:62ee:5a0d with SMTP id d9443c01a7336-2ccbe61090dmr17418365ad.14.1783359994567;
        Mon, 06 Jul 2026 10:46:34 -0700 (PDT)
Received: from naup-virtual-machine ([140.113.139.102])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7893f0fsm53738555ad.75.2026.07.06.10.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:46:34 -0700 (PDT)
Date: Tue, 7 Jul 2026 01:46:31 +0800
From: Hao-Yu Yang <naup96721@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-kernel@vger.kernel.org, io-uring@vger.kernel.org
Subject: Re: [PATCH v1] io_uring: fix dangling iovec after provided-buffer
 bundle grow failure
Message-ID: <akvp951vbwLP/x7T@naup-virtual-machine>
References: <20260705234534.768138-1-naup96721@gmail.com>
 <0a370728-f8be-4aaa-bbc6-276376adc5ce@kernel.dk>
 <akvfYLvrpF5104us@naup-virtual-machine>
 <dbf0ae11-ce9a-4c98-bfcc-ff3f8f12b26f@kernel.dk>
 <akvnOaiLOvcHyalG@naup-virtual-machine>
 <92f036c0-2759-417c-b912-8b6f003bc390@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92f036c0-2759-417c-b912-8b6f003bc390@kernel.dk>

On Mon, Jul 06, 2026 at 11:39:14AM -0600, Jens Axboe wrote:
> On 7/6/26 11:34 AM, Hao-Yu Yang wrote:
> > On Mon, Jul 06, 2026 at 11:13:55AM -0600, Jens Axboe wrote:
> >> On 7/6/26 11:01 AM, Hao-Yu Yang wrote:
> >>> Sorry, i forgot to cc others mail
> >>>
> >>> I discovered and wrote the PoC myself. Trigger way is
> >>>  send1: Submit an IORING_OP_SEND request with four valid
> >>>  provided buffers. The system will allocate and cache an
> >>>  iovec array (of size 4) for this request and store the
> >>>  pointer in kmsg->vec.iovec.
> >>>
> >>>  send2: Submit a second send request with 8, and I set
> >>>  the fourth passed-in address to point to an invalid address.
> >>>  Now kmsg still hold old iovec, but old iovec object have
> >>>  been freed.
> >>>
> >>>  So this will lead dangling pointer.
> >>
> >> Side note: please don't top post, linux mailing lists always reply
> >> under the text for better readability. Top posting turns any kind
> >> of threaded conversation into both a mess, and it's also wasteful.
> >>
> >> Great thanks! Want to turn this into a liburing test case? Then we can
> >> include it there as well, and it'd catch both UAF and memory leaks when
> >> run.
> >>
> >> -- 
> >> Jens Axboe
> > 
> > How to turn this into a liburing test case? Should this be included in
> > the v2 patch?
> 
> Look at the tests in test/ in liburing. Or just send the reproducer and
> I can get it turned into a test case.
> 
> Should be separate from a kernel patch, it's a patch for an entirely
> different repository.
> 
> 
> -- 
> Jens Axboe

OK, I will send v2 patch first when i wake up. And I now my PoC to trigger this KASAN have became a exploit can use to priviledge escalation.
I think i should send this script to your email? (not included any public gmail?)
