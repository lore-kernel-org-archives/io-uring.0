Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CD435A384
	for <io-uring@vger.kernel.org>; Tue, 16 Jun 2026 07:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781596464; cv=none; b=qiSjbaO/xLmdCYphoCcYLHs+iWQayAyjZBIxHCWBZb9u5jlLCcpsvnLUe+uV8FyxJcXdRBUg1VQIYUcXydAJRypA376WJXPGQM7MSUcLby24Eh8QQNh0ph71+zRaiA3Ob7QuIlppFzXOynHyU/8A9XBxEOHBrQhMcvDH7sAnZeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781596464; c=relaxed/simple;
	bh=OW5AFZzWV4WIwMqBfegEgmrdE3+iq/u3TakOuEOtTFw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=GvFTjF2+xxm0dW6oelN1Fvq9ICXO0r7NyL93wyrS54TO1TWTsbpLp5hXGm+SJW/+sh/tENgA92kDmsqd5el84JmrRrMtE0nb+Or7hQkecBO8/kyDKZDJxUc5ZSNkwdPzih0/yCmfBBvnC+0/qmtfwv+BzrpM4bFGMi/eE9HgOlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IT8R9C1n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IT8R9C1n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 568901F000E9;
	Tue, 16 Jun 2026 07:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781596463;
	bh=n4RzTwz3Ur65PuYso7PoXgBZe0KNbIllp1rNJhQ7ep0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=IT8R9C1nrnqIkwT5aCq/3Y1f870kYcJFmeEo6fbOPHWIJ3wR/x4Ck+wEJapwoWI/S
	 /9mKauykWUBJRfLJCMYodQpj4o3EY01NIxnPxjjhGi2DZvRRaGwPJM7BTUgtg9a/je
	 5mlPUrvgeTcx2X+WnJypkol7T1Fx/6/hZYpengBaCbQBmzCtpoIj0REzcSIVrL2tez
	 zUe39HhKRKMArilbiov/bPf0okTP+2n41kWsS3rvvyLWNLaKtcryOEvJi2Cr41AVxg
	 JsxVTCnJtja2YWuctT4le6gKNUkgrLlmxWVYUaX/Mr6xIrABzmrvWkvrbpt1i35D5K
	 FbsdLbDy+wQhw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56C46383BF68;
	Tue, 16 Jun 2026 07:54:19 +0000 (UTC)
Subject: Re: [GIT PULL] io_uring updates for 7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <8829b16a-4247-4e07-aa35-c3a185780731@kernel.dk>
References: <8829b16a-4247-4e07-aa35-c3a185780731@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <8829b16a-4247-4e07-aa35-c3a185780731@kernel.dk>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/for-7.2/io_uring-20260615
X-PR-Tracked-Commit-Id: d9b710f683dc68b5c0b7dd0c6c64aeb5d27a1ac4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9b40ba14edcdf70240af8114092a76f75f070774
Message-Id: <178159645787.515891.1010742501547887088.pr-tracker-bot@kernel.org>
Date: Tue, 16 Jun 2026 07:54:17 +0000
To: Jens Axboe <axboe@kernel.dk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, io-uring <io-uring@vger.kernel.org>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 15 Jun 2026 09:18:22 -0600:

> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/for-7.2/io_uring-20260615

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9b40ba14edcdf70240af8114092a76f75f070774

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
