Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792887587;
	b=npvmC2Bzb084V83FZxMnjr7lxWQ5R+WTsQ0Uu5Hk6lyBeYSRDKxG79mqrSeXwHOaTZoT
	 JCLzb621jYJWeG4LojaL3a+y0VNxQiD9aW9tfpg9G6/blEgQpnhTAMI/REvys7Pn0Cn8e
	 QPDFxOiYG8tApjYvch6JYUd62xaIX/orIdDTrW5qSU5JNxW+CArFXfdVp9ODSsNauLJnS
	 yIER2eKDemfZCT2f7B1Pg3Nr9nq7IfJhZLIKhyX6DYadrp73ILT8tESK38EcN8M8rWqJ4
	 bihkDz9TEQkmu2evvvgYaNZ2g1xvKEPAZ20Vri2RBZI9IslKWYQAKHXA71bCmukc1Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792887587;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=XfSfu92oK3M/FVzj/meILj39oiZBgrAqf9+qasMFAbU=;
	b=e68jDujZSPRgC3ABay4+Ac51FWx8x7p6bDF0oGah7xSYt1yNvs3+/sxDBLfTrSvEMNVx
	 wa8O8kvklTcCGAhPypMiV3UYVaPZx/fJApMvBAEvmSY63DgmE6l7VkEeTZ191+XJpHHGE
	 2vesdukkVLwfGTaKLgz9SXouxaStAFJdV4aUq3uJyJSzfDLo3QZYzcVmdbVLSqy9ytGSK
	 2PmZGq73jyncoHDQnVRaXXo9QrF0YVNo3hWAihmTm4wosbTGygCzHHR8MQr0TuC6AyB5f
	 hZ+KtilDYcGoObGazAdhN/wp7R1SlxKjWhPujKhYS+t1FEApX2LypRZ+QnzNJeToV4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bs3kVKKD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CA5606A31A
	for <io-uring@vger.kernel.org>; Sun, 25 Oct 2026 00:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bs3kVKKD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 113621F01825;
	Sun, 25 Oct 2026 00:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792887587;
	bh=XfSfu92oK3M/FVzj/meILj39oiZBgrAqf9+qasMFAbU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=bs3kVKKDPJ1kPe0Np+9UobUH/8kSYpVdi+QdwGc0fQN02afZMDLrJSksOks/wYmws
	 3PITONqm5hB66FosclGmV3ksBniUsrZ2fEydl0Qn32x2N9p+1J8JZu3+dL+W0SSSYt
	 WAxOiNKZqhTTs3zrn1l5ehXzsKU/FrKjHLmKDmQwb6hhz5hxRUMab2qNJvADWfUfJZ
	 uWf8OMo7YJEVtUrl+H6+Ma7yNVbRxVuLImY+cK7yAzixAJP+wN+Bf7u20+zEPyRJJz
	 nk930FEbxSVJ1OrVjgAWnfVkU7IFuwHdwi+CJHAwjuJgZO1hBJIGXKgM72eWDPOl8M
	 8u1ZEcqjAkSZw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0764F391B1B3;
	Sun, 25 Oct 2026 00:19:47 +0000 (UTC)
Subject: Re: [GIT PULL] io_uring updates and fixes for 7.4-rc
From: pr-tracker-bot@kernel.org
In-Reply-To: <8bbd8607-bc13-4070-8791-07cdfa31b45c@kernel.dk>
References: <8bbd8607-bc13-4070-8791-07cdfa31b45c@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <8bbd8607-bc13-4070-8791-07cdfa31b45c@kernel.dk>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/for-7.4/io_uring-20261021
X-PR-Tracked-Commit-Id: ecb6817b769fd7d71af2c9f446188649020b2e53
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fa899d500a0e1eb1ebe25246eaa718f78768c308
Message-Id: <179288758553.1837419.13669123908985382876.pr-tracker-bot@kernel.org>
Date: Sun, 25 Oct 2026 00:19:45 +0000
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

The pull request you sent on Wed, 21 Oct 2026 08:40:25 -0600:

> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/for-7.4/io_uring-20261021

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fa899d500a0e1eb1ebe25246eaa718f78768c308

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
