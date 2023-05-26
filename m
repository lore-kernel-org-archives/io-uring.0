Return-Path: <io-uring-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E9EC77B7C
	for <io-uring@archiver.kernel.org>; Fri, 26 May 2023 22:24:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244348AbjEZWYF (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Fri, 26 May 2023 18:24:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244180AbjEZWYE (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Fri, 26 May 2023 18:24:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09920E4E
        for <io-uring@vger.kernel.org>; Fri, 26 May 2023 15:23:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E10946151B
        for <io-uring@vger.kernel.org>; Fri, 26 May 2023 22:23:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51C30C433D2;
        Fri, 26 May 2023 22:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685139810;
        bh=vMx/FrFRHN+mkJoUCLtHSApBdwkZq4bBRypNWQKNzsc=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=mPutKSdL7k+5vlofVgqzPj0GLHa4rC+qY4mrlzcNNE+oJCJE5CB+r3FV4ZciEe62U
         taCDAB8VICM00zwPDbCl3avTswISUFbVHu624RVF7qZL4cX367w1XejKiSDzI4xhGb
         jOOF6rRp3U8tyW9byVGOAGynZltVu0ph7PSottctXbNceWT/1vXwYxpMU6U0FqFeet
         c5XrU9wHfqrgESr12d+7e+hvRZe/xqrs2Yu3TSaEaSCK1TP4B7obAlr8TM23OTQfig
         hsKn/LVs4XJc3qFI26d+quYBCEgOlawBYjo3KbUp/JmcKacO0fIQGTNDRtRxEf4KVN
         3D3CZT8S34gBQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3E376C4166F;
        Fri, 26 May 2023 22:23:30 +0000 (UTC)
Subject: Re: [GIT PULL] io_uring fix for 6.4-rc4
From:   pr-tracker-bot@kernel.org
In-Reply-To: <ffbf62dc-4f6b-aad6-28d5-52443f55ac81@kernel.dk>
References: <ffbf62dc-4f6b-aad6-28d5-52443f55ac81@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <ffbf62dc-4f6b-aad6-28d5-52443f55ac81@kernel.dk>
X-PR-Tracked-Remote: git://git.kernel.dk/linux.git tags/io_uring-6.4-2023-05-26
X-PR-Tracked-Commit-Id: 533ab73f5b5c95dcb4152b52d5482abcc824c690
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6fae9129b1c70bd6b7677b808c03bc96e83460fc
Message-Id: <168513981025.10240.6228143353464513949.pr-tracker-bot@kernel.org>
Date:   Fri, 26 May 2023 22:23:30 +0000
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        io-uring <io-uring@vger.kernel.org>
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

The pull request you sent on Fri, 26 May 2023 11:12:20 -0600:

> git://git.kernel.dk/linux.git tags/io_uring-6.4-2023-05-26

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6fae9129b1c70bd6b7677b808c03bc96e83460fc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
