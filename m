Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A173655E0
	for <io-uring@vger.kernel.org>; Wed,  2 Sep 2026 02:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788315977; cv=none; b=gVofs6mxP3xjPLdpTfVK/yAwI8rUJlcFO9oRJc6fXtGK4lrM8lj0Mavttp7TrO3Xg0ebktHlnbTrL2aDzjRva8Mqv7BM1xh+oJlV1km/NEo681Ld8XixQ1rUpUUHsXKoJ7o4LUTHUdnMgDD8D+Wbf5VLuhI3R4VGbZ9H4HNvfJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788315977; c=relaxed/simple;
	bh=IZmZlvs0yOgGUeyXvD/ZCuE8dv8pSbahU+m/BiYNON8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P9lY+YTVp7O85WFmcGZhbbKf8m2rKFe2yUByRsazYNRHePEkP6glNVkYPpoX3/zVCGEBo5AV4XOz/4moIq+IaodATGQDg7PAFYKXGA9c/mAcR4TYScyHgJD8WHD50XBbYTKraocbc6pr9pP8t5aNtG1Hjz4XvluhZvav/wd/JzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKl1W4ik; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKl1W4ik"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8485b358552so505454b3a.2
        for <io-uring@vger.kernel.org>; Tue, 01 Sep 2026 19:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788315975; x=1788920775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xx1JaFVwC4kXUUhQCfu4rODzl50O3heMJpCp/C+SDcQ=;
        b=KKl1W4ikN3PIGBIIQ4mj7Tcek98MBpZHaGKZ/7M/OkFkiBZhi8VqoaBPRtdFb5+yDM
         gU2QSNGrmND1kVb7InGJ0fOZVBTaBhIjKZQdIeFsaa3ZVJKjh0XEm4z1lthiHNWoS0Cu
         uKKqOdbldo0LVRYCi4jlbo/Vmf+D9c+7Dq+yXORTvKs6n+mn0nPladPgT07hdxEZCTyl
         EgUUs0eZs9oWWB9tbZYj5ofymAIUmZWu3dTxh0+gdupgRsbIiu1ZyCuFVWO488jwoacl
         YlN8sCeCkNbaq3+XlFbf/qocU//JOcuGR2ipn+5TR49M6fPQpPf5ziMilcWQyyzOmUrM
         zIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788315975; x=1788920775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xx1JaFVwC4kXUUhQCfu4rODzl50O3heMJpCp/C+SDcQ=;
        b=KgtI2NeIqLi8MDpBff4mwCDcC3Bcq/+NVq7lBSE+8oyRCcG+pL9TnoZt+Po4ixuWh1
         rzw8JTX4lZBa/C9fEuhMb74Gge7cyYWL2jFj6Bp86YQI3HzTpZqF8WaGwNnf9JjlUSLV
         24D/IAMuFhKo+iwejfguamxyx1lQrLw634/1ejhWKxztoS6zgx17xH4tj4miNGb4YbXD
         nRdUC5vsaS4+oIseVE9dExH/GqWPRqEGkRmEq3RRkR+K1v/L85+kqn+lARAt6Bigo8gv
         TsAeP5VoVKY8+GuIv2znuQhlVXkuDZDROPd93aT+KKn3+Tc0woLSrjQAXzXb5KmLRxCM
         RmFg==
X-Gm-Message-State: AFuF++k2MvyEpmYmusvAAdVZ4yx+Ga/k5CGaNULB8x/mhJfZ4g57OR09
	q61yn+E3lZFBn2QRtiFczQpTHIH837EjBgTyxGpfBufSI0NG6ikaE5BGRV+fqo6Z
X-Gm-Gg: AYBFou2gVGrdm0qKo8ZnxrL4fUWMIcc6ZwJ3id61G3fi/k/1fLd0X97FxPOwqOtuyEF
	EYLaEivioJNQ1/7elR5QDwBN5OFCFZThQPH/Bjh2T3zvcc7/HpAeNf237vrEu8V3mQye1XLxthp
	+Ddsaxc0qHLJJiCehpN4hV/taUkoHo+wV7P4ZVDBAMX7n7aoYHSYjoKK/iJzyUSYICkPnDLOcvl
	scPX1ztqAefMJ1yW09AKqMB1haZmGlyzo1oSr0el7L3ZI7hpYBDeIGAAkncOWV1ybUNs5oqTYrT
	EttsP2IWnfiGgPfC3iP7Jc6vul44tsaM8ybINR0a1JUABcMlOP1WRj6h7LTtIXFjBi02SWOyt2E
	vAlg5HqHuEYkYFz/fe4n8Na6bKmOzVJscH6MTWhhAzf8UqAT0yYe0z2xspOUFGLJFmJbcNIyHx4
	36sC31gv+Zw4oegwlEw8cU+S9Jo9OFmm2/s0arF5od3M7mavkrJXhrap7DelO/avk+k2qgV+4fQ
	cT/ykuoBRgx7TL7OcsmJdyheg==
X-Received: by 2002:a05:6a00:138a:b0:85c:3922:25d5 with SMTP id d2e1a72fcca58-85ed3f6e681mr2761201b3a.21.1788315975016;
        Tue, 01 Sep 2026 19:26:15 -0700 (PDT)
Received: from localhost.localdomain ([117.88.121.70])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc11fae83sm568560b3a.59.2026.09.01.19.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 19:26:14 -0700 (PDT)
From: Aohan Mei <ljp1205831794@gmail.com>
To: io-uring@vger.kernel.org
Cc: axboe@kernel.dk,
	Aohan Mei <henrymei@tencent.com>,
	TencentOS Corvus AI <corvus@tencent.com>,
	stable@vger.kernel.org
Subject: [PATCH] io_uring/net: commit all consumed buffers on bundle recv retry
Date: Wed,  2 Sep 2026 10:25:47 +0800
Message-ID: <20260902022552.1890610-1-ljp1205831794@gmail.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aohan Mei <henrymei@tencent.com>

For a bundle receive (IORING_RECVSEND_BUNDLE) using a provided
buffer ring, the initial issue peeks N buffers and defers the
commit via REQ_F_BUFFERS_COMMIT. If MSG_WAITALL (or a short read
on a streaming socket) yields a partial result,
io_net_kbuf_recyle() commits only the buffers covering that first
partial round and clears REQ_F_BUFFERS_COMMIT. On subsequent poll
armed retries, sel.buf_list is reset to NULL while
REQ_F_BUFFER_RING prevents re-selection, so neither the retry
rounds nor the final io_recv_finish() -> io_put_kbufs() ever
commit the remaining buffers that have already been written to.

This leaves bl->head accounting for only the first partial round
rather than all consumed buffers. Buffers that already hold
received data stay visible in the ring and are handed out again
to later requests, corrupting or dropping application data.

Defer the commit entirely: do not commit in io_net_kbuf_recyle(),
keeping REQ_F_BUFFERS_COMMIT set for the final completion; recover
the buffer list on retry so the final commit has it available; and
derive the number of committed buffers from the total received
bytes rather than the final round, so a short last read cannot
under-count.

Fixes: 41b70df5b38b ("io_uring/net: commit partial buffers on retry")
Reported-by: TencentOS Corvus AI <corvus@tencent.com>
Cc: stable@vger.kernel.org
Assisted-by: CodeBuddy:Kimi-K3
Signed-off-by: Aohan Mei <henrymei@tencent.com>
---
 io_uring/kbuf.c | 4 ++--
 io_uring/kbuf.h | 2 ++
 io_uring/net.c  | 7 ++++---
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/io_uring/kbuf.c b/io_uring/kbuf.c
index 7c309173dd19..c4bae8f00173 100644
--- a/io_uring/kbuf.c
+++ b/io_uring/kbuf.c
@@ -76,8 +76,8 @@ bool io_kbuf_commit(struct io_kiocb *req,
 	return true;
 }
 
-static inline struct io_buffer_list *io_buffer_get_list(struct io_ring_ctx *ctx,
-							unsigned int bgid)
+struct io_buffer_list *io_buffer_get_list(struct io_ring_ctx *ctx,
+					  unsigned int bgid)
 {
 	lockdep_assert_held(&ctx->uring_lock);
 
diff --git a/io_uring/kbuf.h b/io_uring/kbuf.h
index 401773e1ef80..7079f2dec9e0 100644
--- a/io_uring/kbuf.h
+++ b/io_uring/kbuf.h
@@ -71,6 +71,8 @@ struct io_br_sel io_buffer_select(struct io_kiocb *req, size_t *len,
 				  unsigned buf_group, unsigned int issue_flags);
 int io_buffers_select(struct io_kiocb *req, struct buf_sel_arg *arg,
 		      struct io_br_sel *sel, unsigned int issue_flags);
+struct io_buffer_list *io_buffer_get_list(struct io_ring_ctx *ctx,
+					  unsigned int bgid);
 int io_buffers_peek(struct io_kiocb *req, struct buf_sel_arg *arg,
 		    struct io_br_sel *sel);
 void io_destroy_buffers(struct io_ring_ctx *ctx);
diff --git a/io_uring/net.c b/io_uring/net.c
index fbe719d86c46..bff4514c0100 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -483,8 +483,6 @@ static int io_net_kbuf_recyle(struct io_kiocb *req, struct io_buffer_list *bl,
 			      struct io_async_msghdr *kmsg, int len)
 {
 	req->flags |= REQ_F_BL_NO_RECYCLE;
-	if (req->flags & REQ_F_BUFFERS_COMMIT)
-		io_kbuf_commit(req, bl, len, io_bundle_nbufs(kmsg, len));
 	return IOU_RETRY;
 }
 
@@ -877,7 +875,8 @@ static inline bool io_recv_finish(struct io_kiocb *req,
 	if (sr->flags & IORING_RECVSEND_BUNDLE) {
 		size_t this_ret = sel->val - sr->done_io;
 
-		cflags |= io_put_kbufs(req, this_ret, sel->buf_list, io_bundle_nbufs(kmsg, this_ret));
+		cflags |= io_put_kbufs(req, this_ret, sel->buf_list,
+				       io_bundle_nbufs(kmsg, sel->val));
 		if (sr->flags & IORING_RECV_RETRY)
 			cflags = req->cqe.flags | (cflags & CQE_F_MASK);
 		if (sr->mshot_len && sel->val >= sr->mshot_len)
@@ -1221,6 +1220,8 @@ int io_recv(struct io_kiocb *req, unsigned int issue_flags)
 			goto out_free;
 		}
 		sr->buf = NULL;
+	} else if (req->flags & REQ_F_BUFFER_RING) {
+		sel.buf_list = io_buffer_get_list(req->ctx, sr->buf_group);
 	}
 
 	kmsg->msg.msg_flags = 0;
-- 
2.43.7

