Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2EA3911C9
	for <io-uring@vger.kernel.org>; Wed, 15 Jul 2026 15:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784129146; cv=none; b=lfvpSs4mE04bgI/zaU5CUSeit2b9e5ise+oYqF+QP9GbK1LkV0NsQ754XBywe/CqxMwfgU9d/0lfw4mTRE0dk2opuXDGR/nL1pJMc6NDz12IeaBUo7oHwMbG/6VcWQAj7kZqMXsWeqZrBtadnSUaGl0wCLsTOmLeF5sk3KFhLT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784129146; c=relaxed/simple;
	bh=0kOOyuLuTk0+y3jhU6qU0pLocN3+x2Y76cgGXgV91jg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AkGBSVEcWXJvQoinEtrdW5ZVWCvYRvJu66S050xIgq4GJ5c3k851JcnASMRmp7I8JiVDTZi+ynvXt6pTgVYzwImkfcZmx7MvAneWEAy4XrMilpMnIn3MGcW2L1Sz0MfN/IitW9eqzDp5YqiMAtKW/aTCVP08+95wjyoRiSLAtt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=amYDNnBi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Gfmvio/1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=amYDNnBi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Gfmvio/1; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="amYDNnBi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Gfmvio/1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="amYDNnBi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Gfmvio/1"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 269B078465;
	Wed, 15 Jul 2026 15:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784129143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AiEoVQiA54eEhQAMav6LpsI+JGs3KPnSc/h4MfxJvUE=;
	b=amYDNnBiIG2yuqZcEq1uNcK/FQOgMiEAF4rYn4zRmMV17Du/JJkltv1yKXt8zr7qyNdr89
	j2MEE8m86eedz2ND5nf8be8EtIfiSM1r/RFktcEOAIR5NT5wzxDiLGRqFuXpSVs6ozvyir
	JYC1GUix+MaBS3ibOwxsGkPypAkZZxI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784129143;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AiEoVQiA54eEhQAMav6LpsI+JGs3KPnSc/h4MfxJvUE=;
	b=Gfmvio/133F7D18lUMQLQwqGODy30JbpSmze3bIwM0HIvJVeVMDLvlgaPcuEmX+xtrj6gs
	VWIrA+PV/C714nCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=amYDNnBi;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="Gfmvio/1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784129143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AiEoVQiA54eEhQAMav6LpsI+JGs3KPnSc/h4MfxJvUE=;
	b=amYDNnBiIG2yuqZcEq1uNcK/FQOgMiEAF4rYn4zRmMV17Du/JJkltv1yKXt8zr7qyNdr89
	j2MEE8m86eedz2ND5nf8be8EtIfiSM1r/RFktcEOAIR5NT5wzxDiLGRqFuXpSVs6ozvyir
	JYC1GUix+MaBS3ibOwxsGkPypAkZZxI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784129143;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AiEoVQiA54eEhQAMav6LpsI+JGs3KPnSc/h4MfxJvUE=;
	b=Gfmvio/133F7D18lUMQLQwqGODy30JbpSmze3bIwM0HIvJVeVMDLvlgaPcuEmX+xtrj6gs
	VWIrA+PV/C714nCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D9FB5779AD;
	Wed, 15 Jul 2026 15:25:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 52Q/KXamV2qmCgAAD6G6ig
	(envelope-from <krisman@suse.de>); Wed, 15 Jul 2026 15:25:42 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Damien Le Moal <dlemoal@kernel.org>, io-uring@vger.kernel.org
Subject: Re: [PATCH 4/5] man: add io_uring_prep_cmd_zone_reset_all.3 man page
In-Reply-To: <20260715063947.2933606-5-hch@lst.de>
Organization: SUSE
References: <20260715063947.2933606-1-hch@lst.de>
 <20260715063947.2933606-5-hch@lst.de>
Date: Wed, 15 Jul 2026 11:25:32 -0400
Message-ID: <8733xk46mr.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 269B078465
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,mailhost.krisman.be:mid,suse.de:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Christoph Hellwig <hch@lst.de> writes:

> Add doccumentation for the new zone reset all io_uring cmd.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  man/io_uring_prep_cmd_zone_reset_all.3 | 54 ++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 man/io_uring_prep_cmd_zone_reset_all.3
>
> diff --git a/man/io_uring_prep_cmd_zone_reset_all.3 b/man/io_uring_prep_cmd_zone_reset_all.3
> new file mode 100644
> index 000000000000..251a300c5ed1
> --- /dev/null
> +++ b/man/io_uring_prep_cmd_zone_reset_all.3
> @@ -0,0 +1,54 @@
> +.\" Copyright (C) 2026 Christoph Hellwig <hch@lst.de>
> +.\"
> +.\" SPDX-License-Identifier: LGPL-2.0-or-later
> +.\"
> +.TH io_uring_prep_cmd_zone_reset_all 3 "Jul 14, 2026" "liburing-2.8" "liburing Manual"

liburing-2.16

> +.SH NAME
> +io_uring_prep_cmd_zone_reset_all \- prepare a zone_reset_all command
> +.SH SYNOPSIS
> +.nf
> +.B #include <liburing.h>
> +.PP
> +.BI "void io_uring_prep_cmd_zone_reset_all(struct io_uring_sqe *" sqe ", int " fd ");"
> +.fi
> +.SH DESCRIPTION
> +The
> +.BR io_uring_prep_cmd_zone_reset_all (3)
> +function prepares a zone_reset_all command request. The submission queue entry
> +.I sqe
> +is setup to reset all sequential write required zones on the block device
> +pointed to by
> +.IR fd .
> +
> +This command does not synchronize against concurrent file operations, including
> +but not limited to reads, write, ioctls and other uring_cmds and only performs
> +a best effort invalidation of the page cache for the device.  The user has
> +to make sure that no other in-flight requests are modifying or reading the
> +range(s). If that is the case, it might result in stale page cache and data
> +inconsistencies.
> +
> +Available since Linux 7.TBD.
> +
> +.SH RETURN VALUE
> +None
> +.SH ERRORS
> +The CQE
> +.I res
> +field will contain the result of the operation. On success, this field will be
> +set to
> +.B 0 .
> +On error, a negative error value is returned. Note that where synchronous
> +system calls will return
> +.B -1
> +on failure and set
> +.I errno
> +to the actual error value, io_uring never uses
> +.IR errno .
> +Instead it returns the negated
> +.I errno
> +directly in the CQE
> +.I res
> +field.
> +.SH SEE ALSO
> +.BR io_uring_get_sqe (3),
> +.BR io_uring_submit (3),
> -- 
> 2.53.0
>

-- 
Gabriel Krisman Bertazi
