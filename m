Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4622DC339;
	Tue, 10 Feb 2026 02:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691407; cv=none; b=HoiatNw5CkHBmqBcRXf3Lc1V2d+4ZfM6bnRb5SoDe4j8FaVA368xQIj7luB4/gIRootyzzu+mdh1zIl06GP2EJNxVX5QxdbNjjk/ziRqeoze+b9WMImzwhMF1fugNt/Jfe6oSdygC1KZ6qUVzj4HIAyCwIYPTpJUoXKLhzGLlSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691407; c=relaxed/simple;
	bh=ybqtfryCP+tKcCpXwbTgNN7Sp8m0PbHWwa7wnZeysac=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=dMk7wFgRNrkOI5wKwidR1vFr1WY9JqC0tavuHC7OJfG4f4w0ryFLBIf97tZ49NDSOwHSy5UMtq9+bSkRxM5cckPCGxTGtzmrN60NARGEWXm6qkre5aUBUDr/mqVMcsb+sEWri1vsSwni8OMT7HX/uWRHJAucrrsvgb+0qJqV/3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b/nYUAFz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b/nYUAFz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ECE2C116C6;
	Tue, 10 Feb 2026 02:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770691407;
	bh=ybqtfryCP+tKcCpXwbTgNN7Sp8m0PbHWwa7wnZeysac=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=b/nYUAFzJ3sol0b6Huo+pfhTs00HJe7JL034bQr+ZMzzqvccNntd/3gUbVugIIQao
	 sxFfb9g4WCjfLLPqk4zV3Kcze0rz5luTnXmrg6uOCcxeeKCCmkuzmc02m83QGXPwrP
	 yovfAl6q9SMFPsy3nsgf5AwaCQSSsk/1P+sHv06qpNXx1KufCToGULktFndM73EcH7
	 BhDY+yos58oRQKVTOxzCG8sSsGVfy4o2s76QmIc5jjRcXipAu11Ffca4hoJx6U/mo2
	 RGALdX/3NdC5ejHVPd6QK4l4iD/OoXsfJ154g0KfWxQDZ+4VMXvdCYpyucJMwujz5J
	 d5TXyY+a/AOsw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0AFCF380AA4F;
	Tue, 10 Feb 2026 02:43:24 +0000 (UTC)
Subject: Re: [GIT PULL] io_uring cBPF filter support
From: pr-tracker-bot@kernel.org
In-Reply-To: <c168f48a-0cdc-4bb0-be00-a778aab27e04@kernel.dk>
References: <c168f48a-0cdc-4bb0-be00-a778aab27e04@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <c168f48a-0cdc-4bb0-be00-a778aab27e04@kernel.dk>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-bpf-restrictions.4-20260206
X-PR-Tracked-Commit-Id: ed82f35b926b2e505c14b7006473614b8f58b4f4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 591beb0e3a03258ef9c01893a5209845799a7c33
Message-Id: <177069140261.3309876.4234867555162676180.pr-tracker-bot@kernel.org>
Date: Tue, 10 Feb 2026 02:43:22 +0000
To: Jens Axboe <axboe@kernel.dk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, io-uring <io-uring@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Christian Brauner <brauner@kernel.org>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 6 Feb 2026 11:58:08 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-bpf-restrictions.4-20260206

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/591beb0e3a03258ef9c01893a5209845799a7c33

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
