Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFD14028E9
	for <io-uring@vger.kernel.org>; Wed, 22 Jul 2026 20:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784750417; cv=none; b=NK7o6oJDaB7ICMxXSGm2wvy//xV6pQ+k8MQ2dgCReevQeYh+2I1duNRiAT9YgleUJBpb92aMUePjdml2wm/aCzlByR0uQ8aS9MDue3Z2AHDT4X+aMScpJxV+uoQL54Jd64PqaYUZKuGlM5C+b71zXSJrxeLuGMNTM9dD6IZyLvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784750417; c=relaxed/simple;
	bh=pe8t491GCU7VOLA6KLIKq87fnUfyHDhm2CfwbjfL/dw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JVUKXsDaDNpyOr32BrqoOpEUWeb6LYzc3Xv0K2+BRupHthRLkmwF7+GIfCEg+ZDEyI944jghDtLuM22yweBUUzowTjGm+mNpK1T2RggYeFsAAHh57Co4/E00cFyWLrDEwk5DLE0G7LLGo0VL9dckVuUKLnoh3Ye+yrCIAfKfVyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lAfN34uO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qhx7xHFO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lAfN34uO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qhx7xHFO; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lAfN34uO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qhx7xHFO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lAfN34uO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qhx7xHFO"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1405B3E38;
	Wed, 22 Jul 2026 20:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784750412; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pyN7+D+GGsF97Y5k/3aVaTFNSxVD/4ZhP6qJyHIlYsE=;
	b=lAfN34uOceF7pu3v+tAEGDi7XnKeJm36qXeGroA6qWPrM4X6BunSBEA5t6iSd09oKWWqax
	4CtVnkKay65SiBtMv9XSkrY5Rnf/i6o2YK272EXzDLRmaj1bzhkiQQcDCwOcNp9QiUiij1
	3LVyhHspuduFZrtCicVN0nGPrjbCg/A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784750412;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pyN7+D+GGsF97Y5k/3aVaTFNSxVD/4ZhP6qJyHIlYsE=;
	b=qhx7xHFOE/d/W25GL98Pg0/yvOyWXAIjAPxvr5Hq3HTT/q9M0Nf8Dw7toqf+yZZV/ormoW
	nmPUM92uuu7/3+Cg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=lAfN34uO;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qhx7xHFO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784750412; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pyN7+D+GGsF97Y5k/3aVaTFNSxVD/4ZhP6qJyHIlYsE=;
	b=lAfN34uOceF7pu3v+tAEGDi7XnKeJm36qXeGroA6qWPrM4X6BunSBEA5t6iSd09oKWWqax
	4CtVnkKay65SiBtMv9XSkrY5Rnf/i6o2YK272EXzDLRmaj1bzhkiQQcDCwOcNp9QiUiij1
	3LVyhHspuduFZrtCicVN0nGPrjbCg/A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784750412;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pyN7+D+GGsF97Y5k/3aVaTFNSxVD/4ZhP6qJyHIlYsE=;
	b=qhx7xHFOE/d/W25GL98Pg0/yvOyWXAIjAPxvr5Hq3HTT/q9M0Nf8Dw7toqf+yZZV/ormoW
	nmPUM92uuu7/3+Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B58B5779B0;
	Wed, 22 Jul 2026 20:00:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id S0QhIEshYWreLgAAD6G6ig
	(envelope-from <krisman@suse.de>); Wed, 22 Jul 2026 20:00:11 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org
Subject: Re: [PATCH liburing 1/2] test/send_recvmsg: Preserve msghdr until
 op_recvmsg completes
In-Reply-To: <6f31dd5b-639e-4018-815b-0fa04a39b337@kernel.dk>
Organization: SUSE
References: <20260722181710.79099-1-krisman@suse.de>
 <20260722181710.79099-2-krisman@suse.de>
 <6f31dd5b-639e-4018-815b-0fa04a39b337@kernel.dk>
Date: Wed, 22 Jul 2026 16:00:09 -0400
Message-ID: <87fr1aeqwm.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Score: -4.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 1405B3E38
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWO(0.00)[2];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kernel.dk:email,mailhost.krisman.be:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Jens Axboe <axboe@kernel.dk> writes:

> On 7/22/26 12:17 PM, Gabriel Krisman Bertazi wrote:
>> msghdr is allocated on the stack at recv_prep, which means it may go out
>> of scope before the kernel has a chance to complete the operation.  This
>> results in spurious test failures when we reach far enough into recv_fn
>> to reuse the stack space before op_recvmsg executes.  I found it easily
>> reproducible when compiling with '-O0 -g3' to avoid gcc from optimizing
>> further local variables out of the stack.
>
> Hmm, but that should be fine as long as a) we submit in scope, and b)
> we're not using SQPOLL, where it does need to remain consistent until
> completion.
>
> And recv_prep() certainly submits before it returns, and we're not using
> SQPOLL. So I'm curious what issue this is?? Same questions on patch 2.

Hm, I assumed it was submitted via iowq, which would explain this,
because the execution in io_recvmsg() passes a pointer to the original
memory:

        ret = __sys_recvmsg_sock(sock, &kmsg->msg, sr->umsg,
	    			 kmsg->uaddr, flags);

and __sys_recvmsg_sock does write to it. which makes it clear the msghdr
needs to live until completion.

But honestly, whenever I try to probe to confirm the execution went
through iowq, the timing gets off and I can't reproduce the corruption.

I will take another look and see if I can explain better.

> -- 
> Jens Axboe

-- 
Gabriel Krisman Bertazi
