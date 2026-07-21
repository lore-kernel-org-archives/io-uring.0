Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785BE3955D7
	for <io-uring@vger.kernel.org>; Tue, 21 Jul 2026 10:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628806; cv=none; b=AzYoEOq58vH6aWk3wS9xekllagB8OIvGoq53GqJoXjB/vwQXUwUltXXHjLOHIrMbnASPUfOqUwIRECdYGv4uZ3vnwBbYTpKHDHwNaa5rslu+pTX29tek+u0FFdVPwTvdLRfwiyj78oKgWPB6Pr+swIfxplwD9kNg+sVE1SgV/x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628806; c=relaxed/simple;
	bh=MCKsk/ph4Bu/AaJge/gmC3utTao7zKAG4C+0p9fGMEs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=B9SotYb9Wc7OUcFNd51r/PeQW20OZfakuvXOdkKnNpauJmGfsU8+x/QGXaDfLQVZ8Nx0GVAAr676jBgMXpWHvvn13ZUEpSxGEcYW5ZOdNE7WLLsIg4pge0ZJIp50rxNN2oOIdfexHL3ppTnflA9c7MW9BrDNYDJt9/9HQFOuxWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=EoRmzIY8; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="EoRmzIY8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=f1
	3mGRp5shGTSuWuTB71OgARDKa9qthHKgETLZRVF2A=; b=EoRmzIY8gf2GMMhQFq
	3a+udfLjumy1Ufnu49PPU4EYT8POnzHQh7X9pFKMsDb2EAcFKTGvtIUbmqRQUrfT
	Cx8g3tpmlMyVgaeF1o0J9oSCUQpjwblSfZzLapH002fhes8VS8nadoquhq1Oyvsu
	CVXSaAAl8pGl/zwZS/isOujoE=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgA3G481Rl9qg82wHA--.17273S2;
	Tue, 21 Jul 2026 18:13:10 +0800 (CST)
From: Yang Xiuwei <yangxiuwei@kylinos.cn>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	Zizhi Wo <wozizhi@huawei.com>,
	Yang Xiuwei <yangxiuwei@kylinos.cn>
Subject: [PATCH] io_uring: fix oversize cq.head distance in io_cqring_queued()
Date: Tue, 21 Jul 2026 18:13:06 +0800
Message-Id: <20260721101306.1187366-1-yangxiuwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgA3G481Rl9qg82wHA--.17273S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ur15Zw43Gr13Kr45Wr4fAFb_yoW8WFy5pF
	Wj9w15Xay0vry5ta4jvr48tFyfWan2ya1fJFWag34qyr1a9FnIgFy5KFy5CF17Gr97uryj
	yrsIvrWqyr4DAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jj89NUUUUU=
Sender: yangxiuwei2025@163.com
X-CM-SenderInfo: p1dqw55lxzvxisqskqqrwthudrp/xtbC6RYRoWpfRjYulAAA3w

The previous cq.head validation treats head past cached_cq_tail as an
empty ring. When head is rewound so the unsigned distance exceeds
cq_entries, we still used min() and reported a full ring.

Posting then fails into overflow without advancing cq.tail, and
io_cqring_wait() keeps retrying on the overflow bit. A valid distance
is only [0, cq_entries]; reject anything outside that range the same
way as head-past-tail.

Fixes: f44d38a31f18 ("io_uring: validate user-controlled cq.head in io_cqe_cache_refill()")
Assisted-by: Cursor:Composer
Signed-off-by: Yang Xiuwei <yangxiuwei@kylinos.cn>
---
 io_uring/io_uring.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 1ea2fca34a36..da9f5971e0c9 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -688,16 +688,17 @@ static struct io_overflow_cqe *io_alloc_ocqe(struct io_ring_ctx *ctx,
 }
 
 /*
- * Compute queued CQEs for free-space calculation, clamped to cq_entries.
+ * cq.head is controlled by userspace. Only a distance of [0, cq_entries] is
+ * valid; anything outside that range is a bogus head, treat as empty.
  */
 static unsigned int io_cqring_queued(struct io_ring_ctx *ctx)
 {
 	struct io_rings *rings = io_get_rings(ctx);
-	int diff;
+	unsigned int head = READ_ONCE(rings->cq.head);
+	unsigned int diff = ctx->cached_cq_tail - head;
 
-	diff = (int)(ctx->cached_cq_tail - READ_ONCE(rings->cq.head));
-	if (diff >= 0)
-		return min((unsigned int)diff, ctx->cq_entries);
+	if (diff <= ctx->cq_entries)
+		return diff;
 	return 0;
 }
 
-- 
2.25.1

