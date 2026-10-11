Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAFC348C77
	for <io-uring@vger.kernel.org>; Sun, 11 Oct 2026 18:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791742680; cv=none; b=pi96kgAtYQD/Gw6LEJwIUpxh+kIwSdiuIpSKQgSQF1NIz4l6i34LLnmply4zyHt0VzkN6hrb/eXVePqNObNxB9bexBc2Axl3dKxTUonKyYl0d95x22iJgTq2+7vw9CHQ51t2jp6lRX2C4QMeu1UcAu+jtJLRvyrVhCGs7igpAzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791742680; c=relaxed/simple;
	bh=oE1+Z5KRtVGQ+nyqyQHX/nTCsrNpOnxUCimcSWpJZNY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=n7rORXaVQCbearfI8mJBCiOvPG/PjVTmtK/3xD2qAdsWQxdzjBwxE4WGY+77gdm6mlyuV+VYod8mI7ayNctG0km8wJHVLzoG500CT9AxnqIl4Rf76iiuvW55GvwHm1RUKpQKdcy9HW5niJMr0GZnfeK/I8n4F//vGc4ZpXW1o+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZ7mx+bL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZ7mx+bL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0539F1F0089B;
	Sun, 11 Oct 2026 18:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791742679;
	bh=UWOm07RqX/2pIn6xvTnQK0MmmpDE6hRgUiVhbtnkGK4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=PZ7mx+bLRmqukEjqC/sdJG3hOwlwSH7PE7m8km6BwzzTFVStqEy8NcbuB8TbR7kG7
	 q0nQ7DyVDc5aB51+yWEtHui6SNsByJVV5kUvYYVvacyLeOBcx6dYUss6vRqSNFnDJM
	 AAfJxu1rdBm8ZaEm3JoXo+ivdz4XQC7t0dGyDxhQcNxKlAUbr/kW2FTPNKn+qQD1vs
	 YbN5C6w4jFR/AL1AlPq3HmXzBAMfbFCx6k2qzTPjFWR88vbCE+Vf4oV1U+eNgvBAMJ
	 SHU+k4orShsQmYT7g+P9bOpMjriJj0bWT+N8eaHlvO9mCBvDU4Q7XxPvGXV/vVbobX
	 6/wt3Ea+iecrg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F15E438119D3;
	Sun, 11 Oct 2026 18:17:58 +0000 (UTC)
Subject: Re: [GIT PULL] io_uring fixes for 7.3-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <51650716-bd0c-4349-92ff-01020abf6fac@kernel.dk>
References: <51650716-bd0c-4349-92ff-01020abf6fac@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <51650716-bd0c-4349-92ff-01020abf6fac@kernel.dk>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.3-20261010
X-PR-Tracked-Commit-Id: fddcf4c5321b3ea5f72166c3fd36a9d1c34f80c7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b7c0316c1a062dbadd0d62f1b796dd3264915242
Message-Id: <179174267746.2129915.10559563327610561187.pr-tracker-bot@kernel.org>
Date: Sun, 11 Oct 2026 18:17:57 +0000
To: Jens Axboe <axboe@kernel.dk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, io-uring <io-uring@vger.kernel.org>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 11 Oct 2026 07:11:25 -0600:

> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.3-20261010

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b7c0316c1a062dbadd0d62f1b796dd3264915242

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
