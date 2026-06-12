Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A80393DEB
	for <io-uring@vger.kernel.org>; Fri, 12 Jun 2026 18:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781288737; cv=none; b=qlhiXMp09ExFjx3LZ0pkkwS2bI0YNNF6yz9EJrmK3djsxth238EZpCpEOilBcDUqS839WvSJW9NaOpF6rTaddhmnSypYbKfES2ZzUjqHrzf1FvoVtthR0g5l6wCNMZvt4PSkX1pfpq46ykCo/rqHMSMIldXHXc28n8TiWkWJsJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781288737; c=relaxed/simple;
	bh=TajGpklmeHraS32i3iPFAZ5zkzHXUb32QvcF8E3EGjQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Qtm7OE01oGVEJv0H2WpkQWf1OdAJfEkJI9tomP8PAKa41enUZ2f+4CkFBVUsf6sbSmhfsL39/UM7HPR7YZYezJvcdJYkRdmOs3uUGtzi1nrhZrrxdTUUiOHNK+REMD0kiP3dttUDQ7TBueGaLv8uK9Pv+SJfD4vXgfP53+K0X8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G+i6C1Kw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G+i6C1Kw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D46EF1F000E9;
	Fri, 12 Jun 2026 18:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781288735;
	bh=1Ws/q+30EBLDZmLwyx0AWhRhc1EXxgFXigUaBNi3MCM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=G+i6C1KwlXznQudTQR0K21im95EoDxyWBbtpjoHWmjUgUTIz/mF4umX4v7+74GK46
	 cjhG5gd8dI74ozBiII7TazkrdJaFrJWsQPLuHSoHwZ7pqG3BXymYgv0neO+hy++g0h
	 QFg2a9qi87pOj9uF1uXL3bFZi2qHEhDED/VkamEaBIPQj4wnoeStht9HGt/mK4jrMu
	 t0M+3tLWG+xAsd46W91PXImUhxo+PebRv2mWYRCTo2WjOnEc5ssE9a52uCNziBWsxn
	 DigURw2dxFCbz4PAw01BQOgWK17AYtuksyob4GDAkQ2QHaoO27Zd5NYJCA9uqxhyFK
	 kKqP9ZB4X8dcA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A3E39D2F40;
	Fri, 12 Jun 2026 18:25:33 +0000 (UTC)
Subject: Re: [GIT PULL] io_uring fixes for 7.1-final
From: pr-tracker-bot@kernel.org
In-Reply-To: <98373ad8-4777-489c-9cef-1ff9227c63a4@kernel.dk>
References: <98373ad8-4777-489c-9cef-1ff9227c63a4@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <98373ad8-4777-489c-9cef-1ff9227c63a4@kernel.dk>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.1-20260611
X-PR-Tracked-Commit-Id: 29fe1bd01b99714f3136f922230a643c2742cda9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 880b719ca0da9d2470fd2652e8ed959ca5143280
Message-Id: <178128873250.784234.17252517907368850599.pr-tracker-bot@kernel.org>
Date: Fri, 12 Jun 2026 18:25:32 +0000
To: Jens Axboe <axboe@kernel.dk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, io-uring <io-uring@vger.kernel.org>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 12 Jun 2026 10:27:03 -0600:

> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.1-20260611

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/880b719ca0da9d2470fd2652e8ed959ca5143280

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
