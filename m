Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D66B37189B
	for <io-uring@vger.kernel.org>; Thu, 20 Aug 2026 21:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787261875; cv=none; b=WTsyZILvkeLZkbVr8neL2Cgoz8f1UA3zsw4gf4IrRtWUNAU07CLPFxf5et28Kfj+hU8Xyfeot4ApZr8WaKdmAdMxe9iIgNo21bygSg54kpwj9lSQQjDc1/FrI3cgf6facO4gcaDVpWu1AG24A4uEwHqIfNNVCcpkHGfF5IzPg8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787261875; c=relaxed/simple;
	bh=bpKBwfzYcTyoPl89imGicl6OAOqzSaC/nFNbc/cfiAQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=nxKVdVKCeAadMNVJ6oHTjo9aTNTUJFb0aMXH8Who+e56YR2t8IolWqHeYvLSXLlbDVaT7caTq2xIReiTsU6HjhibO5THYH5GWwNDBw8aBFLVvIDib3mCW1ssP8qZS5loTp/P2/NlYDyYjst0Hii7GmFchNWgha59oMTA+M0v+tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bqU4ynZJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bqU4ynZJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B111F000E9;
	Thu, 20 Aug 2026 21:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787261874;
	bh=l+/xxI41v+hzzYlO1y+Ge/tidsfFSeo1nVtqCeXdsMQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=bqU4ynZJrikC0RhbeGEFDGACypFAj7in+srRzxYKnsnDH0AoHubADvjnjCYJkRB5W
	 npQCCsbHDc3yMEFOCa9aqMPOn0C+dW5Uix12OKxC0wOnx2/sg1HjEheJKA394XpILC
	 oFOmPrAn2IzTqxwd/XuKYUr3B22lcPOnGoJUzHj0F4JBYPv1QAABIY1g1umSEZHwqj
	 aa59K7UUkMeqLpRSgK8um9iMWudCh0fVmCIUxyYw63PMCB/AkjEKYhUCcp5489teJQ
	 LRnZTomsBK2GnHLW8sPTIPAzMN8DWatizH7eaUD23GFFRhSOnfrV776n1rBAIECqrf
	 zxQxr6yNZf5Pg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D091C3811A44;
	Thu, 20 Aug 2026 21:37:05 +0000 (UTC)
Subject: Re: [GIT PULL] io_uring updates for 7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <9e824d20-2fb7-420b-af60-8411c5f7db5b@kernel.dk>
References: <9e824d20-2fb7-420b-af60-8411c5f7db5b@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <9e824d20-2fb7-420b-af60-8411c5f7db5b@kernel.dk>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/for-7.3/io_uring-20260819
X-PR-Tracked-Commit-Id: 881dc9dd66d2367e7fe1be0f953a8837cb3b26a9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f5437ff7299e47e76e52d37a2937a4b0f04e399f
Message-Id: <178726182450.499287.2994524104720656871.pr-tracker-bot@kernel.org>
Date: Thu, 20 Aug 2026 21:37:04 +0000
To: Jens Axboe <axboe@kernel.dk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, io-uring <io-uring@vger.kernel.org>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 19 Aug 2026 14:25:49 -0600:

> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/for-7.3/io_uring-20260819

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f5437ff7299e47e76e52d37a2937a4b0f04e399f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
