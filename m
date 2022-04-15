Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C08CC433EF
	for <io-uring@archiver.kernel.org>; Fri, 15 Apr 2022 18:47:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347584AbiDOStd (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Fri, 15 Apr 2022 14:49:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347626AbiDOSt3 (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Fri, 15 Apr 2022 14:49:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23CFF9AE64
        for <io-uring@vger.kernel.org>; Fri, 15 Apr 2022 11:46:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 04DB860B99
        for <io-uring@vger.kernel.org>; Fri, 15 Apr 2022 18:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 697B0C385A5;
        Fri, 15 Apr 2022 18:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650048418;
        bh=nPz/nEOvVSU2cyaDW37FPwCw5NSTuh4UeZlkNpOfsLo=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=FUR0N2qKz5VxO2+iCH5fnP3VOkidOO4ESPmUsKNPLyDAhMW53pkMYFC1w30Kghk8q
         +WGHppHBqW+8utxYmGy68rKeijLTLFzP4EuE7OEJpP+6QkXoevy5v8pmcxprHQH95D
         nPwBwBuwfg0GYC9g2bSyvH8nLPyecDBRfZSBEY9HygeTA/1q4nUW0HE4rXK+7CSaa8
         pO7eedtS94vR/LFviqRAKkhYxQlwdl2hgm6JDsAwKBKNwMjxVjoaItMq2SPnb56STj
         z8L+nJn4z+nGNapX2YYMsHmew3JMKe3RdLFjqrLUfKWWjNMQOp5em7zbU5l/t1Z/n+
         BhnEG5OMmmH6Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 53623E7399D;
        Fri, 15 Apr 2022 18:46:58 +0000 (UTC)
Subject: Re: [GIT PULL] io_uring fixes for 5.18-rc3
From:   pr-tracker-bot@kernel.org
In-Reply-To: <948f7d10-526e-206b-6014-2654b5170d56@kernel.dk>
References: <948f7d10-526e-206b-6014-2654b5170d56@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <948f7d10-526e-206b-6014-2654b5170d56@kernel.dk>
X-PR-Tracked-Remote: git://git.kernel.dk/linux-block.git tags/io_uring-5.18-2022-04-14
X-PR-Tracked-Commit-Id: 701521403cfb228536b3947035c8a6eca40d8e58
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0647b9cc7feac30eb6c397ccb746aaa91e21e0de
Message-Id: <165004841833.6717.17137855765936156092.pr-tracker-bot@kernel.org>
Date:   Fri, 15 Apr 2022 18:46:58 +0000
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        io-uring <io-uring@vger.kernel.org>
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

The pull request you sent on Fri, 15 Apr 2022 07:24:41 -0600:

> git://git.kernel.dk/linux-block.git tags/io_uring-5.18-2022-04-14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0647b9cc7feac30eb6c397ccb746aaa91e21e0de

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
