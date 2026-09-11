Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEFE49C4D8
	for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 15:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141699; cv=none; b=e/ICaGLoyMq7J9qELdzNLsVmPoIbA67iPL55e4O+DM60Qq020wXEFS9S9Pn/V3qv1hTmSyqoukDVYA0RlxuvJGuFE1GyR7D5Kkreq9gwNjO/1JbR+eVkMolcnKJ1BjaRSKko/30b60UvBegaRPzTz4IAgfEtoDzTqQM7TwejV1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141699; c=relaxed/simple;
	bh=x+/ohtmFTTdyWwwgpCF3wDSjHPQFCos6GTvLR5PWvLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r5mHsou/at6OlEJR8LuFYmXCS4VIepXxtWg73WjOuvMVLMa5DfsJGsz3UZGJygMtAkwC5QQjeC+UT/pzjxMTNH5BQkyAT5nMHfizp7oKVuRjEad7BHD0FrikHunkxRTEfL+/KXLP8lOk47nL4HWkr4zpFK5WmVxZigUqZXKy7Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=bak3GpPq; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="bak3GpPq"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7f4e729368fso1197330a34.0
        for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 08:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141696; x=1789746496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jKcAVqYYuj+8S0zQqadmfeEk7vC9rAVMkmrKHeeIfZ0=;
        b=bak3GpPq7IL6PonOVrvYNB6n5l2biiG+WtEtQn/xQXDmWR8ZYv5WOoBsktn+x//BhY
         Rd3Pkzq1bxvO1ZlZbMsaOogqCGGpLOsr6GJFRRf8Se2S+CCCsu7vSabAq3Le1eAv9gGf
         uPkk+KzfhbwI8tNj6Aesw0YDjwi413AYafxvEwcg7EcRwxzg6FDtO3kOic5U7bjcfJ1j
         xF+vavysJbf45GavDMUq0qICBQ0EUiSe+fvwnjsyTPnxrKDBlgyC9HtM6z7Xyh/6DNlo
         R4ifszwknqy2RQF8Z2Js/liDVichySFOUMC8JsSbX7Tu/MYF+itBqkBolkGxXY68wlop
         dxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141696; x=1789746496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jKcAVqYYuj+8S0zQqadmfeEk7vC9rAVMkmrKHeeIfZ0=;
        b=D3ysk9upk6aBJDjyiz/yKYc4fZMm4vhoOp9u3SAX55ZwEHwQe36tL2O8gU01dLW0b5
         L4zZOvVja3N9/jDSsIaF0HAxOa1OefcEgJqOLpRbmHSTPq4ylFHjuLb7cnKHF6Yedn0M
         msZv042W8Vfzn4g/CD7UZslzba+Ew3GA2m38L/lW3NV2c2opwikZWyl3zHHwXTQApZRC
         +Sz/w9mvrvovwxtht/GcPwP6EaaItIlgkPPODX/H5GCColB4bfRJxrDMjwX66jP3GVhW
         YMdm/9XjQhtYn0I5e7KjmumCQyx/NgKczIG2SGjZlc7dhljWx2yQ3PJ5ouTr9RFq9G+w
         WhQQ==
X-Gm-Message-State: AFuF++lyX0EQ8g3AAcjkI29TZCwdBIQi1kj3FbV8AKB2OeYigFo2TuU6
	e/wiIaMNh2shhAPe6aMhcHP0sTdf+AposXQ+H9S2mLHzuYfWozH06mGoEUR7i0tlG/L5iZihumj
	K+M/LMR0=
X-Gm-Gg: AYBFou27y5k/0TBqXAU4LT8WHif2Mb3BFpyzZFbfzuBU01h+zFNhAxxVJxdg17U0Rwd
	mPwfUFm7bVSzAu8wBoDz/FlP5/O+0CWtn/YPAgwpEgabirN7tG0gYBar46guVNLx7eIdLHybtWy
	vua9NKud+1m+Dddg/ouVsgSMFktd/ehlQcOLIDLNYo3mS4OVJKy0YnX+MZXfUoF6axYykwKvx81
	0Gdr0kYV2EKxkDLP1E4t5RfyOapiCRavdzKbqzrbimxFPakL+bPl1/H9FFyEu+gdCFyYkZjEYQj
	z7Kvb0y1MOd1ESyf93YFZHHDv5VLCVTHrsCYvTsU5ry+DB4pdHlsHBBTVn0KSCpJLMTl/p9MuwU
	y21fnCkRJ6JkI67gYmYiRPH7kAhO3ssLsP99iswfwrFyjBvbqiAPdit/d8WzS7+u1CuwrI4lR8+
	77G16cG5ZvY4RCVcdrvjZY2eSa6tc5x0oV7tBe69w49wZDxinGCR1AV+hVcGkayrv5gFyIO5dzJ
	OyK0mzVA4Jg5pMiYo32LBUANQKGeLaNdBUkOOwCiUY=
X-Received: by 2002:a05:6830:658a:b0:7f8:4b8d:d93f with SMTP id 46e09a7af769-803ff7779f1mr3618219a34.13.1789141696268;
        Fri, 11 Sep 2026 08:48:16 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f6d1ca4bsm2629478a34.23.2026.09.11.08.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:48:15 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: juanlu@fastmail.com,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 02/10] io_uring: post io-wq completions from the last request reference
Date: Fri, 11 Sep 2026 09:45:26 -0600
Message-ID: <20260911154811.646705-3-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911154811.646705-1-axboe@kernel.dk>
References: <20260911154811.646705-1-axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

io-wq holds a reference on a request for the duration of the issue, as
the completion may run before the issue returns. If it does, the CQE is
posted from that completion while the worker still holds its reference,
and the file is only put once the worker drops it. That means the actual
file put happens potentially long after CQE posting.

Post the completion with the last put for refcounted requests.

io_free_req() no longer marks the request as CQE_SKIP, that is now done
by whoever posted the CQE while another reference was still held.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/io_uring.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index f96dd2d8c6b1..4787746a2d9d 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -959,9 +959,11 @@ static void io_req_complete_post(struct io_kiocb *req, unsigned issue_flags)
 		goto defer_complete;
 
 	/*
-	 * We don't free the request here because we know it's called from
-	 * io-wq only, which holds a reference, so it cannot be the last put.
+	 * Request not freed here because we know it's called from io-wq only,
+	 * which holds a reference. Hence it can't be the last put. The CQE
+	 * has been posted, last put frees it.
 	 */
+	req->flags |= REQ_F_CQE_SKIP;
 	req_ref_put(req);
 }
 
@@ -1015,8 +1017,6 @@ __cold void io_free_req(struct io_kiocb *req)
 {
 	/* refs were already put, restore them for io_req_task_complete() */
 	req->flags &= ~REQ_F_REFCOUNT;
-	/* we only want to free it, don't post CQEs */
-	req->flags |= REQ_F_CQE_SKIP;
 	req->io_task_work.func = io_req_task_complete;
 	io_req_task_work_add(req);
 }
@@ -1119,6 +1119,8 @@ static void io_free_batch_list(struct io_ring_ctx *ctx,
 			}
 			if (req->flags & REQ_F_REFCOUNT) {
 				node = req->comp_list.next;
+				/* CQE posted, the last put only frees */
+				req->flags |= REQ_F_CQE_SKIP;
 				if (!req_ref_put_and_test(req))
 					continue;
 			}
@@ -1282,7 +1284,23 @@ static int io_iopoll_check(struct io_ring_ctx *ctx, unsigned int min_events)
 
 void io_req_task_complete(struct io_tw_req tw_req, io_tw_token_t tw)
 {
-	io_req_complete_defer(tw_req.req);
+	struct io_kiocb *req = tw_req.req;
+
+	/*
+	 * io-wq may still hold a reference if the issue completed async.
+	 * Defer completion to the last put, so that file drop and CQE
+	 * visibility are ordered. The last reference stays for the free
+	 * path to put, a linked timeout may still look at the request.
+	 */
+	if ((req->flags & REQ_F_REFCOUNT) && !(req->flags & REQ_F_REISSUE) &&
+	    atomic_read(&req->refs) != 1) {
+		if (!req_ref_put_and_test(req))
+			return;
+		/* the other put raced us, ours was the last after all */
+		atomic_set(&req->refs, 1);
+	}
+
+	io_req_complete_defer(req);
 }
 
 /*
-- 
2.55.0

