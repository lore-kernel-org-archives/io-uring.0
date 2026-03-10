Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4205A3A6B94
	for <io-uring@vger.kernel.org>; Tue, 10 Mar 2026 16:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773159286; cv=none; b=QrH4HQbyNRWTmOuPDSYzJpA50RfS6oPqmqbSd8an+PXFZbzPtq5pWWUGnEHWBB/cJO5MpyzfOd1yJ5qgHgf23T3BvMYEkJ/bWbsSqk75zKhoLGc6jyaTvRY0ccQFKfhgtTZnVQ4GaU47ryv22FdLy96Mvdgxkimul/HvZFNZ31U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773159286; c=relaxed/simple;
	bh=S5LiJXLL/D+yYCHwucKeFkX5yWnQ7QyfpDt2GZKWoU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JoQ8OvOPQtc+n7s7ZFHDFtPGUKq0KweQAYsxV7HkyK0eV7V04h57sqUIDidj5bZlTgTx3zoJwHg08sO6UXG3PrHVxLqGUGQfLc84G6Hc7TrmlsOSv1pTpSigRg0kdqrftTwyJ+HtTCxBNg/YKpG6A/s6jk4x8PrJZPtWZHHY+Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qUO/YtsI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qUO/YtsI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC9B3C19425;
	Tue, 10 Mar 2026 16:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773159285;
	bh=S5LiJXLL/D+yYCHwucKeFkX5yWnQ7QyfpDt2GZKWoU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qUO/YtsIeoKIDc0myZDYVVOdwQQsae/Gvd3XHaR47g+VIhEis5qK+q94v7UxmHdi8
	 715Ttc8MMFVZvkeAthA+PT6H2Qcav+J6WfzMpeljmhJFufSAPn2UInCRIHubHh8qMA
	 aZmWEkUSR4xljX3yGKxVWoIy2TnemTOLfk2kqwkjamHBkVGvm3fTU7RsG99dB+FUli
	 qptHW6tnu2FDWCQ1sauifXRus0U+PgWaLO78TMERiMrMRWqxAQM8aqg635muDvl3ZU
	 Qr1DZDJJ8r54KRZ++6w9ggAM19vr9kV6ROIfuI+VBcbp9CQL6nJmH2kQfsbQs8jmHp
	 ixY7Hwwkj70uw==
Date: Tue, 10 Mar 2026 10:14:43 -0600
From: Keith Busch <kbusch@kernel.org>
To: Daniele Di Proietto <daniele.di.proietto@gmail.com>
Cc: io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH] io_uring: Add IORING_OP_DUP
Message-ID: <abBDc589oZdfR_aD@kbusch-mbp>
References: <20260310154933.2500971-1-daniele.di.proietto@gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310154933.2500971-1-daniele.di.proietto@gmail.com>

On Tue, Mar 10, 2026 at 03:49:33PM +0000, Daniele Di Proietto wrote:
> +int io_dup(struct io_kiocb *req, unsigned int issue_flags)
> +{
> +	struct io_dup *id;
> +	int ret;
> +
> +	id = io_kiocb_to_cmd(req, struct io_dup);
> +	ret = replace_fd(id->new_fd, id->file, id->o_flags);

It looks like there are a few conditions where replace_fd may block,
so it may be a problem to call it from the uring enter context since it
will block progress through the sq ring for subsequent commands.
