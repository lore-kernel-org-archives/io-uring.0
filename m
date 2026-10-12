Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F5B463B70;
	Mon, 12 Oct 2026 08:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791794302; cv=none; b=l5XKuc6PbJ/m886zw4v8druGXtjlIPrmrQziFj21bazKKLEefcScjeephkEnyLmaroidb7fd865qSqVYdSMOg2M+XzwplzV2dpqdubrzHOUup/ZmtJoV0eLdvG0gcWTkTwcgrZwhxiEl/oL1JAIcKwEyKmTAkZey4QayVNNybpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791794302; c=relaxed/simple;
	bh=U4oZOfnrsXMb2aDcBOPGWeqKCs3s2J2sj1ogGFyRWYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NECf/95lqttwNM9nYYcsOWQruKiXuLMW09VzBGIrjwgezTUWHMclnda7HiTQ164gjsSQGeZFZXflG4yBieonj1Fgj8ACb4w6XyGK3de6Rr4YUMJ/EwLu5noi/ZTs5SIvSQ+D1rl/p2kFwqoY91aLmLL3pOXfRDDd9XFPL9r004o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NtN4VaGF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NtN4VaGF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82F001F0089B;
	Mon, 12 Oct 2026 08:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791794301;
	bh=x9zvxnIICACLcOApJlxFMv8hmiS24+iILCoavuVBq6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NtN4VaGF/XotmxrLZl8cc1AMZmWTyZKhiLhbbnzyrjaKUGYutE14DInHVHFxfRzLW
	 f6ZiSan3kfrnO5F63TOItaobuj2VrxFTBhcj1ne/LT6rrFAL6cjpvRQknn8JYer0qS
	 Q8PQ4NztTAlVdGLJgW02D9NJCX8/rXUp6gdOtfQEiFjrnAsrkmyoRqtozrb2oSjfN1
	 PMZUPAV8VD5/sOFTLh8L3ijUuoJBqgaLODI40Gqcd9sJ1/2EQPFDEVI7abIw9zfufU
	 9CEgmLFQvtiKNtpCANd3K2l22iA6jIFC44rcrLmYE7jzb4Qul6nKhuecAQ0DKqvAnh
	 hp4lXBnppndxQ==
Date: Mon, 12 Oct 2026 10:38:16 +0200
From: Christian Brauner <brauner@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>, 
	io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] io_uring/io-wq: don't call try_to_wake_up() twice in
 io_wq_worker_wake()
Message-ID: <20261012-liberal-gejammer-gebilde-ef1ce6dba9c5@brauner>
References: <asunjCm5Ovj_YDSp@redhat.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <asunjCm5Ovj_YDSp@redhat.com>

On Sun, Oct 11, 2026 at 05:13:16PM +0200, Oleg Nesterov wrote:
> io_wq_worker_wake() does an unconditional wake_up_process(). This means
> that __set_notify_signal() makes no real sense. Change it to use
> set_tsk_thread_flag(TIF_NOTIFY_SIGNAL) instead to avoid test_and_set_bit()
> and another wake_up_state(TASK_INTERRUPTIBLE) if NOTIFY_SIGNAL was not set.
> 
> Perhaps io_wq_worker_wake() can rely on __set_notify_signal() solely, but I
> don't understand this code enough and this patch doesn't change the current
> behaviour.
> 
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>
> ---

Reviewed-by: Christian Brauner (Amutable) <brauner@kernel.org>
