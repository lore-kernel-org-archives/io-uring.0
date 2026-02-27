Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEF43A9D93
	for <io-uring@vger.kernel.org>; Fri, 27 Feb 2026 18:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772218765; cv=none; b=Yvh+6/Pz/XMw5KeIwPPWHhGjwxRl1oeaw1j3P8HVKwBpQ0mCDkBaD34ezBaaq0/+c9OsDOidi78s32TVY4pQ85ndfYiPorwyS9BGXguzV02kbPXqjThYl3ESwbLHU++1v0Z6V8PC1Wb6JeTx4ykdW5zF2bW5FSJxPIZnmoIJa8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772218765; c=relaxed/simple;
	bh=Vo263ySIHC2SZB5PiEPmpnl9sgvg/RxbYQgqgwHWQ3I=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=c+TJMqiX/S3Sf/nAnfG9kHQtx4Lb9ult2u87Dh/baM1O+gexqKxRkYEQ+y93wvpMVagJxad0mWPPPUA0el60IaD5RBXhOCaw+GWUQKRU4vH1J6B6CmfZnoTGq8Mf7Bme/gqvXPvaBC4FxuTJ2Q6n2JnGgfMt6893L1cEWdtSJn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B7Hvzef/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B7Hvzef/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C17E2C116C6;
	Fri, 27 Feb 2026 18:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772218765;
	bh=Vo263ySIHC2SZB5PiEPmpnl9sgvg/RxbYQgqgwHWQ3I=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=B7Hvzef/R2hAad+QeQ1yxZWpvgoSDJt7xZdLRjlir0ORaqn38dfgryhZHnfgJliJ6
	 gKLaeFmNABlrhqWAk2pCUux4+Sg8FtlZvQSNEHHeCMJ7rDU300sIqcOY+M/DnZviCY
	 0cdjbib9OHSjSQWLWAHM+X5CbqCGYvb9CNnrY2oGMstfyNmDaFzWQgjjGbwO0iryYA
	 9fJ/uswWLYrdWK4FJOI6I7HSRTG1hvRCOKui1a7MbehSU6cLh38qoXC7CvfM9nvOEP
	 YMbGGe/QZKo8J3mqqKcFE4NnDuYAxPprOsoJ5JJrUJz9ki+jz5TAKyfu3BjjOQd6yW
	 fNyuDnNnPILQA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9FE639E9614;
	Fri, 27 Feb 2026 18:59:30 +0000 (UTC)
Subject: Re: [GIT PULL] io_uring fixes for 7.0-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <07724648-d977-4f5e-bc20-15b1de4d0656@kernel.dk>
References: <07724648-d977-4f5e-bc20-15b1de4d0656@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <07724648-d977-4f5e-bc20-15b1de4d0656@kernel.dk>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.0-20260227
X-PR-Tracked-Commit-Id: 85f6c439a69afe4fa8a688512e586971e97e273a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 530b0b61df5a2824250060f2a1ab77d7501a747d
Message-Id: <177221876922.2713791.6773003343870463936.pr-tracker-bot@kernel.org>
Date: Fri, 27 Feb 2026 18:59:29 +0000
To: Jens Axboe <axboe@kernel.dk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, io-uring <io-uring@vger.kernel.org>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 27 Feb 2026 09:30:24 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.0-20260227

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/530b0b61df5a2824250060f2a1ab77d7501a747d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
