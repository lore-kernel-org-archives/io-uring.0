Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE0C435523
	for <io-uring@vger.kernel.org>; Mon, 21 Sep 2026 14:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790000107; cv=none; b=N1zN1Mq91j4+TaeFbSCjCT7Xag472IszFds+BP6uAIX7qQ98nzqSIXdvZRtitWrwOid/B7NhVNQ+cLg4kl0OOiTre8orfQuinY25QwaG2QbSpyiFO6sGyUcNBcgo0f/+wamz85ko1VH8mSJMfCsXnkXr31vtDp7lId1oUhCwh8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790000107; c=relaxed/simple;
	bh=QYUNhse7s8jbvPJPVoD8smtqkNiMSRBx/BETLp9ASyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pVKOzaGI1RzUXmbUZuQmvUdLjEeLMcnGRqrc9644STAfqGQrvoLvUKL6JkbO3IkIyqh4O8zoX9C9/91FSXASFk3zStkKJ/S1H6cIFRJz9IztQGMcaLJrVv1896dm48m2fLXhCGqq80kkrZ9hdWS0ny98aU07rVYZZ3rxMnei0ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bZSpnyfJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bZSpnyfJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790000104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JYmkAVW6MGL7d6FmukCxqbleAMN+cIrtRe3QYgaLMXk=;
	b=bZSpnyfJO1nBm8VYqJLR7juR6alxPm7v3y0G7XFBpsNTSNMeofv0gQzWJBAgeuqENKlzNl
	3EQXDGXfu/cQjAaL1yN3ziTPdDc+oYu5XF6F12hmVbISOlmU5ZZkr31iNUuPNNVHPcS15H
	QJgJi/KE55rLAE2phLAcQDs+d0Ok5SI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-133-aXu1BVHwN_OPLkok5J7aYw-1; Mon,
 21 Sep 2026 10:14:59 -0400
X-MC-Unique: aXu1BVHwN_OPLkok5J7aYw-1
X-Mimecast-MFC-AGG-ID: aXu1BVHwN_OPLkok5J7aYw_1790000097
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7805B180B5C9;
	Mon, 21 Sep 2026 14:14:57 +0000 (UTC)
Received: from fedora (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id EF8DD1800348;
	Mon, 21 Sep 2026 14:14:53 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon, 21 Sep 2026 16:14:57 +0200 (CEST)
Date: Mon, 21 Sep 2026 16:14:52 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Chris Mason <mason@kernel.org>, linux-fsdevel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	NeilBrown <neil@brown.name>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, linux-mm@kvack.org,
	io-uring@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 12/17] exec: cancel io_uring requests before
 de_thread()
Message-ID: <arE73DiU0QWOeepF@redhat.com>
References: <20260921-work-coredump-fixes-v3-0-8e4adb1619e6@kernel.org>
 <20260921-work-coredump-fixes-v3-12-8e4adb1619e6@kernel.org>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-work-coredump-fixes-v3-12-8e4adb1619e6@kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 09/21, Christian Brauner wrote:
>
> --- a/fs/exec.c
> +++ b/fs/exec.c
> @@ -1149,16 +1149,19 @@ int begin_new_exec(struct linux_binprm * bprm)
>  	 */
>  	bprm->point_of_no_return = true;
>  
> +	/*
> +	 * Cancel any io_uring activity across execve. This runs task work
> +	 * that may still create an io-wq worker, so do it while de_thread()
> +	 * can still zap it.
> +	 */
> +	io_uring_task_cancel();

Acked-by: Oleg Nesterov <oleg@redhat.com>

