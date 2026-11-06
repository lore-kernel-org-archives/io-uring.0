Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793999749;
	b=xxDyfGTGBrcM/mU0R/r54Ur4uBDkjMt1VSjoOZ+XfrvimOVtBXx+Ihha6T6fmZRpfuxk
	 stJM8Cq2fPU5m6UvJHo+pl3Tw4HM8I/9xHR0Gr8moVRlmyPvlTDoOh24Fjhe7cgDpw3Vb
	 Wo729qntgLI+7KtbpJXCx3UaxW/tZvQV+rOrHwPRQUXU82/LK3oKMkJM+qN3D8TEa8zju
	 5/v5vahJDG42pXr8Iq+ZoqLLu0u4Iv3rlAJVPjRfOpeFqCDTxvZWiXGdYQ4zu315nPrfa
	 rp1a3op4IgWcGKNgffG9zMtIel0btFf8pUiOUe+pRwp8HhE79LYK5Ict5T0FE97TxUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793999749;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=GDFaAK4D2lgP3DALBWTtpJlMXeOGgY/amgIGm4nNMX8=;
	b=wY7/pyuNDx7hDxexeUv4IlKLwyke+7GYKPM4HoWkKLax6A4r8wYSQiZ822fYZlYHof3y
	 Sq6/rASfS4Rjvql9AGYb/WRA4eC7u2UbryErvA+owx+qMiEfzHq6/Nn3nTe3f5hPYQL/i
	 8d5jTLrjO08H4wElEMh09nlzBF76OBT6zQ0nyXBBkZqNdtUszJKPX8wKyjaKiyzUK6nZY
	 cP6RQLMmcDHUFsS5EA05kFcY9IOAm7SV9bKFyuGwOmo9+HV669b4lGzFENtoj2CF3lDd5
	 nUEzFryQAKavacV3MLaFD+s9ydjN5wbQFEi+VbRXq9kqcG7GaRvkIv6vW/ftI0lZ40A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L+bRzpvb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D90606A32D
	for <io-uring@vger.kernel.org>; Fri,  6 Nov 2026 21:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L+bRzpvb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 670121F0089F;
	Fri,  6 Nov 2026 21:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793999749;
	bh=GDFaAK4D2lgP3DALBWTtpJlMXeOGgY/amgIGm4nNMX8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=L+bRzpvbq5zt/V9Wqx4NNTaEHYF4zPFiAK0Il+08fm94k2LJ6A3dgAOWOZKWCKMDS
	 SQi2HYj0r8hzyzIhTZzaSsYKLiuCGAaYgdsq7Yi6iVbNCJ2xeLWTFQG7UP2/4TcTkn
	 q7wfg7x5W77mKfrQQBFSnLckXNRuCVKX1a9FYRvObfxmEEvoRsfttNc90eeQMpodm4
	 q2WNiuhIKf9JxaViV6dvj9GMXxfdHWTTz8c0T90+cjNcBG9ynmFCYu9Owsn47tKu6C
	 yyCErV+VkHxd5VKQJIiINARFfp9f0pz1Q3AlO/DcIErmnEiVjvYOGnFf2Q9RHm3GJr
	 6NQbEswOHIsjQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5E0C73A549A9;
	Fri,  6 Nov 2026 21:15:49 +0000 (UTC)
Subject: Re: [GIT PULL] io_uring fixes for 7.4-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <b57ad47d-6610-4488-8d16-84aaec530888@kernel.dk>
References: <b57ad47d-6610-4488-8d16-84aaec530888@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <b57ad47d-6610-4488-8d16-84aaec530888@kernel.dk>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux tags/io_uring-7.4-20261106
X-PR-Tracked-Commit-Id: cf6542493e35ab9e72ac07da10a178ac78db5a16
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 90d9e367d4dc3e4bec20c2919c1beab69a4d7431
Message-Id: <179399974804.876369.5260730577885878924.pr-tracker-bot@kernel.org>
Date: Fri, 06 Nov 2026 21:15:48 +0000
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

The pull request you sent on Fri, 6 Nov 2026 09:05:17 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux tags/io_uring-7.4-20261106

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/90d9e367d4dc3e4bec20c2919c1beab69a4d7431

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
