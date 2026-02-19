Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EC42EB860;
	Thu, 19 Feb 2026 15:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771514593; cv=none; b=tZW1XbGtcbf4B2x0GV6wcnnTlEZ2DKashA5Fkd2MONReY4Eda5eMrbz+ZGkS2NrJjEy0Yw+kg6s/+hhHTNj9O/ZvFVAegDjND2MDsRVuB4Fa0jz6b+9YqnXfW5rMqUOo5yQUakOQnE5ognb33rtzbVOJJredS9DZEY9lJeEu4Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771514593; c=relaxed/simple;
	bh=WqQ1+OlNuecxlI95qdxx2oOIEI3Zz+4MC8TKOz/Gs40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hlhlbxUUydSeWpZccF+OevSU7tQYvhuM/MSprFm+mXkWxGctAAxJlEl6iKC5ypsYcgUq/b5GwVxjNjrjmAW1uYCKTxiSLsBFqMUCPKNNcK+edTVlbY611m1EeHMe/gs1l+GSdOzDQByBCk945KpPYWtGruCw8AeSLbxjXPyBzQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KtCbQBoe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KtCbQBoe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18E8DC4CEF7;
	Thu, 19 Feb 2026 15:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771514593;
	bh=WqQ1+OlNuecxlI95qdxx2oOIEI3Zz+4MC8TKOz/Gs40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KtCbQBoeSXPhgjmkC89WSGRL0LZRPZtdBaXN9o3d4Ap33/KDRqE89lptZ4N5Xe20y
	 S/I75rqwf0IQAIa4xjxQW8IHcAZm8tcZWO/ks0o+8NeNCteN9VVzpicVfs7WDDWxyR
	 X5GZGEt+89zmX3bUp8Azkao06A23tlrmruWuKN9ADcCFRwnDS3j0iB2Dc3NxtMDL1E
	 doHvsuxmHR3eBHgV7cv56JASCdYm1huFAafY2ysaScdkYGGsu4C99UV0IwRU+ZjDu4
	 /qeE3qIS6EyVFC24l7yM1VifdEt4FwR1WKdtMx7LrKLeVd7CcHO/UWhTGxIztgFJJI
	 9ELKv/NPRCXCw==
Date: Thu, 19 Feb 2026 08:23:11 -0700
From: Keith Busch <kbusch@kernel.org>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] io_uring: add IORING_OP_URING_CMD128 to opcode checks
Message-ID: <aZcq3xr4Q-_sBfyW@kbusch-mbp>
References: <20260219013534.4140776-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219013534.4140776-1-csander@purestorage.com>

On Wed, Feb 18, 2026 at 06:35:34PM -0700, Caleb Sander Mateos wrote:
> io_should_commit(), io_uring_classic_poll(), and io_do_iopoll() compare
> struct io_kiocb's opcode against IORING_OP_URING_CMD to implement
> special treatment for uring_cmds. The recently added opcode
> IORING_OP_URING_CMD128 is meant to be equivalent to IORING_OP_URING_CMD,
> so treat it the same way in these functions.
> 
> Fixes: 1cba30bf9fdd ("io_uring: add support for IORING_SETUP_SQE_MIXED")

Looks good, thanks for the fix.

Reviewed-by: Keith Busch <kbusch@kernel.org>
