Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A9D3B42F4
	for <io-uring@vger.kernel.org>; Mon, 22 Jun 2026 14:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782137497; cv=none; b=pUPHDqeI6uus/wNobiRyZIY0KBw3wus40FDyJcPFUGLd9M0lwmiwH8AmWkz58hVQcZfhm8bc3qsH12m/ataoojg/z997GOlvGUtXRMVdz2cUHnSW8uUsvKucL6gqTHEhUV4QRNaJvz8c0iNzpnCQ7tC89QZqOXOVklzznnYi4jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782137497; c=relaxed/simple;
	bh=3bDdIkiaEKJ/I3lfP2ORN6Qv/vmEMTYcDqhYr/+NIHo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=X/Vwx3ry/4GqGLE04E/HZE2ev0u19lL5b9VGCzeq1TPcqzGyn/KleZ6Y3ThDx7Ufe0r3C/Twc/0c19rYP49L731Wehlhc6rLnt6c/hmLcDBJqH5zcdnet0rET5jbEAlyJgS33GeGtlWrCaURTOAt+OYBckpR/fGYHUVZqJmHApQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=G/MgOJbQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ebILGN11; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=G/MgOJbQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ebILGN11; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G/MgOJbQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ebILGN11";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G/MgOJbQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ebILGN11"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0C60B75944;
	Mon, 22 Jun 2026 14:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782137494; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=baIe4dVg1AxpL1p35zzD9r+WB5oxgYTofY6xicshzqY=;
	b=G/MgOJbQZPLUzOoGgZBHKRwewd32GUnrz8oA6EgDey6GtJjX8g7vvpfXsQ33A1xDT8di5b
	napmo7Ixt+794/fkOUId9O4ZLK2oOL1V395NvqAdJuTRQt6sSXBgfMNdNNNm66p2qIqdTT
	nkMoGTPCYtj12cv82E81NYRtUz7JG1A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782137494;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=baIe4dVg1AxpL1p35zzD9r+WB5oxgYTofY6xicshzqY=;
	b=ebILGN111QUvg2VqQqVEa1Vfbb4Uj60c2bR8qRNxRTnqbo4k9XzMt9K4HkdUBtxQUuhFum
	vdW9+6YuS858vxAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="G/MgOJbQ";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ebILGN11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782137494; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=baIe4dVg1AxpL1p35zzD9r+WB5oxgYTofY6xicshzqY=;
	b=G/MgOJbQZPLUzOoGgZBHKRwewd32GUnrz8oA6EgDey6GtJjX8g7vvpfXsQ33A1xDT8di5b
	napmo7Ixt+794/fkOUId9O4ZLK2oOL1V395NvqAdJuTRQt6sSXBgfMNdNNNm66p2qIqdTT
	nkMoGTPCYtj12cv82E81NYRtUz7JG1A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782137494;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=baIe4dVg1AxpL1p35zzD9r+WB5oxgYTofY6xicshzqY=;
	b=ebILGN111QUvg2VqQqVEa1Vfbb4Uj60c2bR8qRNxRTnqbo4k9XzMt9K4HkdUBtxQUuhFum
	vdW9+6YuS858vxAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC7FD779A8;
	Mon, 22 Jun 2026 14:11:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id loPhHZVCOWrRTwAAD6G6ig
	(envelope-from <krisman@suse.de>); Mon, 22 Jun 2026 14:11:33 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Deepanshu Kartikey <kartikey406@gmail.com>, axboe@kernel.dk
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, Deepanshu
 Kartikey <kartikey406@gmail.com>,
 syzbot+f99b00a963915b6b52c6@syzkaller.appspotmail.com
Subject: Re: [PATCH] io_uring/memmap: bound io_pin_pages() by page array
 byte size
In-Reply-To: <20260621012933.50571-1-kartikey406@gmail.com>
References: <20260621012933.50571-1-kartikey406@gmail.com>
Date: Mon, 22 Jun 2026 10:11:32 -0400
Message-ID: <87bjd2psvf.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 0C60B75944
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
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
	FREEMAIL_TO(0.00)[gmail.com,kernel.dk];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,syzkaller.appspotmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[f99b00a963915b6b52c6];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Deepanshu Kartikey <kartikey406@gmail.com> writes:

> io_pin_pages() checks that nr_pages does not exceed INT_MAX, then
> allocates a struct page * array of nr_pages entries. kvmalloc() limits
> allocations to INT_MAX bytes, but the check counts pages, not bytes.
> On 64-bit each entry is 8 bytes, so the array hits the INT_MAX byte
> limit at INT_MAX / sizeof(struct page *) pages, well before the page
> count check fires.
>
> Since commit b4e41050b212 ("io_uring/rsrc: raise registered buffer 1GB
> limit") raised the per-buffer cap to 1TB, a buffer near that cap maps
> ~2^28 pages, making the array allocation exceed INT_MAX bytes. This
> passes the page count check, reaches kvmalloc(), and triggers the
> WARN_ON_ONCE() for oversized allocations in __kvmalloc_node_noprof().
>
> Check nr_pages against INT_MAX / sizeof(struct page *) so the buffer is
> rejected with -EOVERFLOW before the allocation is attempted.
>
> Reported-by: syzbot+f99b00a963915b6b52c6@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=f99b00a963915b6b52c6
> Fixes: b4e41050b212 ("io_uring/rsrc: raise registered buffer 1GB limit")
> Tested-by: syzbot+f99b00a963915b6b52c6@syzkaller.appspotmail.com
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>

Looks good, feel free to add:

Reviewed-by: Gabriel Krisman Bertazi <krisman@suse.de>

> ---
>  io_uring/memmap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/io_uring/memmap.c b/io_uring/memmap.c
> index 4f9b439319c4..da1f6c5d07f8 100644
> --- a/io_uring/memmap.c
> +++ b/io_uring/memmap.c
> @@ -53,7 +53,7 @@ struct page **io_pin_pages(unsigned long uaddr, unsigned long len, int *npages)
>  	nr_pages = end - start;
>  	if (WARN_ON_ONCE(!nr_pages))
>  		return ERR_PTR(-EINVAL);
> -	if (WARN_ON_ONCE(nr_pages > INT_MAX))
> +	if (nr_pages > INT_MAX / sizeof(struct page *))
>  		return ERR_PTR(-EOVERFLOW);
>  
>  	pages = kvmalloc_objs(struct page *, nr_pages, GFP_KERNEL_ACCOUNT);
> -- 
> 2.43.0
>

-- 
Gabriel Krisman Bertazi
