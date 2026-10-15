Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6EA552937
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092729; cv=none; b=BQMUfNx3j4bm+3rU3VakROIPY58m8Fz6EKtlIPR6mJahoIgEfGolP9O0q9VVNVAiAaDUql2TisxEseLaVcopUVPOSHIEOUtW3mf4kJkU9OithGuumngx25Oq7vdHft77c+fcrwIsuL+Dv3x6eVoFO8oNlv/k1LS6A4pgghAxke8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092729; c=relaxed/simple;
	bh=idqvqS60WqwxZzniS3aDNqRG0SD7Bbl+b2Aqdx29WvI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X1niueRUSEDey8oi++qI2nRhIUEg1LVJvo28f2DwpfKrGdx49GCnP8VmKBWtM6iYe2Yg0FoMvwvJamrTzX6Taxphdm280t8KK424nIbofv1dr7tgjFepJqOj7Haj8fqFx1w8RapPf0mekEBm2SF3xqHMp4VsvLlXOxit5Tvehw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=sXIEBLv5; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="sXIEBLv5"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5351748222cso16124191cf.1
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092726; x=1792697526; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MXFEbHeQEvZNInuc0Uzi2zPsieujNHgo1CGRjjVdcIE=;
        b=sXIEBLv5LvicVKA/wkilZ+XCGGquX476sXog1q7Juw+O/H293sew8Tb8L5bodZsEwx
         CxvK708ErQSaDu24acxkO42LY/tmphT9DTX1zY2dkTv8aGYAHuff8ekgQGK/9dYjQ2e0
         rt8UO4yGgIzST26gu8QpQtAXbVKTU60x8gu5BCZlBvAcAaOEwMzvmU4v7PLUL5NfJJEC
         s8H+LKGayMsMCXOkEeWyARxobWxcOpvLxF7szGCber97g0PTjhEeQt6IIH5u/4QgBPsN
         kUH59Qe4Fg5V2D7UtLOMMaMQhYjckS6KV6EZ4Ah9juh52UgN5vqF2fMXyNfowQ6xmiqI
         /D/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092726; x=1792697526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MXFEbHeQEvZNInuc0Uzi2zPsieujNHgo1CGRjjVdcIE=;
        b=1C/AqWd2FO9+P60UpvM4m+2awn9Qh6PypgLDcjJ++MrfFU06EFI/O8/Yzl99GcHT9m
         FjFqfDy8MjqCVizT2RNbx6v9013azUbNzZlChpdj3PIWFNzJ9i+cFoKdHer75TfylI9T
         FsMQDx+yKJYDmCWdNxJI1oUrTvSwZW0W/m0XxngSEfvOF3tgOhaiCjN2kdJ2Wfa052uv
         Ai4Gody+WGSGjwTMF+veWNP0pWoUFitKpCNg10lfGyK6CFJLAKx9JkeJdx2QGaO96q4l
         L+U9Gknp8qDgc2R2BN/5lXDEyKkIH2j0US+3Z06qh6nJe6DmqJHHDTHFFW403u1WsfG5
         fh2A==
X-Gm-Message-State: AFq9FYKGJki6LkWd4agPLnlj8HRxOi5Ln/H+yHChADJlk2s0CJbpimBt
	ydaqClP0ub9YmATYqddGTHGmTgCw2isCVr3wsrvuB41EkiK8yjfbNW0NbrOAhm/h//E=
X-Gm-Gg: AYBFou1FRwJiMHjNEIZbwgPaoqwKz6VWtzOYD1VTSQ1xZMEz23oEyCPrwnUqkHNeekP
	emXuJZWPzCsp8YMIhtTUDzkU1MDBO+ucSk+YyUzFo4ZDsX1I0G5CnFCbhPEd9o9leRxso1nBib4
	iwubazBm3OCu3vmJ6Nq58PKMGIIW7yu6RoSRBTzRifglahBy6XB6nsWWsd959m2FwgYoWAl0QVi
	4dnUFM+QQhPZaOWuMbckKx+nx3OUDWbaY1YN1aOj4fmtIxsFO2Gl8NGRkXcR2vRYo5/6PYC610I
	fwFyqDht5N9p/xPUB/gc9sMy6eZFOKkb50otuPGVZjKW+51gtdcIZjvVDcwSqH3vN+ddQvv36sn
	qrfZGItPrPw3F5FC8mu6uxZ9ZR2phEGwqdWZU4/AhYxXpZC/B7o+faCBuVh/5WWCbpl1FfWe+qv
	PPkI+z32R19+N1zXr8BCzVfzr+NO8fx28vKcKPiqoxVulbVJLUhqHq6xcqfw8g3PvDi2E1A671w
	gBPrdIKDOip8Bo=
X-Received: by 2002:ac8:6f0a:0:b0:533:3d48:37f0 with SMTP id d75a77b69052e-5359fb5a466mr302277091cf.47.1792092725973;
        Thu, 15 Oct 2026 12:32:05 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362a8e43cfsm1488551cf.5.2026.10.15.12.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:32:04 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:30:52 +0000
Subject: [PATCH 28/43] io_uring/fdinfo: fix CQE dump of CQE32 rings
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-28-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092659; l=2896;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=idqvqS60WqwxZzniS3aDNqRG0SD7Bbl+b2Aqdx29WvI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QP9ND9BQK80+lnHD1wLk4dYs+App3/n/3iAUefx1Sg+dcDzxEbcZJkQKhwhXMQFbOfw+GTx7J7c
 fpXZw7YhfJAw=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

Since the CQ ring dump was changed to deal with IORING_SETUP_CQE_MIXED, a
32b CQE is taken to occupy two entries of the ring. That is how it works
for mixed rings. With IORING_SETUP_CQE32 each entry has twice the size:
head and tail count 32b CQEs, and entry n is found at cqes[n << 1].

For such rings the dump reads cqes[n], and skips every other entry. It
shows half of the pending CQEs at best, and what it shows is taken from
the wrong place unless the head happens to be at the start of the ring.
The extra data of the last entry isn't shown at all, as the check that
keeps the dump of a mixed ring from reading beyond the array is applied to
these rings as well.

Fixes: 82ceb7fcc5ff ("io_uring/fdinfo: handle mixed sized CQEs")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/fdinfo.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/io_uring/fdinfo.c b/io_uring/fdinfo.c
index c362f3a81bdc..46e64b041360 100644
--- a/io_uring/fdinfo.c
+++ b/io_uring/fdinfo.c
@@ -154,20 +154,26 @@ static void __io_uring_show_fdinfo(struct io_ring_ctx *ctx, struct seq_file *m)
 	cq_entries = min(cq_tail - cq_head, ctx->cq_entries);
 	for (i = 0; i < cq_entries; i++) {
 		struct io_uring_cqe *cqe;
-		bool cqe32 = false;
+		bool cqe32 = false, two_entries = false;
 		bool is_last_cqarray_slot = (cq_head & cq_mask) == cq_mask;
 
-		cqe = &r->cqes[(cq_head & cq_mask)];
-		/*
-		 * Userspace can manipulate the last cqarray slot to have
-		 * IORING_CQE_F_32 set, which would cause the second half of
-		 * that CQE to be read out of bounds.
-		 * Ignore the flag for the last cqarray slot, which can't
-		 * legitimately have the flag set.
-		 */
-		if ((cqe->flags & IORING_CQE_F_32 || ctx->flags & IORING_SETUP_CQE32) &&
-		    !is_last_cqarray_slot)
+		if (ctx->flags & IORING_SETUP_CQE32) {
+			/* all entries have twice the size */
+			cqe = &r->cqes[(cq_head & cq_mask) << 1];
 			cqe32 = true;
+		} else {
+			cqe = &r->cqes[(cq_head & cq_mask)];
+			/*
+			 * Userspace can manipulate the last cqarray slot to
+			 * have IORING_CQE_F_32 set, which would cause the second
+			 * half of that CQE to be read out of bounds.
+			 * Ignore the flag for the last cqarray slot, which can't
+			 * legitimately have the flag set.
+			 */
+			two_entries = (cqe->flags & IORING_CQE_F_32) &&
+				      !is_last_cqarray_slot;
+			cqe32 = two_entries;
+		}
 		seq_printf(m, "%5u: user_data:%llu, res:%d, flags:%x",
 			   cq_head & cq_mask, cqe->user_data, cqe->res,
 			   cqe->flags);
@@ -176,7 +182,7 @@ static void __io_uring_show_fdinfo(struct io_ring_ctx *ctx, struct seq_file *m)
 					cqe->big_cqe[0], cqe->big_cqe[1]);
 		seq_printf(m, "\n");
 		cq_head++;
-		if (cqe32) {
+		if (two_entries) {
 			cq_head++;
 			i++;
 		}

-- 
2.55.0

