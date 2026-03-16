Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736A93D3CF4
	for <io-uring@vger.kernel.org>; Mon, 16 Mar 2026 20:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773693260; cv=none; b=e0V5I4pxLhWshTivD/Iv8yg/fPWdeOpNN2nTkD3Ns0HfHDmTkvT0NbKYshbHckqi08YRSTj9C3HdDwNueK5tLBF5H+PJTOZtPS8s8Bk7bU1mNSrUoXZTYgB0U142GA8qHxX4Y9V/P4oeI6E2Tjf2ws3VfdZBdpr4bviorK5TISE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773693260; c=relaxed/simple;
	bh=cC1TlHnni3l/9jwoH1LXWKnxlf3hMgoTHw5eU/+zhMs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fXNgVfohZiG5BY3zMD8zvsurt9mcKFVHnR6fYbevnPys3Ki3ESnhfZfPw0H3LEeYM8frfxi6rpSDfSUGS5wLiQiIkD1cbyLWu46XSSMZZjV2TqmdThF6b2un0BNP3pIG8lEcDyeEqHEDsUe438ukO/AU13e8xMavB1ao3POBq7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D5Bupp+V; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TjrtYjZ3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D5Bupp+V; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TjrtYjZ3; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D5Bupp+V";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TjrtYjZ3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D5Bupp+V";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TjrtYjZ3"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5F4BB4D30B;
	Mon, 16 Mar 2026 20:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773693257; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NI7fw4SNs93c1HqhPXA/A3ZWoTxoe3NDno1SejkKIds=;
	b=D5Bupp+VUH3bizJas7X6G5AtFMyai79sAqXVttk+75LRrVFRBdJuNy+0MbjfxL9JHT+vOH
	hL0bCqbC/wbB2OtjVfh9BY1fJqq+rl+bIItburP5cWILpPiKEOqtOA2YHDTY+32Ft+2ikr
	EmyJdF98GFQ14k8gOaMdzf9FtsB/vVc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773693257;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NI7fw4SNs93c1HqhPXA/A3ZWoTxoe3NDno1SejkKIds=;
	b=TjrtYjZ3uXYZ+f+yfGOgB1QBaPzJVj0aB+8jrv7qz+n8tF71Mr+YGK8zbXIBabgYTMkBwJ
	HeUVMPuTd1yP9GBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=D5Bupp+V;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=TjrtYjZ3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773693257; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NI7fw4SNs93c1HqhPXA/A3ZWoTxoe3NDno1SejkKIds=;
	b=D5Bupp+VUH3bizJas7X6G5AtFMyai79sAqXVttk+75LRrVFRBdJuNy+0MbjfxL9JHT+vOH
	hL0bCqbC/wbB2OtjVfh9BY1fJqq+rl+bIItburP5cWILpPiKEOqtOA2YHDTY+32Ft+2ikr
	EmyJdF98GFQ14k8gOaMdzf9FtsB/vVc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773693257;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NI7fw4SNs93c1HqhPXA/A3ZWoTxoe3NDno1SejkKIds=;
	b=TjrtYjZ3uXYZ+f+yfGOgB1QBaPzJVj0aB+8jrv7qz+n8tF71Mr+YGK8zbXIBabgYTMkBwJ
	HeUVMPuTd1yP9GBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 21C154273B;
	Mon, 16 Mar 2026 20:34:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3R9mAUlpuGlIGgAAD6G6ig
	(envelope-from <krisman@suse.de>); Mon, 16 Mar 2026 20:34:17 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org
Subject: Re: [PATCH 1/2] io_uring: switch struct io_ring_ctx internal
 bitfields to flags
In-Reply-To: <af3311c8-21b0-4641-bce3-d9bc2e2367c5@kernel.dk> (Jens Axboe's
	message of "Sun, 15 Mar 2026 08:46:57 -0600")
Organization: SUSE
References: <20260314145920.86796-1-axboe@kernel.dk>
	<20260314145920.86796-2-axboe@kernel.dk>
	<87sea1wzmr.fsf@mailhost.krisman.be>
	<af3311c8-21b0-4641-bce3-d9bc2e2367c5@kernel.dk>
Date: Mon, 16 Mar 2026 16:34:15 -0400
Message-ID: <87jyvbwm2g.fsf@mailhost.krisman.be>
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
	ASN(0.00)[asn:32098, ipnet:2800::/6, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 5F4BB4D30B

Jens Axboe <axboe@kernel.dk> writes:

> On 3/14/26 9:16 PM, Gabriel Krisman Bertazi wrote:
>
>> Jens Axboe <axboe@kernel.dk> writes:
>> 
>>> Bitfields cannot be set and checked atomically, and this makes it more
>>> clear that these are indeed in shared storage and must be checked and
>>> set in a sane fashion. This is in preparation for annotating a few of
>>> the known racy, but harmless, flags checking.
>>>
>>> No intended functional changes in this patch.
>>>
>>> Signed-off-by: Jens Axboe <axboe@kernel.dk>
>>> ---
>>>  include/linux/io_uring_types.h | 32 +++++++------
>>>  io_uring/eventfd.c             |  4 +-
>>>  io_uring/io_uring.c            | 82 +++++++++++++++++-----------------
>>>  io_uring/io_uring.h            |  9 ++--
>>>  io_uring/msg_ring.c            |  2 +-
>>>  io_uring/register.c            |  8 ++--
>>>  io_uring/rsrc.c                |  8 ++--
>>>  io_uring/tctx.c                |  2 +-
>>>  io_uring/timeout.c             |  4 +-
>>>  io_uring/tw.c                  |  2 +-
>>>  10 files changed, 80 insertions(+), 73 deletions(-)
>>>
>>> diff --git a/include/linux/io_uring_types.h b/include/linux/io_uring_types.h
>>> index dd1420bfcb73..b84576374c7b 100644
>>> --- a/include/linux/io_uring_types.h
>>> +++ b/include/linux/io_uring_types.h
>>> @@ -268,24 +268,28 @@ struct io_alloc_cache {
>>>  	unsigned int		init_clear;
>>>  };
>>>  
>>> +enum {
>>> +	IO_RING_F_DRAIN_NEXT		= BIT(0),
>>> +	IO_RING_F_OP_RESTRICTED		= BIT(1),
>>> +	IO_RING_F_REG_RESTRICTED	= BIT(2),
>>> +	IO_RING_F_OFF_TIMEOUT_USED	= BIT(3),
>>> +	IO_RING_F_DRAIN_ACTIVE		= BIT(4),
>>> +	IO_RING_F_HAS_EVFD		= BIT(5),
>>> +	/* all CQEs should be posted only by the submitter task */
>>> +	IO_RING_F_TASK_COMPLETE		= BIT(6),
>>> +	IO_RING_F_LOCKLESS_CQ		= BIT(7),
>>> +	IO_RING_F_SYSCALL_IOPOLL	= BIT(8),
>>> +	IO_RING_F_POLL_ACTIVATED	= BIT(9),
>>> +	IO_RING_F_DRAIN_DISABLED	= BIT(10),
>>> +	IO_RING_F_COMPAT		= BIT(11),
>>> +	IO_RING_F_IOWQ_LIMITS_SET	= BIT(12),
>>> +};
>>> +
>>>  struct io_ring_ctx {
>>>  	/* const or read-mostly hot data */
>>>  	struct {
>>>  		unsigned int		flags;
>>> -		unsigned int		drain_next: 1;
>>> -		unsigned int		op_restricted: 1;
>>> -		unsigned int		reg_restricted: 1;
>>> -		unsigned int		off_timeout_used: 1;
>>> -		unsigned int		drain_active: 1;
>>> -		unsigned int		has_evfd: 1;
>>> -		/* all CQEs should be posted only by the submitter task */
>>> -		unsigned int		task_complete: 1;
>>> -		unsigned int		lockless_cq: 1;
>>> -		unsigned int		syscall_iopoll: 1;
>>> -		unsigned int		poll_activated: 1;
>>> -		unsigned int		drain_disabled: 1;
>>> -		unsigned int		compat: 1;
>>> -		unsigned int		iowq_limits_set : 1;
>>> +		unsigned int		int_flags;
>> 
>> Jens,
>> 
>> What does the int prefix means in this context?
>
> It's just short for 'internal'.

ack.  Perhaps a comment indicating this is internal would be
useful. Otherwise,

Reviewed-by: Gabriel Krisman Bertazi <krisman@suse.de>


-- 
Gabriel Krisman Bertazi
