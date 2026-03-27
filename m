Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7D033DEC0
	for <io-uring@vger.kernel.org>; Fri, 27 Mar 2026 23:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774654379; cv=none; b=ZaTiC1czQe9U7ELZNMgqM3iKAEDfyhI+Rt5vZIYZmCqzz9FA+HlUF+o1rM7h0YrKUsu7Ol8f7lSyQg/FJihTWN20Z9Aur0IEc2c8vztW0ZJEdjF7dzSHucKIIUVsgZk2X6Eb554G2UjcGTYzOd0vpGZ0zS4s4eWUA/1SMh/BHJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774654379; c=relaxed/simple;
	bh=+jJmQCf2jtynYceAE0VkyiRsn1GjRtoSjr5CSswKh1I=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=CEjvxY+la5xSTqAp0A59mZ6rWTDDR4/W/mXHNRBnHQ63HASD/LaLpNkRGYlf6t8rcUbGJzyZjI2XFrxjcaHnwVU9EDnVKpOTpGa5rETRt6AYJScsw6MsBvOaA2B5WmJEWfpE0VCK/T7F9K44iLAPKuZoSN9tbO4r+pnDXNnI4LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wty2OMSX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wty2OMSX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90E4CC19423;
	Fri, 27 Mar 2026 23:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774654378;
	bh=+jJmQCf2jtynYceAE0VkyiRsn1GjRtoSjr5CSswKh1I=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Wty2OMSXHq19mOma/AMEe1GOqgfcJOucM5wkma1dUtqIgqT4d4ERRx8RHv5LRoGH9
	 /XKuGPbpO7c53TV3CUZwkfo+xuoaBhclHWZpj5mljbdlZHtFfmHSPGmdNINAwEEWRD
	 0T9AuIc41S94g8ZXuCrghGWwOaFlqCjHSgc1htIvEEoe2J9sXoJp2+xswIt4+X/Iha
	 0NFdvdanPi0zd97IKMNYfhZN03x7YKG/uVOXzG+oDrXjcOfYoMU5hgmk/JISqllgHq
	 FA5ofjutK8z47QLfeCQN6DRz2H8GjUdPEYBDnEnFvOaNtLLP3wrbavjnA4mCV0xt/7
	 EnoY0dEJ4DORA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8ADD439301F5;
	Fri, 27 Mar 2026 23:32:45 +0000 (UTC)
Subject: Re: [GIT PULL] io_uring fixes for 7.0-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <73a85c3b-70d0-4834-9fde-aaafaa879538@kernel.dk>
References: <73a85c3b-70d0-4834-9fde-aaafaa879538@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <73a85c3b-70d0-4834-9fde-aaafaa879538@kernel.dk>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.0-20260327
X-PR-Tracked-Commit-Id: 5170efd9c344c68a8075dcb8ed38d3f8a60e7ed4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 196ef74abd3abb97a97fcf416ca9d59851fd1d08
Message-Id: <177465436434.4116696.9959800977108337754.pr-tracker-bot@kernel.org>
Date: Fri, 27 Mar 2026 23:32:44 +0000
To: Jens Axboe <axboe@kernel.dk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, io-uring <io-uring@vger.kernel.org>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 27 Mar 2026 07:36:43 -0600:

> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.0-20260327

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/196ef74abd3abb97a97fcf416ca9d59851fd1d08

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
