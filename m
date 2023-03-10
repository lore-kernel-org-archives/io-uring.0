Return-Path: <io-uring-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84342C64EC4
	for <io-uring@archiver.kernel.org>; Fri, 10 Mar 2023 17:01:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231925AbjCJRBg (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Fri, 10 Mar 2023 12:01:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbjCJRBR (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Fri, 10 Mar 2023 12:01:17 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C1E013DC2
        for <io-uring@vger.kernel.org>; Fri, 10 Mar 2023 08:59:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6026261C3C
        for <io-uring@vger.kernel.org>; Fri, 10 Mar 2023 16:58:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5F30C433D2;
        Fri, 10 Mar 2023 16:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678467492;
        bh=mp1GNOjYSUNrkcsMpjsxzSs86ieX+UmA8t8R4XyFEAk=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=lcplu6lHjBYX5TGAb2J+Wb9WMp4xA+hlbDvtU+dGV0nD52LpWNUxV3CstsYJszU8p
         vz/hkXcW3ofzcNdGig5Bv0aeKZQomOgvCZHnYOjU38xCgNPks2QlyrHmoL5zXxwpxe
         YmimjuP0+Ag89RRgrOQmgga2XlWYcDldSolizl5zcDVUn0hdmZV3qpWyA/P40cpKsI
         heFlfdYDatNL1NT6snAVEW/omK08R6dMc/bS9NDz9f9YbYqWg6xG5boitY52cNYwq+
         1GtDcU6b75JmeVxNog9Ner/u4GIEh9UzNzNaly3302Wyf04wM3Pqd/rDXJEiJIHBql
         6xZMrzGjQdZwg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B45B1E61B66;
        Fri, 10 Mar 2023 16:58:12 +0000 (UTC)
Subject: Re: [GIT PULL] io_uring fixes for 6.3-rc2
From:   pr-tracker-bot@kernel.org
In-Reply-To: <7ec0e271-c49c-aea9-fc29-da52febfb913@kernel.dk>
References: <7ec0e271-c49c-aea9-fc29-da52febfb913@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <7ec0e271-c49c-aea9-fc29-da52febfb913@kernel.dk>
X-PR-Tracked-Remote: git://git.kernel.dk/linux.git tags/io_uring-6.3-2023-03-09
X-PR-Tracked-Commit-Id: fa780334a8c392d959ae05eb19f2410b3a1e6cb0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f331c5de7960d69fc767d2dc08f5f5859ce70061
Message-Id: <167846749273.19444.8232380535028147.pr-tracker-bot@kernel.org>
Date:   Fri, 10 Mar 2023 16:58:12 +0000
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        io-uring <io-uring@vger.kernel.org>
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

The pull request you sent on Thu, 9 Mar 2023 17:15:17 -0700:

> git://git.kernel.dk/linux.git tags/io_uring-6.3-2023-03-09

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f331c5de7960d69fc767d2dc08f5f5859ce70061

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
