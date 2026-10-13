Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B083B1EE7;
	Tue, 13 Oct 2026 12:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791894261; cv=none; b=G5SGcawFdRtr6OulZLqSy8gFnqf8RGmZw3KtsENLpALmWPlo4RJOf6BETVj839XVMrX6sgNPGGhOA7mwcdDWS1g8Y99UOG+Hbai6ZLLDVGCKOb6R8We0jfcX7K/zY4nGiOE0at3gcPSL+bd8tEpM+qyk5y4WNL/6OTOgFB+lE9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791894261; c=relaxed/simple;
	bh=1hB8g4XHlANovu3FaNUCkJBwwk7w+eojz/ez6TMSc/w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i2xBKN9hlIYUIzqRNXXYv7JsiyV2jBwdRRim4PwY/XnrAIzmWunaL9ZsBcLxwjCfM/BmkgAFXH0hn4wnrvmqqaI0BTIirs4LhuUJb13fLGPjz3yXyNe6jSY64FNrNeJAfJz7HiSarT9DpSSChPkz7GtwC3vl7ApbUSL2pJ/5DDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WeoA/jlZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WeoA/jlZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2879F1F00893;
	Tue, 13 Oct 2026 12:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791894259;
	bh=wm6fP7ffHfOOWbs3rK4tnW3NjNxRwg4EJ7QU17IOR9g=;
	h=From:To:Cc:Subject:Date;
	b=WeoA/jlZB98adhuRgqfDIvxUYKNM1rmc2jOuxQMnFRQ5c3IoiS6I4ghpghfJmKv47
	 vu/vWBhiOQUEBso0MBZfLNxWXUCYglK50BnSZzYeHLB/yULHKYlmlSEKeB/x4tBms5
	 VkCf/RFulcPktwRmXiMBQG/oxuR3wP+HGyMokCBzuxNqCREgNRv5vwm8Q+Y3ob9xbu
	 mrM69UglRGS94gN2RFfUEqdkeFdYqgZkiaZpPLGRj60JzFOqq3/itIhsxppzCOT93S
	 yaXYjv6g6jHZelQcqV6cZouxqh5xX04DsfnqiH66OuBQggeruuPkJbhIAFTQ3kRh6b
	 nI5/igvk3aQFQ==
From: Sasha Levin <sashal@kernel.org>
To: Jens Axboe <axboe@kernel.dk>,
	Pavel Begunkov <asml.silence@gmail.com>
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] io_uring/rsrc: fix build without DMA_SHARED_BUFFER
Date: Tue, 13 Oct 2026 08:24:17 -0400
Message-ID: <20261013122417.3-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

io_register_dmabuf_desc() calls io_register_dmabuf() unconditionally, but
io_uring/dma-buf.o is only built with CONFIG_DMA_SHARED_BUFFER enabled.
This causes an undefined reference to io_register_dmabuf() when linking
kernels with CONFIG_IO_URING=y and CONFIG_DMA_SHARED_BUFFER=n, as reported
by KernelCI for i386 allnoconfig and ARC haps_hs_smp_defconfig builds.

Move the configuration check from io_register_dmabuf() to
io_register_dmabuf_desc(), before allocating the resource node and mapped
buffer. This lets the compiler eliminate the call when DMA-BUF support
is disabled and rejects DMA-BUF registration with -EOPNOTSUPP. The check
in io_register_dmabuf() cannot handle this configuration because its
object file is not built.

Fixes: 4bb797852328 ("io_uring/rsrc: add dmabuf backed registered buffers")
Reported-by: kernelci.org bot <bot@kernelci.org>
Closes: https://d.kernelci.org/i/maestro:0c0fb2ae8f67a98485b9c0cd122f4e5d5156c481
Closes: https://d.kernelci.org/i/maestro:c4ceb57bdf62b29a8c2fdc83e22c1d5594f06460
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 io_uring/dma-buf.c | 2 --
 io_uring/rsrc.c    | 3 +++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/io_uring/dma-buf.c b/io_uring/dma-buf.c
index f40c9d87ed8aa..04dd41bf53be0 100644
--- a/io_uring/dma-buf.c
+++ b/io_uring/dma-buf.c
@@ -18,8 +18,6 @@ int io_register_dmabuf(struct io_ring_ctx *ctx,
 	struct dma_buf *dmabuf = NULL;
 	int ret;
 
-	if (!IS_ENABLED(CONFIG_DMA_SHARED_BUFFER))
-		return -EOPNOTSUPP;
 	if (ctx->flags & IORING_SETUP_IOPOLL)
 		return -EOPNOTSUPP;
 	if (desc->uaddr || desc->size)
diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index d6f7cbf731eb2..00f5ed6051e0b 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -907,6 +907,9 @@ static struct io_rsrc_node *io_register_dmabuf_desc(struct io_ring_ctx *ctx,
 	struct io_mapped_ubuf *imu = NULL;
 	int ret;
 
+	if (!IS_ENABLED(CONFIG_DMA_SHARED_BUFFER))
+		return ERR_PTR(-EOPNOTSUPP);
+
 	node = io_rsrc_node_alloc(ctx, IORING_RSRC_BUFFER);
 	if (!node)
 		return ERR_PTR(-ENOMEM);
