Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0CC2D73B8
	for <io-uring@vger.kernel.org>; Fri,  2 Oct 2026 19:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790969492; cv=none; b=gKLUSmkBjOHc6+qsWcMHZJ8Rp15PnCKFKkpitCuPYIkpU1O24uIZpiMJ96hrrOeLzGu76qZIJStdA75Xmep8QQ1sj17K/VTPnGK8S4g5gK0uXjk8fq0JeashwKmep/gJ1GqP6bRcbw4cDkzee3dex+p6cwrBV6kH6goIH0On/2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790969492; c=relaxed/simple;
	bh=uHhzhvGpXIDBddpQiUj4HuRuHiWVdO7KAmuyWg+5lG4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Rl454gKkwYYsDjfnvCJfaCBL4cFqnoKF+jrRIMnqPGt4nVZ7OpPN6qxBu6UT37xWpaxCNctTQHK6qICRWmZ6W+LB1O1qKNLbx7DZ2/Wb8mMzCRL1c6Av6RFrbL9bjw7uKroi70/OW8VutxMdmVTyFB5iL46yURp/NqreLSyPDN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=An4UyIO3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="An4UyIO3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FD771F000FF;
	Fri,  2 Oct 2026 19:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790969491;
	bh=W4CDKNMDl03EYTV21j/nqYKOsbiPOC5pA4Vh+DuiDhY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=An4UyIO3/eP853JcBFWIr+9uWACh3WzgIUyBtjng0ENqFjlpXrKVs5MOWrKkAltPz
	 bFkyQS9kku7+qJS3JjPXcfJEOY+P516o6pDw4CJkY11m5dJyBf97M6m76ZQu8AFbIE
	 r35IlDL7maVdzp9MLUfktTq7Fv/OtDIJ7cz6OIoBZJXi62CHUF89CzLQ/sfODWfqSS
	 8nvXF8T75+Ju880h4gerjmSBG0jC7VccaJxmzV8PoIIjRowGeSVTMNSD6lTX2lHCcT
	 s346oTnxUYM3haULsprp3GUTmoC4/2TVfoMj1sYlwVD9D5VlknCSdBYYpOndkLvNNf
	 eP8fgUOnNWahQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 776903811A6B;
	Fri,  2 Oct 2026 19:31:31 +0000 (UTC)
Subject: Re: [GIT PULL] io_uring fixes for 7.3-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <0fc0ef2e-93aa-4b18-9816-4f47a77f74ab@kernel.dk>
References: <0fc0ef2e-93aa-4b18-9816-4f47a77f74ab@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <0fc0ef2e-93aa-4b18-9816-4f47a77f74ab@kernel.dk>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.3-20261002
X-PR-Tracked-Commit-Id: a92193c91e8839fe5fc209616ea95465ae4b919d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3f1fe48a36b0b6722dc3fd421d93512bac138e9a
Message-Id: <179096949012.3555183.1762257203554061083.pr-tracker-bot@kernel.org>
Date: Fri, 02 Oct 2026 19:31:30 +0000
To: Jens Axboe <axboe@kernel.dk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, io-uring <io-uring@vger.kernel.org>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 2 Oct 2026 08:48:26 -0600:

> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.3-20261002

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3f1fe48a36b0b6722dc3fd421d93512bac138e9a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
