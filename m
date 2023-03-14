Return-Path: <io-uring-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 646A6C6FD1C
	for <io-uring@archiver.kernel.org>; Tue, 14 Mar 2023 09:26:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbjCNJ0r (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Tue, 14 Mar 2023 05:26:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbjCNJ0p (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Tue, 14 Mar 2023 05:26:45 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07BF899C19;
        Tue, 14 Mar 2023 02:26:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A9667B818A1;
        Tue, 14 Mar 2023 09:26:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51817C433D2;
        Tue, 14 Mar 2023 09:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678786000;
        bh=iVZmjL7ey/cMtd+pgv3anqesXFIcH7V4Js9qbbkJ2ME=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aFcVyC0nL/pn46ICP81QVn+w8Yj9dbkIEpvuDz/9jqnKJIolLVyFT3ccTzU6MfDzV
         mpMbJ5Ys1c5EzUburkMyyD1SGqaloyfNrrWEDw3Mk62saRoxSrCQU5+RXXUkM5Ofob
         p/CkZVYJipOxTrD36znYh/9NI1mF876Siw+rNyNvt0I1MRyiL6lBvXZU49W7ePtRgL
         EJsg/X5UrmGP3e3VMiUvqb1nq1JjVsrnqXBJIWf6gEDxWQZ4fFLrFqpoJsOcUDg/K5
         9i1qfjRE/BIuDF+qHnSvl+OcAUTsYR4jD/PSHrf9weWPgg6RU2eUtNhH+Q7DK2mzNE
         4xe4aKZ03Qknw==
Date:   Tue, 14 Mar 2023 10:26:36 +0100
From:   Christian Brauner <brauner@kernel.org>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 3/3] pipe: set FMODE_NOWAIT on pipes
Message-ID: <20230314092636.irqm2gaua6mmqxze@wittgenstein>
References: <20230308031033.155717-1-axboe@kernel.dk>
 <20230308031033.155717-4-axboe@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230308031033.155717-4-axboe@kernel.dk>
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

On Tue, Mar 07, 2023 at 08:10:33PM -0700, Jens Axboe wrote:
> The read/write path is now prepared to deal with IOCB_NOWAIT, hence
> enable support for that via setting FMODE_NOWAIT on new pipes.
> 
> Signed-off-by: Jens Axboe <axboe@kernel.dk>
> ---

Looks good,
Reviewed-by: Christian Brauner <brauner@kernel.org>
