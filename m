Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78801453A58;
	Tue, 11 Aug 2026 17:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786467741; cv=none; b=jHpfnstE1/MJSQhza1eBFQ9NSYVNGe+xlg4LxyxNwuStzyzJ8KJT0Psjnt363jFvxNOYrAK0O0KbK5TNcqSVwZxOsJRtij3lUAAoYVk1k7qkCkML1ELv3ZT5XXbMa8mK1iiEpuPTHBc9P4ccRkSn2QkpmnjMA2/AMACI+RwVtJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786467741; c=relaxed/simple;
	bh=Q1f0cgOXGXYG6qPTCbWlU2o6pILyhcNNXH52p3zzE8I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=J5gpMJfFXKNJi2UNra08qezctaU0BF9qJWTzrnqtuCCTF0JVc9I9JLzZmUpaxYoopWz+8/KaryGJawFqHzPkIQcdmniHRq2wXbO5UIbxy0ZWMWCNUkXd8M3LYeIbvB7G7LittASvdKx57YuQR9RDVU9wQeEMl4IYgDWtehpiso4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WS8IWOA1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rIjb8S6a; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YHPBBW1W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nCqUiqmf; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WS8IWOA1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rIjb8S6a";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YHPBBW1W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nCqUiqmf"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 59AE281DEE;
	Tue, 11 Aug 2026 17:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786467733; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N3Gqt/si4mRYiKG63MmncUsaa/Gp7USZUDAFYJlakdI=;
	b=WS8IWOA1K0MKGVggnx2cIdJ6o2sVwtgxS3VlhyW9KET4w3krwZIvB1tJSQnDJFgDrwwbmB
	ig4+hM1RPgEYi97mV5NU6yQ5IgaEkiLfPQYH5/fehezFKr4pD7DwfSO6zrXIMJ+3IwLJMY
	0ZuemIr4L0D+/UMuF78TV2nuqPVWg5M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786467733;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N3Gqt/si4mRYiKG63MmncUsaa/Gp7USZUDAFYJlakdI=;
	b=rIjb8S6axgOX9Z5qfvTk+I94t4qfXs/L4Zf4G4y7zSYlm3d+LNtRr8AXjK+YQhLpqKDKqn
	r9w4IGozQbbKRrAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=YHPBBW1W;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=nCqUiqmf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786467729; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N3Gqt/si4mRYiKG63MmncUsaa/Gp7USZUDAFYJlakdI=;
	b=YHPBBW1WAeoizBQIE+2VMdk16Uxd55VfwW8R1hIRWHSRhOGCA20pl1X1+Ob7wRd977PbjF
	XTfprQHKrkglimzYSziI8RdRj+jbo7/XitmEZ0aJ1T4BYIovfuQPAzHOuHNrXZiRucSods
	Cd9ZtxoQEPAjP12vi5uEk0eCR8HlnVE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786467729;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N3Gqt/si4mRYiKG63MmncUsaa/Gp7USZUDAFYJlakdI=;
	b=nCqUiqmf51dY0LZLYe4yFW07el4udHNxLkR9Y20L2kbYyTTTWSk9f36FRhyyTT8lWlmQdd
	t0pgX1CdAw4OXPAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0C045779B2;
	Tue, 11 Aug 2026 17:02:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id X4LrMZBVe2rdOQAAD6G6ig
	(envelope-from <krisman@suse.de>); Tue, 11 Aug 2026 17:02:08 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Vishnu Razdan via B4 Relay <devnull+vrazdan.openai.com@kernel.org>,
 axboe@kernel.dk
Cc: io-uring@vger.kernel.org, vrazdan@openai.com,
 linux-kernel@vger.kernel.org, asml.silence@gmail.com
Subject: Re: [PATCH] io_uring/io-wq: fix worker accounting when canceling
 creation callbacks
In-Reply-To: <20260811-vrazdan-io-wq-b4-submit-v1-1-719ced16c921@openai.com>
Organization: SUSE
References: <20260811-vrazdan-io-wq-b4-submit-v1-1-719ced16c921@openai.com>
Date: Tue, 11 Aug 2026 13:02:07 -0400
Message-ID: <87mruspp4g.fsf@mailhost.krisman.be>
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
X-Rspamd-Queue-Id: 59AE281DEE
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
	FREEMAIL_CC(0.00)[vger.kernel.org,openai.com,gmail.com];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[vrazdan.openai.com];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,mailhost.krisman.be:mid,openai.com:email,suse.de:email,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Vishnu Razdan via B4 Relay <devnull+vrazdan.openai.com@kernel.org>
writes:

> From: Vishnu Razdan <vrazdan@openai.com>
>
> create_worker_cb() reserves an io-wq worker slot only after its
> task-work callback runs. If the callback is canceled before then,
> io_worker_cancel_cb() still decrements acct->nr_workers. When an
> existing worker retires with its creation callback pending, that
> worker has already decremented the same account's worker count.
>
> The resulting undercount permits worker creation beyond the account's
> configured limit. On an AST2600 OpenBMC system, an unchanged sensor
> daemon reached 4,291 threads with the original kernel. With an
> equivalent downstream fix, 25 passive samples under its normal
> workload showed 6-9 threads.
>
> Decrement nr_workers only when the canceled callback is not
> create_worker_cb(). Continuation callbacks still release their reserved
> slot, and both callback types retain the existing running-count,
> reference-count, and create-state cleanup.
>
> Fixes: 1d5f5ea7cb7d ("io-wq: remove worker to owner tw dependency")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Vishnu Razdan <vrazdan@openai.com>
> ---

Reviewed-by: Gabriel Krisman Bertazi <krisman@suse.de>

> Prevent unreserved worker-creation callbacks from decrementing the worker count.
> ---
>  io_uring/io-wq.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/io_uring/io-wq.c b/io_uring/io-wq.c
> index 2e14880ee..fa403ed24 100644
> --- a/io_uring/io-wq.c
> +++ b/io_uring/io-wq.c
> @@ -211,9 +211,12 @@ static void io_worker_cancel_cb(struct io_worker *worker)
>  	struct io_wq *wq = worker->wq;
>  
>  	atomic_dec(&acct->nr_running);
> -	raw_spin_lock(&acct->workers_lock);
> -	acct->nr_workers--;
> -	raw_spin_unlock(&acct->workers_lock);
> +	/* create_worker_cb() has not reserved a worker slot yet. */
> +	if (worker->create_work.func != create_worker_cb) {
> +		raw_spin_lock(&acct->workers_lock);
> +		acct->nr_workers--;
> +		raw_spin_unlock(&acct->workers_lock);
> +	}
>  	io_worker_ref_put(wq);
>  	clear_bit_unlock(0, &worker->create_state);
>  	io_worker_release(worker);
>
> ---
> base-commit: d58772d8520c7ef247c4b95c9bd76d3a25da9ff5
> change-id: 20260810-vrazdan-io-wq-b4-submit-9c94df145718
>
> Best regards,
> --  
> Vishnu Razdan <vrazdan@openai.com>
>
>

-- 
Gabriel Krisman Bertazi
