Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C873A543F
	for <io-uring@vger.kernel.org>; Thu, 30 Jul 2026 18:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785437759; cv=none; b=JgT3PLzku+CvvT27QRu3oK8D0TIOeQQfE5SQNpfM885IybHBsZpuvvU0WSxOWzxHQnftdj1G65gcPmyjL7o8OkmPyOBDJ9m7poT8fY5M+91IFokHfN1g8inAGAqAxZenG225d4EubqA0fknKEBsG9Hm3SLrYhhbqVdUhXbL6kMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785437759; c=relaxed/simple;
	bh=dl1rKl8N+PfRnV2OM93Q8FD6tKPbkYfGbZqm8os4mK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OFAQVUI2woe3SUbQShGF4BoG5PHR3zTKQd9U1uGrHPEdRyteXsb32004Nxu7cNJ8nGk3PT/pIYdWgVvlU2eBDNfCRkwi20Ulh7zjRsdJYKGsr8OV+ihCzz+9qBkury/0P5d+S7tAkr5/0X/q2pAXcRCFSEtYzonIKhe5Tcr4ihs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZHJzLPIO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZHJzLPIO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785437757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dl1rKl8N+PfRnV2OM93Q8FD6tKPbkYfGbZqm8os4mK0=;
	b=ZHJzLPIOZhadQ6tp7HsVWjf6bL0qe9A4tQgnTe0DQOAsvsKOsAdgHHDC4NBubAVkUieRva
	FXsmUdahDvkQ1TpfSbPo5O8vdxaun1OAu7Z7HaAm8jwbWF9gSwfPZT3AOYpLAwN72j8ZYC
	a7pQSXTRVz28BWAh6zf3teoKQ5ddvbM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-265-31ZFZ1xBNoaWe5ptHafRVQ-1; Thu,
 30 Jul 2026 14:55:51 -0400
X-MC-Unique: 31ZFZ1xBNoaWe5ptHafRVQ-1
X-Mimecast-MFC-AGG-ID: 31ZFZ1xBNoaWe5ptHafRVQ_1785437749
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 397C2195608E;
	Thu, 30 Jul 2026 18:55:48 +0000 (UTC)
Received: from fedora (unknown [10.44.33.21])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 60299423;
	Thu, 30 Jul 2026 18:55:42 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Thu, 30 Jul 2026 20:55:47 +0200 (CEST)
Date: Thu, 30 Jul 2026 20:55:41 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Breno Leitao <leitao@debian.org>,
	Christian Brauner <brauner@kernel.org>,
	Mateusz Guzik <mjguzik@gmail.com>, Jens Axboe <axboe@kernel.dk>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	Alexey Gladkov <legion@kernel.org>, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org
Subject: Re: [PATCH v3 0/1] pipe: only enable the extra wake_up(rd_wait) for
 edge-triggered consumers
Message-ID: <amueLRM-DrYbnjLn@redhat.com>
References: <amtbpwrhlNGJ9OK6@redhat.com>
 <CAHk-=wi7EccGaeo2Q5mdcvcQJ8VX7tcJWW2fHkg6vfmHGGX8AA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wi7EccGaeo2Q5mdcvcQJ8VX7tcJWW2fHkg6vfmHGGX8AA@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

On 07/30, Linus Torvalds wrote:
>
> I like this patch mostly for the renaming, not because I think it
> matters. I think "poll usage" was a mistake in naming and doesn't
> explain the issue. That said, I'd go even further, and make it clear
> that it's not about "poll" itself - which is fine, it's about "epoll",
> which has that broken crazy bug where it calls something "edge
> triggered" but then actually wants effectively level-triggered
> behavior - wakeups when nothing actually changed, which is the
> *opposite* of an edge.

I am not sure this is a "crazy bug". To me, epoll with EPOLLET works
"as documented". Perhaps I am wrong, this predates the git history.

I'd say the very idea of EPOLLET was wrong, but this doesn't matter:
we have what we have.

And this patch (mostly) tries to document what we have.

> Pure garbage.
>
> So the real name should be something like "epoll_pseudo_edgetrigger".
> Because "et" isn't really helpful either.

I'd agree with "pseudo" simply because I can hardly say how could we
define "edgetrigger" in this particular case.

But then we should name it "epoll_or_io_uring_pseudo_edgetrigger".
See the test-cases, they demonstrate the same pattern.

Oleg.

