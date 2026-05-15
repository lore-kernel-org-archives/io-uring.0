Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AE2392C28
	for <io-uring@vger.kernel.org>; Fri, 15 May 2026 20:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778875794; cv=none; b=J9D1fEiJWhsuuyZOe/nARt0CojhcHi/Ise1DDo+r81AGBKFpcJLVLWWhytXdTZKcOhfJe2Y+V0YL1DWcML1fCPjysygeU7LOfOdMXNoO5ZasD9hP4Ub+qXGi1dwUhZOGDoFmpv1/r9y3znQDEoPkydDfRR/cYK9n4NLlR6fyu2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778875794; c=relaxed/simple;
	bh=CrKhwm8AuA3JKrtoDEH+7+47Lm0J03OlKG2F2dQmuC0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=W1Dpjvx3n2tKLwxjBeqX3Ta3NQa0dNpYUbhNyM7DqDhwEisOAdmYo/7tWWfRn67m9dxEW2X9o6LOrlq0j6wJG36JYpDoQwWkwPi7dsAaz6KUitsgJ63Uz6o/oWoxQbIK82WQhv/xnmmTu11XqaTikdJCSJXA3mKvM/NrrWEyKxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=elsJuNi4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="elsJuNi4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 425DEC2BCC7;
	Fri, 15 May 2026 20:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778875794;
	bh=CrKhwm8AuA3JKrtoDEH+7+47Lm0J03OlKG2F2dQmuC0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=elsJuNi4iXlSvIXlXn5E3IuTwolNk/w8xObijm0D/1ZU4HAaxELq7q3qkM+AtifIl
	 a/uv6gPbZplomlusADYU5nLBjQ/plCm0uWSlPE85IezxpYZbOhlzzxBXA8aVtXbtwJ
	 PTtBeL+5w6aGa0nSq4DCX/cxkk1ZVcmHgCY4QTOja40SuDn2qK6I6KZ6MX067dNUwH
	 el+pdlX05RaVGSU4vXl0AcSDuw+eSqQAEXUwc/Dh9/Da4xCAAlwz4PPkS32G2VKFVK
	 VM1O3NMkbd4OEOItCu3SbPx4DRarCg/nKqcNna/qTlC1khDlbt8hdBcuRvc1ZY+jVg
	 Ds1EhLkAcZ+NA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D097E3930A09;
	Fri, 15 May 2026 20:10:08 +0000 (UTC)
Subject: Re: [GIT PULL] io_uring fixes for 7.1-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <52144dd5-f3a8-4a82-b048-36b53518c9c3@kernel.dk>
References: <52144dd5-f3a8-4a82-b048-36b53518c9c3@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <52144dd5-f3a8-4a82-b048-36b53518c9c3@kernel.dk>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.1-20260515
X-PR-Tracked-Commit-Id: f44d38a31f1802b7222adaea9ee69f9d280f698a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ee7226b2ae3beff5d8feffa94e5fd06af6965e52
Message-Id: <177887580778.138467.4322383877039352511.pr-tracker-bot@kernel.org>
Date: Fri, 15 May 2026 20:10:07 +0000
To: Jens Axboe <axboe@kernel.dk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, io-uring <io-uring@vger.kernel.org>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 15 May 2026 08:16:41 -0600:

> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.1-20260515

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ee7226b2ae3beff5d8feffa94e5fd06af6965e52

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
