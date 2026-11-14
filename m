Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626192;
	b=vh2k4YQL78dvPMx7TshpBeJfhd1G/uyky8iXleXCkZYgIK7qKlhNAGDCA7Y/qfH1JZNw
	 EnCE22laBK3fhbsQ3z/7m94PHG6TxKrbyw24HZfMKRXQWuPJQClYJKhL6MWIZa34vkjk3
	 CYCr1oleSH/+YaGCuolowsBtCtSp9UxSgBiPM0JqHRQ7z4iQ7HvlSu7VqXpwqPVjY7wCJ
	 svZP1HeDOYWxlzDRtN7l8JrY94/AtKegQXJVHSytZbGfIko9N6XtZexlA1L3xDGYy3aYj
	 qpRMYQkjiSZAtTEFrU8UQWitHcEUUArblvPVKwerx1XAjAuWn47LRmLxc70ztp0xTYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=JYd7CUxb/p4xrALqV144eF7TyrHpeqEZlkYLppOjORI=;
	b=viuHDlw4Ai57Yyc5FDeiEcK5ago68EW2DxAVOHPIYq1ovS09hnMS1kG8eflb7GaBPx32
	 Z32YCIrB4Q3Danl/xEeWuUujzn+1H+vf3qa87GYuPd+ABDt1ahnhuRIJ4QaAoUYDq+kOq
	 kt3jX1IpeqxQgOrJWl3tzB24+5Zgow6/xTI5G5V7BnOBJkjH0YEx7S3muVmLt2LQpa42k
	 EIUpSXC9zAgoU1qAYnD35KlqBhgwsdGDKQxxGeZxEPqhrwOt4pH+Q+We+owpfhZ+Ry9qz
	 NhQioALVZdZcNfL+37/kdeRCx2b+Y8VbRkKSs440XJZXyAVHyoGy1GjLMztBTmMVRTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=R21hui57;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22E7606A8B9
	for <io-uring@vger.kernel.org>; Sat, 14 Nov 2026 03:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A22E7606A8B9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=R21hui57
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ad0c2e71ebso226457a91.2
        for <io-uring@vger.kernel.org>; Fri, 13 Nov 2026 19:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794626189; x=1795230989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JYd7CUxb/p4xrALqV144eF7TyrHpeqEZlkYLppOjORI=;
        b=R21hui57STRkCCrEumC3lK+XUmkC4R2VO37jAS19kA7Ldig3zuVsH7/7pKXiGV8bbb
         GsivlZEjDqZax1bpyfPMkH2nssX8bR3iP1xmHnSvU1UthGTi8RrXiElB2jtrqi31BP1a
         kf0npu29SqegWxZmZdlIvYadKnTIHLhE1FJ9yE8zrPCYsVcvPxkMjQFILNH4HObHtJ4n
         Jvx5ugReIjHuLMA7Gc1OOt1syBXlY7QQammvisu9R9R7oDQfIT+ZrTUGu26Ax2ksuLVL
         9DdnsLztK6XDCRYYgG2KVehKs1CmyxlJGv5DnM3gEQsk8b8wZ2jMawzpXQ1zanVz9Z9w
         PVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626189; x=1795230989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JYd7CUxb/p4xrALqV144eF7TyrHpeqEZlkYLppOjORI=;
        b=Jgq5FOTibzlDkCjTH7kRZbmqD8ZtuJ+QfkzUz5kZf0ayKek60rA1uL4pSSYhT5dPHG
         x8G4/U2QDrwmlW6P1smLqEpG0MfEpPvhitbw0/rQdV/EwteSAjHT2wJvzQi7oUVIrMfk
         hQyZgtjU3Dt6BTLxmzZ/BIbLEXGipK4fIHioQZ7WPL5gT7mO5x/9qqsrYwIhFs2mSzjH
         Hno7lveNYaLdJ5Mxm2KpN+bWhl5UqbW1iwEel1cu/Kq7r4gV/i3mW5IX8H/tkp1DVbq2
         FZDxBaJBOfO+cS0kP+VZi6X29Wp4VvFWDtJ9GhaOgD5G4kl38FvylI092DhBOB573Mt0
         YIUQ==
X-Gm-Message-State: APuU4Z//oG2uxYBfYbJPHonSQ2i7Em/b9QSJYI1wx2J5tivWM2VPegC/
	kHASypEZ36mon1gm6Swra/SmkpQ7mhvaLu6jOBSSersO2bTL72Ga0ejQ+fYn7bu0VdpaoEZcTPX
	/xWKIHtx6p5MXDidENY2ySemV3b4nrReICM0EpKRHfAcoUBuhBu7W
X-Gm-Gg: AYBFou0n7O9/i/C4Y9CWiMblwBcdxPyc96XgIEnTji+JWRLLEbvJumLLv0q0Nu7NMTv
	TJnljwdqVz6WWCBFqRHyfVZvhnKmuUHWsvKgOchC7uVg1pjvEFj079+xByMuUWVr7ZcPKuyNShQ
	rT+bwkyqtI97twncspwTzPnMaANeP4FosKX+w8Ia+S9SNiIwjU1m/NcOljCDgFgYYSMk29r1kfk
	zc0luhBuEMkvt60oGgoqrarcECCY6AbNeVxOEn0L3qUzuAkKzMMQ428cBlysUHCWdwzfY8xC6Zf
	bzPY3qEspZt3SVqWP61IAK3414HK4/B2iLnfI9x5EEaTwlgS+X+9zGGJoBNjUXpVriW9I4xx0qG
	lyyARbRhJxx9SBJRM
X-Received: by 2002:a17:90b:590e:b0:3a6:e1d1:e511 with SMTP id 98e67ed59e1d1-3b1b0b85d16mr6639246a91.4.1794626188946;
        Fri, 13 Nov 2026 19:16:28 -0800 (PST)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1d1d744e2sm163992a91.1.2026.11.13.19.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:16:28 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [IPv6:2620:125:9025:23::204])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id BD77C40229;
	Fri, 13 Nov 2026 20:16:27 -0700 (MST)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id BB26CE4049B; Fri, 13 Nov 2026 20:16:27 -0700 (MST)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 4/4] io_uring: use io_req_{set,clear,switch}_flags()
Date: Fri, 13 Nov 2026 20:16:21 -0700
Message-ID: <20261114031621.2924144-5-csander@purestorage.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114031621.2924144-1-csander@purestorage.com>
References: <20261114031621.2924144-1-csander@purestorage.com>
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

Replace manual req->flags |= flags and req->flags &= ~flags with calls
to io_req_set_flags() and io_req_clear_flags(), respectively. This
ensures the flags field is written with a 64-bit store to prevent
store-to-load forwarding failures.

Since io_req_set_flags() and io_req_clear_flags() store to req->flags
with volatile writes, consecutive req->flags updates won't be able to be
combined by the compiler. So combine setting/clearing multiple flags
into a single io_req_set_flags(), io_req_clear_flags(), or
io_req_switch_flags() call where possible.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 include/linux/io_uring.h | 10 ++++-----
 io_uring/advise.c        |  4 ++--
 io_uring/cancel.c        |  2 +-
 io_uring/dma-buf.h       |  4 ++--
 io_uring/fs.c            | 25 +++++++++-------------
 io_uring/futex.c         |  4 ++--
 io_uring/io_uring.c      | 38 ++++++++++++++++-----------------
 io_uring/io_uring.h      |  8 +++----
 io_uring/kbuf.c          | 31 +++++++++++++++------------
 io_uring/kbuf.h          |  4 ++--
 io_uring/msg_ring.c      |  4 ++--
 io_uring/net.c           | 46 ++++++++++++++++++++--------------------
 io_uring/nop.c           |  2 +-
 io_uring/openclose.c     |  6 +++---
 io_uring/poll.c          | 20 +++++++++--------
 io_uring/refs.h          |  4 ++--
 io_uring/rsrc.c          | 10 ++++-----
 io_uring/rw.c            | 28 ++++++++++++------------
 io_uring/splice.c        |  4 ++--
 io_uring/statx.c         |  3 +--
 io_uring/sync.c          |  6 +++---
 io_uring/timeout.c       |  8 +++----
 io_uring/truncate.c      |  2 +-
 io_uring/uring_cmd.c     |  8 +++----
 io_uring/xattr.c         |  8 +++----
 25 files changed, 142 insertions(+), 147 deletions(-)

diff --git a/include/linux/io_uring.h b/include/linux/io_uring.h
index c70f7887ea72..ed4c849c8b71 100644
--- a/include/linux/io_uring.h
+++ b/include/linux/io_uring.h
@@ -32,15 +32,15 @@ static inline void io_req_clear_flags(struct io_kiocb *req,
 	io_req_switch_flags(req, flags, 0);
 }
 
 static inline void req_set_fail(struct io_kiocb *req)
 {
-	req->flags |= REQ_F_FAIL;
-	if (req->flags & REQ_F_CQE_SKIP) {
-		req->flags &= ~REQ_F_CQE_SKIP;
-		req->flags |= REQ_F_SKIP_LINK_CQES;
-	}
+	io_req_flags_t flags = REQ_F_FAIL;
+
+	if (req->flags & REQ_F_CQE_SKIP)
+		flags |= REQ_F_SKIP_LINK_CQES;
+	io_req_switch_flags(req, REQ_F_CQE_SKIP, flags);
 }
 
 static inline void io_req_set_res(struct io_kiocb *req, s32 res, u32 cflags)
 {
 	req->cqe.res = res;
diff --git a/io_uring/advise.c b/io_uring/advise.c
index 0073f74e3658..70536352f1c2 100644
--- a/io_uring/advise.c
+++ b/io_uring/advise.c
@@ -39,11 +39,11 @@ int io_madvise_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	ma->addr = READ_ONCE(sqe->addr);
 	ma->len = READ_ONCE(sqe->off);
 	if (!ma->len)
 		ma->len = READ_ONCE(sqe->len);
 	ma->advice = READ_ONCE(sqe->fadvise_advice);
-	req->flags |= REQ_F_FORCE_ASYNC;
+	io_req_set_flags(req, REQ_F_FORCE_ASYNC);
 	return 0;
 #else
 	return -EOPNOTSUPP;
 #endif
 }
@@ -87,11 +87,11 @@ int io_fadvise_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	fa->len = READ_ONCE(sqe->addr);
 	if (!fa->len)
 		fa->len = READ_ONCE(sqe->len);
 	fa->advice = READ_ONCE(sqe->fadvise_advice);
 	if (io_fadvise_force_async(fa))
-		req->flags |= REQ_F_FORCE_ASYNC;
+		io_req_set_flags(req, REQ_F_FORCE_ASYNC);
 	return 0;
 }
 
 int io_fadvise(struct io_kiocb *req, unsigned int issue_flags)
 {
diff --git a/io_uring/cancel.c b/io_uring/cancel.c
index e3d9fe8fc982..22c6438df188 100644
--- a/io_uring/cancel.c
+++ b/io_uring/cancel.c
@@ -245,11 +245,11 @@ int io_async_cancel(struct io_kiocb *req, unsigned int issue_flags)
 	int ret;
 
 	if (cd.flags & IORING_ASYNC_CANCEL_FD) {
 		if (req->flags & REQ_F_FIXED_FILE ||
 		    cd.flags & IORING_ASYNC_CANCEL_FD_FIXED) {
-			req->flags |= REQ_F_FIXED_FILE;
+			io_req_set_flags(req, REQ_F_FIXED_FILE);
 			req->file = io_file_get_fixed(req, cancel->fd,
 							issue_flags);
 		} else {
 			req->file = io_file_get_normal(req, cancel->fd);
 		}
diff --git a/io_uring/dma-buf.h b/io_uring/dma-buf.h
index 534c06b6879f..d8d9b4f224d8 100644
--- a/io_uring/dma-buf.h
+++ b/io_uring/dma-buf.h
@@ -1,11 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 #ifndef IOU_DMA_BUF_H
 #define IOU_DMA_BUF_H
 
 #include <linux/dma-buf-io.h>
-#include <linux/io_uring_types.h>
+#include <linux/io_uring.h>
 
 #include "rsrc.h"
 
 struct io_buf_dma {
 	struct dma_buf_io_ctx		*ctx;
@@ -57,11 +57,11 @@ static inline int io_import_dmabuf_map(struct io_kiocb *req,
 
 	if (!IS_ENABLED(CONFIG_DMA_SHARED_BUFFER))
 		return -EOPNOTSUPP;
 	if (req->file != bd->target_file)
 		return -EBADF;
-	req->flags |= REQ_F_DMABUF;
+	io_req_set_flags(req, REQ_F_DMABUF);
 	iov_iter_dmabuf_map(iter, ddir, NULL, offset, len);
 	return 0;
 }
 
 static inline int io_register_dmabuf(struct io_ring_ctx *ctx,
diff --git a/io_uring/fs.c b/io_uring/fs.c
index 26ea841a22e7..33f4034fbdd6 100644
--- a/io_uring/fs.c
+++ b/io_uring/fs.c
@@ -72,12 +72,11 @@ int io_renameat_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	if (unlikely(err)) {
 		dismiss_delayed_filename(&ren->oldpath);
 		return err;
 	}
 
-	req->flags |= REQ_F_NEED_CLEANUP;
-	req->flags |= REQ_F_FORCE_ASYNC;
+	io_req_set_flags(req, REQ_F_NEED_CLEANUP | REQ_F_FORCE_ASYNC);
 	return 0;
 }
 
 int io_renameat(struct io_kiocb *req, unsigned int issue_flags)
 {
@@ -89,11 +88,11 @@ int io_renameat(struct io_kiocb *req, unsigned int issue_flags)
 	WARN_ON_ONCE(issue_flags & IO_URING_F_NONBLOCK);
 
 	ret = filename_renameat2(ren->old_dfd, old,
 				 ren->new_dfd, new, ren->flags);
 
-	req->flags &= ~REQ_F_NEED_CLEANUP;
+	io_req_clear_flags(req, REQ_F_NEED_CLEANUP);
 	io_req_set_res(req, ret, 0);
 	return IOU_COMPLETE;
 }
 
 void io_renameat_cleanup(struct io_kiocb *req)
@@ -125,12 +124,11 @@ int io_unlinkat_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	fname = u64_to_user_ptr(READ_ONCE(sqe->addr));
 	err = delayed_getname(&un->filename, fname);
 	if (unlikely(err))
 		return err;
 
-	req->flags |= REQ_F_NEED_CLEANUP;
-	req->flags |= REQ_F_FORCE_ASYNC;
+	io_req_set_flags(req, REQ_F_NEED_CLEANUP | REQ_F_FORCE_ASYNC);
 	return 0;
 }
 
 int io_unlinkat(struct io_kiocb *req, unsigned int issue_flags)
 {
@@ -143,11 +141,11 @@ int io_unlinkat(struct io_kiocb *req, unsigned int issue_flags)
 	if (un->flags & AT_REMOVEDIR)
 		ret = filename_rmdir(un->dfd, name);
 	else
 		ret = filename_unlinkat(un->dfd, name);
 
-	req->flags &= ~REQ_F_NEED_CLEANUP;
+	io_req_clear_flags(req, REQ_F_NEED_CLEANUP);
 	io_req_set_res(req, ret, 0);
 	return IOU_COMPLETE;
 }
 
 void io_unlinkat_cleanup(struct io_kiocb *req)
@@ -174,12 +172,11 @@ int io_mkdirat_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	fname = u64_to_user_ptr(READ_ONCE(sqe->addr));
 	err = delayed_getname(&mkd->filename, fname);
 	if (unlikely(err))
 		return err;
 
-	req->flags |= REQ_F_NEED_CLEANUP;
-	req->flags |= REQ_F_FORCE_ASYNC;
+	io_req_set_flags(req, REQ_F_NEED_CLEANUP | REQ_F_FORCE_ASYNC);
 	return 0;
 }
 
 int io_mkdirat(struct io_kiocb *req, unsigned int issue_flags)
 {
@@ -189,11 +186,11 @@ int io_mkdirat(struct io_kiocb *req, unsigned int issue_flags)
 
 	WARN_ON_ONCE(issue_flags & IO_URING_F_NONBLOCK);
 
 	ret = filename_mkdirat(mkd->dfd, name, mkd->mode);
 
-	req->flags &= ~REQ_F_NEED_CLEANUP;
+	io_req_clear_flags(req, REQ_F_NEED_CLEANUP);
 	io_req_set_res(req, ret, 0);
 	return IOU_COMPLETE;
 }
 
 void io_mkdirat_cleanup(struct io_kiocb *req)
@@ -226,12 +223,11 @@ int io_symlinkat_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	if (unlikely(err)) {
 		dismiss_delayed_filename(&sl->oldpath);
 		return err;
 	}
 
-	req->flags |= REQ_F_NEED_CLEANUP;
-	req->flags |= REQ_F_FORCE_ASYNC;
+	io_req_set_flags(req, REQ_F_NEED_CLEANUP | REQ_F_FORCE_ASYNC);
 	return 0;
 }
 
 int io_symlinkat(struct io_kiocb *req, unsigned int issue_flags)
 {
@@ -242,11 +238,11 @@ int io_symlinkat(struct io_kiocb *req, unsigned int issue_flags)
 
 	WARN_ON_ONCE(issue_flags & IO_URING_F_NONBLOCK);
 
 	ret = filename_symlinkat(old, sl->new_dfd, new);
 
-	req->flags &= ~REQ_F_NEED_CLEANUP;
+	io_req_clear_flags(req, REQ_F_NEED_CLEANUP);
 	io_req_set_res(req, ret, 0);
 	return IOU_COMPLETE;
 }
 
 int io_linkat_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
@@ -274,12 +270,11 @@ int io_linkat_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	if (unlikely(err)) {
 		dismiss_delayed_filename(&lnk->oldpath);
 		return err;
 	}
 
-	req->flags |= REQ_F_NEED_CLEANUP;
-	req->flags |= REQ_F_FORCE_ASYNC;
+	io_req_set_flags(req, REQ_F_NEED_CLEANUP | REQ_F_FORCE_ASYNC);
 	return 0;
 }
 
 int io_linkat(struct io_kiocb *req, unsigned int issue_flags)
 {
@@ -290,11 +285,11 @@ int io_linkat(struct io_kiocb *req, unsigned int issue_flags)
 
 	WARN_ON_ONCE(issue_flags & IO_URING_F_NONBLOCK);
 
 	ret = filename_linkat(lnk->old_dfd, old, lnk->new_dfd, new, lnk->flags);
 
-	req->flags &= ~REQ_F_NEED_CLEANUP;
+	io_req_clear_flags(req, REQ_F_NEED_CLEANUP);
 	io_req_set_res(req, ret, 0);
 	return IOU_COMPLETE;
 }
 
 void io_link_cleanup(struct io_kiocb *req)
diff --git a/io_uring/futex.c b/io_uring/futex.c
index e0cb815fd37a..3d4acc31f242 100644
--- a/io_uring/futex.c
+++ b/io_uring/futex.c
@@ -240,11 +240,11 @@ int io_futexv_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 			break;
 		}
 	}
 
 	iof->futexv_unqueued = 0;
-	req->flags |= REQ_F_ASYNC_DATA;
+	io_req_set_flags(req, REQ_F_ASYNC_DATA);
 	req->async_data = ifd;
 	return 0;
 }
 
 static void io_futex_wake_fn(struct wake_q_head *wake_q, struct futex_q *q)
@@ -331,11 +331,11 @@ int io_futex_wait(struct io_kiocb *req, unsigned int issue_flags)
 	if (!io_cache_alloc(&ctx->futex_cache, GFP_NOWAIT, (void **)&ifd)) {
 		ret = -ENOMEM;
 		goto done_unlock;
 	}
 
-	req->flags |= REQ_F_ASYNC_DATA;
+	io_req_set_flags(req, REQ_F_ASYNC_DATA);
 	req->async_data = ifd;
 	ifd->q = futex_q_init;
 	ifd->q.bitset = iof->futex_mask;
 	ifd->q.wake = io_futex_wake_fn;
 	ifd->req = req;
diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 28ef95851510..65d63228ecbd 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -326,33 +326,32 @@ static void io_clean_op(struct io_kiocb *req)
 		put_cred(req->creds);
 	if (req->flags & REQ_F_ASYNC_DATA) {
 		kfree(req->async_data);
 		req->async_data = NULL;
 	}
-	req->flags &= ~IO_REQ_CLEAN_FLAGS;
+	io_req_clear_flags(req, IO_REQ_CLEAN_FLAGS);
 }
 
 /*
  * Mark the request as inflight, so that file cancelation will find it.
  * Can be used if the file is an io_uring instance, or if the request itself
  * relies on ->mm being alive for the duration of the request.
  */
 inline void io_req_track_inflight(struct io_kiocb *req)
 {
 	if (!(req->flags & REQ_F_INFLIGHT)) {
-		req->flags |= REQ_F_INFLIGHT;
+		io_req_set_flags(req, REQ_F_INFLIGHT);
 		atomic_inc(&req->tctx->inflight_tracked);
 	}
 }
 
 static struct io_kiocb *__io_prep_linked_timeout(struct io_kiocb *req)
 {
 	if (WARN_ON_ONCE(!req->link))
 		return NULL;
 
-	req->flags &= ~REQ_F_ARM_LTIMEOUT;
-	req->flags |= REQ_F_LINK_TIMEOUT;
+	io_req_switch_flags(req, REQ_F_ARM_LTIMEOUT, REQ_F_LINK_TIMEOUT);
 
 	/* linked timeouts should have two refs once prep'ed */
 	io_req_set_refcount(req);
 	__io_req_set_refcount(req->link, 2);
 	return req->link;
@@ -361,21 +360,21 @@ static struct io_kiocb *__io_prep_linked_timeout(struct io_kiocb *req)
 static void io_prep_async_work(struct io_kiocb *req)
 {
 	const struct io_issue_def *def = &io_issue_defs[req->opcode];
 
 	if (!(req->flags & REQ_F_CREDS)) {
-		req->flags |= REQ_F_CREDS;
+		io_req_set_flags(req, REQ_F_CREDS);
 		req->creds = get_current_cred();
 	}
 
 	req->work.list.next = NULL;
 	atomic_set(&req->work.flags, 0);
 	if (req->flags & REQ_F_FORCE_ASYNC)
 		atomic_or(IO_WQ_WORK_CONCURRENT, &req->work.flags);
 
 	if (req->file && !(req->flags & REQ_F_FIXED_FILE))
-		req->flags |= io_file_get_flags(req->file);
+		io_req_set_flags(req, io_file_get_flags(req->file));
 
 	if (req->file && (req->flags & REQ_F_ISREG)) {
 		bool should_hash = def->hash_reg_file;
 
 		/* don't serialize this request if the fs doesn't need it */
@@ -1035,11 +1034,11 @@ static void io_req_complete_post(struct io_kiocb *req, unsigned issue_flags)
 	/*
 	 * Request not freed here because we know it's called from io-wq only,
 	 * which holds a reference. Hence it can't be the last put. The CQE
 	 * has been posted, last put frees it.
 	 */
-	req->flags |= REQ_F_CQE_SKIP;
+	io_req_set_flags(req, REQ_F_CQE_SKIP);
 	req_ref_put(req);
 }
 
 void io_req_defer_failed(struct io_kiocb *req, s32 res)
 	__must_hold(&ctx->uring_lock)
@@ -1088,11 +1087,11 @@ __cold bool __io_alloc_req_refill(struct io_ring_ctx *ctx)
 }
 
 __cold void io_free_req(struct io_kiocb *req)
 {
 	/* refs were already put, restore them for io_req_task_complete() */
-	req->flags &= ~REQ_F_REFCOUNT;
+	io_req_clear_flags(req, REQ_F_REFCOUNT);
 	req->io_task_work.func = io_req_task_complete;
 	io_req_task_work_add(req);
 }
 
 static void __io_req_find_next_prep(struct io_kiocb *req)
@@ -1185,28 +1184,28 @@ static void io_free_batch_list(struct io_ring_ctx *ctx,
 						    comp_list);
 
 		if (unlikely(req->flags & IO_REQ_CLEAN_SLOW_FLAGS)) {
 			if (req->flags & REQ_F_REISSUE) {
 				node = req->comp_list.next;
-				req->flags &= ~REQ_F_REISSUE;
+				io_req_clear_flags(req, REQ_F_REISSUE);
 				io_queue_iowq(req);
 				continue;
 			}
 			if (req->flags & REQ_F_REFCOUNT) {
 				node = req->comp_list.next;
 				/* CQE posted, the last put only frees */
-				req->flags |= REQ_F_CQE_SKIP;
+				io_req_set_flags(req, REQ_F_CQE_SKIP);
 				if (!req_ref_put_and_test(req))
 					continue;
 			}
 			if ((req->flags & REQ_F_POLLED) && req->apoll) {
 				struct async_poll *apoll = req->apoll;
 
 				if (apoll->double_poll)
 					kfree(apoll->double_poll);
 				io_cache_free(&ctx->apoll_cache, apoll);
-				req->flags &= ~REQ_F_POLLED;
+				io_req_clear_flags(req, REQ_F_POLLED);
 			}
 			if (req->flags & IO_REQ_LINK_FLAGS)
 				io_queue_next(req);
 			if (unlikely(req->flags & IO_REQ_CLEAN_FLAGS))
 				io_clean_op(req);
@@ -1659,11 +1658,11 @@ void io_wq_submit_work(struct io_wq_work *work)
 			err = -ECANCELED;
 			if (io_arm_poll_handler(req, issue_flags) != IO_APOLL_OK)
 				goto fail;
 			return;
 		} else {
-			req->flags &= ~multishot_flags;
+			io_req_clear_flags(req, multishot_flags);
 		}
 	}
 
 	if (req->flags & REQ_F_FORCE_ASYNC) {
 		bool opcode_poll = def->pollin || def->pollout;
@@ -1724,11 +1723,11 @@ inline struct file *io_file_get_fixed(struct io_kiocb *req, int fd,
 	io_ring_submit_lock(ctx, issue_flags);
 	node = io_rsrc_node_lookup(&ctx->file_table.data, fd);
 	if (node) {
 		node->refs++;
 		req->file_node = node;
-		req->flags |= io_slot_flags(node);
+		io_req_set_flags(req, io_slot_flags(node));
 		file = io_slot_file(node);
 	}
 	io_ring_submit_unlock(ctx, issue_flags);
 	return file;
 }
@@ -1749,11 +1748,11 @@ static int io_req_sqe_copy(struct io_kiocb *req, unsigned int issue_flags)
 {
 	const struct io_cold_def *def = &io_cold_defs[req->opcode];
 
 	if (req->flags & REQ_F_SQE_COPIED)
 		return 0;
-	req->flags |= REQ_F_SQE_COPIED;
+	io_req_set_flags(req, REQ_F_SQE_COPIED);
 	if (!def->sqe_copy)
 		return 0;
 	if (WARN_ON_ONCE(!(issue_flags & IO_URING_F_INLINE)))
 		return -EFAULT;
 	def->sqe_copy(req);
@@ -1808,12 +1807,11 @@ static void io_queue_sqe_fallback(struct io_kiocb *req)
 	if (unlikely(req->flags & REQ_F_FAIL)) {
 		/*
 		 * We don't submit, fail them all, for that replace hardlinks
 		 * with normal links. Extra REQ_F_LINK is tolerated.
 		 */
-		req->flags &= ~REQ_F_HARDLINK;
-		req->flags |= REQ_F_LINK;
+		io_req_switch_flags(req, REQ_F_HARDLINK, REQ_F_LINK);
 		io_req_defer_failed(req, req->cqe.res);
 	} else {
 		/* can't fail with IO_URING_F_INLINE */
 		io_req_sqe_copy(req, IO_URING_F_INLINE);
 		if (unlikely(req->ctx->int_flags & IO_RING_F_DRAIN_ACTIVE))
@@ -1859,11 +1857,11 @@ static void io_init_drain(struct io_ring_ctx *ctx)
 		 * the head request and the next request/link after the current
 		 * link. Considering sequential execution of links,
 		 * REQ_F_IO_DRAIN will be maintained for every request of our
 		 * link.
 		 */
-		head->flags |= REQ_F_IO_DRAIN | REQ_F_FORCE_ASYNC;
+		io_req_set_flags(head, REQ_F_IO_DRAIN | REQ_F_FORCE_ASYNC);
 		ctx->int_flags |= IO_RING_F_DRAIN_NEXT;
 	}
 }
 
 static __cold int io_init_fail_req(struct io_kiocb *req, int err)
@@ -1947,16 +1945,16 @@ static int io_init_req(struct io_ring_ctx *ctx, struct io_kiocb *req,
 	if (unlikely(ctx->int_flags & (IO_RING_F_OP_RESTRICTED | IO_RING_F_DRAIN_ACTIVE | IO_RING_F_DRAIN_NEXT))) {
 		if (!io_check_restriction(ctx, req, sqe_flags))
 			return io_init_fail_req(req, -EACCES);
 		/* knock it to the slow queue path, will be drained there */
 		if (ctx->int_flags & IO_RING_F_DRAIN_ACTIVE)
-			req->flags |= REQ_F_FORCE_ASYNC;
+			io_req_set_flags(req, REQ_F_FORCE_ASYNC);
 		/* if there is no link, we're at "next" request and need to drain */
 		if (unlikely(ctx->int_flags & IO_RING_F_DRAIN_NEXT) && !ctx->submit_state.link.head) {
 			ctx->int_flags &= ~IO_RING_F_DRAIN_NEXT;
 			ctx->int_flags |= IO_RING_F_DRAIN_ACTIVE;
-			req->flags |= REQ_F_IO_DRAIN | REQ_F_FORCE_ASYNC;
+			io_req_set_flags(req, REQ_F_IO_DRAIN|REQ_F_FORCE_ASYNC);
 		}
 	}
 
 	if (!def->ioprio && sqe->ioprio)
 		return io_init_fail_req(req, -EINVAL);
@@ -1990,11 +1988,11 @@ static int io_init_req(struct io_ring_ctx *ctx, struct io_kiocb *req,
 		ret = security_uring_override_creds(req->creds);
 		if (ret) {
 			put_cred(req->creds);
 			return io_init_fail_req(req, ret);
 		}
-		req->flags |= REQ_F_CREDS;
+		io_req_set_flags(req, REQ_F_CREDS);
 	}
 
 	return def->prep(req, sqe);
 }
 
diff --git a/io_uring/io_uring.h b/io_uring/io_uring.h
index 40d648f993a2..f5ae0e2beff2 100644
--- a/io_uring/io_uring.h
+++ b/io_uring/io_uring.h
@@ -343,22 +343,22 @@ io_uring_alloc_cached_async_data(struct io_alloc_cache *cache,
 				 struct io_kiocb *req)
 {
 	if (!io_cache_alloc(cache, GFP_KERNEL, &req->async_data))
 		return false;
 
-	req->flags |= REQ_F_ASYNC_DATA;
+	io_req_set_flags(req, REQ_F_ASYNC_DATA);
 	return true;
 }
 
 static inline void *io_uring_alloc_async_data(struct io_kiocb *req)
 {
 	const struct io_issue_def *def = &io_issue_defs[req->opcode];
 
 	WARN_ON_ONCE(!def->async_size);
 	req->async_data = kmalloc(def->async_size, GFP_KERNEL);
 	if (req->async_data)
-		req->flags |= REQ_F_ASYNC_DATA;
+		io_req_set_flags(req, REQ_F_ASYNC_DATA);
 	return req->async_data;
 }
 
 static inline bool req_has_async_data(struct io_kiocb *req)
 {
@@ -366,11 +366,11 @@ static inline bool req_has_async_data(struct io_kiocb *req)
 }
 
 static inline void io_req_async_data_clear(struct io_kiocb *req,
 					   io_req_flags_t extra_flags)
 {
-	req->flags &= ~(REQ_F_ASYNC_DATA|extra_flags);
+	io_req_clear_flags(req, REQ_F_ASYNC_DATA | extra_flags);
 	req->async_data = NULL;
 }
 
 static inline void io_req_async_data_free(struct io_kiocb *req)
 {
@@ -569,11 +569,11 @@ static inline void io_req_queue_tw_complete(struct io_kiocb *req, s32 res)
 static inline bool io_file_can_poll(struct io_kiocb *req)
 {
 	if (req->flags & REQ_F_CAN_POLL)
 		return true;
 	if (req->file && file_can_poll(req->file)) {
-		req->flags |= REQ_F_CAN_POLL;
+		io_req_set_flags(req, REQ_F_CAN_POLL);
 		return true;
 	}
 	return false;
 }
 
diff --git a/io_uring/kbuf.c b/io_uring/kbuf.c
index abf44f5dba26..b35ef1502d39 100644
--- a/io_uring/kbuf.c
+++ b/io_uring/kbuf.c
@@ -64,11 +64,11 @@ bool io_kbuf_commit(struct io_kiocb *req,
 		    struct io_buffer_list *bl, int len, int nr)
 {
 	if (unlikely(!(req->flags & REQ_F_BUFFERS_COMMIT)))
 		return true;
 
-	req->flags &= ~REQ_F_BUFFERS_COMMIT;
+	io_req_clear_flags(req, REQ_F_BUFFERS_COMMIT);
 
 	if (unlikely(len < 0))
 		return true;
 	if (bl->flags & IOBL_INC)
 		return io_kbuf_inc_commit(bl, len);
@@ -99,11 +99,11 @@ static int io_buffer_add_list(struct io_ring_ctx *ctx,
 
 void io_kbuf_drop_legacy(struct io_kiocb *req)
 {
 	if (WARN_ON_ONCE(!(req->flags & REQ_F_BUFFER_SELECTED)))
 		return;
-	req->flags &= ~REQ_F_BUFFER_SELECTED;
+	io_req_clear_flags(req, REQ_F_BUFFER_SELECTED);
 	kfree(req->kbuf);
 	req->kbuf = NULL;
 }
 
 bool io_kbuf_recycle_legacy(struct io_kiocb *req, unsigned issue_flags)
@@ -124,31 +124,32 @@ bool io_kbuf_recycle_legacy(struct io_kiocb *req, unsigned issue_flags)
 		list_add(&buf->list, &bl->buf_list);
 		bl->nbufs++;
 	} else {
 		kfree(buf);
 	}
-	req->flags &= ~REQ_F_BUFFER_SELECTED;
+	io_req_clear_flags(req, REQ_F_BUFFER_SELECTED);
 	req->kbuf = NULL;
 
 	io_ring_submit_unlock(ctx, issue_flags);
 	return true;
 }
 
 static void __user *io_provided_buffer_select(struct io_kiocb *req, size_t *len,
 					      struct io_buffer_list *bl)
 {
 	if (!list_empty(&bl->buf_list)) {
+		io_req_flags_t flags = REQ_F_BUFFER_SELECTED;
 		struct io_buffer *kbuf;
 
 		kbuf = list_first_entry(&bl->buf_list, struct io_buffer, list);
 		list_del(&kbuf->list);
 		bl->nbufs--;
 		if (*len == 0 || *len > kbuf->len)
 			*len = kbuf->len;
 		if (list_empty(&bl->buf_list))
-			req->flags |= REQ_F_BL_EMPTY;
-		req->flags |= REQ_F_BUFFER_SELECTED;
+			flags |= REQ_F_BL_EMPTY;
+		io_req_set_flags(req, flags);
 		req->kbuf = kbuf;
 		req->buf_index = kbuf->bid;
 		return u64_to_user_ptr(kbuf->addr);
 	}
 	return NULL;
@@ -203,28 +204,28 @@ static struct io_br_sel io_ring_buffer_select(struct io_kiocb *req, size_t *len,
 	tail = smp_load_acquire(&br->tail);
 	if (unlikely(tail == head))
 		return sel;
 
 	if ((__u16)(head + 1) == tail)
-		req->flags |= REQ_F_BL_EMPTY;
+		io_req_set_flags(req, REQ_F_BL_EMPTY);
 
 	buf = io_ring_head_to_buf(br, head, bl->mask);
 	buf_len = READ_ONCE(buf->len);
 	if (*len == 0 || *len > buf_len)
 		*len = buf_len;
 	sel.addr = u64_to_user_ptr(READ_ONCE(buf->addr));
 	if (unlikely(!access_ok(sel.addr, *len))) {
 		sel.addr = NULL;
 		return sel;
 	}
-	req->flags |= REQ_F_BUFFER_RING | REQ_F_BUFFERS_COMMIT;
+	io_req_set_flags(req, REQ_F_BUFFER_RING | REQ_F_BUFFERS_COMMIT);
 	req->buf_index = READ_ONCE(buf->bid);
 	sel.buf_list = bl;
 
 	if (io_should_commit(req, issue_flags)) {
 		if (!io_kbuf_commit(req, sel.buf_list, *len, 1))
-			req->flags |= REQ_F_BUF_MORE;
+			io_req_set_flags(req, REQ_F_BUF_MORE);
 		sel.buf_list = NULL;
 	}
 	return sel;
 }
 
@@ -253,10 +254,11 @@ struct io_br_sel io_buffer_select(struct io_kiocb *req, size_t *len,
 
 static int io_ring_buffers_peek(struct io_kiocb *req, struct buf_sel_arg *arg,
 				struct io_buffer_list *bl)
 {
 	struct io_uring_buf_ring *br = bl->buf_ring;
+	io_req_flags_t flags = REQ_F_BUFFER_RING;
 	struct iovec *org_iovs = arg->iovs;
 	struct iovec *iov = arg->iovs;
 	int nr_iovs = arg->nr_iovs;
 	__u16 nr_avail, tail, head;
 	struct io_uring_buf *buf;
@@ -336,13 +338,13 @@ static int io_ring_buffers_peek(struct io_kiocb *req, struct buf_sel_arg *arg,
 
 	if (arg->iovs != org_iovs && (arg->mode & KBUF_MODE_FREE))
 		kfree(org_iovs);
 
 	if (head == tail)
-		req->flags |= REQ_F_BL_EMPTY;
+		flags |= REQ_F_BL_EMPTY;
 
-	req->flags |= REQ_F_BUFFER_RING;
+	io_req_set_flags(req, flags);
 	return iov - arg->iovs;
 }
 
 int io_buffers_select(struct io_kiocb *req, struct buf_sel_arg *arg,
 		      struct io_br_sel *sel, unsigned int issue_flags)
@@ -363,13 +365,14 @@ int io_buffers_select(struct io_kiocb *req, struct buf_sel_arg *arg,
 		 * buffers for a send/write operation would happen on the app
 		 * side anyway with normal buffers. Besides, we already
 		 * committed them, they cannot be put back in the queue.
 		 */
 		if (ret > 0) {
-			req->flags |= REQ_F_BUFFERS_COMMIT | REQ_F_BL_NO_RECYCLE;
+			io_req_set_flags(req, REQ_F_BUFFERS_COMMIT |
+					      REQ_F_BL_NO_RECYCLE);
 			if (!io_kbuf_commit(req, sel->buf_list, arg->out_len, ret))
-				req->flags |= REQ_F_BUF_MORE;
+				io_req_set_flags(req, REQ_F_BUF_MORE);
 		}
 	} else {
 		ret = io_provided_buffers_select(req, &arg->out_len, sel->buf_list, arg->iovs);
 	}
 out_unlock:
@@ -394,11 +397,11 @@ int io_buffers_peek(struct io_kiocb *req, struct buf_sel_arg *arg,
 		return -ENOENT;
 
 	if (bl->flags & IOBL_BUF_RING) {
 		ret = io_ring_buffers_peek(req, arg, bl);
 		if (ret > 0)
-			req->flags |= REQ_F_BUFFERS_COMMIT;
+			io_req_set_flags(req, REQ_F_BUFFERS_COMMIT);
 		sel->buf_list = bl;
 		return ret;
 	}
 
 	/* don't support multiple buffer selections for legacy */
@@ -414,11 +417,11 @@ static inline bool __io_put_kbuf_ring(struct io_kiocb *req,
 	if (bl)
 		ret = io_kbuf_commit(req, bl, len, nr);
 	if (ret && (req->flags & REQ_F_BUF_MORE))
 		ret = false;
 
-	req->flags &= ~(REQ_F_BUFFER_RING | REQ_F_BUF_MORE);
+	io_req_clear_flags(req, REQ_F_BUFFER_RING | REQ_F_BUF_MORE);
 	return ret;
 }
 
 unsigned int __io_put_kbufs(struct io_kiocb *req, struct io_buffer_list *bl,
 			    int len, int nbufs)
diff --git a/io_uring/kbuf.h b/io_uring/kbuf.h
index 401773e1ef80..fecfece1f5e2 100644
--- a/io_uring/kbuf.h
+++ b/io_uring/kbuf.h
@@ -1,11 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 #ifndef IOU_KBUF_H
 #define IOU_KBUF_H
 
 #include <uapi/linux/io_uring.h>
-#include <linux/io_uring_types.h>
+#include <linux/io_uring.h>
 
 enum {
 	/* ring mapped provided buffers */
 	IOBL_BUF_RING	= 1,
 	/* buffers are consumed incrementally rather than always fully */
@@ -96,11 +96,11 @@ struct io_mapped_region *io_pbuf_get_region(struct io_ring_ctx *ctx,
 
 static inline bool io_kbuf_recycle_ring(struct io_kiocb *req,
 					struct io_buffer_list *bl)
 {
 	if (bl) {
-		req->flags &= ~(REQ_F_BUFFER_RING|REQ_F_BUFFERS_COMMIT);
+		io_req_clear_flags(req, REQ_F_BUFFER_RING|REQ_F_BUFFERS_COMMIT);
 		return true;
 	}
 	return false;
 }
 
diff --git a/io_uring/msg_ring.c b/io_uring/msg_ring.c
index 3067c9343991..7e710d7a38b1 100644
--- a/io_uring/msg_ring.c
+++ b/io_uring/msg_ring.c
@@ -184,11 +184,11 @@ static int io_msg_grab_file(struct io_kiocb *req, unsigned int issue_flags)
 	node = io_rsrc_node_lookup(&ctx->file_table.data, msg->src_fd);
 	if (node) {
 		msg->src_file = io_slot_file(node);
 		if (msg->src_file)
 			get_file(msg->src_file);
-		req->flags |= REQ_F_NEED_CLEANUP;
+		io_req_set_flags(req, REQ_F_NEED_CLEANUP);
 		ret = 0;
 	}
 	io_ring_submit_unlock(ctx, issue_flags);
 	return ret;
 }
@@ -206,11 +206,11 @@ static int io_msg_install_complete(struct io_kiocb *req, unsigned int issue_flag
 	ret = __io_fixed_fd_install(target_ctx, src_file, msg->dst_fd);
 	if (ret < 0)
 		goto out_unlock;
 
 	msg->src_file = NULL;
-	req->flags &= ~REQ_F_NEED_CLEANUP;
+	io_req_clear_flags(req, REQ_F_NEED_CLEANUP);
 
 	if (msg->flags & IORING_MSG_RING_CQE_SKIP)
 		goto out_unlock;
 	/*
 	 * If this fails, the target still received the file descriptor but
diff --git a/io_uring/net.c b/io_uring/net.c
index 183425f28b0c..48c3a7e8424e 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -129,11 +129,11 @@ int io_shutdown_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	if (unlikely(sqe->off || sqe->addr || sqe->rw_flags ||
 		     sqe->buf_index || sqe->splice_fd_in))
 		return -EINVAL;
 
 	shutdown->how = READ_ONCE(sqe->len);
-	req->flags |= REQ_F_FORCE_ASYNC;
+	io_req_set_flags(req, REQ_F_FORCE_ASYNC);
 	return 0;
 }
 
 int io_shutdown(struct io_kiocb *req, unsigned int issue_flags)
 {
@@ -193,20 +193,20 @@ static struct io_async_msghdr *io_msg_alloc_async(struct io_kiocb *req)
 		return NULL;
 
 	hdr = req->async_data;
 	/* If the async data was cached, we might have an iov cached inside. */
 	if (hdr->vec.iovec)
-		req->flags |= REQ_F_NEED_CLEANUP;
+		io_req_set_flags(req, REQ_F_NEED_CLEANUP);
 	return hdr;
 }
 
 static inline void io_mshot_prep_retry(struct io_kiocb *req,
 				       struct io_async_msghdr *kmsg)
 {
 	struct io_sr_msg *sr = io_kiocb_to_cmd(req, struct io_sr_msg);
 
-	req->flags &= ~REQ_F_BL_EMPTY;
+	io_req_clear_flags(req, REQ_F_BL_EMPTY);
 	sr->done_io = 0;
 	sr->flags &= ~IORING_RECV_RETRY_CLEAR;
 	sr->len = sr->mshot_len;
 }
 
@@ -229,11 +229,11 @@ static int io_net_import_vec(struct io_kiocb *req, struct io_async_msghdr *iomsg
 			     &iomsg->msg.msg_iter, io_is_compat(req->ctx));
 	if (unlikely(ret < 0))
 		return ret;
 
 	if (iov) {
-		req->flags |= REQ_F_NEED_CLEANUP;
+		io_req_set_flags(req, REQ_F_NEED_CLEANUP);
 		io_vec_reset_iovec(&iomsg->vec, iov, iomsg->msg.msg_iter.nr_segs);
 	}
 	return 0;
 }
 
@@ -345,11 +345,11 @@ static int io_send_setup(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 		kmsg->msg.msg_name = &kmsg->addr;
 		kmsg->msg.msg_namelen = addr_len;
 	}
 	if (sr->flags & IORING_RECVSEND_FIXED_BUF) {
 		if (!(sr->flags & IORING_SEND_VECTORIZED)) {
-			req->flags |= REQ_F_IMPORT_BUFFER;
+			io_req_set_flags(req, REQ_F_IMPORT_BUFFER);
 			return 0;
 		}
 
 		kmsg->msg.msg_iter.nr_segs = sr->len;
 		return io_prep_reg_iovec(req, &kmsg->vec, sr->buf, sr->len);
@@ -410,19 +410,19 @@ int io_sendmsg_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 			return -EINVAL;
 		req->buf_index = READ_ONCE(sqe->buf_index);
 	}
 	sr->msg_flags = READ_ONCE(sqe->msg_flags) | MSG_NOSIGNAL;
 	if (sr->msg_flags & MSG_DONTWAIT)
-		req->flags |= REQ_F_NOWAIT;
+		io_req_set_flags(req, REQ_F_NOWAIT);
 	if (req->flags & REQ_F_BUFFER_SELECT)
 		sr->buf_group = req->buf_index;
 	sr->mshot_total_len = sr->mshot_len = 0;
 	if (sr->flags & IORING_RECVSEND_BUNDLE) {
 		if (req->opcode == IORING_OP_SENDMSG)
 			return -EINVAL;
 		sr->msg_flags |= MSG_WAITALL;
-		req->flags |= REQ_F_MULTISHOT;
+		io_req_set_flags(req, REQ_F_MULTISHOT);
 	}
 
 	if (io_is_compat(req->ctx))
 		sr->msg_flags |= MSG_CMSG_COMPAT;
 
@@ -499,11 +499,11 @@ static bool io_net_kbuf_can_retry(struct io_kiocb *req,
 }
 
 static int io_net_kbuf_recyle(struct io_kiocb *req, struct io_buffer_list *bl,
 			      struct io_async_msghdr *kmsg, int len)
 {
-	req->flags |= REQ_F_BL_NO_RECYCLE;
+	io_req_set_flags(req, REQ_F_BL_NO_RECYCLE);
 	if (req->flags & REQ_F_BUFFERS_COMMIT)
 		io_kbuf_commit(req, bl, len, io_bundle_nbufs(kmsg, len));
 	return IOU_RETRY;
 }
 
@@ -622,11 +622,11 @@ static int io_send_select_buffer(struct io_kiocb *req, unsigned int issue_flags,
 		return ret;
 
 	if (arg.iovs != &kmsg->fast_iov && arg.iovs != kmsg->vec.iovec) {
 		kmsg->vec.nr = ret;
 		kmsg->vec.iovec = arg.iovs;
-		req->flags |= REQ_F_NEED_CLEANUP;
+		io_req_set_flags(req, REQ_F_NEED_CLEANUP);
 	}
 	sr->len = arg.out_len;
 
 	if (ret == 1) {
 		sr->buf = arg.iovs[0].iov_base;
@@ -664,11 +664,11 @@ int io_send(struct io_kiocb *req, unsigned int issue_flags)
 		ret = io_import_reg_buf(req, &kmsg->msg.msg_iter,
 					(u64)(uintptr_t)sr->buf, sr->len,
 					ITER_SOURCE, issue_flags);
 		if (unlikely(ret))
 			return ret;
-		req->flags &= ~REQ_F_IMPORT_BUFFER;
+		io_req_clear_flags(req, REQ_F_IMPORT_BUFFER);
 	}
 
 	flags = sr->msg_flags;
 	if (issue_flags & IO_URING_F_NONBLOCK)
 		flags |= MSG_DONTWAIT;
@@ -782,11 +782,11 @@ static int io_recvmsg_prep_setup(struct io_kiocb *req)
 		kmsg->msg.msg_ubuf = NULL;
 
 		if (req->flags & REQ_F_BUFFER_SELECT)
 			return 0;
 		if (sr->flags & IORING_RECVSEND_FIXED_BUF) {
-			req->flags |= REQ_F_IMPORT_BUFFER;
+			io_req_set_flags(req, REQ_F_IMPORT_BUFFER);
 			return 0;
 		}
 		return import_ubuf(ITER_DEST, sr->buf, sr->len,
 				   &kmsg->msg.msg_iter);
 	}
@@ -821,13 +821,13 @@ int io_recvmsg_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 			return -EINVAL;
 		req->buf_index = READ_ONCE(sqe->buf_index);
 	}
 	sr->msg_flags = READ_ONCE(sqe->msg_flags);
 	if (sr->msg_flags & MSG_DONTWAIT)
-		req->flags |= REQ_F_NOWAIT;
+		io_req_set_flags(req, REQ_F_NOWAIT);
 	if (sr->msg_flags & MSG_ERRQUEUE)
-		req->flags |= REQ_F_CLEAR_POLLIN;
+		io_req_set_flags(req, REQ_F_CLEAR_POLLIN);
 	if (req->flags & REQ_F_BUFFER_SELECT)
 		sr->buf_group = req->buf_index;
 	sr->mshot_total_len = sr->mshot_len = 0;
 	if (sr->flags & IORING_RECV_MULTISHOT) {
 		if (!(req->flags & REQ_F_BUFFER_SELECT))
@@ -840,11 +840,11 @@ int io_recvmsg_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 			if (sr->mshot_total_len)
 				sr->flags |= IORING_RECV_MSHOT_LIM;
 		} else if (sqe->optlen) {
 			return -EINVAL;
 		}
-		req->flags |= REQ_F_APOLL_MULTISHOT;
+		io_req_set_flags(req, REQ_F_APOLL_MULTISHOT);
 	} else if (sqe->optlen) {
 		return -EINVAL;
 	}
 
 	if (sr->flags & IORING_RECVSEND_BUNDLE) {
@@ -1179,11 +1179,11 @@ static int io_recv_buf_select(struct io_kiocb *req, struct io_async_msghdr *kmsg
 			return ret;
 
 		if (arg.iovs != &kmsg->fast_iov && arg.iovs != kmsg->vec.iovec) {
 			kmsg->vec.nr = ret;
 			kmsg->vec.iovec = arg.iovs;
-			req->flags |= REQ_F_NEED_CLEANUP;
+			io_req_set_flags(req, REQ_F_NEED_CLEANUP);
 		}
 		if (arg.partial_map)
 			sr->flags |= IORING_RECV_PARTIAL_MAP;
 
 		/* special case 1 vec, can be a fast path */
@@ -1246,11 +1246,11 @@ int io_recv(struct io_kiocb *req, unsigned int issue_flags)
 		if (unlikely(ret)) {
 			kmsg->msg.msg_inq = -1;
 			sel.buf_list = NULL;
 			goto out_free;
 		}
-		req->flags &= ~REQ_F_IMPORT_BUFFER;
+		io_req_clear_flags(req, REQ_F_IMPORT_BUFFER);
 	}
 
 retry_multishot:
 	sel.buf_list = NULL;
 	len = sr->len;
@@ -1339,11 +1339,11 @@ int io_recvzc_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 		return -EINVAL;
 	/* multishot required */
 	if (!(zc->flags & IORING_RECV_MULTISHOT))
 		return -EINVAL;
 	/* All data completions are posted as aux CQEs. */
-	req->flags |= REQ_F_APOLL_MULTISHOT;
+	io_req_set_flags(req, REQ_F_APOLL_MULTISHOT);
 
 	return 0;
 }
 
 int io_recvzc(struct io_kiocb *req, unsigned int issue_flags)
@@ -1423,11 +1423,11 @@ int io_send_zc_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 		user_data = req->cqe.user_data;
 
 	notif->cqe.user_data = user_data;
 	notif->cqe.res = 0;
 	notif->cqe.flags = IORING_CQE_F_NOTIF;
-	req->flags |= REQ_F_NEED_CLEANUP | REQ_F_POLL_NO_LAZY;
+	io_req_set_flags(req, REQ_F_NEED_CLEANUP | REQ_F_POLL_NO_LAZY);
 
 	zc->flags = READ_ONCE(sqe->ioprio);
 	if (unlikely(zc->flags & ~IO_ZC_FLAGS_COMMON)) {
 		if (zc->flags & ~IO_ZC_FLAGS_VALID)
 			return -EINVAL;
@@ -1442,11 +1442,11 @@ int io_send_zc_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 
 	zc->len = READ_ONCE(sqe->len);
 	zc->msg_flags = READ_ONCE(sqe->msg_flags) | MSG_NOSIGNAL | MSG_ZEROCOPY;
 	req->buf_index = READ_ONCE(sqe->buf_index);
 	if (zc->msg_flags & MSG_DONTWAIT)
-		req->flags |= REQ_F_NOWAIT;
+		io_req_set_flags(req, REQ_F_NOWAIT);
 
 	if (io_is_compat(ctx))
 		zc->msg_flags |= MSG_CMSG_COMPAT;
 
 	iomsg = io_msg_alloc_async(req);
@@ -1545,11 +1545,11 @@ static int io_send_zc_import(struct io_kiocb *req,
 					issue_flags);
 	}
 
 	if (unlikely(ret))
 		return ret;
-	req->flags &= ~REQ_F_IMPORT_BUFFER;
+	io_req_clear_flags(req, REQ_F_IMPORT_BUFFER);
 	return 0;
 }
 
 int io_sendmsg_zc(struct io_kiocb *req, unsigned int issue_flags)
 {
@@ -1663,13 +1663,13 @@ int io_accept_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	if (accept->flags & ~(SOCK_CLOEXEC | SOCK_NONBLOCK))
 		return -EINVAL;
 	if (SOCK_NONBLOCK != O_NONBLOCK && (accept->flags & SOCK_NONBLOCK))
 		accept->flags = (accept->flags & ~SOCK_NONBLOCK) | O_NONBLOCK;
 	if (accept->iou_flags & IORING_ACCEPT_MULTISHOT)
-		req->flags |= REQ_F_APOLL_MULTISHOT;
+		io_req_set_flags(req, REQ_F_APOLL_MULTISHOT);
 	if (accept->iou_flags & IORING_ACCEPT_DONTWAIT)
-		req->flags |= REQ_F_NOWAIT;
+		io_req_set_flags(req, REQ_F_NOWAIT);
 	return 0;
 }
 
 int io_accept(struct io_kiocb *req, unsigned int issue_flags)
 {
@@ -1951,11 +1951,11 @@ int io_bind_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 		return -ENOMEM;
 	ret = move_addr_to_kernel(uaddr, bind->addr_len, addr);
 	if (unlikely(ret))
 		return ret;
 	if (io_bind_file_create(addr, bind->addr_len))
-		req->flags |= REQ_F_FORCE_ASYNC;
+		io_req_set_flags(req, REQ_F_FORCE_ASYNC);
 	return 0;
 }
 
 
 int io_bind(struct io_kiocb *req, unsigned int issue_flags)
diff --git a/io_uring/nop.c b/io_uring/nop.c
index 60ab19604b36..2f7da00b2442 100644
--- a/io_uring/nop.c
+++ b/io_uring/nop.c
@@ -39,11 +39,11 @@ int io_nop_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	if (nop->flags & IORING_NOP_FILE)
 		nop->fd = READ_ONCE(sqe->fd);
 	else
 		nop->fd = -1;
 	if (nop->flags & IORING_NOP_FIXED_FILE)
-		req->flags |= REQ_F_FIXED_FILE;
+		io_req_set_flags(req, REQ_F_FIXED_FILE);
 	if (nop->flags & IORING_NOP_FIXED_BUFFER)
 		req->buf_index = READ_ONCE(sqe->buf_index);
 	if (nop->flags & IORING_NOP_CQE32) {
 		struct io_ring_ctx *ctx = req->ctx;
 
diff --git a/io_uring/openclose.c b/io_uring/openclose.c
index 24cf3ce2e2bc..947f0aa644ae 100644
--- a/io_uring/openclose.c
+++ b/io_uring/openclose.c
@@ -68,19 +68,19 @@ static int __io_openat_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe
 	open->dfd = READ_ONCE(sqe->fd);
 	fname = u64_to_user_ptr(READ_ONCE(sqe->addr));
 	ret = delayed_getname(&open->filename, fname);
 	if (unlikely(ret))
 		return ret;
-	req->flags |= REQ_F_NEED_CLEANUP;
+	io_req_set_flags(req, REQ_F_NEED_CLEANUP);
 
 	open->file_slot = READ_ONCE(sqe->file_index);
 	if (open->file_slot && (open->how.flags & O_CLOEXEC))
 		return -EINVAL;
 
 	open->nofile = rlimit(RLIMIT_NOFILE);
 	if (io_openat_force_async(open))
-		req->flags |= REQ_F_FORCE_ASYNC;
+		io_req_set_flags(req, REQ_F_FORCE_ASYNC);
 	return 0;
 }
 
 void io_openat_bpf_populate(struct io_uring_bpf_ctx *bctx, struct io_kiocb *req)
 {
@@ -176,11 +176,11 @@ int io_openat2(struct io_kiocb *req, unsigned int issue_flags)
 		fd_install(ret, file);
 	else
 		ret = io_fixed_fd_install(req, issue_flags, file,
 						open->file_slot);
 err:
-	req->flags &= ~REQ_F_NEED_CLEANUP;
+	io_req_clear_flags(req, REQ_F_NEED_CLEANUP);
 	if (ret < 0)
 		req_set_fail(req);
 	io_req_set_res(req, ret, 0);
 	return IOU_COMPLETE;
 }
diff --git a/io_uring/poll.c b/io_uring/poll.c
index 1e533d1bf8eb..01c2b10a4bd7 100644
--- a/io_uring/poll.c
+++ b/io_uring/poll.c
@@ -446,13 +446,13 @@ static int io_poll_wake(struct wait_queue_entry *wait, unsigned mode, int sync,
 
 		/* optional, saves extra locking for removal in tw handler */
 		if (mask && poll->events & EPOLLONESHOT) {
 			io_poll_remove_waitq(poll);
 			if (wqe_is_double(wait))
-				req->flags &= ~REQ_F_DOUBLE_POLL;
+				io_req_clear_flags(req, REQ_F_DOUBLE_POLL);
 			else
-				req->flags &= ~REQ_F_SINGLE_POLL;
+				io_req_clear_flags(req, REQ_F_SINGLE_POLL);
 		}
 		__io_poll_execute(req, mask, IOU_F_TWQ_IN_WAKE);
 	}
 	return 1;
 }
@@ -471,14 +471,16 @@ static bool io_poll_double_prepare(struct io_kiocb *req)
 	 * io_poll_wake(). There is only one poll entry queued, serialise with
 	 * it by taking its head lock. As we're still arming the tw hanlder
 	 * is not going to be run, so there are no races with it.
 	 */
 	if (head) {
+		io_req_flags_t flags = REQ_F_DOUBLE_POLL;
+
 		spin_lock_irq(&head->lock);
-		req->flags |= REQ_F_DOUBLE_POLL;
 		if (req->opcode == IORING_OP_POLL_ADD)
-			req->flags |= REQ_F_ASYNC_DATA;
+			flags |= REQ_F_ASYNC_DATA;
+		io_req_set_flags(req, flags);
 		spin_unlock_irq(&head->lock);
 	}
 	rcu_read_unlock();
 	return !!head;
 }
@@ -524,11 +526,11 @@ static void __io_queue_proc(struct io_poll *poll, struct io_poll_table *pt,
 			return;
 		}
 		*poll_ptr = poll;
 	} else {
 		/* fine to modify, there is no poll queued to race with us */
-		req->flags |= REQ_F_SINGLE_POLL;
+		io_req_set_flags(req, REQ_F_SINGLE_POLL);
 	}
 
 	pt->nr_entries++;
 	poll->head = head;
 	poll->wait.private = (void *) wqe_private;
@@ -605,11 +607,11 @@ static int __io_arm_poll_handler(struct io_kiocb *req,
 	 * wake if someone does wait(events > 1). Ensure we don't do
 	 * lazy wake for those, as we need to process each one as they
 	 * come in.
 	 */
 	if (poll->events & EPOLLEXCLUSIVE)
-		req->flags |= REQ_F_POLL_NO_LAZY;
+		io_req_set_flags(req, REQ_F_POLL_NO_LAZY);
 
 	mask = vfs_poll(req->file, &ipt->pt) & poll->events;
 
 	if (unlikely(ipt->error || !ipt->nr_entries)) {
 		io_poll_remove_entries(req);
@@ -726,12 +728,12 @@ int io_arm_apoll(struct io_kiocb *req, unsigned issue_flags, __poll_t mask)
 		mask |= EPOLLONESHOT;
 
 	apoll = io_req_alloc_apoll(req, issue_flags);
 	if (!apoll)
 		return IO_APOLL_ABORTED;
-	req->flags &= ~(REQ_F_SINGLE_POLL | REQ_F_DOUBLE_POLL);
-	req->flags |= REQ_F_POLLED;
+	io_req_switch_flags(req, REQ_F_SINGLE_POLL | REQ_F_DOUBLE_POLL,
+			    REQ_F_POLLED);
 	ipt.pt._qproc = io_async_queue_proc;
 
 	ret = __io_arm_poll_handler(req, &apoll->poll, &ipt, mask, issue_flags);
 	if (ret)
 		return ret > 0 ? IO_APOLL_READY : IO_APOLL_ABORTED;
@@ -983,11 +985,11 @@ int io_poll_add(struct io_kiocb *req, unsigned int issue_flags)
 	 * the entries of the previous round like io_arm_apoll() does, a stale
 	 * second entry would be taken for a third wait queue.
 	 */
 	if (req_has_async_data(req))
 		io_req_async_data_free(req);
-	req->flags &= ~(REQ_F_SINGLE_POLL | REQ_F_DOUBLE_POLL);
+	io_req_clear_flags(req, REQ_F_SINGLE_POLL | REQ_F_DOUBLE_POLL);
 
 	ret = __io_arm_poll_handler(req, poll, &ipt, poll->events, issue_flags);
 	if (ret > 0) {
 		io_req_set_res(req, ipt.result_mask, 0);
 		return IOU_COMPLETE;
diff --git a/io_uring/refs.h b/io_uring/refs.h
index 021bf0cd66af..e9a52b94a838 100644
--- a/io_uring/refs.h
+++ b/io_uring/refs.h
@@ -1,11 +1,11 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #ifndef IOU_REQ_REF_H
 #define IOU_REQ_REF_H
 
 #include <linux/atomic.h>
-#include <linux/io_uring_types.h>
+#include <linux/io_uring.h>
 
 /*
  * Shamelessly stolen from the mm implementation of page reference checking,
  * see commit f958d7b528b1 for details.
  */
@@ -49,11 +49,11 @@ static inline void req_ref_put(struct io_kiocb *req)
 }
 
 static inline void __io_req_set_refcount(struct io_kiocb *req, int nr)
 {
 	if (!(req->flags & REQ_F_REFCOUNT)) {
-		req->flags |= REQ_F_REFCOUNT;
+		io_req_set_flags(req, REQ_F_REFCOUNT);
 		atomic_set(&req->refs, nr);
 	}
 }
 
 /*
diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 07813d45a1d4..f0cee098964a 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -1357,21 +1357,21 @@ inline struct io_rsrc_node *io_find_buf_node(struct io_kiocb *req,
 	struct io_ring_ctx *ctx = req->ctx;
 	struct io_rsrc_node *node;
 
 	if (req->flags & REQ_F_BUF_NODE)
 		return req->buf_node;
-	req->flags |= REQ_F_BUF_NODE;
+	io_req_set_flags(req, REQ_F_BUF_NODE);
 
 	io_ring_submit_lock(ctx, issue_flags);
 	node = io_rsrc_node_lookup(&ctx->buf_table, req->buf_index);
 	if (node) {
 		node->refs++;
 		req->buf_node = node;
 		io_ring_submit_unlock(ctx, issue_flags);
 		return node;
 	}
-	req->flags &= ~REQ_F_BUF_NODE;
+	io_req_clear_flags(req, REQ_F_BUF_NODE);
 	io_ring_submit_unlock(ctx, issue_flags);
 	return NULL;
 }
 
 int __io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
@@ -1852,11 +1852,11 @@ int __io_import_reg_vec(int ddir, struct iov_iter *iter,
 		memcpy(tmp_vec.iovec + iovec_off, iov, sizeof(*iov) * nr_iovs);
 		io_vec_free(vec);
 
 		*vec = tmp_vec;
 		iov = vec->iovec + iovec_off;
-		req->flags |= REQ_F_NEED_CLEANUP;
+		io_req_set_flags(req, REQ_F_NEED_CLEANUP);
 	}
 
 	if (imu->flags & IO_REGBUF_F_KBUF)
 		return io_vec_fill_kern_bvec(ddir, iter, imu, iov, nr_iovs, vec);
 
@@ -1872,19 +1872,19 @@ int io_prep_reg_iovec(struct io_kiocb *req, struct iou_vec *iv,
 
 	if (uvec_segs > iv->nr) {
 		ret = io_vec_realloc(iv, uvec_segs);
 		if (ret)
 			return ret;
-		req->flags |= REQ_F_NEED_CLEANUP;
+		io_req_set_flags(req, REQ_F_NEED_CLEANUP);
 	}
 
 	/* pad iovec to the right */
 	iovec_off = iv->nr - uvec_segs;
 	iov = iv->iovec + iovec_off;
 	res = iovec_from_user(uvec, uvec_segs, uvec_segs, iov,
 			      io_is_compat(req->ctx));
 	if (IS_ERR(res))
 		return PTR_ERR(res);
 
-	req->flags |= REQ_F_IMPORT_BUFFER;
+	io_req_set_flags(req, REQ_F_IMPORT_BUFFER);
 	return 0;
 }
diff --git a/io_uring/rw.c b/io_uring/rw.c
index 1239405fe98f..7f9b9448dac1 100644
--- a/io_uring/rw.c
+++ b/io_uring/rw.c
@@ -87,11 +87,11 @@ static int io_import_vec(int ddir, struct io_kiocb *req,
 	ret = __import_iovec(ddir, uvec, uvec_segs, nr_segs, &iov, &io->iter,
 			     io_is_compat(req->ctx));
 	if (unlikely(ret < 0))
 		return ret;
 	if (iov) {
-		req->flags |= REQ_F_NEED_CLEANUP;
+		io_req_set_flags(req, REQ_F_NEED_CLEANUP);
 		io_vec_reset_iovec(&io->vec, iov, io->iter.nr_segs);
 	}
 	return 0;
 }
 
@@ -178,11 +178,11 @@ static void io_req_rw_cleanup(struct io_kiocb *req, unsigned int issue_flags)
 	 * path should assume that a successful (or -EIOCBQUEUED) return can
 	 * mean that the underlying data can be gone at any time. But that
 	 * should be fixed separately, and then this check could be killed.
 	 */
 	if (!(req->flags & (REQ_F_REISSUE | REQ_F_REFCOUNT))) {
-		req->flags &= ~REQ_F_NEED_CLEANUP;
+		io_req_clear_flags(req, REQ_F_NEED_CLEANUP);
 		if (!io_rw_recycle(req, issue_flags)) {
 			struct io_async_rw *rw = req->async_data;
 
 			io_vec_free(&rw->vec);
 		}
@@ -196,11 +196,11 @@ static int io_rw_alloc_async(struct io_kiocb *req)
 
 	if (!io_uring_alloc_cached_async_data(&ctx->rw_cache, req))
 		return -ENOMEM;
 	rw = req->async_data;
 	if (rw->vec.iovec)
-		req->flags |= REQ_F_NEED_CLEANUP;
+		io_req_set_flags(req, REQ_F_NEED_CLEANUP);
 	rw->bytes_done = 0;
 	return 0;
 }
 
 static inline void io_meta_save_state(struct io_async_rw *io)
@@ -237,11 +237,11 @@ static int io_prep_rw_pi(struct io_kiocb *req, struct io_rw *rw, int ddir,
 	io->meta.seed = pi_attr.seed;
 	ret = import_ubuf(ddir, u64_to_user_ptr(pi_attr.addr),
 			  pi_attr.len, &io->meta.iter);
 	if (unlikely(ret < 0))
 		return ret;
-	req->flags |= REQ_F_HAS_METADATA;
+	io_req_set_flags(req, REQ_F_HAS_METADATA);
 	io_meta_save_state(io);
 	return ret;
 }
 
 static int __io_prep_rw(struct io_kiocb *req, const struct io_uring_sqe *sqe,
@@ -394,11 +394,11 @@ static int io_rw_import_reg_vec(struct io_kiocb *req,
 	ret = io_import_reg_vec(ddir, &io->iter, req, &io->vec,
 				uvec_segs, issue_flags);
 	if (unlikely(ret))
 		return ret;
 	iov_iter_save_state(&io->iter, &io->iter_state);
-	req->flags &= ~REQ_F_IMPORT_BUFFER;
+	io_req_clear_flags(req, REQ_F_IMPORT_BUFFER);
 	return 0;
 }
 
 static int io_rw_prep_reg_vec(struct io_kiocb *req)
 {
@@ -448,11 +448,11 @@ int io_read_mshot_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 		return ret;
 
 	if (rw->addr || rw->len)
 		return -EINVAL;
 
-	req->flags |= REQ_F_APOLL_MULTISHOT;
+	io_req_set_flags(req, REQ_F_APOLL_MULTISHOT);
 	return 0;
 }
 
 void io_readv_writev_cleanup(struct io_kiocb *req)
 {
@@ -469,11 +469,11 @@ static inline loff_t *io_kiocb_update_pos(struct io_kiocb *req)
 
 	if (rw->kiocb.ki_pos != -1)
 		return &rw->kiocb.ki_pos;
 
 	if (!(req->file->f_mode & FMODE_STREAM)) {
-		req->flags |= REQ_F_CUR_POS;
+		io_req_set_flags(req, REQ_F_CUR_POS);
 		rw->kiocb.ki_pos = req->file->f_pos;
 		return &rw->kiocb.ki_pos;
 	}
 
 	rw->kiocb.ki_pos = 0;
@@ -542,11 +542,11 @@ static void io_req_io_end(struct io_kiocb *req)
 static void __io_complete_rw_common(struct io_kiocb *req, long res)
 {
 	if (res == req->cqe.res)
 		return;
 	if ((res == -EOPNOTSUPP || res == -EAGAIN) && io_rw_should_reissue(req)) {
-		req->flags |= REQ_F_REISSUE | REQ_F_BL_NO_RECYCLE;
+		io_req_set_flags(req, REQ_F_REISSUE | REQ_F_BL_NO_RECYCLE);
 	} else {
 		req_set_fail(req);
 		req->cqe.res = res;
 	}
 }
@@ -603,11 +603,11 @@ static void io_complete_rw_iopoll(struct kiocb *kiocb, long res)
 
 	if (kiocb->ki_flags & IOCB_WRITE)
 		io_req_end_write(req);
 
 	if (res == -EAGAIN && io_rw_should_reissue(req))
-		req->flags |= REQ_F_REISSUE | REQ_F_BL_NO_RECYCLE;
+		io_req_set_flags(req, REQ_F_REISSUE | REQ_F_BL_NO_RECYCLE);
 	else if (unlikely(final_res != req->cqe.res))
 		req->cqe.res = final_res;
 
 	/* order with io_iopoll_complete() checking ->iopoll_completed */
 	smp_store_release(&req->iopoll_completed, 1);
@@ -840,11 +840,11 @@ static int io_rw_init_file(struct io_kiocb *req, fmode_t mode, int rw_type)
 
 	if (unlikely(!(file->f_mode & mode)))
 		return -EBADF;
 
 	if (!(req->flags & REQ_F_FIXED_FILE))
-		req->flags |= io_file_get_flags(file);
+		io_req_set_flags(req, io_file_get_flags(file));
 
 	kiocb->ki_flags = file->f_iocb_flags;
 	ret = kiocb_set_rw_flags(kiocb, rw->flags, rw_type);
 	if (unlikely(ret))
 		return ret;
@@ -854,23 +854,23 @@ static int io_rw_init_file(struct io_kiocb *req, fmode_t mode, int rw_type)
 	 * supports async. Otherwise it's impossible to use O_NONBLOCK files
 	 * reliably. If not, or it IOCB_NOWAIT is set, don't retry.
 	 */
 	if (kiocb->ki_flags & IOCB_NOWAIT ||
 	    ((file->f_flags & O_NONBLOCK && !(req->flags & REQ_F_SUPPORT_NOWAIT))))
-		req->flags |= REQ_F_NOWAIT;
+		io_req_set_flags(req, REQ_F_NOWAIT);
 
 	if (ctx->flags & IORING_SETUP_IOPOLL) {
 		if (!(kiocb->ki_flags & IOCB_DIRECT) || !file->f_op->iopoll)
 			return -EOPNOTSUPP;
-		req->flags |= REQ_F_IOPOLL;
+		io_req_set_flags(req, REQ_F_IOPOLL);
 		kiocb->private = NULL;
 		kiocb->ki_flags |= IOCB_HIPRI;
 		req->iopoll_completed = 0;
 		req->cqe.flags = 0;
 		if (ctx->flags & IORING_SETUP_HYBRID_IOPOLL) {
 			/* make sure every req only blocks once*/
-			req->flags &= ~REQ_F_IOPOLL_STATE;
+			io_req_clear_flags(req, REQ_F_IOPOLL_STATE);
 			req->iopoll_start = ktime_get_ns();
 		}
 	} else {
 		if (kiocb->ki_flags & IOCB_HIPRI)
 			return -EINVAL;
@@ -1277,11 +1277,11 @@ static u64 io_hybrid_iopoll_delay(struct io_ring_ctx *ctx, struct io_kiocb *req)
 
 	/* Using half the running time to do schedule */
 	sleep_time = ctx->hybrid_poll_time / 2;
 
 	kt = ktime_set(0, sleep_time);
-	req->flags |= REQ_F_IOPOLL_STATE;
+	io_req_set_flags(req, REQ_F_IOPOLL_STATE);
 
 	mode = HRTIMER_MODE_REL;
 	hrtimer_setup_sleeper_on_stack(&timer, CLOCK_MONOTONIC, mode);
 	hrtimer_set_expires(&timer.timer, kt);
 	set_current_state(TASK_INTERRUPTIBLE);
diff --git a/io_uring/splice.c b/io_uring/splice.c
index e81ebbb91925..efa341c4fc55 100644
--- a/io_uring/splice.c
+++ b/io_uring/splice.c
@@ -35,11 +35,11 @@ static int __io_splice_prep(struct io_kiocb *req,
 	sp->flags = READ_ONCE(sqe->splice_flags);
 	if (unlikely(sp->flags & ~valid_flags))
 		return -EINVAL;
 	sp->splice_fd_in = READ_ONCE(sqe->splice_fd_in);
 	sp->rsrc_node = NULL;
-	req->flags |= REQ_F_FORCE_ASYNC;
+	io_req_set_flags(req, REQ_F_FORCE_ASYNC);
 	return 0;
 }
 
 int io_tee_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 {
@@ -71,11 +71,11 @@ static struct file *io_splice_get_file(struct io_kiocb *req,
 	node = io_rsrc_node_lookup(&ctx->file_table.data, sp->splice_fd_in);
 	if (node) {
 		node->refs++;
 		sp->rsrc_node = node;
 		file = io_slot_file(node);
-		req->flags |= REQ_F_NEED_CLEANUP;
+		io_req_set_flags(req, REQ_F_NEED_CLEANUP);
 	}
 	io_ring_submit_unlock(ctx, issue_flags);
 	return file;
 }
 
diff --git a/io_uring/statx.c b/io_uring/statx.c
index 7bcae4a6c4a3..9a5689aaceca 100644
--- a/io_uring/statx.c
+++ b/io_uring/statx.c
@@ -40,12 +40,11 @@ int io_statx_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	ret = delayed_getname_uflags(&sx->filename, path, sx->flags);
 
 	if (unlikely(ret))
 		return ret;
 
-	req->flags |= REQ_F_NEED_CLEANUP;
-	req->flags |= REQ_F_FORCE_ASYNC;
+	io_req_set_flags(req, REQ_F_NEED_CLEANUP | REQ_F_FORCE_ASYNC);
 	return 0;
 }
 
 int io_statx(struct io_kiocb *req, unsigned int issue_flags)
 {
diff --git a/io_uring/sync.c b/io_uring/sync.c
index ab7fa1cd7dd6..facf9064f915 100644
--- a/io_uring/sync.c
+++ b/io_uring/sync.c
@@ -30,11 +30,11 @@ int io_sfr_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 		return -EINVAL;
 
 	sync->off = READ_ONCE(sqe->off);
 	sync->len = READ_ONCE(sqe->len);
 	sync->flags = READ_ONCE(sqe->sync_range_flags);
-	req->flags |= REQ_F_FORCE_ASYNC;
+	io_req_set_flags(req, REQ_F_FORCE_ASYNC);
 
 	return 0;
 }
 
 int io_sync_file_range(struct io_kiocb *req, unsigned int issue_flags)
@@ -63,11 +63,11 @@ int io_fsync_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 
 	sync->off = READ_ONCE(sqe->off);
 	if (sync->off < 0)
 		return -EINVAL;
 	sync->len = READ_ONCE(sqe->len);
-	req->flags |= REQ_F_FORCE_ASYNC;
+	io_req_set_flags(req, REQ_F_FORCE_ASYNC);
 	return 0;
 }
 
 int io_fsync(struct io_kiocb *req, unsigned int issue_flags)
 {
@@ -92,11 +92,11 @@ int io_fallocate_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 		return -EINVAL;
 
 	sync->off = READ_ONCE(sqe->off);
 	sync->len = READ_ONCE(sqe->addr);
 	sync->mode = READ_ONCE(sqe->len);
-	req->flags |= REQ_F_FORCE_ASYNC;
+	io_req_set_flags(req, REQ_F_FORCE_ASYNC);
 	return 0;
 }
 
 int io_fallocate(struct io_kiocb *req, unsigned int issue_flags)
 {
diff --git a/io_uring/timeout.c b/io_uring/timeout.c
index fa54846ed4ce..864aec87b9b9 100644
--- a/io_uring/timeout.c
+++ b/io_uring/timeout.c
@@ -232,13 +232,13 @@ static void io_fail_links(struct io_kiocb *req)
 	if (!link)
 		return;
 
 	while (link) {
 		if (ignore_cqes)
-			link->flags |= REQ_F_CQE_SKIP;
+			io_req_set_flags(link, REQ_F_CQE_SKIP);
 		else
-			link->flags &= ~REQ_F_CQE_SKIP;
+			io_req_clear_flags(link, REQ_F_CQE_SKIP);
 		trace_io_uring_fail_link(req, link);
 		link = link->link;
 	}
 
 	link = req->link;
@@ -260,11 +260,11 @@ void io_disarm_next(struct io_kiocb *req)
 {
 	struct io_kiocb *link = NULL;
 
 	if (req->flags & REQ_F_ARM_LTIMEOUT) {
 		link = req->link;
-		req->flags &= ~REQ_F_ARM_LTIMEOUT;
+		io_req_clear_flags(req, REQ_F_ARM_LTIMEOUT);
 		if (link && link->opcode == IORING_OP_LINK_TIMEOUT) {
 			io_remove_next_linked(req);
 			io_req_queue_tw_complete(link, -ECANCELED);
 		}
 	} else if (req->flags & REQ_F_LINK_TIMEOUT) {
@@ -658,11 +658,11 @@ static int __io_timeout_prep(struct io_kiocb *req,
 		if (!link->head)
 			return -EINVAL;
 		if (link->last->opcode == IORING_OP_LINK_TIMEOUT)
 			return -EINVAL;
 		timeout->head = link->last;
-		link->last->flags |= REQ_F_ARM_LTIMEOUT;
+		io_req_set_flags(link->last, REQ_F_ARM_LTIMEOUT);
 		hrtimer_setup(&data->timer, io_link_timeout_fn, io_timeout_get_clock(data),
 			      data->mode);
 	} else {
 		hrtimer_setup(&data->timer, io_timeout_fn, io_timeout_get_clock(data), data->mode);
 	}
diff --git a/io_uring/truncate.c b/io_uring/truncate.c
index c88d8bd8d20e..52436c1e501f 100644
--- a/io_uring/truncate.c
+++ b/io_uring/truncate.c
@@ -28,11 +28,11 @@ int io_ftruncate_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	    sqe->splice_fd_in || sqe->addr3)
 		return -EINVAL;
 
 	ft->len = READ_ONCE(sqe->off);
 
-	req->flags |= REQ_F_FORCE_ASYNC;
+	io_req_set_flags(req, REQ_F_FORCE_ASYNC);
 	return 0;
 }
 
 int io_ftruncate(struct io_kiocb *req, unsigned int issue_flags)
 {
diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
index ba2d8c9028eb..0acc5e63a7d0 100644
--- a/io_uring/uring_cmd.c
+++ b/io_uring/uring_cmd.c
@@ -192,11 +192,11 @@ int io_uring_cmd_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 
 	if (!io_uring_alloc_cached_async_data(&req->ctx->cmd_cache, req))
 		return -ENOMEM;
 	ac = req->async_data;
 	if (ac->vec.iovec)
-		req->flags |= REQ_F_NEED_CLEANUP;
+		io_req_set_flags(req, REQ_F_NEED_CLEANUP);
 	ioucmd->sqe = sqe;
 	return 0;
 }
 
 /*
@@ -243,16 +243,16 @@ int io_uring_cmd(struct io_kiocb *req, unsigned int issue_flags)
 	if (ctx->flags & (IORING_SETUP_CQE32 | IORING_SETUP_CQE_MIXED))
 		issue_flags |= IO_URING_F_CQE32;
 	if (io_is_compat(ctx))
 		issue_flags |= IO_URING_F_COMPAT;
 	if (ctx->flags & IORING_SETUP_IOPOLL && file->f_op->uring_cmd_iopoll) {
-		req->flags |= REQ_F_IOPOLL;
+		io_req_set_flags(req, REQ_F_IOPOLL);
 		issue_flags |= IO_URING_F_IOPOLL;
 		req->iopoll_completed = 0;
 		if (ctx->flags & IORING_SETUP_HYBRID_IOPOLL) {
 			/* make sure every req only blocks once */
-			req->flags &= ~REQ_F_IOPOLL_STATE;
+			io_req_clear_flags(req, REQ_F_IOPOLL_STATE);
 			req->iopoll_start = ktime_get_ns();
 		}
 	}
 
 	ret = file->f_op->uring_cmd(ioucmd, issue_flags);
@@ -319,11 +319,11 @@ int io_cmd_poll_multishot(struct io_uring_cmd *cmd,
 	int ret;
 
 	if (likely(req->flags & REQ_F_APOLL_MULTISHOT))
 		return 0;
 
-	req->flags |= REQ_F_APOLL_MULTISHOT;
+	io_req_set_flags(req, REQ_F_APOLL_MULTISHOT);
 	mask &= ~EPOLLONESHOT;
 
 	ret = io_arm_apoll(req, issue_flags, mask);
 	return ret == IO_APOLL_OK ? -EIOCBQUEUED : -ECANCELED;
 }
diff --git a/io_uring/xattr.c b/io_uring/xattr.c
index 5303df3f247f..ecf43c7ad2f1 100644
--- a/io_uring/xattr.c
+++ b/io_uring/xattr.c
@@ -31,11 +31,11 @@ void io_xattr_cleanup(struct io_kiocb *req)
 	kvfree(ix->ctx.kvalue);
 }
 
 static void io_xattr_finish(struct io_kiocb *req, int ret)
 {
-	req->flags &= ~REQ_F_NEED_CLEANUP;
+	io_req_clear_flags(req, REQ_F_NEED_CLEANUP);
 
 	io_xattr_cleanup(req);
 	io_req_set_res(req, ret, 0);
 }
 
@@ -64,12 +64,11 @@ static int __io_getxattr_prep(struct io_kiocb *req,
 	if (ret) {
 		kfree(ix->ctx.kname);
 		return ret;
 	}
 
-	req->flags |= REQ_F_NEED_CLEANUP;
-	req->flags |= REQ_F_FORCE_ASYNC;
+	io_req_set_flags(req, REQ_F_NEED_CLEANUP | REQ_F_FORCE_ASYNC);
 	return 0;
 }
 
 int io_fgetxattr_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 {
@@ -141,12 +140,11 @@ static int __io_setxattr_prep(struct io_kiocb *req,
 	if (ret) {
 		kfree(ix->ctx.kname);
 		return ret;
 	}
 
-	req->flags |= REQ_F_NEED_CLEANUP;
-	req->flags |= REQ_F_FORCE_ASYNC;
+	io_req_set_flags(req, REQ_F_NEED_CLEANUP | REQ_F_FORCE_ASYNC);
 	return 0;
 }
 
 int io_setxattr_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 {
-- 
2.56.1

