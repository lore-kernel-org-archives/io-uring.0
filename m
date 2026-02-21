Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18CB7263B
	for <io-uring@vger.kernel.org>; Sat, 21 Feb 2026 18:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771698667; cv=none; b=ZhMZHVnPFaRJt1tuDGPlBtJEPvxNqEVYf6DKfNO/2m01ZEPG5EOSoiOYCu9IqPkSRCc1uOywI+4KPOcz4MKIkusMSlQe68bo2rM5H6uLX69mQKhYXzUdU7oCdmWQzx0FcZoKuhINbKIOwmvRB8d+5O27tWgYAgkpXxdEwLKRq9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771698667; c=relaxed/simple;
	bh=YkfHTpO9yAV9VjDEVls97jubp194a1Zelb/tIe09Fgg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=sTPV4veBu+ZqjB1zNfo//ylv7/sfjD+fFKt9Acge+4kSjf5tKr1L2keX6H3wpvUjCdpffmVFz1a7hRLbq9X6hTDBj4LWlqoxnnwwB/wpn8ufCN8gUH2rweNdKWYgj1G7PVArQa5vFgXJewGs3EZkJamQwevIv6ATyo27h69cRag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hyR3dOlw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hyR3dOlw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D535EC4CEF7;
	Sat, 21 Feb 2026 18:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771698666;
	bh=YkfHTpO9yAV9VjDEVls97jubp194a1Zelb/tIe09Fgg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=hyR3dOlwJfVTpO0lagA10R918StofxsXLdfa/nBbA7daoTGXkDKRUdfbcWy6eCAom
	 6s6wc0Mi91t/P8dlt3jIbFVLYV6vs8IGbuo1ZUeNjn8Fw6seD8bfcVybFDK4cC50eD
	 UYEqSTbMo6QekgaUuHNyfIZv57PsVN3tEtm5q3mWt5ha3FyPazTMfAn8mfV5y6F911
	 6o73rnkCSpD/JC712m4jBcJxKzLmxFnJCfpXSOonbvZFVhfnGs0xwGPLx5a2TWQ6HN
	 AmX7prtpVXj1pyB8LowCwTvENjPqaXT2UCv7vkAYUcJrCYbnq6oWSIk8+136zu9Qfg
	 jsj+PPkmQIo/A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D03D3808200;
	Sat, 21 Feb 2026 18:31:15 +0000 (UTC)
Subject: Re: [GIT PULL] io_uring fixes for 7.0-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <2b80b81c-42dd-49d1-9f89-f2cc78e9d3fa@kernel.dk>
References: <2b80b81c-42dd-49d1-9f89-f2cc78e9d3fa@kernel.dk>
X-PR-Tracked-List-Id: <io-uring.vger.kernel.org>
X-PR-Tracked-Message-Id: <2b80b81c-42dd-49d1-9f89-f2cc78e9d3fa@kernel.dk>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-20260221
X-PR-Tracked-Commit-Id: ea129e55c9e06a51a93c3f5ef3e32a6cfa3f8ec7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f9d66e64a2bcb979d47eb7d67aa7e9b454fd5d15
Message-Id: <177169867397.1180555.11600567201665795461.pr-tracker-bot@kernel.org>
Date: Sat, 21 Feb 2026 18:31:13 +0000
To: Jens Axboe <axboe@kernel.dk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, io-uring <io-uring@vger.kernel.org>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 21 Feb 2026 06:34:32 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-20260221

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f9d66e64a2bcb979d47eb7d67aa7e9b454fd5d15

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
