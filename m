Return-Path: <io-uring-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC013C61DA4
	for <io-uring@archiver.kernel.org>; Fri, 24 Feb 2023 15:42:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbjBXPmZ (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Fri, 24 Feb 2023 10:42:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjBXPmY (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Fri, 24 Feb 2023 10:42:24 -0500
Received: from eidolon.nox.tf (eidolon.nox.tf [IPv6:2a07:2ec0:2185::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C056E658C0;
        Fri, 24 Feb 2023 07:42:23 -0800 (PST)
Received: from equinox by eidolon.nox.tf with local (Exim 4.94.2)
        (envelope-from <equinox@diac24.net>)
        id 1pVaDF-00AoKL-7Z; Fri, 24 Feb 2023 16:42:21 +0100
Date:   Fri, 24 Feb 2023 16:42:21 +0100
From:   David Lamparter <equinox@diac24.net>
To:     David Lamparter <equinox@diac24.net>
Cc:     io-uring@vger.kernel.org, netdev@vger.kernel.org,
        Eric Dumazet <edumazet@google.com>,
        Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH] io_uring: remove MSG_NOSIGNAL from recvmsg
Message-ID: <Y/ja3Wi0tIyzXces@eidolon.nox.tf>
References: <CANn89iJE6SpB2bfXEc=73km6B2xtBSWHj==WsYFnH089WPKtSA@mail.gmail.com>
 <20230224150123.128346-1-equinox@diac24.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224150123.128346-1-equinox@diac24.net>
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

On Fri, Feb 24, 2023 at 04:01:24PM +0100, David Lamparter wrote:
> MSG_NOSIGNAL is not applicable for the receiving side, SIGPIPE is
> generated when trying to write to a "broken pipe".  AF_PACKET's
> packet_recvmsg() does enforce this, giving back EINVAL when MSG_NOSIGNAL
> is set - making it unuseable in io_uring's recvmsg.
> ---
> > Sure, or perhaps David wanted to take care of this.
> 
> Here you go.  But maybe give me a few hours to test/confirm...

Unsurprisingly, it works as expected.
