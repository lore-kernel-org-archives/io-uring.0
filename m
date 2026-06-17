Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A6F4A3414
	for <io-uring@vger.kernel.org>; Wed, 17 Jun 2026 15:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781710935; cv=none; b=jTh0n8yIuyWPXXD20YVWUkwuJrtlu3Q/n1RZOSn+768QSBPkmhzqKgmUIR5mQ38iIjIIUnZu8pvCRwsP5Y+GqXtY1q7p59AR5ptHL5cqm4CfvnKnq6o/qphdHQotwc1aOLelMRppRhleAJ01/blyUXRGMTvLQzWRfKzXrkl7/Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781710935; c=relaxed/simple;
	bh=lZcNAoP08lGkD9cDTqavCunAxgdyt7NKehVIprEev0Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=P5D3gUPWCSVXYgVqp+HG8vDUdE6QHy2gaHFa5VyLJKYRC/U0rcGS+eRJgedRznBQe5DyG7SKjUn1d5lm4MAVV/HMyThGRT1oQEKOiSMc1EoNGgHFrv9VQbgfsxDCRQ1xQ7z+Wa5dqOgoMBikHp1mJ85rRqQUiT8XsKRNkxYIsZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fs+TVfGL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dQZHZbVf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fW5moRPV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lvwf5XOj; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fs+TVfGL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dQZHZbVf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fW5moRPV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lvwf5XOj"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5103E75CFB;
	Wed, 17 Jun 2026 15:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781710921; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9sN9Ok6hqDHaIQIEI6sGwocwIe7vR3RqH3aUMo5cNfM=;
	b=fs+TVfGLtySDUp/pwogDOJVl4/A73br+D/+bur8MQViXYDIvDsYY/vVoq2jTXA3TIJWEBE
	KuHaeJZSC5sz4fvlfsH9fYoWin9AuQwkl6//rZ0gULrwOLRpIbOhS/GVNR4aZtDdL3fvTv
	X6VXaIjFMXn3w/ojbt/2rI6Xrj68FAQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781710921;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9sN9Ok6hqDHaIQIEI6sGwocwIe7vR3RqH3aUMo5cNfM=;
	b=dQZHZbVfSOWhQiRg5HyapsqguL1sQWKnZofW7YK2JOPNZzQ/m5BVTyBHhLjDSfXoO9yfmA
	ZXkMXenj64kwH4CQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781710917; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9sN9Ok6hqDHaIQIEI6sGwocwIe7vR3RqH3aUMo5cNfM=;
	b=fW5moRPV/BLMgbfNRCyQeoOTrdbvApWoCpTplGsDZoFDSURUVMEqPFIDZuQTKtqlCLenW4
	/r+p4XElBh54X1MLj3iLUr5pcGBUmbXZ69eosqVcjRiy7fo7W0BhGxu2gt0+OMAMtsO9bv
	IhuFQv17oDEbr9ViP29Lf8N2J5XuAgw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781710917;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9sN9Ok6hqDHaIQIEI6sGwocwIe7vR3RqH3aUMo5cNfM=;
	b=lvwf5XOjM6fgyvps4P5yttxHJPkIpFyJbLVIuO3hJ5rumMkiEen45Y74i4+4ZPMnsmqV4Q
	h6zLVsQGqsCVDsAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 012A9779A8;
	Wed, 17 Jun 2026 15:41:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WAa8L0TAMmoeagAAD6G6ig
	(envelope-from <krisman@suse.de>); Wed, 17 Jun 2026 15:41:56 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Jens Axboe <axboe@kernel.dk>, Yang Xiuwei <yangxiuwei@kylinos.cn>
Cc: io-uring@vger.kernel.org
Subject: Re: [PATCH] io_uring/net: fix netmsg_cache iovec leak on BIND and
 CONNECT
In-Reply-To: <870ac7c0-a521-45b0-ab0b-fed5f97a319f@kernel.dk>
References: <20260617025348.1301777-1-yangxiuwei@kylinos.cn>
 <20260617033035.1373691-1-yangxiuwei@kylinos.cn>
 <870ac7c0-a521-45b0-ab0b-fed5f97a319f@kernel.dk>
Date: Wed, 17 Jun 2026 11:41:55 -0400
Message-ID: <877bnxfa2k.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kernel.dk:email,mailhost.krisman.be:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Score: -4.30

Jens Axboe <axboe@kernel.dk> writes:

> On 6/16/26 9:30 PM, Yang Xiuwei wrote:
>> Hi Jens,
>> 
>> Please drop this patch.
>
> Haven't picked it up, nothing to drop.
>
>> After rebasing on the latest io_uring tree, I noticed that this issue
>> has already been fixed upstream by:
>> 
>>   3979840cd858 ("io_uring/net: Avoid msghdr on op_connect/op_bind async data")
>> 
>> BIND and CONNECT no longer allocate async data from netmsg_cache via
>> io_msg_alloc_async(). They now use struct sockaddr_storage directly, so
>> the iovec leak path described in my patch no longer exists. My fix is
>> also incorrect on the current code base.
>
> But then we should probably mark 3979840cd858 for stable, then? Gabriel,
> can you take a look? Currently traveling...

ack. will do.

-- 
Gabriel Krisman Bertazi
