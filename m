Received: from cae.in-ulm.de (cae.in-ulm.de [217.10.14.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC36B24A05D;
	Sat,  6 Jun 2026 20:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.14.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780777213; cv=none; b=sEjqQJbaxiEgprkfm0y2o8/TU7zH5p1/h0MHrhgEXc0cYGPSrm+7logjIDDOG/eSorbWZ8M9yqPN1UIiVdaHrA4zLVIefHwaL1cSTSVfUoyyUM3pBJ7BGwUnNqh44NfpgNxQP+dBcGPU4DcxZTyVArslmUECiMZnDmNBzSCpfGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780777213; c=relaxed/simple;
	bh=PCAeVasGht5Svyz2Hi9WKxt4deJ9zATjbaBdSwnu/UU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aBTkpnRhT7HcFK+xCEz8wVLoA3RTAeD1fjIukSHcRGpO5bz3hHPiRonhmWOtAlVRb6DSm3iECcNUprnAO1TjGeIx8t99yrHo7ovxDon0hSiMG77HLnLIRRBZgTgwWcjbRO/NkeR3nltKq+dXQHuw1nAsl+l9PEq0BLXJ5aTapJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c--e.de; spf=pass smtp.mailfrom=c--e.de; arc=none smtp.client-ip=217.10.14.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c--e.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=c--e.de
Received: by cae.in-ulm.de (Postfix, from userid 1000)
	id A4750140033; Sat,  6 Jun 2026 22:11:48 +0200 (CEST)
From: "Christian A. Ehrhardt" <lk@c--e.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: "Christian A. Ehrhardt" <lk@c--e.de>,
	Tip ten Brink <tip@tenbrinkmeijs.com>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iouring: Fix min_timeout behaviour
Date: Sat,  6 Jun 2026 22:11:20 +0200
Message-Id: <20260606201120.1441447-1-lk@c--e.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The wakeup condition if a min timeout is present and has
expired is that at least _one_ CQE was posted. Thus set
the cq_tail target to ->cq_min_tail + 1. Without this
commit a spurious wakeup can result in a premature wakeup
because io_should_wake() will return true even if _no_ CQE
was posted at all.

Tested by running the liburing testsuite with no regressions.

Additionally, tested by turning all calls to schedule() in
io_uring/wait.c into calls to schedule_timeout(1) to force
the spurious wakeups. With these spurious wakeups the
min-timeout.t test fails before and passes after this commit.

Cc: Jens Axboe <axboe@kernel.dk>
Cc: Tip ten Brink <tip@tenbrinkmeijs.com>
Fixes: e15cb2200b93 ("io_uring: fix min_wait wakeups for SQPOLL")
Cc: stable@vger.kernel.org
Signed-off-by: Christian A. Ehrhardt <lk@c--e.de>
---
 io_uring/wait.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/wait.c b/io_uring/wait.c
index ec01e78a216d..d005ea17b35f 100644
--- a/io_uring/wait.c
+++ b/io_uring/wait.c
@@ -103,7 +103,7 @@ static enum hrtimer_restart io_cqring_min_timer_wakeup(struct hrtimer *timer)
 	}
 
 	/* any generated CQE posted past this time should wake us up */
-	iowq->cq_tail = iowq->cq_min_tail;
+	iowq->cq_tail = iowq->cq_min_tail + 1;
 
 	hrtimer_update_function(&iowq->t, io_cqring_timer_wakeup);
 	hrtimer_set_expires(timer, iowq->timeout);
-- 
2.43.0

