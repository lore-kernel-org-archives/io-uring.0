Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B157E2E8DFC
	for <io-uring@vger.kernel.org>; Mon,  6 Jul 2026 19:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783364489; cv=none; b=gbJ+petI2hl1Qini05Wl9e9qXM9rFDk7LgxQUN8U9zpS/164QkkOF6m/2wlvZhPPAkpAK7jeBXa6qbgSmuxH6qNh9FNe7/eVfk8YCzJkYdGfRNV7hS6gG0L2lS6PQMBGt5qpG3YKz3SB0IkyfUBLooB8T96PxJC3aHzSW1CMIQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783364489; c=relaxed/simple;
	bh=8z3H5pOmv9FJzzWGKGMRL22BIuJrrbYJYmqaNpUMp2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ijSliKbd6QfJZT76LGDxzd0vzkKVkTPdsva3dbQWaz75qrkB8hdzmjUFk4iXwO+AMKvQ5V2Eg/HcToI8eO9OS0VvkBOxqOGfmcYGEeB924hKs3ONtmK330W8KvlE4b2+f53vmMMvM6VQHhciHWe7k4xr8nlXebdsyaL3YXOnGf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B3rYRZLN; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B3rYRZLN"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8478a25f268so2524757b3a.2
        for <io-uring@vger.kernel.org>; Mon, 06 Jul 2026 12:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783364487; x=1783969287; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2KMT6UZ2QSOc0un8dMggiel2syWYq8q93mY2wWgeDaQ=;
        b=B3rYRZLN2az3M0Cg0QR4rv6bdmTUxE7mnRR6RSxM6C0tEGyOJYmvO92F20gkmKWkb6
         8qFDZfFjEFxM9osGDCBZP/OhS9paDspQ0QOxRRyJ1Q4Lgd6Kg0XuhWgUAw9jgFGBpxyX
         ocVWfpAJiufKSixPcT+N/XsPmOdxEvRfGATGQAmFnXjTk6loKoH2WHsCrXMS4IBCLXGe
         fZocWICmxHuQmqEl/WRQ5acxyY9Z66ovUyROFHmOddF81yoOdtIPm1bZuBX8FFruMb55
         gvYk1uhuPaePsNOUo8LDh30AOs2f20KKXAR5b2s8cqAD0SfNLsYBMCnmWZHML8P7Nxnd
         x+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783364487; x=1783969287;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2KMT6UZ2QSOc0un8dMggiel2syWYq8q93mY2wWgeDaQ=;
        b=l4+rHuX7G4eA2lEBEepjb5pVzrpN/W4HXGHvdOl6X1QBJESKmfIG+L7WatRdjo7Do5
         oBmgdOr+D0TB2C6pTPNIuFq/jNsSPEohnNf/hw9qJVxmXaDMYxJhkloQxGyE7JeSjXpy
         HrMYOcMfls8TTy5LMMurIwNL7PBy+gw7KBIKfJbyowlMhe2+u9xFu8PrB1x8duGRHFnq
         +hfHOS3qGc/hu/7JteYRaUmvcJa73wfGOltINuDIOzhiqN2mZt/4NFUsGlg4H9dce/+v
         XjjfFsv4CJyTE7PbG8KDW8DjtsKbbOt8gxs1dyYGIEcoesO2u8WeA32+T3Kcv3NSqtt/
         H7EA==
X-Forwarded-Encrypted: i=1; AHgh+RrEgtua38aiXoEncqAA/jjps66GMK+l3tcBSRruZaFssy6POKJGpeDSNJllwO6jCZ2jwe2WFyE19Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfFAJqczwsFUNwEh8sCEkGocR55lzEVrkAC7cqCU4gG3KrNk14
	Dd32wbd+jfF/PA5g3T1+ise0ZSWbe8JO2tw1xrvMpOVloX4DphBEF7YAt3GCaareank=
X-Gm-Gg: AfdE7cnPUckwwt+QH01nHjUFVwaW3yR9DdigvqH2R+6sSCwHm6j9yenlscjzp4IEjjj
	2xqxdISI193vBPLB2e2LlNMDCuQh8uuKZZ8zk5fDyGBmf83d4pCuJBLcluViJouDVanEmdecLqO
	DZpnQ/nyqwqNTY4XXyW10q8Ue2SBPIweH6rTpCRZEO1OXg/ykyacO5fgFK7W94TNsAF9r9dpJNF
	sTow37oXYVIma7H+NKZEF/XwXJEOHixYpqTd7vfFgZh0Tiy4At0gJqCx5v8f2EeMEYNpEMTRVmK
	yiOoUUS4Osuz3IvgRXGvbEER9d+8AJ8AdTrc6LldoerIh7QzdUBK9qWXxul0npNkQI8InFExCiD
	2PYKwESyikCIiyb1aS5LGowz2hHe5V0XY9L0bwp8wFbMhV2F011z10zwy0LtQTBZ4W/kZA5zKM4
	sT1ooC60TjdvQ5jim0egzKfP/M7GqjS9blIDNDAqo=
X-Received: by 2002:a05:6a00:300d:b0:845:e3af:dde9 with SMTP id d2e1a72fcca58-84826d3f6c8mr1825273b3a.38.1783364486847;
        Mon, 06 Jul 2026 12:01:26 -0700 (PDT)
Received: from naup-virtual-machine ([140.113.139.102])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db0eaasm4256912b3a.52.2026.07.06.12.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:01:26 -0700 (PDT)
Date: Tue, 7 Jul 2026 03:01:23 +0800
From: Hao-Yu Yang <naup96721@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: axboe@kernel.dk, io-uring@vger.kernel.org
Subject: Re: [PATCH v2] io_uring: fix dangling iovec after provided-buffer
 bundle grow failure
Message-ID: <akv7g/e+0wzWpZkE@naup-virtual-machine>
References: <20260706183304.919275-1-naup96721@gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706183304.919275-1-naup96721@gmail.com>

On Tue, Jul 07, 2026 at 02:33:04AM +0800, Hao-Yu Yang wrote:
> When growing a provided-buffer bundle, the old cached iovec is freed
> before the new buffers have all been validated. If validation fails, the
> request still points at the freed iovec, which can be freed again during
> completion cleanup.
> 
> BUG: KASAN: double-free in io_vec_free+0x2c/0x90
> Freed by task 73:
>  kfree+0x104/0x3b0
>  io_vec_free+0x2c/0x90
>  __io_submit_flush_completions+0xc03/0x1e40
>  io_submit_sqes+0xdb5/0x2310
> 
> Allocated by task 73:
>  io_ring_buffers_peek+0x559/0xc60
>  io_buffers_select+0x1c1/0x460
>  io_send+0x770/0x1050
> 
> Fix this by deferring the free of the old cached iovec until validation
> has succeeded. On failure, free the newly allocated iovec and leave the
> request pointing at the original one.
> 
> change log:
>  v2: slimming v1 patch
> 
> Fixes: 46800585ae04 ("io_uring/kbuf: validate ring provided buffer addresses with access_ok()")
> Signed-off-by: Hao-Yu Yang <naup96721@gmail.com>
> ---
>  io_uring/kbuf.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/io_uring/kbuf.c b/io_uring/kbuf.c
> index 3cd29477fff2..b6b969b55e12 100644
> --- a/io_uring/kbuf.c
> +++ b/io_uring/kbuf.c
> @@ -287,8 +287,6 @@ static int io_ring_buffers_peek(struct io_kiocb *req, struct buf_sel_arg *arg,
>  		iov = kmalloc_objs(struct iovec, nr_avail);
>  		if (unlikely(!iov))
>  			return -ENOMEM;
> -		if (arg->mode & KBUF_MODE_FREE)
> -			kfree(arg->iovs);
>  		arg->iovs = iov;
>  		nr_iovs = nr_avail;
>  	} else if (nr_avail < nr_iovs) {
> @@ -330,6 +328,9 @@ static int io_ring_buffers_peek(struct io_kiocb *req, struct buf_sel_arg *arg,
>  		buf = io_ring_head_to_buf(br, ++head, bl->mask);
>  	} while (--nr_iovs);
>  
> +	if (arg->mode & KBUF_MODE_FREE)
> +		kfree(arg->iovs);
> +
>  	if (head == tail)
>  		req->flags |= REQ_F_BL_EMPTY;
>  
> -- 
> 2.34.1
> 

Just sent this v2 patch and wait for this patch merge? I need to do anything else?
