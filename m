Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BC93B9600
	for <io-uring@vger.kernel.org>; Mon,  4 May 2026 12:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777896620; cv=none; b=l4fjop82W+KEhB7T0oMwDnvq4IqA9EcjXpqF7vFUYyziuyMZC3ojvRYRkYbU3QvLFZYmeWI+po6ba3p7Pg1ZsutsvuzJhmdr+BCziTh8EZAlZVwK/4MgLlUn0A+93A/Zc6JA5Wuu1xg/qGthoab6qOcONmc/CtVnMve4RSxjpvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777896620; c=relaxed/simple;
	bh=0Wm6CLOEwddQc/Sf73RpwZP5AUTVDaSUAbK5avJdtZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RWOw36++Vm5zifRZHnkox7EjKwwhUS8FFUxWpFfWEo6RfxqsN33Z9ZoWWQ1SSySVl9N+lAqGkb3PzFLoVrwS3AmZbp97+7v0mcO5ia1s43EZdiNLqiCM9KszikeHKlVOZG3QUcjGfFSzx3XHesHYfUszVCFVYtcgtmHkkZOwZQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=G7Bvhdu/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="G7Bvhdu/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66AB3C2BCB8;
	Mon,  4 May 2026 12:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777896619;
	bh=0Wm6CLOEwddQc/Sf73RpwZP5AUTVDaSUAbK5avJdtZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G7Bvhdu/Dc/1osIuva33mELVFQ8pNenlTxQ9mrrXAkT6H4pNteGiBT4FX/B0RJGfG
	 eMZ+MtO02UHgJ8YFVMGlRqub8NsYqVFzmlr28tEKyaPCsD8RI8Sm5BepwLCXd+2TnO
	 tyPSeYXc6oWVAl+TbIK3baf3S/bshqrML2ypTSQs=
Date: Mon, 4 May 2026 14:10:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Carlo Conti <carlottoconti344@gmail.com>
Cc: axboe@kernel.dk, io-uring@vger.kernel.org
Subject: Re: [SECURITY] io_uring UAF: io_uring_cmd_issue_blocking missing sqe
 copy before RESIZE_RINGS
Message-ID: <2026050401-juniper-undocked-190c@gregkh>
References: <CAAiJJe3rVHjEO6yZ=w6S0igYFE8ROBay+An7PnuMX0KndxwXOg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAiJJe3rVHjEO6yZ=w6S0igYFE8ROBay+An7PnuMX0KndxwXOg@mail.gmail.com>

On Mon, May 04, 2026 at 01:59:01PM +0200, Carlo Conti wrote:
> Hello,
> 
> I have identified a Use-After-Free vulnerability in the Linux kernel
> io_uring subsystem, confirmed on Linux 6.19.11.

That is an unsupported and obsolete kernel version, does this happen on
the latest 7.0 release?

And can you provide a patch to fix this issue as you seem to be able to
test this?

Also, you sent this to a public mailing list, so I'll take security@k.o
off the response now as it's not needed.

thanks,

greg k-h
