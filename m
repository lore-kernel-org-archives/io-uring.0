Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606754;
	b=Qo2jXkvUR3VwR38Ti/vklrtgEGnVvUNgHcvSiuZBG/1Ku5zqVXRUgi3kNalvp/WwDQsM
	 oRm2HCuncMjDTAJT3Db6syHCtTod8NAuSn+DzyxPN6KoVuwyhgXRuAFJziDxFfnMe9xL6
	 Q6OaRJ8j66/7434+bC8rfTjWCxIydYM4nicrgXTPPDgQH8CNV0US2INtEiLDi3xN3XGhO
	 f110PZvpwTVTxXcJ1KeEBsdBnaZsnMSD0uNXfilOG2Y87ASKdBB6EswOUGzgNsNbZ0do3
	 c26eaAwKtINzq/liTYav3iGHF0DtGJTioyoFR3CHEk3+tvtwSwpGppHhS/FpolqBsJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606754;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=DtwsatCPLKsCoVZYHI1d8zrdN2X3Ni/Ad7zKOiieJFI=;
	b=UxsEeQB8z4zYfNgw5M3R1kGvCQLuFw8XVcuenRKSof8/Xy+7cHWJ9D50/qj/VG1yb7FS
	 QoWDWM1Ib4wfmoNFxYUZV7uFr6GC3pAP1nv76VQKjqZmeC61mnFNwNmGk2qggXo7LrmBk
	 uf7UBTbSAT1vqSlaBIU6Tw4YERH6MaBiDGtlPUgB5UUdnlrYTPrpUtscfqCcoTwydbpzK
	 Nj4xQyRCKl0kE89fkadmYC5r2JDO5uLCPGEsWP36IWhUyOfwh8P5+JbYuMriaYG0bzumh
	 CWlHLEQdJxWPGULdsE5k84N7ONZUuMeKcRcbWR26CI4tvnAsuIs4rMRqgIbuAtE2mnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=ffvHWdjz;
	arc=none smtp.remote-ip=203.205.221.173
Received: from out203-205-221-173.mail.qq.com (out203-205-221-173.mail.qq.com [203.205.221.173])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A107606A32F;
	Mon,  2 Nov 2026 08:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A107606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=ffvHWdjz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793606745; bh=DtwsatCPLKsCoVZYHI1d8zrdN2X3Ni/Ad7zKOiieJFI=;
	h=From:To:Cc:Subject:Date;
	b=ffvHWdjzZ3fycMPJRy0hxAI4WRuP2tKh81mB0lkaCi7Fjmvfe7rpQgWRzRO3unzXI
	 mtwqgKaon2qR3ffM9+U3wywWhGuzu9cakpwejvNYmN9gWfEemZ+FsrxknG4POceD9t
	 IRjQNIRBX/IIKXXM9rMPlCu5NxFvvT0+z96e76A0=
Received: from shuai-VMware-Virtual-Platform.. ([117.158.156.199])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 16A838C7; Mon, 02 Nov 2026 16:05:42 +0800
X-QQ-mid: xmsmtpt1793606742tqdo72d4m
Message-ID: <tencent_BB08960D79E0261B5C1EB1E589787734E907@qq.com>
X-QQ-XMAILINFO: MllZffuBkEb5gdDMGD5ishy48tSBJhTo/zjvt2SavbjZ31QFyvExS8/+qgOwTG
	 My7uoP65pcyebXkDY/t/NExtkCCilOGBCmvDvqbRMxhvCvF0OPDyErUxtXkseonTAjy74bRs4rEC
	 Dp5n+qabBOEZiku4AafP/EG0rtYbz34aRbBrQisgnJuSvvFlvogB8V+3mB7ugRaIXYbre4SJkZZb
	 JpMhQwDuviu51WEo5mdguNno+latYKIh2pZLQvpXKuw5gFEOBj3Xd04tEI/gil1aNz0K142B3pel
	 yuRGs00dsE+W0fbchanvlHzqBH3wBUjkBHgd600iNBQ2KMXvUiUZpguQlRsasV/2iM4ET+GMCwHQ
	 xLDljeIzzyflqtMGs6fniQKt58LbCftMtaHufcFKr3P14zTlwnnne374SOOaTp0r2Yrv893MptYU
	 kDUg2cZyzR66K4A70n9iNpERDr6vcsrO0yhXSpvQzSD8hQmkbSH2fgjfwhu3POzu/2Po95fUzvEc
	 JJs8Kul3EUz4NSBPUX7a/yLRnuCCNzY4hAl01Xg9dvG/HdXk7rw9gC8jM7eSm/nfH3rfs/01lI3V
	 GpX8Yzyec4ZIRs7n7xIvl/f/Sal6+JWNn/21VeD6dVMM6OaCBWmVFfmAAtbCqLKiLnQSpUAfbGXH
	 nPGMqxKTQd1MC1A8rp0IzbnATuSpoKuw3C7bN1Zxmyo3ujTlmqep4DgoDe8xQWnYqnnEnBxpGP1g
	 L/fqZRa6RVFzKhkVkVnP1Un1313V/FFoyLLhfGtl2wBYDCwFiIG7gB0KfpmnTJCXlD4t4Upqmjuk
	 UyW0B5iS1b5jnVHzmLtlpbvoezu4xghMkKpJi6Us8meCEUCRmTOCph5q+MrPO3oWlRSvPqqFIoV3
	 C0qEdpw3b2e8aJoz1nDGsGslZByDnE6K5TaGSps1pMzzWZyuW+DiBhj/wNwE1OMlXfmybN/T7Xhp
	 0vKRA8zswMYhaRbDEZlBNbA32HV5nbfLX7jJLfKDPHP6Hx07azEHOJiUcqLYQ+SamKNb5aqPPqAU
	 SoqqhRvSKP92xO8tg3N5TObp1Kz7rrU5IcdFbycqCtrcu8GfV6mpBDiysHBxnEQdwoNVg/LXMbgf
	 Q/wdKMrCBYWkSZIxwCLxZccwmgQg==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Shuai Liu <847807867@qq.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+675af112519ca34f5502@syzkaller.appspotmail.com,
	Shuai Liu <847807867@qq.com>
Subject: [PATCH] io_uring/sqpoll: don't set IO_SQ_THREAD_SHOULD_STOP on thread exit
Date: Mon,  2 Nov 2026 16:05:42 +0800
X-OQ-MSGID: <20261102080542.214144-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
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

io_sq_thread_stop() carries a WARN_ON_ONCE() asserting that
IO_SQ_THREAD_SHOULD_STOP isn't set yet, i.e. that stopping the SQPOLL
thread is never attempted twice. Since commit 22d9db9fd64a
("io_uring/sqpoll: don't attach to a thread that is canceling"), the
SQPOLL thread itself sets that bit on its way out, so that
io_sq_offload_create() won't attach a new ring to a thread that is
canceling.

When the thread exits on a fatal signal, the bit is thus set before the
ring teardown gets to io_sq_thread_stop(), which now triggers the
warning on every such exit:

  WARNING: io_uring/sqpoll.c:88 at io_sq_thread_stop
  Workqueue: iou_exit io_ring_exit_work
  Call Trace:
   io_put_sq_data
   io_sq_thread_finish
   io_ring_ctx_free
   io_ring_exit_work

Introduce a separate IO_SQ_THREAD_EXITING bit for the thread marking
itself as on its way out, and check it in io_sq_offload_create() along
with IO_SQ_THREAD_SHOULD_STOP. IO_SQ_THREAD_SHOULD_STOP regains its
original meaning, "a stop has been requested", and the WARN_ON_ONCE()
holds again.

Reproduced with an SQPOLL ring and an immediate fatal signal: the
warning fires on v7.3.0+ (22d9db9fd64a present) and is gone with this
change.

Reported-by: syzbot+675af112519ca34f5502@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=675af112519ca34f5502
Fixes: 22d9db9fd64a ("io_uring/sqpoll: don't attach to a thread that is canceling")
Signed-off-by: Shuai Liu <847807867@qq.com>
---
 io_uring/sqpoll.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/io_uring/sqpoll.c b/io_uring/sqpoll.c
index c833e776320d..bbfb1a6e6668 100644
--- a/io_uring/sqpoll.c
+++ b/io_uring/sqpoll.c
@@ -29,6 +29,7 @@
 enum {
 	IO_SQ_THREAD_SHOULD_STOP = 0,
 	IO_SQ_THREAD_SHOULD_PARK,
+	IO_SQ_THREAD_EXITING,
 };
 
 void io_sq_thread_unpark(struct io_sq_data *sqd)
@@ -436,9 +437,12 @@ static int io_sq_thread(void *data)
 	/*
 	 * Cancelation drops sqd->lock while it waits, and a ring could attach
 	 * to a thread that is on its way out. A fatal signal doesn't set the
-	 * bit, so set it here for io_sq_offload_create() to see.
+	 * stop bit, so mark the thread as exiting here for
+	 * io_sq_offload_create() to see. IO_SQ_THREAD_SHOULD_STOP is left
+	 * alone, as it means a stop has been requested via
+	 * io_sq_thread_stop().
 	 */
-	set_bit(IO_SQ_THREAD_SHOULD_STOP, &sqd->state);
+	set_bit(IO_SQ_THREAD_EXITING, &sqd->state);
 	io_uring_cancel_generic(true, sqd);
 	rcu_assign_pointer(sqd->thread, NULL);
 	put_task_struct(current);
@@ -510,7 +514,8 @@ __cold int io_sq_offload_create(struct io_ring_ctx *ctx,
 		/* don't attach to a dying SQPOLL thread, would be racy */
 		ret = 0;
 		if (attached && (!sqd->thread ||
-		    test_bit(IO_SQ_THREAD_SHOULD_STOP, &sqd->state)))
+		    test_bit(IO_SQ_THREAD_SHOULD_STOP, &sqd->state) ||
+		    test_bit(IO_SQ_THREAD_EXITING, &sqd->state)))
 			ret = -ENXIO;
 		io_sq_thread_unpark(sqd);
 
-- 
2.43.0

