Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478714;
	b=NcJRYgI/8q/+/NbnSsA16qjSOjMgozoMFjkaL9TGKDIGFLcvrzFM+U+RYTQE86rrZcNp
	 llg6AocHAl7MYlDrrnGgWNMxLtL0SRiN9EwW0xb5hFqQcpNXXYhnMNUrLr0/ClaiPHaHF
	 X3IzFkUQgUSStCItQK7j+spBqrV9+uxezn5U04C8pRFT7maWDqH0gzTmoPjkTL+aYap7e
	 JMcfJq66gSX+f2ovbbU+g6NCQ3BBR8PGgr+g2doQHpPVzwPf9z/WobXzFLu4z3/iPjY/L
	 S2km8l5CSbqYgQhH9QrfVHACil4N6R3CDHQcWeS+EL1B0sRSeEV/73h2u2sQGP0KTng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478714;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ncq2a513pyqgt/fS86VyWzE3frQW72DFbI6Ck+tT9oQ=;
	b=o1HkZLJr1NtPNPT4jyOA0bw+hsv10cHDaeUhftNEjdjOgApQu3mBHaQgL/B40X9ibjz2
	 oyZq69RnZeUZ3TL4RQ9iafXbHLL7fRbMElDQ9KtqE8zfN1d67NzmDEJEqt33OoCm5AWMi
	 nPdh58mvRsr6Vu5vnlOhzkBnDT4HrxmBunCaKatZgNQv6aplqkcVKg8Vp+Ci+RmiIRI3y
	 dOECf8JDuqEME/eAwWKA/X2yceKKbzm8DNaOvTdEhOKO6XrnBDPlpGSsW+J2tGVlgI66A
	 COsho1BTLE2f3oW+/EvdoSD7nXmvQehzW0zR+2W6joeVMcPhiwuMP4ArAQlcTb7OHzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=AgFY83uP;
	arc=none smtp.remote-ip=115.124.30.112
Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77883606A31C;
	Tue, 20 Oct 2026 06:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77883606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=AgFY83uP
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792478704; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=ncq2a513pyqgt/fS86VyWzE3frQW72DFbI6Ck+tT9oQ=;
	b=AgFY83uP2pni/il3r0Tn5TIg+g8R6suE1oV1Q9fCd97jLTYf3rr5a+iY0tIZ3NQdZCaDW2m/Bk2YTxJNU+TRK/R0MAnOVIwMkZIF2jea4iYbt2UJ0R2Y6pnuukXdxgLlbrC6HYeeOBoKoCDxZzRWGRWtRLdId520ny6R6QZ0tCk=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R461e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=xiangzao@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0XDBupWQ_1792478703;
Received: from banye.tbsite.net(mailfrom:xiangzao@linux.alibaba.com fp:SMTPD_---0XDBupWQ_1792478703 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 20 Oct 2026 14:45:03 +0800
From: Yuanhe Shu <xiangzao@linux.alibaba.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xiangzao@linux.alibaba.com
Subject: [PATCH 1/2] io_uring: add a schedule point in io_free_batch_list()
Date: Tue, 20 Oct 2026 14:44:51 +0800
Message-ID: <20261020064452.3633250-2-xiangzao@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20261020064452.3633250-1-xiangzao@linux.alibaba.com>
References: <20261020064452.3633250-1-xiangzao@linux.alibaba.com>
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

Completed requests accumulate in submit_state.compl_reqs - deferred
completions queued by task_work handlers via io_req_complete_defer(),
plus everything io_do_iopoll() reaps - and are then all freed in one
io_free_batch_list() pass under ctx->uring_lock.  The loop has no
scheduling point.

Each iteration does real work: io_clean_op() freeing request
payloads, file, task and rsrc puts.  With debug features like KASAN
or kmemleak enabled, that work gets expensive enough that a large
batch can hold the CPU well beyond the soft lockup threshold.

Caught by io stress testing (stress-ng -a 1 --class io -t 7h) on a
384 CPU machine running a v6.6-based debug kernel (KASAN, kmemleak,
lockdep; CONFIG_PREEMPT_NONE=y): a stress-ng worker was looping
here past the watchdog threshold, entered from exit-time task_work,
until the machine panicked on "softlockup: hung tasks".  Frames
from the dump:

    io_clean_op
    io_free_batch_list
    __io_submit_flush_completions
    ctx_flush_and_put
    tctx_task_work
    task_work_run
    get_signal

The same test later caught a completion fallback work item holding
uring_lock for 671 seconds in this same loop ("BUG: soft lockup -
CPU#61 stuck for 671s").

Also measured on mainline v7.3-rc7 (192-CPU debug kernel with the
same debug features): a single pass freeing a 32K completion batch
took 443ms with no scheduling point in between.

Insert a cond_resched() in the loop, like other potentially long
io_uring loops already have.  The loop runs in process context with
ctx->uring_lock held, which is a mutex, so scheduling is allowed.

Assisted-by: LLM
Signed-off-by: Yuanhe Shu <xiangzao@linux.alibaba.com>
---
 io_uring/io_uring.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index cf5218d100d9..26cd91a91aa2 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -1123,6 +1123,7 @@ static void io_free_batch_list(struct io_ring_ctx *ctx,
 
 		node = req->comp_list.next;
 		io_req_add_to_cache(req, ctx);
+		cond_resched();
 	} while (node);
 }
 
-- 
2.43.7

