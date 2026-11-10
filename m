Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298992;
	b=hmJ6conwevxA9HwYxCjQriK4zKKGiCt6cadijUbF72FgB+gtWnOwDtocGelsfO82xJ6/
	 Txf+bCGHdocf3o6jQsFzD6uL77nXFaynmvcKC7B154E/j8oNDtDJpddk0V7jqiP6rzely
	 uKpz6DK7QE62DQzfNf1D2grceGXE1tukZH819NzfljHUqAHqbRLcZOCvTIt/cA5Aoel2g
	 OBxveqAVYz3Fgzmas+nAEjq9mqunrQA1H2VJS4cteBlVlt9wQvdlyXqlXoLrk22OrRBrl
	 WkN//1jei/J8KgUT3U4KDHN+d+sJ0xyTCH/Kk7n8DtmGGzL+DHtIeykxsg2ygXUskaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298992;
	h=DMARC-Filter:DKIM-Signature:From:Subject:X-Original-From:
	 X-Lms-Return-Path:To:Cc:Date:Message-Id:Content-Type:Mime-Version:
	 X-Mailer:Content-Transfer-Encoding;
	bh=KnpGxHncAo0Zik1LXhxMT/JZ7malhv2rLRIQwcX0R+U=;
	b=1q9kXQmJT44rL/etelWSO4Hn605xFg5X5E4GRirJCMHlqtu8dhbU5eJfiWH8G/MQbnD7
	 6OcjD0QYdo3vhnh1DryXATFyl6hK2BakqZsgBSv13m4Y4KWT7VlJS0t+GqFkgMVzcK+cE
	 FRdrmiu5FVhYxVf1s/A1It7nqiJa7yY8E/6JA+Jv6mGFA2V1DbNRUshqqJqD/3xKAz9/6
	 zySEzdl0qrzVru4mFPRI7OkYc4cuol8+i3Qq8lNnOHPoP0lSXlSxR0SeX1VZozeR0Mvfj
	 9U7bB0JERqiluRLxPDc0BKZE2xe1FZdtCYRy6L6JlaTDTYdpj+7Hu0A+y8FvoXl1Nfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=QGv1NQJj;
	arc=none smtp.remote-ip=209.127.231.111
Received: from va-2-111.ptr.blmpb.com (va-2-111.ptr.blmpb.com [209.127.231.111])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B689606A31C
	for <io-uring@vger.kernel.org>; Tue, 10 Nov 2026 08:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B689606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=QGv1NQJj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794298985; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=KnpGxHncAo0Zik1LXhxMT/JZ7malhv2rLRIQwcX0R+U=;
 b=QGv1NQJjadlnxkDsZM4fwAN9W6UA7hzhdqZB1DapSdXAPjXFD6IK1t0SzTHkzFlEkN11pO
 3UCwhdywKJpMEBM1hB+OFYrMFIvLDVeddP+sZqVVE/3yVBrppM8nt0n8q+O8EgkGTV/mgP
 y6pxBSdsKl9eOTUPV0x4sPkBDDgRuL3SzvLb9pteOHMDA4OOghGpIlRltN2EDgh2SBghb+
 zqs5PwTKB+8PSPUffDL0drFkFX6uCGLuMoy9F8eN11l1vWUCKzjC0Fo6vc7iJcBf1WwiSp
 wn/5+QX0LtdW1L6LCKiDcb3XC3GmvjX+8TpKIjkuQGn083X6P6T+2zzBU5Pd4A==
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
Subject: [PATCH] io_uring: cancel pending poll activation on ring exit
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>
X-Lms-Return-Path: <lba+26af2d467+8954a8+vger.kernel.org+zhaogongyi@bytedance.com>
To: "Jens Axboe" <axboe@kernel.dk>
Cc: "Pavel Begunkov" <asml.silence@gmail.com>, <io-uring@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Date: Tue, 10 Nov 2026 16:22:46 +0800
Message-Id: <20261110082246.18986-1-zhaogongyi@bytedance.com>
Content-Type: text/plain; charset=UTF-8
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: 7bit

The first poll of a DEFER_TASKRUN ring queues activation task_work on
its submitter and takes a ctx reference. If the ring closes while the
work is pending and the submitter cannot run it, exit_work waits for
the reference and eventually warns.

Cancel pending activation before waiting for refs. If cancellation
succeeds, release its reference here; otherwise the callback does it.

Fixes: bca39f390585 ("io_uring: add lazy poll_wq activation")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Gongyi <zhaogongyi@bytedance.com>
---
 io_uring/io_uring.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 5db57bf675f0..bdf996955f68 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -2593,6 +2593,10 @@ static __cold void io_ring_exit_work(struct work_struct *work)
 	struct io_tctx_node *node;
 	int ret;
 
+	if (ctx->submitter_task &&
+	    task_work_cancel(ctx->submitter_task, &ctx->poll_wq_task_work))
+		percpu_ref_put(&ctx->refs);
+
 	do {
 		io_ring_ctx_cancel(ctx);
 

base-commit: 39c7210e970200f8b17de3767c73efe64173a95f
-- 
2.39.5 (Apple Git-154)
