Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4898345EB4;
	Fri, 14 Aug 2026 16:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786726270; cv=none; b=MSpEjfBlov/Nmk5Y1i/8t26UCjG+ZXbQi6zIpfqc+iZ4zWCVlxPlCBVC0d4U9sZXxSq2ZGOzuBAYca3FxM2E15bi81Kg5HvpZ1u82I54zdyScU247dnvFC34VJKE2xSuY79kewTQqqiLMw5OmXLftqTg/ua5U1iUAqC3E7TI+LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786726270; c=relaxed/simple;
	bh=NaKJn8LtWDEyX2zV6MXZMcBZ0OF2tFH1w7dLB9b1y4s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZG3k+YXHizR1CJUXd1hsVx/E21SeQaFHsCQu/ofVv1yTof2qV5lZH3C45BavBv7MBeL64acTiX1h9uDyq9hlA6Z/wbFgr4xEUnFUni7iSHyl9/bKd005hwT8WAm5XhjHrggkEaCxSEw1W5cez69HSBVKd/wt0WZE8sq+3lrfrSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vt8XaQVB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0hEel8kI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ilz82rGV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7ZcXcUIA; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vt8XaQVB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0hEel8kI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ilz82rGV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7ZcXcUIA"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6399B420A;
	Fri, 14 Aug 2026 16:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786726262; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hernqaU0AnFSaJqE+6NRb0db39ENFV0twInGAuDN8so=;
	b=vt8XaQVBZSfmbnhH/BcjdEHZnMzuYdhx9nTfoLJJMh/4pCWJ5HqjWtWBur+xv1t6reYzLa
	Q0+mhaMt63CMgqF4uF+s87uvkx8jVF76WK1nR+XsAcY+w/JmnDkEasASEpXxJfORxDqmL7
	OxkXzamCyYbuYs6Epaada0lkBpOD9QU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786726262;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hernqaU0AnFSaJqE+6NRb0db39ENFV0twInGAuDN8so=;
	b=0hEel8kIEvZ9q7j33G58BsruYI3AafVfdb+urLZSDka1EUwrhLAf77Oia5iseqw+3UboJZ
	zEm3lXlpJN8wIyAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ilz82rGV;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7ZcXcUIA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786726258; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hernqaU0AnFSaJqE+6NRb0db39ENFV0twInGAuDN8so=;
	b=ilz82rGVuO2dKuao9NFzEL0JsE0V2VV6J/KHOfD1LwTOQhopk21PK7BerMZSsU9BtCvJlu
	fFVcnezdlnoz7AhhDa1vOpXKoO58LaJElvUBoFnMWqt8aHDk7yDPtNSRjHEYdeLC1vbtLj
	ZRxr5N7Q9tc+arM7E8NQdwknosCCrh0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786726258;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hernqaU0AnFSaJqE+6NRb0db39ENFV0twInGAuDN8so=;
	b=7ZcXcUIAVgchKn39n1bWjHaIhtATq4Q2D87du0EYnOzqzbfapiH8u1YrqbfpHUfFQ4vQcb
	q0jzW6tJViWevpCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 12B467849E;
	Fri, 14 Aug 2026 16:50:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UrNyOXFHf2pGDQAAD6G6ig
	(envelope-from <krisman@suse.de>); Fri, 14 Aug 2026 16:50:57 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Sidong Yang <sidong.yang@furiosa.ai>, io-uring@vger.kernel.org
Cc: Sidong Yang <sidong.yang@furiosa.ai>, Pavel Begunkov
 <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] io_uring/bpf-ops: wake up the loop task on eject
In-Reply-To: <20260814030421.61216-1-sidong.yang@furiosa.ai>
Organization: SUSE
References: <20260814030421.61216-1-sidong.yang@furiosa.ai>
Date: Fri, 14 Aug 2026 12:50:52 -0400
Message-ID: <87se4g4peb.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 6399B420A
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[furiosa.ai,gmail.com,kernel.dk,vger.kernel.org];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[furiosa.ai:email,mailhost.krisman.be:mid,suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Sidong Yang <sidong.yang@furiosa.ai> writes:

> io_eject_bpf() clears ctx->loop_step while a loop may be sleeping in
> io_loop_wait(), which releases ->uring_lock before schedule(). Nothing
> wakes the submitter task after the BPF ops are unregistered through link
> destruction or ring teardown, so the task stays blocked in
> io_uring_enter() until an unrelated CQE event or signal arrives.
>
> Since BPF ops require IORING_SETUP_DEFER_TASKRUN, only
> ctx->submitter_task can run the loop, so wake it directly. The loop
> rechecks loop_step after waking up and exits with -EFAULT. A spurious
> wakeup is harmless because io_loop_wait() rechecks the wait condition
> before sleeping again.
>
> Fixes: 98f37634b12b ("io_uring/bpf-ops: implement bpf ops registration")
> Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>

Makes sense, feel free to add:

Reviewed-by: Gabriel Krisman Bertazi <krisman@suse.de>

> ---
>  io_uring/bpf-ops.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/io_uring/bpf-ops.c b/io_uring/bpf-ops.c
> index 5a50f0675fe5..87148dbd3b3e 100644
> --- a/io_uring/bpf-ops.c
> +++ b/io_uring/bpf-ops.c
> @@ -210,6 +210,13 @@ static void io_eject_bpf(struct io_ring_ctx *ctx)
>  	ops->priv = NULL;
>  	ctx->bpf_ops = NULL;
>  	ctx->loop_step = NULL;
> +	/*
> +	 * A loop may be sleeping in io_loop_wait() with ->uring_lock
> +	 * released. It'll see loop_step == NULL after waking up, but
> +	 * nothing wakes it otherwise.
> +	 */
> +	if (ctx->submitter_task)
> +		wake_up_state(ctx->submitter_task, TASK_INTERRUPTIBLE);
>  }
>  
>  static void bpf_io_unreg(void *kdata, struct bpf_link *link)
> -- 
> 2.53.0
>

-- 
Gabriel Krisman Bertazi
