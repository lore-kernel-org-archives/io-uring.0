Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89014A3402;
	Tue, 14 Jul 2026 16:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784044875; cv=none; b=K48MHwGvcJo2LN8PRQn+ALQiJp5HV7tiDgPA2NjL+e0WnPLTTxP4vs/vqGgoCTAecNfclzcWypQNTXHuXDq3+gL4iE1Qh1NPEC5/pcWMhRA/GK6m395K9wsHGQkHanFr8CbVz/zoUDf0HVS24t3UF1r9BmcMFWg88jvrEj31SdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784044875; c=relaxed/simple;
	bh=Dflg4RuS8cdAcqLiYWeKMRhkljYoWt2fwG0mrTWTQhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZZmV5RyHoHjBDKpY3kE+HeGEtYSEEu1E5ldndvBMB2WR7rX8o0+gNMJH/SMahTR7WrMHCyXCeusHJXjev9MpgrAs7A70OAmPzxDTiu7VHP7mWENEO8GSxiPjGCDSJjAc4XoqYxPjAGAf8MD2VP+TSassHGQuJ787AcOM6qCCkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=GqIGYhgw; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="GqIGYhgw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=shHbHgjf9s4Y6CXxOJg9NneQj2YR0xLUO2Y5BLAU4F0=; b=GqIGYhgwBmNyHDTUpRl2hXkj20
	sc3PSKezgJfAzbq5KlhFc6fQ9TVMfkmskYPd2pY8qiLtjCAXgVM4zwapeRo7n+QIAhEkexZFSCG8o
	T66fPZ6I7OjLX4PnAiDC3nSXd7Iq2Fdo1fW4IiCBtUG8ESbYrMag5UZRWOjPk6F2R2p2rcoB6c/j0
	Fzsv/QWenu3RBFijnc7ozT/huWjuG7fgL373o0sfn2s8OgjSZ8vxKueCzd2oLgACORvDITnFLpw0A
	Do7+QIPjRcCRdYckjKI2wgIMwLNP/08S+8SOAcd5o0wzIvZlVtaSvr1ue7QKSlK3MbNiuN+Vh8Gfj
	hdswIIfQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wjfZE-002OFT-21;
	Tue, 14 Jul 2026 16:01:09 +0000
Date: Tue, 14 Jul 2026 09:00:57 -0700
From: Breno Leitao <leitao@debian.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Cc: Jens Axboe <axboe@kernel.dk>, Hao-Yu Yang <naup96721@gmail.com>, 
	io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] io_uring/kbuf: fix use-after-free of new iovec on bundle
 grow
Message-ID: <alZc3lIGYKEiomWI@gmail.com>
References: <20260713-io_uring_dangling-v1-1-b9bdc0f0e776@debian.org>
 <87ldbd4qmf.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ldbd4qmf.fsf@mailhost.krisman.be>
X-Debian-User: leitao

On Tue, Jul 14, 2026 at 10:01:28AM -0400, Gabriel Krisman Bertazi wrote:
> Breno Leitao <leitao@debian.org> writes:
> 
> > When io_ring_buffers_peek() grows a provided-buffer bundle, it allocates
> > a new iovec array and points arg->iovs at it. The KBUF_MODE_FREE cleanup
> > added at the end of the function then does kfree(arg->iovs), which frees
> > this freshly allocated array that is about to be returned to and used by
> > the caller, instead of the old cached iovec (org_iovs) it was meant to
> > release. The caller reads the now-freed array, resulting in a
> > use-after-free, easily triggered by the liburing recv-bundle-short-ooo
> > test:
> >
> >   BUG: KASAN: slab-use-after-free in io_recv+0x4bc/0xc60
> >   Read of size 8 at addr ffff00037b20c240 by task recv-bundle-sho
> >    io_recv
> >   Allocated by task:
> >    __kmalloc_noprof
> >    io_ring_buffers_peek
> >    io_buffers_peek
> >    io_recv
> >   Freed by task:
> >    kfree
> >    io_ring_buffers_peek
> >    io_buffers_peek
> >    io_recv
> >
> > Free org_iovs instead, and only when it was actually replaced by a new
> > allocation. On the access_ok() failure path the new array is already
> > freed and the request is left pointing at the original iovec, so nothing
> > needs to be released at this point in that case.
> >
> > Fixes: cd053d788c3f ("io_uring: fix dangling iovec after provided-buffer bundle grow failure")
> > Signed-off-by: Breno Leitao <leitao@debian.org>
> 
> Already fixed here
> 
> https://lore.kernel.org/io-uring/20260712142612.188695595-iostreampy@proton.me/T/#u
> 
> here:
> 
> https://lore.kernel.org/io-uring/OS3PR01MB8810F38D613E37FBD684DC4D83FB2@OS3PR01MB8810.jpnprd01.prod.outlook.com/T/#t
> 
> and here:
> 
> https://lore.kernel.org/io-uring/20260713183124.4217-1-doruk@0sec.ai/T/#u

Oh, -ETOOMANY fixes.

> Aren't LLMs fun?

Oh yes, It is easier to send the fix than to check in the mailing list
if someone has fixed it already. 
