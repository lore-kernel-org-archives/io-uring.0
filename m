Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A0C2701D9;
	Wed, 23 Sep 2026 01:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790126686; cv=none; b=SV2fZrkMzIlDZPbAkPCkLFYjivZ8hEvK28SMwDNmhOOrcOoDWb+t4aKojlqDUbRTtQXJ8hJRU3i5PY9+S+XYBVTcdLKy+tpi2crdlO47gAWFTJE5CPDSZdDS6Yhohtz27OfhJDgrveTH8T3UrVWU81RJCK94uniZ9fRYnSpeUas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790126686; c=relaxed/simple;
	bh=b3c5Ia1AWvjLt2to6fKpPfhbksG3n/HircdG9CPUJUM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=la9vGnnJCs9ayDa1ikW804zRErzV0Ycd8IBp0+meIm8SSfriE/+kZnsTbjah/+Nr20rPAKEeSTIVtgOzWpt/gCmmH5fIY8mAfZAxpcVUglGMlzZAhIojbRTqSlxU/fDnH2qmLD5iqcNt0Sm+7/oYUAkF3ke1IAEkvk9kDZuoj44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=pHjVGAtd; arc=none smtp.client-ip=113.46.200.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="pHjVGAtd"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ncO+0ljpVZ+Qg+Yo2lC5Wdk3yJUYrQn60Hlf5stdXf0=;
	b=pHjVGAtdbR3hqFEjfMvq9yoZdMSr7L/w4FZpjabNO6oFPCuWFxZ9U1lleHYGdlE7zfv1U6H8k
	4L88GHX3ZMHBZoxVK78ZFGYPLgmgxxCB7qZadsif8LuCqInBkfSW3Zo2i3hLyrqn7xog/tZNUty
	WBABx0iJw0gfJ3KOBEnYFLM=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hqJr66PxqzKm8V;
	Wed, 23 Sep 2026 09:13:26 +0800 (CST)
Received: from dggpemr500006.china.huawei.com (unknown [7.185.36.185])
	by mail.maildlp.com (Postfix) with ESMTPS id 627A04057A;
	Wed, 23 Sep 2026 09:24:33 +0800 (CST)
Received: from localhost.localdomain (10.50.85.180) by
 dggpemr500006.china.huawei.com (7.185.36.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 23 Sep 2026 09:24:32 +0800
From: Yao Kai <yaokai34@huawei.com>
To: <asml.silence@gmail.com>
CC: <axboe@kernel.dk>, <io-uring@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <liuyongqiang13@huawei.com>,
	<yaokai34@huawei.com>
Subject: [PATCH v2] io_uring: initialize task context before running the BPF loop
Date: Wed, 23 Sep 2026 09:43:10 +0800
Message-ID: <20260923014310.591292-1-yaokai34@huawei.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <d6d9cb28-50f1-474c-ba11-d634fcaad394@gmail.com>
References: <d6d9cb28-50f1-474c-ba11-d634fcaad394@gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemr500006.china.huawei.com (7.185.36.185)

Submitting SQEs through an io_uring BPF loop can trigger a NULL pointer
dereference in io_submit_sqes(), as shown by the following arm64 report:

  [ 2049.380301] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
  [ 2049.388788] pc : io_submit_sqes+0x48/0x6c4
  [ 2049.389153] lr : bpf_io_uring_submit_sqes+0x10/0x1c
  [ 2049.396310] Call trace:
  [ 2049.396531]  io_submit_sqes+0x48/0x6c4 (P)
  [ 2049.396893]  bpf_io_uring_submit_sqes+0x10/0x1c
  [ 2049.397293]  bpf_prog_1a2a95cb199202b5+0x3c/0x68
  [ 2049.397699]  bpf__io_uring_bpf_ops_loop_step+0x5c/0x94
  [ 2049.398149]  io_run_loop+0x70/0x2e4
  [ 2049.398461]  __arm64_sys_io_uring_enter+0xf0/0x710
  [ 2049.398882]  invoke_syscall+0x54/0x10c
  [ 2049.399414]  el0_svc_common.constprop.0+0x40/0xe0
  [ 2049.399829]  do_el0_svc+0x1c/0x28
  [ 2049.400125]  el0_svc+0x38/0x1d0
  [ 2049.400409]  el0t_64_sync_handler+0xa0/0xe4
  [ 2049.400779]  el0t_64_sync+0x198/0x19c

io_uring_enter() dispatches to io_run_loop() before reaching the normal
submission path's io_uring_add_tctx_node() call. The loop only checks
whether the caller is allowed to run task work; it does not initialize
current->io_uring or associate the task with the ring. A BPF call to
bpf_io_uring_submit_sqes() then reaches io_get_task_refs(), which assumes
that current->io_uring is valid.

A ring created with IORING_SETUP_R_DISABLED, IORING_SETUP_SINGLE_ISSUER
and IORING_SETUP_DEFER_TASKRUN can be enabled by a different task that
has never used io_uring. Enabling the ring makes that task the submitter
without allocating its io_uring task context. Its first BPF-driven
submission of a pending SQE can therefore cause a kernel Oops.

Call io_uring_add_tctx_node() in io_run_loop() before invoking the loop
and propagate any initialization error. Do this before acquiring
uring_lock, since task context setup may acquire the same mutex. This
also establishes the task-to-ring association used for cancellation.

Fixes: 033af2b3eb19 ("io_uring: introduce callback driven main loop")
Signed-off-by: Yao Kai <yaokai34@huawei.com>
---
 io_uring/loop.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/io_uring/loop.c b/io_uring/loop.c
index bbbb6ef14e6a..3d472b7827fa 100644
--- a/io_uring/loop.c
+++ b/io_uring/loop.c
@@ -2,6 +2,7 @@
 #include "io_uring.h"
 #include "wait.h"
 #include "loop.h"
+#include "tctx.h"
 
 static inline int io_loop_nr_cqes(const struct io_ring_ctx *ctx,
 				  const struct iou_loop_params *lp)
@@ -81,6 +82,10 @@ int io_run_loop(struct io_ring_ctx *ctx)
 {
 	int ret;
 
+	ret = io_uring_add_tctx_node(ctx);
+	if (unlikely(ret))
+		return ret;
+
 	if (!io_allowed_run_tw(ctx))
 		return -EEXIST;
 
-- 
2.43.0

