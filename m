Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793807853;
	b=OSjIByCVwCxFrK7Crm9v7fgJff5jHZDa9KdAtA8cQjDnfnRgjyx1VNikdMkiKyfh3jp0
	 lKiX+kNyMWSUagrW/+7/r4zjqzpX+vyima6ZPWi/GaFZapi2XMAPIcVYK9GmARGwnln04
	 haKqQaazJGWY3apFt8T00rH8NZEkORJrtyKTNQ1uiilhDl98wUyHfWI6N5V7muwLGbNHo
	 Jgl/5H7cXQHqPHSyyHdlQX4Ws+c6m424UN0Nf3drXSX8tsYT+ujxiW9qsjvtWfqFzVKYd
	 4oCWg8X084RGKUE0GQopC0uBEVLeUqQXvfetkGeYP3MyFktazFMUOMhqMRNvP40ps4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793807853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Kk7WaUVAPHjwSZ8WgmPUlAUmwEhJpE2sjlLBaU/kUfY=;
	b=jg6OcV3dUVwcM/7xQwSdx2Eqax62VjRqvalgEpve92AO2JWOrG/ukHe0vwZlJnMO/tl8
	 rfszjzPnpsrXEJVoVdnuhDOZb9YSWXk2yGKjCQs3/oeUw0RocMWO+1eWyGPIdkIE+gWfR
	 KvAZM/Op81KYYVCnF0m5+3UMP8UGJAVOh6kqI4yzg9M+NjzYw4olKw6IUU98Prs5RPb1Q
	 JSH4oMXDQZsNO10oCgSZe9OIMgjIEb9qu1fs1xzWfNqTpY9JMhVq1tt8j3vIugYRaoKPp
	 v9kyK15jxc8NGSxWLXGcqDBDxgNYCsTo0KSUJaXTy4N5455SY+WDqlS1pLidrIVFcRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Rh+5Wr6X;
	arc=none smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7963260A260D
	for <io-uring@vger.kernel.org>; Wed,  4 Nov 2026 15:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7963260A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Rh+5Wr6X
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-483c607ccb4so553568fac.0
        for <io-uring@vger.kernel.org>; Wed, 04 Nov 2026 07:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793807850; x=1794412650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kk7WaUVAPHjwSZ8WgmPUlAUmwEhJpE2sjlLBaU/kUfY=;
        b=Rh+5Wr6X0oJFm7cUtmnB780WmqbM/ENM3a8i2ARjLYHWZFLrgnXMokIAg9EzVsahYr
         RjoQ6dClfy1+V69Qqaf8SZLKHdaQierrZ2THnuYOS3F60chX6B/5exw+4FHxXh5VtOIs
         kwN6mfyJssWVU+e6UI/1TLMWxBg8VhXwI/Rf3vaaopL9niHXsEL3TTkOjGOF28lO2YPA
         o20ctc06w5gQGEFeiLEl4NHfsHQ3p4byMxd66mKvn1JScKFb3EOmNE6/Z6AE63IlYQUw
         CBiIz3CVAyEZhh9M1zNDg9y2aX0N2N5qXm2AFoXGPwZyPzDt/inp8Bfa4L8zSPx7MJyf
         Vu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793807850; x=1794412650;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kk7WaUVAPHjwSZ8WgmPUlAUmwEhJpE2sjlLBaU/kUfY=;
        b=tMw62x4aUOCWFhtZuJvJoiptBm1IpEElIJi7LpM/vUTgwwrrln/8HyW+XWwbz3GU/b
         O8YCuk/vDmEg8AF75ue6aJqvjjqfMJSsuVG1VRXuEzegOSLXYchLBc9XWY4cM/nJ1mw7
         UwLZJNqSr8CVy0nOmF7wfpz9oWjrcyFi3yNPC2RroBn412xerI6oB0GrdokyDz149E4C
         ATWWTMrk/CwwB5yYVv0GLbRgQnNp5epQR/s6e3Hp+XqIfD5+MZ6Wca0X+YdmWs8krqJ+
         7ipGC2oJRGKX8cJpAz2vGO/jLW/DVbiWJa1P7NX8MyqxMCgX5xvf/k+NQDeLt9vyGtZr
         7PXQ==
X-Gm-Message-State: APuU4Z9e7O+bkYv/zXbFX8f3kaXlDInuNisGkr6Q5k4ZmltBVdO89Vn3
	EnhYNKVs0014BvXEy1QdlbgHn3GOrg0TnURocb4wupSXConetQjchcLm8VUxyC6Iwqk=
X-Gm-Gg: AYBFou0P+n3dqa9LGvZ+cV+cmYMx4L4pgA7OU/rt+dGQB04cCmV2FzBzF8CUxal3iQA
	dsbCycimDDNaa8XfgsbFBE0lr8OG5h2cI6nGaehJVBPA3KI6PcyLiHaGiywFyZqObRYWAFoFCYc
	q0jl+vYLKjz2zmy2D/7RWH3TbBWYgIn0iYrlRUF5IQA6sf6KxpAvWvBncqk56gmaOphu7+xxSx1
	gUlR9xBV65GA1bs1XWvxyhhlqFnKke5J81QDCKR+rUikw9kYsYhW9LAI9hXLw++ejG6mF82qjRt
	sAhrCIhQX9YfHfHTIeB4c2n8o9Ba80QvekRAjXv3Ws5rWz86/BKqlC7rOn09CUmb6EyQOyliX8n
	s4MEoyDEThLvMdf0EP3LNw0D+F7ZNJp638zgj2VGN7ZaA/CaOn/KvooIG6NxXMcDTIC938WG4L0
	4X22QRWl3xdMXey5DKolVwa2LcLdbA5oo8bKc9Txt1NYXY9djdOdjBmFqiGHebDduF+R18K92eh
	Z/nhcJXGMY3BByigkzT/4m7xdpGYwbSD3j2U5W6NcfCpFoFdT1cLTGD0oGkFnHUZks+ApGSvIle
	O7WxuyeC/lcSml1MYaQ1fo042PlFapBe10/m+1HBmEBAdfCiko5gXIVQU3OXrMqV7MqeSYDexor
	UnH+IyMPzcbzHfXQZxVdiVHttHBEcxQ==
X-Received: by 2002:a05:6871:2b17:b0:494:895e:c3e2 with SMTP id 586e51a60fabf-4a90764ca88mr11054199fac.20.1793807850283;
        Wed, 04 Nov 2026 07:57:30 -0800 (PST)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acea5f93b7sm2261237fac.12.2026.11.04.07.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 07:57:29 -0800 (PST)
Message-ID: <b0cf7a92-02ca-431e-9210-f76b205487fe@kernel.dk>
Date: Wed, 4 Nov 2026 08:57:28 -0700
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring: only wait for in-flight requests if the closing
 task uses the ring
To: sariorkunemin@gmail.com
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104-io-uring-wait-inflight-v1-1-4361a0905e20@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261104-io-uring-wait-inflight-v1-1-4361a0905e20@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 4:56 AM, orkunsari via B4 Relay wrote:
> From: orkunsari <sariorkunemin@gmail.com>
> 
> Since commit 13d3783a55b7 ("io_uring: wait for in-flight requests on
> ring release"), the task dropping the last reference to a ring file
> waits in io_ring_ctx_wait_inflight() until every request on the ring
> has completed, and only a fatal signal ends the wait early.  The
> requests may belong to other tasks and may not complete for an
> unbounded time, e.g. a read on a FUSE file whose server never replies.
> A process that merely received the ring fd over a UNIX socket and
> closes it then blocks in close(2) for as long as those requests stay
> in flight.
> 
> The comment in io_ring_ctx_wait_and_kill() states that the wait is
> meant for requests owned by the task closing the ring.  Only tasks that
> created or submitted to a ring have a node for it in their
> io_uring_task, so skip the wait for any other task and leave the
> remaining requests to io_ring_exit_work() as before.
> 
> A thread of the same process that never attached to the ring no longer
> waits either when it drops the last reference.  A task that is attached
> can still be held up by requests submitted by other tasks; that case
> is not addressed here.

Fix looks fine, few things to sort out on your end:

> This was found by AI-assisted code review (Claude Code).  The fix has
> been build-tested with W=1 only; no reproducer was run.

Just drop this.

Also fix silly double spaces in commit message, thanks LLM, and
verbosity is also overkill.

Signed-off-by is a legal contract, use a real identity, not some
handle.

> @@ -2547,7 +2547,16 @@ static __cold void io_ring_ctx_wait_inflight(struct io_ring_ctx *ctx)
>  
>  	if (current->flags & (PF_KTHREAD | PF_EXITING))
>  		return;
> -	if (tctx && atomic_read(&tctx->in_cancel))
> +	/*
> +	 * Tasks that have attached to this ring (created it, submitted to it,
> +	 * registered its fd, ...) have a node for it in their io_uring_task.
> +	 * A task without one owns no requests here, e.g. one that received
> +	 * the fd over a socket, and must not be made to wait for requests it
> +	 * has no control over.
> +	 */
> +	if (!tctx || !xa_load(&tctx->xa, (unsigned long)ctx))
> +		return;
> +	if (atomic_read(&tctx->in_cancel))

Similarly, this comment is way too long. Cut it down.

Resend with those things fixed, thanks.

-- 
Jens Axboe

