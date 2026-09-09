Received: from mail-ot1-f98.google.com (mail-ot1-f98.google.com [209.85.210.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB99E576EB5
	for <io-uring@vger.kernel.org>; Wed,  9 Sep 2026 15:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788969571; cv=none; b=c++xnxtiZhM1UK1WmhVx6AptWcFhstgwqbFc49UDVltCUmbyOAZnG+cnKtwPinId0JJMObS7F9dYgmWqbR24VtHJWTTv0zmk13XQXfcjkN5+8ujkaht9RSNRhPHhtoyCI4PNl/QNIsdjYH19VSj42mVgj6JsW1b9A6xT2ggCySo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788969571; c=relaxed/simple;
	bh=m8PHHIvMElAA04zgDUMJs6ZPuE/FVKypUdqvJz4oiy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fiXzMLuUpN1YzRQKxgpP/XwX6DP3VepV2z85IloGxjN5ukVUx4kfKcFPu+2CxpwkOo6ebSduXuxxbXyFcRIHy3RvMu7gf3rmLU5knwHiF+km2AXh4kkg7Ou+by92eAbARPMIPEenjG1rMmIhGNltY5DIWcxQQ7ori+wvNgpNi+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=dvqarzwV; arc=none smtp.client-ip=209.85.210.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="dvqarzwV"
Received: by mail-ot1-f98.google.com with SMTP id 46e09a7af769-7f421638271so69681a34.3
        for <io-uring@vger.kernel.org>; Wed, 09 Sep 2026 08:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788969568; x=1789574368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X+pMe6zV5KmHjmCdDkn3PgSMEGRc3mfq+qsXjrF4xPM=;
        b=dvqarzwVym6eOHVDNEKY9ewNfgqudh9asCrWKbQCJBbHMfULjrOc+MQDlQWzCudV/W
         /XloHEJgEDujVoyUn2gfEtNIXLxtYc05O1B3DhqQTarSPCsuLUy1D1bTMEykfvDOnv8q
         oLOZCHGbnHIxwPdVyyB3y5TQBWWPrCNPg2FdMXEtYBEZrSrIrdsLllGkBhoTWtaztuAH
         GIuiwN/Ua0rsfC350TtZ2wYrHosrL03UaxM/l3MvSj+Tu+cu2lnI+Jbcl8kR6h+wKc8/
         dbUAACBugQmKghPROvnh+3DTHqiItItYWEQUGz4UQx6TEcedrREA50S1S/NAs3cLI/Er
         j6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788969568; x=1789574368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X+pMe6zV5KmHjmCdDkn3PgSMEGRc3mfq+qsXjrF4xPM=;
        b=QxaFoGjxDLCFTnRwcaeNanaCcs2gnaYHlPR7F/qQbBdYqXTBQNyqcFJGASe7aRiJuH
         UqAcLNscG7NxLCVo1x0C/S7OxNmhH20648fUuj/Jap2flL0q4ak2lx41KTtHs+k4JY7H
         cqLeYtZqnpA1sOePmeljBdy25QoMNc0pgVuwvQ+LfzAaFIM2A/LiMtDzEGVFjrXGWRBj
         XjbrdxqLoevf+Ww0+hPrWGJZGP20Mi3JuGA67/OK9XigLpDuEE22MzLhUhpFa5hTO3O0
         fUrf7XWVbI1Fv1dZyeEgF8+gzBkfbgxEq6i41WD9ByblPccpyS2ZxtO36ipx7yfLRtLn
         lS4w==
X-Forwarded-Encrypted: i=1; AKwUvBwG324LwBs+sfQtZzGLwNQxnG//9ZxHoHp+fMpzJndAqB2cU6rU4yyE9ZU27hSEHSgZxLXkK1pEQA==@vger.kernel.org
X-Gm-Message-State: AFuF++lKLiCo4XDQY4OTlksOgsiZGZF/pdBmLhlGeEU8IMugTaCbOLXS
	kLixkTPvc63sxizs54WRFk1lKPEYLMT4C2BpPmJvvPifFZ6TWWIgfP1U4Q3xi1vkhVqmanK7vSo
	jpcsM9wrlGacIDtL7Bw/wSNDO/8r//E+3bpyQBjB3Mb47L8DeSnu2
X-Gm-Gg: AYBFou2Es016Bo23Hi6symgVlgsnMa5SGIuvzT/EN2SH3Tju4Gn70xS+YlVzE6pmvaD
	tQyWjKl84gQvMoHtEpintIlYHmt0KTkoVsk6dFn5o3/9s74j0STjp4Gb1POJwlC/23m3lBbjAUJ
	7COvrw+sSwHfj9knVZ+qWqPl9KdoR1c71st+AnZiWA+G4o9pGyoSVV2YQw82/YjuaIc0HZVatyA
	XAj38vkETdGCdnrqCF7CSG05yoOB5NSZDEaXYAIkqwWeHrEtd1crHZfbYybwYf2rKdLoh3g0WYV
	euXRdb/axvOCddffIrbIr/8i63wfelFbJKYz/189ja/7tpLyBsC6GHxnEuJ7lE791SDtXe2xbsK
	9uXFiSeRUbJrJTGLckg==
X-Received: by 2002:a05:6830:3c8e:b0:7f4:37a9:6df9 with SMTP id 46e09a7af769-7fb77233fb0mr18560557a34.0.1788969567677;
        Wed, 09 Sep 2026 08:59:27 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-7f9f668f694sm2368876a34.4.2026.09.09.08.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 08:59:27 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (bond0.slc5-n17m28-k8s.dev.purestorage.com [IPv6:2620:125:9025:20::a31:41f])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 3435E402AE;
	Wed,  9 Sep 2026 09:59:27 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 310C2E4026F; Wed,  9 Sep 2026 09:59:27 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>,
	Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Joanne Koong <joannelkoong@gmail.com>,
	Ming Lei <tom.leiming@gmail.com>,
	io-uring@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH v3 2/3] io_uring/cmd: split io_uring_cmd_set_res() from io_uring_cmd_done()
Date: Wed,  9 Sep 2026 09:58:47 -0600
Message-ID: <20260909155848.2069290-3-csander@purestorage.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909155848.2069290-1-csander@purestorage.com>
References: <20260909155848.2069290-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for setting the io_uring NVMe passthru CQE results from
the blk-mq request completion rather than the task work callback, split
out functions io_uring_cmd_set_res{,32}() from __io_uring_cmd_done().
io_uring_cmd_done{,32}() now call io_uring_cmd_set_res{,32}() and then
__io_uring_cmd_done(). This allows __io_uring_cmd_done() to be made
CQE-size-agnostic, with 3 fewer arguments.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
---
 include/linux/io_uring/cmd.h | 34 ++++++++++++++++++++++++++++------
 io_uring/uring_cmd.c         | 19 +------------------
 2 files changed, 29 insertions(+), 24 deletions(-)

diff --git a/include/linux/io_uring/cmd.h b/include/linux/io_uring/cmd.h
index 331dcbefe72f..2e4368d611ee 100644
--- a/include/linux/io_uring/cmd.h
+++ b/include/linux/io_uring/cmd.h
@@ -1,10 +1,11 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 #ifndef _LINUX_IO_URING_CMD_H
 #define _LINUX_IO_URING_CMD_H
 
 #include <uapi/linux/io_uring.h>
+#include <linux/io_uring.h>
 #include <linux/io_uring_types.h>
 #include <linux/blk-mq.h>
 
 /* only top 8 bits of sqe->uring_cmd_flags for kernel internal use */
 #define IORING_URING_CMD_CANCELABLE	(1U << 30)
@@ -39,10 +40,28 @@ static inline void io_uring_cmd_private_sz_check(size_t cmd_sz)
 #define io_uring_cmd_to_pdu(cmd, pdu_type) ( \
 	io_uring_cmd_private_sz_check(sizeof(pdu_type)), \
 	((pdu_type *)&(cmd)->pdu) \
 )
 
+static inline void io_uring_cmd_set_res(struct io_uring_cmd *cmd, s32 ret)
+{
+	struct io_kiocb *req = cmd_to_io_kiocb(cmd);
+
+	if (ret < 0)
+		req_set_fail(req);
+	io_req_set_res(req, ret, 0);
+}
+
+static inline void io_uring_cmd_set_res32(struct io_uring_cmd *cmd, s32 ret, u64 res2)
+{
+	struct io_kiocb *req = cmd_to_io_kiocb(cmd);
+
+	if (ret < 0)
+		req_set_fail(req);
+	io_req_set_res32(req, ret, 0, res2, 0);
+}
+
 #if defined(CONFIG_IO_URING)
 int io_uring_cmd_import_fixed(u64 ubuf, unsigned long len, int rw,
 			      struct iov_iter *iter,
 			      struct io_uring_cmd *ioucmd,
 			      unsigned int issue_flags);
@@ -54,15 +73,16 @@ int io_uring_cmd_import_fixed_vec(struct io_uring_cmd *ioucmd,
 
 /*
  * Completes the request, i.e. posts an io_uring CQE and deallocates @ioucmd
  * and the corresponding io_uring request.
  *
+ * io_uring_cmd_set_res()/io_uring_cmd_set_res32() must be called first.
+ *
  * Note: the caller should never hard code @issue_flags and is only allowed
  * to pass the mask provided by the core io_uring code.
  */
-void __io_uring_cmd_done(struct io_uring_cmd *cmd, s32 ret, u64 res2,
-			 unsigned issue_flags, bool is_cqe32);
+void __io_uring_cmd_done(struct io_uring_cmd *, unsigned issue_flags);
 
 void __io_uring_cmd_do_in_task(struct io_uring_cmd *ioucmd,
 			    io_req_tw_func_t task_work_cb,
 			    unsigned flags);
 
@@ -105,12 +125,12 @@ static inline int io_uring_cmd_import_fixed_vec(struct io_uring_cmd *ioucmd,
 						int ddir, struct iov_iter *iter,
 						unsigned issue_flags)
 {
 	return -EOPNOTSUPP;
 }
-static inline void __io_uring_cmd_done(struct io_uring_cmd *cmd, s32 ret,
-		u64 ret2, unsigned issue_flags, bool is_cqe32)
+static inline void __io_uring_cmd_done(struct io_uring_cmd *cmd,
+				       unsigned issue_flags)
 {
 }
 static inline void __io_uring_cmd_do_in_task(struct io_uring_cmd *ioucmd,
 			    io_req_tw_func_t task_work_cb, unsigned flags)
 {
@@ -171,17 +191,19 @@ static inline void *io_uring_cmd_ctx_handle(struct io_uring_cmd *cmd)
 }
 
 static inline void io_uring_cmd_done(struct io_uring_cmd *ioucmd, s32 ret,
 				     unsigned issue_flags)
 {
-	return __io_uring_cmd_done(ioucmd, ret, 0, issue_flags, false);
+	io_uring_cmd_set_res(ioucmd, ret);
+	__io_uring_cmd_done(ioucmd, issue_flags);
 }
 
 static inline void io_uring_cmd_done32(struct io_uring_cmd *ioucmd, s32 ret,
 				       u64 res2, unsigned issue_flags)
 {
-	return __io_uring_cmd_done(ioucmd, ret, res2, issue_flags, true);
+	io_uring_cmd_set_res32(ioucmd, ret, res2);
+	__io_uring_cmd_done(ioucmd, issue_flags);
 }
 
 int io_buffer_register_bvec(struct io_uring_cmd *cmd, struct request *rq,
 			    void (*release)(void *), unsigned int index,
 			    unsigned int issue_flags);
diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
index 726a659f38c3..3d5d8b5f4ebb 100644
--- a/io_uring/uring_cmd.c
+++ b/io_uring/uring_cmd.c
@@ -136,40 +136,23 @@ void __io_uring_cmd_do_in_task(struct io_uring_cmd *ioucmd,
 	req->io_task_work.func = task_work_cb;
 	__io_req_task_work_add(req, flags);
 }
 EXPORT_SYMBOL_GPL(__io_uring_cmd_do_in_task);
 
-static inline void io_req_set_cqe32_extra(struct io_kiocb *req,
-					  u64 extra1, u64 extra2)
-{
-	req->big_cqe.extra1 = extra1;
-	req->big_cqe.extra2 = extra2;
-}
-
 /*
  * Called by consumers of io_uring_cmd, if they originally returned
  * -EIOCBQUEUED upon receiving the command.
  */
-void __io_uring_cmd_done(struct io_uring_cmd *ioucmd, s32 ret, u64 res2,
-		       unsigned issue_flags, bool is_cqe32)
+void __io_uring_cmd_done(struct io_uring_cmd *ioucmd, unsigned issue_flags)
 {
 	struct io_kiocb *req = cmd_to_io_kiocb(ioucmd);
 
 	if (WARN_ON_ONCE(req->flags & REQ_F_APOLL_MULTISHOT))
 		return;
 
 	io_uring_cmd_del_cancelable(ioucmd, issue_flags);
 
-	if (ret < 0)
-		req_set_fail(req);
-
-	io_req_set_res(req, ret, 0);
-	if (is_cqe32) {
-		if (req->ctx->flags & IORING_SETUP_CQE_MIXED)
-			req->cqe.flags |= IORING_CQE_F_32;
-		io_req_set_cqe32_extra(req, res2, 0);
-	}
 	io_req_uring_cleanup(req, issue_flags);
 	if (req->flags & REQ_F_IOPOLL) {
 		/* order with io_do_iopoll() checking ->iopoll_completed */
 		smp_store_release(&req->iopoll_completed, 1);
 	} else if (issue_flags & IO_URING_F_COMPLETE_DEFER) {
-- 
2.55.0

