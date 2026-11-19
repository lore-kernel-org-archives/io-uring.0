Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097975;
	b=tXHBfj3qclfPoo+4mxNuHTMcxaEJeWCjoLtazfaU6VUqMipo202/uGW8Zls3lsv48eKn
	 X9mv43LV/G5HCzZ6eCd7BGTB5wuk7gjPNoQR1vdCZsloyoTEx0CNNEQvYhQxn6U+u7R17
	 +KoxIeO2wgBHU2ZyJf0gy0fNKLQZXiO5rltymjpQoZSk6tY/9whQcS2np1xPg41ujD/09
	 eRm6JB2+wHf7FT4qyu7xWAK4JTnMoa6TEzoT3dt46TsY//QYkJLykyrG61kbApcgBDeyK
	 DgdjJcuVJHguFiSPALK7cdSNpFi8R4wyQTu1Koi0RJAq6poEPeD8EPHtV2b4Bb5FUvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097975;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=OWQgEMiN7tQ3F6zoo1Q6FEnzclgjen9HfwvpL2Dh68U=;
	b=luWGtN+A+Wa36jpUKS6jo1erok7HqXb9mdmyOLU3T8o9j1WR2tts4DquJySXt2rVY/FR
	 0y1ZHzy2NkiNooo4XZfeXYG/1ZAKGnlIMN1V2PJ09NJqRCYYu2hCLA+kohuxNRhN4W1Kd
	 f3pnyROf92ejWhoXuef4t30JUj7Jla2tUTE+RyiutfGwXIr+VmshTkeGbUC49Ocw2Tuab
	 0Hmdq5jKAt566VoxaL/H8r2RQ6VA9FLzTo6eSIrZWi9qZjRVW3ZBWQYNVNI3xt3ly3HUB
	 cvJZ0Z3rPX4P0NxTyMYqdByAvEmUo80MujAIcwjDZRA+EWpHrom4qQ2vY99n0jG/jJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="oHm97/DY";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08210606A326
	for <io-uring@vger.kernel.org>; Thu, 19 Nov 2026 14:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=oHm97/DY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABE001F00936;
	Thu, 19 Nov 2026 14:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795097974;
	bh=OWQgEMiN7tQ3F6zoo1Q6FEnzclgjen9HfwvpL2Dh68U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oHm97/DYnjaOT5nltAO2dDZDH1TOq+ZEuDOqLGGgd/uVNhBQi/S1S3sxhEbqWhzIx
	 NM98hgRJAyo7i2dUwuQlJfltWSp9bUXGF2Tq8vmrw6QunCPhOn6dds6LBu/BtJg46M
	 L4YtMr12crsgQiA5RQsA/bfU7IdISdbcMAVAfcd8=
Date: Thu, 19 Nov 2026 15:19:28 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jens Axboe <axboe@kernel.dk>, cve@kernel.org
Cc: Sasha Levin <sashal@kernel.org>,
	"io-uring@vger.kernel.org" <io-uring@vger.kernel.org>
Subject: proposed io_uring CVEs for 7.3.2
Message-ID: <2026111949-tinker-symptom-4279@gregkh>
References: <oMhla8VwCWoihfrmgn8znIy60W1QXI8g_v2OyB9i6sWESIDlVJlwoGGOLylJgIHRARNoieXUVRGqzeB__KvHMdXgnCfPPovs8vLMOzaMPEw=@rebasedinc.com>
 <draft-agent5-0001-re-eventfd-signal@kernel.org>
 <5d92861f-9a4d-4810-8700-b9e457ed9c86@kernel.dk>
 <2026111605-deskbound-clobber-a4a1@gregkh>
 <07947062-2974-4630-90db-1556e25b50bb@kernel.dk>
 <2026111722-unfocused-ride-065c@gregkh>
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
In-Reply-To: <2026111722-unfocused-ride-065c@gregkh>

On Tue, Nov 17, 2026 at 08:42:31AM +0100, Greg Kroah-Hartman wrote:
> How about we make the "rule" that we don't assign any kernel CVEs to
> io_uring things unless you ask for us to?  We do this already with the
> xen portions of the kernel, but it requires you to remember to ask us
> for an id "manually" if you want one.

Along these lines, here is a list of git ids that our initial review
pass marked as "should be given a CVE id".  Any opinions on how far off
it is, and if we should assign these or not?

  3de16279b43d io_uring: defer foreign io-wq enqueues to task_work
  360395e8dbf9 io_uring/sqpoll: don't wait for the thread to exit
  9f5315d3f436 io_uring: free the task context after a grace period
  8543a39f03db io_uring/bpf-ops: clear bpf_ctx while submitting SQEs
  51bab09b7ca1 io_uring: free XArray nodes left by a failed store
  0b34e7b20a48 io_uring: charge tctx nodes and personalities
  075d5837bafc io_uring/rsrc: charge buffer arrays and nodes to memcg
  4a93427e99a8 io_uring/register: enforce per-task restrictions in io_uring_register_blind()
  e66907c3ba22 io_uring/net: mask socket type with SOCK_TYPE_MASK in io_socket_bpf_populate()
  37e425460b7c io_uring/io-wq: save worker type before dropping its reference
  b42c85c20d84 exec: cancel io_uring requests before de_thread()
  3eff68bce255 io_uring/futex: allocate private hash before waiting
  5cb049d2203d io_uring: don't lose a cancel as io-wq parks a request
  8257f6ec45ee io_uring: don't lose the DEFER_TASKRUN wake up

thanks,

greg k-h

