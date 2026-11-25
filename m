Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632295;
	b=rxrZ8smyJca6m1rwxUzZVR4k7IT4Q162WnzmY0LS0/h5Y+a61RcTE9tYUIpLuYHaqIEn
	 FQmxor0ihX1TTmGmDuHaEP02qbEgaj6uGLDBcp2cX9u1Q4jLsUmgiYhcflMf90D2RfMs0
	 EZs0ok2sNsvr5D6eP7Z94C1vBHjWYmdEBocP6YemFtSGGJAyr38ZRH/CbQAH/mKDh6kQS
	 BDj4q0izs/InFzDG1dRkPCjPQ9CwltA07uE6PrXga3qWSR90spVBz1qu2C55KAhlgRDUW
	 eL9rPQ1lgiULbRgumJOz3yVRgBiCGSzheqHy0fKu55kvND+b9tYyDMCzZGISoJhqbSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dndL9yzQHGyUmFRCEL5w4yhLUPpHByG7Ke5hKAeLYyc=;
	b=cw2YhLV+WY5hVx4fv0wmvoSX5bZzk0+346l2dOCn40uf46xrPthjLC4aF6fXyWQZUrTP
	 i99QH9Swp0BP67y6uhYkl/+Jv4rsweNjybO0ZN3kBhn212XocHt086fh6PCOqHtYW/2PI
	 UldcPNKskAtfBsbgPLE8iMjUjQlUuriQoiH5BxtmSVmwrIzJ3OPabFe7Cd2QmAGIhNk0W
	 7+atvNSwc75p60ffImWykkmY4T9GYnHWIH49O/XThMP5xkzvsh97s5q8bnUo0BWiN5Ah9
	 hXePHDOrpCDl95m6aXKQ4MdZF8FR4sNm9M5MzqzcfIK4Wzm589NXgC62oMZAdJn2Nrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=ZZtuzXK1;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667D1606A326
	for <io-uring@vger.kernel.org>; Wed, 25 Nov 2026 18:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 667D1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=ZZtuzXK1
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-71ac798b8bbso3853846eaf.1
        for <io-uring@vger.kernel.org>; Wed, 25 Nov 2026 10:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795632294; x=1796237094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dndL9yzQHGyUmFRCEL5w4yhLUPpHByG7Ke5hKAeLYyc=;
        b=ZZtuzXK1crnhpgCQyZCA481Y92s4zDstpbb/brRJtJklkUSHBTjrIf2o3gL9q2Hj66
         +shFHAvL5CGLRsnwow2A2m0VmDRBKfnLFSNs/nGgyepIxQ6cSwZL4/Z3WLXU1XT/VOTf
         lOkdScAutV9dAk+UN11QUQ59ti7VeOu34AXncqQEU/5Gn6H0k31gDcZ+2J2itcWXN4ka
         I7M7jrfOM6S+NnmH8o/6ASpoiPp3Eoo5Hbz+zjHLfMV4F/luUUoP2e2PfA8c83D5ARiX
         +PPGbVbYbkBmsxVdDEiqgVJA2lwT7lCvFNSYPe9wG6jSniZFAo9ub4tio+RgH3ve6ziZ
         9qyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795632294; x=1796237094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dndL9yzQHGyUmFRCEL5w4yhLUPpHByG7Ke5hKAeLYyc=;
        b=MOwcyCYwcTTpuuRURcW77jen98ESYOdRbSTJH7u2G/Z0MoFiEr+/Q2h+dDH+Y+RG27
         SOLnueD6jTNeKWTvehlwCFFknPiu4l938lDMERUbD1fOHv2oY2m/pSQ2ZOmwt9Uo/1by
         5dixVGCNGluModBeKpd3yeiPGF+0+lNYRjZVZp+pShh4EU5t6nHp7pVOg5iWp2Hqq9l2
         e6X8lOPPtV/wt/vMo55+HzMcea87fsdciEwVAZkq7ODm+QXZou+SunIVdC3NGdI1ffd2
         lL47BVPNRPbUZbBFBECP8ouzHvqlsvxpiXtxx/bPPJy80BIRrQHzvQqy7RVfXFVcHoFz
         kZbw==
X-Gm-Message-State: APuU4Z8twlf0wObPKM/KOerFgZeN5DaHUo/tFYV/ONwSnrCvyob3/7ra
	TYWlprPMsWpohg8tJzNEhCsJ32MBDlzHqIP24zxC8aGG0lBkrvZ5fxbOSgr94uzcInPI9YvWlO2
	+tbEMBkQ=
X-Gm-Gg: AZFdTZedcuxfKZ3W48m5nzrjWKpM2MvzfM8gZIUR8xAdq1EQ7f7/ovEe0lcOjMxJnCJ
	AHyrcBi8O8yWCsP+ecxZkhc8zcjtrQ2ohzeSSt2t13bNXbKK8ALKveVPAmgq4PAdwQP5iTK4upe
	ZbAWdKB0kJw3NdSovJGLrgmHBs7t6HPRrFfKBwkBFVDazB4pcWYNGT7tCNR60pifl7HEzNOfk8E
	4mxz7psOr0GMXcMsnFZhAb6jy1H9oXhsnZQIczB8lD2iwZiOzMt/MoFsnGKLYE6wB4dIHBd7TiS
	svJO0ABjv7YGzPErHD3E5iU9EtiDbC0Nq4BDNtxWza7YhvFuYUbeuQsp3tciAsaFMzhUYiI2qux
	U++hxFmeyxqObbe5BAj/1AN8Zc4boNGryG7gsdS1oA11XjJ9fwx9/p5utB0awteOlGDU4UVSndn
	2YVoUdDyd9D55WIVhyLa6SBhxxbwkFQGQ+5ccr+NAroAFWhbr5cvVoUO/rWf49V5eJLm2Np4he8
	NcBuDeV7NuHlZKDG8K9MB4YcfkeWqR2iCeK6SN0CflT7Fp6FQUqvTNKVMmHJQr70M7YZfr0WchP
	j/EVvrlFHlHpoj6jSIqhTM9zLG0XzB4d9zfkTv5E9XNlN30m0tTR8o2tpmmXHqQ5RutADVQOaZn
	ZbJJDVDpzXNmi0QYRE2E5SMKMlZ8JNrKaV6E=
X-Received: by 2002:a05:6820:1391:b0:71b:7e03:9d32 with SMTP id 006d021491bc7-71b7e03a160mr1857050eaf.90.1795632294435;
        Wed, 25 Nov 2026 10:44:54 -0800 (PST)
Received: from m5pro ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b37c52ae6sm12332828eaf.0.2026.11.25.10.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:44:53 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: Chris Mason <mason@kernel.org>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 09/10] io_uring: drop cached task refs on ring release
Date: Wed, 25 Nov 2026 11:43:18 -0700
Message-ID: <20261125184439.58077-10-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261125184439.58077-1-axboe@kernel.dk>
References: <20261125184439.58077-1-axboe@kernel.dk>
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

From: Chris Mason <mason@kernel.org>

An exiting task can leak its own task_struct, if its exit releases a
ring that still has a request of that task in flight.

If a task frees its own request, io_put_task() doesn't put the task
reference but keeps it in tctx->cached_refs. An exiting task empties
that cache for the last time in io_uring_cancel_generic(). So whatever
frees requests in that task later on has to call
io_uring_drop_tctx_refs() afterwards, as tctx_task_work_run() does. The
cancel pass in io_ring_ctx_wait_and_kill() doesn't. With a timeout armed
on a DEFER_TASKRUN ring:

    do_exit()
      io_uring_files_cancel()
        io_uring_cancel_generic()
          io_uring_drop_tctx_refs()
          io_tctx_cancel_done() is true, the timeout stays armed
      exit_files()
        io_uring_release()
          io_ring_ctx_wait_and_kill()
            io_ring_ctx_cancel()
              io_kill_timeouts()
              io_cancel_local_task_work()
                io_put_task()
                  tctx->cached_refs++

Commit e775f93f2ab9 ("io_uring: ensure that cached task references are
always put on exit") added that call to io_ring_ctx_wait_and_kill().
Commit 02bac94bd8ef ("io_uring: don't iopoll from
io_ring_ctx_wait_and_kill()") removed it together with the completions
at release, and commit 89baa3154a72 ("io_uring: run cancelations
synchronously on ring release") brought only the completions back.

The fix used here is to restore that call, after the task that releases
the ring has run its cancelations.

Fixes: 89baa3154a72 ("io_uring: run cancelations synchronously on ring release")
Signed-off-by: Chris Mason <mason@kernel.org>
Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/io_uring.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 6808229edf07..d8491f86e480 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -2702,6 +2702,9 @@ static __cold void io_ring_ctx_wait_and_kill(struct io_ring_ctx *ctx)
 	if (!(current->flags & PF_IO_WORKER)) {
 		io_ring_ctx_cancel(ctx);
 		io_ring_ctx_wait_inflight(ctx);
+		/* exit is past the drop in io_uring_cancel_generic() */
+		if (current->io_uring)
+			io_uring_drop_tctx_refs(current);
 	}
 
 	INIT_WORK(&ctx->exit_work, io_ring_exit_work);
-- 
2.55.0

