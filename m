Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B75348C5E
	for <io-uring@vger.kernel.org>; Fri, 17 Jul 2026 16:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784304375; cv=none; b=BOg4FfBoYhPwWTSLIS6j8c8M7MXNDCyEglYEk6tgM+944Qg7Sc2oobp3YZROe99yyJvve0ldYhH5JQoOrwCM9aQ3Bs2poCjuvtL8sBCFj+W595rhc+/sHhV0BYtx8LUkboSH/2W9BRc0XlJwIsxANZ+d1xhkJY3kKBB5fCtzu8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784304375; c=relaxed/simple;
	bh=4FFVb72oYuUTpIDDUdw7WaSuFwl41edb3c24Vp5WeLQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=byJMFziBY7gO8aPurHMnktEJlneVTDnnsN36idnm2fld8l2z04pd6U9rJ4d4CQ+cQA96eQ06LlEmSpKQ2+Pnd66AosJyPJOaI4Tjr7dJfVzOiFuGwa15fc8PH62KRKnZ/spx7YIhyJkH0EGJ8p7FH04kl3HKxGYULypJ8Q+pJ4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0Ki4Qzum; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LktTUPWU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=R2dMtBqJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=y1LQLHg8; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0Ki4Qzum";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LktTUPWU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="R2dMtBqJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y1LQLHg8"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5F80976FCF;
	Fri, 17 Jul 2026 16:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784304371; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5CMsqiWI2gb1XzXDjZO30GbTlr+TFFJpxCkznAxYXks=;
	b=0Ki4Qzum5Nrh6mLho2jcbBQZlMV0ZQIqBtH3Moj+wkwfpo1GABSKoheVV32muGiZI0FTFk
	aoOsSvW7dZBePX5hkyiWz4x331Yo8I7mtJ+jXLHsQcoIKIysfaCY+D8XNfs7vDNXYlrAR4
	Q0/WESk1otqT9+BDp4hIkwQRCBYj+38=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784304371;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5CMsqiWI2gb1XzXDjZO30GbTlr+TFFJpxCkznAxYXks=;
	b=LktTUPWUMhQ+XU1LcO7HwRT+ClJVW75sitLNPrG8JK7MQBZWw/WLCiJPDnR52YiNrmAusD
	c9+uIgrVwjQzq5Dg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=R2dMtBqJ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=y1LQLHg8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784304370; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5CMsqiWI2gb1XzXDjZO30GbTlr+TFFJpxCkznAxYXks=;
	b=R2dMtBqJS8F1XzmXjPgDvCyK6TQ84y6bLeJMssspRZcse3bXPQhR7jNr+UJ1lntwUT8Wmh
	kKYN5rMVt51k9zp++JH4zl7LMdKSSjPiQ7OH4uwl1XUJEx0OkLD/wZ/QrqX8oaSYAwoT3X
	30AQ753KcJiIx0+1o7geZ2O8NAI7+xg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784304370;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5CMsqiWI2gb1XzXDjZO30GbTlr+TFFJpxCkznAxYXks=;
	b=y1LQLHg8qrrnW/h9U6SJDkUf6UkGYTEcP09+7uuvYHO1icImKFMiRCIC8u1w/FHWFWEV4D
	x5X6iIW2eD18NbBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0F2B7779AA;
	Fri, 17 Jul 2026 16:06:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FipfM/FSWmrmfgAAD6G6ig
	(envelope-from <krisman@suse.de>); Fri, 17 Jul 2026 16:06:09 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Woraphat Khiaodaeng <worapat.kd2@gmail.com>, Jens Axboe
 <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>
Cc: io-uring@vger.kernel.org, security@kernel.org, Woraphat Khiaodaeng
 <worapat.kd2@gmail.com>
Subject: Re: [PATCH] io_uring/bpf-ops: reject re-registration of an
 already-bound ops
In-Reply-To: <20260717154537.129736-1-worapat.kd2@gmail.com>
Organization: SUSE
References: <20260717154537.129736-1-worapat.kd2@gmail.com>
Date: Fri, 17 Jul 2026 12:05:53 -0400
Message-ID: <87pl0l7g9q.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 5F80976FCF
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.dk];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Woraphat Khiaodaeng <worapat.kd2@gmail.com> writes:

> io_install_bpf() only rejects a second registration on the ctx side
> (ctx->bpf_ops) and sets the per-map back-pointer ops->priv
> unconditionally. The struct_ops link path never advances a map past
> BPF_STRUCT_OPS_STATE_READY, so the same io_uring_bpf_ops map can be
> registered more than once, and bpf_io_reg() re-resolves the target ring
> via fget(ops->ring_fd) on every call. A caller can therefore point the
> same ring_fd at a different io_ring_ctx between two BPF_LINK_CREATE
> calls.
>
> The second registration passes the ctx->bpf_ops check (the new ctx has
> none) and overwrites ops->priv, orphaning the first ctx. Teardown
> (io_eject_bpf()/bpf_io_unreg()) only reaches a ctx through ops->priv, so
> the orphaned ctx is never torn down: its ctx->loop_step keeps pointing
> into the struct_ops trampoline, which is freed once the map is gone. A
> later io_uring_enter() on the orphaned ring then calls the dangling
> ctx->loop_step from io_run_loop() -- a use-after-free of freed
> executable memory, reachable by a task with CAP_BPF + CAP_PERFMON.
>
> Reject registration when ops->priv is already set, as hid_bpf_reg()
> does for its struct_ops.
>
> Fixes: 98f37634b12b ("io_uring/bpf-ops: implement bpf ops registration")
> Signed-off-by: Woraphat Khiaodaeng <worapat.kd2@gmail.com>

Feel free to add,

Reviewed-by: Gabriel Krisman Bertazi <krisman@suse.de>

can you send a testcase to add to liburing?

> ---
>  io_uring/bpf-ops.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/io_uring/bpf-ops.c b/io_uring/bpf-ops.c
> index 5a50f0675..cf2bd068e 100644
> --- a/io_uring/bpf-ops.c
> +++ b/io_uring/bpf-ops.c
> @@ -168,6 +168,8 @@ static int io_install_bpf(struct io_ring_ctx *ctx, struct io_uring_bpf_ops *ops)
>  
>  	if (ctx->bpf_ops)
>  		return -EBUSY;
> +	if (ops->priv)
> +		return -EBUSY;
>  	if (WARN_ON_ONCE(!ops->loop_step))
>  		return -EINVAL;
>  
> -- 
> 2.43.0
>

-- 
Gabriel Krisman Bertazi
