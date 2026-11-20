Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795157906;
	b=Xl15cHi1+3kxgQ36LufrnXEU/1qknesBIzt1VEFarVhCanqQs/7nanl4EFRbYy7dNsbA
	 CRha80I+q7SNiWQOlK+/pmz83PV6zGDzvBjPx7rKpNmzDrncOWpFRpgVMrz32XBUdHC4Y
	 e5eeLDnuO2bV0Ytj0aPgaZQUw5FBn1W7vFOH4LlmZgMZDrdgsr/aMzjKgW3fFU5ZFoBrZ
	 yextaS9c47jQN7o5W5+ceLzy5NInWzROlmjuy2fFZzvGYFfHcgwDg7LWd0/80M2aEU3qP
	 ewxieCUFi+c1Fyl6RNbmevcPVDmxC89+L7AruAY6MAfslLvyoLsF6EF9BVVP5mYH1Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157906;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=PqRz+XKJCMUeLeTg31w4CZ3ZNY9/EBQuWK7a6YubIRk=;
	b=hrOyQG550z996lOc9QQIBbXe+hDJNXMlu+58OTtuRgeGrTPdXnnEjcJlDwYEa2sTK1KC
	 p6ObiyNGi0LmK9Tp4rv+NBQeFUachRqLfSPh98ObbyX/2K1cUGr4y61OyKIDJvOQx5LSj
	 ZEO0qjhnRJJsTOUzZMPbk1r/TeYPS07JMnN8WL1RXnfhifuXxMTSOsqkTjIaWm9JQf6eD
	 3fZv9gj6erZRtEAIOYH1e+iDytaW3vYx9zy8zaNGdfekjylgRyP2uoZaE4Qxo6bgfCjMW
	 dypmdyDWPJGYYlnp+cdVNWJ4WnnqqjKIThLaLH7GKOvHw5JBamaPSqMxP/1V6h1AEvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=rYAD7BxF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D50F606A32A
	for <io-uring@vger.kernel.org>; Fri, 20 Nov 2026 06:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=rYAD7BxF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BDA41F000C4;
	Fri, 20 Nov 2026 06:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795157905;
	bh=PqRz+XKJCMUeLeTg31w4CZ3ZNY9/EBQuWK7a6YubIRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=rYAD7BxFwuLtXKy3S0SxwF+bLEFFfBZDfzob+IrO9eHwIsFECon8AobAGwZ/SNVmy
	 oiXsxjBE9Kyv0paNcByE4cfg3T5RgeEAd9eTs1FKWpGu/90j0jLPGF8a0um2bt+lEa
	 Zars/KxH/VmCvs7Fi5ytMnu4xKIHfbigU6BmFYio=
Date: Fri, 20 Nov 2026 07:58:23 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: cve@kernel.org, Sasha Levin <sashal@kernel.org>,
	"io-uring@vger.kernel.org" <io-uring@vger.kernel.org>
Subject: Re: proposed io_uring CVEs for 7.3.2
Message-ID: <2026112040-liberty-apprehend-9f5a@gregkh>
References: <oMhla8VwCWoihfrmgn8znIy60W1QXI8g_v2OyB9i6sWESIDlVJlwoGGOLylJgIHRARNoieXUVRGqzeB__KvHMdXgnCfPPovs8vLMOzaMPEw=@rebasedinc.com>
 <draft-agent5-0001-re-eventfd-signal@kernel.org>
 <5d92861f-9a4d-4810-8700-b9e457ed9c86@kernel.dk>
 <2026111605-deskbound-clobber-a4a1@gregkh>
 <07947062-2974-4630-90db-1556e25b50bb@kernel.dk>
 <2026111722-unfocused-ride-065c@gregkh>
 <2026111949-tinker-symptom-4279@gregkh>
 <2026111918-entangled-juncture-4adc@gregkh>
 <fb339d39-d4f9-42ef-80b5-fab7398d2774@kernel.dk>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb339d39-d4f9-42ef-80b5-fab7398d2774@kernel.dk>

On Thu, Nov 19, 2026 at 10:40:24AM -0700, Jens Axboe wrote:
> On 11/19/26 8:32 AM, Greg Kroah-Hartman wrote:
> > On Thu, Nov 19, 2026 at 03:19:28PM +0100, Greg Kroah-Hartman wrote:
> >> On Tue, Nov 17, 2026 at 08:42:31AM +0100, Greg Kroah-Hartman wrote:
> >>> How about we make the "rule" that we don't assign any kernel CVEs to
> >>> io_uring things unless you ask for us to?  We do this already with the
> >>> xen portions of the kernel, but it requires you to remember to ask us
> >>> for an id "manually" if you want one.
> >>
> >> Along these lines, here is a list of git ids that our initial review
> >> pass marked as "should be given a CVE id".  Any opinions on how far off
> >> it is, and if we should assign these or not?
> >>
> >>   3de16279b43d io_uring: defer foreign io-wq enqueues to task_work
> >>   360395e8dbf9 io_uring/sqpoll: don't wait for the thread to exit
> >>   9f5315d3f436 io_uring: free the task context after a grace period
> >>   8543a39f03db io_uring/bpf-ops: clear bpf_ctx while submitting SQEs
> >>   51bab09b7ca1 io_uring: free XArray nodes left by a failed store
> >>   0b34e7b20a48 io_uring: charge tctx nodes and personalities
> >>   075d5837bafc io_uring/rsrc: charge buffer arrays and nodes to memcg
> >>   4a93427e99a8 io_uring/register: enforce per-task restrictions in io_uring_register_blind()
> >>   e66907c3ba22 io_uring/net: mask socket type with SOCK_TYPE_MASK in io_socket_bpf_populate()
> >>   37e425460b7c io_uring/io-wq: save worker type before dropping its reference
> >>   b42c85c20d84 exec: cancel io_uring requests before de_thread()
> >>   3eff68bce255 io_uring/futex: allocate private hash before waiting
> >>   5cb049d2203d io_uring: don't lose a cancel as io-wq parks a request
> >>   8257f6ec45ee io_uring: don't lose the DEFER_TASKRUN wake up
> > 
> > And here are some proposed 7.3.5 commits that came up:
> > 
> >   9eff9c07e927 io_uring/poll: cancel all matching requests in one pass
> 
> Agree

Great, is now CVE-2026-99796

> >   f013b6955064 io_uring/sqpoll: do the return-to-userspace work in the SQPOLL thread
> 
> Reject, it just runs limits later than it should, they are still honored.

Will drop this.

> >   cb0306c52ffa io_uring/cancel: drop sqd->lock while SQPOLL waits

Is now CVE-2026-99797.

thanks!

greg k-h
