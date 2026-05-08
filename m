Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38543FBEAA
	for <io-uring@vger.kernel.org>; Fri,  8 May 2026 20:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778272991; cv=none; b=Quux+rSfFtuS/lS2dQNY39l9NqEO86T5ggBsO/HRbDTQpKQLb4IWB20gqniHYR8fbJ9qZgbMLxISeA8xRJF/qyL/4V+TDyexfHpaMUHBSwyJ9qPkL3mqr2ILtrqE+9KUEmNXeMRr6kwPtCcvy3VS/MFJ/5AephsKcyvXoygeWws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778272991; c=relaxed/simple;
	bh=Wv4ulKxjcDeO1lFT3znmqJ4GLGT3My1dipYke0rhyGY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=lfeyMg4X+RlrEUjBw6H85iTev/BtdcfcMu81SUJMBT66wGzvrjD/9wsYmx/AC/j2Pgb2J/hKy0ISrmO7cKoB3O8ifxpW4y5zsHFBe6eaL5AWZcnrYD8AU95t2FoyWUNbtW4lqFT6j6yFpmVTX8VaQ5vBw+KrLT7NtCzvluSqo7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GmDeEt41; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GmDeEt41"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6E10C2BCB0;
	Fri,  8 May 2026 20:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778272990;
	bh=Wv4ulKxjcDeO1lFT3znmqJ4GLGT3My1dipYke0rhyGY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=GmDeEt41wOyUiSopdkg24c1Q1yNOV6piIPB+Axa8+4DhQh3S4CHRXpbETvL0x8mja
	 O93t74hgTZ/5q3nXSERx8Sh/cZip9tN5w0K+yO1K/nuiKveFRH7xlQPigBAHjVRlje
	 fvYz6vLJPwpCeDlf26dugXF4sTcdh5McmP3KkImyxfcE4zCWztNUVNBgjE0SBqktef
	 rHHxOKXSum7RUrH1YrL+xBekrBma21fks2fd0NfqnbPfD04sxppDl6JQ78F3FGK9G2
	 2kvt3Xp87fhkW0UVmTPvAdJnWt5n9mccFOH6SSY6urWtXhBnoGEZMWeeRd8fSIXjdZ
	 PE+UU6N/ltRHA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CFD538119C3;
	Fri,  8 May 2026 20:42:20 +0000 (UTC)
Subject: Re: [GIT PULL] io_uring fixes for 6.1-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <db32ecb0-b37c-43b2-a8ab-cba6713b3e67@kernel.dk>
References: <db32ecb0-b37c-43b2-a8ab-cba6713b3e67@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <db32ecb0-b37c-43b2-a8ab-cba6713b3e67@kernel.dk>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.1-20260508
X-PR-Tracked-Commit-Id: 45d2b37a37ab98484693533496395c610a2cab96
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8be01e1280912a84f6bcf963ceed6c9f13ba1986
Message-Id: <177827293907.841904.3011271410560530078.pr-tracker-bot@kernel.org>
Date: Fri, 08 May 2026 20:42:19 +0000
To: Jens Axboe <axboe@kernel.dk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, io-uring <io-uring@vger.kernel.org>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 8 May 2026 13:19:14 -0600:

> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.1-20260508

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8be01e1280912a84f6bcf963ceed6c9f13ba1986

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
