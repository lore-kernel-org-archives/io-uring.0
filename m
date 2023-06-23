Return-Path: <io-uring-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6042EB64D7
	for <io-uring@archiver.kernel.org>; Fri, 23 Jun 2023 06:39:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230109AbjFWGjH (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Fri, 23 Jun 2023 02:39:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbjFWGjG (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Fri, 23 Jun 2023 02:39:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BD1919AB;
        Thu, 22 Jun 2023 23:39:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B4D30617E8;
        Fri, 23 Jun 2023 06:39:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98172C433C0;
        Fri, 23 Jun 2023 06:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1687502345;
        bh=iFBluZgbfn+sdQvZyC2wQEmmUJLtS9xT48/IO3SiJqE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ayRLooXwXW5LNUgFHZ2K51VbAoLQcGHUS+/Ce179Z37xQgxhXxLXimzO5+wKqj2Ze
         gyoMICh1ojlhEqxFrWPFIdfckbNFVLcLHJnaj2xzxMVvTTYb6JkCF71VBCu8YkvQbZ
         DXF9Ve37afETElX8dvHDIhXkYE68xTHV2qv8sVfs=
Date:   Fri, 23 Jun 2023 08:39:02 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Breno Leitao <leitao@debian.org>
Cc:     Jens Axboe <axboe@kernel.dk>,
        Pavel Begunkov <asml.silence@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        "open list:IO_URING" <io-uring@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>
Subject: Re: [PATCH v3] io_uring: Add io_uring command support for sockets
Message-ID: <2023062351-tastiness-half-034f@gregkh>
References: <20230622215915.2565207-1-leitao@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622215915.2565207-1-leitao@debian.org>
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

On Thu, Jun 22, 2023 at 02:59:14PM -0700, Breno Leitao wrote:
> --- a/io_uring/uring_cmd.c
> +++ b/io_uring/uring_cmd.c
> @@ -7,6 +7,7 @@
>  #include <linux/nospec.h>
>  
>  #include <uapi/linux/io_uring.h>
> +#include <uapi/asm-generic/ioctls.h>

Is this still needed?

thanks,

greg k-h
