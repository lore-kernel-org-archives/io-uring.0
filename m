Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6AE3A75B9
	for <io-uring@vger.kernel.org>; Tue, 31 Mar 2026 10:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774953955; cv=none; b=jZZzwP/CD3hN5QIVQthILEUKAtYNnw9q9tzv5SxZ6kImNv22kNc1h/13G45kd10UHW8QXKa+fb4Aic6Z110CuAq6isMXsVOihLUXbrfzNYiKebpPb5RxKRm3BbiX0QkgWcQPOoU5jV5cxhfl0OemWDDymm9MFamBSt6ilMc5pEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774953955; c=relaxed/simple;
	bh=E1Gl6Yl49L0nKHAgwB93XTG1rpwOhkzmXiKkNK5fiXk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GKyS6lnqd2qK84Oc/NGVgT4VcBoMRG7Z8GVjaKHsDGjmSqoJ4JZjfkdA4RsWwJU8bO2QsUT57D40cQxBG+DzJUnKmApCPubadHZLofQXzQiCNVK61g7FmQsAekETucUVqBtMfeKTp4hJyhcG1tZtiPiWGbXAIpyjOt5p3+CFgo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KVdS+nve; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KVdS+nve"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774953951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ozmKvfV5MwKH+2q2ONSWKSmXsp4MUdjhhmL+DEGfOLM=;
	b=KVdS+nvetoON3RJc8N2gCtFkt81YK0xBarU6T+cp7yt31fPDs///uCnfQABIHj9+0N+Omn
	FcjGV5EiOpDlkIGH8GzTNepu2q9mxmwg5ltrrSH3K/yo19uKGEQRa6z07GhVK2DK2wOVsq
	j18QOLpCVOO7HfYRX96y4sMCa2p9V3Q=
From: Jackie Liu <liu.yun@linux.dev>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org
Subject: [PATCH] io_uring/rsrc: use io_cache_free() to free node allocated by io_rsrc_node_alloc()
Date: Tue, 31 Mar 2026 18:45:09 +0800
Message-ID: <20260331104509.7055-1-liu.yun@linux.dev>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Jackie Liu <liuyun01@kylinos.cn>

Replace kfree(node) with io_cache_free() in io_buffer_register_bvec()
to match all other error paths that free nodes allocated via
io_rsrc_node_alloc(). The node is allocated through io_cache_alloc()
internally, so it should be returned to the cache via io_cache_free()
for proper object reuse.

Fixes: 27cb27b6d5ea ("io_uring: add support for kernel registered bvecs")
Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
---
 io_uring/rsrc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 4fa59bf89bba..c4a7b29a327c 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -961,7 +961,7 @@ int io_buffer_register_bvec(struct io_uring_cmd *cmd, struct request *rq,
 	 */
 	imu = io_alloc_imu(ctx, blk_rq_nr_phys_segments(rq));
 	if (!imu) {
-		kfree(node);
+		io_cache_free(&ctx->node_cache, node);
 		ret = -ENOMEM;
 		goto unlock;
 	}
-- 
2.51.1

