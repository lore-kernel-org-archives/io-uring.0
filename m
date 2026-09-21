Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA0B4A4406
	for <io-uring@vger.kernel.org>; Mon, 21 Sep 2026 14:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790000963; cv=none; b=WYUWM9ySn2DfskIPwD0adHDbigVWiOjiEMrMGn09wU1MhrNb4pv83aBMhf7E6g8EW4Sr0BfVuuYMTe/kXhZp5KxlgkTjfocVY3qJfOIemNUKcYUiRKrX0kK/TF91U0nX2qy3f144ZtBpbEFRUrCewOeg615l3g8mRXhD8qmndgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790000963; c=relaxed/simple;
	bh=vEzudWF0GxwUVOeYAYeKieAjXnCT/L2r+RjOFHt8wK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ceu7/eo4YtjDmTfFoDGkYnCnj4UCuvcUF+P6Zfd2b6FOBYp6HfeFt9a3VEsuCFoICBF5sMcufcSHzGBgWMbDUYr9OERI2+U7+seW69H4NDcY9r3pbsZohc6NCJNQ3hd9/GS3UYL3viUBxjWowwqr65Ygt2a+lU3AhfUmyPDajuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ctOwyx2d; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ctOwyx2d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790000961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XtrGPJYqrgm8GjMEcC9ZPfIvGFNMVcDzHftdMMzdcwQ=;
	b=ctOwyx2d98xq8+PYOmdS00VPXyMBSH7zqqrIQ5nFpBmgmBjrP9W0CfYYsRFGnHTcZrHh0t
	VzjDrve0j/YVEZS+oKl2SEPc1Q8PI3lmc3OE060/xrHT4H12KInGqAgo3CNLa9tZdSTmlP
	U8icVA/n3cge/xJx4pH/4p8POx+4s1Y=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-10-5rPfoTMHPbmai33uCsAHrQ-1; Mon,
 21 Sep 2026 10:29:14 -0400
X-MC-Unique: 5rPfoTMHPbmai33uCsAHrQ-1
X-Mimecast-MFC-AGG-ID: 5rPfoTMHPbmai33uCsAHrQ_1790000950
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 43C62185126D;
	Mon, 21 Sep 2026 14:29:10 +0000 (UTC)
Received: from fedora (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 37FF61800446;
	Mon, 21 Sep 2026 14:29:06 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon, 21 Sep 2026 16:29:09 +0200 (CEST)
Date: Mon, 21 Sep 2026 16:29:05 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Chris Mason <mason@kernel.org>, linux-fsdevel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	NeilBrown <neil@brown.name>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, linux-mm@kvack.org,
	io-uring@vger.kernel.org
Subject: Re: [PATCH v3 15/17] fork: use SIG_KERNEL_ONLY_MASK for the user
 worker signal mask
Message-ID: <arE_MRAFmuvWsM82@redhat.com>
References: <20260921-work-coredump-fixes-v3-0-8e4adb1619e6@kernel.org>
 <20260921-work-coredump-fixes-v3-15-8e4adb1619e6@kernel.org>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-work-coredump-fixes-v3-15-8e4adb1619e6@kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 09/21, Christian Brauner wrote:
>
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -2146,12 +2146,9 @@ __latent_entropy struct task_struct *copy_process(
>  	if (args->kthread)
>  		p->flags |= PF_KTHREAD;
>  	if (args->user_worker) {
> -		/*
> -		 * Mark us a user worker, and block any signal that isn't
> -		 * fatal or STOP
> -		 */
> +		/* A user worker takes only the signals nobody can block. */
>  		p->flags |= PF_USER_WORKER;
> -		siginitsetinv(&p->blocked, sigmask(SIGKILL)|sigmask(SIGSTOP));
> +		siginitsetinv(&p->blocked, SIG_KERNEL_ONLY_MASK);

Acked-by: Oleg Nesterov <oleg@redhat.com>

