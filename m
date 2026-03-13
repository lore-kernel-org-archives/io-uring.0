Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB313CA492
	for <io-uring@vger.kernel.org>; Fri, 13 Mar 2026 17:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773423212; cv=none; b=JU8ksmVGj8tsBV6QBk+4ycOFlPcnlXpn1zXe8Ijm35BJNjtEJbfAaoxF48TKQ8PI0D0WEjdvlmqJgFyDzhfh1RzvvC35vfQBeLE5B7y0i1mjs1lauXPkJ/HatKI8IAOYX7jA5KS6s5kJHZmrx0kw23qWCkkRKN9BxumHEMhr05M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773423212; c=relaxed/simple;
	bh=VKMwY2/NcQNoEqXMtPlTjvtvOJHL/H3NccTrW+SoJhI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=WCw5zy3KbNPU8g09B84d2yz0LQV4xtC0eqtdsNYYUk4RtAlSUIlG+8Rz8T/IO7fpCQPTyyEhyIDmHyFvBJN9Gj6NZ+AGSFE3yHq1Qv3KNdVexrB4w+CUTiwVUJj5aXyFHRCfba64/oikCdOLMUTBpn/L3bEEF5xdcDRCrUdRRSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jqA70oRT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jqA70oRT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D91AC19421;
	Fri, 13 Mar 2026 17:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773423212;
	bh=VKMwY2/NcQNoEqXMtPlTjvtvOJHL/H3NccTrW+SoJhI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=jqA70oRT2mavnUb+1HYwgQ1A6KjuhTeGOheKCteUrXzRvxSn5nhNvQljGRMlmK1j+
	 4mHgO2TWI6BDCQRpUh2hWAYLT8vjG59RZ/zB5b230JKp36zSICkZszEHY9i8xzf/cs
	 lHBOchvh5JCGDNURfYpaY/wm3jdFZaLUJQcQzPIIxJI3cYfxy/KZ7CWfg0kf9uE52k
	 DIrfbegK+Zy0FE5EsiG19usM/kPPZ68iUPhWFoD0G7doLMsfqhmjCVgrwDDSf/Xmm0
	 LhgxBanevGRF68NfQ1Sb+lW4LQKg5CxdZc/VdzfqePGddCBS00XSfRMg/AdkQEbD6p
	 Vro4miqX1WffQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 155733808200;
	Fri, 13 Mar 2026 17:33:28 +0000 (UTC)
Subject: Re: [GIT PULL] io_uring fixes for 7.0-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <0ee80082-40b4-462d-9661-142cfb67a56c@kernel.dk>
References: <0ee80082-40b4-462d-9661-142cfb67a56c@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <0ee80082-40b4-462d-9661-142cfb67a56c@kernel.dk>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.0-20260312
X-PR-Tracked-Commit-Id: c2c185be5c85d37215397c8e8781abf0a69bec1f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e67bf352a0847a65a157d5b02a6024c65a781e08
Message-Id: <177342320678.1438840.2506924291576968398.pr-tracker-bot@kernel.org>
Date: Fri, 13 Mar 2026 17:33:26 +0000
To: Jens Axboe <axboe@kernel.dk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, io-uring <io-uring@vger.kernel.org>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 13 Mar 2026 05:47:11 -0600:

> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.0-20260312

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e67bf352a0847a65a157d5b02a6024c65a781e08

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
