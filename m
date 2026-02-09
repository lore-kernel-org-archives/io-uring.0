Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA97125B2
	for <io-uring@vger.kernel.org>; Mon,  9 Feb 2026 14:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770647793; cv=none; b=rSvA55yPlKjbS0vJktORDGjlZfdi7LOsYOk9iJs7/0odjMUC8uqRakMlieXoZRZWbuIv3DsGBNN5+A4SMTM/tCWyiDMrenLjlB359+Wge9wCMpdUrIQ2fZ3Zq5B3VXK2HeBE/DWA3M5mw4NfCGIQWXI95DToOvz7k0366uN5E4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770647793; c=relaxed/simple;
	bh=Z88JPvpWq9DOsS1NMWfvEh+pV5ASgiL6ftk6rPhUOt4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UbNid92BD3JRF+wgQZlIJeC+xqhS8bUuvJMX8TJcYcVUHQyiae8iSF5y26uMQAYdgROOj5KdMNqpHs+op15TXxXfL3jkjZpcu7eVNPQv3c25+PIf5KYRzSFugZCRlG837b+ULteHxlQqMpaNRb3TLPleh7+3gpKecC7rU7G5j/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dm0BzZ9O; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CPXnsbr7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dm0BzZ9O; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CPXnsbr7; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dm0BzZ9O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CPXnsbr7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dm0BzZ9O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CPXnsbr7"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A3B473E71F;
	Mon,  9 Feb 2026 14:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770647791; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y4fvPua73wst0xbmQzOlPu9X6W7c/Wv2lY9Itw+jOqw=;
	b=dm0BzZ9OOlQWYn8J/Hn6Beq+bP6Pnlyg/YyHSLnpnDzSgG3CHCytJ7EtzKG3X7mCS26H5e
	v6O2KKTzMsThOC5DPmnYPFdfDI8j5blhddutkoPoSJiijx6ixabGMvnAGLybib5ogkgg2f
	bZbCaAOzLFskUBGlhnqQHkGo2D5q2WA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770647791;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y4fvPua73wst0xbmQzOlPu9X6W7c/Wv2lY9Itw+jOqw=;
	b=CPXnsbr70r/3SQPsSAYP2jft+anOypNQkfov0j5X77MpuDSsFKjT0ddXyjURrk0sV0UQSX
	wRp38bSLaZnQC3Cw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dm0BzZ9O;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=CPXnsbr7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770647791; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y4fvPua73wst0xbmQzOlPu9X6W7c/Wv2lY9Itw+jOqw=;
	b=dm0BzZ9OOlQWYn8J/Hn6Beq+bP6Pnlyg/YyHSLnpnDzSgG3CHCytJ7EtzKG3X7mCS26H5e
	v6O2KKTzMsThOC5DPmnYPFdfDI8j5blhddutkoPoSJiijx6ixabGMvnAGLybib5ogkgg2f
	bZbCaAOzLFskUBGlhnqQHkGo2D5q2WA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770647791;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y4fvPua73wst0xbmQzOlPu9X6W7c/Wv2lY9Itw+jOqw=;
	b=CPXnsbr70r/3SQPsSAYP2jft+anOypNQkfov0j5X77MpuDSsFKjT0ddXyjURrk0sV0UQSX
	wRp38bSLaZnQC3Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5128C3EA63;
	Mon,  9 Feb 2026 14:36:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6JI6CO/wiWn/IwAAD6G6ig
	(envelope-from <krisman@suse.de>); Mon, 09 Feb 2026 14:36:31 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,  Andrew Morton <akpm@linux-foundation.org>,
  David Hildenbrand <david@kernel.org>,  Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>,  Vlastimil Babka <vbabka@suse.cz>,  "Liam R.
 Howlett" <Liam.Howlett@oracle.com>,  Mike Rapoport <rppt@kernel.org>,
  Suren Baghdasaryan <surenb@google.com>,  Michal Hocko <mhocko@suse.com>,
  linux-mm@kvack.org
Subject: Re: [PATCH 2/2] io_uring: introduce IORING_OP_MMAP
In-Reply-To: <efa7714d-565d-41c4-af85-d7a89e7fa399@kernel.dk> (Jens Axboe's
	message of "Fri, 30 Jan 2026 08:55:50 -0700")
Organization: SUSE
References: <20260129221138.897715-1-krisman@suse.de>
	<20260129221138.897715-3-krisman@suse.de>
	<efa7714d-565d-41c4-af85-d7a89e7fa399@kernel.dk>
Date: Mon, 09 Feb 2026 09:36:25 -0500
Message-ID: <87fr7a9e6u.fsf@mailhost.krisman.be>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Score: -4.51
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: A3B473E71F
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Jens Axboe <axboe@kernel.dk> writes:

> On 1/29/26 3:11 PM, Gabriel Krisman Bertazi wrote:
>
>> diff --git a/include/uapi/linux/io_uring.h b/include/uapi/linux/io_uring.h
>> index b5b23c0d5283..e24fe3b00059 100644
>> --- a/include/uapi/linux/io_uring.h
>> +++ b/include/uapi/linux/io_uring.h
>> @@ -74,6 +74,7 @@ struct io_uring_sqe {
>>  		__u32		install_fd_flags;
>>  		__u32		nop_flags;
>>  		__u32		pipe_flags;
>> +		__u32		mmap_flags;
>>  	};
>>  	__u64	user_data;	/* data to be passed back at completion time */
>>  	/* pack this to avoid bogus arm OABI complaints */
>> @@ -303,6 +304,7 @@ enum io_uring_op {
>>  	IORING_OP_PIPE,
>>  	IORING_OP_NOP128,
>>  	IORING_OP_URING_CMD128,
>> +	IORING_OP_MMAP,
>>  
>>  	/* this goes last, obviously */
>>  	IORING_OP_LAST,
>> @@ -1113,6 +1115,14 @@ struct zcrx_ctrl {
>>  	};
>>  };
>>  
>> +struct io_uring_mmap_desc {
>> +	void __user *addr;
>> +	unsigned long len;
>> +	unsigned long pgoff;
>> +	unsigned int prot;
>> +	unsigned int flags;
>> +};
>
> You can't use pointers or unsigned long or unsigned int in a uapi, as

Thanks for the review, Jens.

I went on vacation right after sending this, but I will follow up with a v2 shortly.

-- 
Gabriel Krisman Bertazi
