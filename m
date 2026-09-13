Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1F63914EB;
	Sun, 13 Sep 2026 10:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789295454; cv=none; b=GFna6LJuPKBUG1JGeuSkLbbX3ByrTwaax9qkqqXJvWsYEBknFQshwdFEMtyUulJ5okIXNjrz1rqnW7QogXQ8yZ3Rh3r7m85CUWomrL1tfTCM6YQjErl55I10i9+LlonmfiCMlXFnnNqQscA0WvSr4nI3CA2VbYjJtqZUJvSGLk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789295454; c=relaxed/simple;
	bh=Xhzv/vvnZt+ngImR+vKoSqFUSZ9VMUKoQ0jfKkr+9uk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=l6ihnOc/oMvipGyyz8pZuBUjpqfZOIwqqY81dX4UH1EgSOFNGVxRCDNySHpAAon2UfAf4g2sp1sq+/5qlztioMCwMRVaG9ITwSXgK/MC6F76ZUrt//CDPoKkOyAscWWeO9h9KJyUth8b8a1AQ9dxSQabA+D/Vv4l2iDkKLfX7n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WnLi5FFA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WnLi5FFA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9328C2BCC7;
	Sun, 13 Sep 2026 10:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789295453;
	bh=Xhzv/vvnZt+ngImR+vKoSqFUSZ9VMUKoQ0jfKkr+9uk=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=WnLi5FFAgAQFTFzwplqDTFANLw6R18v3IFLXHH2NACqI4/ucN2v/skvTnqbDwmEZC
	 M55LIi03I6t/zeACprNmB8ubq4vAewZKqpp81WlwyFEjuOEfWQ8niUvZZKsSIlbDxs
	 WbkF1GrUTNcAOlVd0iNKCA2xUy0N8qJLkJDltufvY2NpWVLr+rVNWBz7R7rdj/u3WG
	 zcmNkkz1hJjVg1m0ivY8GRgsDZ91ifZ/NvQ9CuB5rSw0xPsNi6rycdEWzJPOJSJxAB
	 nfK/DH9iB+M2+cyD+/kD4Q8Aop4RL9ZyXin0KldIFoKZkYuXuz7uUAOYLJZuOdtXdV
	 6Ls8y2SgV2Sbg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F60C88E5A;
	Sun, 13 Sep 2026 10:30:53 +0000 (UTC)
From: Mark Amirkan via B4 Relay <devnull+markdamirkan.gmail.com@kernel.org>
Date: Sun, 13 Sep 2026 10:30:37 +0000
Subject: [PATCH] io_uring/io-wq: stop a single cancel after one running
 match
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-b4-send-io-wq-cancel-v1-1-dcfe47275c6e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAEx7pmoC/yXMSQ6DMAxA0asgr7EUQhjKVRALCKZ1VYUSM0mIu
 5OW5Vv8f4CQZxKoogM8rSw8uoAkjsC+Wvck5D4YtNK5eiQpdgaFXI884jahbZ2lD2aqMGU5FFq
 bDEL69TTw/t/WzW1ZujfZ+feC87wAE6bFqngAAAA=
X-Change-ID: 20260913-b4-send-io-wq-cancel-507488f72245
To: Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789295453; l=2320;
 i=markdamirkan@gmail.com; s=pscsi-20260818; h=from:subject:message-id;
 bh=zEcwHR2kQSy3dfsGCzpbxbgI9eHTSwWnoSfY7BAfcpo=;
 b=cCFKWrKxZT+Dh8OtKAXY4k/2l3YdVhb71iiGjzuYVQ9LKbof4yktciTuZx2U9gHVXvhO3lDU9
 STu8WUmIXhsBt/s4D4MzUGqqf3hCDE6n/6P/TQ3Nbk07bwwO6mZasv2
X-Developer-Key: i=markdamirkan@gmail.com; a=ed25519;
 pk=/wb49ibt4gZFDncmhFQBYtjPvzT1tfJtvK4Mqt1P2Wc=
X-Endpoint-Received: by B4 Relay for markdamirkan@gmail.com/pscsi-20260818
 with auth_id=961
X-Original-From: Mark Amirkan <markdamirkan@gmail.com>
Reply-To: markdamirkan@gmail.com

From: Mark Amirkan <markdamirkan@gmail.com>

io_wq_worker_cancel() asks io_acct_for_each_worker() to stop after one
match when cancel_all is clear.  io_acct_cancel_running_work() discards
that result, so io_wq_cancel_running_work() continues into the other
worker account with nr_running already set.

If the first worker there also matches, one non-ALL cancel signals a
request in both the bounded and unbounded accounts.

Return the iterator result and stop scanning accounts after a match.
IORING_ASYNC_CANCEL_ALL is unchanged because its callback does not stop
the iteration.

A test runs a blocking open in the bounded account and a blocking
pipe-to-pipe splice in the unbounded account with the same user_data.
Before this change both operations are interrupted by one cancel.  After
the change only the open is interrupted, and the splice completes when
input is supplied.

Fixes: 751eedc4b4b7 ("io_uring/io-wq: move worker lists to struct io_wq_acct")
Cc: stable@vger.kernel.org
Assisted-by: Symbolic
Signed-off-by: Mark Amirkan <markdamirkan@gmail.com>
---
 io_uring/io-wq.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/io_uring/io-wq.c b/io_uring/io-wq.c
index 2ca223e47d..9f9039e3d3 100644
--- a/io_uring/io-wq.c
+++ b/io_uring/io-wq.c
@@ -1181,12 +1181,15 @@ static void io_wq_cancel_pending_work(struct io_wq *wq,
 	}
 }
 
-static void io_acct_cancel_running_work(struct io_wq_acct *acct,
+static bool io_acct_cancel_running_work(struct io_wq_acct *acct,
 					struct io_cb_cancel_data *match)
 {
+	bool ret;
+
 	raw_spin_lock(&acct->workers_lock);
-	io_acct_for_each_worker(acct, io_wq_worker_cancel, match);
+	ret = io_acct_for_each_worker(acct, io_wq_worker_cancel, match);
 	raw_spin_unlock(&acct->workers_lock);
+	return ret;
 }
 
 static void io_wq_cancel_running_work(struct io_wq *wq,
@@ -1195,7 +1198,8 @@ static void io_wq_cancel_running_work(struct io_wq *wq,
 	rcu_read_lock();
 
 	for (int i = 0; i < IO_WQ_ACCT_NR; i++)
-		io_acct_cancel_running_work(&wq->acct[i], match);
+		if (io_acct_cancel_running_work(&wq->acct[i], match))
+			break;
 
 	rcu_read_unlock();
 }

---
base-commit: 11773ae6da9c9d92f5d1def78f7e70a9f1fa7b1c
change-id: 20260913-b4-send-io-wq-cancel-507488f72245

Best regards,
--  
Mark Amirkan <markdamirkan@gmail.com>


