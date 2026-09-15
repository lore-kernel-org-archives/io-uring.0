Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D08B3E0082
	for <io-uring@vger.kernel.org>; Tue, 15 Sep 2026 15:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789485218; cv=none; b=TEe/kBiSRph/jzj3MUMF5dM2iBG23NIafxob/dnOyT1GX7JkhLQi9mSA4V6/Lc8OPpkeJpTdmhmYevZZ5IA80PcERgd85OfPKtAZTBW6Ig0hVYEdg216J4jeikPMiKofhSjHhf5nCobk7hnptjS9MdPBt1MHTMxh7JuQ2JVT3pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789485218; c=relaxed/simple;
	bh=w/u0UQqr96ksP7+IOvfVgzfyz1BCqZGCs0myHyR3JIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nGKyui9HxPHxmb5LhHSUuz4/mcPxUZB8zoHwhMfIXa6QH7Bbc5q8lO6dEZW27IDgSNFEVz31r2DLuTvYMXv/4NimUPblJyX0RXEItqPg8oHWR/f4XYM395N/H7K+49TKuQdHKJAClzkDggCkUi6lCe8sLNsDSWmOOl2EunmweTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GXr2pwCm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GXr2pwCm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789485216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U2PJAn/L7ZQjvu205LAClwiudMULOGyRoDYDF+juhzk=;
	b=GXr2pwCm1zmoWU3rMtUth8m9S8YYXnHI8t9mYiOdRi5jY8eLFcrNDq/Hm7NxX7Hf8auQC3
	U/D5uhPknPcMbZYpzR7hS9dF7W8JtH5PtM7dtym3zq4PXGnXEQnLADDZ9wZ2bR4PnWFsfq
	W8CWVwhmzuTuPiqlApsOm1Ju10BQiUc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-412-exUphlHtMCWEYxi51V94Vw-1; Tue,
 15 Sep 2026 11:13:32 -0400
X-MC-Unique: exUphlHtMCWEYxi51V94Vw-1
X-Mimecast-MFC-AGG-ID: exUphlHtMCWEYxi51V94Vw_1789485210
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0BAB7185FCDD;
	Tue, 15 Sep 2026 15:13:30 +0000 (UTC)
Received: from fedora (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 81D7A3004188;
	Tue, 15 Sep 2026 15:13:26 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue, 15 Sep 2026 17:13:29 +0200 (CEST)
Date: Tue, 15 Sep 2026 17:13:25 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, linux-fsdevel@vger.kernel.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	NeilBrown <neil@brown.name>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, linux-mm@kvack.org,
	io-uring@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 3/6] coredump: hold RCU while releasing parked threads
Message-ID: <aqlglWwVeh4rwL0q@redhat.com>
References: <20260915-work-coredump-fixes-v1-0-f354ca41780c@kernel.org>
 <20260915-work-coredump-fixes-v1-3-f354ca41780c@kernel.org>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-work-coredump-fixes-v1-3-f354ca41780c@kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 09/15, Christian Brauner wrote:
>
> When coredump_finish() releases the threads the wakeup neither holds a
> reference on the task nor is it inside rcu.
>
> The threads don't necessarily need a wakeup to exit. If it gets
> preempted or was woken for other reasons it sees ->task cleared and
> exits. So only rcu keeps such a task_struct alive.
>
> If the coredump client is preempted between the store and
> wake_up_process() for longer then try_to_wake_up() takes pi_lock() in
> freed memory.
>
> Hold the rcu across the loop.
>
> Fixes: a94e2d408eae ("coredump: kill mm->core_done")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Aah, thanks...

Acked-by: Oleg Nesterov <oleg@redhat.com>


But to be honest the changelog looks a bit confusing to me...

	curr->task = NULL;
	wake_up_process(task);

So wake_up_process(task) is not safe, task can exit after a spurious
wakeup if it sees ->task == NULL.

And perhaps a short comment above "curr->task = NULL;" makes sense?
The reason for guard(rcu) is not obvious at all.

Oleg.

