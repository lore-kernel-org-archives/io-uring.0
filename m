Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B05387350
	for <io-uring@vger.kernel.org>; Tue, 21 Apr 2026 17:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776791351; cv=none; b=XTV/jYTxRiorbD/kt6WdLfM7aar1y4MkpFcS/Cucyhm48dbRuwtbE7jZJvbDsEuF4eB8OKLxswSGcfI+lbqJ70F1ffMuQgCZcAZ/ZaOaXxhJfu9jmF/13reRcN2MKaOAaWG7LdiNx5GDtL8mSDsTXuqywNOTOMPR5JWQ6RjSNUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776791351; c=relaxed/simple;
	bh=keUunB8Qq7lB/+MrNYc1NfMP/4BvZfyhQ3k+lokbnHo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MLdBj3XFBiwVrVHByntdGbCkWOt5QqTpciPl/ofiHFunwojKfLrUhMDN2A69m/8aaVREw9KGKMB/+28k26Efm1Ao5LqyIyawNebAJ7yxTuO3z+utkquxyZzUcsWRL1HL6Vr9XtIDksZ5itNNIds3DYGARPxMZBt6wOo6Pb8FDOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MQRuFd0b; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nwHz/TAZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MQRuFd0b; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nwHz/TAZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MQRuFd0b";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nwHz/TAZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MQRuFd0b";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nwHz/TAZ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 832F46A800;
	Tue, 21 Apr 2026 17:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776791346; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sYBCzPFe2lVf82Nb1bHAkEM/CjYl1U/UJNWfsmCF9/c=;
	b=MQRuFd0bx7LXrp/wnPRvsk8NbZ/XBbow25fqDCmDtg7FInzHByyw5OxMrrChyxuLDD/6IK
	TZmfbkI71Vqm9jBSHA1Lw1fe+W2LXffqTSTdsz4AeOBPndkQEecaXkCCdBbt8p2daWRf0F
	mAF/JQSkL5bGuQEzEtrVn8FTG7StKQ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776791346;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sYBCzPFe2lVf82Nb1bHAkEM/CjYl1U/UJNWfsmCF9/c=;
	b=nwHz/TAZ4nfmvbJrnfpkDWSh8thlg0pr4w/wMyGy5wc/rIBu1/eFpLPF6BSMzxLvYECmPS
	Y3xql1t784ORKmDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MQRuFd0b;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="nwHz/TAZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776791346; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sYBCzPFe2lVf82Nb1bHAkEM/CjYl1U/UJNWfsmCF9/c=;
	b=MQRuFd0bx7LXrp/wnPRvsk8NbZ/XBbow25fqDCmDtg7FInzHByyw5OxMrrChyxuLDD/6IK
	TZmfbkI71Vqm9jBSHA1Lw1fe+W2LXffqTSTdsz4AeOBPndkQEecaXkCCdBbt8p2daWRf0F
	mAF/JQSkL5bGuQEzEtrVn8FTG7StKQ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776791346;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sYBCzPFe2lVf82Nb1bHAkEM/CjYl1U/UJNWfsmCF9/c=;
	b=nwHz/TAZ4nfmvbJrnfpkDWSh8thlg0pr4w/wMyGy5wc/rIBu1/eFpLPF6BSMzxLvYECmPS
	Y3xql1t784ORKmDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 30CD4593AF;
	Tue, 21 Apr 2026 17:09:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gOQRATKv52mXZgAAD6G6ig
	(envelope-from <krisman@suse.de>); Tue, 21 Apr 2026 17:09:06 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org
Subject: Re: [PATCH 2/6] io_uring/rsrc: unify nospec indexing for direct
 descriptors
In-Reply-To: <20260421135626.581917-3-axboe@kernel.dk> (Jens Axboe's message
	of "Tue, 21 Apr 2026 07:51:39 -0600")
References: <20260421135626.581917-1-axboe@kernel.dk>
	<20260421135626.581917-3-axboe@kernel.dk>
Date: Tue, 21 Apr 2026 13:09:00 -0400
Message-ID: <877bq0qlzn.fsf@mailhost.krisman.be>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,kernel.dk:email,suse.de:dkim,suse.de:email]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 832F46A800

Jens Axboe <axboe@kernel.dk> writes:

> For file updates, the node reset isn't capping the value via
> array_index_nospec() like the other paths do. Ensure it's all sane and
> have the update path do the proper capping as well.
>
> Signed-off-by: Jens Axboe <axboe@kernel.dk>

Reviewed-by: Gabriel Krisman Bertazi <krisman@suse.de>

> ---
>  io_uring/rsrc.c | 3 +++
>  io_uring/rsrc.h | 9 +++++++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
> index fd36e0e319a2..c042054c3b5f 100644
> --- a/io_uring/rsrc.c
> +++ b/io_uring/rsrc.c
> @@ -238,6 +238,9 @@ static int __io_sqe_files_update(struct io_ring_ctx *ctx,
>  			continue;
>  
>  		i = up->offset + done;
> +		if (i >= ctx->file_table.data.nr)
> +			break;
> +		i = array_index_nospec(i, ctx->file_table.data.nr);

>  		if (io_reset_rsrc_node(ctx, &ctx->file_table.data, i))
>  			io_file_bitmap_clear(&ctx->file_table, i);
>  
> diff --git a/io_uring/rsrc.h b/io_uring/rsrc.h
> index cff0f8834c35..44e3386f7c1c 100644
> --- a/io_uring/rsrc.h
> +++ b/io_uring/rsrc.h
> @@ -109,10 +109,15 @@ static inline void io_put_rsrc_node(struct io_ring_ctx *ctx, struct io_rsrc_node
>  }
>  
>  static inline bool io_reset_rsrc_node(struct io_ring_ctx *ctx,
> -				      struct io_rsrc_data *data, int index)
> +				      struct io_rsrc_data *data,
> +				      unsigned int index)
>  {
> -	struct io_rsrc_node *node = data->nodes[index];
> +	struct io_rsrc_node *node;
>  
> +	if (index >= data->nr)
> +		return false;
> +	index = array_index_nospec(index, data->nr);
> +	node = data->nodes[index];
>  	if (!node)
>  		return false;
>  	io_put_rsrc_node(ctx, node);

-- 
Gabriel Krisman Bertazi
