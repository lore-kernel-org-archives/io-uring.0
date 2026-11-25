Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632293;
	b=c7NJYXR61UecIeWrrvFKr5s9non/uohmUPgj4T5631PGt/Y8HvXmG75v6AptIVOjWQjN
	 KMXiJV6rJlBW8rq460o2ZcvnctTO90AYFntE1AteXV7Px4qcQ1/5XYg7yzmZ+saaL2lTk
	 z4zhnfjBzP3onKS2XRUxzUlMCHfxLtyhvYaF9rmIJpmbOyUU4nHgP66EthQ85si3dRvZS
	 5lcfhQn/vMX37cgKsq2pO8adQii40u0+e6frJdsdDeL+8vTl6iVP5I+8OncVDIx7ooxk9
	 Ipwlz1pTDHX2zb8FgprRKsua1Di4yDg+TJGlU0U0kssX7aJ5q2k4tLLxb78j0m9tOQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7z86s+sxZZ0rs9BHmjYLkufGbblNmiYUz0g8Vi1fYrM=;
	b=tizZeKYHLE612W1BTKA8jJLaTl2XYkhR+h5kdKjt+QEbLv1nLNIn6FDIDQGi/8g0hNiN
	 Rmsp89D/VkkSPKT09legca1l9WrxP4fg0xBvrO3DXNIG5OYoId3AsbHwy+sFuwGLonO8G
	 Z7DrNFibtR3GIgEdjSJlqnIgRFNCXtFRhNODj40gQWzS+RhBz711MAEevpUETQfAGF96z
	 v1kPE4gbUl/Q6FUkIzqnDbyY0PBobjVSVAKHAZn37Y0LkdvD0hQOcjjpUDYWUxw/4Fhky
	 EkozymXux34vCp9vKUgr2Yjg/e9udvCDU34Qg3GHE6h+CcmgVm7hXyvM1Y9KQthjz9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=vfl47fVd;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B08606A685
	for <io-uring@vger.kernel.org>; Wed, 25 Nov 2026 18:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0B08606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=vfl47fVd
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6df5e315bd1so4966302eaf.2
        for <io-uring@vger.kernel.org>; Wed, 25 Nov 2026 10:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795632292; x=1796237092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7z86s+sxZZ0rs9BHmjYLkufGbblNmiYUz0g8Vi1fYrM=;
        b=vfl47fVd1ZtpNjyoJDx/TMgJxMDuXzm0mBNpozy/XePYYS+Y3TdV0c4pBjdZ+Q8WWc
         IPKX//sb8TeknPJRlH7qEGai0rljJmoO8AJ9cdbW9CTNHbPdSFD4p5kzkoknWYlaHDk1
         cfXyE4hFl+W8GtDE0Kg7pc+mm7X8boUv1oBlWJg+ePoo0Arun5RWj9ZB0TL9UgTVhFeK
         fxzMTad/pHZyK2oCAbhNOxN+QBtXfwW9HZdDvcAX9lqz/sihZcCVnEw8Qwkv5kRyDPRW
         L9Nrud0EHDroSBfZhgzMKqg5RG32XdSpJIX+bgaLEQ9Yg7MKxfyqyZV0fbRKuXTKlW14
         DFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795632292; x=1796237092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7z86s+sxZZ0rs9BHmjYLkufGbblNmiYUz0g8Vi1fYrM=;
        b=oYmu9vWoiMkNrh7qclnPoxdr8IGclWWN4m1ch4l5M84UwMRk+44OuESDsdiCLzq3rX
         6Ab6xSuGi/kEvlCqmHtj6iN/BIQ5fSilG5wJjHXuO43InwaE8EiCzJk6UHWbL+4ngiS6
         XWjYPBJZ9MKfjc71QOabQeGQGveLrARhQhdhAbeZc6fdLAZbk+dHHJbXrtJrprJJZRWE
         6rXZ1LRaOzy3W9N6iu17JMVzwwMOl3H2sQpWGfj1R8VTDkV6VXFWAUread4UqDfa7Agt
         dsAcnxTwyKA/iMX+grjWUFkLt8Q4iGEWXV82b/uC6kWTCYxCfQXDGThrw2SLDBkdkspb
         Tv7w==
X-Gm-Message-State: APuU4Z/InbHYkMCZIYNR07KsHdGWHDL/0NUBIqsCrwFaMZElKIaFOOkQ
	/0jlnGjKR2yImvc12Cod+qKvG+LFuTbF3s4rGq62QsnqnrCLQsOgW6S5I076Yjb1XP58vvRA30I
	RY29waqM=
X-Gm-Gg: AZFdTZcX7FY859McbzZXwuJc/Z5hMQ/1TwPtA6DdOZpZE9rbouM78NunUSq2D7fz/rT
	AcEQefHcClza0ZBDksZ2suHu9YW+KYRgpdihjqcr/QkkIW8WSxlJmLmhm8Fglr9s63lCqv2WAYH
	vroedw1Qwxs3wOt29/fh4Kser72nj+kGUQt+9WgxYrzyfpA+Ea3G5wx5dsSySFFnDBTnRqGcKgu
	0B63S5RJ03ln+rmqmwDdC90xUWe8/+61J3mjjHUkayQQnhOOnmRAvuuaFyEhUoDYTfZIBrevSHA
	gpNSspAr0jppCeFgeLgF69eA6NKoWh4nc3qSYzfYdylHVHtiV5pTYqNUrcp3TuwcUG4rY4IL+4S
	UW4/cRX4SZRgIlwr426n9gejlduQXeIoLXigifmiOINGb7ri9Wavp/KJV+Yt/FyQTsCcV+WhBjq
	KvP3rU9sU9rMCweyhjyuFak/0Y2UQ0v6evQuBEVynkxh0eFxQ7QZUx+HbciW0ijP3kKXXza+V73
	bK8H7Wfp0B2Bc+1vlIF5hieozjhKm38r2WYp3ZvhqQ8d05Jgljc/hC7fl9FqbjPzlb4SreywskP
	2PeN+br4BPcYW3bjq8wnE6enaOSmMwfgkcpoPf3qdXQqbftISALl9BG1olRyUGUoLOdVF+owIc9
	tn8R5DQ/kGt6r2RUO2/BO/LBX3pESeVok/w==
X-Received: by 2002:a05:6820:7618:b0:71b:1715:7ce2 with SMTP id 006d021491bc7-71b3952f14bmr12987689eaf.32.1795632291778;
        Wed, 25 Nov 2026 10:44:51 -0800 (PST)
Received: from m5pro ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b37c52ae6sm12332828eaf.0.2026.11.25.10.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:44:50 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: Chris Mason <mason@kernel.org>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 07/10] io_uring/cancel: always walk links under timeout_lock
Date: Wed, 25 Nov 2026 11:43:16 -0700
Message-ID: <20261125184439.58077-8-axboe@kernel.dk>
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

The exit of a single thread that races with the close of its
IORING_SETUP_DEFER_TASKRUN ring can cause a use-after-free of a linked
timeout, if io-wq is the first to issue the request that the timeout is
linked to.

When io-wq calls io_match_task_safe(), ->timeout_lock alone protects the
walk of the link chain against the removal of a linked timeout. The
function takes the lock only if the head has REQ_F_LINK_TIMEOUT. But the
first issue sets that flag. If that happens in an io-wq worker,
cancellation can find the request as the current work of the worker
before the flag is set:

    io_match_task_safe()          io-wq worker, timer, task_work
    ====================          ==============================
    REQ_F_LINK_TIMEOUT is clear
    io_match_linked()
      req = head->link
                                  __io_issue_sqe()
                                    __io_prep_linked_timeout()
                                    io_queue_linked_timeout()
                                  io_link_timeout_fn()
                                  io_req_task_link_timeout()
                                  __io_req_caches_free()
      req = req->link

The fix used here is to take ->timeout_lock for every walk, whatever the
flags of the head say.

Signed-off-by: Chris Mason <mason@kernel.org>
Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/cancel.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/io_uring/cancel.c b/io_uring/cancel.c
index e3d9fe8fc982..5b57d27225ac 100644
--- a/io_uring/cancel.c
+++ b/io_uring/cancel.c
@@ -438,6 +438,7 @@ static bool io_match_linked(struct io_kiocb *head)
 bool io_match_task_safe(struct io_kiocb *head, struct io_uring_task *tctx,
 			bool cancel_all)
 {
+	struct io_ring_ctx *ctx = head->ctx;
 	bool matched;
 
 	if (tctx && head->tctx != tctx)
@@ -445,16 +446,13 @@ bool io_match_task_safe(struct io_kiocb *head, struct io_uring_task *tctx,
 	if (cancel_all)
 		return true;
 
-	if (head->flags & REQ_F_LINK_TIMEOUT) {
-		struct io_ring_ctx *ctx = head->ctx;
-
-		/* protect against races with linked timeouts */
-		raw_spin_lock_irq(&ctx->timeout_lock);
-		matched = io_match_linked(head);
-		raw_spin_unlock_irq(&ctx->timeout_lock);
-	} else {
-		matched = io_match_linked(head);
-	}
+	/*
+	 * Protect against races with linked timeouts. REQ_F_LINK_TIMEOUT can't
+	 * tell if there is one: an io-wq worker may set it during the walk.
+	 */
+	raw_spin_lock_irq(&ctx->timeout_lock);
+	matched = io_match_linked(head);
+	raw_spin_unlock_irq(&ctx->timeout_lock);
 	return matched;
 }
 
-- 
2.55.0

