Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D581AA7A6
	for <io-uring@vger.kernel.org>; Tue, 14 Apr 2026 00:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776126657; cv=none; b=QI4FfLXwoLJ9ZB4ScDlpeODZV8sbgRrzWM1eLUq535P+1Ax7ODXPiK0Oc/I9NjG+ArSdPmn93EjuCr65UMQl3y111mAf5eWOtGhcH23jva+UM3PqqgsR65nV/dJz6hklt7hymFt0ErMYuRPHritVqhpIi218i34sBQ6BzGubzRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776126657; c=relaxed/simple;
	bh=V1Gby0TKoOGNoFchvpXN9rzVFs9is09An+Aqge+AMRs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=V/pQu3GR/G2F9s+oFGPCRVZ470tlwsqWcttzX4W7sqnJpl8vlSywlLCNtnFlzobvzx/NFo9zUxKZiKAqYIi04Mzv5VvJGjC01rLrQMcmgtiVulddvVKnEQ/6VdTRknw+j6sxr08OJUTI9AM0Hx2dERiNsci7sJef36fMSfkxXGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r0gF3wyr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r0gF3wyr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D159CC2BCAF;
	Tue, 14 Apr 2026 00:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776126656;
	bh=V1Gby0TKoOGNoFchvpXN9rzVFs9is09An+Aqge+AMRs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=r0gF3wyruDOnFoj7GVRxZNoDAv143R+tSJAsn7iPp2lqFfnWX//Ka2f9otYnR61Zf
	 9zZETCX69mszPQBHZO4QZeyLJt/OXuEpj6+GSM5Vz3ruadJ0mBzxxmEO9k4Csxa4Ld
	 bIHNKsFSr2wodaHADUFRfUwoJy0SNsSFI7Etb/HrXcMAeT1f8LeCkhaqjOzrbOIExV
	 6nItC9z684C2qwTyGaKLfq0N2xYXQ/QHzJT81CnhLqeTZfHlTyyL7j75rU1b39o4TD
	 cPlhSss3F4cbNuJY5j9bTqFW2Xp5rw9iq7gzo9mf+KtokdwlyLU2ypmWe7gQmj5zzn
	 rBea8nWntWlvg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 413843809A0D;
	Tue, 14 Apr 2026 00:30:29 +0000 (UTC)
Subject: Re: [GIT PULL] io_uring changes for the 7.1 merge window
From: pr-tracker-bot@kernel.org
In-Reply-To: <759b8298-18e1-4bb2-a5f9-eeb9341b0c6c@kernel.dk>
References: <759b8298-18e1-4bb2-a5f9-eeb9341b0c6c@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <759b8298-18e1-4bb2-a5f9-eeb9341b0c6c@kernel.dk>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/for-7.1/io_uring-20260411
X-PR-Tracked-Commit-Id: c5e9f6a96bf7379da87df1b852b90527e242b56f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 23acda7c221a76ff711d65f4ca90029d43b249a0
Message-Id: <177612662811.618768.4940912902712753602.pr-tracker-bot@kernel.org>
Date: Tue, 14 Apr 2026 00:30:28 +0000
To: Jens Axboe <axboe@kernel.dk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, io-uring <io-uring@vger.kernel.org>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 11 Apr 2026 17:30:28 -0600:

> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/for-7.1/io_uring-20260411

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/23acda7c221a76ff711d65f4ca90029d43b249a0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
