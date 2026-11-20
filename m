Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795158100;
	b=MQRc4bySMtNYnicIswka7pJ3M1V56/VHC/f2bcQUtbRf2MbJcNz0ymBpWXh7jtS1R1pt
	 P0q0TdxdbOUgRgbEak/8KB1Am1XHyiamTD4ajztgU7DUQGYY03IH6m3B6S9X/56aLK7/r
	 /W27WiGsgLsVXKPSqKVofZSOZOU9eho0fsj2O0MtjyZTSyHOEJFBpL2WS8ANzCsj94qYK
	 DLRhRmJYfA5h3Om3AcR1Oc0sv8KKSBB2xhB2KYvD96fHaBIvLq4++TALeUKB45ylhvyGY
	 kTCNkq69z42UPMzdnaWJN0to27s0ANTEyvnAGBa4EAUJgVl0NirPNXSoOQpIJ+vs3CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158100;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=MNwAGWpKuAWvLRI/oI5OtnYw5M5dx0IqXpkLSJtB5eQ=;
	b=bfAgRqPXv4/DxbtqwWWlrUC87hkmqqLe24Q+qID1lJmnTZ7tyUw6kYX0GRk2EGUgkemZ
	 QtCpja4HBDNNyykg0yCNqPJ+QTueLI6j5d3+HhLPlC0wpmp8Ju5NGfNcxFTbEjJYefVpl
	 x9XVXJW+9lwF5PbzFBAevyM8rUCP2po8goEvnYvrJ9A+N1elGGZCOiFNzxElNOw/OwZm+
	 WHhDpz//JbTT7OGZ98FvGNJOnflYf35W7rEQILs7WrdaigCsKOGsSmNy6W2U2FY5O26Hg
	 N00uFzb38Tq6Adm4Ike90uMNznWqD5XMBHJwPdzKFc719bt0t3X19ggabAV5QsXoi7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=gBnoMWrN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AD3606A320
	for <io-uring@vger.kernel.org>; Fri, 20 Nov 2026 07:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=gBnoMWrN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 779EE1F000C4;
	Fri, 20 Nov 2026 07:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795158100;
	bh=MNwAGWpKuAWvLRI/oI5OtnYw5M5dx0IqXpkLSJtB5eQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gBnoMWrNZ+27l57x4cPNV0j3ZePYgS5dcKsEmqr5sY5/oFKxDJ4Po7dMvpWwe/CnN
	 QkRVwQEBzg0uSkPyTU8bCE5Ip/YGkrCs1S54UkBt6Wv56r2IR5YijOwJW/6rdT8f2S
	 RYeHiZBE/Ay58QaXG35APIVlIQFGnJUBFPg71kkY=
Date: Fri, 20 Nov 2026 08:01:37 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: cve@kernel.org, Sasha Levin <sashal@kernel.org>,
	"io-uring@vger.kernel.org" <io-uring@vger.kernel.org>
Subject: Re: proposed io_uring CVEs for 7.3.2
Message-ID: <2026112052-pregame-unhappy-c941@gregkh>
References: <oMhla8VwCWoihfrmgn8znIy60W1QXI8g_v2OyB9i6sWESIDlVJlwoGGOLylJgIHRARNoieXUVRGqzeB__KvHMdXgnCfPPovs8vLMOzaMPEw=@rebasedinc.com>
 <draft-agent5-0001-re-eventfd-signal@kernel.org>
 <5d92861f-9a4d-4810-8700-b9e457ed9c86@kernel.dk>
 <2026111605-deskbound-clobber-a4a1@gregkh>
 <07947062-2974-4630-90db-1556e25b50bb@kernel.dk>
 <2026111722-unfocused-ride-065c@gregkh>
 <2026111949-tinker-symptom-4279@gregkh>
 <535342d8-604f-45dd-968a-0fac8223acbc@kernel.dk>
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
In-Reply-To: <535342d8-604f-45dd-968a-0fac8223acbc@kernel.dk>

On Thu, Nov 19, 2026 at 10:39:40AM -0700, Jens Axboe wrote:
> On 11/19/26 7:19 AM, Greg Kroah-Hartman wrote:
> > On Tue, Nov 17, 2026 at 08:42:31AM +0100, Greg Kroah-Hartman wrote:
> >> How about we make the "rule" that we don't assign any kernel CVEs to
> >> io_uring things unless you ask for us to?  We do this already with the
> >> xen portions of the kernel, but it requires you to remember to ask us
> >> for an id "manually" if you want one.
> > 
> > Along these lines, here is a list of git ids that our initial review
> > pass marked as "should be given a CVE id".  Any opinions on how far off
> > it is, and if we should assign these or not?
> 
> Thanks for sending these!
> 
> >   3de16279b43d io_uring: defer foreign io-wq enqueues to task_work

CVE-2026-99798

> >   360395e8dbf9 io_uring/sqpoll: don't wait for the thread to exit

CVE-2026-99799

> >   9f5315d3f436 io_uring: free the task context after a grace period

CVE-2026-99800

> >   8543a39f03db io_uring/bpf-ops: clear bpf_ctx while submitting SQEs

CVE-2026-99801

> Agree.
> 
> >   51bab09b7ca1 io_uring: free XArray nodes left by a failed store
> 
> Don't agree, it's a small memcg charged leak, and requires mem allocation
> failures.
> 
> >   0b34e7b20a48 io_uring: charge tctx nodes and personalities
> 
> Doubtful, unless we're strict on memcg violations are a CVE, as I'm
> sure there are tons of ways to do that right now in a bunch of
> kernel code.
> 
> >   075d5837bafc io_uring/rsrc: charge buffer arrays and nodes to memcg
> 
> Same as above.
> 
> >   4a93427e99a8 io_uring/register: enforce per-task restrictions in io_uring_register_blind()

CVE-2026-99802

> >   e66907c3ba22 io_uring/net: mask socket type with SOCK_TYPE_MASK in io_socket_bpf_populate()

CVE-2026-99803

> >   37e425460b7c io_uring/io-wq: save worker type before dropping its reference

CVE-2026-99804

> 
> Agree.
> 
> >   b42c85c20d84 exec: cancel io_uring requests before de_thread()
> 
> Reject, ordering cleanup.

Rejected

> 
> >   3eff68bce255 io_uring/futex: allocate private hash before waiting
> >   5cb049d2203d io_uring: don't lose a cancel as io-wq parks a request
> >   8257f6ec45ee io_uring: don't lose the DEFER_TASKRUN wake up
> 
> 
> Reject, it's just an application side problem.

All now rejected, thanks!

greg k-h
