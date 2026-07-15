Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0659A1FBEA8
	for <io-uring@vger.kernel.org>; Wed, 15 Jul 2026 08:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784104257; cv=none; b=bUAWtWteqeCFLdaCXei7tdr5HQ1pTQgqzetXBHcZ/POCO4yTygdB1NsTzWdbiDxoW6+oUCUhKF8ypUYaK5m8+eCmMk8e2MS/fJeQEIpIwcKuLXU7+GYRj8UBQG7tYcyfhTm2o5bFOIYkSClCLfY1GTnY5PkuHAn65MkTsK5cKEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784104257; c=relaxed/simple;
	bh=SToIoiNcaznwe/rM5IQd4U6SB319OfHnls8/UMe4DNc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=epEgf6x8VWCIZVCN3eeVbOS7EhXL738IiYIMyoBsVqFs9Pjm7seDfOsNgDOThgeAY9rkcGQZgX8KjVYxi5Ks607D6kDyRGTwVR8g6H6nKn6l9R0TeFsftGgpLV4xwZgCw39g2I/YjOMO6G0uG8NU73+Dwt4mCfqWRFjFEBmWLKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bTRBxewu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bTRBxewu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 450481F000E9;
	Wed, 15 Jul 2026 08:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784104256;
	bh=Lb2R+SVG0yTWuokacXZLTh68g8P5NspPNigDnew7ais=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=bTRBxewubOc1Mh4h/kSAryVWqI7fVCVnue3ZAz2rn3TI8wImQWtZYp0bi0Oo9RuXd
	 4xqIm5QP5T3VkZ7xYECKf6Dd4sgReQSIdte5GHGeiMmuvGRoWZJVjUiQ8AVS+R6gTG
	 DgwNfVp+excaPRtsUVl9HFTMqT4XK5mnEiNMKqERVkSgVYDZyA6mByMKlWTbVCDTJa
	 U+rOq5MQqGh+GYbNn0aNdzniVGN9UnagsTgtGoBQR7kmaIa7FQPrqSWeyis7Fk+lq1
	 2xvbjbWhD8FkjDPUWFVFFH0TD7XA0H1wi4zYQ9DI8r+BgkaxAyzkrHhKXN9O27O6hD
	 FRDNLYWANw+zg==
Message-ID: <5c9b08ff-0d88-4609-b4d6-31d9454381f9@kernel.org>
Date: Wed, 15 Jul 2026 17:30:50 +0900
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] liburiung: add io_uring_prep_cmd_zone_reset
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org
References: <20260715063947.2933606-1-hch@lst.de>
 <20260715063947.2933606-4-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20260715063947.2933606-4-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/15/26 15:39, Christoph Hellwig wrote:
> Add a helper for io_uring zone_reset_all commands.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research
