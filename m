Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795835687;
	b=4IvfvN0YzeQPc7hZPl7t2eoP8ZRl6lh+pjv8LVgjAUbIgSAVDHojRnfjvjHzGD7c4yIn
	 s/J8HgWvdEkBbBhduTexFuADi/Ot+KqlxGJsmo1W/Ks6TU7IBMA0IgZ9g/fW1rvensWin
	 +Pg4KRhTGfZXUYiKtkVL7A2s3TJ+Sl1oeecShWar9/+ep0TsAcQh3JmCFnWj58let2scK
	 Uuy+AwQh/0qYea7C7ufYoMlOGiOIfECfzrElC4VfcHso3g30mQl71M81ITcYwygW+E7t4
	 /WjTEtrhLJ/niNC7P5RXrV0zz0Saqltv3DrFtcwdjV+VyzMJajOQ3/de66k7zGPHy4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795835687;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=OBJDKg8b4Ej7KnBvlKJ4M7Nba5J16il5QKrD9bXmei8=;
	b=bHVMewDJc9PM0rhqTILAMSJFRvzva3dbfHD21pvTJhBrIOsdJKkBySCC+Cbmwvdmwxr6
	 yjjhtj7l++hAF41bgw5KE/fs3Y6CiHTVLYe2nrzBdHsITgb0ofiX7p15cNohGsA7vOvBm
	 CxiatHLS6sYHVvWt1w+IyIiaKmeo7cnXyNDYlbjH3AQbl5be/xQ8VNZHTpt1zbgb09XO3
	 iB+6HF0rF+0yH1frHKBIpDk2TzsFVzuDrqrgNrSwZdSt2A2jo6XN85xICHINJpMWy83er
	 wSr62QSddiPgh4Qi+kh+fQ412Vrlaieis8f/n5LAHFhlaIW+Wluq0lcGIwcKHhRXVfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E7cveepb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F40D606A31C
	for <io-uring@vger.kernel.org>; Sat, 28 Nov 2026 03:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E7cveepb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B45F1F00898;
	Sat, 28 Nov 2026 03:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795835687;
	bh=OBJDKg8b4Ej7KnBvlKJ4M7Nba5J16il5QKrD9bXmei8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=E7cveepbcrwDazKJhfllRoA4zk9p9QoD64ZYzcvw3nVuFpu5/Kj7eZsgc05Cya5AQ
	 8t+BfkfpX8HEWyOfTl8Dn8VHNFSR7IISkZhmRgFdL3geGt3kBCK7lLNffT4Pef6CwI
	 yG950Hy4Jy6xoUUWEGkEsoowc9u2UsPK73Agt+vtXUnumeExHS7fVtMpZ1o3tWB7c5
	 b5qUzpQVWxTLPi43cOkcXBF12U7+PPurGEo+2jyx7GXNF2vgPeUCncGZ8gzaxWCFqO
	 fVoXdifLlhJVeuSSdQRkcJGJLjh1iZifTvWpN5olY/qEq+XfOXMdKY/yD/3Y0nwjii
	 vMjHZIrnFDtkA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71A48392706C;
	Sat, 28 Nov 2026 03:14:47 +0000 (UTC)
Subject: Re: [GIT PULL] io_uring fixes for 7.4-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <0e7b0717-e1a9-4a26-a78c-12632e61fe90@kernel.dk>
References: <0e7b0717-e1a9-4a26-a78c-12632e61fe90@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <0e7b0717-e1a9-4a26-a78c-12632e61fe90@kernel.dk>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux tags/io_uring-7.4-20261127
X-PR-Tracked-Commit-Id: ba0084f1402bdf2946282290a3fb0af8f3544759
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7cd8495c0f16275c4f9abe1cef09a7b5fcd6d046
Message-Id: <179583568610.1782009.7301139500357708218.pr-tracker-bot@kernel.org>
Date: Sat, 28 Nov 2026 03:14:46 +0000
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

The pull request you sent on Fri, 27 Nov 2026 19:12:18 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux tags/io_uring-7.4-20261127

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7cd8495c0f16275c4f9abe1cef09a7b5fcd6d046

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
