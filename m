Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 531CFC32771
	for <io-uring@archiver.kernel.org>; Sun, 18 Sep 2022 16:53:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbiIRQxn (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Sun, 18 Sep 2022 12:53:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbiIRQxm (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Sun, 18 Sep 2022 12:53:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41F2717AB8
        for <io-uring@vger.kernel.org>; Sun, 18 Sep 2022 09:53:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BC736614AE
        for <io-uring@vger.kernel.org>; Sun, 18 Sep 2022 16:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23B26C433D6;
        Sun, 18 Sep 2022 16:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663520020;
        bh=B7xpv5A9WNZ/djghTD6ypmofSdoqPG+O0zYJJPywEiA=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=luiiZ0owpllSdSy9YDsZJh+uBPZu/Migrd2tjuIvuvbQzpBDD8M6mHzJDiX8COLif
         Dv5foZeSp3DCPmtbFoUVrWiotCxGgySxeGpVirVU6utrDvCWHEjaR+co+X5UYvsBL4
         CaEsfweMqNasOFJARKdyuaB1vXQxye9WWbiUYOde9qgy8BLJJ7aFJzUC0Y9VT7TdiZ
         opkP0Uqr/KPdXIYlsBIrxc5mSUgDKcYsCb4koaC+DJGCfQ1TmcDOeD334VsBuPUAT1
         kKmqU0+abt5UhBb7zRsVBToTkj7vEvj1KnlGyQ8pQZ03dnO/iG47pB6dw8s+Qpaa7I
         KQ/DD9mKlTgGA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 11079C73FFD;
        Sun, 18 Sep 2022 16:53:40 +0000 (UTC)
Subject: Re: [GIT PULL] Follow up io_uring pull for 6.0-rc6
From:   pr-tracker-bot@kernel.org
In-Reply-To: <0640d13f-ad3f-f5ba-ebd7-3ea862836dc5@kernel.dk>
References: <0640d13f-ad3f-f5ba-ebd7-3ea862836dc5@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <0640d13f-ad3f-f5ba-ebd7-3ea862836dc5@kernel.dk>
X-PR-Tracked-Remote: git://git.kernel.dk/linux.git tags/io_uring-6.0-2022-09-18
X-PR-Tracked-Commit-Id: 9bd3f728223ebcfef8e9d087bdd142f0e388215d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 38eddeedbbeac33f26845c29e7414b9313ea70db
Message-Id: <166352002006.7361.13078167160911821356.pr-tracker-bot@kernel.org>
Date:   Sun, 18 Sep 2022 16:53:40 +0000
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        io-uring <io-uring@vger.kernel.org>
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

The pull request you sent on Sun, 18 Sep 2022 07:03:30 -0600:

> git://git.kernel.dk/linux.git tags/io_uring-6.0-2022-09-18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/38eddeedbbeac33f26845c29e7414b9313ea70db

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
