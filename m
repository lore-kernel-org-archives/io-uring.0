Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556B321D3D6
	for <io-uring@vger.kernel.org>; Fri, 13 Feb 2026 01:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770945495; cv=none; b=iUK+E6yH85Wp+jPToKAxQ0w50+ojoa7QIL7u1m8myclCkleYv/dkgy0DmDr1d5oKbm1XVOqn4ijpCSoAAFY1mVTet2dV3nI4OBQzk+hr8f6fgnFDtqpxEUrcALNyoi4oVwwZePzUZtpmi0KjyxUCMKbDYNkvfL3eDYdGXiQlwdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770945495; c=relaxed/simple;
	bh=+FE2c6TLgcsynx2HfVj7Gd/I5dGfRxQWw6/iZ+TX1fw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=C4aY+TdL2y6H41WZnmy+gTlESz5pVGeBJUTzs5M0LIyg/smYZCpoeMtLs/CvmcQxA0zjfVzNlPgYubwCDC1lGaRuy4gsOSYzPZFosWjj6VYdwxqf5zOsITaWPadGDN6ms12aHh1rUosMbUnDvAgoqAIafWN3KkwW9PvMNNu7dS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uieO19aA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uieO19aA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A78FC4CEF7;
	Fri, 13 Feb 2026 01:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770945495;
	bh=+FE2c6TLgcsynx2HfVj7Gd/I5dGfRxQWw6/iZ+TX1fw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=uieO19aAtfGWkJ/nXSj3+2K/YepJY1CIhjJ2jlASXCH8UF20i3e+C7lkCrsRYPOEE
	 hzbfSX1Lhkzu7mYY8w4yNez+rGJd8Gc+RU7vANLpZp/um1aQjHfeiYQq0p7nNkJAMP
	 hPd5yA1KqNSApt3vt1MGkqMlHVbc8btvR8Mn8l/SZ9bOpQSpAg2sm36ZqHHf6tVGD8
	 dlvJKsWjjpPJ/y/sNn/CBpCU6wqBNKAQ4YcXis6xqvRo/ijCwQ0+Bm4ZJxSMPZiQhB
	 /ZV/+O2tQ5hmtqQE/HopsXw6HmK4H7Dsi028TUoRi74XNcywvfAZOOtgPkLQvKPw3o
	 25u5WBvy/2svQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8524F393108D;
	Fri, 13 Feb 2026 01:18:10 +0000 (UTC)
Subject: Re: [GIT PULL] Large buffer support for zcrx
From: pr-tracker-bot@kernel.org
In-Reply-To: <7eff267c-a76a-43e1-87a5-d92148abdc7d@kernel.dk>
References: <7eff267c-a76a-43e1-87a5-d92148abdc7d@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <7eff267c-a76a-43e1-87a5-d92148abdc7d@kernel.dk>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/for-7.0/io_uring-zcrx-large-buffers-20260206
X-PR-Tracked-Commit-Id: 795663b4d160ba652959f1a46381c5e8b1342a53
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 041c16acbafbdd8c089cc077c78e060322dde18c
Message-Id: <177094548920.1792804.18170191503775084803.pr-tracker-bot@kernel.org>
Date: Fri, 13 Feb 2026 01:18:09 +0000
To: Jens Axboe <axboe@kernel.dk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, io-uring <io-uring@vger.kernel.org>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 12 Feb 2026 04:22:38 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/for-7.0/io_uring-zcrx-large-buffers-20260206

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/041c16acbafbdd8c089cc077c78e060322dde18c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
