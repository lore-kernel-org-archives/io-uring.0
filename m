Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633684;
	b=r4ob48ZZgiK/uAPQ+ZwH7p1cJ3aqtJ0SMM4Ya1oXQt9COW2SUA9GVKghhB2Exki+5/Wc
	 TEjzBg4Hq7mTngFHwT1p6vc0cZ7jORA83vthYuuUhWazszmmjpvhpGO3IgOcH4rqq3oJ/
	 7xocosVfFmeueo5HE62Cg5SQugv8VRUJbzR1f+CDV6im020/pCL9QEgFuE0U4TYaeG/UC
	 tTOy4n1BDhmnXtW/5ufi9CHxa/vA4qsvgwGqvMa9LgfzotuQzrHz/Gk4LBa2cVSJiT9E5
	 fdwJlBuL6EsKDBssl8ATNn0JKTGKTErkLcNfDnybWMxzybOTwMruBWtNvAwWZJbudVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633684;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=eiUM+MiYtZVRq1f1UjPkAFYJq2AtaG1lgSNhhtCNADw=;
	b=CrlgcaCHKLh7vQch00PJpHqONMpPEvHyelvZYikFMb5aT9HHYU4NeG1Ers1/rCavZVxQ
	 Bx7KbqmMQYjELIWwLCle8eaj0dDTIHqvLAs3fiFwzxX9EeGYkFfiq5mqFkB4x4qySj9A4
	 aKHC6ayABfcT5nugeECU7oZ01z4qMOwu7DTBW9iFlRDL87g+mmirUHyX9L1Hg3HhOkRU2
	 dnpphWelAUWC7XLKqpJnr8hwTNcGFpt7QEdg2KhPTdsTxQpcNEBU1aQMifcUWLhG+1KCG
	 9tvX+wkvwdqOmnWM6oC5rfByHW0nc5VihJ3t5SpFgoH9H8lgMAsISV0oD/7UIGKJ70A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=t8pgo2ew;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=+9I4yxyP;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434CB608B042;
	Mon,  2 Nov 2026 15:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 434CB608B042
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=t8pgo2ew;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=+9I4yxyP
Date: Mon, 2 Nov 2026 16:34:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793633682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eiUM+MiYtZVRq1f1UjPkAFYJq2AtaG1lgSNhhtCNADw=;
	b=t8pgo2ewAERuD96m7I+bXJqW+2PPAm5xQIZNyGhIaYolwH8wlefd6o5ZgCFWK7TUttIU65
	mUAQkKd5UGuwEcPaWDxbNny7vm1rtZJ0xFsvXpbR6rZTVLRNiXtt6111gnd4nMYg0sPf/l
	xo8OYB/pTwH3dR9wmkUdVq4GGqOwTbzrAq71h/7tSv1gMb/refkx5CaeeYd3V1MNi9W5iC
	7kJdt6SaMcJfFz8nTRc/UVm1AtBtlaAOrvN8UKR3MlPJpa9H+QyyUD6bBHQbxGjr4ZHkCy
	8cvAMIeojV5HczY/8AVnPdKw1K0i3AS3RMMQfAex7a8bdo9EW7yjrDDE/GCRvQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793633682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eiUM+MiYtZVRq1f1UjPkAFYJq2AtaG1lgSNhhtCNADw=;
	b=+9I4yxyP1DrBN3XPKblBoydo62SUYog521qxlLCPCYEbaNRpySXNWuHg0ON/LjHRO2FwcD
	IMtyNt0kXTHbPEBw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Anvik Loitongbam <permissiontogallop@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>,
	Olivier Langlois <olivier@trillion01.com>, io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] io_uring/napi: clean up list traversal with
 list_for_each_entry_safe()
Message-ID: <20261102153440.e7a1o1RB@linutronix.de>
References: <20261029144745.23792-1-permissiontogallop@gmail.com>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261029144745.23792-1-permissiontogallop@gmail.com>

On 2026-10-29 20:17:45 [+0530], Anvik Loitongbam wrote:
> Switch both loops to the standard list_for_each_entry_safe() pattern and
> remove the explanatory comment.

I don't think this is useful as in clean-up or needed. The 'next'
pointer is pre-loaded with the next element but list_del_rcu() does not
destroy it (unlike list_del()). The spinlock_t holds off the grace
period. The item's next pointer needs to remain valid for a RCU
traversal that can happen.

The comment in __io_napi_remove_stale() explained the situation to
non-RCU fluent person. The list is not touched in io_napi_free() at all.

But okay, it is not a hot path=E2=80=A6

> Signed-off-by: Anvik Loitongbam <permissiontogallop@gmail.com>

Sebastian
