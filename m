Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283278;
	b=nEVqrKCfT9SVoVLo/Z+zHRlFiRaEUU3Rk0tnsEbV2OMvdlElGDyd16UYGNRoDc3ZMbah
	 lTIXvCG53ozD25XOPhM3b7kC5+LFKjWET/90/o/htOeeOiEX1lh5QHe3nkpKqPQllbazN
	 2KvD8xpdfE19RAfNlQYKElySCKdhZzRcWokzGArMZGr9SBCRkMgiuFThbBAxUW0ZBIRl7
	 SZMvn/mCkAvuaVRAqteLRM4FQ6qqUGdinsrprIcCxj51qiLXcNHkDlMKFsYCdICQXiXVx
	 8LbOti/I5Xxx93U+s/a0G/1FTu+Ey/wXZJG2JOzEikH4Kc4o8xKBg6CMgjBi6IljeXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=PLoanciEqh0v4OMWflog1gaphneVoMMUFBR7QXrHrXM=;
	b=5geJ9uaU0bY0J96yeaJ1To1nYsCCkaEgQr1sK/ZPO65QZZ2mIIr3H7atjXsSU8bWb6jC
	 L9euMvJJenFCJcJRgYm3zRvQnbSMbMl7v4rz+SbCy1TusJxMtovf2EMOiTqjd8K9gLMom
	 GKLhTFkMdZEvgt/Ydy5/BSM+X5KJcUrLARdLpG/M8CsfnsebLV87vZ5P7MW+FAc/mqHcM
	 Zj5fyto9ExeWNFMstxbmsB7YWVEGR0tgVLiK55P1s7FgBboxxC+wM/dVTLshBKUfF8eRd
	 qvX3e1WflFeNiT/lnm86pA8Ne9pHtziblZPVi95bi+fwrCSV/46mHE6Lp8MN37M/snw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R3BWaixN;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A05606A31F
	for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 14:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91A05606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R3BWaixN
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-185fd3a4ca3so2051202c88.0
        for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 07:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793283278; x=1793888078; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PLoanciEqh0v4OMWflog1gaphneVoMMUFBR7QXrHrXM=;
        b=R3BWaixN1eD9vuL/jz8jm13HByyV1w9hNC1cFaaMnRM5wpIGoXaIVvOkyAF54YFdjE
         Xp4JXOLFK9iQn8gJxYw49o96O9iAMn09C4/j8nrovnE6tVsMkM5jD4qHZP/fhIznFlHc
         zqvqi0uwe8hpbWdIB6ebhK8Ci+b9ApV4th2A7I8rFovZP9H8fLzWl1+CE9/V+5/WzrRN
         wgBDF/b49ZHZ8XRBPV4kCwhpg5Tkp6lA9TkQ6KM103jccJTLZveRbZzyZtm1GnZ8Kyk+
         QagMNnGqqb5ULuP+f5uHiC916YJ2+PtbodXgo1mie6Ajhjv2IFFOea3vg6bTebh8ChFS
         MYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283278; x=1793888078;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PLoanciEqh0v4OMWflog1gaphneVoMMUFBR7QXrHrXM=;
        b=1YY6tdDiU38yUXXvw0WVk2b84PlODg/wrLnXQ/tlq8uf2DrBHRH7JfWKiQzJ3EoVx1
         v3KOElSWrWyS2Zutw7ks3LDjXqwGPrWXglPNZTpy269Z0U3Ob/4BNlX8xBIYHYXfngUJ
         OVSEmqDKWOlcMMbzUPaQiiXHX3bseHRPyvLMzWlPCfJSlliVS0SIwrArDfjisBOSMeGg
         TgoOWdFfAF+wePq6RgTRwzKJ0nPmlXsVTgUjeDZW+Uy05ul8NMpDUGJvgfd7TkZbi5lU
         ENp5I0IgW2ArvwkkOF2wy3HJAXvqZEzZxZBabyaS6MnahtJXkwA0MkYzPMAXx8mgNnpY
         IV7g==
X-Gm-Message-State: AFq9FYJQrCa06tBaq0JNfGHBeIjEAk9VW3wVmVGnz12iDkCTT2hlI7VV
	75Ioym9dnOf9Ot3Yja2ONh2RcO8xwuvYS0DNjxGXQUVL6MGhGv8WUqLJ
X-Gm-Gg: AYBFou0aMtC+YwVliBpm2Hiii67ZfWGxRLNl1iOQbL43+1R4SK1Va1qI5kMQVb3bknN
	Y3rVtEq3ypF5sYszHBKQcXDAqU0w2PQv0rNtT6OIzCVjg1fg3+wzkSi7XTG3cvJNv11Qm9eDYBh
	CCZMNuycJTGjJWvm0Hi6HAcbujSNz4LTl6FpK3wRXdusN/yyCBzdqT+Roh7hDV33Lv0g965Kts0
	+ddcCPnPehwWpaTN1m4lIGTHzOwKQE4qZ7AlfGvq04uM2/K/yANt42U57k+3kTGiCFIGIZqmO6F
	c40/zr1zRO03/G7CUkRiwOQSLDx0cipYoSKTcu+V5i3CBqCvxq5xuDIS2Irg7F522+2AIT8mp51
	X7R7J8sJFgv9gbhSf6zrhO9MQms0h2rAqf3IlR3qlEmfKRkdwoAJG/OGbXVdW3Yvl0+J+GtM26c
	cjNNAAqd1T1NOZea6+CaVeAkloYcuFI/L2GnWrpr2y3PrtAx29eU3/G4KjxZnD/PgBJbfhBFZ1K
	yx34blmZcLAClqKZTHFXtc+dZ2kKQsqPMiwuG66BQVQ1LbiLeKiMJ7ova8zArZF9utfvsKdgrrH
	bg6rNbgZxTg+Z9eIG8I/9MaMU3bhq3TYS436nL6FADCw0Lt8wilTAIavYuk7SpgH7RfO93OM34Q
	=
X-Received: by 2002:a05:7022:1102:b0:1a2:1a28:9348 with SMTP id a92af1059eb24-1a6ce2feba2mr6785845c88.37.1793283277417;
        Thu, 29 Oct 2026 07:14:37 -0700 (PDT)
Received: from [127.0.1.1] (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75d76814bsm15197319c88.10.2026.10.29.07.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:14:35 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] io_uring/timeout: count cancelled timeouts in cq_timeouts
Date: Thu, 29 Oct 2026 07:12:20 -0700
Message-ID: <179328314078.648427.13761781546953594668@gmail.com>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

io_timeout_cancel() posts the cancelled timeout's -ECANCELED CQE without
advancing ctx->cq_timeouts.  io_timeout_fn() and io_kill_timeout()
advance it for every timeout CQE they post, and io_flush_timeouts()
computes the number of non-timeout completions as

    seq = cached_cq_tail - cq_timeouts

to compare against each off timeout's target_seq.  The cancelled
timeout's CQE is therefore counted as a regular completion, so every
cancellation makes an already armed off timeout fire one completion
early.

A ring with a keep-alive timeout of off=4 completes it after two NOPs
when one off=100 victim is cancelled through IORING_OP_ASYNC_CANCEL,
and before any NOP when two victims are cancelled.  The cancel CQE
should count, but the cancelled timeouts' -ECANCELED CQEs must not: the
expected counts are three and two NOPs respectively.

Advance cq_timeouts when io_timeout_extract() succeeds, under
timeout_lock and before the -ECANCELED completion is queued, matching
io_timeout_fn() and io_kill_timeout().  The -ENOENT and -EALREADY paths
post no new timeout CQE and keep their accounting.  Both the
ASYNC_CANCEL and the TIMEOUT_REMOVE path go through io_timeout_cancel().

Fixes: bfe68a221905 ("io_uring: off timeouts based only on completions")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
 io_uring/timeout.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/io_uring/timeout.c b/io_uring/timeout.c
index 8a2108a..fa7b0d9 100644
--- a/io_uring/timeout.c
+++ b/io_uring/timeout.c
@@ -370,6 +370,9 @@ int io_timeout_cancel(struct io_ring_ctx *ctx, struct io_cancel_data *cd)
 
 	raw_spin_lock_irq(&ctx->timeout_lock);
 	req = io_timeout_extract(ctx, cd);
+	if (!IS_ERR(req))
+		atomic_set(&ctx->cq_timeouts,
+			   atomic_read(&ctx->cq_timeouts) + 1);
 	raw_spin_unlock_irq(&ctx->timeout_lock);
 
 	if (IS_ERR(req))
-- 
2.34.1

