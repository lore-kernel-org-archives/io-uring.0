Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795209346;
	b=jN5cBQ6dh64qB15160BIyonI3k4e0Rps1MAm7SaURZxnq+IsZZWhfJilUPELtswt1oIq
	 4BjB0OmbmuQl9ZUVX2Iz0rKtAK1C8g0PrRK3bNYnquiZe/WlG3odh0bdHYNpjn6ynfeyD
	 vk2aU5vtW/oA5/bzKNE/DfKfTHuECCvnuv+kyY+xhLEcye2/l0FVuRJmklMcCvv49y/vp
	 0JPjqV0WioeBjKDts1L/ScxDfQrdP+l7rh4DTin91AuIEKBnT33qJi/AWOwdtccA6q+UK
	 0Y0tECk359A6HaSOBUqn7EcGUr9crTCRsRmgLtGghppUfN05HyG7CHdD0/Rpf47hd/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209346;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=FgC4GSYQdXdYxPaqMWgTe+HZBAKvOWmIqy41MjF3sI4=;
	b=j976gweztAHr/Oxcye9lmj6gCcqdMg1zQ2LwcSNftb6cr9KOvIBWlDQBRqsmECwDZGDX
	 3wME6JvkxF1t2kMWY8yi3p0X0e6s5MUJ37BfBXlL+bmGZJSq0iGw/+b6eijWkX1rC+dsv
	 HExHlKiMJT1iy8M3AWZH0WHSMZJn0Q+IWLrEE9OT9EnioA4RpZWCQ7jeLTRBw9QdVbDTB
	 V6ICm7YoCIxJcFG7kVruCTm/Orx66Ga/VcLVHpiF1nNs7rLwL4vSuubt66vfx3nAn3cHn
	 TW9yyQ2kLoyuQPhfedeOUYqcPaMO0efTxrCjY1a+INluXmvonqXn7xby44yhoIIveUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d0zS1ZAH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D833606A334
	for <io-uring@vger.kernel.org>; Fri, 20 Nov 2026 21:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d0zS1ZAH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 448241F000C0;
	Fri, 20 Nov 2026 21:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795209345;
	bh=FgC4GSYQdXdYxPaqMWgTe+HZBAKvOWmIqy41MjF3sI4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=d0zS1ZAHNx2F2vY0ImVzyuhFqCKhU9jxumwyc+blBXHm5DyVFv+dXfPhuEdrYpsOH
	 +p2/B9e12WXQSfo2eX+hvi4wJDgfU/hVvTf7gpo0Sp5WEpM5K5k8MJ66EsNBDlRDuu
	 PtmDsFH6ELUVbK0QNkGh0DD9ERi7r7dWhf5A7XYBj0ijJYgWoKgZVj8nc62KR41bLS
	 g0fMbjBowVhToQN0ZP3IOsywJwdamjk39pLf5dLHgDokXAR5Lprr4wKv3JlW0Fo5Ka
	 1cSbPkqbujcza1t+zGrbYj4z8SwdPhqm7J+PDh3FXoQMrJf5pZzKXmj/5MUt3xKCnN
	 IglFOB4CVPRjQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A35A380A964;
	Fri, 20 Nov 2026 21:15:45 +0000 (UTC)
Subject: Re: [GIT PULL] io_uring fixes for 7.4-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <a637854a-2c55-4609-9faa-80378d817ba3@kernel.dk>
References: <a637854a-2c55-4609-9faa-80378d817ba3@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <a637854a-2c55-4609-9faa-80378d817ba3@kernel.dk>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux tags/io_uring-7.4-20261119
X-PR-Tracked-Commit-Id: 0659e44ce739ecd856164c75a5325b7959a2921d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 78d9aedf2342cac9968392995d8f7fd488caa337
Message-Id: <179520934377.792202.17353151688314307146.pr-tracker-bot@kernel.org>
Date: Fri, 20 Nov 2026 21:15:43 +0000
To: Jens Axboe <axboe@kernel.dk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, io-uring <io-uring@vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Fri, 20 Nov 2026 08:11:37 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux tags/io_uring-7.4-20261119

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/78d9aedf2342cac9968392995d8f7fd488caa337

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
