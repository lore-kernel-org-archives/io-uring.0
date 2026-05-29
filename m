Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449AB3A7194
	for <io-uring@vger.kernel.org>; Fri, 29 May 2026 20:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780085629; cv=none; b=oaBPqkE3L6RQL5Loy8gS8EVC3AE/XqFzFyQvqW2RcCG4J9OMtC409yjbuqekNBzexky1kNmjYpS8puqt/ihB+BGGNz7yNqGG4ps7M0CyTQg/1Ihy62pchywV8cJ35P22oAR1N1yuCkmcyO4cFVPA3AaNhMkyEkqroZujmg3DopE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780085629; c=relaxed/simple;
	bh=WlB5Ez/mgF0oH+nZDSasmQdIOhTCVV02liq84ch3RkU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=UhJkFOLh72gKc73ycZhgmvOMEMqKz0OZW+co01poCdEMFDMj5f4VXlxT+W6aSLBNgzYUebimZc3bA/Uk0G8Ixe9fM/biJ6MPZOYpewz9UscA4/Rlc4XTgnUy0Um6Qzo/Qe0pa0YL40r8xPtr3tPr+EIYRzn7g8MvqXaEr2IGO4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QBzpfaCX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QBzpfaCX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C3221F00893;
	Fri, 29 May 2026 20:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780085628;
	bh=TZj/N3RZOnCUtl9JEo2oAhH8DH2uC8srnRE7HtWMX5A=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=QBzpfaCXk8RjWvOwf2vBr1v9rcoB3UH39zBzYEjXfOlkkYPdv0/WL/MhlDvM5LiJ9
	 lMtM9O9OjGepFmKVWyESjaA9agHzOsjhTBc8LBLKRWxWhlkh4R2LRHywYIk7yKeFKT
	 ombqR388WupktESSwXrwllbEgz/H+DGF+sak/iY56kJpqW4HAAdSHupnVqpERwkBXM
	 CmDFdOpdORt3qemPRNrNWLA8/GSE1e6uGxMn97kLp+ZmrMfz09AQc6+8gDmzGtK/B1
	 JsjHC5YeFhb5JhcFHnedeyJEzEj8LHqwOIovRFSfSu4B7uwHeCW8D596GG4jyrBFjj
	 BupTSB0p6ZfOg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 198CF39301A0;
	Fri, 29 May 2026 20:13:53 +0000 (UTC)
Subject: Re: [GIT PULL] io_uring fix for 7.1-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <21ba7f4f-91f5-4157-b4ed-385359b487d5@kernel.dk>
References: <21ba7f4f-91f5-4157-b4ed-385359b487d5@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <21ba7f4f-91f5-4157-b4ed-385359b487d5@kernel.dk>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.1-20260529
X-PR-Tracked-Commit-Id: a88c02915d9c6160cfc7ab1b26ed64b2993e2b94
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 80169db922c1bfb2947e901514e33165a64787c2
Message-Id: <178008563153.1949175.11441193499762804235.pr-tracker-bot@kernel.org>
Date: Fri, 29 May 2026 20:13:51 +0000
To: Jens Axboe <axboe@kernel.dk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, io-uring <io-uring@vger.kernel.org>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 29 May 2026 11:02:02 -0600:

> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.1-20260529

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/80169db922c1bfb2947e901514e33165a64787c2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
