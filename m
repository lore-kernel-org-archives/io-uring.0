Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A199305047
	for <io-uring@vger.kernel.org>; Wed, 15 Jul 2026 08:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784104412; cv=none; b=di1orwsxTcT3jovVPvUMvWvW7cV0ojn/dQhD6l0AjM2qJuhp23yugmi7nqiv7X8+E3zSKEfHRlRORig5iRFHi50NVyIzfH0A3UR56iJxC3fbqTCPcr7+jOBoKVWvVV+21bqZFaqs3u5ZQhyHDdkOo6uBuZCcQkDjaPIH714WEug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784104412; c=relaxed/simple;
	bh=Z0XOFW0Iu/zQQk7RAQBKMYOquikboZGhieqY8WrHydw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fEvkE45uGIOoQL4I5eSvG7jS6FZ702YMDeqSkOwjXXf7NS2qOqBYqGaiXEx3DoSgeIz8lSVPlzvdnIu48yDiRcnl5OJ7z/a2Sa+s/7qKrJzW8E8kfCfjYSRFbut7q3cJvEH88zszNL9ygJZWtBwRasUgCWkE2rxUHX+IOW+rdSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ku3hZOoQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ku3hZOoQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 813521F00A3A;
	Wed, 15 Jul 2026 08:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784104410;
	bh=g6cYXSq5K2YWiMGDHhQPRB2oLP0ZaDSZ6AQEWr7Fjkk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ku3hZOoQEyIGdor6UgKqQUys9mGQls0F/JbuV+vNaUuFB2aq4/1EFfTkVmZHf/Vy3
	 TOazveG+BDiLvob3wzzVgJCZ2TL44X9cK0wmNjxYHnvJNrwyqyymfaHDE+gzEk3wfV
	 wn4PXD/YOmey2vQwFGCq+C2zje8kAtECgYR6W+VRMMCMDLFsvHyINpMRgSYP/zs1H1
	 /fFKYG2LrqR6ZMP0EjPLWDo/wR4yFdTx8U5XGDmDGxjMOXj90jHE2KvOGN6bjw++zl
	 O+pqa4F5sbSbbfEZniGLEWg4LwId/9olJ1YsrJCKlCuliQPi/xiXQDLP2jqezIYUA6
	 z1QrCQEkHhgFw==
Message-ID: <39f363af-e2ac-4f46-a005-531be02aea8b@kernel.org>
Date: Wed, 15 Jul 2026 17:33:19 +0900
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] man: add io_uring_prep_cmd_zone_reset_all.3 man page
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org
References: <20260715063947.2933606-1-hch@lst.de>
 <20260715063947.2933606-5-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20260715063947.2933606-5-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/15/26 15:39, Christoph Hellwig wrote:
> Add doccumentation for the new zone reset all io_uring cmd.

s/doccumentation/documentation

> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>


-- 
Damien Le Moal
Western Digital Research
