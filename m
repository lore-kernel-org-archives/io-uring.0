Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15780577E4C
	for <io-uring@vger.kernel.org>; Wed,  9 Sep 2026 14:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963038; cv=none; b=mYtzt908BMvdd6Et/EP6y1tJ1clOVKyuvqViYotzW6FkQn8jONosoSaYadurzImVGP1WuKJ6g57bj2AsulNm0+CrpKVok6+K8D/OtKB8dRH29NvqnpLXMk1iEvNm8S/GicHC5n5y2IrKPqO0YhjIrMa0LiQub0bw2OxqVNLdWBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963038; c=relaxed/simple;
	bh=vwp6yiNj1/j7Nk9Wcy5RvoN/ZExhc6AXLvo4YlFSNd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IQR1F6zFDjM1GG9jc0Y0uTxfGOMZawENSotPLc4sZ1+oaPdly25jiWIZEBNh4G5MO9CpOEIFuoq2IO9K1esKZC8Fa5mLPM+Hu4UvHRoOq3rkJqXdl/McA8+c9uRfPx197f5898uVOLN/FB0AZpHLIqvWoPkrr6bqI6sE2UaeZ1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=jIvxj8G1; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="jIvxj8G1"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-47861ea0ce5so1876709fac.0
        for <io-uring@vger.kernel.org>; Wed, 09 Sep 2026 07:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1788963035; x=1789567835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t/ei4GluZJKc+FvtC/5fvRD3k0Knp1ZqHDf+scLHmdk=;
        b=jIvxj8G1F12tr5nzGzfMxkxzbxfAeMf/tiROhVrIyfNr85uaKak2ftcQh0KEugbUZo
         0rgffnMXmiIT0WmTLDNjG9Kwv7XYHtY/0UwSI+IiIHgPa9x9xM1C++8Ale12Tod+Idq/
         6VgUb7LOa0gsfumzWc69geAkl8hSPL/LnLG7GE9ICSjpl3IMguWUnoflFXxLZVrGn21b
         jECsKvvlw7mKiqHoCVLYCm8dltCnKXoEJa/Dh/D2mhYoEMJeJPim0N0i55FEDRj5ZhvP
         +sv4ZjuQGwtfFcGsBgLjkTAqi5fdNT7n/mGPZaON48guoSi0Jgflti5ZNgz/RRStVr+H
         UY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963035; x=1789567835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t/ei4GluZJKc+FvtC/5fvRD3k0Knp1ZqHDf+scLHmdk=;
        b=pycXUvk//TKkdx6gAHPfG+dC7dEpqc+xQQaUUMxo9P1O0HdDlnCU075npz1TIVWcTz
         nCKQAl9mb/BTB0JzuxQS6m/o+7cXI9FgmQo8WfF0rMzDtPxJLmvpIVTBuZBe2BNuVJyI
         HOCZhfKTDdS/tXZYuAu61k3/Gbt56xVd8z2/pqJEMITch9Bq0CX8sLANEYWPxxNgE9m0
         x/uryQ9iDGPUJ05pNfuwWOPP0l9v5rtYE5/n8D0fwoFTJJgMsP6lQySIC9NfkYNLkIpw
         OA905UXf1NcexX8QASI9CyQEYOX1Jtxm/VMJRiB+eDPAkqNxGK43Rpkv7WeY7f3YN/hf
         WRdQ==
X-Gm-Message-State: AFuF++mLkcEWJgqo5Ykre6hc8aaqJ0Gt3EOkIXZCMsgy5Q+UvW7Jy6FN
	3LMMrjW5Sj9CRs4XBE5T8fJslLRwNLYiHmRxJ/6U5o6ism4FJ3EzBM7KTbFGTEOdZzrPaOFkKWR
	SPboKIVg=
X-Gm-Gg: AYBFou0xsmhUlwcMGNP+AFDZHDyWpqDeG+y+CRzWYkdN2LlWYSrlOqkPcypIbyO7FrK
	27f5RdxLKmgraKp6I3ABOespNd0H9yfEejJD/haz0H7hPMiIiz3NDuzhggauMsDv6lrdQzBVdwd
	o70ryJdUSP1i+QQWMSOBT6W0cC4PYC8MLCgAxIdHaPgLv/TEhHyMve+WaXIjM8OVBprQsdkyKv/
	j37J5wMsDJqmC0Osg652CpR2s3PBAsfXZp/EY/37YD+rQzXtzNd6xM06Es8JZFZLbfCo4/uWyYG
	hbITtsQFFGJjc7bGbHQg8oAFf/ONKDUweU0TQy/ygBF5GTh11Cb2MCJB3YWCCf6M278mHcoeDj2
	5ZJeZQeQ75vgpmi+6NfmXh1wQk4Bspj5aY5mobAiPiVWVPACw/FSugfEgnX5QikHENim88T0kQx
	J7UhVwUX9hTN35w/EpOBNc9RknagqQhMhmPelcc/6nlmupxVItPmMF6+By04mVXjOYlkzfOIawe
	uk6w5En9ZJs4b16GCjhMyBtXgo9ID5yldR3KMk7lfV+
X-Received: by 2002:a05:6871:1c2:b0:475:a1ec:961e with SMTP id 586e51a60fabf-475a1ec9c01mr19770898fac.32.1788963034686;
        Wed, 09 Sep 2026 07:10:34 -0700 (PDT)
Received: from m2max ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47a7585b25esm5406514fac.11.2026.09.09.07.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:10:28 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: juanlu@fastmail.com,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 5/7] io_uring: drop registered files and buffers at release time
Date: Wed,  9 Sep 2026 08:06:15 -0600
Message-ID: <20260909141010.21064-6-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909141010.21064-1-axboe@kernel.dk>
References: <20260909141010.21064-1-axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Registered file and buffer tables are only torn down from
io_ring_ctx_free(), which only runs when all requests have completed and
the ctx refs have hit zero. Before this, every registered file remains
open.

The resource nodes are reference counted and any request using a
registered file or buffer holds its own reference to the node, so this
only releases what is actually unused. The rest follow as those requests
complete or get canceled.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/io_uring.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index e98b6f1d4495..0acdece3c196 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -2157,8 +2157,6 @@ static __cold void io_ring_ctx_free(struct io_ring_ctx *ctx)
 	io_sq_thread_finish(ctx);
 
 	mutex_lock(&ctx->uring_lock);
-	io_sqe_buffers_unregister(ctx);
-	io_sqe_files_unregister(ctx);
 	io_unregister_zcrx(ctx);
 	io_cqring_overflow_kill(ctx);
 	io_eventfd_unregister(ctx);
@@ -2424,6 +2422,9 @@ static __cold void io_ring_ctx_wait_and_kill(struct io_ring_ctx *ctx)
 	xa_for_each(&ctx->personalities, index, creds)
 		io_unregister_personality(ctx, index);
 	io_terminate_zcrx(ctx);
+	/* Drop these now, rather than async, to unpin the files */
+	io_sqe_buffers_unregister(ctx);
+	io_sqe_files_unregister(ctx);
 	mutex_unlock(&ctx->uring_lock);
 
 	/*
-- 
2.55.0

