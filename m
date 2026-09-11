Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B843DC4B3;
	Fri, 11 Sep 2026 16:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789144440; cv=none; b=H+VOfJAi9GeUVAED15Qp08skk3CbpsQHCe2EX/iPUJxH/3AX2LMVN3IhVOPodMvTOFcHyfNNdMR23w80OqdDhVg0klhkH3EOYgSHK5VVz3hUmlHeJAKXs7cDMN5I+X4vxEVy2hgW8VW5riF2UMQyH6aCX2l1NzqNaVEjDnKJK4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789144440; c=relaxed/simple;
	bh=TnNDaPbUeOFv+s+5IEjku1D26sM+Attn0rJ1BMok/Pw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rgr6NTSfpGjAAJgq8Pre/k53vSlUh9AYdhDjMJW4Kr02Djv/1mzRuLj/Y/mqZD7x9ChHQfTXvcfrDrIJUJ1LLw6D7TFtsr4AhXE8hkuNiKipRHkvzrLYBCRaBRfAAt2PhprQPtPQYXCC2anTb/8tpPkGmrYqEbzFxy5LxezBj5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Hu7P6cGT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=easVLzsI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=o9aIEcBn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zs3EhgNF; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Hu7P6cGT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="easVLzsI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o9aIEcBn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zs3EhgNF"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 658F121D4C;
	Fri, 11 Sep 2026 16:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789144430; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p/UJqNfydeXO6VFPzh2hLVIkw0b4mCxKVWY6mrleRz8=;
	b=Hu7P6cGTctWN2Gn0H5o5jpYrXzT39PP1hcuVDJ/RxbvGB/fkYN6VckU5UZF4PptTFIog6g
	M73dki3lqZVyVd+OTfA+KmvW2GFYuulZ8ZIE+W53yv2MAjxV1///WDiYxSJ0tHsgn2uqg+
	IRaiQWPEADsAcDq2OQooSuVVOp0wb58=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789144430;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p/UJqNfydeXO6VFPzh2hLVIkw0b4mCxKVWY6mrleRz8=;
	b=easVLzsIAKR2bafPwZO7d5SK4XN5sHiJX88vJWeTOKi3bvrAT4k09ER9rqHTYEJmrYFpzh
	mhhv+YKn+Ias20Bw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=o9aIEcBn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zs3EhgNF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789144426; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p/UJqNfydeXO6VFPzh2hLVIkw0b4mCxKVWY6mrleRz8=;
	b=o9aIEcBnjQh55QfyQzcjYT8+NEMksn9Q3FS04/9xSLhglvsAj9OUuoAIi//yoDdP1oFOEM
	CNcNvMfT5vfKZtSECaI90pmvxtAM3EqYszBl6KR0vtWcO/E92Hz4CUlaOUlkpk3xJZ94Hm
	f2K5kAPXKDHEiIdFQPxmRuvAfUuA7DE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789144426;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p/UJqNfydeXO6VFPzh2hLVIkw0b4mCxKVWY6mrleRz8=;
	b=zs3EhgNFc18HLWJPNXJeEqlctbUfUvM2nXMSQkBkgraOAlh3ibNfBc8Cear/teDKBLfN/o
	PNx/HAjTA/ZjlDBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9E473132D3;
	Fri, 11 Sep 2026 16:33:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Ng/3GGktpGqJeQAAD6G6ig
	(envelope-from <krisman@suse.de>); Fri, 11 Sep 2026 16:33:45 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Jann Horn <jannh@google.com>, Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, Dominik Maier
 <dmnk+artist@google.com>, stable+noautosel@kernel.org, Jann Horn
 <jannh@google.com>
Subject: Re: [PATCH] io_uring/fdinfo: ignore IORING_CQE_F_32 in last CQ
 array slot
In-Reply-To: <20260911-uring-fdinfo-tighten-v1-1-47c62a154aca@google.com>
Organization: SUSE
References: <20260911-uring-fdinfo-tighten-v1-1-47c62a154aca@google.com>
Date: Fri, 11 Sep 2026 13:33:42 -0300
Message-ID: <87y0d721eh.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: 658F121D4C
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[artist,noautosel];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

Jann Horn <jannh@google.com> writes:

>
> diff --git a/io_uring/fdinfo.c b/io_uring/fdinfo.c
> index 3ae4804765b9..0b656a6c8428 100644
> --- a/io_uring/fdinfo.c
> +++ b/io_uring/fdinfo.c
> @@ -155,9 +155,11 @@ static void __io_uring_show_fdinfo(struct io_ring_ctx *ctx, struct seq_file *m)
>  	for (i = 0; i < cq_entries; i++) {
>  		struct io_uring_cqe *cqe;
>  		bool cqe32 = false;
> +		bool is_last_cqarray_slot = (cq_head == cq_mask);
>  
>  		cqe = &r->cqes[(cq_head & cq_mask)];
> -		if (cqe->flags & IORING_CQE_F_32 || ctx->flags & IORING_SETUP_CQE32)
> +		if ((cqe->flags & IORING_CQE_F_32 || ctx->flags & IORING_SETUP_CQE32) &&
> +		    !is_last_cqarray_slot)

Could we have a small comment here explaining we can't just trust
IORING_CQE_F_32 for the last slot?  it is very non-obvious to me from
the code. Something as simple as (if I got it right):

/* userspace can manipulate IORING_CQE_F_32 which is usually harmless,
 * except in the last CQ slot.  Ignore the flag only for that slot to avoid
 * reading memory out-of-bounds.
 */

Either way,

Reviewed-by: Gabriel Krisman Bertazi <krisman@suse.de>

Thanks,

>  			cqe32 = true;
>  		seq_printf(m, "%5u: user_data:%llu, res:%d, flags:%x",
>  			   cq_head & cq_mask, cqe->user_data, cqe->res,
>
> ---
> base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
> change-id: 20260910-uring-fdinfo-tighten-1b1c18945305
>
> Best regards,
> --  
> Jann Horn <jannh@google.com>
>

-- 
Gabriel Krisman Bertazi
