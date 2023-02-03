Return-Path: <io-uring-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E306C61DA4
	for <io-uring@archiver.kernel.org>; Fri,  3 Feb 2023 20:19:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233367AbjBCUTt (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Fri, 3 Feb 2023 15:19:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233343AbjBCUTq (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Fri, 3 Feb 2023 15:19:46 -0500
Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C385A9D4D
        for <io-uring@vger.kernel.org>; Fri,  3 Feb 2023 12:19:45 -0800 (PST)
Received: from biznet-home.integral.gnuweeb.org (unknown [182.253.183.234])
        by gnuweeb.org (Postfix) with ESMTPSA id 1962C82FE2;
        Fri,  3 Feb 2023 20:19:42 +0000 (UTC)
X-GW-Data: lPqxHiMPbJw1wb7CM9QUryAGzr0yq5atzVDdxTR0iA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
        s=default; t=1675455584;
        bh=oRmSWTfy8ZbziIoKmamTUqeAbawMCODXr/KJZo0EQck=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TA7w/qQlPprHbpvQ0dz3tW0uJAOm6q/pGn2Hs6IgkXriHtSLxMoVkaOf12UFh/Cva
         69MvV6BjeP9G9bOUVvC6SVY+/C1Y/7ygjIyx73SUNl17jiBW/m1AT/DsKPzpq2C8EH
         2IPvH2ovDb07nUPd1w/f3Eg3icYE183ha1u+YZ+YoY6sYtCwT46++cGhX5/67hN+4A
         s2/VNKp2aUuMQx7dZp/hMEXDopfi1nII5tX1PPV4OZZce2UyA6GHIzOlRjN/M1g2mA
         PfSPmR/ijugf/JU9FZeiwaY5WX9P8ZqkyXJGADw+ieo6N3ra9fAu9VnOW/wOjGOiuy
         VIlac5ML1YmRA==
Date:   Sat, 4 Feb 2023 03:19:39 +0700
From:   Ammar Faizi <ammarfaizi2@gnuweeb.org>
To:     Stefan Roesch <shr@devkernel.io>,
        Facebook Kernel Team <kernel-team@fb.com>,
        io-uring Mailing List <io-uring@vger.kernel.org>
Cc:     Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH v6 1/4] liburing: add api to set napi busy poll settings
Message-ID: <Y91sW7ZQTg9Wytg4@biznet-home.integral.gnuweeb.org>
References: <20230203190310.2900766-1-shr@devkernel.io>
 <20230203190310.2900766-2-shr@devkernel.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230203190310.2900766-2-shr@devkernel.io>
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

On Fri, Feb 03, 2023 at 11:03:07AM -0800, Stefan Roesch wrote:
> This adds two functions to manage the napi busy poll settings:
> - io_uring_register_napi
> - io_uring_unregister_napi
> 
> Signed-off-by: Stefan Roesch <shr@devkernel.io>
> ---
>  src/include/liburing.h          |  3 +++
>  src/include/liburing/io_uring.h | 12 ++++++++++++
>  src/liburing.map                |  3 +++
>  src/register.c                  | 12 ++++++++++++
>  4 files changed, 30 insertions(+)

We have a new rule. Since commit:

  9e2890d35e9677d8cfc7ac66cdb2d97c48a0b5a2 ("build: add liburing-ffi")

Adding a new exported function should also be reflected in
liburing-ffi.map.

-- 
Ammar Faizi

