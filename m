Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C79407CDF
	for <io-uring@vger.kernel.org>; Thu, 24 Sep 2026 06:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790231730; cv=none; b=mfwBeFLvgXUPMLAPv6qWx0m5TIrm2b2OWpuX7DsqoRB2oDsd59cZ6WieUzDY+4OeXlFOQDx4UsY98ffTkqM0uQ3IdBuv1tFuNcDgohli54s8ZQkVSQyvstTMuVOTQ2vpLdXwsbZL1BSgx+RqERNSPnBoGe0JIxlcFWX4w8pD8jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790231730; c=relaxed/simple;
	bh=GoE6o8P/d0Va/Z0LlIUQKz5h1yWkYNQVcuM2L4eXEIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r3bHO9g8PsE5FEhEED/PCt1B+1xPH40fUaB01XfpukT2M9MiXlDZHiaSCOfO+PadW0PEAVQGi/Vw2DdqfjrRMyHlF0aI+8h+TChS2TorK3A+989gEVU3Ko2EQUxOI6hvj8WQCnWD7LlTKCfJPVJVDlfBRnZ//++Q996Xju95bOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UEgo2/yv; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UEgo2/yv"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccdaea76so757107a91.0
        for <io-uring@vger.kernel.org>; Wed, 23 Sep 2026 23:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790231728; x=1790836528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8KB3JUcp+hPnUpMcJXhgcWxJ6rdRHTjTvXdKQKWbtEA=;
        b=UEgo2/yvjFd9M6whhXNTGY3N2B/S++bCqtrkMwxri+rL/bx3EwqFQNJnn7EenKcxSz
         UTuxQLNaU5FXyI1XJ8ILY1DMYYb1Z6qKh81kS6jjFtAz0G54m8QQVX9peVTf0dmB701K
         SWaLNQC12TurlSfImdpg3ORtFBefUQVSskxHK4ig92KGFjwErohkWVQ3TvxU8RS+zN5J
         Nxm69kEgTpOEWPCovFdAfo+7/EFZ6ELxtpsK4VsvsdEboDwunqxbM73kyZTViNiLXLmR
         7v3O2KkfmMlpgNbLtYX9j/9vsOsLrNo1nUu1hz9G8Mg2y1JeCn88l5Rp79gag6PRAJGv
         Mpxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790231728; x=1790836528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8KB3JUcp+hPnUpMcJXhgcWxJ6rdRHTjTvXdKQKWbtEA=;
        b=ZV+j0XdLwgSOlvC0WTsKppjMrtq6LJPJfMPfqot/MkfLe2Sh/M9/Np3LgQsLi3hVsz
         RktBgg3ehz038WfRDQ7Ap1AW6m5iqVSWqc62YCYYY5Ctmj2D+qPN7r9MbFOxjXqfT/H4
         hjaevEWzQ5vmoG5iX+b4i+0xdpIeRN0cSTuxO+E8u2lvpayumUls2V1GWzDp570IIinS
         xBaza01nUiazYr2jRH+JvaSCFPcwGDbW1xk0F2diAoxwCjRDKp8a8VwYBb4Dhr+Tv4qZ
         aHl2oINrXztPJBhzatB/uMSD4V+KZk6SxgyxXlVdjMEpsxdDGEay0RMHMHjRWg5C2IN7
         8sHQ==
X-Gm-Message-State: AFuF++l/aBwrQW++RnH6sTy4PLWDVY7BXzTZfCNmXEIN+mLNS1/ktCt3
	Hcv+M8VN66g879etifXnrjbC2Gj+YIbBaK6STjm+oXTWsmrzq8LykVIP
X-Gm-Gg: AYBFou2FOy6WRqoisXmHJuxcexk8vGufh5RB5jW04y5XqYNbNwSD0XpU2PuKjyiDH2n
	0HEYKR012LJgwfYa6sZm/+vCSP9C5RNzZr9aGQuslAtHC7rpeWNjDbZxdtQLdZtSLGgEuHBhSOq
	1u7s1zdj28XOOS2sz6Rt5sY8tricjxb95Jerbmtnv7lI1Huywj8k4A+nUZ1gDGGHUkDhCVCHTPs
	A3St/htxPDMjzb75wMv9QVvOD1ehSoVdioHEZi1hWbgmnY6gwurYvAJYDXj7ciSdKlSaE/20Ues
	ssVt18lofXfBNGXxtNWTKBgCAEl5Tbnfu72SAJVUJXvQ0RrnhEPesnm1c5UdxQt45FDP1so6u6Y
	tk0oxyAsOPM0Y9CrJ8jVG/Bxt/A3LZK3zHx8hD+08W2hEsoU/27aQEI779VN5VPDnvhHuLZkIYL
	TLZyzMsXBtT/hUXr1mG/NEYNJQz9tc9NSHJk3eF/xpQcUXKOhPaSypeH5YuS5TzqRbzHIVI9z8+
	CAdao+1ifoRfnB77gxnT8YgabmzQayrLT2DrB3Zf/Pq1EF9rtAX8PhBRi2fjfBvFzL5EiBHcqoP
	fe/GNefhJA==
X-Received: by 2002:a17:90b:4c0f:b0:39e:3dad:684f with SMTP id 98e67ed59e1d1-3a09860fe27mr933896a91.4.1790231728114;
        Wed, 23 Sep 2026 23:35:28 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a096b8753csm3109897a91.0.2026.09.23.23.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:35:27 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v2 2/2] io_uring: require 3 free CQ slots for 32b CQE in io_fill_nop_cqe()
Date: Thu, 24 Sep 2026 06:35:25 +0000
Message-ID: <20260924063525.2500081-3-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <20260924063525.2500081-1-benquike@gmail.com>
References: <20260919203516.2581409-1-benquike@gmail.com>
 <20260924063525.2500081-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When io_cqe_cache_refill() is called for a 32-byte CQE at the last slot
of an IORING_SETUP_CQE_MIXED ring (off + 1 == ctx->cq_entries),
io_fill_nop_cqe() writes an IORING_CQE_F_SKIP CQE at the last slot and
increments cached_cq_tail, consuming 1 free slot, after which the 32-byte
CQE itself requires 2 more contiguous free slots at index 0.

Currently, io_fill_nop_cqe() only checks io_cqring_queued(ctx) <
ctx->cq_entries (free >= 1). When free is 1 or 2, io_fill_nop_cqe()
succeeds and increments cached_cq_tail for the skip CQE, and then
io_cqe_cache_refill() computes len = min(free, ctx->cq_entries - off) < 2
and returns false because len < (cqe32 + 1). This leaves an orphan skip
CQE in the ring with cached_cq_tail already incremented while the 32-byte
CQE is deferred to cq_overflow_list.

Require at least 3 free slots (io_cqring_queued(ctx) + 3 <=
ctx->cq_entries) in io_fill_nop_cqe() before emitting the skip CQE.

Tested in QEMU against Linux 7.3.0-rc3 on a 4-entry IORING_SETUP_CQE_MIXED
ring with 2 queued CQEs (head = 1, tail = 3, free = 2, off = 3) followed
by a 32-byte NOP (IORING_NOP_CQE32): on the unfixed kernel cq_tail
advances to 4 due to the orphan skip CQE while the 32-byte CQE overflows,
whereas with the fix applied cq_tail remains at 3 and both slots remain
consistent.

Fixes: e26dca67fde1 ("io_uring: add support for IORING_SETUP_CQE_MIXED")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v2:
- Split out as patch 2/2 as requested by Jens Axboe.

 io_uring/io_uring.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index ae7c77158c58..b430301fead9 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -698,7 +698,12 @@ static unsigned int io_cqring_queued(struct io_ring_ctx *ctx)
  */
 static bool io_fill_nop_cqe(struct io_ring_ctx *ctx, unsigned int off)
 {
-	if (io_cqring_queued(ctx) < ctx->cq_entries) {
+	/*
+	 * Creating a skip CQE and posting a 32b CQE requires 3 free CQ slots
+	 * in total (1 for the skip CQE at the end of the ring and 2 for the
+	 * 32b CQE at the start of the ring).
+	 */
+	if (io_cqring_queued(ctx) + 3 <= ctx->cq_entries) {
 		struct io_uring_cqe *cqe = &ctx->rings->cqes[off];
 
 		cqe->user_data = 0;
-- 
2.55.0.1082.g2b9226bbc0-goog
