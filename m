Return-Path: <io-uring-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4283DC7618E
	for <io-uring@archiver.kernel.org>; Thu, 27 Apr 2023 02:56:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242668AbjD0C4Y (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Wed, 26 Apr 2023 22:56:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233414AbjD0C4Y (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Wed, 26 Apr 2023 22:56:24 -0400
Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EBDF358E
        for <io-uring@vger.kernel.org>; Wed, 26 Apr 2023 19:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
        s=default; t=1682564182;
        bh=e0PybUQurb6/WbVokMPTVH8g8w5zAD6QbWpI65y+nws=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To;
        b=DCBkqA989+3JXcNiwmRgY1+/swv3z6xJdOAlx1FNyvWV1Tk3Moes5Cyxl9JuZtHpH
         2uXnpTSVmnGojtVFSN9fa7FpXLe+N0aNb7Xels0m3lrk6LBFg4FbhUWAxAEquMZTne
         7MOwPV8alKLPArCWwITZLd9i7CIJTkuYZEJZtstH2n54WMsOHOfe5Z4Qbbx/OxRrd2
         Bk6RId3NFarcxGu9YBiQPjba8Tsc8OJEUt7QJTkxgb5fTJLVM+/SHPlp9n+cq5NtGJ
         NKgGvWO9oBU7gEsNf99TFAlsgg70YCl5kQK6Xq1CfI6Ji897pG1rghpVQ5F+I+N3a8
         PjQraaOT4lubA==
Received: from biznet-home.integral.gnuweeb.org (unknown [182.253.183.137])
        by gnuweeb.org (Postfix) with ESMTPSA id 428C024599D;
        Thu, 27 Apr 2023 09:56:19 +0700 (WIB)
Date:   Thu, 27 Apr 2023 09:56:16 +0700
From:   Ammar Faizi <ammarfaizi2@gnuweeb.org>
To:     Stefan Roesch <shr@devkernel.io>
Cc:     io-uring Mailing List <io-uring@vger.kernel.org>,
        Facebook Kernel Team <kernel-team@fb.com>,
        Jens Axboe <axboe@kernel.dk>,
        Olivier Langlois <olivier@trillion01.com>,
        Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH v10 2/5] io-uring: add napi busy poll support
Message-ID: <ZEnkUMF/p19Ub0MQ@biznet-home.integral.gnuweeb.org>
References: <20230425181845.2813854-1-shr@devkernel.io>
 <20230425181845.2813854-3-shr@devkernel.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425181845.2813854-3-shr@devkernel.io>
X-Bpl:  hUx9VaHkTWcLO7S8CQCslj6OzqBx2hfLChRz45nPESx5VSB/xuJQVOKOB1zSXE3yc9ntP27bV1M1
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

On Tue, Apr 25, 2023 at 11:18:42AM -0700, Stefan Roesch wrote:
> +void __io_napi_add(struct io_ring_ctx *ctx, struct file *file)
> +{
> +	unsigned int napi_id;
> +	struct socket *sock;
> +	struct sock *sk;
> +	struct io_napi_ht_entry *he;
> +
> +	sock = sock_from_file(file);
> +	if (!sock)
> +		return;
> +
> +	sk = sock->sk;
> +	if (!sk)
> +		return;
> +
> +	napi_id = READ_ONCE(sk->sk_napi_id);
> +
> +	/* Non-NAPI IDs can be rejected. */
> +	if (napi_id < MIN_NAPI_ID)
> +		return;
> +
> +	spin_lock(&ctx->napi_lock);
> +	hash_for_each_possible(ctx->napi_ht, he, node, napi_id) {
> +		if (he->napi_id == napi_id) {
> +			he->timeout = jiffies + NAPI_TIMEOUT;
> +			goto out;
> +		}
> +	}
> +
> +	he = kmalloc(sizeof(*he), GFP_NOWAIT);
> +	if (!he)
> +		goto out;
> +
> +	he->napi_id = napi_id;
> +	he->timeout = jiffies + NAPI_TIMEOUT;
> +	hash_add(ctx->napi_ht, &he->node, napi_id);
> +
> +	list_add_tail(&he->list, &ctx->napi_list);
> +
> +out:
> +	spin_unlock(&ctx->napi_lock);
> +}

What about using GFP_KERNEL to allocate 'he' outside the spin lock, then
kfree() it in the (he->napi_id == napi_id) path after unlock?

That would make the critical section shorter. Also, GFP_NOWAIT is likely
to fail under memory pressure.

-- 
Ammar Faizi

