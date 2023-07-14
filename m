Return-Path: <io-uring-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E6DEB64DC
	for <io-uring@archiver.kernel.org>; Fri, 14 Jul 2023 15:32:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236361AbjGNPc0 (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Fri, 14 Jul 2023 11:32:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236372AbjGNPcY (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Fri, 14 Jul 2023 11:32:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C34F2D68;
        Fri, 14 Jul 2023 08:32:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BE44B61D27;
        Fri, 14 Jul 2023 15:32:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28098C433C8;
        Fri, 14 Jul 2023 15:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689348739;
        bh=/JpD1lpXF+MJn+oRxWFHX3NKrdTgLNG55ZY6x8Dgfa8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BU+cMt3aFMv2DYMoU8EI99NC/uGinRVKy0UcITXiPYaWScXbboqhuHC2d29VGMj6a
         uLKUKScHh+yXBfMsjmDH7TTp9O9WnR7+HKC3qx2r4FTN51poZxs0vK+rPSNY3kliKh
         QGaRJ4nFSNn81MeQnxubUeoS4eWgM8KqQ6Lm4PA4ppRvNGqlnL2tZtqR6ZeZdpOW5M
         QoGV9qAV/VpW1GVNPXFbnaRRPwLNVfKvuiXsk2PmhtYRrU08zpelRu5C3Jq+iyMRxX
         1jQdxDX7N5aVb0QzqFiKoeqoMvw6rBl1PAu2N3jsXPSQ6miQE4HHrb1dh0SQuRpufF
         +s9xxV/VqJYiQ==
Date:   Fri, 14 Jul 2023 17:32:15 +0200
From:   Christian Brauner <brauner@kernel.org>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
        arnd@arndb.de
Subject: Re: [PATCH 2/5] exit: move core of do_wait() into helper
Message-ID: <20230714-anreden-zeitmanagement-c3947dfddbe5@brauner>
References: <20230711204352.214086-1-axboe@kernel.dk>
 <20230711204352.214086-3-axboe@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230711204352.214086-3-axboe@kernel.dk>
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

On Tue, Jul 11, 2023 at 02:43:49PM -0600, Jens Axboe wrote:
> Rather than have a maze of gotos, put the actual logic in __do_wait()
> and have do_wait() loop deal with waitqueue setup/teardown and whether
> to call __do_wait() again.
> 
> No functional changes intended in this patch.
> 
> Signed-off-by: Jens Axboe <axboe@kernel.dk>
> ---

Honestly just makes the code easier to read in general,
Acked-by: Christian Brauner <brauner@kernel.org>
