Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118731A681F
	for <io-uring@vger.kernel.org>; Mon,  2 Mar 2026 20:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772483928; cv=none; b=QlfvRbPBw0V3/A2aM/m2mu9/eQVhOrw1V4z81BWWMSVKf9oABf4w5i3EmyZScdwuyJzQpE2d0w9+3QEAGMzrzEcAcSVSQa/5cVIl3OJw+NnMdWvrdJurqC143q7sTz9giDgaACrR8scz6PhK2zIXCIcFZJezsb7jG2Puk2mMV2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772483928; c=relaxed/simple;
	bh=LXcLtM/kx7LU+eZlrjtF73nwVPSE1zWdexmOQkeMCho=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=n/OmR7sA3kpONNjY2v2ZvldVfS9WHKGFbsmS3EM0NEXkSFYpb5pVZnJpU+gocHF7gi83tksb46dYauLYArUTEWZq7Vq+2ooq4FUM2MUa0p9CANVf8yThFvZFwt6EusG6/Vx0DLCI5TQxo/tkAkaV3Si/4CLNL3J2F0HbgEb1uWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=NQq5OgWx; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="NQq5OgWx"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-679f23befd6so2355905eaf.1
        for <io-uring@vger.kernel.org>; Mon, 02 Mar 2026 12:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1772483926; x=1773088726; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4cKiqpuNfqgg10fw7W0nzEjdq3eU52N2TAy+H6AH4n8=;
        b=NQq5OgWxEM7hGOsbZzwJG0wmEinJUC40nP1NvDddqc+HpPuKP/x1oBBR88lvAFTLcQ
         aFZ0ycwKjJLkr582aFXTBAds/KugiOQ8EAT4XZtc+jmxdKetBK7IlHODpOZrC9ke+gKm
         deKRK/Eh/NihzOrm5lSz4JIkc+mNE7ogXsSV2bJ0JJopKP/j6ewtQZdTRwsfJGsK1YNs
         VcYN8zHekdfRphcYZyAo4SBkDQuIIm5QqhzKjlrsJLA+FhosHUrFr4gkiEFnxdxfP/y9
         Nqqm2atB/bbwuQesRaB2kdDsi4CV+mU6IyrgJiUnHjqXxZmpAxnZe0vh7GhekVLcOgf6
         BOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772483926; x=1773088726;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4cKiqpuNfqgg10fw7W0nzEjdq3eU52N2TAy+H6AH4n8=;
        b=AQOtW/7dkR81jLXAG6aJ04/qwD798+3ELxHqcNZ3gJt8yFk7d42DD9CtSaE8naZ04A
         17cD4MpqsSo91iJIHLmu3iK5B9IqN8rRdRPrpmA1IVM+EwhoZj5D48OaJ/n6ifvaww1a
         EGjqF2K1nzhoZibp4z37EvnA3XBMw8QWovThhVDIizTgEtMryIhxHYVsuIkQdYPdWt35
         E0BvMKurZIeudb4Bzuyg2DqILp9CHwkzUcHUxXPIygYPP5iCY3o4hn6txsSrqGhMUkef
         0JkCiMM1DRh9pl9YBqU9EzXelcVMMouyeaoCYmcrSJPO0UEo4CPqQ1JtpR9Yo0SOfcOQ
         l/dA==
X-Gm-Message-State: AOJu0YzoSHrsu+vH4HwPvCAgsLrHnnWexyK09yWFeWKnIGeek0LEVHAD
	w7vMlr656CProS2ZKEouKBtJc4vcCWDcKnmLAqbINUKqtC5JZzXJaoQ6larPDPQQfCY=
X-Gm-Gg: ATEYQzwjwMyJ9Xwsj+cPnmNNBpAXhYq3wyIeYxJO60VcwyIf6Db0axXVxkhlQw3QmHu
	TfrW9PLwCZlnSvailynDbCSFZSVm6umkWJPDvMW2sPcaOz7tT93ceXcA0GOVKqcB2kyt4GwHlwb
	UuujPjQakFroWBFZBd6gjakzaTWu3WA5hZq7C1SSX/0fzag5j+xNWyUW+WFgaMepnkEcvIN2T9t
	TUBK/lWBko81/iOXVUGW9h6Sd9fGC5zwS6Z5lOFcwqnrvYKmJqYI7g0Js2D9+NeYQ+AuQbRQfQl
	9wB//rIvHSTb87glEzTfVTHIbyr4h1TOC3Y2yrhxTBMNWzqlMeEQheC2v/5lygph3CxNYjdCSLT
	wc/pxMBQ787efXo4W3hM+rbCZiPVTZlqAa6pOkmeFm6movGYE7dX+bgby5deYZoijA7ki6shrKt
	1DgOcpRrUnQim2G3UZNB4RrTyYOsdSMrOyVGkbJCsq3sDsV01eeVnHmo6dtpefsHNILvCITw5gR
	xlnUOJRGQ==
X-Received: by 2002:a05:6820:1794:b0:679:a650:cc0b with SMTP id 006d021491bc7-679faf3393amr7841867eaf.51.1772483925842;
        Mon, 02 Mar 2026 12:38:45 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679f2be9b8bsm9798153eaf.5.2026.03.02.12.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 12:38:44 -0800 (PST)
Message-ID: <8e84b6c3-e62d-4aef-90b7-a7a0e63d8a17@kernel.dk>
Date: Mon, 2 Mar 2026 13:38:37 -0700
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: FAILED: Patch "io_uring/filetable: clamp alloc_hint to the
 configured alloc range" failed to apply to 6.1-stable tree
From: Jens Axboe <axboe@kernel.dk>
To: Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org
Cc: io-uring@vger.kernel.org
References: <20260301014717.1711200-1-sashal@kernel.org>
 <eb41b6f9-08f4-4972-99d4-3340571830bc@kernel.dk>
Content-Language: en-US
In-Reply-To: <eb41b6f9-08f4-4972-99d4-3340571830bc@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/1/26 6:15 AM, Jens Axboe wrote:
> On 2/28/26 6:47 PM, Sasha Levin wrote:
>> The patch below does not apply to the 6.1-stable tree.
>> If someone wants it applied there, or to any other stable or longterm
>> tree, then please email the backport, including the original git commit
>> id to <stable@vger.kernel.org>.
> 
> And this one also picks cleanly into 6.1-stable. Not sure what is
> going on at your end?

Are these and the other "FAILED" false positives getting applied or
not? I didn't hear anything back on any of them.

-- 
Jens Axboe

