Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0363BBFD3
	for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 17:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789149385; cv=none; b=UBg12Hbz/YeedF6k7EnOgYy+4YRXj/dbsCD+ROddv/t7e3ojSZAcbRi0auoNtUs4Wj7vord+OH6aaQJcw7PDDfDN+UiTOk11sgJfDDymsIPTLlo56xBm5k6K8hh5dxh63wdfjVwHyq9iNswnMQl8Xmo2DfhMtVl1sFinVuVMALg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789149385; c=relaxed/simple;
	bh=RLqYegAMuTyA67m7UvWtUXw/Q88dXF4ZoFIfoAjVFK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=o8pZzR3hfzqeLJG1F9eSQs+jFm6twOTLngKMGyKDc3gVziJsPV1wzOJm6xAQTVtCQ7MMV7zR7HVMLKTA3CNbEC+A2nRNNMO3NrNV/CBHlA1Og3IcqE/nlxH7d6ra7jRsIH1/klfc8+v9QSfxCc+0eUKzciBzQu3wogKOLGSbDp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sK1Dr+ur; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sK1Dr+ur"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cda5e048fso16295e9.0
        for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 10:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789149382; x=1789754182; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sxOgAckYA0sGT3jkWXNJ1T/ySQi8wSGVzAUZLkYG6k0=;
        b=sK1Dr+ur73CYwjq5uX8nuVMAJJXHwggPAaNsq8x2+hXP45EsXCGSQVmpWDo/R9Gwfx
         Tt/VgT28EMKiOVoL5EA90Dpadu2PuSIWg4HNfxcewohdUBgUoD5T+cIsIFRIKYOwfU42
         C/fmI2VANhal8r5qiPlmRCUv5wyVa6xWl6xB76G7UJSLhF4lkgOW7B25fzJcTx76g3ER
         FB0cqX8HUZa7ETdGzs9rXGBFjU26fbG8RyARZPNtRpbx3wr/+D1uO6epoMyzcapd5Qi0
         5ywUowTAMkaphTG6oRmg9A2mB0lIaev2LXMeZsB0oCfqay4vlIg5aZ2qGKDO4pWbfAtL
         n4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789149382; x=1789754182;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sxOgAckYA0sGT3jkWXNJ1T/ySQi8wSGVzAUZLkYG6k0=;
        b=AtTFlA4vYQxp9pE6GfXXWNk7St6V3xca5HPYYstwuV0POwHf5oMQ/fAUwUx3jpHtfw
         b95S0zT2BEqCO7yjdHyy+ovNFCe/lhy/E+SkgGNnhkMYE/WDEY0K49uT+bM4Kb2PtFWt
         kFX/HybQnmekfnMTD5X2TbcaiDXedccW3s+8ShKbqOwoHshYWC+gJas6oZVAFvPxa97N
         Mr/Dnjc/N88LZxWPOhLId79Hjp+yDWwDW5J1aKUShRY9nEqXF0Eg0e7fqQMR/+BiBcXr
         xuM9ggXYcdC67U17fFrXyaJl8vlPJceyVTlnuxIO2rsnTvOv8Ii25RorhFhNS6x336rC
         a1Mw==
X-Gm-Message-State: AFuF++mV4xiU4eyS0da/sBTCTqPzP+FIp7ANKq9fFqiIOuEfc4uhMXVY
	5ExIwfWhaK4TMH5+EommamQb9wISewYLytQyee73nDmxrQZaa9tWaSsXO9JmMDXVcpYRwk6aG8d
	MlPHOH7/f
X-Gm-Gg: AYBFou3xFU7pV1dE+KECiB5fSJo++puybiIA+AVz4WUbxmDsxX6PWR74wSPvvNt3YXe
	fk2Ld4nWlIFEWo42+ol3j4cnnF5TMpENjLn7y5lFeEu78JOAiNE2cVVHn5zpNYFm+pLcnl3bbzY
	Z0FUTrK2V26jyHxr0OqINvl2XrhZjMF2DUpqjV3wCNZUcpg6D2ZsUC8lncfAOiU0/y4BqXM1c5L
	r5Nr+VO2TvLWGQeZS/nh7qDMFaT1/z9q7QfXMb+BQoJq68Cj6wpwdAht95EalMqpCrZHGYOemJz
	UvcONdidhE6JVQQzH68iJo3IF/rP1+L7eIi2wAZYVuHcI1N3RxW47Crp+q8Wc2AEQZCLs+sH/Vo
	9cijTuQCn/E2izK+xAzdiFVmFMQS/PSGqh0ZvqP8S133EFAv23E94I5XipU3C3qx0BRGZGdo/l5
	W/Mr3qWc92nNPz7j22ji0x8vYw/Z2xGmBjE03t4xZNSTpVt50VoGicPcZd69mqu7eNvf6EeLW/z
	oXNvSSqjs2mHF8AXZymDEu9axw3r/RtJFV5LCh128M+pdtizF2WATb/SOE=
X-Received: by 2002:a05:600c:19d1:b0:499:a6a5:a687 with SMTP id 5b1f17b1804b1-49e6b79db37mr89115e9.0.1789149381389;
        Fri, 11 Sep 2026 10:56:21 -0700 (PDT)
Received: from localhost ([2a00:79e0:288a:8:d3e5:e8d0:cdd7:470f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34f1f7sm7580895f8f.24.2026.09.11.10.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 10:56:20 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Fri, 11 Sep 2026 19:56:13 +0200
Subject: [PATCH v2] io_uring/fdinfo: ignore IORING_CQE_F_32 in last CQ
 array slot
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-uring-fdinfo-tighten-v2-1-fa24d517035e@google.com>
X-B4-Tracking: v=1; b=H4sIALxApGoC/22NQQ6CMBBFr0JmbU2nAoor72FYlDKUMdqathAN4
 e4Cxp3Ll/z/3gSRAlOEczZBoJEje7eA2mVgeu0sCW4XBiVVKSuUYgjsrOhadp0XiW2fyAls0OC
 pyouDLGC5PgN1/Nq01/rLcWhuZNLqWhc9x+TDe+uOuO5+CfyfGFGgyI+mVBqLXBt9sd7bO+2Nf
 0A9z/MHzaozhssAAAA=
X-Change-ID: 20260910-uring-fdinfo-tighten-1b1c18945305
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dominik Maier <dmnk+artist@google.com>, stable+noautosel@kernel.org, 
 Gabriel Krisman Bertazi <krisman@suse.de>, Jann Horn <jannh@google.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789149377; l=2933;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=RLqYegAMuTyA67m7UvWtUXw/Q88dXF4ZoFIfoAjVFK4=;
 b=4O+nmwWqM18Vkzflwa9omB3cJvkWyts6exEt1kWyKs5XcG4WDiUaYW8+/K2PmfSqWc5tXjXuk
 oY1pkoUiD5hDjNx7bK2MQiYM14D+g07PYIsA81MgL6ETLlGrb0QZ+cn
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

A cqe32 entry spans two CQ array slots, so the last CQ array slot can't
contain a cqe32 entry. If the CQ tail points at the last CQ array slot and
the kernel wants to write a cqe32 entry, it uses io_fill_nop_cqe() to pad
the last CQ array slot with a dummy entry and make the tail wrap around.

However, malicious userspace can directly set IORING_CQE_F_32 on the last
CQ array slot, causing __io_uring_show_fdinfo() to read the second cqe32
half from beyond the CQ array. Change __io_uring_show_fdinfo() to
explicitly ignore the IORING_CQE_F_32 flag in this case.

This is not a real bugfix, just tightening the code a bit, because:

1. the number of CQE slots is always a power of 2, see io_uring_fill_params
2. the ring_region region consists of:
    - a 64-byte header
    - pow(2, N) CQE slots (each 0x10 bytes)
    - optionally, the SQ array
3. the ring_region size must be page-aligned because it is shared memory

Together, these properties imply that the last CQE slot can't be close
before the end of a page, so the "out-of-bounds" data is in memory
that is anyway accessible to userspace.

Reported-by: Dominik Maier <dmnk+artist@google.com>
Fixes: 82ceb7fcc5ff ("io_uring/fdinfo: handle mixed sized CQEs")
Cc: stable+noautosel@kernel.org # no impact due to memory layout
Reviewed-by: Gabriel Krisman Bertazi <krisman@suse.de>
Signed-off-by: Jann Horn <jannh@google.com>
---
Changes in v2:
- fix half-completed sentence in commit description
- add Reviewed-by (Gabriel)
- add comment (Gabriel)
- Link to v1: https://patch.msgid.link/20260911-uring-fdinfo-tighten-v1-1-47c62a154aca@google.com
---
 io_uring/fdinfo.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/io_uring/fdinfo.c b/io_uring/fdinfo.c
index 3ae4804765b9..882dd7f39902 100644
--- a/io_uring/fdinfo.c
+++ b/io_uring/fdinfo.c
@@ -155,9 +155,18 @@ static void __io_uring_show_fdinfo(struct io_ring_ctx *ctx, struct seq_file *m)
 	for (i = 0; i < cq_entries; i++) {
 		struct io_uring_cqe *cqe;
 		bool cqe32 = false;
+		bool is_last_cqarray_slot = (cq_head == cq_mask);
 
 		cqe = &r->cqes[(cq_head & cq_mask)];
-		if (cqe->flags & IORING_CQE_F_32 || ctx->flags & IORING_SETUP_CQE32)
+		/*
+		 * Userspace can manipulate the last cqarray slot to have
+		 * IORING_CQE_F_32 set, which would cause the second half of
+		 * that CQE to be read out of bounds.
+		 * Ignore the flag for the last cqarray slot, which can't
+		 * legitimately have the flag set.
+		 */
+		if ((cqe->flags & IORING_CQE_F_32 || ctx->flags & IORING_SETUP_CQE32) &&
+		    !is_last_cqarray_slot)
 			cqe32 = true;
 		seq_printf(m, "%5u: user_data:%llu, res:%d, flags:%x",
 			   cq_head & cq_mask, cqe->user_data, cqe->res,

---
base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
change-id: 20260910-uring-fdinfo-tighten-1b1c18945305

Best regards,
--  
Jann Horn <jannh@google.com>

