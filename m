Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DB33CBE6B
	for <io-uring@vger.kernel.org>; Fri,  5 Jun 2026 22:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780697700; cv=none; b=aa3jNrI0UK7tyhA/bx3Q2IXODlJruqKU2cvYpeVJ4MybL5pVhEXsS/0mSFF2POkYMUZRzSlaVrx95yCRPsw6J1yxfJsoH0ig5g9I8pK2BPRPCbg4NFGj/LbcH1NhBfX8YceenwF1NyAJlaYzefMPTKhzOnj6OJYC5lVf4qSHR3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780697700; c=relaxed/simple;
	bh=owIGJzutine+z63NXkBU00TVEy+7LhtdbWnJDbt/GcI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=sOhi2jsy3YCmW4LPFX9xHpJEc4TQld4A/o2Swb64xkz6IFTclAdAolH0HgVgzSIOMupHPld5NbEDsZHxY+T8uHw6ijsN5zosaUSvacTyjlDmgZszMU08dzFY39Y52+1yiCXCBlnJDbqFCi98LdGZua8QpshIwr/fxhmLxOmeA4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S5B/Ni28; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S5B/Ni28"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 255C21F00893;
	Fri,  5 Jun 2026 22:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780697699;
	bh=9uDan0MZvGDiLqmItSHSAXcAoNpSgOuMj24z67v8NiM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=S5B/Ni282a4U2lX86LPZUCFQ1113qByhaB/BFg+RWVBtnUEQeRTsYN8r6XA8F958f
	 deTakMJ3w8vZT11ZF1t/X8iIzMdWnruVY3cMQpxmB+WEDS8AuZvhN8TrNQyRrNz1OE
	 bFUI2J1OfQKBBfBEDV4BiDBZCelTyx0le3Dt0l+nqM6JH65UhB7OtXWp6GA4GL7x1z
	 3jTTyBRCQ61/smqaonM5crqBvAe4uUDZ2yfuWQJBsAgj6ReYgVTV/sntRlclD33Bhj
	 hRMv8EQ5qOya1KXMUy49Qll8YPCB7+SQQtbo5KGvHy5ZPyAD11/mjEH0tyrOh1pxOH
	 3pwtGZJNJQXmA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93CFB3930C04;
	Fri,  5 Jun 2026 22:15:00 +0000 (UTC)
Subject: Re: [GIT PULL] io_uring fix for 7.1-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <956f675b-1106-4e26-86ec-8592bafd99ad@kernel.dk>
References: <956f675b-1106-4e26-86ec-8592bafd99ad@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <956f675b-1106-4e26-86ec-8592bafd99ad@kernel.dk>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.1-20260605
X-PR-Tracked-Commit-Id: ed46f39c47eb5530a9c161481a2080d3a869cfaf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c10130c234c81f4a7a143edbf413080235f8d8ce
Message-Id: <178069769924.3938369.7693869478519494336.pr-tracker-bot@kernel.org>
Date: Fri, 05 Jun 2026 22:14:59 +0000
To: Jens Axboe <axboe@kernel.dk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, io-uring <io-uring@vger.kernel.org>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 5 Jun 2026 13:37:03 -0600:

> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.1-20260605

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c10130c234c81f4a7a143edbf413080235f8d8ce

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
