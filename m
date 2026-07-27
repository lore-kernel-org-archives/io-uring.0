Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5722EF9E8
	for <io-uring@vger.kernel.org>; Mon, 27 Jul 2026 00:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785111230; cv=none; b=Wpdv2ajEIXippkgZkpE7o9o2FCsrnjufJLGiUMTZsA8qBzVMzB9B7u043DgzqINTiZgtEjGkWIQiLfpdi5zbvWQfJmMCA6hWTAh4/lOPXQMDgNg+3BaAT7U+RYWaY4W/D5+KMRWDR3f2WpjQ9ruLQYyHF5OW4XvxqKMD06z8kGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785111230; c=relaxed/simple;
	bh=TjPcKBS1SNhotorrPWKVo0y/Ju2k6CJoJsSgswkq87M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kxzTSLemx7HowNmytn7e6LHaNHC4jwqPrrnd1bTzJyFVkWeLwt0v3w7oCqweeHTCQe7I6LGqn0i5mn4MtJV1mciwblOuiwfVYI3ufTLWDOMoAW+I1sihRdSdkIZ4iG2Bjq83rl/WZhgbkTT96MJYmg3oEmlveOvLoqLgogF/gq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tsYsY5lO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vnpHm8Sf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CjXkf+tu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iOV7I3AD; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tsYsY5lO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vnpHm8Sf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CjXkf+tu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iOV7I3AD"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 57F2443FF;
	Mon, 27 Jul 2026 00:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785111223; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KFDUrOkeu8Nw0eKmO6yWoBzNrJtvmBnfJApqH7fHRVI=;
	b=tsYsY5lOFlP1Mqk+odSrT2CqiJCCArP3pByzUV2/3dHvqomLrpBp4Z3U4YCRLrns3Cecvs
	ldG/+WEAYNDWLDxmRuzOaiwIPQSvMXRVpv4i+2mVOCPOAy53pCR2Akk8VMRx1OubQ6VXE0
	sO0TXAIYAWLab6G/PM411el4CDRL6A4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785111223;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KFDUrOkeu8Nw0eKmO6yWoBzNrJtvmBnfJApqH7fHRVI=;
	b=vnpHm8SfcRlzOW23mSREfpH4fprKk3s9fmELJfzy5eIkbFHQIRn1dnMTzXuRG+sUVU81Gm
	DMODrYyI6GNlZfAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785111219; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KFDUrOkeu8Nw0eKmO6yWoBzNrJtvmBnfJApqH7fHRVI=;
	b=CjXkf+tu0tLRRs12D8UcyhY7o2KvN6SmkMXBORVfzcxqx6DOjxY5iWplrBbTTbpYvzXjJP
	yZjc5I+XniQ0q24MobclVIXli7K9eerdKb2rl6thAk5VXXtrPzF8oAfBuLFEujiQ/QZ1d6
	vhh3q0cgEyGNuWtaIKXAAq8ZeH7qNTc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785111219;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KFDUrOkeu8Nw0eKmO6yWoBzNrJtvmBnfJApqH7fHRVI=;
	b=iOV7I3ADdj3JoaVrAbVIGB/SNw4m1lvENgPsW1mjtbna2wRYMvug6RPmyDkQgcl4FePS7U
	Vyb4oePgBSZZv6BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 08DF2779B9;
	Mon, 27 Jul 2026 00:13:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yXFMMbKiZmpDGwAAD6G6ig
	(envelope-from <krisman@suse.de>); Mon, 27 Jul 2026 00:13:38 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org
Subject: Re: [PATCH liburing 1/2] test/send_recvmsg: Preserve msghdr until
 op_recvmsg completes
In-Reply-To: <87cxweepdj.fsf@mailhost.krisman.be>
Organization: SUSE
References: <20260722181710.79099-1-krisman@suse.de>
 <20260722181710.79099-2-krisman@suse.de>
 <6f31dd5b-639e-4018-815b-0fa04a39b337@kernel.dk>
 <87fr1aeqwm.fsf@mailhost.krisman.be> <87cxweepdj.fsf@mailhost.krisman.be>
Date: Sun, 26 Jul 2026 20:13:37 -0400
Message-ID: <87se55cmry.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,mailhost.krisman.be:mid,suse.de:email,kernel.dk:email]

Gabriel Krisman Bertazi <krisman@suse.de> writes:

> Gabriel Krisman Bertazi <krisman@suse.de> writes:
>
>> Jens Axboe <axboe@kernel.dk> writes:
>>
>>> On 7/22/26 12:17 PM, Gabriel Krisman Bertazi wrote:
>>>> msghdr is allocated on the stack at recv_prep, which means it may go out
>>>> of scope before the kernel has a chance to complete the operation.  This
>>>> results in spurious test failures when we reach far enough into recv_fn
>>>> to reuse the stack space before op_recvmsg executes.  I found it easily
>>>> reproducible when compiling with '-O0 -g3' to avoid gcc from optimizing
>>>> further local variables out of the stack.
>>>
>>> Hmm, but that should be fine as long as a) we submit in scope, and b)
>>> we're not using SQPOLL, where it does need to remain consistent until
>>> completion.
>>>
>>> And recv_prep() certainly submits before it returns, and we're not using
>>> SQPOLL. So I'm curious what issue this is?? Same questions on patch 2.
>>
>> Hm, I assumed it was submitted via iowq, which would explain this,
>> because the execution in io_recvmsg() passes a pointer to the original
>> memory:
>
> So, __sys_recvmsg_sock during the inline attempt throws -EAGAIN at
> first, which makes io_recv return IOU_RETRY, which punts to tw after
> the socket is ready.  By tracing, I can see the tw is executed only
> during the io_uring_enter from io_uring_wait_cqe, which is when
> __sys_recvmsg_sock touches sr->umsg pointing to an already out-of-scope
> stack variable.

Hello, do you disagree or did I miss anything?

-- 
Gabriel Krisman Bertazi
