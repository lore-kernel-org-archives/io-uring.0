Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F4E33D4F8
	for <io-uring@vger.kernel.org>; Sat, 25 Jul 2026 03:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784949159; cv=none; b=P2gJa50nnWE14aN8+QV0Q81L8dhqF/vhWpwbtUxrRXPTPcULNkpSMV/JHjE0wuS5AJomMIOEg98Pjtmc+Ky/eAuimEuryjsyQScEVdCXc/dNGldxqvgh8M4+Q/+mQTWD55T9Wv7clW3llSvQYK3h5XItUanmRH8WzpGHpOi4PpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784949159; c=relaxed/simple;
	bh=yhd3FeLi7I6zWHthciPQ1F/A8Pxw4/T4c05s3UnqTLQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=lPxfgCTroDJVzOrVn6KfryVqWkhuxFmzs5jbZpJR+NcqLzD4iKP58PD5XDnfxV11jqdzkxHCA5emEyAkGCJjxclqs6LkZwhM9Vio7cAs2il2SLQv+jabxC3A5FYDD8kUdGfWFuxASnQvF16OUwnZXGQNrKNcQOhapZuNPIjpBv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YrPI8rkI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YrPI8rkI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB5D21F00A3A;
	Sat, 25 Jul 2026 03:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784949151;
	bh=nMFdZPNAyvyaf2Ya2aSnLVLivCIriCSbspNMzLyV5uE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=YrPI8rkIgG3neDgPhMDDTXxbcWYAXLKHd6Pj0UGQIZuaFfczFMKsSsDd8LOSdkZHG
	 cBzXz7BBh5Equ6VivPEGY9rGUIloedCeJjm6id4Os/fQxzxxaWvAKRozMcEer/+JdH
	 Hu+oZjO1ThNmgSRoZOasXhGKBm+boDnvlr438JR0W8AWYXqTW7ahj2L6Tlfu7vmAhX
	 Lpa8e+Ht0YPcCcy7rMXWET7jXI+IxDnEN9OsLc1oXWAx31Nzwx9dYxprVvAqOf5Cr3
	 cI8kRYI9FRa7ZsnVlLqUoAH6uGpa0rFYG6doBV9AZhDPqwh69NENZBkugRTSUJOm1R
	 k3uC67/yHNpvw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1979238111D8;
	Sat, 25 Jul 2026 03:12:00 +0000 (UTC)
Subject: Re: [GIT PULL] io_uring fixes for 7.2-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <55fe18a5-1bae-4836-a4de-f7a496165b5e@kernel.dk>
References: <55fe18a5-1bae-4836-a4de-f7a496165b5e@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <55fe18a5-1bae-4836-a4de-f7a496165b5e@kernel.dk>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.2-20260724
X-PR-Tracked-Commit-Id: e366c15e1610ef11d0717ecd875ae63050282676
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 73387b89d99f7b588870c5a98eb6a89689c65a1a
Message-Id: <178494911865.3393598.3835199629610981313.pr-tracker-bot@kernel.org>
Date: Sat, 25 Jul 2026 03:11:58 +0000
To: Jens Axboe <axboe@kernel.dk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, io-uring <io-uring@vger.kernel.org>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 24 Jul 2026 19:32:39 -0600:

> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.2-20260724

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/73387b89d99f7b588870c5a98eb6a89689c65a1a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
