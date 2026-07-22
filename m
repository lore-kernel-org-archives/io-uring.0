Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506AF3ADB89
	for <io-uring@vger.kernel.org>; Wed, 22 Jul 2026 20:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784752397; cv=none; b=pgzT20gWFzlzNXJMi0lZ8cFGdt4ffhXQELebI8rp/S+5f1OTbehdpuZnJPBxo4rPjAmgBMUshwKEM5vLYb0K3ZLw/ljRdrlOqB6jNcEjLeMqMIvhNtCRY0U3AhdTn/decAt0fBiM8iruPeWILxzTpiNTYoHfZ8Vd0adFN9BGh7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784752397; c=relaxed/simple;
	bh=MfCRKegkFVizyUh4vuI4YfzorHcWDoTTgP+KbCF0yuQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=msFH94Q3YLxcOdvAUxrRgGDi3yIQo3qkixfu8cqUfGHRZ+mxzE5l1lKnLaDdKe6cRDWokG+KBH0NKp5DJBzUbOLdbSf9xUv48aoRKK5vCLoMEytEBN4WLf4sFiv+6z6MTKWBEFuEqXWGOEMCTa3N/9A589dqwn0Ej/XcWGxyFhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Yf91Vhh6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=h++PMYkn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Yf91Vhh6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=h++PMYkn; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Yf91Vhh6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h++PMYkn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Yf91Vhh6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h++PMYkn"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 224737ACA6;
	Wed, 22 Jul 2026 20:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784752394; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0upD/F3W4Xle9cP7+2oDL5Er8BGo/wJvicFplB1Qx3c=;
	b=Yf91Vhh6hwEh321FjOci/snrl7np+LilSiS4plBbTDCEJW6KoUQimybqIqkfM8NUUHzX//
	oKXzz9z0YzAAvuUxPQ33oUDvjmZNKzNcbJcMb8JEScnGvGFsRkc/w1/JRyD7fkBW+DUYIC
	1qXUD55hZA7u15+hyMqVhKQN9u67oHk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784752394;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0upD/F3W4Xle9cP7+2oDL5Er8BGo/wJvicFplB1Qx3c=;
	b=h++PMYknV9e9SDP9RDrejjPhfjAgY9GDOisalEDxh/cVKe+mYhAZmxVG1/9FzCIQLnB092
	kRe00gPLk3Kbx7Cw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784752394; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0upD/F3W4Xle9cP7+2oDL5Er8BGo/wJvicFplB1Qx3c=;
	b=Yf91Vhh6hwEh321FjOci/snrl7np+LilSiS4plBbTDCEJW6KoUQimybqIqkfM8NUUHzX//
	oKXzz9z0YzAAvuUxPQ33oUDvjmZNKzNcbJcMb8JEScnGvGFsRkc/w1/JRyD7fkBW+DUYIC
	1qXUD55hZA7u15+hyMqVhKQN9u67oHk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784752394;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0upD/F3W4Xle9cP7+2oDL5Er8BGo/wJvicFplB1Qx3c=;
	b=h++PMYknV9e9SDP9RDrejjPhfjAgY9GDOisalEDxh/cVKe+mYhAZmxVG1/9FzCIQLnB092
	kRe00gPLk3Kbx7Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C214D779B0;
	Wed, 22 Jul 2026 20:33:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id c8C2IgkpYWogTwAAD6G6ig
	(envelope-from <krisman@suse.de>); Wed, 22 Jul 2026 20:33:13 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org
Subject: Re: [PATCH liburing 1/2] test/send_recvmsg: Preserve msghdr until
 op_recvmsg completes
In-Reply-To: <87fr1aeqwm.fsf@mailhost.krisman.be>
Organization: SUSE
References: <20260722181710.79099-1-krisman@suse.de>
 <20260722181710.79099-2-krisman@suse.de>
 <6f31dd5b-639e-4018-815b-0fa04a39b337@kernel.dk>
 <87fr1aeqwm.fsf@mailhost.krisman.be>
Date: Wed, 22 Jul 2026 16:33:12 -0400
Message-ID: <87cxweepdj.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,mailhost.krisman.be:mid,kernel.dk:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 

Gabriel Krisman Bertazi <krisman@suse.de> writes:

> Jens Axboe <axboe@kernel.dk> writes:
>
>> On 7/22/26 12:17 PM, Gabriel Krisman Bertazi wrote:
>>> msghdr is allocated on the stack at recv_prep, which means it may go out
>>> of scope before the kernel has a chance to complete the operation.  This
>>> results in spurious test failures when we reach far enough into recv_fn
>>> to reuse the stack space before op_recvmsg executes.  I found it easily
>>> reproducible when compiling with '-O0 -g3' to avoid gcc from optimizing
>>> further local variables out of the stack.
>>
>> Hmm, but that should be fine as long as a) we submit in scope, and b)
>> we're not using SQPOLL, where it does need to remain consistent until
>> completion.
>>
>> And recv_prep() certainly submits before it returns, and we're not using
>> SQPOLL. So I'm curious what issue this is?? Same questions on patch 2.
>
> Hm, I assumed it was submitted via iowq, which would explain this,
> because the execution in io_recvmsg() passes a pointer to the original
> memory:

So, __sys_recvmsg_sock during the inline attempt throws -EAGAIN at
first, which makes io_recv return IOU_RETRY, which punts to tw after
the socket is ready.  By tracing, I can see the tw is executed only
during the io_uring_enter from io_uring_wait_cqe, which is when
__sys_recvmsg_sock touches sr->umsg pointing to an already out-of-scope
stack variable.

FWIW, I could only trace this with good old printk.  Any
tracepoint/bpftrace made the issue disappear. I think that is because
with these tracing tools, we end up executing the tw inside the previous
io_uring_enter, since it took time to complete and the socket got ready in
the meantime.

>
>> -- 
>> Jens Axboe
>
> -- 
> Gabriel Krisman Bertazi

-- 
Gabriel Krisman Bertazi
