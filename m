Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AA04483BF
	for <io-uring@vger.kernel.org>; Tue, 15 Sep 2026 19:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789501463; cv=none; b=IhaW3olJFxP9sAkWH4LATc+BDIZmLrQhlJ3uxlMqqxlVhi7SW6t/B688O8NDVsRkNSk8nO08pSQB96qZas2Nc+vYDu7MtsB6WJvjC9hCMuH9ttsMa8UbB5sPR7BmucXua0zhpPbwp8xxoUT+GLBxSKRUYcU8BNncbgISgeOXqi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789501463; c=relaxed/simple;
	bh=zqUVI9XN9qRlnoJmqgh8WL98vi1FNO+xnJ6FWXvEmQM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Kn9lYMsuZXMGSVkURK4NFycqYFk5GjeLI2kz54KkqUGhP21cWMKj07dUzzqc+yIS4MA43+AuXvP/RGNl8sddP/Nx2TBu2IU/VcvW3CHQeXls1xTQVkOrrXZjq4YNAPt9SMKe4AUTHkJqZQAGkV/PssTSwRsYwq/6Z/g4gIVNNUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=F7IhcNyf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ejZOv59j; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xxxNCAXy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JCOb1tYI; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="F7IhcNyf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ejZOv59j";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xxxNCAXy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JCOb1tYI"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BE7B71FE1D;
	Tue, 15 Sep 2026 19:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789501455; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZrZGj1dRirEoshytMHM/4TTl+GGWEXpc5EDiy04m10s=;
	b=F7IhcNyftmH/coLw9VbDGCRGEbaPmxWqv1RUJTNBdMQda89bm79sVfNFQiE67qoIan0TGL
	qXtz7bzusV27R1RCXJn3FtvHRfrDD0GnHXMeevNegdL/4L4Zo5TtaO4PFuX7I12e/p5EXY
	8jVDUmGqxiNxO9DiMvKcIAA19MQ8wDY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789501455;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZrZGj1dRirEoshytMHM/4TTl+GGWEXpc5EDiy04m10s=;
	b=ejZOv59jqdCRqlUj5ph38nyEcQfOcsk9VMrgHjvXg907N7F7Jo60DO/J80xRTOpFs+6OG6
	UXD3pQg1TanSf0CQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xxxNCAXy;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JCOb1tYI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789501450; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZrZGj1dRirEoshytMHM/4TTl+GGWEXpc5EDiy04m10s=;
	b=xxxNCAXyySeGCTqgMuQHEenwsdGx5BTsT96zuISqrhyDdDl2pBadciJV13R5dsB+C/FtFK
	/gS2eWVCL0yHUW/X6A+JFUxYwsF2uVLjXOqactD3sVHVYrgNrsPCL46j6ldzVmgrCYyRwW
	9My4sxn/h1iuIjxG7BUFbAVoaINkKyQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789501450;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZrZGj1dRirEoshytMHM/4TTl+GGWEXpc5EDiy04m10s=;
	b=JCOb1tYItnkljG71GOpyAq9YcuSgavKfhY8Ap3xDQD6F1M/fXfnvSfDWSwtWYGgswMWHSb
	jUp5k+XSj3YxbrAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D662D13693;
	Tue, 15 Sep 2026 19:44:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id c50YFAmgqWplAQAAD6G6ig
	(envelope-from <krisman@suse.de>); Tue, 15 Sep 2026 19:44:09 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org
Cc: juanlu@fastmail.com
Subject: Re: [PATCH 01/10] io_uring/io-wq: put the request file before
 posting a completion
In-Reply-To: <20260911154811.646705-2-axboe@kernel.dk>
Organization: SUSE
References: <20260911154811.646705-1-axboe@kernel.dk>
 <20260911154811.646705-2-axboe@kernel.dk>
Date: Tue, 15 Sep 2026 16:44:07 -0300
Message-ID: <87cxue1erc.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Score: -4.51
X-Rspamd-Queue-Id: BE7B71FE1D
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[fastmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[fastmail.com];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

Jens Axboe <axboe@kernel.dk> writes:

> Once io-wq is done with the request, put any potential file that request
> had pinned upfront. This ensures any file references are fully put by
> the time io-wq posts a completion. Registered files are held by the
> resource node and don't need this.
>
> Signed-off-by: Jens Axboe <axboe@kernel.dk>
> ---
>  io_uring/io_uring.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
> index 61053421d809..f96dd2d8c6b1 100644
> --- a/io_uring/io_uring.c
> +++ b/io_uring/io_uring.c
> @@ -907,6 +907,24 @@ bool io_req_post_cqe32(struct io_kiocb *req, struct io_uring_cqe cqe[2])
>  	return posted;
>  }
>  
> +/*
> + * Drop any io-wq request with a file upfront, otherwise it gets deferred to
> + * much later post CQE posting.
> + */
> +static void io_req_put_file_iowq(struct io_kiocb *req, bool sync)
> +{
> +	struct file *file = req->file;
> +
> +	if (!file || (req->flags & (REQ_F_FIXED_FILE | REQ_F_REISSUE)))
> +		return;
> +
> +	WRITE_ONCE(req->file, NULL);
> +	if (sync)
> +		__fput_sync(file);
> +	else
> +		fput(file);

Why do you need an async fput on the error path?  I'm missing why it
necessary.  Also, isn't that gonna cause the same sort of delay until
the task work or delayed work is executed?

Other than that:

Reviewed-by: Gabriel Krisman Bertazi <krisman@suse.de>


> +}
> +
>  static void io_req_complete_post(struct io_kiocb *req, unsigned issue_flags)
>  {
>  	struct io_ring_ctx *ctx = req->ctx;
> @@ -919,6 +937,8 @@ static void io_req_complete_post(struct io_kiocb *req, unsigned issue_flags)
>  	if (WARN_ON_ONCE(!(issue_flags & IO_URING_F_IOWQ)))
>  		return;
>  
> +	io_req_put_file_iowq(req, true);
> +
>  	/*
>  	 * Handle special CQ sync cases via task_work. DEFER_TASKRUN requires
>  	 * the submitter task context, IOPOLL protects with uring_lock.
> @@ -1480,6 +1500,7 @@ void io_wq_submit_work(struct io_wq_work *work)
>  	/* either cancelled or io-wq is dying, so don't touch tctx->iowq */
>  	if (atomic_read(&work->flags) & IO_WQ_WORK_CANCEL) {
>  fail:
> +		io_req_put_file_iowq(req, false);
>  		io_req_task_queue_fail(req, err);
>  		return;
>  	}
> @@ -1555,8 +1576,10 @@ void io_wq_submit_work(struct io_wq_work *work)
>  	} while (1);
>  
>  	/* avoid locking problems by failing it from a clean context */
> -	if (ret)
> +	if (ret) {
> +		io_req_put_file_iowq(req, true);
>  		io_req_task_queue_fail(req, ret);
> +	}
>  }
>  
>  inline struct file *io_file_get_fixed(struct io_kiocb *req, int fd,
> -- 
> 2.55.0
>

-- 
Gabriel Krisman Bertazi
