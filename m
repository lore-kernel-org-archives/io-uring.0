Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76E7492531
	for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 15:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141331; cv=none; b=bjYtm4wWKI48p/wF8z4vIYEg3RzgXjdeeGLUXjt9LDAdja0OVexmeo6ykf/d79QLDLm0Y40PC8Tsrxwg4zIYSNWiGbTaK6IxggXzb5IwXh/tFkLwasXXvMZJP4ElmsSecDDIrOqqbfSrgBlOuC9wyASG1t94vfNiGSJEtqqQecI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141331; c=relaxed/simple;
	bh=3cOzorvOxRrM2357Kv03cIHM3KvIHiOeSsYnysFbQ18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d8ReoOheiwu4IdO/yub2RJg6qwnuLE2m3NasAi6a13EFTvBeKVVjo1aS6t4evG12fAxyBstR8QbdzSwD/Y97Tt+ZkDa4MuCuP4TawE+3qqJ9rUPSnhyFjN+y/SBIHGYfRh4TYpdVlFfb9SAqBClA9bf9jTBX5XfNlj8UqqnqfIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=f2eYMXof; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="f2eYMXof"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7f48c750afcso1100808a34.0
        for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 08:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141327; x=1789746127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0vHIYEHJqme0gI4jLTtintEZJNWn/ID2vfmcQE7LyaU=;
        b=f2eYMXoftvJtz0vfLTfqNO1EESRZFXkbbiyBBu5RKsswHkgIIXH/RmfzSjNDdbEkRp
         F/02xB2agpO5uabIwtYoH7iypBMTMbCS3v/C2q2cchAw7OiP3cKxzaoOtDfBWarrtzUM
         DX8lUpuIzsyZPARK7GwEdUWtISe1C5P7V6w2Vo1oWuwa/dZGMRL5srddUd0r7BZ/tgt2
         3ipw5X8HJC93VlgMnOKBUY0V6/g4oaAGcEqYrEZqC4baaqE/9vOy8MczJzCTSb8P0AGz
         NqadnBu5dYqC+ZeWT1AqCuorqo44nunkhaMaL/Z9E6+rbTLUpPOXuSMygEjsdwL1k7lL
         eWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141327; x=1789746127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0vHIYEHJqme0gI4jLTtintEZJNWn/ID2vfmcQE7LyaU=;
        b=IdM/8AxdlNB2GaTIhm9p18CohptjAi+35k0LhKBqyyCKJ2k/S1tMP8+qHsiZLaNPXz
         CYG/SrneaOVf3prq3VFmYdBil/FTL/hjVIwDc6ekiFJoEYQ1KeAvP16a70Q6eyguBU2c
         V3M0daU+y/VJnZTxJ/++iFN4I5DF02jbmUl2/Y1DNpaZhu/E04hsQke7js4watBHznkP
         AgsTvrxaQ0xQO/ga4hfZFAjWMO4yKFEZMw2zgHzlAWuBTfQ4anJtMMb9uLU/9B+V33VY
         OCx/GHHoOpfGlCFHpnuqjwyq7LYwioRNtIIkMAuWeMqUJhhU2PnIppeIEWMgd1xq7KxW
         y2OA==
X-Gm-Message-State: AFuF++neBr/oMg83E2nVo6fEnM4CEzJ/QnN7uZn+LaKtGxoW58wR78pn
	84nmPhSJLzblbzcBoUYCHouuXVy8hwTh3GB3gA/o7LPEB8hW9Ycw/BcNIxCkr4rdqS4NQAU/AS+
	pePai5GM=
X-Gm-Gg: AYBFou3OMe10fUoyXYxkyizJtDdWxbYvYf8+eRGy4bNEfCbt3SzsOPuvXzFpXLMFrrC
	z5KqjpYECquq0tvCbT02+Tzk70GRTdU5O/3y+376rTULbIeDrlfbSdqIrdBnHsSjGaDSkJkOHFW
	SLV3t77ttJR+kQ2fGyk3VtQ7IqaukSQctFQ+pLtV/R8MUsC+xY+fKaQpu1SgWAy22eowUc7YH3N
	aNlui4uXuLcdVIQMXKkTo82gE4jtN6pyz+eYRMIwAGIxbl5mIhbKqasoLlraoWy29ciyrywsAc1
	Qy8xAR7kMaOnPE5QPc3rpGAzv5a/prDsYJUuSx9kkz54M93+ZseqtD8pXed/hTIqYvxI779Fa6p
	5xNuwxLpqrne0NcYlgKFDmg/yKtnCQdaEqPmTHcA7Tpu4YbnulhDPaIuOE6EI/Ouu1IUdTCprLl
	HHz9cvgul3jLtjpm4tryJb9sv8G24ncqN8viHfRbqFENIP4hGEOGlicuJ6DpPMXucLRYFwGidZM
	V/FXtpkux7aPTl7u1ZAPGHHQUwJuPWdihQgik5dEVPO
X-Received: by 2002:a05:6820:c0d4:10b0:6be:d716:524d with SMTP id 006d021491bc7-6c0bcea90bcmr2738418eaf.64.1789141327530;
        Fri, 11 Sep 2026 08:42:07 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c09690af1dsm2802199eaf.1.2026.09.11.08.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:42:06 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 09/15] io_uring: keep the submission plug on the io_submit_sqes() stack
Date: Fri, 11 Sep 2026 09:40:59 -0600
Message-ID: <20260911154148.644489-10-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911154148.644489-1-axboe@kernel.dk>
References: <20260911154148.644489-1-axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The submission plug is embedded in the ring's submit state, which only
works while a single task runs the whole batch. With a submitter
identity handoff another task finishes the batch, and the block layer
caches current->plug across sleeps. Put the plug on the stack of
io_submit_sqes() instead, it stays with the task that started it.

No functional changes in this patch.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 include/linux/io_uring_types.h |  3 ++-
 io_uring/io_uring.c            | 10 +++++++---
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/include/linux/io_uring_types.h b/include/linux/io_uring_types.h
index 50a4a0ad222f..0b0d73688b8c 100644
--- a/include/linux/io_uring_types.h
+++ b/include/linux/io_uring_types.h
@@ -298,7 +298,8 @@ struct io_submit_state {
 	bool			need_plug;
 	bool			cq_flush;
 	unsigned short		submit_nr;
-	struct blk_plug		plug;
+	/* the submitting task's plug, lives on its stack */
+	struct blk_plug		*plug;
 };
 
 struct io_alloc_cache {
diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index b09221e239c0..100ade1eee3e 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -1810,7 +1810,7 @@ static int io_init_req(struct io_ring_ctx *ctx, struct io_kiocb *req,
 		if (state->need_plug && def->plug) {
 			state->plug_started = true;
 			state->need_plug = false;
-			blk_start_plug_nr_ios(&state->plug, state->submit_nr);
+			blk_start_plug_nr_ios(state->plug, state->submit_nr);
 		}
 	}
 
@@ -1938,13 +1938,14 @@ static void io_submit_state_end(struct io_ring_ctx *ctx)
 	/* flush only after queuing links as they can generate completions */
 	io_submit_flush_completions(ctx);
 	if (state->plug_started)
-		blk_finish_plug(&state->plug);
+		blk_finish_plug(state->plug);
 }
 
 /*
  * Start submission side cache.
  */
 static void io_submit_state_start(struct io_submit_state *state,
+				  struct blk_plug *plug,
 				  unsigned int max_ios)
 {
 	state->plug_started = false;
@@ -1952,6 +1953,8 @@ static void io_submit_state_start(struct io_submit_state *state,
 	state->submit_nr = max_ios;
 	/* set only head, no need to init link_last in advance */
 	state->link.head = NULL;
+	/* on the submitter's stack, the block layer caches current->plug */
+	state->plug = plug;
 }
 
 static void io_commit_sqring(struct io_ring_ctx *ctx)
@@ -2035,6 +2038,7 @@ int io_submit_sqes(struct io_ring_ctx *ctx, unsigned int nr)
 {
 	unsigned int entries;
 	unsigned int left;
+	struct blk_plug plug;
 
 	if (ctx->flags & IORING_SETUP_SQ_REWIND)
 		entries = ctx->sq_entries;
@@ -2047,7 +2051,7 @@ int io_submit_sqes(struct io_ring_ctx *ctx, unsigned int nr)
 
 	left = entries;
 	io_get_task_refs(left);
-	io_submit_state_start(&ctx->submit_state, left);
+	io_submit_state_start(&ctx->submit_state, &plug, left);
 
 	do {
 		const struct io_uring_sqe *sqe;
-- 
2.55.0

