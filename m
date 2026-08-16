Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86442066DE
	for <io-uring@vger.kernel.org>; Sun, 16 Aug 2026 17:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786901360; cv=none; b=kgDG4T6K5W9lfB2lC1DgzZF2+wUqqwiUHQyE81SRP0HbhQlgayoQ49Dc0GlY+tPb5UaY1uda2R8vb4LoPzYMAFKlMyJ7WYvpt90mQq1GuE2tkIQpQwIspWxnZNvaQPigd+6nuAAAArcfE0v4ONEDNIoeT0TX6mjeX/lKbnb0wVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786901360; c=relaxed/simple;
	bh=qAO2fLjeayR8lXoUhIMrUbAu1/NHIhCHYis11e1dmHA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=M2q3+ZGTS1zBjEDihPz5l8yQyDJb6tgqrXB4EmOUPSVig5yLKtJhSPT542CBw+wR8YB4Zm/YEToe4+P4QP/scRj+jqpu3d3jTy6ejQ2CdYyH4akS65l/chKtS5PAsXl+0HB/KJ8hAhsuVaQMG73RTFmGVuQ0EvY95lgTuacdAhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XK2dfHKz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XK2dfHKz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B83C1F000E9;
	Sun, 16 Aug 2026 17:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786901359;
	bh=GEpriJ747izfNwdquTSRMSPljwhIFQVPr42ClqPnBec=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=XK2dfHKzkgtlb68EXvJk1dBdZYTx36p+4UO2ui+03NtlRPGtTk1qCDAF9HzWCY2xd
	 oBkbOCBGe9kN0GuN7iwmdU/Ade2ctbASt1By5nHfhSv9si+2yneLFDuk6O9ITsynzV
	 zO+ty2tSEBpsLBDyhjC5EHWNBiKut94n5HZVZnJGP2Qc5GmHeOwiQRmbyzWmzurS9L
	 HYFqCh19CAZV2Jt2WMyRYfK3aFV3cRRuKpEOBN5wLgKLVFkAxgTtYbH/jhAPFS4+Zi
	 3zm+7H9E/ChPupAbMJ+zEoy3CDp6vbeIVqe6qSqQ5AF4QVxyjcf8QB3l39ZJ1pqEc5
	 kg28KQ8OKWnRQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93C303924FCC;
	Sun, 16 Aug 2026 17:28:33 +0000 (UTC)
Subject: Re: [GIT PULL] io_uring fix for 7.2-final
From: pr-tracker-bot@kernel.org
In-Reply-To: <95f7cd18-530f-4787-8696-344c18244781@kernel.dk>
References: <95f7cd18-530f-4787-8696-344c18244781@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <95f7cd18-530f-4787-8696-344c18244781@kernel.dk>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.2-20260815
X-PR-Tracked-Commit-Id: 6ca662cc71df7eb4eaf1b4bcb07cd3f188ad19f2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0bae94aab8208b7107a2dda5de6ce046466663fd
Message-Id: <178690131204.334594.14248478909046829173.pr-tracker-bot@kernel.org>
Date: Sun, 16 Aug 2026 17:28:32 +0000
To: Jens Axboe <axboe@kernel.dk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, io-uring <io-uring@vger.kernel.org>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 15 Aug 2026 18:05:21 -0600:

> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.2-20260815

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0bae94aab8208b7107a2dda5de6ce046466663fd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
