Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 954B4C4332F
	for <io-uring@archiver.kernel.org>; Fri, 14 Oct 2022 05:08:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbiJNFIB (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Fri, 14 Oct 2022 01:08:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbiJNFIA (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Fri, 14 Oct 2022 01:08:00 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 721451946CB
        for <io-uring@vger.kernel.org>; Thu, 13 Oct 2022 22:07:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1DF6DB821B2
        for <io-uring@vger.kernel.org>; Fri, 14 Oct 2022 05:07:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CAF83C433D7;
        Fri, 14 Oct 2022 05:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665724076;
        bh=pJDSU4mKbMQwNe49tg3Z/D3rAJvVb3gre2zsQDXUYvo=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=U6FR0JG1YIJsRPUNBr49grsD2/q1tLJwhqvapfU8YGlmekhj2o43HkOv+fn7/sElL
         b1dDBYoGBiNO8T6J9TYBfgkb9+IAm1RV653GedMV5rdn6fT9nkT+wUMzcYamUyhaWT
         c6whAfQlVMgZIFyg23QLLylsrWTRroANw47LVY1zcOGPOVZi/sYdOdfnrhZthH2ONf
         jeq/1+Ovcz4AblUbj+Hqz33YHIJ65DrgGjyhU5b9tonbyhTKOja2lzR4ipmkAHk0xT
         ZbhPeevl/LspHYOnQSCotpazDnMfJr7hUDYm+WcnMxaSi9gVrKh3700wAU+WEkJcoN
         wVlyK66RqzlpQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B8F4DE4D00B;
        Fri, 14 Oct 2022 05:07:56 +0000 (UTC)
Subject: Re: [GIT PULL] Followup io_uring fixes for 6.1-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <b0098418-170a-c7e1-1292-74cfce8aef27@kernel.dk>
References: <b0098418-170a-c7e1-1292-74cfce8aef27@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <b0098418-170a-c7e1-1292-74cfce8aef27@kernel.dk>
X-PR-Tracked-Remote: git://git.kernel.dk/linux.git tags/io_uring-6.1-2022-10-13
X-PR-Tracked-Commit-Id: 2ec33a6c3cca9fe2465e82050c81f5ffdc508b36
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c98c70ed43cc35b6d5ca9713e037bfe2debc251c
Message-Id: <166572407675.12880.2102840264727046239.pr-tracker-bot@kernel.org>
Date:   Fri, 14 Oct 2022 05:07:56 +0000
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        io-uring <io-uring@vger.kernel.org>
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

The pull request you sent on Thu, 13 Oct 2022 13:27:43 -0600:

> git://git.kernel.dk/linux.git tags/io_uring-6.1-2022-10-13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c98c70ed43cc35b6d5ca9713e037bfe2debc251c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
