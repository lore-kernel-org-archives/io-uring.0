Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5680B5650F4;
	Wed,  9 Sep 2026 13:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788960968; cv=none; b=jotLBf59vhj7ruvWKObv3y5s4QMc53ZhbpLK1DiV9OuswVDr5+mGdOaQlaagy7rT+W+qiDeE8I/F0Kcfq2/oGsBEHqVsm6yOd5Od+UMs0+eM+QDtgkEZsjy7zH9pcv6x83ARzjIMNpQ9feDhblNkifAvNZYQq+Cx1NaaXmez5oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788960968; c=relaxed/simple;
	bh=UKFB77CAlNqkAbTNPoe0QFjLaAHPO6A4bFJtevGcw50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DmlN2ECEi9xJiGiAPY+H39F1eDPeu/g434rCLrdokQysRjo1f1Dogtl2f6UIzNOFCBHdQ8Inc1cl1m8VyQ5aL2LM9CipLFyDsGWd+/I/AgtM9x6s3awvbJ6xmjaliZww3IlLwkSv0Xd3/8QERVCZpLSY4wx0MxP8O3aDGKMxnEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2PJImAPi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2PJImAPi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B87A1F00A3A;
	Wed,  9 Sep 2026 13:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788960966;
	bh=WnpS2yGxKI44jYHhvDpX+wa+5acQMRQRU+9l/6MzidY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=2PJImAPiXTNHRQ7hP2x3oYT0BLtP1K511PRmOlIgApf57TwmUNurL976ZqzkF7JMQ
	 zy4BCLjinkulIlTgqoBJgyVxudGDsCtY59l8Qa1OWHGGCsPRBhZgpNIXk6vmFDs6Rg
	 YxtEK2boO7fMsSbWTfcTPazN2t+BJk3gev9PCSB0=
Date: Wed, 9 Sep 2026 15:35:59 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Li Wang <liwang@kylinos.cn>
Cc: Arnd Bergmann <arnd@arndb.de>, Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mengmeng Zhao <zhaomengmeng@kylinos.cn>
Subject: Re: [RFC PATCH] misc: fgds: enable GPU-NVMe direct I/O via POSIX and
 io_uring
Message-ID: <2026090924-corsage-shout-833d@gregkh>
References: <20260908131545.105987-1-liwang@kylinos.cn>
 <2026090913-landline-encroach-c544@gregkh>
 <6aed7ecf-d125-40d1-a82d-1a7f62049605@kylinos.cn>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6aed7ecf-d125-40d1-a82d-1a7f62049605@kylinos.cn>

On Wed, Sep 09, 2026 at 06:42:03PM +0800, Li Wang wrote:
> Hi Greg,
>   Thanks for the review!
> 
> > 
> > That's not really needed in a changelog text, it could be in the 0/X
> > patch :)
> > 
> Sorry for the clutter. I will move most of them into the 0/X patch in v2.
> 
> > Anyway, you didn't cc: the io_uring list, why?
> > 
> `scripts/get_maintainer.pl` didn't output the io_uring mailing list, likely 
> because this patch doesn't directly touch the io_uring codebase itself. It only 
> enables remapping GPU memory buffers to CPU virtual addresses, which can then be 
> consumed via standard io_uring APIs.
> 
> I've added io-uring@vger.kernel.org to CC for this reply and will keep it in v2.

Great, as you are using that as the api, there might be some parts that
will need to be reviewed by them.

> > Nor why "fgds" is the name, that's going to be hard to remember, does it
> > stand for something?
> > 
> "FGDS" stands for Fast GPUDirect Storage. GPUDirect Storage (GDS) is NVIDIA's 
> technology enabling direct I/O between GPU memory and files on NVMe, 
> widely used in LLM workloads to bypass CPU overhead.

That's nvidia's specific solution, but this works on other devices,
right?  Or just for that one platform?

And you are using this as a "bypass" for the normal accel subsystem,
shouldn't this be part of that subsystem instead of a custom user/kernel
api like you are creating here?

thanks,

greg k-h
