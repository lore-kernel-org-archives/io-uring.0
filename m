Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F1648986D
	for <io-uring@vger.kernel.org>; Sat,  1 Aug 2026 00:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785545869; cv=none; b=j0Jj9lc70Z1O8YQae13/vEdowNCaoxEfjGwg14Nw3AeO9lZjy94yOH5RzHSeyy1vTIDvmRvh9mLGjhfe/9bjwF/zLOzFwUmRfnWuR0qWQYuiSVMwKvJKNka+4vBBNhTBv8U8JkNhttR6q4tcLYx3W58Io/4mdOiVgYN2uOEG/6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785545869; c=relaxed/simple;
	bh=iekJjCApoT0jKTUqZIpo3VdGoLHojMvtUBz0fsLLFhI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=rMYuBDCCTVEshY/hWL5YSXqc0J9tXCNtr6vIO9plqVZeGqNXvTInzIqO9+8QRekwcpdZrdwcuV7EFeytbDtDQNqrOG6D4nj92yQIjSx/j4f3OmXfsZJXOyKxkTOxnbcTpklff4xRyDXyqKu+0f9ypZ27QZjJaPOyPiRBJzOO5Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LQsjWYLq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LQsjWYLq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE5E71F00AC4;
	Sat,  1 Aug 2026 00:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785545867;
	bh=fXDlnO8QF+DgI2GuIo+nzWkV0zwzVzpAIEsrspesCWw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=LQsjWYLq4XB2jH4jrFplFqX4UZuiyDmHjRaBULLrrdL6YB2KnLsoksU4B3/N70cYR
	 rc49tcXsBAibPhl3QhWGIw2oJZ+lrTxLtKj/EUhgGxke4gsXhi+9iQlLdE6UHD1MEJ
	 AmiLNVwK6teB0jQKmT4YA5AL3rDVr1+CvbLitRMPYhzQV/ukuVZjob6iYjLcd3LGhV
	 3mntqFH+uhh6yNt/y/iUNzV4SoAaKy/tPsIMKRvBBIdUorN3FoflfiTUp7G4HnRSYe
	 3L3898hkGkMgsnUE0rotp45R5E2S3C8BbZLU+qFyuUsEeB/6lpYL4QwoeFIni/gVtG
	 JbXNv8b3FQzkQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93871392665F;
	Sat,  1 Aug 2026 00:57:11 +0000 (UTC)
Subject: Re: [GIT PULL] io_uring fixes for 7.2-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <39426415-ee12-47a4-b9ff-e4f475dcfcde@kernel.dk>
References: <39426415-ee12-47a4-b9ff-e4f475dcfcde@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <39426415-ee12-47a4-b9ff-e4f475dcfcde@kernel.dk>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.2-20260731
X-PR-Tracked-Commit-Id: bc0e8faf90e776a2f1f3967a04e8091e6bdb4977
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5d0c32d6ec00cf155d2263b82ec255faa3888c9f
Message-Id: <178554583006.970149.9979122122177000486.pr-tracker-bot@kernel.org>
Date: Sat, 01 Aug 2026 00:57:10 +0000
To: Jens Axboe <axboe@kernel.dk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, io-uring <io-uring@vger.kernel.org>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 31 Jul 2026 15:43:40 -0600:

> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.2-20260731

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5d0c32d6ec00cf155d2263b82ec255faa3888c9f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
