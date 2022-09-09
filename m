Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B7D1ECAAD3
	for <io-uring@archiver.kernel.org>; Fri,  9 Sep 2022 19:13:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbiIITNz (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Fri, 9 Sep 2022 15:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbiIITNy (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Fri, 9 Sep 2022 15:13:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A959868AA
        for <io-uring@vger.kernel.org>; Fri,  9 Sep 2022 12:13:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9D057620C2
        for <io-uring@vger.kernel.org>; Fri,  9 Sep 2022 19:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0EA47C433B5;
        Fri,  9 Sep 2022 19:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662750832;
        bh=wE/xHlw+OXAUwhZINak53MIk6hIyxr9jCJOK09HOpNY=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=lFEf4T+uBP4r239+DxpSCEBOPq0ZCyK2VNz7BlfI6GNFHroOUa2w7gdTightHJk2Q
         36g7knE2lApJA8XOSZsNw/KdMt7aq2Z+kB4ajItkrdpOLzYZv6Uq9vn8n76nd2fwC3
         MY7L2v2l0IRZntHv1XY4bVL+j/1xurAgXHIPc5CkAvrXlO5YkQs73PYDQIQi6EXfig
         NfyqEl2iu8oEhYNhCUHYaHaKh7ylltkH4Azre85OqNMR08Hq8H4BwLqXvnX9Naooy3
         jCU5HgT65WL5hcVknvcDd6euLMRvlgf9BMO+dR4aXsDx7Ca6X1HTcltpT3lIkb0AKo
         4VJcO9PHr3rMA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EED0BC4166E;
        Fri,  9 Sep 2022 19:13:51 +0000 (UTC)
Subject: Re: [GIT PULL] io_uring fixes for 6.0-rc5
From:   pr-tracker-bot@kernel.org
In-Reply-To: <9f7bc0ca-70c5-b4c1-5f70-f64de412e496@kernel.dk>
References: <9f7bc0ca-70c5-b4c1-5f70-f64de412e496@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <9f7bc0ca-70c5-b4c1-5f70-f64de412e496@kernel.dk>
X-PR-Tracked-Remote: git://git.kernel.dk/linux-block.git tags/io_uring-6.0-2022-09-09
X-PR-Tracked-Commit-Id: 4d9cb92ca41dd8e905a4569ceba4716c2f39c75a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d2b768c3d44af4ea19c0f52e718acca01ebb22e8
Message-Id: <166275083197.6812.1751430707147594492.pr-tracker-bot@kernel.org>
Date:   Fri, 09 Sep 2022 19:13:51 +0000
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        io-uring <io-uring@vger.kernel.org>
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

The pull request you sent on Fri, 9 Sep 2022 11:24:19 -0600:

> git://git.kernel.dk/linux-block.git tags/io_uring-6.0-2022-09-09

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d2b768c3d44af4ea19c0f52e718acca01ebb22e8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
