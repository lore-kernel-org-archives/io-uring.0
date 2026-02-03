Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884AE363C74
	for <io-uring@vger.kernel.org>; Tue,  3 Feb 2026 17:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770141265; cv=none; b=cxkS4ND4QcZNDCAbj+MM2Y2pNkql++2YJ+DIv1SeeW261PbbHrwtCsS8ZZjrVTE9e6naBw8WuYl4EufjKqnhsfkuon8t59LWKwdFMvZM3kERG/7aImV0csmnKAJccVN/ZJWe5csfgk6Y35ycRGVr6sm4zknDC9f/EGtEcgLLPWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770141265; c=relaxed/simple;
	bh=kAwbIAViO3sjprs2y6acDJbLiu8FtRGtQ1zYMQlFdVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MIgZgSbjuUFin8YFvG2EQqCve97AgVYMG6EaHM47VsA9nRvxRXMfm0bL7OuDvLBFoKhuMsu/oy6AT+3NwY094gDCeg4LG8NqXAECJUooAE8G8L9vbhIVgK/i6wOlHaxXLz87sV8Bx20DRrqi1RS2hVxV6n40e8O/78prI++JS6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R+eggeGP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R+eggeGP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDF8FC116D0;
	Tue,  3 Feb 2026 17:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770141265;
	bh=kAwbIAViO3sjprs2y6acDJbLiu8FtRGtQ1zYMQlFdVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R+eggeGPlG+tE93Vzfg6HZyYQA/j4lAtrAUZMw63bdMt1Wzqc2lIZEzTateKCvz78
	 2mmfZPpT0XhaAX1xKhGCO5zZUwRyX9dUUpB5Mazllk8L9k4czm+zHc2SgA+dLAmajs
	 /p3YzDGTlA1sOlcIMDhdSrjFiLSw70IObn7MpXUgSO1al7kAeBLdhtl/QtVWs5l9jh
	 KSmLyZrR+TzLK0w7YtOAsefauLFES4hRAuVCsSh1QEYnV4omnSeHk7H0m2l4HF6SAZ
	 Lu+N69tft2b0GPBgnsROaylrNkqClq0z7reU6L1lJJRwFmfiS8/5Mxml3cjlLVSl1Z
	 4FQEvvnY5Tt1w==
Date: Tue, 3 Feb 2026 10:54:23 -0700
From: Keith Busch <kbusch@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring <io-uring@vger.kernel.org>,
	=?utf-8?B?5piv5Y+C5beu?= <shicenci@gmail.com>
Subject: Re: [PATCH] io_uring/fdinfo: be a bit nicer when looping a lot of
 SQEs/CQEs
Message-ID: <aYI2T75jvb-xeHmr@kbusch-mbp>
References: <f8f9a810-3e66-4010-b6c8-47cd9d1c9292@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8f9a810-3e66-4010-b6c8-47cd9d1c9292@kernel.dk>

On Tue, Feb 03, 2026 at 10:06:18AM -0700, Jens Axboe wrote:
> Add cond_resched() in those dump loops, just in case a lot of entries
> are being dumped. And detect invalid CQ ring head/tail entries, to avoid

Hey, another cond_resched that lazy preemption would make unnecessary!
Looks good anyway.

Reviewed-by: Keith Busch <kbusch@kernel.org>
