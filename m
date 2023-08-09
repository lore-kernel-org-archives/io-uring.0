Return-Path: <io-uring-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83256C001B0
	for <io-uring@archiver.kernel.org>; Wed,  9 Aug 2023 16:46:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbjHIQqb (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Wed, 9 Aug 2023 12:46:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbjHIQqb (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Wed, 9 Aug 2023 12:46:31 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2FD81BF7;
        Wed,  9 Aug 2023 09:46:30 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 5673021866;
        Wed,  9 Aug 2023 16:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1691599589; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6rO3bUwCxHrhMQ/KnyWVceX9aLTMN6xCVxviePeeskU=;
        b=txUbbjWI5xw5IUefZ5+yIFbM4fAhuTkdbK68tmd9ICSYbBAuJ++hpQQg6rxjeL0n2VXzel
        zj2aZuTBkvwIOmCjEr7Y6at53HwZkrlpX/bcUlaDc/gM1tsNuSrUwU9J3XXEPKaw0XSmPn
        3biEZDSHLsaLDk4yVAXY3G/xW3CIDBY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1691599589;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6rO3bUwCxHrhMQ/KnyWVceX9aLTMN6xCVxviePeeskU=;
        b=D6SVisjaDadmt9fliy1dxxoVcIW1VNppOcFZSit1E54dGhJ4h7QqGkljwSTY9FmUIB0Oy3
        6rqA/qJDBVQvv/BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1562F133B5;
        Wed,  9 Aug 2023 16:46:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id UXouO+TC02SQbAAAMHmgww
        (envelope-from <krisman@suse.de>); Wed, 09 Aug 2023 16:46:28 +0000
From:   Gabriel Krisman Bertazi <krisman@suse.de>
To:     Breno Leitao <leitao@debian.org>
Cc:     sdf@google.com, axboe@kernel.dk, asml.silence@gmail.com,
        willemdebruijn.kernel@gmail.com, bpf@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        io-uring@vger.kernel.org, kuba@kernel.org, pabeni@redhat.com
Subject: Re: [PATCH v2 7/8] io_uring/cmd: BPF hook for getsockopt cmd
In-Reply-To: <20230808134049.1407498-8-leitao@debian.org> (Breno Leitao's
        message of "Tue, 8 Aug 2023 06:40:47 -0700")
References: <20230808134049.1407498-1-leitao@debian.org>
        <20230808134049.1407498-8-leitao@debian.org>
Date:   Wed, 09 Aug 2023 12:46:27 -0400
Message-ID: <87wmy46u58.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

Breno Leitao <leitao@debian.org> writes:

> Add BPF hooks support for getsockopts io_uring command. So, bpf cgroups
> programs can run when SOCKET_URING_OP_GETSOCKOPT command is called.
>
> This implementation follows a similar approach to what
> __sys_getsockopt() does, but, using USER_SOCKPTR() for optval instead of
> kernel pointer.
>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  io_uring/uring_cmd.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
> index dbba005a7290..3693e5779229 100644
> --- a/io_uring/uring_cmd.c
> +++ b/io_uring/uring_cmd.c
> @@ -5,6 +5,8 @@
>  #include <linux/io_uring.h>
>  #include <linux/security.h>
>  #include <linux/nospec.h>
> +#include <linux/compat.h>
> +#include <linux/bpf-cgroup.h>
>  
>  #include <uapi/linux/io_uring.h>
>  #include <uapi/asm-generic/ioctls.h>
> @@ -179,17 +181,23 @@ static inline int io_uring_cmd_getsockopt(struct socket *sock,
>  	if (err)
>  		return err;
>  
> -	if (level == SOL_SOCKET) {
> +	err = -EOPNOTSUPP;
> +	if (level == SOL_SOCKET)
>  		err = sk_getsockopt(sock->sk, level, optname,
>  				    USER_SOCKPTR(optval),
>  				    KERNEL_SOCKPTR(&optlen));
> -		if (err)
> -			return err;
>  
> +	if (!in_compat_syscall())
> +		err = BPF_CGROUP_RUN_PROG_GETSOCKOPT(sock->sk, level,
> +						     optname,
> +						     USER_SOCKPTR(optval),
> +						     KERNEL_SOCKPTR(&optlen),
> +						     optlen, err);

I'm not sure if it makes sense to use in_compat_syscall() here.  Can't
this be invoked in a ring with ctx->compat set, but from outside a
compat syscall context (i.e. from sqpoll or even a !compat
io_uring_enter syscall)? I suspect you might need to check ctx->compact
instead, but I'm not sure. Did you consider that?

> +
> +	if (!err)
>  		return optlen;
> -	}
>  
> -	return -EOPNOTSUPP;
> +	return err;
>  }
>  
>  static inline int io_uring_cmd_setsockopt(struct socket *sock,

-- 
Gabriel Krisman Bertazi
