Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186AE2DC339
	for <io-uring@vger.kernel.org>; Tue, 10 Feb 2026 02:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691406; cv=none; b=gORBH0vGAnAu6/Zz2YBfExKpNFumKpgMDb6F2FA5fpZoI8xQvjInfwahnaKxK9+Z+4DIT5J8TRpOn4wW4Im7VoBunVGIrQMBL+hnh1/pEgWM9cPot5FCc2CVN/sfQU33wcpu8mS9oO5U/lkmbQNJkLPHRapdOi4zFViQExrq3A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691406; c=relaxed/simple;
	bh=g5+bB3jtZDA5QuV9Am92xtu6rmYpLDQOct2V3l8kS+s=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Uk1WJA1Ly7liZekt3iYHNFO1nMqPnMOAsPz3F08hl1YBBiLznIG31ijskA2pE93bll4mq7ES0YhJ3dVgbHIJvwV+gfI9RbTZ+IAmYkIBdz75Ic3muBxezreOYs0/SvyciFO8QtHEejQBNb7LrhYS+mSKmkyJFfRKtk0R/E4FiGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tuGrPmo3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tuGrPmo3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AECDBC16AAE;
	Tue, 10 Feb 2026 02:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770691405;
	bh=g5+bB3jtZDA5QuV9Am92xtu6rmYpLDQOct2V3l8kS+s=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=tuGrPmo3MfgUEeXyKmnYxQeMenT0xfxAKUc2ecvzq62ilGYVP7Pg4MwtT+7nOrMYH
	 jNrpsvnxDHpyjYF84CiRVZWvsY0Hakk7a8tNsSUvxaX+QKp7sma0MvV+5VlwnY1SZW
	 tRKPtIRQW+fvEP1fnpnx2reqkDFw9wUJaouH2r04B1wdMTnockbwa3r9g/3gbZtCuG
	 ltchQQLZRD5k9yMJzDDqx7CfAFVVZ//XAqe8DExAhcy7serUFXoIkOtShZ6n/ku6Yx
	 nQaZ1MZQ8v1ibJr3TIxaNecHIvlMckXM0GfV5qYpsvMkYhOPWqPRLcElKgZfcBkabL
	 knrTqCZractqw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 85136380AA4F;
	Tue, 10 Feb 2026 02:43:22 +0000 (UTC)
Subject: Re: [GIT PULL] Core io_uring changes for 7.0-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <8b44ed7f-267f-433d-a3d3-262feb13d657@kernel.dk>
References: <8b44ed7f-267f-433d-a3d3-262feb13d657@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <8b44ed7f-267f-433d-a3d3-262feb13d657@kernel.dk>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/for-7.0/io_uring-20260206
X-PR-Tracked-Commit-Id: 442ae406603a94f1a263654494f425302ceb0445
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f5d4feed174ce9fb3c42886a3c36038fd5a43e25
Message-Id: <177069140114.3309876.17041229285836544567.pr-tracker-bot@kernel.org>
Date: Tue, 10 Feb 2026 02:43:21 +0000
To: Jens Axboe <axboe@kernel.dk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, io-uring <io-uring@vger.kernel.org>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 6 Feb 2026 11:57:59 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/for-7.0/io_uring-20260206

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f5d4feed174ce9fb3c42886a3c36038fd5a43e25

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
