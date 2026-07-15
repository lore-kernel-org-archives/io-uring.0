Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42FF2E7365
	for <io-uring@vger.kernel.org>; Wed, 15 Jul 2026 08:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784104562; cv=none; b=Yxy653zxo1fSwXr4v/ezSVy+EptIAKEtogfqKe010vk5kx5X5/V7mBqJnCK9GSN0BZItGURgnZPc0LMM5TGJYjkCT9pcDkYU+GBKDnlHR6VyS3EGtRPZ8dB0Pk1uSbxDgYgMn/Ttlzxbag1sGWbjbiVzLl5GZAnT6wP3ZXuFATg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784104562; c=relaxed/simple;
	bh=X0bdRifszlb1SQOcJyoKRKcVsSZSgo+mLpRxApm/P0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IqILD9ahDMsBj7jsd2wkPWc9skrvl6RFtzO8ErK5gPlCooqupg95RuvTO3RML7VPhtJlD+8E+A3/F2qulfNhr7RJutQq11Ot8TjNmk8AsOfrW7sBEsUKqVRc2TyVib7g4E49PDbqdG3bf6zo1zuVWH3cxwHL5BreEB3Oi5Lt9Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ccvd/hKS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ccvd/hKS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C36A11F000E9;
	Wed, 15 Jul 2026 08:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784104561;
	bh=qieoT50Kw+1a5v8h+kvCJyp6ZYWVaJc9zHU4wIkUXyk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Ccvd/hKS/ZIdyn0/AEUo14Iw4zC+c2BThNWXpTf5/IgRjPgD07pvj+gcIwQ3Yz81Y
	 Q7lx/FxbNXtdGRKu919tW8koTobcgmzfTTe/hRcJc2G2h7QDZ+IAVTKUoRcTHA7Kbl
	 w4rcupjMcDR+qSQynS9Fi5RgSr5mIVyEqfxByep8TiKxsbwV18Koa8Vp8s5kGB4mfq
	 /UU5BEZHcaXkUCSXwnr5XyUfxN6zUAf9oAKrf1mQ7dH4lCDjtFN+aPYgylxjlBnS4R
	 OwQYclgyofxOAlzNUmwaCoHnhU1asCamDn0oRW0fY5XmC52Fg36L37B/h6NM1WrI+I
	 B+TjgENBoy76g==
Message-ID: <c365a2a0-a438-4660-9a98-ad011d8e1226@kernel.org>
Date: Wed, 15 Jul 2026 17:35:49 +0900
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] test: add zone_reset_all command test
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org
References: <20260715063947.2933606-1-hch@lst.de>
 <20260715063947.2933606-6-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20260715063947.2933606-6-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/15/26 15:39, Christoph Hellwig wrote:
> Basic sanity checking for the simply zone_reset_all command, mostly

s/simply/simple

> taken from the discard test.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>


-- 
Damien Le Moal
Western Digital Research
