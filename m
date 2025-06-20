Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87A630E844
	for <io-uring@vger.kernel.org>; Fri, 20 Jun 2025 06:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750401242; cv=none; b=kTlmw96qA9xarEeX3uwuarLic+cpFP2bU+Y5ACMLnQP5P//Adlr3Rz/C/slkLKykDr6iwhZP6+zgJ1SWM515VBMjLbEiiMkv1aIyYwxprZrWJaWtBKsc76xZe2vRCsmVQ2BpJYYqJdL6JgcoDMJgPm5B9Fx8eAZLtAr+rk+l4uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750401242; c=relaxed/simple;
	bh=dmqH64FIWVD2UtBSgw2pQEYlfsk93huMVFxqfMnP4ko=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=LKHANulAfnVDKwK5WIs9kw9k2GRpDbw5ZBNsSMOqHI5lC2OZ0jOnd087ZB+9SIrByokXnLaKPnQp/5vqp1ADlDfhpEb3wPPeJLloNKFx4AGKrVVhTcfO2eHar7JXzz8roOGzfhEizy1ApwrJEBDCfrvB7FNYjXdEyg0r0ep6M8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bm0TW9rO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bm0TW9rO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CAF0C4CEE3;
	Fri, 20 Jun 2025 06:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750401242;
	bh=dmqH64FIWVD2UtBSgw2pQEYlfsk93huMVFxqfMnP4ko=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=bm0TW9rOr75U5lz6/hs3ySoVbuy3mAIBM8ttQ8Qc8Hn7UJdRsq4nc9r5IMfSNbZ9O
	 QuDF1ZXdPHtz8xWIQztdHo7yA/FN4U1hvabYLqW7QLV+ufQkV8q/AoT4xHQ5rYSZ/P
	 +RmaN4adk5lg/kkfPObnrRFiOKQhJCrNQrizAlQsvB6Ip/uHFbS1fJcwEO+RoJjvqr
	 +YTLs6rFzpklZHd6fS2WcKwUqqHB7YHj/LFDr3Jy2ra0kvIXNK3BriS6FSgjb0WrE6
	 tvsFL6TlubBuURgUyqjMsL8p9y/nM0PQ5Ms8AFk1vwJyVDpuhHy16LNu53Hbu2oC/F
	 KlO9fp+fEMcWQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AEB7D38111DD;
	Fri, 20 Jun 2025 06:34:31 +0000 (UTC)
Subject: Re: [GIT PULL] io_uring fixes for 6.16-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <c636df10-8b3f-4ab9-8117-fe99c379660d@kernel.dk>
References: <c636df10-8b3f-4ab9-8117-fe99c379660d@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <c636df10-8b3f-4ab9-8117-fe99c379660d@kernel.dk>
X-PR-Tracked-Remote: git://git.kernel.dk/linux.git tags/io_uring-6.16-20250619
X-PR-Tracked-Commit-Id: e1c75831f682eef0f68b35723437146ed86070b1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 255da9b8d761c20dbdca3ff2c96635d50a9f1fb8
Message-Id: <175040127019.1104049.6073865064246794540.pr-tracker-bot@kernel.org>
Date: Fri, 20 Jun 2025 06:34:30 +0000
To: Jens Axboe <axboe@kernel.dk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, io-uring <io-uring@vger.kernel.org>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 19 Jun 2025 21:53:43 -0600:

> git://git.kernel.dk/linux.git tags/io_uring-6.16-20250619

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/255da9b8d761c20dbdca3ff2c96635d50a9f1fb8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
