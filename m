Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478714;
	b=PXvK80cfUWHxti5vA2HPY8aMvuzwEvTcPLK0O/Rn9eIkx86wUcdoPUXNVtv8DchWMwMt
	 Z//B3HeexRSR1sfiWWscoMX5+YJ33a2bLOgDowEnP/EFBUay97Puuq0XNkDM5qE8+6b7G
	 WbgTVReWXVw63egQfAHRa77X49ib62UB21nzUBjeoYOeKf+kz7vhVkahGEFTzGCAaIoh8
	 +0UyUjnEbRnJS8YaMVnQqA9Dq7XNGeFeptl/h3xuaSEkV/WBbEuiv1JoJd1qrsg7UdqBY
	 IkrJ0c275J+1GR5htCquetmyAWQwYZ9pu+QmIwTxA9n/pD6f2iEru6AP1IH+NeKHlCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478714;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xPMY64ZdtMV1KvqUOk/5oRDwTfu2QkztCzVBJuKvzBs=;
	b=FF+SFoa8iTGi0Tq7jT24HqNUKrj5YvCGgzrgxjkRGZCVjWv3hsRLy/o2Qx80uiHD92MF
	 9BExdv59qfDhURgiPSoWw9NG3xTiG5MfE1EpFzhRJo1lrvgHoDIem11A6RifXzmxHGYtE
	 PL7urdqMIDJnXm9j1StKFf8a1S1PHVuRfESWtytH5dit3+U+muxT9OJ2sCu7BJwnOoPIk
	 /h4t3PkECZDEtwPts2SCZAZAgDSel4qruPaArkkM00JrzX2UEoVoX7bsiv2CHOjXQ1rHH
	 6bya60g7qfytZ3OQ3UPupAbsTCMEnOvtjAcCgVmvOfgKlKRY+iJnA3MP+IlqU4vo0Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=nlCCWliU;
	arc=none smtp.remote-ip=115.124.30.132
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B140C606A31E;
	Tue, 20 Oct 2026 06:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B140C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=nlCCWliU
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792478704; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=xPMY64ZdtMV1KvqUOk/5oRDwTfu2QkztCzVBJuKvzBs=;
	b=nlCCWliUo0gkf3HZDAVhyBBu+3PzH4M/G34Fkxm+JwO0c+Sc2VRDdK0Mk6L2950EQehWHlSKf5odUsY2JLO7sJ8vLxI/1rrJ2o0himBzPRbU3Eb8Kt1lqx3VL0a99eBKdgGcGlVTPvtF0C+2QmQiwWjst2FKh5hOxAumvNRNXFk=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=xiangzao@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0XDBupWf_1792478703;
Received: from banye.tbsite.net(mailfrom:xiangzao@linux.alibaba.com fp:SMTPD_---0XDBupWf_1792478703 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 20 Oct 2026 14:45:04 +0800
From: Yuanhe Shu <xiangzao@linux.alibaba.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xiangzao@linux.alibaba.com
Subject: [PATCH 2/2] io_uring: add a schedule point in __io_req_caches_free()
Date: Tue, 20 Oct 2026 14:44:52 +0800
Message-ID: <20261020064452.3633250-3-xiangzao@linux.alibaba.com>
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

The request cache can grow to the workload's in-flight high-water
mark.  __io_req_caches_free() drains it with one
kmem_cache_free() per request under ctx->uring_lock, with no
scheduling point in between.  With debug features like KASAN or
kmemleak enabled, each free gets expensive, and draining a large
cache can hold the CPU well beyond the soft lockup threshold.

Reproduced on mainline v7.3-rc7 on a 192-CPU debug kernel
(preempt=none), with a test that submits 32K requests per
ring and then kills the rings.  Killing 48 rings at once made one
drain take up to 13 seconds with no scheduling point, with 8
kworkers each stuck for over 12 seconds; a separate run with 96
rings produced 97 soft lockup warnings during teardown, of the
form:

  watchdog: BUG: soft lockup - CPU#2 stuck for 12s! [kworker/u769:5]
  Workqueue: iou_exit io_ring_exit_work
  Call Trace:
    stack_trace_save
    kasan_save_stack
    kmem_cache_free+0x3cf/0x6a0
    __io_req_caches_free+0x196/0x4f0
    io_ring_exit_work+0x287/0x880
    process_one_work

Regardless of the per-free cost, the loop has no bound other than
the workload's in-flight high-water mark, so it belongs with the
other potentially long io_uring loops.

Insert a cond_resched() in the drain loop.  The function is __cold;
all callers run in process context and hold only ctx->uring_lock,
a mutex, so scheduling is allowed.

Assisted-by: LLM
Signed-off-by: Yuanhe Shu <xiangzao@linux.alibaba.com>
---
 io_uring/io_uring.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 26cd91a91aa2..dffce8ce55d5 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -2142,6 +2142,7 @@ static __cold void __io_req_caches_free(struct io_ring_ctx *ctx)
 		io_poison_req(req);
 		kmem_cache_free(req_cachep, req);
 		nr++;
+		cond_resched();
 	}
 	if (nr) {
 		ctx->nr_req_allocated -= nr;
-- 
2.43.7

