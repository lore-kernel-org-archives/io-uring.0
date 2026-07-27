Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CE16FC5
	for <io-uring@vger.kernel.org>; Mon, 27 Jul 2026 18:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785178213; cv=none; b=EyaRwA8THzO4Ovhekb3gO9+5+j5d4eB8Is4h1r+DaYOrWsrc83dd9Tb4PD5RC4P5TwcGxhDv7wUGyDJqDw8qcHU7x30RuDAJRFL1nF0LkCDeiUEFJDPmHY/YnYuqrxyFVwncK3FMd4c9S2oNMYiFr5gqvp6MjBY5wpO3DuxILG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785178213; c=relaxed/simple;
	bh=U3J/z/rltd9wyJnJ+Q+nQejkr0Bc2YdqlNaSA6PWzfo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XPOBwvaU5OvUCxh5GjBAN3kVY4drj9pcQ9ntmDHbMiDDOedXtbmY2az89ZRpH/82mS0feyK5U/n8kpRwAlJgX+9BeBAktXU46LQNQqT2S+W9AbTsyZI1K0U9eezio/E671yPmojoncoqMKzSxBSMxHkzVmrvFvsTjkEzWRfJZFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DeNWRMmu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1LxJ+BSA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KqhmPOue; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=51yCmO6F; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DeNWRMmu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1LxJ+BSA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KqhmPOue";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="51yCmO6F"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5B9F87BF1F;
	Mon, 27 Jul 2026 18:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785178205; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JJfNK+u1b3MHo0h1U7oHlVZCtLOGMMqF8MCXLwh41Dc=;
	b=DeNWRMmuQA4fb6NOmcTIoneUuAnmP7jNCCWKddWt1TpB5PCyLopDZwI1gw7b3jRGp7GFl5
	KePBRqejGHb+zdiTEbZAe8YSo5v5Ozqkxh++q03xsJBu3h7VBYKTPuOKFYCRkxi2w4OpdQ
	pZ1qtmw8QTmjRnDO1lR+Fh3bSxA+oCU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785178205;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JJfNK+u1b3MHo0h1U7oHlVZCtLOGMMqF8MCXLwh41Dc=;
	b=1LxJ+BSAFQG4IwAhb3i6TykdZuKQb0nDI0NqldjOL1j/DKojjK3sYJ7+uMq2dAERHsUQmX
	dZxpkZjdKGZBT3Bg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=KqhmPOue;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=51yCmO6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785178201; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JJfNK+u1b3MHo0h1U7oHlVZCtLOGMMqF8MCXLwh41Dc=;
	b=KqhmPOuemTjP7W8FgjlrTkq4KaIByjxhN//KaZgN8djJOqMrAVy/q9GJ8UTaTig0UcwZ+d
	froIbIGY1pA0AATwaIX0r6IBpKDYiWLN5qJfNCZEBBYI6vh5iANbPS/9sLhJe+YJ4a7EtM
	0A+Go8m1OrsfAr92UtL88NoQ1W54i1o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785178201;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JJfNK+u1b3MHo0h1U7oHlVZCtLOGMMqF8MCXLwh41Dc=;
	b=51yCmO6F6ZGGewpPet37xKdRxEYIi9QFdWoRN92TeV5L5D+ygZfuD5ezrpdOkZ+D/cnZKj
	fq8bqDD1fdoBGOAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1E3A3779B9;
	Mon, 27 Jul 2026 18:50:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id J2TNNlioZ2qAOwAAD6G6ig
	(envelope-from <krisman@suse.de>); Mon, 27 Jul 2026 18:50:00 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org
Subject: Re: [PATCH liburing 1/2] test/send_recvmsg: Preserve msghdr until
 op_recvmsg completes
In-Reply-To: <dc7df695-c891-4cf9-b124-d595a94facf3@kernel.dk>
Organization: SUSE
References: <20260722181710.79099-1-krisman@suse.de>
 <20260722181710.79099-2-krisman@suse.de>
 <6f31dd5b-639e-4018-815b-0fa04a39b337@kernel.dk>
 <87fr1aeqwm.fsf@mailhost.krisman.be> <87cxweepdj.fsf@mailhost.krisman.be>
 <87se55cmry.fsf@mailhost.krisman.be>
 <dc7df695-c891-4cf9-b124-d595a94facf3@kernel.dk>
Date: Mon, 27 Jul 2026 14:49:55 -0400
Message-ID: <87mrvcclnw.fsf@mailhost.krisman.be>
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 5B9F87BF1F
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

Jens Axboe <axboe@kernel.dk> writes:

> On 7/26/26 6:13 PM, Gabriel Krisman Bertazi wrote:
>> Gabriel Krisman Bertazi <krisman@suse.de> writes:

>>>
>>> So, __sys_recvmsg_sock during the inline attempt throws -EAGAIN at
>>> first, which makes io_recv return IOU_RETRY, which punts to tw after
>>> the socket is ready.  By tracing, I can see the tw is executed only
>>> during the io_uring_enter from io_uring_wait_cqe, which is when
>>> __sys_recvmsg_sock touches sr->umsg pointing to an already out-of-scope
>>> stack variable.
>> 
>> Hello, do you disagree or did I miss anything?
>
> Still on vacation and sporadically available, just haven't had time to
> look at it yet. I agree it looks fishy! I would encourage you to dig into
> the kernel side and get to the bottom of it.

AH, I thought you were back already. Sorry, please enjoy your time off,
this is absolutely not time-sensitive.

But there is no mystery here. the explanation I shared in
87cxweepdj.fsf@mailhost.krisman.be is correct. Here:

>>> So, __sys_recvmsg_sock during the inline attempt throws -EAGAIN at
>>> first, which makes io_recv return IOU_RETRY, which punts to tw after
>>> the socket is ready.  By tracing, I can see the tw is executed only
>>> during the io_uring_enter from io_uring_wait_cqe, which is when
>>> __sys_recvmsg_sock touches sr->umsg pointing to an already out-of-scope
>>> stack variable.

IOW, the problem boils down to the fact recvmsg touches umsg deep inside
the net/ code and io_uring does not submit in scope if the data is not
ready.

In more detail, the initial -EAGAIN happens because the recv_fn thread
raced with the send, there is no data in the socket, and the inline
obviously cannot block in __skb_recv_udp. So we fall back from inline,
arm the poll and sit on our hands waiting.  By the time the data arrives
and the kernel retries, msg is out of scope.

The exact corruption that *I* am observing in this test is that
____sys_recvmsg writes 0 to the userspace-mapped msg->msg_controllen
during ->issue() because, well, this is UDP and doesn't need ancillary
msg_control. This behavior is documented in recvmsg(2).

In my failing builds, for instance, in the send_recvmsg.c test, once msg
goes out of scope, the stack space collides with the pointer of (struct
recv_data *rd) in the call do_recvmsg(). The difference is that with
-O0, gcc sticks it in the stack during the prologue of do_recvmsg(),
instead of preserving the pointer in a register.  Then we have the first
opportunity for the TW to run during the io_uring_wait_cqe. When it
comes back, the stack was touched by the kernel, thinking it is touching
&msg, and boom. With -O3, the stack layout changes and the kernel writes
over other stack data that is no longer touched by the testcase.

msg_p below is a pointer to the  original stack variable during
recv_prep. The type is struct msghdr*):

(gdb) p &(msg_p->msg_controllen)
$13 = (size_t *) 0x7ffff7d90c08

Which collides with

(gdb) p &rd
$14 = (struct recv_data **) 0x7ffff7d90c08

Since msg_controllen is zeroed by the kernel, rd=0x0 and this causes a
bad deref:

if (rd->no_buf_add && (rd->buf_select || rd->buf_ring))

In summary, the issue is that msg must live until completion which
is what these patches fix.

ButI see this contradicts the NOTES section of
io_uring_prep_recvmsg():

> As with any request that passes in data in a struct, that data must
> remain valid until the request has been successfully submitted. It need
> not remain valid until completion. Once a request has been submitted,
> the in- kernel state is stable. Very early kernels (5.4 and earlier)
> required state to be stable until the completion occurred. Applications
> can test for this behavior by inspecting the IORING_FEAT_SUBMIT_STABLE
> flag passed back

Should I change that section of the manpage or do we want to ensure the
stability of msg here (i.e. don't allow recvmsg to touch the msghdr
coming from io_uring?)

Either way, vacation takes priority :) see you soon.

-- 
Gabriel Krisman Bertazi
