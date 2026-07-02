Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C9542E8D9
	for <io-uring@vger.kernel.org>; Thu,  2 Jul 2026 08:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782981023; cv=none; b=OVHjn19mLV02Twr1kjUWbBWeZ9c5kk8zdhLdP3jPYJAdksZxuXNogA4zeiW6RGNGInBwp2eixIAETES/IDXJ3HSOK98ZKnPm1cEKX0cgp2PDRfCgZQLdxF0MlfHV/nBETPsEx/j73jlJkZzEUtg8xr2pCi1eKuT/nqmkcx2TC8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782981023; c=relaxed/simple;
	bh=ssAp/5B8yztfE+xM92GvOqjQQLI0MJdNz1V41fAIA14=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Mt7Pf4qpkgxZT02Y7KJsZ8f1AdkKRu5kh/fSpnsFdSJnuxHBvaIC4jBCGyRB+XVrEjR3wHZ9U3eYxCsrrJ1UDWF0/siiz6nYf3zyYjE+/3QRxcYbo2gv78qgQru2vLKSNpahRqbySPman8oSE/qNXFLU8u/zgetAHxgqk7Tassc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=EYb1ghfo; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="EYb1ghfo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=5G
	tWmpp7nI5jJ4KelCqQMF5TVChPY3TroFh4/PU68iI=; b=EYb1ghfox/bzkPTGwb
	8oF0wqSRLhkJWfKOpsrX930iHkR9s2Kk1E9LhyR5YIQrY634QHQwgDlat+uTIlL5
	hkwhKWdXTwtWS9N3wxRR1K61u/0U9iQuHOStu40TusW4Gy9FF2EXjajaOChDjAOE
	b132VDxyJRn2kD9+f6h6Y84zQ=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDnH0R0IUZqmPUCHA--.22854S4;
	Thu, 02 Jul 2026 16:29:46 +0800 (CST)
From: Yang Xiuwei <yangxiuwei@kylinos.cn>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	Yang Xiuwei <yangxiuwei@kylinos.cn>
Subject: [PATCH 2/2] io_uring/uring_cmd: fix uring_cmd.c comments
Date: Thu,  2 Jul 2026 16:29:37 +0800
Message-Id: <20260702082937.3707134-3-yangxiuwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260702082937.3707134-1-yangxiuwei@kylinos.cn>
References: <20260702082937.3707134-1-yangxiuwei@kylinos.cn>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnH0R0IUZqmPUCHA--.22854S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr17trW8uw1UKF18Jw43KFg_yoW8GF1xpF
	WIgrykKFW5Arn3Ja4DAF4DWa4UZFWkA3ZrJ347ur15Gw15AFnxKr4rKF95WFyUZrWkA343
	tF4Sq3yDZr1jy3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uylk3UUUUU=
Sender: yangxiuwei2025@163.com
X-CM-SenderInfo: p1dqw55lxzvxisqskqqrwthudrp/xtbCwRqSI2pGIXoTHgAA3Q

Fix "concelable" -> "cancelable" in the comment above
io_uring_cmd_mark_cancelable(), and fix the memory ordering comment
in __io_uring_cmd_done() to reference io_do_iopoll() and
->iopoll_completed.

Signed-off-by: Yang Xiuwei <yangxiuwei@kylinos.cn>
---
 io_uring/uring_cmd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
index fe32311b2e51..8313600583b5 100644
--- a/io_uring/uring_cmd.c
+++ b/io_uring/uring_cmd.c
@@ -90,7 +90,7 @@ static void io_uring_cmd_del_cancelable(struct io_uring_cmd *cmd,
 }
 
 /*
- * Mark this command as concelable, then io_uring_try_cancel_uring_cmd()
+ * Mark this command as cancelable, then io_uring_try_cancel_uring_cmd()
  * will try to cancel this issued command by sending ->uring_cmd() with
  * issue_flags of IO_URING_F_CANCEL.
  *
@@ -168,7 +168,7 @@ void __io_uring_cmd_done(struct io_uring_cmd *ioucmd, s32 ret, u64 res2,
 	}
 	io_req_uring_cleanup(req, issue_flags);
 	if (req->flags & REQ_F_IOPOLL) {
-		/* order with io_iopoll_req_issued() checking ->iopoll_complete */
+		/* order with io_do_iopoll() checking ->iopoll_completed */
 		smp_store_release(&req->iopoll_completed, 1);
 	} else if (issue_flags & IO_URING_F_COMPLETE_DEFER) {
 		if (WARN_ON_ONCE(issue_flags & IO_URING_F_UNLOCKED))
-- 
2.25.1

