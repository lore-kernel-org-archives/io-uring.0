Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793859284;
	b=PBaSVetkX4K9UZjpDU7nCTWxuN+d9xi7Eq0QonpBQnLLjb7qG27b0SUAVjPcJ0vb4qVH
	 9RBykorFjPGdCPjW7n119FUrZzIET8aahFbUqa6R0fSFhSjKzwY/Kl0JjizNSxiYGlqYp
	 wgwh6m1MgnLDdX9lc0C6fnl1omOVElBwGJAvgCEmGMqfSD1Zrk8UpA/s6vZ9X0zFuFK+9
	 Z+kD7/YjHZmtk+ur58a/vfOubOlfbu6ICGrzjnf81zAWPJwlYqxqc6NEB+5uWeuP0BvXE
	 KiQQSTVbWj5ohc3YM1fLPgvAMMTqsBaq3V68LH6CiM00KipRYx25nEBMZW3uvfzCeaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793859284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=U36Txc3YHDyJmUAwKRZH3QKFOSd9Ge1d4BD1cisI4v0=;
	b=Sj5GtRMsWeTe/8qZr7jNn6+FZJ53pDa/OTCT4H01jQq8CRfuln7ioUVh9BykjD/NHJz3
	 gClWWtizNO34bxNzZbd8f9oW8hBr7EW58vQgLz2LNcXtDhUpcyTe9MVO6CvTNAmw0ZSl7
	 htAbDwEaEaTYxu2oILTh9xMb22RY8g7ArLSeMC0oMctElPfS0rIXFY7tU4kjEYnDwSIyQ
	 DMTUDHuc4RYPh238wjz79Tf8FwtzMWhFX9fUK4O9suPyiDGi3NAPOl1zWI35b9H1pXVnH
	 SiN8WeWiNhqvWZzO6wE9Zj0tFTQGF0cqSHV/H+gro5zPq5wh0DXLabsb+LaGlHTzYIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="s/Ee9+Xo";
	arc=none smtp.remote-ip=74.125.231.193
Received: from mail-oi2-f1.google.com (mail-oi2-f1.google.com [74.125.231.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1295606A326
	for <io-uring@vger.kernel.org>; Thu,  5 Nov 2026 06:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1295606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s/Ee9+Xo
Received: by mail-oi2-f1.google.com with SMTP id 5614622812f47-539d2baa897so676725b6e.0
        for <io-uring@vger.kernel.org>; Wed, 04 Nov 2026 22:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793859282; x=1794464082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U36Txc3YHDyJmUAwKRZH3QKFOSd9Ge1d4BD1cisI4v0=;
        b=s/Ee9+Xo4LDQ1MArYxLd6K9zq/yI5dpCu9hbgjb73RDC7vIjiAHYy5YuaInU0ZF+uG
         IbMoH6bsEMPOuQnaiEU23F1el66kHy6+RLW1ARCRCXYXecfs+I93CstqiRoR/myBpNIb
         dTQE7rAgVlt3GEqOQEsqC3duFc67dYQuDUQDAKt62lz0o9lbxVhIUE0h3LobGGnIJdb0
         mOk8faBQraBXk9TtWuvQnMgdSpAIhne6aI2B3EmbhoOfaYgVncx/gfG8cONUo3aNkkKs
         9l0j0sG9l/7huXDZJE/tSSac+9ElbHbZAz3dvHMcu6hfLmcmHa8xTO9VdzjJpauwZ76k
         0cVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793859282; x=1794464082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U36Txc3YHDyJmUAwKRZH3QKFOSd9Ge1d4BD1cisI4v0=;
        b=uvbLqa+vfiOx2Z6iEUe6oUrvonBXmYCxVpcue2tWSyQPbdAHF35J5Z3HF6ypPQHizu
         qvPckqr+V6X400lQRnl+ypY5UOiurtQ8AWGeFcYlZY1p19NmOic2H7Jfu8LPJHxqAVDR
         yYf6gMu0hsmp7f68ZufI86LGhX3BM43z5oPabtq8bas/ixVgApUt9ixym7wQuW/Wy9gg
         9TJzgMD+HMR9FmJ8ZkKujPhat/pyH/ioRxdBr2T2Ul5l3wJ7p7cgUvh2HpBVu3MicgoD
         zqZ5VE57SgUQd6IPoQQSKj2YXX94HzauCoX51S+/Rb4kIVe0Y3NnLx29RDJxGZFNGghm
         fB7A==
X-Gm-Message-State: APuU4Z8mR4KF6ozm1IqqVWlvBOfrSttjOfp8L3FqsMVT/c/j41OvTFLP
	uSXqjU8aTXEtiDJgv0hK8OLE3t77OCvTPWteuSeUMv1e5tOAWKVErOfV
X-Gm-Gg: AYBFou2QUZTSheHlyKncLdKBN2vfzYRQt8mCXkkxjfepkHyN1WIZnWhISYHGLtkzQhB
	2lqYPT3BJS1GlAR7GYsoACAePNMabEmp8fpqoIhlTA2vZIMoBMIGDfuLKtJpNVusT9sWiwUek3w
	lPhCa5lk3q8wt7fiL84jrLqeleNedMiZ4wINLpDcKqdkzhc2q8AX8l/gDLbZ22tWfHqckNHBmbi
	0CePxQ/NAuHRgfNwCnpp4Wo/h/Vw7ds+cNXQhGloRhFMLZb6eQIyEwUbLE1KDFxi9ZNvi+o1ycY
	ZCjCQT+js8MpG6y7oYQUbb6KDCIC3BgzkjMmHu8ZegFOpmZZhLkpkEcF7v2H5FnUY08K+L3zaD3
	at9PDgmKaQpyuLBtNS6fZ1Maj8R4pGQ9tUmdK7/3mQZHcc1ZC5KGOAUCl2mIyY3rXGu6htbYdFt
	9RORJg5em8S6eOGF7gE+i3tXvXHUqse/lgFCAPDpIo0DfckIXFwnU0a9sBcjeSTYHaICDohMMcy
	PQQFCllEVldPWhx+vCap5PVBmhJ+w/6P4ZOsSITdyAl+EbiCFqDD33o3TJ8hEFrEj+imNtk9ziA
	0q+jaYEXh2PHeZ+s4Pf4TD+Tv21r+Zom+OGy/y94tRueX66wCvbiu1fZlghiMnlFIoAC
X-Received: by 2002:a05:6808:3383:b0:4fa:4b2b:5869 with SMTP id 5614622812f47-5640ddc3bebmr12496211b6e.38.1793859282632;
        Wed, 04 Nov 2026 22:14:42 -0800 (PST)
Received: from localhost.localdomain ([14.116.239.39])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9ef6e3bsm3469009b6e.5.2026.11.04.22.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 22:14:41 -0800 (PST)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	stable@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH] io_uring/kbuf: fix cross-mm interpretation of provided buffers
Date: Thu,  5 Nov 2026 14:14:33 +0800
Message-ID: <20261105061433.1947491-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Legacy provided buffers store a raw user virtual address.  It is
recorded in io_add_buffers() and later returned verbatim by
io_provided_buffer_select().  The consumer (recv, send, read)
imports it as a user pointer, so it is resolved in the address
space of whichever task issues the request.  Nothing ties a buffer
to the address space it was provided from.

When a ring is shared between tasks with different address spaces,
for example across fork(2) and execve(2), a consuming request reads
from or writes to an address chosen by the provider, in the
consumer's address space.

Record the providing task's mm in each buffer, and refuse selection
when the consuming task runs under a different mm.  The buffer stays
queued for its owner and the request fails with -ENOBUFS.  The mm
reference is held while the buffer is queued.

This issue was discovered by Tencent CodeBuddy Security.

Reported-by: zeroday zhao <zerodayzhao@tencent.com>
Fixes: ddf0322db79c5 ("io_uring: add IORING_OP_PROVIDE_BUFFERS")
Cc: stable@vger.kernel.org
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 io_uring/kbuf.c | 23 ++++++++++++++++++++---
 io_uring/kbuf.h |  2 ++
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/io_uring/kbuf.c b/io_uring/kbuf.c
index abf44f5dba26a..b585105a17202 100644
--- a/io_uring/kbuf.c
+++ b/io_uring/kbuf.c
@@ -4,6 +4,7 @@
 #include <linux/fs.h>
 #include <linux/file.h>
 #include <linux/mm.h>
+#include <linux/sched/mm.h>
 #include <linux/slab.h>
 #include <linux/namei.h>
 #include <linux/poll.h>
@@ -97,12 +98,18 @@ static int io_buffer_add_list(struct io_ring_ctx *ctx,
 	return xa_err(xa_store(&ctx->io_bl_xa, bgid, bl, GFP_KERNEL));
 }
 
+static void io_kbuf_free(struct io_buffer *buf)
+{
+	mmdrop(buf->mm);
+	kfree(buf);
+}
+
 void io_kbuf_drop_legacy(struct io_kiocb *req)
 {
 	if (WARN_ON_ONCE(!(req->flags & REQ_F_BUFFER_SELECTED)))
 		return;
 	req->flags &= ~REQ_F_BUFFER_SELECTED;
-	kfree(req->kbuf);
+	io_kbuf_free(req->kbuf);
 	req->kbuf = NULL;
 }
 
@@ -124,7 +131,7 @@ bool io_kbuf_recycle_legacy(struct io_kiocb *req, unsigned issue_flags)
 		list_add(&buf->list, &bl->buf_list);
 		bl->nbufs++;
 	} else {
-		kfree(buf);
+		io_kbuf_free(buf);
 	}
 	req->flags &= ~REQ_F_BUFFER_SELECTED;
 	req->kbuf = NULL;
@@ -140,6 +147,14 @@ static void __user *io_provided_buffer_select(struct io_kiocb *req, size_t *len,
 		struct io_buffer *kbuf;
 
 		kbuf = list_first_entry(&bl->buf_list, struct io_buffer, list);
+		/*
+		 * The buffer address is a user virtual address that gets
+		 * interpreted in the address space of whoever issues the
+		 * request. Refuse consumption by a different mm than the
+		 * one that provided the buffer.
+		 */
+		if (unlikely(kbuf->mm != current->mm))
+			return NULL;
 		list_del(&kbuf->list);
 		bl->nbufs--;
 		if (*len == 0 || *len > kbuf->len)
@@ -452,7 +467,7 @@ static int io_remove_buffers_legacy(struct io_ring_ctx *ctx,
 		nxt = list_first_entry(&bl->buf_list, struct io_buffer, list);
 		list_del(&nxt->list);
 		bl->nbufs--;
-		kfree(nxt);
+		io_kbuf_free(nxt);
 		cond_resched();
 	}
 	return i;
@@ -575,6 +590,8 @@ static int io_add_buffers(struct io_ring_ctx *ctx, struct io_provide_buf *pbuf,
 		buf->len = min_t(__u32, pbuf->len, MAX_RW_COUNT);
 		buf->bid = bid;
 		buf->bgid = pbuf->bgid;
+		buf->mm = current->mm;
+		mmgrab(buf->mm);
 		addr += pbuf->len;
 		bid++;
 		cond_resched();
diff --git a/io_uring/kbuf.h b/io_uring/kbuf.h
index 401773e1ef805..fe0b01c475a49 100644
--- a/io_uring/kbuf.h
+++ b/io_uring/kbuf.h
@@ -44,6 +44,8 @@ struct io_buffer_list {
 
 struct io_buffer {
 	struct list_head list;
+	/* mm of the task that provided this buffer, see io_add_buffers() */
+	struct mm_struct *mm;
 	__u64 addr;
 	__u32 len;
 	__u16 bid;
-- 
2.43.7

