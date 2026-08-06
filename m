Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF642C11E6;
	Thu,  6 Aug 2026 16:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786033332; cv=none; b=EG+xLW2ht2rHW0ejIRZoXWTkVvailtVgYkcFokazsxQdiIjjfCfUemd2GY6QMTY1CIexzunamhfOG4beifoUeQUV8Lx44j8aeI7SY1HHuTsZSb96HZqmVarAVeHeRflhD2EAe/fcwtLo6p1dqIVqMnDVK8fOXOm6PAnohf9lx00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786033332; c=relaxed/simple;
	bh=cAfpMIkcI4KyMXMcd1uRNLn0THexrKl+EM4guMXxgYE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=L6RUcizZyMiuV4MRh6XeNVx8YlI0BGE90oYo5pTfyWyxoUEV4SA9eGsz2pWRV8JCsFQ7CFZzFB97zl22Rwz5RVjwIBWaysSbt18uyuSGCfNV1FHY+ED4ekovzY2ZD36AXsqt9ztLyubAIba2izQics56v/0Jsw+5xVooCPjAV8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wT/qRv9P; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HUFf46lQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hHM4leR7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=h4dVSzPX; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wT/qRv9P";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HUFf46lQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hHM4leR7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h4dVSzPX"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CC0273E05;
	Thu,  6 Aug 2026 16:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786033324; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wXhhYNvJNVxvuVG9MHa8u7wEPHdI0/gzBb5T2bpJvF8=;
	b=wT/qRv9PaAAYMPXsaBSMk8Fcer3IJTSwk2oZ2jHy39tOM/BpuU20Qf/c3/bXKFLu2gYO34
	vHKSHYOByFTaGTpSmKb0BPSvLAqYRt6XvGRtU9ejFVoaJwieRW6lWbAQyVC+jIexit0d9t
	it3pbyAnGF9D7x1J/zjCWPJEu1TokZM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786033324;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wXhhYNvJNVxvuVG9MHa8u7wEPHdI0/gzBb5T2bpJvF8=;
	b=HUFf46lQsGO3ejJHyUls+YXe0q9PQpC5QUukqQzBHoQkZqaTAQQbHaDwkMBYHWy6X5TWEc
	Ljrz2ZSYuw7aM7Cg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786033320; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wXhhYNvJNVxvuVG9MHa8u7wEPHdI0/gzBb5T2bpJvF8=;
	b=hHM4leR7OzJYCByatpVryL/Sxw3xxKO5aGMCrT6QYKyBuxxos4485ciBlk0UobqUPA+vLA
	Zq6Pnwfg4Av1CUCK6w1m61VkLcvocwqM3lezYDR9r3kbbwfmXLlElMWs3mFJjsFY2JDCsC
	SDUt+3EQ8PPv+5+RThlO2bUmPkXXNis=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786033320;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wXhhYNvJNVxvuVG9MHa8u7wEPHdI0/gzBb5T2bpJvF8=;
	b=h4dVSzPXN1/+cNEUF2rS1ZaTDlzvS2yF+1AfIXPX2xeS2981k/ramUdgKzZNILIHiya7yE
	tPHaboVxbBWbayCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 90162779B6;
	Thu,  6 Aug 2026 16:22:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JTN+HKi0dGosRwAAD6G6ig
	(envelope-from <krisman@suse.de>); Thu, 06 Aug 2026 16:22:00 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Ali Ahmet Memis <ali@iusegentoo.com>, Jens Axboe <axboe@kernel.dk>
Cc: Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: io_uring/memmap: compound allocation larger than accounted region
In-Reply-To: <20260806154200.183725-1-ali@iusegentoo.com>
Organization: SUSE
References: <20260806154200.183725-1-ali@iusegentoo.com>
Date: Thu, 06 Aug 2026 12:21:54 -0400
Message-ID: <87ik5ncj8d.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iusegentoo.com:email,mailhost.krisman.be:mid,imap1.dmz-prg2.suse.org:helo]

Ali Ahmet Memis <ali@iusegentoo.com> writes:

> io_mem_alloc_compound() allocates get_order(size) pages, while
> io_create_region() accounts reg->size >> PAGE_SHIFT. For a ring with 4096 SQ
> entries and the default CQ size that is 64 pages allocated against 37
> accounted.
>
> Is that intentional? memcg charges the full allocation, so only RLIMIT_MEMLOCK
> undercounts, and the gap is bounded by 2x. I did not want to send a patch for
> something that may well be a deliberate trade for the single folio.

I don't think that is intentional, beyond a simplification of the
code.  If it is, it seems like a bad idea. Not necessarily harmful in
itself, but we should be accounting properly and not doing it if it goes
above the rlimit.

-- 
Gabriel Krisman Bertazi
