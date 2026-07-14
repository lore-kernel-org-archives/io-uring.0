Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08A34446E0
	for <io-uring@vger.kernel.org>; Tue, 14 Jul 2026 14:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784037743; cv=none; b=BtEjn8Rp5JQwUEf9jlj8tbyx3Yo5TlAgRcOOFYYFYRx7tsD+6jfeln+4Iwvy/x6inaTsE+2wP+ZACty7wG3adaLTkxe9SQPHZm7EAY594UgeMyoh4IPZCGBkOJCILzgMe45CdILzWpRuco+Mc88qvZDnd43K2pkyy6gD57suIuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784037743; c=relaxed/simple;
	bh=kbT6buJWa9e9WTXfIqFKYYbf5BlOidukN9wkGkXW/Bk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=s28gXT19Qd6eW3HqKo+LXf32dNtIBshOHtqznYPMXAHeWfWypMXn3WSLUh3EillPPmQgPy9b5NikwiCUDGqjx0Sre36VNqCL5XztTiRgBUfgvQ3gqO2VjeQIUmfCCzVcv2jO7+EEMp9oDukcD/8kH+nnD2GU9LZ0aAsWUV5hfG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=J5gtew63; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=25XHiCbR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jRyF6sdH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=e9S09Es3; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="J5gtew63";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="25XHiCbR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jRyF6sdH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="e9S09Es3"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 76DCE3E24;
	Tue, 14 Jul 2026 14:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784037739; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f3JYNQQcEE+kA/SoFOsB6iOTDT7ayOpozzzhtd0ioNI=;
	b=J5gtew63QguoLz7zhRuDqViZxEWSh0aRpbv3u0Dm2EVNssTgHvtWTL/4gBDtksbEjeSevU
	wy2r/GQ/S+6MsKEensFbOYm3OvOfahqgF/ACcII+7h208MSd80WAs+/AL88eZuV5lr0KYD
	vW8dpnEl2cO8lqy5GEKpPhcKzfYyuzM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784037739;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f3JYNQQcEE+kA/SoFOsB6iOTDT7ayOpozzzhtd0ioNI=;
	b=25XHiCbRiFf2qUsrtU2+yCw8SrUQuM0FNNVIyE9M21FcKxhd59gtmJ3Wz4ygeF/WFbTgfJ
	T5AWRhH+y5kr4oDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784037737; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f3JYNQQcEE+kA/SoFOsB6iOTDT7ayOpozzzhtd0ioNI=;
	b=jRyF6sdHIpYcnA4tiZDemtuhmWRfpQ3ppcqQE43JTti/T3uZxzHeerg+rcy5g+ih733xHn
	R7EDsDrMYwAs7zk45OwQsVMxHNUjTmjHYMnysUiOCmujQsI1wsQTcqvRh9MhNGqXmY0YUT
	t8TPSSg/zBf4Rochcia+75drEc/L72M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784037737;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f3JYNQQcEE+kA/SoFOsB6iOTDT7ayOpozzzhtd0ioNI=;
	b=e9S09Es3rlXCV1HV+jVbqG7GvUK2fs255OkwB2e5uENIUfk71/2P++Tx3Knp6iRhb2kGIy
	XIYxr9fjYaOADPDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 26931779AE;
	Tue, 14 Jul 2026 14:02:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id W/HBOGhBVmqDAQAAD6G6ig
	(envelope-from <krisman@suse.de>); Tue, 14 Jul 2026 14:02:16 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Doruk Tan Ozturk <doruk@0sec.ai>, axboe@kernel.dk
Cc: io-uring@vger.kernel.org, Doruk Tan Ozturk <doruk@0sec.ai>
Subject: Re: [PATCH] io_uring/kbuf: free the old cached iovec, not the
 returned one, on bundle grow
In-Reply-To: <20260713183124.4217-1-doruk@0sec.ai>
Organization: SUSE
References: <20260713183124.4217-1-doruk@0sec.ai>
Date: Tue, 14 Jul 2026 10:02:11 -0400
Message-ID: <87ik6h4ql8.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	HAS_ORG_HEADER(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailhost.krisman.be:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Score: -4.30

Doruk Tan Ozturk <doruk@0sec.ai> writes:

> Commit cd053d788c3f ("io_uring: fix dangling iovec after provided-buffer
> bundle grow failure") moved the KBUF_MODE_FREE kfree() out of the expand
> branch to after the validation loop, so the old cached iovec is only
> released once the new buffers have been validated. However, by the time
> control reaches the post-loop free, arg->iovs has already been reassigned
> in the expand branch to the freshly allocated array that is about to be
> returned to the caller:
>
> 	iov = kmalloc_objs(struct iovec, nr_avail);
> 	...
> 	arg->iovs = iov;		/* now the array we return */
> 	...
> 	if (arg->mode & KBUF_MODE_FREE)
> 		kfree(arg->iovs);	/* ... but this frees it */
>
> On a successful grow, io_ring_buffers_peek() therefore frees the very
> iovec array it returns. io_recv_buf_select() then builds an iov_iter over
> that freed array and caches it in kmsg->vec.iovec, giving a
> slab-use-after-free read during the recv copy and a later double free of
> the iovec array on request cleanup. The array is a kmalloc() whose size is
> controlled by the number of ring buffers the caller commits, so the freed
> object lands in an attacker-influenced kmalloc cache.
>
> KBUF_MODE_FREE is meant to release the *old* cached iovec once it has been
> replaced by a larger one. Free the captured org_iovs instead, and only
> when a grow actually happened (arg->iovs != org_iovs) so the no-grow case
> still returns the reused array. The -EFAULT failure path already frees the
> new array and leaves org_iovs for the caller, so it is unaffected.
>
> Reproduced on next-20260710 with KASAN by an unprivileged IORING_OP_RECV
> using IORING_RECVSEND_BUNDLE over a provided-buffer ring: a first
> (expanding) bundle caches a small iovec, and an in-request bundle retry
> grows again under KBUF_MODE_FREE, triggering both the UAF read and the
> double free. The change eliminates the KASAN splat.
>
> Fixes: cd053d788c3f ("io_uring: fix dangling iovec after provided-buffer bundle grow failure")
> Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>

Already fixed here

https://lore.kernel.org/io-uring/20260712142612.188695595-iostreampy@proton.me/T/#u

here:

https://lore.kernel.org/io-uring/OS3PR01MB8810F38D613E37FBD684DC4D83FB2@OS3PR01MB8810.jpnprd01.prod.outlook.com/T/#t

and here:

https://lore.kernel.org/io-uring/20260713-io_uring_dangling-v1-1-b9bdc0f0e776@debian.org/T/#u

Aren't LLMs fun?

-- 
Gabriel Krisman Bertazi
