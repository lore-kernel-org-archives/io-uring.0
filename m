Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430C23CA4B3
	for <io-uring@vger.kernel.org>; Wed, 15 Jul 2026 08:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784104033; cv=none; b=TRZe1AsO2dTxHYg+Fp9YdMh2MAxsDjxWoGRNMicuSOYN0GPF9s99K1FEfMSNMDhpX9Qj1c8lpfZJDR34eBD4o9jSCbALDGDLGx8KCOXx8VRaKoegyvwp4gJDzBMDGu7SnY73EaIPosrgnFRJk6PCpYIduPTKFeIajqlpYesbpN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784104033; c=relaxed/simple;
	bh=vgwSbkmHkM6CS2yHuD34EkZIBeihw0zhW+GbgGlexJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RkgwbdLs9XTn2cFQRGMnDnxYQ8gRFazJdUgiM8Ebtdiuvm+jvNnqChXgs11PLSiMsYxd19F2Gj74KKFoEE8dci5ZMeEp0ixq278gNi78VYFT5rZdaZJeigAOKUKx22SRwk4rQzMDkDyvhw1gQfL7Eh7AX9EbSsHgWrANtD4WX94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ePXnhlMz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ePXnhlMz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83AD51F000E9;
	Wed, 15 Jul 2026 08:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784104031;
	bh=8Z5lqC7Ze+PYPWaeQZ9ppo8UGQPyAn8LpuVaXKz2/qc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ePXnhlMzuqYqrceaCJgZpu9nsG8ajtoyhkoAtsDctU3rmFgrSsKy60415P3rpmppr
	 10Peg16w2NKKbkn5ukc1G3BLrp5s4xhdU9QKIq8ufaPJ2cp2bn8E0hiueTHrmdxn7E
	 RIJs2nfVYgfZRD2W6t4s3v8ibpnF8akNPZ2eZiLzBuPht4ENPAGoYjf3oLpcnUgA2L
	 1XkWQuPs4sj1Y7k3Ko4YxKnNtv9d8a0XINvZK0xboiD7rvPR4mI6rCRDlLHMjC1Ku0
	 ZtSqzg5J+WPbpXVLyYtOqLfzejKcCW4uNAlSu79NH/8bNyh0nudQsgR36JtBfsZAVy
	 BNcWzq6X2bX5w==
Message-ID: <f4da4ec6-706a-4ede-a9bc-1b01719ebe2e@kernel.org>
Date: Wed, 15 Jul 2026 17:27:08 +0900
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] configure: shorten the message for the discard
 command
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org
References: <20260715063947.2933606-1-hch@lst.de>
 <20260715063947.2933606-2-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20260715063947.2933606-2-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/15/26 15:39, Christoph Hellwig wrote:
> The current message is pretty long, drop the redundant io_uring.
> This aligns it with the soon to be added zone_reset_all message.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research
