Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EBE3F58FF
	for <io-uring@vger.kernel.org>; Mon, 31 Aug 2026 23:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788218321; cv=none; b=DJ0p2z9VtwzWRt6yxpte2Z+TfjEZupsXrZnwpO0GYz8EoNrGIgIF8fcND148HoS+lhT0fnbuGY6heEOi7WQ4M6y40pmGvUUa9dpVZdLzP4WV/30nd8PDI0wvgTSbm8m8oWLbBQDVoawKAg+eI6mCTrIuCzqTN7dtI4Rb0nKUEFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788218321; c=relaxed/simple;
	bh=qYECM8XRRnaSnfD8maF+PFPLVR3QDVZz8vA5lJTLZMQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=R6KXT2wup616yxWV/gJFTFhIZYEMlzV0IAGRSM2wpjTPe1pKKFyZvOHZQc4ECCNeUD90BFhWNPwnhfjRCtB9aOdYIv/jUrbHvJ4B5jam1RdrjshZWfcQZU2FOINIV7oRb4FuOxbyorDCOoDFiR4u81n0D4nlAl2KpSzw15kTPV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Fbt6BJ68; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Apr9LjF/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=q3ghdxZ6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ld6pJOUp; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Fbt6BJ68";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Apr9LjF/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="q3ghdxZ6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ld6pJOUp"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7FA1D226DA;
	Mon, 31 Aug 2026 23:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788218313; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mFL+q+fnogIMgo7T9aNOIN4zeAVMXj89D3l75B7Xtzc=;
	b=Fbt6BJ68qZnu3Fn5vwHfkMyE5wE/r8HlvgTu7JiUl1OdjC9u9I6t5KS/K2KfusouViBVja
	dUPdBUBOObymKASnfm5uFzCex/b8UGuZALLcijoharnz8Ye0opWk8Vt5zCp69CCTfw4Etp
	LfOSN/0edbCkuCUbfXlgxhdjiDybges=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788218313;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mFL+q+fnogIMgo7T9aNOIN4zeAVMXj89D3l75B7Xtzc=;
	b=Apr9LjF/Y0bn7Qufu+oQSRmTZ7ZMqbXCUOkdYJlYNJHgp1H61tBRxtzlPyDOQWqGDKzMeC
	DTQBw/nMKO6KktDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788218309; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mFL+q+fnogIMgo7T9aNOIN4zeAVMXj89D3l75B7Xtzc=;
	b=q3ghdxZ6dO6z4nWnO+86cBWJzDNe4XwBPKMad34g/O3J68Px4gHJczN5jxyLEofpL1dazX
	sdkSDrk1WaPP7Q4RUJdgVve+ugZUiWPO9nUucmwWvRvP3jceSE9N08I7CQUKG3+RI8VrUG
	Ip65+/AEq9sUg/fEhI9gTxNK+OUeNsE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788218309;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mFL+q+fnogIMgo7T9aNOIN4zeAVMXj89D3l75B7Xtzc=;
	b=Ld6pJOUp49KryqHJMAaRt0i1a4pi5QvcLINUU8ruL1hT/nTLbo8+T3qq4NyC/H4cwSZBCb
	/sTsxlcu+3dv8fAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BF1E513685;
	Mon, 31 Aug 2026 23:18:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id m0tXHMQLlmrEdwAAD6G6ig
	(envelope-from <krisman@suse.de>); Mon, 31 Aug 2026 23:18:28 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org
Subject: Re: [RESEND PATCH liburing 2/2] test/iopoll: Fix clang CI build
 failure
In-Reply-To: <626ca0d4-804f-43a0-bdce-d09f366b482e@kernel.dk>
Organization: SUSE
References: <20260831155222.121857-1-krisman@suse.de>
 <20260831155222.121857-3-krisman@suse.de>
 <626ca0d4-804f-43a0-bdce-d09f366b482e@kernel.dk>
Date: Mon, 31 Aug 2026 20:18:21 -0300
Message-ID: <87a4q17ubm.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[kernel.dk:email,mailhost.krisman.be:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,kernel.dk:email]
X-Spam-Flag: NO

Jens Axboe <axboe@kernel.dk> writes:

> On 8/31/26 9:52 AM, Gabriel Krisman Bertazi wrote:
>> Clang CI builds in liburing repo do -Werror,-Wunused-but-set-global when
>> building with clang.  commit c5eead26 ("test/iopoll: fix over-eager
>> no_hybrid check") left a lingering variable that was not used, and clang
>> got smart enough to find for it, causing the build to fail for every
>> commit ever since.
>> 
>> https://github.com/axboe/liburing/actions/runs/30404555586/job/90427017716
>> https://github.com/axboe/liburing/actions/runs/30404555586/job/90427017742
>
> What's this against? Doesn't apply.

Ah, it was fixed by Ammar in parallel through a github PR:

  ca274ec7 ("test: Remove unused global variables found by clang-23")

Thanks for merging the rest.


-- 
Gabriel Krisman Bertazi
