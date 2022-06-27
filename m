Return-Path: <io-uring-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95349C433EF
	for <io-uring@archiver.kernel.org>; Mon, 27 Jun 2022 13:36:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235823AbiF0NgI (ORCPT <rfc822;io-uring@archiver.kernel.org>);
        Mon, 27 Jun 2022 09:36:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234557AbiF0NgH (ORCPT
        <rfc822;io-uring@vger.kernel.org>); Mon, 27 Jun 2022 09:36:07 -0400
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 820EE6362
        for <io-uring@vger.kernel.org>; Mon, 27 Jun 2022 06:36:06 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1656336965;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lq9xSQoJ1dWu1UNDvb4YbQASOJjgErq67w2TQXDxjEU=;
        b=n9ZdrxS+YNHp6JNV0IfqLJYpzZaE8j/EFfmFnubR9dRee1g5GND8kkeaz8SNCXAes2CBiz
        bGj/HNpGPMUsAQs5AzMteJ4Y2pjSfFrNGJDszvZoGRSLs6ua4IlJksKFlwNYCmj2gqF5dA
        rWVi+WU7dUPyN/oHnxHa931073g+OzA=
From:   Hao Xu <hao.xu@linux.dev>
To:     io-uring@vger.kernel.org
Cc:     Jens Axboe <axboe@kernel.dk>,
        Pavel Begunkov <asml.silence@gmail.com>
Subject: [PATCH 05/11] io-wq: fixed worker initialization
Date:   Mon, 27 Jun 2022 21:35:35 +0800
Message-Id: <20220627133541.15223-6-hao.xu@linux.dev>
In-Reply-To: <20220627133541.15223-1-hao.xu@linux.dev>
References: <20220627133541.15223-1-hao.xu@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Precedence: bulk
List-ID: <io-uring.vger.kernel.org>
X-Mailing-List: io-uring@vger.kernel.org

From: Hao Xu <howeyxu@tencent.com>

Implementation of the fixed worker initialization.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 io_uring/io-wq.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/io_uring/io-wq.c b/io_uring/io-wq.c
index 7775ba5fddba..70240b847112 100644
--- a/io_uring/io-wq.c
+++ b/io_uring/io-wq.c
@@ -779,6 +779,26 @@ void io_wq_worker_sleeping(struct task_struct *tsk)
 	io_wqe_dec_running(worker);
 }
 
+static void io_init_new_fixed_worker(struct io_wqe *wqe,
+				     struct io_worker *worker)
+{
+	struct io_wqe_acct *acct = io_wqe_get_acct(worker);
+	struct io_wqe_acct *iw_acct = &worker->acct;
+	unsigned index = acct->index;
+	unsigned *nr_fixed;
+
+	raw_spin_lock(&acct->lock);
+	nr_fixed = &acct->nr_fixed;
+	acct->fixed_workers[*nr_fixed] = worker;
+	worker->index = (*nr_fixed)++;
+	iw_acct->nr_works = 0;
+	iw_acct->max_works = acct->max_works;
+	iw_acct->index = index;
+	INIT_WQ_LIST(&iw_acct->work_list);
+	raw_spin_lock_init(&iw_acct->lock);
+	raw_spin_unlock(&acct->lock);
+}
+
 static void io_init_new_worker(struct io_wqe *wqe, struct io_worker *worker,
 			       struct task_struct *tsk)
 {
@@ -792,6 +812,8 @@ static void io_init_new_worker(struct io_wqe *wqe, struct io_worker *worker,
 	list_add_tail_rcu(&worker->all_list, &wqe->all_list);
 	worker->flags |= IO_WORKER_F_FREE;
 	raw_spin_unlock(&wqe->lock);
+	if (worker->flags & IO_WORKER_F_FIXED)
+		io_init_new_fixed_worker(wqe, worker);
 	wake_up_new_task(tsk);
 }
 
@@ -898,6 +920,8 @@ static bool create_io_worker(struct io_wq *wq, struct io_wqe *wqe,
 
 	if (index == IO_WQ_ACCT_BOUND)
 		worker->flags |= IO_WORKER_F_BOUND;
+	if (&wqe->fixed_acct[index] == acct)
+		worker->flags |= IO_WORKER_F_FIXED;
 
 	tsk = create_io_thread(io_wqe_worker, worker, wqe->node);
 	if (!IS_ERR(tsk)) {
-- 
2.25.1

