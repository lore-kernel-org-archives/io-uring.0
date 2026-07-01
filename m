Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7AA3955C9
	for <io-uring@vger.kernel.org>; Wed,  1 Jul 2026 10:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782901957; cv=none; b=m9sXDB4hEvlL2PrBnuM0WSiWnCAozxbTnmJMTGgUTXFxJj6yW3FsZEX/514GIkoenHP/4uJ2xlWHXU9kgZU3lKcnARA7bUAzxokrMFDAHvlJO7AZcMfeTBAyDlfQ1WoO9Bs+thD+b1fd/WHN+/Li6ZRza2xpEaVt4WASujGDl1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782901957; c=relaxed/simple;
	bh=Sx6+JlfAn5W19pk1zI3jTEznpqqRqUhfOSneoirmGaY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LY5P/sIXZceAEuF3J1L3Jf/thzJFdtv92GScHTPxv+jmOZKI+XR4RAgRfj0vsCAT7lxBsGiiRyHJrQHkH4Vzs4yVp+96xs2Yva5ezKtWHRJoB0I9qLmoq8LMsXtL1Omh9VmisNLQnE8rK3hQDZRi80KBZXc5vFUXGUDiD7ximIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rAfNwZS5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wsDjaSwI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S6gu8axZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZyXr9wMI; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rAfNwZS5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wsDjaSwI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S6gu8axZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZyXr9wMI"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E41FC75B0D;
	Wed,  1 Jul 2026 10:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782901954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vibzk79FE/avKUNujc0wgAmWphMagepxJGNVmuPbn40=;
	b=rAfNwZS5LhwVADNpGyQEeT2tSxPDYCmWBgjJF/9zumxJHJsQrs10dMLPnsREBVw/dnrXAH
	UfnGv/3lPYyMhuU8hZKL+hEd+ejQK/90q0YUM4zJ/HSnIQKJ4wm0k4uzIK+1U5T4HQc/6R
	2CoahEBwx8G/cim7Oy3Daoe4BX+Ovt4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782901954;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vibzk79FE/avKUNujc0wgAmWphMagepxJGNVmuPbn40=;
	b=wsDjaSwID6oY0x+tnmQTfHtpWVzoGzjK0zYU874WvoM4G8dZH9GLsnYQgaMT7IREwW7j+A
	utmpCCX7fMmolJDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=S6gu8axZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ZyXr9wMI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782901953; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vibzk79FE/avKUNujc0wgAmWphMagepxJGNVmuPbn40=;
	b=S6gu8axZA9ns0PddA8stYAS88MWoUWl2yvuYoSHylNUXU43Vs0KxQlXO9rngR9cC04MTXI
	p3KLDMxADJsOlcwHQPhI2fnZtl5YrEXi+/4VlbMxD8MDQDKp4xCO53hjqY9O9DBD176TLg
	Hx0lBbr+cl4CtrAoc19XIwjqlyAgsB8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782901953;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vibzk79FE/avKUNujc0wgAmWphMagepxJGNVmuPbn40=;
	b=ZyXr9wMIfZ6CGx9p45TPhUd6pjc9ORjc8k+Vyu/culQ8XkJyzmfbBelZcgY/GAQAVq8NAU
	pcXKqe9M4nzDIXDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D01F5779AA;
	Wed,  1 Jul 2026 10:32:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +FYZMcHsRGqyUwAAD6G6ig
	(envelope-from <krisman@suse.de>); Wed, 01 Jul 2026 10:32:33 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Yi Xie <xieyi@kylinos.cn>, axboe@kernel.dk
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, Yi Xie
 <xieyi@kylinos.cn>
Subject: Re: [PATCH] io_uring/rsrc: bound io_coalesce_buffer() page array
 allocation
In-Reply-To: <20260630071017.100436-1-xieyi@kylinos.cn>
Organization: SUSE
References: <20260630071017.100436-1-xieyi@kylinos.cn>
Date: Wed, 01 Jul 2026 06:32:34 -0400
Message-ID: <87cxx757b1.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
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
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,mailhost.krisman.be:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E41FC75B0D
X-Spam-Score: -4.51

Yi Xie <xieyi@kylinos.cn> writes:

> kvmalloc_objs() in io_coalesce_buffer() does not check for size overflow
> when nr_folios is large.  Mirror the check used in memmap.c before
> allocating the page pointer array.
>
> Signed-off-by: Yi Xie <xieyi@kylinos.cn>

Resending from yesterday as changing MUA is never harmless...

I don't think this can happen.

nr_folios comes from nr_pages in io_check_coalesce_buffer, and must be
less or equal to it.  But nr_pages is already checked in io_pin_pages,
introduced by:

  https://lore.kernel.org/io-uring/178216289049.99876.2987989144128669864.b4-ty@b4/T/#t

> ---
>  io_uring/rsrc.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
> index 8d0f2ee24e0c..f1f8d6dd102c 100644
> --- a/io_uring/rsrc.c
> +++ b/io_uring/rsrc.c
> @@ -776,6 +776,8 @@ static bool io_coalesce_buffer(struct page ***pages, int *nr_pages,
>  	unsigned i, j;
>  
>  	/* Store head pages only*/
> +	if (nr_folios > INT_MAX / sizeof(struct page *))
> +		return false;
>  	new_array = kvmalloc_objs(struct page *, nr_folios);
>  	if (!new_array)
>  		return false;
> -- 
> 2.25.1
>

-- 
Gabriel Krisman Bertazi
