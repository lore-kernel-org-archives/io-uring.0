Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8443A9D94;
	Wed, 23 Sep 2026 21:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790198004; cv=none; b=Rrs0mD1WSQNz8WqMJenf8wAZs+HIBApdZajqsM70gB91YB/qGhdphJWnRTY43TIp8lL8DEA+Qfy3KXsYnzuUZ+ZWG7zadu0h5C5CaQvbiOmFmekzKeV/NWGbzLHcx4AxhslZKvcRxdMylfX7zRanGm9N6m5OqwjZr9OMH98Zlz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790198004; c=relaxed/simple;
	bh=f26yBWKPhUC5Yr8NHxGW7wg+gXToXZfatnJiXYTGNZA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mgU+ygasbHKw4hmE8gRJdGkIv5iSfxD/9L8Vn17YzVrP8dkTXIYY6610TGG88qKSmLcBwzip27RoQuAiZdZlRjFWvIyESBXLIsW0pUPqyUEurG+ubxkeEtD6xByG4BKg4VIBzXHuh9zL3KSIrbMNb57o63Eo2OwxDCHKMKrGK1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MnvRTkqW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Dl/V74wd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mzekgCNl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NjVaDN2T; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MnvRTkqW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Dl/V74wd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mzekgCNl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NjVaDN2T"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D802F1FFD1;
	Wed, 23 Sep 2026 21:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790197995; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SpUcPJ99ISR+VxiGOE3cGzwgcfucGxbMMh923SWRrWk=;
	b=MnvRTkqWt8Vy/9sFxMRxAZ882uzD1AjI9IqWd4kDOwltpSvOFYqOFMFkiVAqUj/2uFvACD
	KsFHbvWGjEfi+jH8qZTkVkXNsd+pEwxMBwktw9PRmElXxqk5eaop9tKrVOxH5vHfdmyC+4
	liuKFG5YzC42O9z+ofTcAhpeHRRMJYM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790197995;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SpUcPJ99ISR+VxiGOE3cGzwgcfucGxbMMh923SWRrWk=;
	b=Dl/V74wdvHOc/2X6g6E+cfazHYMo/8nC1G1NR8q8TAT6zD8rf7E3kSIs7YPGCnGg+uTT5V
	6S7w3w7z3fhYeiDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mzekgCNl;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=NjVaDN2T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790197990; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SpUcPJ99ISR+VxiGOE3cGzwgcfucGxbMMh923SWRrWk=;
	b=mzekgCNl0taczhRWA5De+d8zcp3uxwoFmrqy4qOC4MwH3lsT/T1jOo29yObXlCCw0zQybS
	s2c6pdwE+hTuKTm66cGzANek14jISCNv8V3C379rZ/GRZg0HX1IvnxPutRIdOFvNryD0TU
	Y33JmGLOBKMrALE8rfWCvFF14e2i3mA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790197990;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SpUcPJ99ISR+VxiGOE3cGzwgcfucGxbMMh923SWRrWk=;
	b=NjVaDN2TEF5XK/c89M5VqW6bbEHHt/K6phxDBaM6i8P7nSF7GRz5yQLihAcAYSExHcEjho
	x8/hhFnuRpF+vHCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 484EA13354;
	Wed, 23 Sep 2026 21:13:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0VwcOOVAtGorGAAAD6G6ig
	(envelope-from <krisman@suse.de>); Wed, 23 Sep 2026 21:13:10 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Xiaochuan Li <chuanx2070@163.com>, Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, Sebastian
 Andrzej Siewior <bigeasy@linutronix.de>, Xiaochuan Li <chuanx2070@163.com>
Subject: Re: [PATCH v2] io_uring/lock: Keep spinlock release before wake_up()
In-Reply-To: <20260923161622.25737-1-chuanx2070@163.com>
Organization: SUSE
References: <20260919123021.21318-1-chuanx2070@163.com>
 <20260923161622.25737-1-chuanx2070@163.com>
Date: Wed, 23 Sep 2026 17:13:08 -0400
Message-ID: <87v77vzn6j.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Score: -4.51
X-Rspamd-Queue-Id: D802F1FFD1
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[163.com,kernel.dk];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,linutronix.de,163.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,mailhost.krisman.be:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO

Xiaochuan Li <chuanx2070@163.com> writes:

> When CONFIG_PREEMPT_RT enable, raw_spin_lock() will preempt_disable()

The subject prefix is wrong.  It should be "io_uring/io-wq".

Also, It might be that I just didn't find it, but was there a v1 of this
patch?  I can't find it on the list.

> which will trigger:
> BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:46
> in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 985654, name: iou-wrk-983605
> preempt_count: 1, expected: 0
> RCU nest depth: 0, expected: 0
> CPU: 3 PID: 985654 Comm: iou-wrk-983605 Tainted: G        O  6.1.83-rt28-g19631eb82f21
> stack:0        ppid:977479 flags:0x00000008
> tgid:977553 prio:120 preempt:0x100000001 rcu_read_lock_nesting:0
> used_cpu 3 wake_cpu 3 on_cpu 3 on_rq 1 migrate_dis 0
> arrive:17423426040675 queued:0 prev_sum:33955300 sum_exec:33955300
> Call trace:
>  dump_backtrace.part.0+0xdc/0xec
>  show_stack+0x1c/0x30
>  dump_stack_lvl+0xac/0xc4
>  dump_stack+0x14/0x30
>  __might_resched+0x13c/0x170
>  rt_spin_lock+0x34/0xc0
>  __wake_up_common_lock+0x68/0xd0
>  __wake_up+0x1c/0x24
>  io_worker_handle_work+0x5b0/0x600
>  io_wqe_worker+0xf4/0x310
>  ret_from_fork+0x10/0x20
>
> Signed-off-by: Xiaochuan Li <chuanx2070@163.com>
> ---
> Changes in v2:
> io_uring/io-wq: fix lockdep warning by deferring hash wake up outside acct->lock
>
> The stall wake up path in io_get_next_work() holds acct->lock while
> calling wake_up() on the hash wait queue, which creates lock ordering
> acct->lock -> hash->wait.lock and triggers lockdep circular dependency
> warning.
>
> The previous approach of temporarily dropping and retaking acct->lock
> is racy and juggles the lock unnecessarily. Instead, add a need_wake
> output flag to io_get_next_work() and defer the wake_up() to the outer
> worker loop, after acct->lock has been released.

what previous approach?

>
> This preserves the calling convention that io_get_next_work() returns
> with acct->lock held, removes the lock inversion, and avoids any racy
> sleeper checks outside of the lock. Drop the wq_has_sleeper check as
> bare wake_up is safe and the optimization is not worth the complexity.

Either way, these paragraphs should be part of the commit message. By
putting them after the ---, they get dropped at commit-time.

-- 
Gabriel Krisman Bertazi
