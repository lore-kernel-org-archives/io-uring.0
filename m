Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EC2478849
	for <io-uring@vger.kernel.org>; Tue, 14 Jul 2026 14:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784037710; cv=none; b=NPath96kuvZLHw7JT0ofd4j3IWB6O/Bu7aAkE32abUHNU14ZkGO15rftT6MHGM3VBZV7HGps6y9GxIG8whPPKlJBweboSdTu6dO6rMrTt6s/cvoBypD2Cv03Pn3zgcGZbY51hWOibd4iYtrqqRX0KGFnT8D5yQ2PjZoDck8GPe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784037710; c=relaxed/simple;
	bh=d5rXtoBDDAI5duWs54W6VOaSTQSeRRgV/Qi/Nf0GpMk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=o06iqcH1sF4YlpmQp7/UqNaIJMMRPKddQojjbfDybnCL+LXNyalTl6YAj721BloPcBC+id61XESZmrmd/78VISsfsUc/CtdfxpUTUMlhmv04yk9xttx+0w4FsMyRKPFilPdNR08pxnRLnohaifglLb/aLbPi/ue/9t56kwX755c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RH+/3+w4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mP5F9Ex7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sULRFWOd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pqztVkl0; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RH+/3+w4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mP5F9Ex7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sULRFWOd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pqztVkl0"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A36E73E24;
	Tue, 14 Jul 2026 14:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784037702; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XqqCsczDCKxcdm1Z9Ju0u2Z+wuxkAp64mFhibAKdJTk=;
	b=RH+/3+w4z8q24+Wqb5mRyU0juY6uED3bkw3ULKiPN3M+raP+kAY/rXFv9QymobyQ1158bH
	3HThgZ2EqixhAOX+USjnHi0BywCeerpRRF7y2ftosZeR3ivGPx0wQDfg+1DGn7BHJKng/K
	8LYpE+KjJUetpKImrnbgUe+wq5pwQB4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784037702;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XqqCsczDCKxcdm1Z9Ju0u2Z+wuxkAp64mFhibAKdJTk=;
	b=mP5F9Ex7e7oyYz5mYsFI1zXLeiCis7pOZ9qu63+9/BgL+45H719ZBNj2jFGZXUHpJ1I3gq
	/D7yFJaq9ieiH/DA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784037698; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XqqCsczDCKxcdm1Z9Ju0u2Z+wuxkAp64mFhibAKdJTk=;
	b=sULRFWOdp2vZR44tDvuRA8aCfUIV/4zcgsvcWwhrCX8OGyAoVMFXGpFexRIG2ceVPMT6bq
	yhs7TNzfHDiMdnBoCdczGV007/1gY6MvKtrCpSmJqMmmt6aydSGE4KFjDQQJj/8+Ipvl+U
	9aNRidf4xbSqSdPiwob0nYsS5f9qoUE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784037698;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XqqCsczDCKxcdm1Z9Ju0u2Z+wuxkAp64mFhibAKdJTk=;
	b=pqztVkl0xfWCFcLSWu6wXesv1RagvLG8nryeyWUgy1uTfOqPO+taEZ91nV9wiIf0ZV934E
	p2qsLnSStA96u+Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 58342779AE;
	Tue, 14 Jul 2026 14:01:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nlbTDkJBVmqRfwAAD6G6ig
	(envelope-from <krisman@suse.de>); Tue, 14 Jul 2026 14:01:38 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Breno Leitao <leitao@debian.org>, Jens Axboe <axboe@kernel.dk>, Hao-Yu
 Yang <naup96721@gmail.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH] io_uring/kbuf: fix use-after-free of new iovec on
 bundle grow
In-Reply-To: <20260713-io_uring_dangling-v1-1-b9bdc0f0e776@debian.org>
Organization: SUSE
References: <20260713-io_uring_dangling-v1-1-b9bdc0f0e776@debian.org>
Date: Tue, 14 Jul 2026 10:01:28 -0400
Message-ID: <87ldbd4qmf.fsf@mailhost.krisman.be>
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
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MISSING_XM_UA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[debian.org,kernel.dk,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailhost.krisman.be:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Score: -4.30

Breno Leitao <leitao@debian.org> writes:

> When io_ring_buffers_peek() grows a provided-buffer bundle, it allocates
> a new iovec array and points arg->iovs at it. The KBUF_MODE_FREE cleanup
> added at the end of the function then does kfree(arg->iovs), which frees
> this freshly allocated array that is about to be returned to and used by
> the caller, instead of the old cached iovec (org_iovs) it was meant to
> release. The caller reads the now-freed array, resulting in a
> use-after-free, easily triggered by the liburing recv-bundle-short-ooo
> test:
>
>   BUG: KASAN: slab-use-after-free in io_recv+0x4bc/0xc60
>   Read of size 8 at addr ffff00037b20c240 by task recv-bundle-sho
>    io_recv
>   Allocated by task:
>    __kmalloc_noprof
>    io_ring_buffers_peek
>    io_buffers_peek
>    io_recv
>   Freed by task:
>    kfree
>    io_ring_buffers_peek
>    io_buffers_peek
>    io_recv
>
> Free org_iovs instead, and only when it was actually replaced by a new
> allocation. On the access_ok() failure path the new array is already
> freed and the request is left pointing at the original iovec, so nothing
> needs to be released at this point in that case.
>
> Fixes: cd053d788c3f ("io_uring: fix dangling iovec after provided-buffer bundle grow failure")
> Signed-off-by: Breno Leitao <leitao@debian.org>

Already fixed here

https://lore.kernel.org/io-uring/20260712142612.188695595-iostreampy@proton.me/T/#u

here:

https://lore.kernel.org/io-uring/OS3PR01MB8810F38D613E37FBD684DC4D83FB2@OS3PR01MB8810.jpnprd01.prod.outlook.com/T/#t

and here:

https://lore.kernel.org/io-uring/20260713183124.4217-1-doruk@0sec.ai/T/#u

Aren't LLMs fun?

-- 
Gabriel Krisman Bertazi
