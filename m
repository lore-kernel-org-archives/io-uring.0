Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B561D26AA91;
	Sat,  2 May 2026 06:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777703343; cv=none; b=iJc5UQXZmFGMaFKfuPBzBn0DKpTz9ED2numpK5f5HsklLxr2CVhNeEt5rdLd+d1E8/BSwQrYxbxgit6SZmdiPH+Qn46Jt+o8H/ODf45FD38rj/I2CTxmYnS+TBgU7AwuSUNd8lwHvBVXh2XFdIO1CMdMaW0Nz0O2tUgs0Vy2EII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777703343; c=relaxed/simple;
	bh=jGpgR4Gr6eK9YuFNs2Qeifk1JrmrHDn0VAu1pt7fTzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u35f/fOoOVL+ZLwhKJpFRUPNHYIoC6bS/bNJZrBAfKC0VuzQl7PrYmm//BCg/VTdq+W8OCwvQmK27+h1CXAindeQ5hu2CXWfmmaavGamMyPB+F/GIsUR2khpFLUHKZKTkGHWMcx3VwFXet/y95LG1keav2suNqTgvjnsEgbIBFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0I8euiUW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0I8euiUW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E441C19425;
	Sat,  2 May 2026 06:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777703343;
	bh=jGpgR4Gr6eK9YuFNs2Qeifk1JrmrHDn0VAu1pt7fTzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0I8euiUWAM+i1GvfYqwFFFIz+Gwx15ICXGI5XMPaJex05d//TpciUOOpADYjb+Y8x
	 mq+A1hGocc4lBqL51hv6g2P+l/pWCqEiChXc5/DXLITSMGnFTq1iRsiVflQ5dXeZ0T
	 mry2zX7Il9YrEdJ2wz88VoBACcSqH5LHkBCGnupA=
Date: Sat, 2 May 2026 08:29:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Kai Aizen <kai.aizen.dev@gmail.com>, stable@vger.kernel.org,
	io-uring@vger.kernel.org
Subject: Re: [PATCH 6.12.y] io_uring/poll: fix multishot recv missing EOF on
 wakeup race
Message-ID: <2026050246-estimator-hurry-3df6@gregkh>
References: <20260501225250.90152-1-kai.aizen.dev@gmail.com>
 <3fcf1bf1-23fb-4e01-ac3d-6ec6fb86da08@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fcf1bf1-23fb-4e01-ac3d-6ec6fb86da08@kernel.dk>

On Fri, May 01, 2026 at 04:55:54PM -0600, Jens Axboe wrote:
> First of all, I'm fine backporting these. But:
> 
> > CVE: CVE-2026-23473
> 
> How on earth is this a CVE?! That's bogus. Yes it violates application
> expectations, it'll wait on a CQE it won't get, potentially. But this is
> the only side effect. That is NOT a CVE. Greg, please retract that.

The CVE is now rejected.

thanks,

greg k-h
