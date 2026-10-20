Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792464425;
	b=C4H/GGE8IeF/mbxM/sxvVuwotDmtbknXP+5wvpjaW8pM8hagjaF0X8Dc69V4qfcFlkRG
	 sT+IHE1quwa75/aWkmvx1R29wncVDVj7qC75XvobURvcUvRzo968qSSXaIBNi1CSJB4rP
	 BHh6mIiY0PKjCYR9bodLJ8sEjShCSjfZk4ZV87Tgygt2NFAyJDfh6cjX83/h5OOXDO/o1
	 nOSi/XvehL00MsCjmkSpPqNdQyimD8BIrhdGScoO2cpNtxVATQ9R0mrk9eT3/9sudlN1S
	 0MbyW6UWCIYs6kvxhGNy/up0ibxKOQXUNDV+Ir/kVu/HmM2woDHR6IAbse1pg8UZBaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792464425;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=huBS00dBdE2TLgMpn1rL7Ix8kCPl76AlMErCkEyg/DU=;
	b=kF80s2GuS72Reh+2c14IN5L1w8pFC3D0XueD0g31x/0gsQxt/RZNjielU4kO0qRKHQJg
	 8KhYDipBSgnM6nXLKl9sJm07g5i07DVE9TGOIc52Uug6x+RO+zSpinvv4uoRreSGuVXyi
	 col14uhurCgZ+J2WNgzSW9Qvrc6lB+PNk0Xj5MiC5EWc6skjouA2hQm7cT44XInsXVp8K
	 x2P4TFPP9EZZLf9xfZ6YxJRBQgx9bXEStJFRGl//UQvXCRKi6elKbKzpAZAPPTMgFt3i1
	 vxdWuMxzOP29wDnagRlWaQKZ5FF7e4HxDNJtf+jdK0zdrlWwI6KvEZ/sEq3gIB0Lz4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="AzfGC/0e";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E21F606A322
	for <io-uring@vger.kernel.org>; Tue, 20 Oct 2026 02:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E21F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AzfGC/0e
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a01933b584so19278165e9.0
        for <io-uring@vger.kernel.org>; Mon, 19 Oct 2026 19:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792464417; x=1793069217; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=huBS00dBdE2TLgMpn1rL7Ix8kCPl76AlMErCkEyg/DU=;
        b=AzfGC/0e2RFbadfbmzaXeM8fbz+ptSile2LRdISaYkRDYe+P/tbKRckYlvJCPTY6aW
         fz8eUQHg/qF0PJraIP84QK1h4syJsgD2PFKyNF48TfHh7eQ1VgagOldU4ikhAQAomIEK
         K7Za67ZiCLV5201C2RR2LS2ISlxCTy5wGXnYeuxlfxogpymqkj33UX0fEXEIjlyZJO0O
         JbTqfnuXSHfD4lwAbROfOlEbCYZ7DGYDncripNIznUyJkzkGv04FDUxp6o1M3pwk5GFO
         hjOKBBX8dG1008eW+FVDgeyuxP/EE8qhAG5lkkKI33Vq0scYFeUIUJmUA0wp/i9pdgN/
         w9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792464417; x=1793069217;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=huBS00dBdE2TLgMpn1rL7Ix8kCPl76AlMErCkEyg/DU=;
        b=qDK1gofvhjl82QVRWSdTgD+ma1x3aYkGIMcNiY74Q9h4TLl1YRipZNM6B2I/YT7j70
         T8TJaWcVVNTOGpDuMo+R0u111xM6eJtC1FpsmmCZM4AnKAlJeN4fesPRrk9sZE9fJ2k1
         LqPLQ7vEWnARMrffx6Z45fn47nGaQ/kY36YX0VYZV+GpeoUxiJFZ9EwF64PexnhMOgGi
         eOfIttCeeqKdmpHMvK26THWfGEapqEJ8PvUPY79XNwqOVL7R3pwo5fl9z6wqDUuKXFJ0
         xdYWNQQZtOtMzJLxpxGG+xRN68b28SqgHYO/hwdND8UcHUIjkZ3Jt71Bhz4v7Jqu8zu/
         ZT7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwRNeZloPul7LP0A5cWE1ZFtsnXgJXoQ9Je+9c9z/9J3BWWlMURuNt2qsfCQVOfaiZzi6Ovsy8vow==@vger.kernel.org
X-Gm-Message-State: AFq9FYLWTzgSxyiGkpGZurUIYybNKTY/XeRrAnWErwl29tXLDNijAoTI
	+Q8kmzcvmVDW4NM9SvpckkySo+Bv31iH5wNCWOui/XOITEC5B/tK5SIjhxpio0293Q==
X-Gm-Gg: AYBFou0NNIFD6Mkc3yBvtdsCteq8LH4PtloKAfv+L5nLE1qQaY23QS+96V8kJiJ8p3+
	LVt4/2TAuo05NhGmSEvht50nGcle6qe+THHoYq90MYD5es4xxPpBQh0ewEWtxTDYaG8TUL0iTyL
	A9Jz1nQpvEgdipVlHr6ZDbnfLnFar8No3tAs1AYEB92G8QisRnY7t9XmWKF6yxFTB6e6LYN6tfd
	d4cp7vxLea4ShsQgSxZ8nUyZOk40YsCUt0vBpRwoCKx5Qqs/5Df4KKfKjCn2GH7iKWCjUS95Njx
	JssQ2PA0ISf1sxo9UizRLwDnSgUuhn7VCBUsBBwgCOjsdCyRchY01fd7YjyaUwX2rWX9g5Z2hO3
	cBV2xQGEhJi3cvC/RW3HJdhkI8JHgzr6yhaeyBkjRoPZnR56bxjC/BlpZa1sxsD4+m8yW1zYTJY
	HkIS2Q31udEpOsXxDN41eo9zBjgYsKKIs1pI7FLC8+fyIuxF9CjnUFGNP4k/hKsrwkVfZG510GR
	K6a5RmLn98Bk07NBU9wXoUvk+7oMDDI/JRmUAr2OpRs5mAs2DfSLIW+6ufAQgKhuFvmW5SE
X-Received: by 2002:a05:600c:4e45:b0:4a1:e11f:b2d5 with SMTP id 5b1f17b1804b1-4a1e11fc187mr137769875e9.2.1792464417460;
        Mon, 19 Oct 2026 19:46:57 -0700 (PDT)
Received: from autotest-wegao.qe.prg2.suse.org ([2a07:de40:b240:0:2ad6:ed42:2ad6:ed42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f37f7fc3sm20894195e9.2.2026.10.19.19.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 19:46:57 -0700 (PDT)
Date: Tue, 20 Oct 2026 02:46:55 +0000
From: Wei Gao <wegao@suse.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] io_uring: clear IO_RING_F_DRAIN_ACTIVE on drain
 completion flush
Message-ID: <atbWH7hdrvLQJhOl@autotest-wegao.qe.prg2.suse.org>
References: <20261018070154.16944-1-wegao@suse.com>
 <ae73d8b4-c2b9-4a9c-adca-8c995ac92975@kernel.dk>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae73d8b4-c2b9-4a9c-adca-8c995ac92975@kernel.dk>

On Mon, Oct 19, 2026 at 02:50:16PM -0600, Jens Axboe wrote:
> On 10/18/26 1:01 AM, Wei Gao wrote:
> > Fix:
> > Make io_queue_deferred() return a bool indicating whether any drain
> > request was active or deferred. In __io_submit_flush_completions(), track
> > whether any completing request had REQ_F_IO_DRAIN. Clear
> > IO_RING_F_DRAIN_ACTIVE only when a drained request has completed
> > (has_drain), no drain was active or deferred (!drain_dispatched), and
> > ctx->defer_list is empty. This prevents premature clearance if an
> > unrelated completion flushes while a drain request is still executing
> > in io-wq.
> 
> Didn't quite feel right to me, below is with some LLM assistance
> to try and get to the bottom of it.
> 
> Thanks for digging into this. I don't think it's just a race with a
> slow io-wq free, though. DRAIN_ACTIVE is still set when the next request gets initialized, so it's forced async and goes through the defer list
> every time, even if the drain request is freed in time.een read.
> 
> Basing the clear off any REQ_F_IO_DRAIN request in the flush is not
> enough:
> 
> - A drain request marked REQ_F_REISSUE counts as has_drain, but
>   io_free_batch_list() punts it back to io-wq in that same flush. With
>   an empty defer list, we clear DRAIN_ACTIVE while the drain is still
>   pending.
> 
> - A second IOSQE_IO_DRAIN request that fails init after io_init_drain()
>   has run gets completed via io_req_defer_failed() right away. If that
>   happens while an earlier drain is still running in io-wq, we end the
>   drain, and the next request is issued before the earlier drain
>   completes.
> 
> It also only works if the drain request completes through the flush.
> Without DEFER_TASKRUN, io-wq posts the CQE directly from
> io_req_complete_post(), so the application can see the CQE and submit
> before anything clears the flag.
> 
> A drain request dispatched from the defer list always runs alone, so
> we can just remember which one it is and end the drain when its CQE is
> flushed, and have io-wq complete drain requests via task_work so that
> happens under ->uring_lock. Something like the below. Can you give it
> a spin with your reproducer?
Thanks a lot for the thorough explanation and pointing out the edge cases.
Your proposed fix works as expected. I ran 10,000 iterations of test with 
your patch applied, and all tests passed without hitting the timeout.

Feel free to add:
Tested-by: Wei Gao wegao@suse.com
> 
> 
> -- 
> Jens Axboe
