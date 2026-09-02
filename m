Received: from mail-qt1-f227.google.com (mail-qt1-f227.google.com [209.85.160.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7DF3E9C37
	for <io-uring@vger.kernel.org>; Wed,  2 Sep 2026 21:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788382959; cv=none; b=Srkbiv6OAkAYhpWoTr72CrSCQthD8qvQhHdsUAJ0nTl3ZUhxf6WFN7d8dSFhb0bMGHHeXkfjRGmU1xYzagn7uswhtUWbB2rFkaJzzB4SSWrrYZKAaL/zdHoFvf+M4Q3G9FP8++AKL4Jm2u+eC4o8YjPdCMJ3/StSW4WA7w7bgTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788382959; c=relaxed/simple;
	bh=3TFWsmk4nygEarMrcHgUjqJqHhwx0C2YZ3wDVLywR6o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BLMhUGZ35wxd4mAwW60D3nMVy+OdPKAqrnnXJ9nLvRphOK+jr530VND1QVs7WIaB/fYWSeTAI9XxN0xpQQ1tywEjH5wsavYpdXYiGVSaZ4fy6QZoSzriSXyYLLbAXeU5BAw6EHck59Kwnlksiga004dorPps0Z9OSg0m5lyiCRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=FqpCHKve; arc=none smtp.client-ip=209.85.160.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="FqpCHKve"
Received: by mail-qt1-f227.google.com with SMTP id d75a77b69052e-51cc91348ccso2197781cf.1
        for <io-uring@vger.kernel.org>; Wed, 02 Sep 2026 14:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788382953; x=1788987753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+MelvgAVPAD2i6TwFcxxB4mgOswGwKZ4Gv+Vrn4dDTU=;
        b=FqpCHKve8DY8s37O/bqYL//ry4uXHCHV1G6EA60Yr2MU+qkDOyTbA9GA+Pfc3gBgBN
         AgCyxiHM0qYZG5R4eWMuqKHZPolE2vxsIKmjTHzbw1Rp/Y0XF3NSj5oQBDRV2LLRhlxH
         GHIaxE/W/d51Rc5kLRaIKsEOqu/K/VQGK4Ack62rUvKz25oSH2kuSZm0AYB9w+OVKLEL
         WnZkm7cXCQ8TaPxAgnRviDXcexelch0Rkr9Go//BqanThBuKshzm5xP8iy6bIHPVRmpI
         HeCzsdXTNxAlJYSGwDEkssu9MAF2QY/7/VjvNmmRnlEBrc2YN9NaBT6ua+mZ7ZPYFGTU
         njmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788382953; x=1788987753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+MelvgAVPAD2i6TwFcxxB4mgOswGwKZ4Gv+Vrn4dDTU=;
        b=aDlnkSCQfanbn3Np+1l59Rz8xZJI/99MAP51qho7gg6mhsRmgI1OsM47eO2StVCQaD
         b1ii6rRD/tC01rIg+esTOr/fX5CG5C7exzBbg0nJVdagrD/79gYmT8kmyCpypL5TVtvl
         g1UJHsvPJFYFZkLBbp4mKeenMHZS5pNlS9KAFrdLY4tUrZwKkzpv0+ot6fgln0nblf7Q
         XnBPYFsjMMVDXqb/WZ46k5IFL/RUO9aQSqHZ0jFp+J9V0cTFuD1M6pmLQfbGOhZYZwEs
         Wh40S6VohI2oDWFnoCwfUearPh1iDhqxKryXmGh6YiIMmfkTfOjvuyYPnviHIukit/e3
         bpjw==
X-Forwarded-Encrypted: i=1; AKwUvBxXkY6b46drRzvMWJmJJr69kF44JcoK2a5B7h+P3VwrAwjBV+ONWhn/h0Au07tuLgBLArndhQRXnw==@vger.kernel.org
X-Gm-Message-State: AFuF++n0pHcm506Pz2jCl2NR9uTnkWfv2snDtL3YmiBXY4Ci6e23/jut
	3b/4ujvLO5UcJJOi/FURmCVJXtN4PjQdxQXBAxh3qqte7I5zHi5rlYtQTEj4igrFlVYeDUyGtYs
	HJmrIe/fc+8490QeTgE3Awy+WJbo9bIglWPfPk23mHw+uSbfUFStL
X-Gm-Gg: AYBFou0Zx15PcCtsrLiAzmWdONmBlfyv/48/02bCtqqcSUQgvwboHNFfAvnijFv8U7j
	XJLbnoSEJ5mxfkHcG7ox0tmRgN/F1s8TlMW5EMsdsFs2BxtuRRBb9skd3X0e4wXsXCeWM9xFEP5
	Y9G60lJBL96UmxnJEqVJtHweaIHAfLheodTHOrLBesz1q13t13z686U+rt+gWYTHGRUFLprBma3
	wEqy/7AXadH4RDwmRxJwMYZDF8PGMi055smneIMHkclzCNtBF4mZJlW2db91PB+6SDF+vgJZYOl
	+inqSZEmmpIdO8K2rCcxiAc1UbFtlMo1KPKZvuYc3NTZrnnCw1bykYdfxy5IU3uDUpWo1BbXJc6
	R2ncNy4r6YHN4n6e+
X-Received: by 2002:a05:622a:2c9:b0:52e:3991:84c8 with SMTP id d75a77b69052e-53036b97d16mr55677421cf.2.1788382924707;
        Wed, 02 Sep 2026 14:02:04 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-530331dcdc0sm359051cf.28.2026.09.02.14.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:02:04 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (bond0.slc5-n17m28-k8s.dev.purestorage.com [IPv6:2620:125:9025:20::a31:41f])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id D182240347;
	Wed,  2 Sep 2026 15:02:03 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id C6726E40404; Wed,  2 Sep 2026 15:02:03 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Caleb Sander Mateos <csander@purestorage.com>,
	sashiko-bot@kernel.org,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] io_uring/rw: keep CQE flags on iopoll requests when adding kbuf flags
Date: Wed,  2 Sep 2026 15:01:59 -0600
Message-ID: <20260902210200.2336720-1-csander@purestorage.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

io_do_iopoll() assigns the result of io_put_kbuf() to the request's CQE
flags upon completion. This overwrites any CQE flags that may have been
set by the opcode-specific layer. (For example, if __io_uring_cmd_done()
had set IORING_CQE_F_32, it would be cleared.) Switch the = to an |= so
the kbuf flags are added to the existing CQE flags rather than replacing
them. io_req_rw_complete() does the same with the io_put_kbuf() result.

Fixes: e26dca67fde1 ("io_uring: add support for IORING_SETUP_CQE_MIXED")
Reported-by: sashiko-bot@kernel.org
Link: https://sashiko.dev/#/message/20260827191705.D53C91F000E9%40smtp.kernel.org
Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 io_uring/rw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/rw.c b/io_uring/rw.c
index 95106dd1d7eb..f2bbb0b1c30a 100644
--- a/io_uring/rw.c
+++ b/io_uring/rw.c
@@ -1371,11 +1371,11 @@ int io_do_iopoll(struct io_ring_ctx *ctx, bool force_nonspin)
 		if (!smp_load_acquire(&req->iopoll_completed))
 			continue;
 		list_del(&req->iopoll_node);
 		wq_list_add_tail(&req->comp_list, &ctx->submit_state.compl_reqs);
 		nr_events++;
-		req->cqe.flags = io_put_kbuf(req, max(req->cqe.res, 0), NULL);
+		req->cqe.flags |= io_put_kbuf(req, max(req->cqe.res, 0), NULL);
 		if (!io_is_uring_cmd(req))
 			io_req_rw_cleanup(req, 0);
 	}
 	if (nr_events)
 		__io_submit_flush_completions(ctx);
-- 
2.55.0

