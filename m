Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A655A3A05C2
	for <io-uring@vger.kernel.org>; Sun, 19 Jul 2026 16:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784479551; cv=none; b=mp2n+uhAsBJpM+apcuEO+Rei+aIWPJSdzqUeV5/1KAWT56zFM2J0lK1LVb7UWqYV1MP59neMhmfA+P5k2pR/sTjLPaMUelziaI0PvsKVT/3Js/5wpSHFlhvYASq/TOpJx5+8REdN8f7fjneZ8p0qAv6XG+lWoDB5nek2axsXPX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784479551; c=relaxed/simple;
	bh=lZgk+gKAp6kpEfG8uang6eDf6ytiGzKqfqt4HEIX/uQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=RNgoKNvl6GQtSE0JsqrkC/i1ilW+5YvzvIiRJKQmvMiqaQ/J97Wr2t22nTUhHnOlkTHEKbOekxUIldTs/eB4wHZ3USHMCaM/YDYjzy/D8KAAlaKo8z6wDCGAwFmSwezB0ltrgOJ+oOVAcf6O9pf1wJGfA+bVFYrRXRsKnrHP5d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D+Kbcssv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D+Kbcssv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62CA91F000E9;
	Sun, 19 Jul 2026 16:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784479550;
	bh=ejBKCE53vFNtdg2oV7dWFnwMA546GdizTZoRpMjMl2I=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=D+KbcssvJkwPDbUKbltMYVyFlLAPwb3KlxM+Y/G/rQCD9WfQG/udH8t+qQiW0OaCC
	 1EHwXw2nbbdscwVrOuQHt+horIEYNNwKdvRYKJpPo7J9J5z4iFY/f4GFKD2Xwn1yx2
	 cAl7yvdCc11ttkS9HUb2jVfPHdnvHPZl0P77nUzHj6MuWrPDxFIEgE59C5vKsynPOB
	 8sX+Qub324QDEbCjtZ59mK6TuuEM3SKDBlyb3VCOD1a1YM7oF4VuCRXnr6vs8YKohg
	 o99rTR+wMYR977rOWYqECUhvil2O8LlbyTpiF815LWIeFdelNrwDXET1kFy4adqYfr
	 nChVkdJbEP6mw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93A6438119C8;
	Sun, 19 Jul 2026 16:45:22 +0000 (UTC)
Subject: Re: [GIT PULL] io_uring fixes for 7.2-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <6c68b461-0e7b-45ed-8e13-d7b7fd29b65b@kernel.dk>
References: <6c68b461-0e7b-45ed-8e13-d7b7fd29b65b@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <6c68b461-0e7b-45ed-8e13-d7b7fd29b65b@kernel.dk>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.2-20260717
X-PR-Tracked-Commit-Id: 3afc64c61ce906a04f073ca350b46de10e8302f9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a2b81de43ca64832fe09844bbf97d1251115d80f
Message-Id: <178447952117.2771094.12483534537828974816.pr-tracker-bot@kernel.org>
Date: Sun, 19 Jul 2026 16:45:21 +0000
To: Jens Axboe <axboe@kernel.dk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, io-uring <io-uring@vger.kernel.org>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 19 Jul 2026 08:39:40 -0600:

> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.2-20260717

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a2b81de43ca64832fe09844bbf97d1251115d80f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
