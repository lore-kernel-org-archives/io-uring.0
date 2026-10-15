Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4D54A2076
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092707; cv=none; b=S1lkw0kyb95hRSOO4W7WFktJGtkoOpvLvcUR6bq/+L17t0kHSVeCuWsEt7NRgyK56QmZ6Ap3nC32LhXudqKZQM3B2f1e+f6S65qGICJzDTm/+JtAKuddGLOuWiy2nyu9Yhu/S9cGL1dw990CB39G3r4I9jXslUSkV8yKUxP8pSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092707; c=relaxed/simple;
	bh=azJSccmjZy7C27Yi0/btOc5sifCt/3Ks9aQqJ+VFU1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bmVezI4HO3mayduYfJfuu4n0m4Q+YA27LE0hAmz5EkOpewIdTlYTLArhgAYD0CMdxV7JYy7KxuBu6Q6YZIDjkQDCI6qdGhoCL79mc+V633gQh+WF5lw3puX+QVDZbRxibtVKfKnOby7w6I9HOlbdk5U2C3t+c3ww8UfBNwQriAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=MvEkt8H7; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="MvEkt8H7"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93e64d52949so537101885a.1
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092705; x=1792697505; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QEJcVCayZ3MifdH1lBBPlpSSN48QF6OPQ0R+vrG9M8U=;
        b=MvEkt8H7YZxUHS1F5fG+qdL8X7OImoyCyBad9aI2/nZkUgx6CN9oTHzBlHQtqQI2i/
         7wK21WJuUrGWd/eFP05IoziYaZ/Z8ZC6Rg2+dR18yhjqZE/QIgjaVXOoQFg8/C5R6Ies
         XF66+OiaT3fQIakh1LF/l9bB/bfXINvW8pWMzbhzvXfQrbyOz4iVlEizUNhZyu/gJ73j
         XlTSaPfOdI1LBTcQuPin4PGbJ+sBQ4EsbLaNm8ZsUU1Dk8sH/N/xZ7OEIaiFOm6EZqR6
         YgOuv3t9Zo9ytjAGyQ6Xn035/kOqEtKn8NobYATHYtp2PIlE+ZBa2Y9T8uOOMxdLktkf
         Tb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092705; x=1792697505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QEJcVCayZ3MifdH1lBBPlpSSN48QF6OPQ0R+vrG9M8U=;
        b=PC9VCNwjz17empGQgL8uuPhXG9KgCVyVbN780CFngZ6Jav2Uf4B8ypE6g2Nfm9FNlR
         JetfwXIdKX0F9HrxMh17npBN9vRDHZ4D8cZ5Y+8SLsyB0h2LpCO5u344r945ZHnP5jGr
         BHteuNcavXHO7R8LTSTBaPQY47LKsmR1yRIU+amBtRT7HY3eiWeT2v2OP9TDMT3eTyeW
         j0XnLAr2hk2KT33K5tSWVTTt35ZVUcj2YyDED3NaHCTDNV13/V8FZ8Y4nZKuQKj4DQHG
         BntLh3qayrn/f41PZ7pBqA6rallRLznUzyXeT+3Km8NBWli8TSyuBIhEh13ACfgqlVFu
         4dOg==
X-Gm-Message-State: AFq9FYL/4ccLVQKAm9tJkwFJQUH5rSuoBtvEUTKbYiBhkJGTTLPcg06K
	QHFQBJmHuOnefAwd5Dbg76jawo9RYdSPHjTDj3Y73L/kvdzwvy1cEfSxmt0IuFXzM0g=
X-Gm-Gg: AYBFou0ymcSAxRJlfZwL/5LyvBX5aJbAHl7IXNYQ+asogvY/Qgi8wwItFxkrrH53kS+
	KgxeXpLs0lbgcikTSI3mK5KGNCBr0GJC0wyr7aDn10eiPv7b3QsmqHkqxVkmR7qT30G+yAJoj9R
	blsc8SpaTUw/3qNcZ6rEfpgWX2gkyI1AG9WF1A/0hXQbPcW+S7rjbjx4f2XGGlo9t0UOm6+622E
	sf1AecGj2QACRnOqAzfqVNuoLKlC0yJT68Lydq/vl2O8gn32Oo8MahRQHQeFWXv2FBbneXBHrEz
	iaqHNiBZr/FVf34vPr17kdzXSUiKY2xsgyemCt2y5uDXeJ9i430O/r4f6fxNhqKZTI7PI39J5sZ
	XmGSnA7D+I0MyE7Gqs1QoDNAN8YaE5sYA0V98+07K27yG0YOudhFdlZEH4o4lnlW5c7i2k3Q2Iv
	FpnzIQVQC2+Nl0SzAwy5Z0lh2YIO5p5x5OEXdWN6klMjDqnAETNSaaYcOFa2UJRAuzphvELNg8y
	yO3ScNT12DLICOX/0lxDSztby0=
X-Received: by 2002:a05:620a:440e:b0:93e:9834:3863 with SMTP id af79cd13be357-93ebd22a0d3mr3291285485a.15.1792092704916;
        Thu, 15 Oct 2026 12:31:44 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb5a794sm3377416d6.39.2026.10.15.12.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:31:43 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:30:42 +0000
Subject: [PATCH 18/43] io_uring/cancel: let CANCEL_ALL find parked requests
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-18-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092658; l=3478;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=azJSccmjZy7C27Yi0/btOc5sifCt/3Ks9aQqJ+VFU1s=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNpGKXceM2DiFA5rrSk+1oNzyw6v2yZwnqjZ/nSpscXLjL/2ksAUGOOG7Z+FGbGW79Tg2yWKih1
 LKsSWf1ohUQw=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

A cancellation with IORING_ASYNC_CANCEL_ALL or _ANY goes on until it finds
nothing more. A request may stay where it was found for a while after it
has been cancelled, so each one that matches is stamped with the sequence
number of the cancellation, and is skipped from then on.

io_cancel_cb() does so for io-wq work as well. There is no need to:
pending work is taken off the list, and the workers are looked at once per
call. And it does harm. A request that is run by io-wq may be parked
while it still is the current work of the worker: poll gets armed for it,
or it is put on ->futex_list or ->waitid_list.

  io-wq worker                       io_try_cancel()
  io_wq_submit_work()
    io_arm_poll_handler()
      io_poll_add_hash()
                                       io_async_cancel_one()
                                         io_cancel_cb()
                                           stamps the request
                                         sets IO_WQ_WORK_CANCEL
                                         = -EALREADY
                                       io_poll_cancel()
                                         skips the request
                                       = -ENOENT
  io_assign_current_work(NULL)

The flag comes too late for the worker to see it, and the search that
would have found the request takes it for done. The cancellation returns,
and the request stays.

With a multishot poll, IOSQE_ASYNC, and IORING_OP_ASYNC_CANCEL with
IORING_ASYNC_CANCEL_ALL up to 63us later, that happens to 4 of 1,000
requests (4 CPUs, KVM).

Take the stamp off again if the work matches. If the request is found
on one of the lists it gets a new one, and io_cancel_cb() doesn't match it
a second time.

__io_async_cancel() tries the io-wq of the caller twice. So far the stamp
has kept it from counting work that is running there the second time.
Skip it instead, so that the number that is returned stays the same.

Fixes: 8e29da69fead ("io_uring: add support for IORING_ASYNC_CANCEL_ALL")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/cancel.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/io_uring/cancel.c b/io_uring/cancel.c
index 14d6ccf57668..6f7a6cf356c2 100644
--- a/io_uring/cancel.c
+++ b/io_uring/cancel.c
@@ -72,7 +72,16 @@ static bool io_cancel_cb(struct io_wq_work *work, void *data)
 	struct io_kiocb *req = container_of(work, struct io_kiocb, work);
 	struct io_cancel_data *cd = data;
 
-	return io_cancel_req_match(req, cd);
+	if (!io_cancel_req_match(req, cd))
+		return false;
+	/*
+	 * Pending work is gone once it has matched. Work that is running may
+	 * park the request where the same cancellation looks next. Don't make
+	 * it skip the request as one that it has dealt with.
+	 */
+	if (cd->flags & (IORING_ASYNC_CANCEL_ALL | IORING_ASYNC_CANCEL_ANY))
+		req->cancel_seq_set = false;
+	return true;
 }
 
 static int io_async_cancel_one(struct io_uring_task *tctx,
@@ -198,6 +207,9 @@ static int __io_async_cancel(struct io_cancel_data *cd,
 	mutex_lock(&ctx->tctx_lock);
 	ret = -ENOENT;
 	list_for_each_entry(node, &ctx->tctx_list, ctx_node) {
+		/* has been done above, don't count what is running there */
+		if (all && node->task->io_uring == tctx)
+			continue;
 		ret = io_async_cancel_one(node->task->io_uring, cd);
 		if (ret != -ENOENT) {
 			if (!all)

-- 
2.55.0

