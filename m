Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837283DC871
	for <io-uring@vger.kernel.org>; Tue, 29 Sep 2026 12:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686480; cv=none; b=V8czFPAMpP3lusbEoGwjFVDnuJKuERf6QlOFmtZCTc2VNhj8YqIluvrRN8iRmxl0934N9EFVn86fVFXDZfZ5BfWydiTkgnOLhBFmmNbA9aD+ZdTJf8DJqjKkPjgprAVYIJPbSzjlMtknEUMe/Lqz+0yrYoykK4n544qe7wG5xmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686480; c=relaxed/simple;
	bh=h8MSdA30r/pqySn5KePwySX3F3ZhhYfmFbCquovlpsg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=NiiXGA5UUIoUGGD0RLA72mgRReN+Iy+s3ZgcXtRv0POpv0TJV9Xi48vxnJYWxCXfEh4LCQr1eMgpAr/z8RCB2xBG3uX5wD67FcP1tBDiOhIqiMJAnIFpswwIr10ccsDNk55Rg3Zeg9auNvcfIIPMRwDyX8DLcGuniK2vnp+jJDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=Cgw+i++F; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="Cgw+i++F"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-1438cb9b3a3so2869701c88.2
        for <io-uring@vger.kernel.org>; Tue, 29 Sep 2026 05:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790686477; x=1791291277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:from
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3VgRpQg8jay1LWo0ovstuPGBOtsVhOtVC2Vcme8oHaA=;
        b=Cgw+i++FBAcUNzK2zlDuj3FWTNcCC/PJIa6D0mDZx8lUz+Eh+MFiiVHX6McqtByatY
         9eqHaglsankuU6aKnUr2PWbqec01jLsGzTiDqrt6DRGMvbc8XXw3zVeFzXmZLcgSKUMN
         /IEdgNvTCGLwVgCrO0ebS1vMomJRdU8Ys8XbxWefAIIhBUByba5LWoA27lEEqddc4Cod
         FGMxceUe7pIs7CcQQxH5Ftq8R+HzM2AHjy+bH6HdcrQ2oceQFc8EfxiJToQr8+Ck+qUa
         hF7jULDBlbqG/htqwf4+U4ue4QiOYcOjx6nsi72p7xDQafBELrs7Vq59Zuz5ebWL42h8
         aP0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790686478; x=1791291278;
        h=content-transfer-encoding:content-type:cc:to:subject:from
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3VgRpQg8jay1LWo0ovstuPGBOtsVhOtVC2Vcme8oHaA=;
        b=DhzRlK7USkM8du3FxGJx2UNI53uwgdlEbh86JDHtc4gYmUq9x7SvbsHbX7U3YLAtU3
         fjQsqpCXvoyzwYkAO7nCarDK1b96UJUYOzQYPpIFvnqKA1+8K/KhqCKqoLwKDk25YE9q
         btYB9d8W7dNL2Yw3kOh7iTpc8yrVodxANv1K8WBx8uAOfGtmcDKafszbHUUaoC1ezf+Q
         79d3+tOB9AZtklL+uIFhgwzRofwbN2SuFJgQQwFM1P4IOjBME2Dl5eGrRqILsvuVFPti
         xd84iT1SJnORAgC7bo2YJV4OuplbFPsPEg8Yjkfa3S1+21oteRW8XXoWzchq8HK6EtAN
         oNoA==
X-Gm-Message-State: AFuF++mlaQiih9DHoM5GT5faIe32A/cl5WTGLDU286Ktr0mMcyEW/WXF
	qqfv3RViPoQlsSuFNaTYCwtlnTyms5/7KnzmZodz5gqHYgNko2amuRieW2o3S5L5ra4um2s6BEP
	p8Qru67c=
X-Gm-Gg: AYBFou35fWERQP3lNGS/VChjFTcXEv4DRtF8p7U7SRS1gCPko9iX38b1PbD85YALtwY
	SfaqFBDzBqyvt7lnTkEzxaKoBa57f23S6Vxm3LZNGCOQWZ+LmAqdGhX6+0aEj1rq+wUS2BGNali
	kh3Q9jw+p8zzhiLjp0Wl1KRfD/dcrcLxYPYfZot2xIhOz8SrXHRWaf0ds2Ap2cQboD0L4UEsxnU
	FG+gHeIX1ktSumwog0tsWmTpdwrKCNK1P+F+Eb1NnHRTnsNTOeRYqpqlbcYDElftyOVlp+WpbZU
	gd+l3n8ARvy+onRalaeXdfV17VjQSHt6Y/yUvoVuTJQ6924jmsDBEme2yV0zwa+1paUd3oJXBOq
	KsYggBrVovJ/b+iG1G85MJu1GGNuebZ/UG4AKUUanNRCrYByvDUtTmK+ll7WAj1T8E37zLBhMYh
	cGhsTzbGUhAdvwnJ2gQODBbqa43EdOu70i88+IB8pVzZn7bkozaJq0H3cCIASxKaklXYETnoWKs
	PGTYzCcceAgPdjjJwB8HZpV3nGRp6uspdqDfKgSFB6/7FCJrpfYALFwvsA=
X-Received: by 2002:a05:701b:231b:b0:14a:5284:1bf7 with SMTP id a92af1059eb24-14a52841df9mr5632666c88.14.1790686477439;
        Tue, 29 Sep 2026 05:54:37 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc47ab8sm39701167c88.6.2026.09.29.05.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 05:54:36 -0700 (PDT)
Message-ID: <c489d5c0-24dc-4bd2-974f-e1f8f55cf6e8@kernel.dk>
Date: Tue, 29 Sep 2026 06:54:36 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] io_uring: fix task_work add use-after-free with SQPOLL
To: io-uring <io-uring@vger.kernel.org>
Cc: =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <Jeremy.Jean@oss.cyber.gouv.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

For SQPOLL, the sqpoll thread runs task_work off its own list and
doesn't need to be told about it, so it can pop and complete a request
as soon as mpscq_push() has published it. If that was the last request
holding the ring alive, io_ring_exit_work() then frees the ctx, stops
the thread, and with it the tctx, while io_req_normal_work_add() is
still looking at both after the push:

  BUG: KASAN: slab-use-after-free in io_req_normal_work_add+0x439/0x510
  Read of size 4 at addr ff11000000ca0000 by task repro/55
  (...)
  BUG: KASAN: slab-use-after-free in queue_work_on+0x25/0x70
  Write of size 8 at addr ff11000000c3bd00 by task repro/55

Hold an RCU read lock across the add, like io_req_local_work_add() already
does, and have io_ring_exit_work() wait for a grace period for SQPOLL rings
as well before freeing the ctx.

Reported-by: J?r?my Jean <Jeremy.Jean@oss.cyber.gouv.fr>
Link: https://lore.kernel.org/io-uring/20260924205056.3759980-2-Jeremy.Jean@oss.cyber.gouv.fr/
Fixes: af5d68f8892f ("io_uring/sqpoll: manage task_work privately")
Cc: stable@vger.kernel.org
Signed-off-by: Jens Axboe <axboe@kernel.dk>

---

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 2cb9b58d04dd..c2ce83c7c1f1 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -2405,8 +2405,8 @@ static __cold void io_ring_exit_work(struct work_struct *work)
 	spin_lock(&ctx->completion_lock);
 	spin_unlock(&ctx->completion_lock);
 
-	/* pairs with RCU read section in io_req_local_work_add() */
-	if (ctx->flags & IORING_SETUP_DEFER_TASKRUN)
+	/* pairs with the RCU read sections in the task_work add paths */
+	if (ctx->flags & (IORING_SETUP_DEFER_TASKRUN | IORING_SETUP_SQPOLL))
 		synchronize_rcu();
 
 	io_ring_ctx_free(ctx);
diff --git a/io_uring/tw.c b/io_uring/tw.c
index f573bcc3af6a..f9affd68dd26 100644
--- a/io_uring/tw.c
+++ b/io_uring/tw.c
@@ -210,6 +210,9 @@ void io_req_normal_work_add(struct io_kiocb *req)
 	struct io_uring_task *tctx = req->tctx;
 	struct io_ring_ctx *ctx = req->ctx;
 
+	/* SQPOLL can retire the request on push, see io_ring_exit_work() */
+	guard(rcu)();
+
 	/* tw run already pending, nothing else to do */
 	if (!mpscq_push(&tctx->task_list, &req->io_task_work.node))
 		return;

-- 
Jens Axboe

