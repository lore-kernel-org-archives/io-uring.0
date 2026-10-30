Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793323595;
	b=sd5wBjKwQpwOKz02eRkJHw85edJXe3TMXA7t6yCYyhI3sHuixENgz5bmFsOSngNFFT71
	 +YmuAoefIdTGtPEQ05atpL2BbJjodhoV5pmDPlqNoCxddAxttMqApw181WxvATrqwaP5i
	 0vTz3xx1SsEtnEyndhnnBNgEfYEHYnhRDemw5a6ypfTe2SYdSXo5Ji6KWBdeJ+ffUNZHI
	 XUe/RbS2ibkqWFdNARIf3+sX7hR7WZvpoBuIjhzXhEN70ybbal42ml8Zk1MsmxG/zLu2v
	 pDKvXD8yya3lQi2V7loeuS5D2actodnJJsC/OKrb61vA2UGfApGkSe7jUXBuMSBttWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793323595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=fWTHFAviHWukcsFlILsrZzqQ7AftBNGP9ajHposfJNA=;
	b=2pqfpfMqlLk48IwVxmX+cOLtvbn7MOFd8GwgFWqpgKyAc47nWSop2gLExC0Pz/pYT+Jr
	 lqT3U26UehPH9muEqFuW9Mwbo/Gjm0qZX5s69sf3cvtIHYh0IS2Dkq2ETgL4XAJnoOHcY
	 TWtlVN8ydUSmtD2R02/qkKjmHx4Tg+9uzsC86FjjF87NYC2wdQ85K14fFPWKa24bI+uZ5
	 EbiAAWo6Q8d5dknB4fq9Kn+Zo4Rahwy1WLfbR3qNzihfFZ3EGVXZCYA1/Ejx5Pbo/Pvkx
	 yfwpb14A6UihGupT1lUFgzPPLU6iGCFbTjMYsTu9NRRP1V820YcTFpaPF5i0/VTEPtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ElieNJlp;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6F1606A31A
	for <io-uring@vger.kernel.org>; Fri, 30 Oct 2026 01:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B6F1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ElieNJlp
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso1528425e9.3
        for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 18:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793323594; x=1793928394; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:reply-to
         :references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fWTHFAviHWukcsFlILsrZzqQ7AftBNGP9ajHposfJNA=;
        b=ElieNJlp4DR9PeO29n6vlGgtOlyMtAUxUKHJEPMCEcWaZu2FKnBn/u/TsgNoR3uKGw
         OTg3z6zYpAvNGIBRpY1gRPsQd0+ZQLdG8tdNEiK6VKb201TlopN7O3UIK5NEgpyKi8c8
         dR1szSb44CkpvvOxVmQplD+hdjUnWFrNQjCskHVTxPuO06HcQ1UvK4uLNdOV66EEIDVg
         88EzzWl7K4kZ3bXnZxvHtGadmlaDhQvaenSaV5Z6DcF8TDz26awgqYojWB8xneYUU+sR
         QZgTFnBKOXVRbhbQjElmNcjZUH0OPf8YRaXnl80RGyysr5hrMGK3pikEE7kRr4leNmYc
         2skw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793323594; x=1793928394;
        h=content-transfer-encoding:content-type:mime-version:reply-to
         :references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fWTHFAviHWukcsFlILsrZzqQ7AftBNGP9ajHposfJNA=;
        b=SM5rNBrPeVQn1ZVpT6tGZNK64Hki5jIb+MqdBV2AaWypxIhMtT4dJ+VxP25tViS9dN
         W0/VIn5G7OhGKfRPrNUCNFSwGeTCDSnQ7N1YyLZW4aQNNs8f01CbIJYHujb8A1LtCdcL
         5jghYFwEjF+7RPFwGEuDe0HVA8fOQg2Yp5Zq8E2dmejqbCP4cFF9GJOaNIvPFrMkbcVi
         UO8PIuuIzDOWww5/xQzZXviRNWE9DpbAHKCBO48qyQo8JL3DdYZUwCqJv1B0dS7S+jI1
         oEidQUXzHAn/2ApZ/q3i+JeNjSBRcLURD+389r/48Rs9p1XXcWpYZZdbRfzxyOVzwbcd
         8aGA==
X-Forwarded-Encrypted: i=1; AKwUvBxqR47iRfLj+pij/vr5mlZv8VUlkZ88UT5EFX2zItNJ9iPFKi4+Lj3UgUZEAGXJnXmAPs3+z/juKg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKQd3dHs++Qz0g7LRtn6vJgaZiRc2fPrLQMB7Utyh04FzcMO7J6
	OIS8xteaSTk2pp+UfteRyvmn9aGlLyMdCOrjas40t1Mr2apXFPeG5x02
X-Gm-Gg: AYBFou0Ox0/PZ7cR4srFL9i2Xjv8Q72ZWEJWRIYoJAgnabxzrS0RgKzhZGa+Gmv5+Tr
	g6YO2SPmvnIL+XB8BlBzV7cgGBFaFSxTsmtYzIhKhQmOAYTkXCnC4sb6grdERkEWUyZoHEy89Jq
	kqMPsUO82wfe4Cldvw39/T6HAaCloymKIwWNxl/qHEBLJl9c2LMGN7FFoQqCtfXRO5O4Sk59Uh6
	58Xj/p5MCfEF87UOo68IpN+GJcfqnQ9pmh5EdZREziwsUl5p4vDJVuzF1cjJJ26nFDtezHtyVNx
	QjOK1r3Ex8OKrFGMUKAWpr9lPHb2gOjUoDhhHN4znS5e1KaVkWxftkmwCzHGn2u7B7DzSRmhdB5
	TmFOWzgi2cvh3wOedGLkt8mR6MgyelryrzffjzttPo0ZG0O/Okr4xf/NTJe+ZqiQNmrF6mCd1Nv
	stgfzrPoket40rxadiCD7RD5sPOnFGXuasLlxjityZhXzMFeBTDMDR7RMrKQFSOwvP7BEuhXcZP
	oAWaj3AG4mlKtouuxIZkqO0YekxW6r87UJzmmssw+24G+Z02Yu4LlKY5Q7g0D7RoV3NW+tFeu97
	5q9k1oWmXQr7q2cdwvvizfM7GOUnhE3OJ35LDBFsdy+KXNR+XhO/CdFCGy2xt/ywZolzGAuEWsY
	xEtV99FGpBvDZ03diyJlxkYQTS0p8kot5sFMLIZI6sRpz/NRdVSgJ1AzliTtPaPvoVr00Q6c47h
	PK/OJfMg==
X-Received: by 2002:a05:600c:6216:b0:4a3:5aea:21e5 with SMTP id 5b1f17b1804b1-4ac1737c533mr13785495e9.9.1793323593584;
        Thu, 29 Oct 2026 18:26:33 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-077-007-148-028.77.7.pool.telefonica.de. [77.7.148.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba7168sm252187f8f.55.2026.10.29.18.26.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 18:26:31 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Chris Mason <mason@kernel.org>,
	io-uring@vger.kernel.org
Subject: Re: [PATCH 08/10] io_uring/cancel: drop sqd->lock while SQPOLL waits
Date: Fri, 30 Oct 2026 02:25:06 +0100
Message-Id: <20261030012506.10611-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028164732.1264069-9-axboe@kernel.dk>
References: <20261028164732.1264069-1-axboe@kernel.dk> <20261028164732.1264069-9-axboe@kernel.dk>
Reply-To: Karl Mehltretter <kmehltretter@gmail.com>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> diff --git a/io_uring/cancel.c b/io_uring/cancel.c
> index 6f7a6cf356c2..79b5c133319b 100644
> --- a/io_uring/cancel.c
> +++ b/io_uring/cancel.c
> @@ -703,7 +703,16 @@ __cold void io_uring_cancel_generic(bool cancel_all, struct io_sq_data *sqd)
>  		}
>  
>  		if (loop) {
> +			/*
> +			 * A request that runs in io-wq and doesn't end makes
> +			 * each round come here. Don't hold sqd->lock for that
> +			 * long either.
> +			 */
> +			if (sqd)
> +				mutex_unlock(&sqd->lock);
>  			cond_resched();
> +			if (sqd)
> +				mutex_lock(&sqd->lock);
>  			continue;
>  		}

Doesn't dropping sqd->lock here allow IORING_SETUP_ATTACH_WQ to attach
to an SQPOLL thread that is already exiting?

io_sq_offload_create() checks !sqd->thread under sqd->lock to avoid
attaching to a dying thread:

	/* don't attach to a dying SQPOLL thread, would be racy */
	ret = (attached && !sqd->thread) ? -ENXIO : 0;

Previously, once io_sq_thread() left its main loop, it held sqd->lock
across io_uring_cancel_generic() until it cleared sqd->thread. With this
unlock, io_sq_offload_create() can take sqd->lock while cancellation is
waiting, see sqd->thread still set, add the new ctx to sqd->ctx_list,
and succeed. io_sq_thread() then finishes canceling, clears sqd->thread,
and exits without ever servicing the new ring.

When testing this race in a VM, io_uring_setup() succeeds instead of
failing with -ENXIO, and the new ring immediately fails with -EOWNERDEAD
on io_uring_enter().

Maybe io_sq_thread() could set an exiting bit in sqd->state before
calling io_uring_cancel_generic(), and io_sq_offload_create() could
check that alongside !sqd->thread?

Thanks,
Karl
