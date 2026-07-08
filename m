Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A9B372B25
	for <io-uring@vger.kernel.org>; Wed,  8 Jul 2026 15:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525548; cv=none; b=XFWVkiXb1Gy5PgrbrHcNGCtWz+YrMk6MhNSxas8sC98YPgnk1Z6DNn52LlFQE/3OfFp3GnyIGa8Sx/O2BPRPwQvMWq+8698qbRO5Zzj9VMJSVUc89RwtHATgfh34IlYz9rgE7261HakA7iaZ8tjNkXfS8KZfsj4nSYmR4kOXoks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525548; c=relaxed/simple;
	bh=EWpZScGuDwkXjNfdOlMJs2P/6QIYqvKPf8gR5usPdE8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Mr/tZpE3Kmq5JEE0+oTsN4Qm5jbYrq1rP+PxmZAC6IJTihZlxEP96S6Hhg6G4BHUhejjF0h+0y9tw/zgX8tZ8Sxpvj5qLViZmQcRuQx5kuOKOaM2ph+riCHGE87fjTJ80CKTi183MPCTwR9L055lpGCV9YmX27ZV9nQSJoqDClY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Nzam3ULE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5Axdm/DB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Nzam3ULE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5Axdm/DB; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Nzam3ULE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5Axdm/DB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Nzam3ULE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5Axdm/DB"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 721D776096;
	Wed,  8 Jul 2026 15:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783525544; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BGI/ciUAJ4aL/A2jCySoJbg4P4LPyDbk7ONkKSUeOCI=;
	b=Nzam3ULEMummIzt2oRWkqca9YkX1a/4eGPyMSnSppZFG9wt4Km2DrO1qnAn9o/AT3KqATf
	OmtwjCaJvCv363RjsAjzsZlMSPZ58vhlfkt2o8m98/oGdSBv19A3s8W8dX2WesEQLNTa8P
	HG889eVczePv5bY8NtMQdkl91yp/3yA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783525544;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BGI/ciUAJ4aL/A2jCySoJbg4P4LPyDbk7ONkKSUeOCI=;
	b=5Axdm/DBxg7PfKKmM6F/0asBXhp39i74rT1xI5PpNIdQIjISGzNSIwGC/sbXvy/nFWKEiE
	4HI+d2DwMhXPzaAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783525544; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BGI/ciUAJ4aL/A2jCySoJbg4P4LPyDbk7ONkKSUeOCI=;
	b=Nzam3ULEMummIzt2oRWkqca9YkX1a/4eGPyMSnSppZFG9wt4Km2DrO1qnAn9o/AT3KqATf
	OmtwjCaJvCv363RjsAjzsZlMSPZ58vhlfkt2o8m98/oGdSBv19A3s8W8dX2WesEQLNTa8P
	HG889eVczePv5bY8NtMQdkl91yp/3yA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783525544;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BGI/ciUAJ4aL/A2jCySoJbg4P4LPyDbk7ONkKSUeOCI=;
	b=5Axdm/DBxg7PfKKmM6F/0asBXhp39i74rT1xI5PpNIdQIjISGzNSIwGC/sbXvy/nFWKEiE
	4HI+d2DwMhXPzaAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 20E97779AE;
	Wed,  8 Jul 2026 15:45:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iHpRAahwTmqqTQAAD6G6ig
	(envelope-from <krisman@suse.de>); Wed, 08 Jul 2026 15:45:44 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Feng Xue <feng.xue@outlook.com>, "io-uring@vger.kernel.org"
 <io-uring@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jens
 Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>
Subject: Re: [PATCH] io_uring/net: clear stale vec on buffer peek error
 after expansion
In-Reply-To: <SY0P300MB0070983BEEB976B8F46E3D4790FF2@SY0P300MB0070.AUSP300.PROD.OUTLOOK.COM>
Organization: SUSE
References: <SY0P300MB0070983BEEB976B8F46E3D4790FF2@SY0P300MB0070.AUSP300.PROD.OUTLOOK.COM>
Date: Wed, 08 Jul 2026 11:45:38 -0400
Message-ID: <87ldblwkm5.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,outlook.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.dk,gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[outlook.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,imap1.dmz-prg2.suse.org:helo,mailhost.krisman.be:mid,vec.nr:url]
X-Spam-Level: 

Feng Xue <feng.xue@outlook.com> writes:

> Subject: [PATCH] io_uring/net: clear stale vec on buffer peek error after=
 expansion
>
> When io_ring_buffers_peek() expands the iovec array during a bundle
> recv retry, it frees the old array (A) and allocates a new one (B).
> If access_ok() then fails, B is also freed and -EFAULT is returned.
>
> The callers io_recv_buf_select() and io_send_select_buffer() only
> update kmsg->vec.iovec on success, so on this error path vec.iovec
> still points to freed A. The stale pointer survives into the netmsg
> alloc cache via io_netmsg_recycle() (vec.nr < IO_VEC_CACHE_SOFT_CAP
> so io_vec_free is not called). A subsequent bundle operation reuses
> the cached hdr, sees vec.iovec non-NULL, sets REQ_F_NEED_CLEANUP,
> and passes the dangling pointer back to io_ring_buffers_peek() =E2=80=94
> which writes iovec entries to freed memory (use-after-free).
>
> If the alloc cache is full, the alternative cleanup path through
> io_clean_op() =E2=86=92 io_vec_free() kfree()s the already-freed A
> (double-free).
>
> Fix this by NULLing vec.iovec and zeroing vec.nr on the error path
> when expansion occurred (detected by arg.iovs !=3D kmsg->vec.iovec).
> Do not call io_vec_free() here =E2=80=94 A is already freed by the expans=
ion
> block, so kfree()ing it again would itself be a double-free.
>
> Apply the same fix to io_send_select_buffer() which has the identical
> update-after-success pattern.

cleaning in the caller makes the issue much more likely to happen again
in a future use of this function.  It would be better to fix the bad
semantics of io_ring_buffers_peek instead.

In fact, this is exactly the point of this patch, which I believe
already fixed this issue:

https://lore.kernel.org/io-uring/178338543579.49877.9882374687710864124.b4-=
ty@b4/T/#t

>
> Signed-off-by: Feng Xue <feng.xue@outlook.com>
> Assisted by: XGPT
> ---
>  io_uring/net.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/io_uring/net.c b/io_uring/net.c
> index XXXXXXX..XXXXXXX 100644
> --- a/io_uring/net.c
> +++ b/io_uring/net.c
> @@ -631,8 +631,15 @@ static int io_send_select_buffer(struct io_kiocb *re=
q, unsigned int issue_flags,
>=20=20
>  	ret =3D io_buffers_select(req, &arg, sel, issue_flags);
> -	if (unlikely(ret < 0))
> +	if (unlikely(ret < 0)) {
> +		/*
> +		 * Buffer selection may have freed the old iovec during
> +		 * expansion. Clear vec to prevent stale-pointer reuse.
> +		 */
> +		if (kmsg->vec.iovec && arg.iovs !=3D kmsg->vec.iovec) {
> +			kmsg->vec.iovec =3D NULL;
> +			kmsg->vec.nr =3D 0;
> +		}
>  		return ret;
> +	}
>=20=20
>  	if (arg.iovs !=3D &kmsg->fast_iov && arg.iovs !=3D kmsg->vec.iovec) {
> @@ -1174,8 +1181,15 @@ static int io_recv_buf_select(struct io_kiocb *req,
>=20=20
>  		ret =3D io_buffers_peek(req, &arg, sel);
> -		if (unlikely(ret < 0))
> +		if (unlikely(ret < 0)) {
> +			/*
> +			 * Peek may have freed the old iovec during expansion.
> +			 * Clear vec to prevent stale-pointer reuse or
> +			 * double-free via io_vec_free on the cleanup path.
> +			 */
> +			if (kmsg->vec.iovec && arg.iovs !=3D kmsg->vec.iovec) {
> +				kmsg->vec.iovec =3D NULL;
> +				kmsg->vec.nr =3D 0;
> +			}
>  			return ret;
> +		}
>=20=20
>  		if (arg.iovs !=3D &kmsg->fast_iov && arg.iovs !=3D kmsg->vec.iovec) {

--=20
Gabriel Krisman Bertazi
