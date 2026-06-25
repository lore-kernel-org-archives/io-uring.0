Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101B737DE85
	for <io-uring@vger.kernel.org>; Thu, 25 Jun 2026 14:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782398263; cv=none; b=jgS4KDEez94SKPDgBb1JLrGHmTYITuQQAwiduHxzE/I4pKSN3kDaAzRjjzcIRSx+z/dW90/+t0GVBUgw6Y9RwZrrBlOJ6WJ51HyunuzaRrX0BPqVQpLnLI96IeWygQldtKC7JrnXavc1DSzKXypM0KZ00+Yk2qlpJN+b/oVKwek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782398263; c=relaxed/simple;
	bh=Q3tt6REVXcxXZT3ebAPXSP4RaZe/TjjbC7v98KBe69s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SPtBRfmdzgOT3H/Ghxzj8O7HKM7Zb8XaP70kzR39JZwWh0TOFkzOn0RCRDQIbnpG2zdw0bLClLLBicfH3VIy7c/+GhckgxZB93BnmSoS3RmA/FOMBrM1LsrtAQhszkjPJuqnLsJ7p++e3bab8Y5+xXz6fm+O3Al+Pz2tBR/YZpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dwvacnyz; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dwvacnyz"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1384eb94d20so5363630c88.1
        for <io-uring@vger.kernel.org>; Thu, 25 Jun 2026 07:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782398261; x=1783003061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p5KTZ83c8IjxLkWE8chXVfyqnzGcTN3mDv6Vhk9uWB0=;
        b=DwvacnyzVFno7DDFNs9kjg+zlAtTTI8zCLQW4c/kFuG1m0NHjpL7cgoLdbTqXZ4BOx
         lBt8IiGVq9FVBpeGI/h/CFmF4sAAiLYcfwGgnmD4nD/XWIlhau3+aZXGA+WJ2nsYE6F+
         ZPiOnDkrp3JL7xAFeXzcl/ncjY0nL2ZavaQC78eOqk8sQjy+5K+JKNVxAfoLrafgFoRB
         dywwIqT/ZaOQVg5Ejsdvob9g4IYGL06pe6Cxi3wZRavAgTSDPPM8bNvH8nc8x3jSa8hU
         P4zYAgD8+U1I0XkfalhB3sFkOZF1/tAosu0eZ5A88vnwM+uNpD2b7fxno79QS5RhjMoc
         pOAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782398261; x=1783003061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5KTZ83c8IjxLkWE8chXVfyqnzGcTN3mDv6Vhk9uWB0=;
        b=Pd1avIjBxLUEc/jFA2JZdI8EWaoLjzPpysuc40nJMseJRnK18NPuIfoOq/BlI0Jo4V
         rENEHbUPJlBtT7MpqVNZQOo9VeMkLuEBV4m2spPph8lP9PJb/U4LPolK4Njqe8cCkYOT
         Y1hr0cSe1GKvZ46wAP3BULFTYYdjvQae+3nyNFRv+kybHO9gzjWDhccQZjoH/j7Yuknw
         /AHFHOj+ZAe2NEqaCfCi56+xbTJtLxl8RmVA4hSYQgJaX4mFbNCmPgprxB/4Gzd2zzcE
         4Q68hEf/OHUsaeeD+2MxlmLpDqpnO6u/Q5moPEvQSHN9W4nxKGyTnfxLZ2s8yR597904
         l2Bg==
X-Gm-Message-State: AOJu0Yx6cxCo1ANIlqTpT9yhI8jx/JOte759qIQ76NlIOTtplSE2XCPE
	J65y+5e5F3TecpMS9/LiJWFF53+Q/NYPIWvdDSgrGEQ1AYL1kn6pUNIHxsTxy01M
X-Gm-Gg: AfdE7cmhFAD73qQHGmxtPWhYpMt7W9qoBJtp16CJqnjfalE1sBq/0dxDM30SmhOPxUp
	qhSowy4Gz8/lj1sotNZibm8aPyJj5LCp8aytZ0F8Jb3FB2wDxarBXQgStmiXFV7yF/oGqsuYw24
	8ENiJTu9U4zcZiSgNT/QVNp2BgnS0yS6d+jyJbnPGF9FMwo4UjYvnnN38d39sxeIKd5L4LgWd9t
	PDo6RGzmwPMRaV4oYkw2E6XNWUZFAWm2dJwy4VFNLnkVllZhSgi9bgd8FjU6IlZveXjUc6g1K+M
	lMCFbU5etlwFQ8Wws15ya7SQjwYg+XWKXHAEnAkIDcjb6oMZlPDoPbZBoPR1/PaF/FqSHakUMUN
	4M3+IIABQLmhXW+n/tX0pvE2NRS16y1u8jYUSeJ0i9kbv5YtHYyFj2wUTkcuL7iTgqX9mMbdMPt
	gtH7nwOw8ncP0/38P7wozR
X-Received: by 2002:a05:7022:2608:b0:138:104:439b with SMTP id a92af1059eb24-139dbb2ebc0mr2689592c88.19.1782398261112;
        Thu, 25 Jun 2026 07:37:41 -0700 (PDT)
Received: from idcredbox1391.. ([2404:f801:8028:3:c41c:6a9b:de49:73ae])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8ddcd34sm8744222c88.0.2026.06.25.07.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 07:37:40 -0700 (PDT)
From: Subasri S <subasris1210@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Subasri S <subasris1210@gmail.com>
Subject: [PATCH for-next] io_uring: remove redundant NULL check before kfree
Date: Thu, 25 Jun 2026 20:07:33 +0530
Message-ID: <20260625143733.975006-1-subasris1210@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unnecessary NULL pointer check before calling kfree()
in io_uring.c, as kfree() handles NULL arguments internally.

Reported by ifnullfree.cocci Coccinelle semantic
patch script.

Signed-off-by: Subasri S <subasris1210@gmail.com>
---
 io_uring/io_uring.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 1ea2fca34a36..ac499722aaee 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -1114,8 +1114,7 @@ static void io_free_batch_list(struct io_ring_ctx *ctx,
 			if ((req->flags & REQ_F_POLLED) && req->apoll) {
 				struct async_poll *apoll = req->apoll;
 
-				if (apoll->double_poll)
-					kfree(apoll->double_poll);
+				kfree(apoll->double_poll);
 				io_cache_free(&ctx->apoll_cache, apoll);
 				req->flags &= ~REQ_F_POLLED;
 			}
-- 
2.43.0

