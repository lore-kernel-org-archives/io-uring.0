Received: from sender-of-o55.zoho.eu (sender-of-o55.zoho.eu [136.143.169.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537583FBEB7;
	Thu, 19 Mar 2026 20:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773953371; cv=pass; b=txs3UizBl2y8rxV5wQ/KZjNQeFUiEulHnsxFz+NWINudwcJIec2xGBVK2U+6ZlgmxK04yAIY82eBua7/b0Vtmt6lz2AP3keeP+1zTyzc89Wdao1kgWUXTOLyjKZbQrQgORgPm8DsJMBBcWbkQc3lNHqosh/MLBi9LUzD7zU7ouA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773953371; c=relaxed/simple;
	bh=BArOMpHKDJy54B/g/Seym2ZWvB0IPL4VYXhZ6Fq2qa0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tEUj4dTRIDpE7ZNYNZQpFvFDktl17UyK0MG0zh60RKg7bpMe8fZCDcx0fIJ0RybACEZwhTEgwEz5iXIewjdzyqG2TuW5rCbQgMLhxO/NiZE50k2g1bPnu5RdvBndNu/Vk17lRAqyF3s3ZYJMUwa/nKYcmHkEZ1du1mLJuQNAVbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org; spf=pass smtp.mailfrom=objecting.org; dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b=hPAS78Be; arc=pass smtp.client-ip=136.143.169.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=objecting.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b="hPAS78Be"
ARC-Seal: i=1; a=rsa-sha256; t=1773953363; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=aS4oI4+6hywi+wSUn3bv0PEW/ijc9DbAsxitQXTIgeeZjs6Ym44+PFZHsJC/U/5jpnzcu9thOYC1AdG2sJFT45q33V9+vHk4ZwqrE7iBF9fPXQbmUR9ETx9IcoBd8ErvMf0rDcZzIv7T99VdZT7QIOlDDEDmd0gTTyZ+m/jP2XY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1773953363; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=S6cZpLG1848+pdJ3RIZkFYtOoSISfM1xOzDK1vMv/LU=; 
	b=MMExzmsSHPRq9V6/G+ZHhXgt8MJO+30Fkr4+LUL2rzg+Depne8CyyAki2yPzXhXxaM+rs3wmQfmJPm+dw1Weu3J2IKRFIzL8eWsW3xme5oahdhkcH3tmy5tfeu1z8WMD4tgXDkgHz3OLZprM4vx0JTCG7c1fJM4orH1E0NyCiNs=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=objecting.org;
	spf=pass  smtp.mailfrom=objecting@objecting.org;
	dmarc=pass header.from=<objecting@objecting.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773953363;
	s=zmail; d=objecting.org; i=objecting@objecting.org;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=S6cZpLG1848+pdJ3RIZkFYtOoSISfM1xOzDK1vMv/LU=;
	b=hPAS78BeCN+v3BjygI70LJLUq+NK1ojPNnMn8N4uGW3MBFJZ402TmHLC1XDrajA3
	cPH/TcBiqYuw9EgTtzyawld64koV5edVDA5dK9zYwk82bHurXsFojgvOB1PY2tTq65W
	MYgyxUb9/axeX0uezeBFI005VoAwP5WT3CNw5suE=
Received: by mx.zoho.eu with SMTPS id 1773953360678762.3047544469915;
	Thu, 19 Mar 2026 21:49:20 +0100 (CET)
From: Josh Law <objecting@objecting.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH] io_uring: flush deferred completions in io_req_post_cqe32()
Date: Thu, 19 Mar 2026 20:49:19 +0000
Message-Id: <20260319204919.13403-1-objecting@objecting.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

io_req_post_cqe32() is missing the deferred completion flush that its
sibling io_req_post_cqe() has. Without flushing pending deferred
completions before posting a 32-byte CQE, multishot CQEs can be
delivered to userspace out of order.

Add the same flush check that io_req_post_cqe() performs.

Signed-off-by: Josh Law <objecting@objecting.org>
---
 io_uring/io_uring.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 9a37035e76c0..43d2f2b0830d 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -881,6 +881,14 @@ bool io_req_post_cqe32(struct io_kiocb *req, struct io_uring_cqe cqe[2])
 	struct io_ring_ctx *ctx = req->ctx;
 	bool posted;
 
+	/*
+	 * If multishot has already posted deferred completions, ensure that
+	 * those are flushed first before posting this one. If not, CQEs
+	 * could get reordered.
+	 */
+	if (!wq_list_empty(&ctx->submit_state.compl_reqs))
+		__io_submit_flush_completions(ctx);
+
 	lockdep_assert(!io_wq_current_is_worker());
 	lockdep_assert_held(&ctx->uring_lock);
 
-- 
2.34.1

