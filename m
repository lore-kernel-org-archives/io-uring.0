Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538DF3A9001
	for <io-uring@vger.kernel.org>; Tue, 24 Feb 2026 16:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771951649; cv=none; b=dbY/dm7RDyMLekKXsJJjI8/MMV0CZlSAJYBHJgoPU+AaGWKk+Pz2IAOO26dk/tG703x7fpb9zRtnfC2Rn+1EJCouob+rpGe06dfqnDXcRtuE6KxrQDeOCkJ++3ZQa9pybZFSfOGawS0u31mZ9Z5C8vglm0ceMFa4Q6DuPY2nvbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771951649; c=relaxed/simple;
	bh=sNdlCgiEAxCP4ahus7HXFaJDVIXCiOWiyQ8RdI3+ug4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AyrIuaVkhVfX8pGz0a3jN6WMlT+DJICjxc8SMWaBaMoDf5rQQIswKxq5uBJYgXo9uUZXMdoHr13cTBydk790+8qsd3JRdueh/7d924tR4See+zYOr3oj0cOAkMNjtlQ1HfUG4o/VYfwQ2sLVMHbn5r1BjGtcu4Qmcf0eBN3Jq0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NoPVAeEc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NoPVAeEc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4B26C116D0;
	Tue, 24 Feb 2026 16:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771951649;
	bh=sNdlCgiEAxCP4ahus7HXFaJDVIXCiOWiyQ8RdI3+ug4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NoPVAeEcBoEQMQOUiDgAnjcY+6XlrjpkYBCIQ2wNMiuYdTKFWWGwbf0tLPEs9oRbL
	 CK45ZAYWGeZ62xGCzkJHToiS2U0LG9vRBAasaGDz9Wo+8hKiFAtNhK3lv98M7FCTPn
	 yWh/8x4bVTIebyT4SVpfDfczrLiwMTZ6UQAAzT/qnugBx08OEMcbDpTNmD7aNo332A
	 n5cNw/MyyHhlnaHtkmduf8KTVkvgY+ZXjFGc0g2UdupiSS07PPOlKFfQXayKS2hkva
	 dA/GR/zfpgcnYknqx25bcNIMmtYghZYpEEmxUMRcDlfVZ+58nMXNhSqZSlpmdf7JPM
	 dWlLW+aaxm44g==
Date: Tue, 24 Feb 2026 09:47:27 -0700
From: Keith Busch <kbusch@kernel.org>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: io-uring@vger.kernel.org, axboe@kernel.dk
Subject: Re: [PATCH 1/2] io_uring/timeout: READ_ONCE sqe->addr
Message-ID: <aZ3WH6S7TjyvPd5V@kbusch-mbp>
References: <cover.1771949518.git.asml.silence@gmail.com>
 <8deca9c11a924888d317b4666c93c6ed2e719cee.1771949518.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8deca9c11a924888d317b4666c93c6ed2e719cee.1771949518.git.asml.silence@gmail.com>

On Tue, Feb 24, 2026 at 04:12:10PM +0000, Pavel Begunkov wrote:
> @@ -557,7 +557,7 @@ static int __io_timeout_prep(struct io_kiocb *req,
>  	data->req = req;
>  	data->flags = flags;
>  
> -	if (get_timespec64(&data->ts, u64_to_user_ptr(sqe->addr)))
> +	if (get_timespec64(&data->ts, u64_to_user_ptr(READ_ONCE(sqe->addr))))
>  		return -EFAULT;

Should io_timeout_remove_prep() get the same update? Otherwise looks
good.
