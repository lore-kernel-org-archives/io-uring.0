Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E94D3B6366;
	Thu, 24 Sep 2026 06:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790231570; cv=none; b=Zj4vF33i9UHC+hu0Oe7rQGeYmfGeCh2d7AB9mIjGQfL+7/UpjQR19SfFBdkRhohnAQXW3iyUK5VP7eI4kn8euxVlgP/aQHzSMeTo6jAIZwbyAudKulPrQKvXqd+5IM30wrWaU1Ke3wswnvWEvQbVt5rRtzxspIrOXvd4e4Kre6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790231570; c=relaxed/simple;
	bh=BuECX3hLyMJzV5KZQbudVJdWPiUPorpHgRofJKwp9qY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DClmMyyeFrr5AWXBEoWRd9BVVChPAGCLZqCOFoskKFfeK5cXBaCR6qLWVwx3PrJct3v23LhEnyhsuoVKdxdvuy8oUQv77tQfqL4NStMFs+1sWTEC/FkXmHtyiZ5SpbHxkDcwZQ/hXarJYLrpCXTKUTCGeDo50EbQpQtif6CbHuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Pk5HkNeZ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=V6mc42M3; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Pk5HkNeZ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="V6mc42M3"
Date: Thu, 24 Sep 2026 08:32:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790231566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VCQOEY2LVyCBQskPAvNbkIxf5cXJZ3XoqjPHSRMffDA=;
	b=Pk5HkNeZ6GytlKp7bf8DVYTzyMyg2tHsRwuH87ouqp4YzCWitTNYTk1SxuBBqXzWKytcBf
	K4zbGg2zfTe1N/re9V7oNrq29VosBPmQUeSP0eVpG2XWPlYmk8GwBRrXndrEUmvKCO3Dzd
	f3yZf3w+j8OzKkD/KRoKTcSUhqcLsvIhqkIwqWcZCT2WvILTxHDHnS2kDKf1DDwINYDl0i
	wtOYTCwmb5IXlzwFVtw00TaD35yv7AXW45h57eN9vlN5Exk6apNgbZQr3gfuX6iArFjSxS
	x/fNsV1iIrSBYJFVgNfaXrstYQbZse4iTPm3lAcBYvuoG4tL8Fj3Hqnahilt7Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790231566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VCQOEY2LVyCBQskPAvNbkIxf5cXJZ3XoqjPHSRMffDA=;
	b=V6mc42M33EtZT+En9aGuvww8S+wc7ADulMTZQwW/XVXds2DyNoHq5XVD7U0BfOlFnEZuvC
	IfyyYPb+q6k2vHBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Xiaochuan Li <chuanx2070@163.com>, io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] io_uring/lock: Keep spinlock release before wake_up()
Message-ID: <20260924063245.B9CJRu5n@linutronix.de>
References: <20260923172032.11057-1-chuanx2070@163.com>
 <179018503811.141390.8170241609331802900.b4-ty@b4>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179018503811.141390.8170241609331802900.b4-ty@b4>

On 2026-09-23 11:37:18 [-0600], Jens Axboe wrote:
> Applied, thanks!
> 
> [1/1] io_uring/lock: Keep spinlock release before wake_up()
>       commit: 8dc68de64261e599631aa7ed6cdf3aec07c7ae3d

Thank you both. Any chance for a Fixes line?

> Best regards,

Sebastian
