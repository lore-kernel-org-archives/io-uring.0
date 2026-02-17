Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77417355039;
	Tue, 17 Feb 2026 13:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771335495; cv=none; b=SdjGMk+Pbc+4GtyB0k48wdl9Zahy7RfhqS24w+7LZsvXRo3fJ98DCdDXM0ArnNwhC+KhJFLkOdOxDpLCRLEsGCBekQnb/R0kF4mZSBE2/ygfoU48mdrnGYqZ0E7iuR+a9ZL5Fmq8xQthVNqK4oQFJk2JwDcUzJbnmSfw3t/8GOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771335495; c=relaxed/simple;
	bh=sc0NXuhGZ7mkQ+/oVQ8PUAqZ4/sIJ8xicG1GJovMlyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TA9HjrsjAr21WBqegWq1QFZFydtTJMY7cIiMsOHflXrnP5peMuWJf17E9o5aiOwVpbqKapsk3aN6Lh0bM8Lp4Ag3niFDepMq7Wm2e7kLPotmtZElMcC5b8g3Tz3MKUiydjzZuEYJpyEbAeFzKEBW0XIlA6Tz3+lLP6bQNglYyzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DAu6dZre; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DAu6dZre"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 165BFC19424;
	Tue, 17 Feb 2026 13:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771335495;
	bh=sc0NXuhGZ7mkQ+/oVQ8PUAqZ4/sIJ8xicG1GJovMlyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DAu6dZreRWLBMDujSmZOwtoZ1nw4HAUcZWfnAgqpAohS6pAlEFm65ukWYbYNqRrxp
	 KxSv1XG8EBneEdl6A6/6bU1B7SuNpe5h6zoJX1B9F1XBfPd9haHmKHExemseU9T4ev
	 Gv8v8ySWtq+1sDZ1MItmJ8s9m0EhUzpPfLdEXv/gaJFXDOUPZuhedKUBXYgUWEWK3q
	 mguQNcV+qOl8H3W1el20s6ubk13IqBlWAjgYBYjuJzL7IqLblXmB3SBvMq3k5HNk1P
	 1725NSO/wP6xH35ehmlHUkNVCVVNd/NUt9E15ajJgEFQ9m5GYU/ExyM5T627Mq359O
	 WRQ0m/Goh+DMw==
Date: Tue, 17 Feb 2026 14:38:11 +0100
From: Christian Brauner <brauner@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHSET 0/2] cBPF filter API adjustment
Message-ID: <20260217-botschaft-fugen-1c76dd0ff974@brauner>
References: <20260211150626.136826-1-axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260211150626.136826-1-axboe@kernel.dk>

On Wed, Feb 11, 2026 at 08:01:16AM -0700, Jens Axboe wrote:
> Hi,
> 
> Christian brought up a good point on the API - what if the task and
> kernel differ on what the payload size is for an opcode? Currently
> there are two defined payloads, inside struct io_uring_bpf_ctx:
> 
> 	struct {
> 		__u32	family;
> 		__u32	type;
> 		__u32	protocol;
> 	} socket;
> 
> 	struct {
> 		__u64	flags;
> 		__u64	mode;
> 		__u64	resolve;
> 	} open;
> 
> and it could be a requirement that a filter exactly matches the payload
> that the kernel uses, if extensions have been made on the kernel side.
> Hence this small series updates the API slightly:
> 
> struct io_uring_bpf_filter adds a pdu_size field, which userspace can
> set to the size if expects. For an OPENAT/OPENAT2 filter, that would
> be sizeof(struct open) above. The kernel can validate that they match,
> where the mismatch policy is controlled by userspace. See patch 2 for
> details. In case of a mismatch that causes an error, the kernel side
> pdu_size is copied back to userspace.
> 
> Patch 1 exposes the pdu_size by shoving the filtering and pdu_size
> into the issue side definitions, and patch 2 implements the above
> size checking.
> 
> The liburing master branch has been updated as well for this, as
> copying back the pdu_size necessitates changing the API on that side.
> Test cases and man pages are updated as well.

Seems fine by me,
Reviewed-by: Christian Brauner <brauner@kernel.org>
