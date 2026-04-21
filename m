Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBB7387363
	for <io-uring@vger.kernel.org>; Tue, 21 Apr 2026 17:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776791470; cv=none; b=jjBkmnWYhEFT9tZnNFG5fNjv5F1KUXol8M89VgA1G/hOspgeG9xpbmFWNl9kfRhhK0hEwn6aMw+RbxmPuhyuqfYbYeM1a/i4AYnX0eHhNuky3EA9vTIJrssSA4hzY3I+NcPQ/UahcZqbBzHeXLbyfC/tUu0dmLQtqrLgiTFQvT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776791470; c=relaxed/simple;
	bh=ZFQImw2Y6T1X9IFn3sQZunHOZT4pQ2RLz6rwk3K9pY0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=a4IHPnroolkQtkvkbSKbpejqgC6Kfd03sbtgjiR34Bqq3TUo5G4zhItLsV2yekWBNFt/rSnzjUL83tvG/7kFJ/kvpgPXC+ZNMCAvuMY921Nt89wgWaXzDbnIPbuZZjXOnwTqPwq+a6QcfjxzqxuXEmCS42A3271mV/MDPRNanaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=b+EOAm7V; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZDN+7kCW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=q4JcVLfZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ddmvskWI; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="b+EOAm7V";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZDN+7kCW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="q4JcVLfZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ddmvskWI"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CB7BD5BCD2;
	Tue, 21 Apr 2026 17:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776791466; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N0ZFe6NzqJpAUyFfMTukHvy2m5VxW55I/FZiGjdqCqY=;
	b=b+EOAm7VDKfTucWq0b0pgPzM9KPZW9G2sdbH7BCCoKrkufuBMVF6sF5SCiBrF4L2Z5MyxN
	UaGZjAxmcZy+1A/hgBwdQgyLOkgCEytzPcnwtPqe4/QeWdC0lSbVK65oEzk7M6f5qovxvp
	wbiHJuE/qU8/AkzFx4cduF2XYI/nMng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776791466;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N0ZFe6NzqJpAUyFfMTukHvy2m5VxW55I/FZiGjdqCqY=;
	b=ZDN+7kCWgNIqLGCtblYDQxRc3sm3sK7j6+LGv1BPO3lIs+YCwD35bQazj0pcMO0R38D/Oi
	Age1BPqkcdpFvXCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776791465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N0ZFe6NzqJpAUyFfMTukHvy2m5VxW55I/FZiGjdqCqY=;
	b=q4JcVLfZlHFqCCklAd+nsh7ZKnNy/8/6ycG4uB+eL96ys5VCRV/NmyvcVmThJL7mgzolO8
	gwbB2exp+MCC0Q68eGlSy5nvlm4jXdqDkjXbIjQR619+7MI1XyJZYuKyU/A9kVvnKVKkw+
	2MNtzRG0OI+KXA+wA6dWxrVcBrI9vkA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776791465;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N0ZFe6NzqJpAUyFfMTukHvy2m5VxW55I/FZiGjdqCqY=;
	b=ddmvskWIUcngGeG0GsSYizUFXFKZDAfdCPaG6itX8niLvrqheTzrAeYgOTePtY80+6pdG0
	SVh9is2Y+ZOxT1BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7B4B0593AF;
	Tue, 21 Apr 2026 17:11:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XSUFEqmv52m7aAAAD6G6ig
	(envelope-from <krisman@suse.de>); Tue, 21 Apr 2026 17:11:05 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org
Subject: Re: [PATCH 4/6] io_uring/rw: add defensive hardening for negative
 kbuf lengths
In-Reply-To: <20260421135626.581917-5-axboe@kernel.dk> (Jens Axboe's message
	of "Tue, 21 Apr 2026 07:51:41 -0600")
References: <20260421135626.581917-1-axboe@kernel.dk>
	<20260421135626.581917-5-axboe@kernel.dk>
Date: Tue, 21 Apr 2026 13:10:59 -0400
Message-ID: <87340oqlwc.fsf@mailhost.krisman.be>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-4.29 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.19)[-0.971];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,kernel.dk:email,suse.de:email]
X-Spam-Flag: NO
X-Spam-Score: -4.29
X-Spam-Level: 

Jens Axboe <axboe@kernel.dk> writes:

> No real bug here, just being a bit defensive in ensuring that whatever
> gets passed into io_put_kbuf() is always >= 0 and not some random error
> value.
>
> Signed-off-by: Jens Axboe <axboe@kernel.dk>
> ---
>  io_uring/rw.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/io_uring/rw.c b/io_uring/rw.c
> index 20654deff84d..e729e0e7657e 100644
> --- a/io_uring/rw.c
> +++ b/io_uring/rw.c
> @@ -580,7 +580,7 @@ void io_req_rw_complete(struct io_tw_req tw_req, io_tw_token_t tw)
>  	io_req_io_end(req);
>  
>  	if (req->flags & (REQ_F_BUFFER_SELECTED|REQ_F_BUFFER_RING))
> -		req->cqe.flags |= io_put_kbuf(req, req->cqe.res, NULL);
> +		req->cqe.flags |= io_put_kbuf(req, max(req->cqe.res, 0), NULL);
>  
>  	io_req_rw_cleanup(req, 0);
>  	io_req_task_complete(tw_req, tw);
> @@ -1379,7 +1379,7 @@ int io_do_iopoll(struct io_ring_ctx *ctx, bool force_nonspin)
>  		list_del(&req->iopoll_node);
>  		wq_list_add_tail(&req->comp_list, &ctx->submit_state.compl_reqs);
>  		nr_events++;
> -		req->cqe.flags = io_put_kbuf(req, req->cqe.res, NULL);
> +		req->cqe.flags = io_put_kbuf(req, max(req->cqe.res, 0), NULL);
>  		if (!io_is_uring_cmd(req))
>  			io_req_rw_cleanup(req, 0);
>  	}

Much more readable if it were rolled as an early return inside io_put_kbuf, but clearly:

Reviewed-by: Gabriel Krisman Bertazi <krisman@suse.de>

-- 
Gabriel Krisman Bertazi
