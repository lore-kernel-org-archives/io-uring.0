Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9BB4119F7
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092713; cv=none; b=j92lteQF+9VTwXbD1tE8BJ7igSEOsXx2Hrxtho6z18m3bntd2vYfbElQui9v80QKccolqUXcLiMKCPkMCnTV9sq+d0Ig82U4EFBeCFiHdl/Bv9x3xvCHOizab43FP7onBBdgjT6QUmY1ZSI/4rJ6gzh6FHN0lQGP6FbZCLb9WdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092713; c=relaxed/simple;
	bh=4TeJJK/uzD5RKUyt9ajPRYTxe0K+OnNQd1QRwai7Scg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jFaZPNrBVSYPFYfkW57REdTDwRswK9HBLHe0kquE1+snPVvQQQSGB4R5Dh2m9uiG9JLMaszfqtwKb0LwEhJl/6DlT0NBdJp6mistBXIYNBmXH5wO+amZpCQjAlo1QGLgpKx4SC2Jz9uTOgkNdN9fp7P18KGxRmHntZGX1ZaGxjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=U5MSQ5k0; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="U5MSQ5k0"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-918f75a68f0so89699256d6.1
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092711; x=1792697511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hZHIRvRi037Ftxf/xIdJSgwbUFI+sjRjnphaqC+QT3E=;
        b=U5MSQ5k0VEY6aQnC5ZdE/LtMxNZ3/rQI/qsq/usuQpI07rGpuO8hNV8g3SwaKvJkKY
         ShAu07v+J4FvVp9ZPpYjK+lSQD36hL1oqlDISrO59xqCbbmi2nE1/P7uUneDmD5gRcGI
         T3WhIeBt+9/1pzcCFDQJOeywTp/Ow53lmKtrSz+VlyeQY8xprt1AIAfRo4/RKnTdthyy
         ZM2e8PFnoOe/8kMJiCOmZPTwsyfJhWL9PUlOPzMUMFYagt79Zi/Wa4MN+X6dq+BJqA5o
         FyS99WVkaPe60iBrtxul02unTO/mqO7Ar+jWV5I5hmhNmwkPlb8FHBtc8kwf+VpiEBtH
         zdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092711; x=1792697511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hZHIRvRi037Ftxf/xIdJSgwbUFI+sjRjnphaqC+QT3E=;
        b=EPW7CFJuh+Ci4Tl6l4oudKhicsRk+ds4Hc4vU6noaW8okYmhiaBhWcps6fTNYLdbmA
         doZCAzRWLgSjKK5dX8DM0tAlKnqmljNDLk9odeuzVOXbzWXtfrPSaHftecrrcqtUMus4
         sbBOzoGaC5f3RE9zkqiBmrK8WHVze/MFPOI4SYj35S9QHirM9Pa7JRnV1l2YshhtoUvt
         IPwqcibh78M5uq2dR6/2YFU3gXvtmNqyyO9a7q+oa1DNlp5lSvq7YTVvGRUItbkUpqqv
         WPyaFAGUC6pdY04tBvPz3f40zS1gIIc9tSSxIisC9E2xtb3YTvxsm9NR1nc5DR3WtTyx
         fErQ==
X-Gm-Message-State: AFq9FYKma8DMNKWxvd/PBnnUZ3z7pWznqve9BPr2ECsKSk8rwcUPDMQE
	EL1J51X2Mn3IjbJLDT22vrRSTANoTCup65bzVeGqmDbofBTCx3jliNJGYBSEoIu5mUY=
X-Gm-Gg: AYBFou0N7obbJy3ks20Ketny3gLJrnIEIaeZ4Ym0ZBcz1sencSDZD6daIQg5FM0BXT+
	rCTvthAF+9hBVJTUrKQUVm+JYqdmZF9DlziMKx60QVsMTxiQ8Judr2BIX8bzvLt5IrTQvmdKmfj
	RSqRVBQ6ufiHVs1qNE+XoaOAY9pbctpZxIAOe+QhZCqS1nZQYYT549IyR0ks9aC7E0zKf1XKlUn
	vvq23UcVW2O4wcOHuAOAEdVVUFt9uadyjXs19lFDI6WzJCR9G6U+qZl/UXrmULqJWDg2jc7ehdQ
	ptq7+zxj0IxzDbeMtUHUuNtCMo+N3iHXOp7CDpNe/kete/FcqHYVSJedP1J8LlfnflGHIjsoXRc
	eh/u2fOlZYZyW3b3+H46bAKANL5F3P6YBVTqOiSu/j5Kv22scBP4VllOSc3+qqMXSuwGmlk5AHj
	mKx1gWZfbuuP++DfO80NdkN8ieIyQEoDLwMbzt7HFvxKEqYs+/OYyHYQHjL1Ly92BmsVWjU2B2q
	qa8qrT+22x6Cy8=
X-Received: by 2002:a05:6214:194b:b0:919:85a3:313e with SMTP id 6a1803df08f44-91b554c3f01mr343479356d6.17.1792092710899;
        Thu, 15 Oct 2026 12:31:50 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.248])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcba46ddfsm3516936d6.13.2026.10.15.12.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:31:50 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:30:45 +0000
Subject: [PATCH 21/43] io_uring/poll: drop stale double poll entry on rearm
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-21-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092658; l=2052;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=4TeJJK/uzD5RKUyt9ajPRYTxe0K+OnNQd1QRwai7Scg=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPAlqdvWnl7HsEr0BnvyE6sa1RlK1C6jT9gas0b+jfo06nD4T7qmJYUmP0qluYF+f9a4S3UV17a
 6Tc/OlcERtgs=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

A file that uses two wait queues for poll, e.g. a tty, gets a second
io_poll entry, which IORING_OP_POLL_ADD keeps in ->async_data until the
request is freed. io_poll_add() can run more than once for a request
though: IORING_OP_POLL_REMOVE with one of the update flags disarms and
rearms it, and io_poll_task_func() reissues it if a wake up turns out to
be spurious. The second poll_wait() of the new round then finds
*poll_ptr set, with ->head cleared by the disarm, and __io_queue_proc()
fails what it takes for a third wait queue with -EINVAL.

For an update that means that the poll request is completed with
-ECANCELED, while the update itself reports success. For a spurious wake
up, e.g. tcsetattr() on the polled tty, the poll request fails with
-EINVAL.

Free the old entry and clear the poll flags before arming, which is what
io_arm_apoll() does for internal polling. All entries have been removed
from their wait queues at that point.

Fixes: b69de288e913 ("io_uring: allow events and user_data update of running poll requests")
Fixes: 6e5aedb9324a ("io_uring/poll: attempt request issue after racy poll wakeup")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/poll.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/io_uring/poll.c b/io_uring/poll.c
index 577ae978bfc9..7dcb904e8fc3 100644
--- a/io_uring/poll.c
+++ b/io_uring/poll.c
@@ -918,6 +918,15 @@ int io_poll_add(struct io_kiocb *req, unsigned int issue_flags)
 
 	ipt.pt._qproc = io_poll_queue_proc;
 
+	/*
+	 * A poll update or a spurious wake up arms the request again. Forget
+	 * the entries of the previous round like io_arm_apoll() does, a stale
+	 * second entry would be taken for a third wait queue.
+	 */
+	if (req_has_async_data(req))
+		io_req_async_data_free(req);
+	req->flags &= ~(REQ_F_SINGLE_POLL | REQ_F_DOUBLE_POLL);
+
 	ret = __io_arm_poll_handler(req, poll, &ipt, poll->events, issue_flags);
 	if (ret > 0) {
 		io_req_set_res(req, ipt.result_mask, 0);

-- 
2.55.0

