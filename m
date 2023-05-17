Return-Path: <io-uring-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F82C7EE23
	for <io-uring@archiver.kernel.org>; Wed, 17 May 2023 07:40:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbjEQHkY (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Wed, 17 May 2023 03:40:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbjEQHkY (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Wed, 17 May 2023 03:40:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3648D1AE
        for <io-uring@vger.kernel.org>; Wed, 17 May 2023 00:40:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C77B763B2C
        for <io-uring@vger.kernel.org>; Wed, 17 May 2023 07:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25FB8C433EF;
        Wed, 17 May 2023 07:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684309221;
        bh=kLgxuOOcCEI5j5EQWHueusVoA/cwxJg5TQiD+cN64os=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=lVNXE1rCLRdqLkPv+TErhkDOVNPps28DF2XD2Kbn4SZFTqu5/z1eLhlseGVom3ARQ
         nOWWN7q1NB0JB/xu5iPRe5bBecxOihJalDqlN9KEoZl1C/8TfeEEOfej4tKe75Ewvj
         q9Jg/NHeMn5unfYEoVUyxn7O4n0gQDT8dY6khmf5gN4M4ZxzquJfBEMGk92YBIXJIf
         ytf48SfBaiMqp+5bGP5Ct6tZw1ONHzFnLi0RoA9i8AMIAFN53MVgIgJJOu2Mnia2v2
         zbok/6uD3jEICusSFIJxMsLqVvM/eD8XJOkn0tr6CL+3AJHZ/SHwXe8TlZ9dzvEOGT
         5EeqRU0dv9fQw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F2DC2E21EEC;
        Wed, 17 May 2023 07:40:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/2] minor tcp io_uring zc optimisations
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <168430922098.967.17125641782139822162.git-patchwork-notify@kernel.org>
Date:   Wed, 17 May 2023 07:40:20 +0000
References: <cover.1684166247.git.asml.silence@gmail.com>
In-Reply-To: <cover.1684166247.git.asml.silence@gmail.com>
To:     Pavel Begunkov <asml.silence@gmail.com>
Cc:     io-uring@vger.kernel.org, netdev@vger.kernel.org,
        edumazet@google.com, davem@davemloft.net, dsahern@kernel.org,
        kuba@kernel.org, pabeni@redhat.com
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Mon, 15 May 2023 17:06:35 +0100 you wrote:
> Patch 1 is a simple cleanup, patch 2 gives removes 2 atomics from the
> io_uring zc TCP submission path, which yielded extra 0.5% for my
> throughput CPU bound tests based on liburing/examples/send-zerocopy.c
> 
> Pavel Begunkov (2):
>   net/tcp: don't peek at tail for io_uring zc
>   net/tcp: optimise io_uring zc ubuf refcounting
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] net/tcp: don't peek at tail for io_uring zc
    https://git.kernel.org/netdev/net-next/c/eea96a3e2c90
  - [net-next,2/2] net/tcp: optimise io_uring zc ubuf refcounting
    https://git.kernel.org/netdev/net-next/c/a7533584728d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


