Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595209;
	b=POEekVjjKGw/TpIiVqFpErRQ518wpSGN/HdUd46nM/93LwlEMLsGS7M3098I4u9NNsQm
	 pPbVyqFsHoO3y4jlsWbSEwySHv38ueIsdOCTHzs9o+gZPAi46VPL15q5VfaWxFUCqBw4X
	 SATqAwKi67lw6myicIu/m701Xj5XTtSQz6nIkH0yFkEFn863a8NAhuBxHxvwwM4nU7p2+
	 ZoJQIKPnT01EdHoxaateCM0BfyL04WnKVC80tnynRmQPyrH5Kj4UafKSfUET7RhUFQUPZ
	 5gYBy1+ZtKxwvuclAn+uoBTi8ptdbjwFVfMnzEMb0KOXLlnPK681I00F6rlLIWHL5cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595209;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=bbD4jut7jRQHrFu63v3X3Hfwx1nNhCljvKR0RXA+Dao=;
	b=ybZUpfbafmjb9ROp+6+ehaszR22bo8q9vKkDMc0bmJhzeIBqnQPjySrf/r4ZRqKD12HO
	 z0DfKhK9IQBg/1BKFxLmI3qNu/fl815nVps5e2k1TNBgPCgy6l9lyLZd25vpVGVWVm4LA
	 6IJRJ5vWsLLxcb+avimYlm1AfpF+1T32pi5RYqp8fT96OL/wKtGua3Y7PPsT1Z7sfEEZ7
	 BAH7MXRczZPAh3ST5b+F/ks4CsH34zfXwVopP6ANUJ9e61mi5aSUEFwlxx0N/eT9g4S9X
	 PYpL5/QyTIFMsTvNAzQXTHJrsAw7PkbH1iZF7c9JRdggnlijcUl8Xu2oYxFuVcFZWog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bNXWwHVu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C197606A332
	for <io-uring@vger.kernel.org>; Fri, 13 Nov 2026 18:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bNXWwHVu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08CCB1F000C4;
	Fri, 13 Nov 2026 18:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794595209;
	bh=bbD4jut7jRQHrFu63v3X3Hfwx1nNhCljvKR0RXA+Dao=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=bNXWwHVuQUXUzXc+n5Z9BNzmOyrvrfAaH3+/+mxB8zqBuicaRLS/jKArz9iAT9Lbb
	 udlbZoTeG5rgF73L7f9/1CUFTaRY3BJtxbn/T0+e1mnknzeVegpH4GW8qo5wCNENvN
	 whxk4X/D6N6CCoCFnJ+ci+4gAW+sac/JiFJlf/RiFCGlEWdSqeqCzksMyWjzFovkdz
	 9g3FG1tPot305c86w6b9pWi6Q0qCHkkbC5bahOPwMzlkiVELOJ4bLj/ZOGXswjIit/
	 RkcwiOJIJKyFqoH9TRC5iAWLVMTbyFU/Mgke93UVzvg1CmnOKeBdMf+1FnyhOUtsmt
	 TY97RPPb57UhQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F138B392E998;
	Fri, 13 Nov 2026 18:40:08 +0000 (UTC)
Subject: Re: [GIT PULL] io_uring fix for 7.4-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <44acf7bd-441b-4852-b92f-d90b58a176d5@kernel.dk>
References: <44acf7bd-441b-4852-b92f-d90b58a176d5@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <44acf7bd-441b-4852-b92f-d90b58a176d5@kernel.dk>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux tags/io_uring-7.4-20261112
X-PR-Tracked-Commit-Id: 39c7210e970200f8b17de3767c73efe64173a95f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 831615b085fa5b9c85c5a52dadd71ebcfb8d5985
Message-Id: <179459520757.1691752.17454312666238933191.pr-tracker-bot@kernel.org>
Date: Fri, 13 Nov 2026 18:40:07 +0000
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

The pull request you sent on Fri, 13 Nov 2026 05:53:29 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux tags/io_uring-7.4-20261112

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/831615b085fa5b9c85c5a52dadd71ebcfb8d5985

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
