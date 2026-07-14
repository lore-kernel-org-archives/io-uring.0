Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FECE3E171E
	for <io-uring@vger.kernel.org>; Tue, 14 Jul 2026 19:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784055669; cv=none; b=BAFgNR/f32qhq9lRYIKPY3S+ySPyYnELZKJ7tjh4XyXYWVtFQb09zBF/5KZKYt8M5drWOSiaH9mGMN1CznwNkrxoun7LQNXlWpNtxgWIZoLiwK6U1P4wi50s68at2939HEQ03wt5Ru0+1rBo1/43bF27QZkxUeV3erR7BneQWHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784055669; c=relaxed/simple;
	bh=E8edDEn3cCBAVDCTytMOfKUuirTzIHK8IvSEcA+ngsg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aCTQQ7wjMNpMWM1p4uv1zf5rPFr2Q4HfG1hqQuw8K8PC5419UYtJKpW4mwMR56ANZ4A3xp4iRwCodLLSarjWraigreLSzGLfGr5zhVbDqBokE2n03udyzSTx2Zv3f6c4VPJJdooTnHbljdcdO4F6FsC7tonGxVVeJU9gAQMyaSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=d/xwwglL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rXxvn6/c; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=d/xwwglL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rXxvn6/c; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="d/xwwglL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rXxvn6/c";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="d/xwwglL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rXxvn6/c"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1DD5077FA0;
	Tue, 14 Jul 2026 19:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784055649; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zaeRSP+ceFIWpAMYv8RBVCZtmclyb6JVPkvXvE9N5vc=;
	b=d/xwwglL2TgWetAHw93PPuqrS5eZeRdzfo4fs31gOFyMqoMaJ0TNQeImgWSPBxcNiJ88hH
	CPBH/X4poIARts+gfDQFQSMWhvtw3qj7yaFkPE9Oxzaahm3bh446s1+3VnXXqG6jkIiTga
	SBjMjxI0TvUuaoj2/fMOrUpEzKvBBMY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784055649;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zaeRSP+ceFIWpAMYv8RBVCZtmclyb6JVPkvXvE9N5vc=;
	b=rXxvn6/ch8DWZxd91GNTNnAIhUUPXwkinI/4UKODw+oOFVGN32kB4AXsyJERRySm7N1EmU
	Q9H3zA0qmu8iUsDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784055649; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zaeRSP+ceFIWpAMYv8RBVCZtmclyb6JVPkvXvE9N5vc=;
	b=d/xwwglL2TgWetAHw93PPuqrS5eZeRdzfo4fs31gOFyMqoMaJ0TNQeImgWSPBxcNiJ88hH
	CPBH/X4poIARts+gfDQFQSMWhvtw3qj7yaFkPE9Oxzaahm3bh446s1+3VnXXqG6jkIiTga
	SBjMjxI0TvUuaoj2/fMOrUpEzKvBBMY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784055649;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zaeRSP+ceFIWpAMYv8RBVCZtmclyb6JVPkvXvE9N5vc=;
	b=rXxvn6/ch8DWZxd91GNTNnAIhUUPXwkinI/4UKODw+oOFVGN32kB4AXsyJERRySm7N1EmU
	Q9H3zA0qmu8iUsDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C19D5779AE;
	Tue, 14 Jul 2026 19:00:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MAlbJ2CHVmrkKQAAD6G6ig
	(envelope-from <krisman@suse.de>); Tue, 14 Jul 2026 19:00:48 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Yi Xie <xieyi@kylinos.cn>, axboe@kernel.dk
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, Yi Xie
 <xieyi@kylinos.cn>
Subject: Re: [PATCH 1/5] io_uring/fs: check unused sqe fields for unlinkat
In-Reply-To: <20260714030306.64820-1-xieyi@kylinos.cn>
Organization: SUSE
References: <20260714030306.64820-1-xieyi@kylinos.cn>
Date: Tue, 14 Jul 2026 15:00:47 -0400
Message-ID: <878q7d4crk.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,suse.de:email]
X-Spam-Level: 

Yi Xie <xieyi@kylinos.cn> writes:

> Zero check unused SQE fields addr3 and pad2 for unlinkat. They're
> not needed now, but could be used sometime in the future.
>
> Signed-off-by: Yi Xie <xieyi@kylinos.cn>

Arguably, this is a common issue across many operations.  I'd love
to have a more automated way to write these checks.


Reviewed-by: Gabriel Krisman Bertazi <krisman@suse.de>

> ---
>  io_uring/fs.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/io_uring/fs.c b/io_uring/fs.c
> index d0580c754bf8..26ea841a22e7 100644
> --- a/io_uring/fs.c
> +++ b/io_uring/fs.c
> @@ -110,7 +110,8 @@ int io_unlinkat_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
>  	const char __user *fname;
>  	int err;
>  
> -	if (sqe->off || sqe->len || sqe->buf_index || sqe->splice_fd_in)
> +	if (sqe->off || sqe->len || sqe->buf_index || sqe->splice_fd_in ||
> +	    sqe->addr3 || sqe->__pad2[0])
>  		return -EINVAL;
>  	if (unlikely(req->flags & REQ_F_FIXED_FILE))
>  		return -EBADF;
> -- 
> 2.25.1
>

-- 
Gabriel Krisman Bertazi
