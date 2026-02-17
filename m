Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD38A372B21
	for <io-uring@vger.kernel.org>; Tue, 17 Feb 2026 17:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771350926; cv=none; b=cCPsg5twJJagTbUGa9SYXv2cS1HDDghcPmk7O+PwqSJ+7XmW/SIE4KWzNqS3rl1lnyF4Wgq87D+2HlFPzVQGkV8M9/QXzEULXrsKd5giyU4bSOQkFIRsrPyoOJQZeu+qZtuZd0qSVLaAPN0fsDKEQWhfLbSnQ+lfq4GTSo2Iju4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771350926; c=relaxed/simple;
	bh=5y+mFtYG1mCgsp3nLDEd4gL3YUvfW7oCFg5P1c9nTK8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=lRfMo/KveJ7dBwpyFnYHGYFmMDImSuxkIOIbT+LQ29fNlc7P4BnQVAXD3q2hpxxrFK3E9+BpdGrsCoW6fzyrPLaWD95nCvhVwcojEmmoSbLQu43iXvBzEr2bBBQCPPawz089zLMW/HiiCLfvcZNovPZy/pwpdrbgTc/niku6JBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OjcV1ig4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OjcV1ig4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F527C4CEF7;
	Tue, 17 Feb 2026 17:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771350926;
	bh=5y+mFtYG1mCgsp3nLDEd4gL3YUvfW7oCFg5P1c9nTK8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=OjcV1ig4lAz38z8jC6NZGNyVOFa9ftKGHUdhEAQn027NH4qWHWYEW33cXaQss+ll9
	 W57shmLtpHE72b06QfeY34B/YX25yPG3Zu3TDFuFhyxeK+4P9yRFsQLkd59NlyD5/l
	 zAgch5PzSEeK8V3wvnoPkp9U5ga0IgmWYNf9/VYjecXhndMOWtKjl0Gcaw7HTa94Gd
	 pQnJuxG92hQNfvzcioEjFBWis7ZcNl/zZStbOaOO5FgUKF7JDeS4JdtOK3k9WWga1p
	 TK7eLoasJ4oJtrLt1Jch39bXdqYOW4xYNuqureUK4jRniKiz+sk6z7+JjvGucxQl7W
	 RK8jZ6fq/CdFw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 85079380AAF2;
	Tue, 17 Feb 2026 17:55:19 +0000 (UTC)
Subject: Re: [GIT PULL] Final io_uring fixes and changes for 7.0-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <73fba1d9-05bb-4f4c-9de0-514688c10947@kernel.dk>
References: <73fba1d9-05bb-4f4c-9de0-514688c10947@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <73fba1d9-05bb-4f4c-9de0-514688c10947@kernel.dk>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.0-20260216
X-PR-Tracked-Commit-Id: be3573124e630736d2d39650b12f5ef220b47ac1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7b751b01ade7f666de2f5c365bd9562c2dcd7d60
Message-Id: <177135091811.577366.2815981357197283316.pr-tracker-bot@kernel.org>
Date: Tue, 17 Feb 2026 17:55:18 +0000
To: Jens Axboe <axboe@kernel.dk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, io-uring <io-uring@vger.kernel.org>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 16 Feb 2026 20:46:45 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.0-20260216

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7b751b01ade7f666de2f5c365bd9562c2dcd7d60

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
