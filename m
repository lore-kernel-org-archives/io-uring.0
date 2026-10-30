Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793383214;
	b=pneeR76BtDBCxa76H2kAANhRvXHaDLspKemBycZF5poV2tCqo6zKN8RLlxHfUrVqd5JG
	 l/bEEi/MIN9ptkbu/m6Klxg++GwZy8Zf6KL7aDI8y/UCThqK6PxsHUFORKHJEnbUxhUyH
	 yYi+Bb3DD3/tBhb1nrxICya/2IeNTvJLKBVoIFmzvwd/pULCoea0CcTXIKzwq9mpfALWA
	 GaMI/lhGIdZMh0wSVsGUQ8cA2kMPCZsbaTk5zY/0EpAY/mcLPo88sQXFUIpYuHSHkIa3a
	 TNwJwiRuCaU1OvbNqzwiJCTB3R4WNaZRiBbVxDvc3djun1KfHOv33MzplnTOY4dQIPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793383214;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=YCFGtN/VLecORTPEfnyWRJntDEmrvY/IiAQF4at2vkU=;
	b=z9tp5p8UWzEWWdWcP6yQ81P72I8E43t0up99U7PWCOM89ZmIjqfh/ouO/DyED+JH0Bqj
	 b5M/f0CxysrLGsKounzfMAjdUfXGKl2H5Ev5tKB9aoVfbgWYzqXj8TDe7VaUxuxVyxiea
	 hqFwxUqI2OflYpsgsEJGrNFFSokkuihfG1pavJk9a0McGaMN3o4HaTTz55UYSj6r2AzU+
	 JAspH4XpVW+uuACLAA0brjlGZrZrZcmRpHCnmr/Fm/FXqyZn/7vdeBX5Eg/NdT25Aq7RK
	 a0KCayCw6BzJ1NJAU+X9BmeZJS1VqtcMd82HhGxkam0PO8sJc5+hEn+dAsaCOT3YskA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YT9vKvQS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342AA60A2603
	for <io-uring@vger.kernel.org>; Fri, 30 Oct 2026 18:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YT9vKvQS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E9D41F00A02;
	Fri, 30 Oct 2026 18:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793383214;
	bh=YCFGtN/VLecORTPEfnyWRJntDEmrvY/IiAQF4at2vkU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=YT9vKvQSd8mtsVrrJCE2t3uUTwiJLauYEZ3L4YFvTEkVE93SMooFbjelwKEA0mlYJ
	 Y1LU5OT0l0lGg1gTm8XgHe1WnOMdCUuEKDe1hYxTeWE2Qb3pRJRk14mar4NQV5Q9sx
	 sZqnMy+JT0G457OwqjyRECUCfTnY0lCt1/Maw9R5Kllyo9NYZ5IZfdV/9hv6JlzUHQ
	 Pt9JFugBpYHk5OaaIlMArLpUSxWJKfisIlIbzEeVUJR2nleL23EW1z7pH2rmLwIe+Q
	 oj1JaAI72hbHSl7ADuFJ/ytQJRnBbgFEm64uGowUoC8DAL8YfDM7/6don/xtKaVltJ
	 VDCkK+k4aGcvg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02FC73800470;
	Fri, 30 Oct 2026 18:00:14 +0000 (UTC)
Subject: Re: [GIT PULL] io_uring fixes for 7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <e2d2c19d-fdb8-4c66-a912-70c99ec9456c@kernel.dk>
References: <e2d2c19d-fdb8-4c66-a912-70c99ec9456c@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <e2d2c19d-fdb8-4c66-a912-70c99ec9456c@kernel.dk>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux tags/io_uring-7.4-20261029
X-PR-Tracked-Commit-Id: 22d9db9fd64a493525d692b32c556875b7254665
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9ed11143be5ed8d9ffa36907f24f4aca889d185e
Message-Id: <179338321288.1671436.16138154799229997383.pr-tracker-bot@kernel.org>
Date: Fri, 30 Oct 2026 18:00:12 +0000
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

The pull request you sent on Fri, 30 Oct 2026 07:46:36 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux tags/io_uring-7.4-20261029

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9ed11143be5ed8d9ffa36907f24f4aca889d185e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
