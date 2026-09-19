Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C9C38DC4C
	for <io-uring@vger.kernel.org>; Sat, 19 Sep 2026 20:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789850119; cv=none; b=Ar3TAeZI50p5Kv0v8DgWIZ6IH6wEik9EK5pQYYUp6lOCo8ELWcBSb+tFjQ1n5TdyXutOQPlbBHNur/SW8kzpKVa6MDgwDXlOfo3hRQDPW5FR+I0W7Mb/hWUrDV36U73xw0Fbdap1CtA5kwEVrLPy/MXF+4e3NYcN65sY4NXaDog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789850119; c=relaxed/simple;
	bh=e6wD7xFzVvw/e4rUR3XRB7YG+VlFC7z+p8pa3TXX5jo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HRC5wBAChpHmldMCB23kwJpjiFDObmmOWS8l4EZB4inSEKJ4XpAyfFjXsn+DKvvwBFE/qDA+oqykQrpeeVSkazZMJqstDYTTQ0UiV7/ExrsUJhNZel/xwNqYxCEIJGwN+Sit+vs66/bH76O8eUFv3QmmMHaMtDGBruIcLl0MVkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aa3uMmXG; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aa3uMmXG"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396cccbba92so1687353a91.0
        for <io-uring@vger.kernel.org>; Sat, 19 Sep 2026 13:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789850118; x=1790454918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FPAFUSgkjduYMM+Kn550R7KXHA2uXtMffwRhKL77s5g=;
        b=Aa3uMmXGqKq7G++XGZI2E6u/Zhwy+0Fa3YGHtHDS9vCWKkQoyXXf2hp4nb2+n3D99l
         2MScpsQ3wTQ+RTnVoqVJEYThBoK/uwoyaaEnDyxKui940bO8nuvJVDRIYBAUtUTQbnIE
         WMTfISZjXmmKOTMnIilD1NAXxPV6WysZ8YbT8adsxo8+l6X+A6ADrAsoU2XeLQEn9Eu9
         5ylghV+a2glkFzTX7LxC54Rtx3R0OYSs2vYomG9wY2CSiQHu7cK0HE9TGjz/dxqeWbtz
         osE08dcj5XVHSW+2KmwlT6eoFiR5xN5wPPL+Vo67q76B4chlAxoRokQ5NNslpQJCVvfZ
         ApTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789850118; x=1790454918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FPAFUSgkjduYMM+Kn550R7KXHA2uXtMffwRhKL77s5g=;
        b=pPxPwGlBMlm6xAH8U1XrEZ0HikNx5qBTSpn5SoJnL6Y0AalpSF5FmVTLadCilh4fNw
         EBmBzRLjX7VZVLVjWXHGuvyBYIfZ/Idl/mDBf9g9bMEFffcCn+f8mmBThEacCTDveOnx
         XNJF5O80lHhZDSx0DsSBDW2NzgIQeMSPG1LuNZDxfeAMc2KcOCATFgmSqSx7u3f8+b95
         VPUUDk7v1QF5+peNnvDWZwITCljMhIKIaRgqbM2PhEGjgCx0dx6okykUa8Y+LO905R+l
         epkMFpIGP+Zp23UYnFMQR04QNukCqpgoSUHy1LJjsr6BrhCkGHkEkYOSU8VH4KLQ+OIW
         RfoQ==
X-Gm-Message-State: AFuF++llfDV1YgP0hy1KbgHEh0JNUNTB6lZYANs/lqX0YeKChIM9SVXn
	85YrKW8znH+4X87ztDybd0aCWwIv5jT51ugvhcNPE+nLeCJuFS+/gOad
X-Gm-Gg: AYBFou0qdmeHJevzED4UyJNG5J5A/aznY+vLqIGo7YDW697FazOG4dctpd5jIg1rdvf
	KRaNsMrIJiqGPlIe83GdPn7hxKS3sMnPjT7LTOPt1FBCNo2qcG3DgMx/LMtkZOXWNMuzZYG8Maj
	EBKpjKUo95waz+/Gj2D19EWNwQU2j8b9R8T3AOM/lPsVDg074Ld+8z98Vi9TDNayP8iBuhfxmOK
	x/3yMSgWUs5oTjP9V0rkHA4kR90qZoIt/FV6C20gkM58FuqtSsZvCNcNdiYYJewFrbUeMYMk3hx
	s+fzUqXlOHx4jHfsFEzZtr7d2Rrpl3ua9qgSv5t/1PZyZq9ievN9X9rqWvo/P71HZrWfGYGDsmy
	fjOagjuOqPPfsUjhMzF9CrqZ60IktgDmxhBXLWPGxTlrDQcUX6m4TXTirug+6qZangNK0URPuN5
	JKV4NO++rHMx5bT0Dch2OZaadQfuNnnmb4v+zk4DBXdf2XgKTROPWXjYYv737WP9A8J75vog41M
	4EsK8Ty3pQW00NwXh4uglV88+xrKPXekikOAwfh3t6hbtRLFWxnCXRxpe6mzaLQilS5pAOFpehy
	dZfour8AVg==
X-Received: by 2002:a17:90b:2243:b0:398:9be9:ab92 with SMTP id 98e67ed59e1d1-39e54d56e0fmr11169300a91.23.1789850117666;
        Sat, 19 Sep 2026 13:35:17 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c6dd585sm5655907a91.0.2026.09.19.13.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 13:35:17 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] io_uring: fix CQ tail over-commit and CQE32 index corruption in io_cqe_cache_refill()
Date: Sat, 19 Sep 2026 20:35:16 +0000
Message-ID: <20260919203516.2581409-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

io_cqe_cache_refill() has three issues when handling 32-byte CQEs on
IORING_SETUP_CQE32 and IORING_SETUP_CQE_MIXED rings:

1. When cqe32 is true and off + 1 == ctx->cq_entries,
   io_cqe_cache_refill() posts a 16-byte dummy IORING_CQE_F_SKIP CQE via
   io_fill_nop_cqe(ctx, off) even on pure IORING_SETUP_CQE32 rings
   (where IORING_SETUP_CQE_MIXED is not set). On a pure CQE32 ring,
   ctx->cq_entries is the number of 32-byte CQEs and rings->cqes is
   indexed by (off << 1), so writing a 16-byte skip CQE at
   &rings->cqes[off] corrupts the middle of the CQ ring and misaligns
   all subsequent CQEs. Restrict the wrap-around skip CQE to
   IORING_SETUP_CQE_MIXED rings.

2. On an IORING_SETUP_CQE_MIXED ring, when off + 1 == ctx->cq_entries
   and only 1 free CQ slot remains (ctx->cq_entries - io_cqring_queued()
   == 1), io_fill_nop_cqe(ctx, off) consumes that last slot and
   increments ctx->cached_cq_tail, after which free == 0 causes
   io_cqe_cache_refill() to return false without updating
   ctx->cqe_cached. Check that at least 2 free CQ slots exist before
   posting the dummy skip CQE.

3. On pure IORING_SETUP_CQE32 rings, len is in 32-byte CQE units prior
   to `len <<= 1`, so `len < (cqe32 + 1)` falsely requires 2 free
   32-byte CQEs instead of 1. Check `!len` before scaling `off` and
   `len` on IORING_SETUP_CQE32 rings, and in io_fill_cqe_aux() zero
   cqe->big_cqe[0..1] whenever IORING_SETUP_CQE32 is set on the ring.

Fixes: e26dca67fde1 ("io_uring: add support for IORING_SETUP_CQE_MIXED")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -733,7 +733,10 @@ bool io_cqe_cache_refill(struct io_ring_ctx *ctx, bool overflow, bool cqe32)
 	 * Post dummy CQE if a 32b CQE is needed and there's only room for a
 	 * 16b CQE before the ring wraps.
 	 */
-	if (cqe32 && off + 1 == ctx->cq_entries) {
+	if (cqe32 && (ctx->flags & IORING_SETUP_CQE_MIXED) &&
+	    off + 1 == ctx->cq_entries) {
+		if (ctx->cq_entries - io_cqring_queued(ctx) < 2)
+			return false;
 		if (!io_fill_nop_cqe(ctx, off))
 			return false;
 		off = 0;
@@ -742,12 +745,13 @@ bool io_cqe_cache_refill(struct io_ring_ctx *ctx, bool overflow, bool cqe32)
 	free = ctx->cq_entries - io_cqring_queued(ctx);
 	/* we need a contiguous range, limit based on the current array offset */
 	len = min(free, ctx->cq_entries - off);
-	if (len < (cqe32 + 1))
-		return false;
-
 	if (ctx->flags & IORING_SETUP_CQE32) {
+		if (!len)
+			return false;
 		off <<= 1;
 		len <<= 1;
+	} else if (len < (cqe32 + 1)) {
+		return false;
 	}
 
 	ctx->cqe_cached = &rings->cqes[off];
@@ -781,7 +785,7 @@ static bool io_fill_cqe_aux(struct io_ring_ctx *ctx, u64 user_data, s32 res,
 		WRITE_ONCE(cqe->res, res);
 		WRITE_ONCE(cqe->flags, cflags);
 
-		if (cqe32) {
+		if (cqe32 || (ctx->flags & IORING_SETUP_CQE32)) {
 			WRITE_ONCE(cqe->big_cqe[0], 0);
 			WRITE_ONCE(cqe->big_cqe[1], 0);
 		}
-- 
2.43.0
