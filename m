Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7001A38F9
	for <io-uring@vger.kernel.org>; Sat, 29 Aug 2026 01:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787966034; cv=none; b=ak899zl2s84ePzogjtJHmALCZ8ubcKPIXsd5MuH01Fn02pTABlAmW8155k8xnFjaBWwrxxXTU3hiNuzvqQEzLRNjcKjwk3OJsc3omdeA00RGqTFT2fNjiaYsaEVpkOOX3OrnLra2Sk/2P+1m8d7Dz/WD2DtWnFYVJOq25wBYgRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787966034; c=relaxed/simple;
	bh=57nGk7Xxu4dkv5B5wJxy0JfJBM3Hyp5G2f0CDvrlg2k=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=AE2j+s8NhM3ebL2XqdNOUWbTKzR8obpQiJTZpgdQKbzR8sVthn5qEJi9XWRaWvcWhzMfm3xjfBxG2lecbcnO5+urLhs4J7FnctNa5kHKRLHtfqYvt/pCSdqxX993URT+3E0xYzRZN13Q8MMyQ3EQX9b6P9RH+0lakWfEnADU7nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hJna+s/J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hJna+s/J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2AE11F000E9;
	Sat, 29 Aug 2026 01:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787966033;
	bh=Q8qTLTs7YI6RG3Du3Eqimvdpt77VoJpNzjOtntaq0/0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=hJna+s/JNK4MUT8M/QUqL6E8E7V1HQLAM0wRW43IAvaWbZWUPV96sIjeQsXdHx4Tr
	 VrjOCV4pRXMCAJ3BL4llAMSUuNAW/7VB+wpczn9WTBpCtqf1MU6JRJrbq3NEVglgFM
	 1+7B7Y2GyRvBaRWPIh98c9+mxNGlMANaDVtsZfU7gkVXzIv+AXhGRKdp0UTBiNQbfL
	 Y59VnB3k7qmpZNCVaVr+SpcS6+5tO61eGrBWSJBk+XZoP4CqdTTZoABDcwTIEEr43N
	 4O0lE8iRlNRUBS2QCs+VWsvx9wsb688DETlv2+jN0r16wbmbTUhj2xC5TEYRB9+dTw
	 DLQiaYiVtTSfA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0B83380AA69;
	Sat, 29 Aug 2026 01:12:58 +0000 (UTC)
Subject: Re: [GIT PULL] io_uring fixes for 7.3-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <97f27939-a322-42be-906d-d9ef485f0ecd@kernel.dk>
References: <97f27939-a322-42be-906d-d9ef485f0ecd@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <97f27939-a322-42be-906d-d9ef485f0ecd@kernel.dk>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.3-20260828
X-PR-Tracked-Commit-Id: 2cf20c4e0f72d523b8673053e7120d092ff1f074
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cf72cbb39da84b6f02f90c07f33b102fc10b16f0
Message-Id: <178796597750.2866694.11617461721546040784.pr-tracker-bot@kernel.org>
Date: Sat, 29 Aug 2026 01:12:57 +0000
To: Jens Axboe <axboe@kernel.dk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, io-uring <io-uring@vger.kernel.org>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 28 Aug 2026 15:30:42 -0600:

> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.3-20260828

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cf72cbb39da84b6f02f90c07f33b102fc10b16f0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
