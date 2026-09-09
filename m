Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C20457D23E
	for <io-uring@vger.kernel.org>; Wed,  9 Sep 2026 16:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788970626; cv=none; b=BIWb72MLZ5N1graiXhWKlbwc1W3eSx4pvAYPwFT1rO5dplYL7EIOE2jpUYYROqIunIB+nI8mna5HPkaAzoaJWlhKoEpUzn56q/n3mv5XjTgYoIfyJEvtVZSOpZcqMp9x9iQ3MpD7idnPStzmyiSiywLlCxkE96ppPT80wobEI3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788970626; c=relaxed/simple;
	bh=eFHDOCUvG6RJkKxnP7GoyTwndFgmCvaMrkqn3U9uemE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XUvExnj3da4QTaCnv09LoCy8BmrfUJxcV3GiOIKZLrdB/vuIpKIxC/vuypD/RNWyPBDKoKK1NIIiHErz0zLWFPhvkloIuAzTTO89AQnIqnwNHxrX/VvlBQGinqrOp/n0/9qcUgA+G3p4aaaFN25OibKe/BcJWUeT72HFuC8DDf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K1whdm1Z; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K1whdm1Z"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4b28df1f600so4532570b6e.2
        for <io-uring@vger.kernel.org>; Wed, 09 Sep 2026 09:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788970623; x=1789575423; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fshKvEEVhGFc5VFLl5TyLUM9DH0VS/1zTeCkHq9ANIQ=;
        b=K1whdm1ZS+gonRbBoAHFC94DNJfuOZqjjRn9l5S9ut3rEPZWEHf8apT56NeHM6X7sn
         HFAwomhnpw/VOedeIYsIQ3VYzYv8EYdT86Xrt8HOMH/7BLAEgHUN6WTFLoRn1Frl6+fi
         aZb+h7/qu7glTMZ3SVu7j2Eeh60kck1ezT0mtmwIx6IArkegZT/rW3/IcMLHpZsm7oOJ
         dQXCU+Gn84Aq00YwUlgNFrQ452ih1Yn88z7DG2UjwF6laHUFOWhRRzeNXNf1uuN2vhat
         RjABQJitvE7lwcdSOujeJshyA5AQhHNRKrDnVpEBjVvAkmMXd8+gLpsdDZJDi3KqDIHl
         SBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788970623; x=1789575423;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fshKvEEVhGFc5VFLl5TyLUM9DH0VS/1zTeCkHq9ANIQ=;
        b=Ai//b4CJXBIOmsLVKMdtD1axvZMH60p2FgztFBqBwZAwcZC/LySTD5nQj5G9b2jhT4
         VEgmYp8UCNn70/5vL7JIwKyZYPjEZQ0L2aXP0yjw7NArefcQyPEAud59KRBa7j6iNbaG
         BnKviP82d5+M7sLMjLDvlf4zrfM7zMyVkwf7+11KLwS5nyTYXFFUvjAKJK43PwwF1OyT
         s/Vaqq2fE3LxGdH2xkeIiAGu1PgK24DKD7jBRsV6I+UHfYUb+h+Uf6s8ClN3m1VWlSDP
         8Q3IR7HFxczy12yTSbIy7PXndJYY4tZj+5F5Q3Zjt39ewGENi6KbiIrFY1ETFy6vPt0O
         cRhg==
X-Forwarded-Encrypted: i=1; AKwUvBy1Kf0yEHNnUVXREcVgCcEeWibgRIu8PIq7lEznmA26WaTnkPzGC/f+XW2M0U+bNxAgu4PeyTGbkA==@vger.kernel.org
X-Gm-Message-State: AFuF++ncKtM75EQdpi850Lu6V4VyV17auCtzcIJnvvJX7hUtk2nTGnxf
	0xsUAIZrDvEAIsi/G+I1y1JCfpzWWbVyR/Ib4FUWqDXMC3P0DTMdYzWx
X-Gm-Gg: AYBFou07ZpO7v9w3wQbMcs56evNWDmnch3zvVNFwgLSkaonZ6hzONW82aal+YcA4DBD
	+sSbE3PWoQHa+WoVcbcj72xxjYloZ8Z6BFB90V8Unyfz99mMlcn7mBKELmkSugjGa7uMX4RiPQ+
	Q/l1RAzsNOzkd4o4yKXaFcz4f6WQmdWEYcC/9tkevJ7ZXMnRN+++sHzIodlp5P4TQCjYVRzNmRX
	/FeHAQ/ANGGh4/nACQGn5WIfVmxBCZPShTed2xFubYULy4f2rWTjn+PpEuMbAqksD0i9CwbPy4i
	IXODKPRbIOzs7yBfhI9AqHfS9k9iWf+J175mYqDeRWQuoWyTTKxkqMCLlegodlUG9fQ5QWwAww1
	cwakPtEONnqAKKUoqyS5S+PAXIk2jNMqljkTwlkFckOmuYJmKeHJxshYyLvIhwul7zeAcR/ztGM
	EYeNjjXeHxDtB2Q4ju5HkqUG/yLrnZMFjl/ZwBkSFbq4+ZicNDfkoHcSWiIdzJVbaD1a6rhd7Hu
	/SafGBsv6ss4mXrEcPx
X-Received: by 2002:a05:6808:bc4:b0:4a4:adaf:5570 with SMTP id 5614622812f47-4b95fb4f59bmr23974245b6e.4.1788970622954;
        Wed, 09 Sep 2026 09:17:02 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:6::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971240f68sm16753189b6e.8.2026.09.09.09.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 09:17:01 -0700 (PDT)
Date: Wed, 9 Sep 2026 09:16:58 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: juanlu@fastmail.com, dw@davidwei.uk, netdev@vger.kernel.org,
	io-uring@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, kuba@kernel.org,
	asml.silence@gmail.com, pabeni@redhat.com, shuah@kernel.org
Subject: Re: [net-next,v6,5/6] selftests: net: add multithread server support
 to iou-zcrx
Message-ID: <aqGGevrEG5+iZosZ@devvm29614.prn0.facebook.com>
References: <20260831-iou-zcrx-v6-5-02d1d012f0fd@fastmail.com>
 <178839229706.3394541.1555608492152892136@kernel.org>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178839229706.3394541.1555608492152892136@kernel.org>

On Wed, Sep 02, 2026 at 11:38:17PM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential
> issue(s) to consider:
> 

[...]

> > @@ -356,29 +444,68 @@ static void run_server(void)
> >  	if (ret < 0)
> >  		error(1, 0, "bind()");
> >  
> > -	flags |= IORING_SETUP_COOP_TASKRUN;
> > -	flags |= IORING_SETUP_SINGLE_ISSUER;
> > -	flags |= IORING_SETUP_DEFER_TASKRUN;
> > -	flags |= IORING_SETUP_SUBMIT_ALL;
> > -	flags |= IORING_SETUP_CQE32;
> > +	pthread_barrier_init(&setup_done, NULL, cfg_num_threads + 1);
> > +	pthread_barrier_init(&dispatch_done, NULL, cfg_num_threads + 1);
> > +
> > +	for (i = 0; i < cfg_num_threads; i++) {
> > +		ctxs[i].queue_id = cfg_queue_id + i;
> > +		ctxs[i].setup_done = &setup_done;
> > +		ctxs[i].dispatch_done = &dispatch_done;
> > +	}
> >  
> > -	io_uring_queue_init(512, &ctx.ring, flags);
> > +	for (i = 0; i < cfg_num_threads; i++) {
> > +		ret = pthread_create(&threads[i], NULL,
> > +				     server_worker, &ctxs[i]);
> > +		if (ret)
> > +			error(1, ret, "pthread_create()");
> > +	}
> >  
> > -	setup_zcrx(&ctx);
> >  	if (cfg_dry_run)
> > -		return;
> > +		goto join;
> >  
> >  	if (listen(fd, 1024) < 0)
> >  		error(1, 0, "listen()");
> >  
> > -	add_accept(&ctx, fd);
> > +	pthread_barrier_wait(&setup_done);
> 
> [Severity: High]
> Is the listen() intentionally moved before the workers have registered
> their ifqs? The main thread creates the threads, calls listen(), and only
> then waits on setup_done, while the workers reach that barrier after
> io_uring_queue_init_params() plus setup_zcrx(), i.e. after
> io_uring_register_ifq() has restarted the device RX queue.
> 
> Before the patch the sequence was serialized in one thread:
> 
> 	io_uring_queue_init(512, &ctx.ring, flags);
> 	setup_zcrx(&ctx);
> 	...
> 	listen(fd, 1024);
> 
> so the port only became visible once the memory provider was installed.
> 
> Two existing tests depend on that ordering. wait_port_listen() in
> net/lib/py/utils.py polls every 5 ms, so it can now return while
> registration is still in flight:
> 
> iou-zcrx.py:test_zcrx_large_chunks() {
> 	wait_port_listen(cfg.port, proto="tcp")
> 
> 	check_iou_rx_buf_len(cfg, rx_buf_len)
> }
> 
> check_iou_rx_buf_len() raises "Expected 1 io-uring page pool, found 0",
> and nk_qlease.py:test_destroy() does queue_get() plus
> ksft_in("io-uring", queue_info) immediately after wait_port_listen() with
> no sleep.
> 
> Beyond the harness races, data delivered into the queue before the
> provider exists is serviced by the copy fallback rather than zero copy,
> and the queue restart during registration can drop in-flight frames.
> 
> Would moving listen() below pthread_barrier_wait(&setup_done) restore the
> previous guarantee?

Just a heads up that I tested this on BRCM and did find this listen()
ordering issue to cause genuine (but flaky) regression for
nk_qlease.test_destroy. Moving the listen() to after wait(setup_done)
indeed fixed it.

Best,
Bobby
