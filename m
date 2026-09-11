Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5CE5A985D
	for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 20:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789158361; cv=none; b=f60yGsa8jcJrGSyfitPZsNQKTJsBPNlv3bihC5R3ZtvRahR41dAROrE4Ca2GO0FIqHYvetI5gnhbdRnZQfWEKYZEnMy46mzn2dYmGXvfBAnDy6QROaDAwVK5sCoBusncTtFDPw6S6srwtA5OVjNJ8Y9f4TB517c+ZYGXpcYP0Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789158361; c=relaxed/simple;
	bh=kjLtOK/CJNc0IqDenlhj8Vn80Va0NgtJUOEy+iXFZj8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Jpo/LDbIb8Sa3ERjQ5Q69SizA+uZURmzMrwfUREKa948/qGNSZcCP/TtgEZH+FgwkBv0X4tHeSplFnvZAWNsnb1QAUmicSS5+CKu9tviELEFps05Q4yFZusRNUnHQ1UChx2DpCv14ZwezwXcinwOG3wU1z10IiN1agzeQDu0D8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=epZ1i09h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="epZ1i09h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE701F00899;
	Fri, 11 Sep 2026 20:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789158354;
	bh=ueeSuf32pX95I8uzJPL1gDgdRylY2IcaGtFeLE6qEDE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=epZ1i09hlrta9XhwxHJV9VChs5cKKllp/RbvpqpDsog5FjfW4wTHJpykP4seoirQI
	 L8GpkvWrOa6VvV3RIE2xuaaHixJzEIg2Xqk4Hy1tl2QI3aK3QMNJEIeU8zMbhMmZnX
	 qV5WX8kGkNjMdNOKex47pL58HNgS9PoR47bfgiAgoVwVrqnc0eviINPX49wXeozRO9
	 SyGtQxPu+y36Sz5JDljG22byfpTYjd9t1RiDXdR3ft6Jp0HD2vtUm+hzMM4pD3haAC
	 VS38iWWCTorzP2AST/c4JLRyO/IHVdk81YVGffUnKsB8sXGuKkG6f0xStwNFshWrgU
	 GkF+PeCE8Vz9Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56B933924451;
	Fri, 11 Sep 2026 20:24:52 +0000 (UTC)
Subject: Re: [GIT PULL] io_uring fixes for 7.3-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <3764292c-52f5-47ce-8f2c-02663e1f287d@kernel.dk>
References: <3764292c-52f5-47ce-8f2c-02663e1f287d@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <3764292c-52f5-47ce-8f2c-02663e1f287d@kernel.dk>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.3-20260911
X-PR-Tracked-Commit-Id: 47ccc3f1c615a46c25cbf7f3ae60df30b40eb2e6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 42f961c42b6b29532c7c75e028b4192ed333fbcb
Message-Id: <178915829097.3095760.1152704424492400045.pr-tracker-bot@kernel.org>
Date: Fri, 11 Sep 2026 20:24:50 +0000
To: Jens Axboe <axboe@kernel.dk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, io-uring <io-uring@vger.kernel.org>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 11 Sep 2026 05:33:06 -0600:

> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.3-20260911

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/42f961c42b6b29532c7c75e028b4192ed333fbcb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
