Received: from mail-qt1-f228.google.com (mail-qt1-f228.google.com [209.85.160.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45092443AB4
	for <io-uring@vger.kernel.org>; Wed,  2 Sep 2026 22:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788389843; cv=none; b=MwmzigCwG/MQROb+G3VL0fQ2FKgxZIioNDkBNGS0ObEPbJFgxLH9UdzmcV5yVF6trwS8mEpPZBDoy7RdUj4iP+kjVSKeKnizwVbC29D+nmBh2+7ShQxs5WFF/5yUd4USLnoq6kdlTVMUSRBrzMnx04M0GnPKoVCjrVPN3ekknec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788389843; c=relaxed/simple;
	bh=rtX2yJ0PMTizZR3crUtJBoZuw5bByxWSzKfV5xRCwj0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tc57hJw/CXXDS5JFKb+nGuX9gZKOpfoUJMpq8PfuGuK3y+V5uOK3AVT26lE94RMkmvbcO+j78WOR3XpXL9EqG+wb28VvV7ywh1MtOXb1Tk4o2gxV+TSTZ45MS0qXNxtgCi5YlAZGuvSOUwB4FsnXRHHVh7dx6XjGAYfCPfDteDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=cGBlCymC; arc=none smtp.client-ip=209.85.160.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="cGBlCymC"
Received: by mail-qt1-f228.google.com with SMTP id d75a77b69052e-52d2dbc8c33so3282651cf.2
        for <io-uring@vger.kernel.org>; Wed, 02 Sep 2026 15:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788389835; x=1788994635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KUYT2j/8GNxf6la1oNmocjOMbToIkSTfNNWKQ6vs8go=;
        b=cGBlCymClNcaO7J0TSkxvoHABuXK4GSb37DKMVkuH6MGrCM1cu6GgHO9q3mno1OE41
         rLb7Wvhwi3pZHvYqJSaNi8roWJfvkQnBR0VldC8gZS9CHP0yClqTy5i8cqoHytkcvrfb
         BWMXJezyDJwWeQrePMVKaw5/515/Ar5yZofmP//Zsb0oakdFRLEA+VtrR8k0tw830z1+
         vKV51v6Eu/0jbRRFB0tkK7VdzbnFFx006yUj72GHPEV3QHUhn18TOyR6280gwXtkv2XH
         IFNFMnRkp+NSbFTSlFeneA7KLVirakbEg8IZNoMdy56v8cF+gMGWnIFo7g1lOXBQd841
         XbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788389835; x=1788994635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KUYT2j/8GNxf6la1oNmocjOMbToIkSTfNNWKQ6vs8go=;
        b=l61/NvfLDX6uvoGbGmDQUfOCM4BDhML2LjjXN9Tv9WPPGcrZfaWR46TK4HV29sKNTt
         c7weLT4lzEL9wN3quxQ8AKof8XgZ5/RrRAuS6mlJAEn+0bxzjEls50rF3yOfLz6cbTEr
         RjHwB2DnmK2z0JTEOU375Xlq3JV2Yv2HVHZ7xeeA80GN29SOQgtu/gN15m9K3u8W9s7T
         5h8xLpfaJUvZ2AbNNajOEUiOxreQjhsijawkSiqziZzzzfk93IoIQ3h8ON+PcA5Ql6jA
         SE0Rfl/QXFTdr6SxwjYtWSAX/Cmyz0vNn/p/3JxRd+Bb4HD2wudqAKWIoLAf+KeIaXkE
         Tjkw==
X-Forwarded-Encrypted: i=1; AKwUvBxthAcxDSpEET1IK+c+lenv7x5nW4Aw3wx3IKD41paKYPwFmk6hXQ6TEO5/tazXygac0LVN4BfJdg==@vger.kernel.org
X-Gm-Message-State: AFuF++mkWdwQW0EKWa9wZzR8Y3pkKg7uufs+aLPpcDR4VS79fHnIHP/5
	sw+9P8Dezn+Jz4d9TfDpODSWex4n/Gcq1/iernotpPVXRDsVQwpOlpV8qne7PUcCp2ewlcBbPHd
	IAbfWdFwOA1UZGlK7CShakr28UJcIPqNibuLvbgSCWGZ6/00gkR/3
X-Gm-Gg: AYBFou31R3V34W4lngUWTYrGdom0IsOyJHHgF2R4D0O+cdknFWT6XSDEfgN9m0gd7si
	R0nMapgAsfr/TEN7ErxlUHEwcpPPtIjZvYHMQdqhJRvVtdJi17y4lo2SO+BAWk7bpeSd5cCLBqo
	sHQT78rFQGJ5KNZV/bthuaGvtnNB7P+UXvMqTxZxaQFYbDdvITQlhIr5y95YIjWlFwf76y1s/Nv
	Z3CdffG7xFQG2FqwbAjofHwgoge+XyXdwnhEsj8MXTWE984HSCOiqJ51MwNtRFt8nT/evX7Ku2Z
	U0kEfzyQPVJyRsa2MHspdavs1GEESvqrP4Gx3/HF2qxxwl8jinwOcPVLsI8KgglTPI7+Y+U6uKc
	OMdhN/DqZC1HyQ+4s
X-Received: by 2002:a05:622a:283:b0:52b:4ec6:52c1 with SMTP id d75a77b69052e-53036ce96afmr58594011cf.3.1788389834170;
        Wed, 02 Sep 2026 15:57:14 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-5303319dea6sm377761cf.19.2026.09.02.15.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 15:57:14 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.112.12.104])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 7C5CD40420;
	Wed,  2 Sep 2026 16:57:13 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 70CBDE40404; Wed,  2 Sep 2026 16:57:13 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Joanne Koong <joannelkoong@gmail.com>,
	linux-nvme@lists.infradead.org,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH v2 1/2] io_uring/cmd: split io_uring_cmd_set_res() from io_uring_cmd_done()
Date: Wed,  2 Sep 2026 16:57:07 -0600
Message-ID: <20260902225708.2379840-2-csander@purestorage.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902225708.2379840-1-csander@purestorage.com>
References: <20260902225708.2379840-1-csander@purestorage.com>
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
---
 include/linux/io_uring/cmd.h | 23 +++++++++++++++++------
 io_uring/uring_cmd.c         | 33 ++++++++++++++++++---------------
 2 files changed, 35 insertions(+), 21 deletions(-)

diff --git a/include/linux/io_uring/cmd.h b/include/linux/io_uring/cmd.h
index 331dcbefe72f..67f2ef700c43 100644
--- a/include/linux/io_uring/cmd.h
+++ b/include/linux/io_uring/cmd.h
@@ -50,19 +50,21 @@ int io_uring_cmd_import_fixed_vec(struct io_uring_cmd *ioucmd,
 				  const struct iovec __user *uvec,
 				  size_t uvec_segs,
 				  int ddir, struct iov_iter *iter,
 				  unsigned issue_flags);
 
+void io_uring_cmd_set_res(struct io_uring_cmd *, s32 ret);
+void io_uring_cmd_set_res32(struct io_uring_cmd *, s32 ret, u64 res2);
+
 /*
  * Completes the request, i.e. posts an io_uring CQE and deallocates @ioucmd
  * and the corresponding io_uring request.
  *
  * Note: the caller should never hard code @issue_flags and is only allowed
  * to pass the mask provided by the core io_uring code.
  */
-void __io_uring_cmd_done(struct io_uring_cmd *cmd, s32 ret, u64 res2,
-			 unsigned issue_flags, bool is_cqe32);
+void __io_uring_cmd_done(struct io_uring_cmd *, unsigned issue_flags);
 
 void __io_uring_cmd_do_in_task(struct io_uring_cmd *ioucmd,
 			    io_req_tw_func_t task_work_cb,
 			    unsigned flags);
 
@@ -105,12 +107,19 @@ static inline int io_uring_cmd_import_fixed_vec(struct io_uring_cmd *ioucmd,
 						int ddir, struct iov_iter *iter,
 						unsigned issue_flags)
 {
 	return -EOPNOTSUPP;
 }
-static inline void __io_uring_cmd_done(struct io_uring_cmd *cmd, s32 ret,
-		u64 ret2, unsigned issue_flags, bool is_cqe32)
+static inline void io_uring_cmd_set_res(struct io_uring_cmd *cmd, s32 ret)
+{
+}
+static inline void io_uring_cmd_set_res32(struct io_uring_cmd *cmd, s32 ret,
+					  u64 res2)
+{
+}
+static inline void __io_uring_cmd_done(struct io_uring_cmd *cmd,
+				       unsigned issue_flags)
 {
 }
 static inline void __io_uring_cmd_do_in_task(struct io_uring_cmd *ioucmd,
 			    io_req_tw_func_t task_work_cb, unsigned flags)
 {
@@ -171,17 +180,19 @@ static inline void *io_uring_cmd_ctx_handle(struct io_uring_cmd *cmd)
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
index 726a659f38c3..917b32a921e6 100644
--- a/io_uring/uring_cmd.c
+++ b/io_uring/uring_cmd.c
@@ -136,40 +136,43 @@ void __io_uring_cmd_do_in_task(struct io_uring_cmd *ioucmd,
 	req->io_task_work.func = task_work_cb;
 	__io_req_task_work_add(req, flags);
 }
 EXPORT_SYMBOL_GPL(__io_uring_cmd_do_in_task);
 
-static inline void io_req_set_cqe32_extra(struct io_kiocb *req,
-					  u64 extra1, u64 extra2)
+void io_uring_cmd_set_res(struct io_uring_cmd *cmd, s32 ret)
 {
-	req->big_cqe.extra1 = extra1;
-	req->big_cqe.extra2 = extra2;
+	struct io_kiocb *req = cmd_to_io_kiocb(cmd);
+
+	if (ret < 0)
+		req_set_fail(req);
+	io_req_set_res(req, ret, 0);
 }
+EXPORT_SYMBOL_GPL(io_uring_cmd_set_res);
+
+void io_uring_cmd_set_res32(struct io_uring_cmd *cmd, s32 ret, u64 res2)
+{
+	struct io_kiocb *req = cmd_to_io_kiocb(cmd);
+
+	if (ret < 0)
+		req_set_fail(req);
+	io_req_set_res32(req, ret, 0, res2, 0);
+}
+EXPORT_SYMBOL_GPL(io_uring_cmd_set_res32);
 
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

