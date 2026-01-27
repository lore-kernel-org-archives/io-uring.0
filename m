Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7952F2E7F11;
	Tue, 27 Jan 2026 10:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769508465; cv=none; b=XxlHsnto9Wk0RuOEQCTJvb88wajVyjF9i/gCTxQMU0IVDu0/Y6y6EUzoQRmtsJl/0EKE5iz/nXKRq9+cPExrXfT6zC6ZAd4UpZ2kJGXoyu7Wt4OAGKccqMbqpf9mfgV3gkjkBxjXr+LIw98/bkG71kSR75iPFDlm+XWKQsVwm8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769508465; c=relaxed/simple;
	bh=FCFXNxH2Grl3QRJQH1BKoHgY/2iEX++fFs3+uSP5mgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vEbC73V1TZWIm0DJDaaIHaB7RKtpDMka+xmVy3c+shvyh+bYYzffc/608PDun5O2XaaUIixnPmeNb+KZ5QRBVJFGLB+VHL2EDYSXxtUEHi7vGdx1kdTvMrxY27XXNjOGifhowNdKO2nqANCuT2ncW9eCXy5Z8v5PlAyh619mVYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PIK9DX+y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PIK9DX+y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECEADC116C6;
	Tue, 27 Jan 2026 10:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769508465;
	bh=FCFXNxH2Grl3QRJQH1BKoHgY/2iEX++fFs3+uSP5mgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PIK9DX+ySyg2zIvimZC6IRQSvT86TEs2/J3x2VZzzsTtx0XRDgeipyBeDJUjinp3l
	 xSbw6lF9PwufuQRFU9ooTgKKvvicU74h6jpnQxpN74Hc+oK36HfRsJ+Id0LuJfSN9i
	 JM7aAQBXySBepSRJCkU9Qmin+OijtyMR6qIbaB6KMqlUkvZXDvHxt2xG5xKNsHE5ed
	 0veuMi9Z3ojQQCxnJk/WJI4wxEmL/QFS/M6N6WZdoI9KTOc9UywIPSmnCmwOjCBf4Y
	 6P5kz7fTuRUDXx/1+8U/rvhuZjgm+AcAOQJNK8gY2YnWV1I3mQUYkebbgnogTYPL/O
	 ndWe9FNK6QJsA==
Date: Tue, 27 Jan 2026 11:07:41 +0100
From: Christian Brauner <brauner@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, jannh@google.com, kees@kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] io_uring: add task fork hook
Message-ID: <20260127-spangen-wahlkabine-1224340b32f9@brauner>
References: <20260119235456.1722452-1-axboe@kernel.dk>
 <20260119235456.1722452-7-axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260119235456.1722452-7-axboe@kernel.dk>

On Mon, Jan 19, 2026 at 04:54:29PM -0700, Jens Axboe wrote:
> Called when copy_process() is called to copy state to a new child.
> Right now this is just a stub, but will be used shortly to properly
> handle fork'ing of task based io_uring restrictions.
> 
> Signed-off-by: Jens Axboe <axboe@kernel.dk>
> ---

Reviewed-by: Christian Brauner (Microsoft) <brauner@kernel.org>

> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index d395f2810fac..9abbd11bb87c 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1190,6 +1190,7 @@ struct task_struct {
>  
>  #ifdef CONFIG_IO_URING
>  	struct io_uring_task		*io_uring;
> +	struct io_restriction		*io_uring_restrict;
>  #endif

Somewhat should make a graph how much struct task_struct grew in the
last 5 years. :D
