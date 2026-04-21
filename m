Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226A62D9EC2
	for <io-uring@vger.kernel.org>; Tue, 21 Apr 2026 13:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776779741; cv=none; b=S6vSXLr9nsxg9mbR51Q0pVqniPrCdXd5O5HYMz5M01eL0rC3LYv8NoTnSsaqiEAzRLHmwB+OqW9w5fJ7xg1+wCd5tRl/LyLoDm7POV2ta22v6GkYWkrZQk97d8HTb/CorLLkyEs2eLrmTQNGX9SxNIpZEhe+iOK3wrXzzSYVJbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776779741; c=relaxed/simple;
	bh=Pn79hZC55AAJm6orMAw/AtvVsrxQLBNVHTd3te5BSTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bxkkO32YNRJo9pZgBovDj2JxK0HjWaqkz5a6Ibg3e/lkEkqqivtvw9XcLzFuayHhh6YlHPfX9UDow0PNCDSkG3z7nQnLEbrDYdEVJutAYf3SxQ77mxLR+9Ix4Xh0rovt6J/csoZdd4WFq9PXK+hbTjR4t+OFA4S+m+bD9YX90a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vmUN33M5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vmUN33M5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF39C2BCB0;
	Tue, 21 Apr 2026 13:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776779740;
	bh=Pn79hZC55AAJm6orMAw/AtvVsrxQLBNVHTd3te5BSTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vmUN33M5R/+URLDZgEhEcZyTKMvTLlvvc8muScgz0dpDA9LqoP4tJEVtAJfymcujP
	 uChhYxduKmXlWBEPLQwfsc79VjP1x5B4Y7Po6zwUmPbw/tGfjqbbRGCKAMeUSTxbTP
	 nJNd8eyfqOmhcPT2aIk2NUThsMmZLojt81SPLd+o=
Date: Tue, 21 Apr 2026 15:55:38 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org
Subject: Re: [PATCH] io_uring: take page references for NOMMU pbuf_ring mmaps
Message-ID: <2026042108-fiscally-unglazed-56c7@gregkh>
References: <2026042115-body-attention-d15b@gregkh>
 <842a9dff-b12c-4cec-bc8d-8c1adb3ba280@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <842a9dff-b12c-4cec-bc8d-8c1adb3ba280@kernel.dk>

On Tue, Apr 21, 2026 at 07:50:32AM -0600, Jens Axboe wrote:
> On 4/21/26 7:46 AM, Greg Kroah-Hartman wrote:
> > Note, I have no way of testing this, I'm only forwarding this on because
> > I got the bug report and was able to generate something that "seems"
> 
> AI bug report I presume? Because I can't imagine anyone ever attempted
> to run this.

Yes, I got a bunch of "non-mmu" bug reports, which is a bit odd but I
guess you can do that with qemu these days?  I should dig into that,
maybe that way I can test this and get a reproducer for you.  If not,
let's just bin the thing.

> > correct, but it might be a total load of crap here, my knowledge of the
> > vm layer is very low so take this for where it is coming from (i.e. a
> > non-deterministic pattern matching system.)
> > 
> > I do have another patch that just disables io_uring for !MMU systems, if
> > you want that instead?  Or is this feature something that !MMU devices
> > actually care about?
> 
> I mean, who really cares about !MMU in the first place, we should just
> kill that off with a passion.
> 
> Let me take a closer look at this and bounce it past some vm people, my
> nommu knowledge is close to zero as it's never been relevant in my
> professional life time. Which is saying something...

Let me try to get a reproducer going first, let's not waste any more
human time on this just yet, sorry for sending this out without that
done first...

thanks,

greg k-h
