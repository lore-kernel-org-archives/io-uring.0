Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.21.23.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792859739;
	b=A2GMTk3/F/vtOehmLe2YTZviFct40uFoEAWagmikesHSsLsBEgBILf5tTLvAnqDNGMef
	 0Z0YTFFdVbQrH/s49DVZEUcXtzfwsvVOhDBzbCrtwKB35GgYA2w5vzAb9ppCn01hMeC2O
	 gCVrfU87zDpYkzKrwC+vWXH5HCN/0oOwMzkEFd85W4DD+2q2WMhE7g0Ly9yXFrO0lLuti
	 3uwVq2+5l6Ro9eJb09/moXIw4saxkbaYAhOgveGJyalfCveU+o19cQGrG7nWN7J3P2JKF
	 dNF/0gh5NBjj40CcNYIjpTq1FSw0Vb1NACywDqC9d+8JMEu0PFN0UtIrPB6qghEqRzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792859739;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JKY/lcWMVaQ67xOZYx6tRBWLvca83SiwJ6/dMEXZ0bE=;
	b=EEQ8n++Ruwv5T0fowPKJ8xHpqjVou0GVj9fQo5WLITeB6PsYI9akh6clTH7NDUn706Qs
	 5fikthtQ/0Amuzy1X6s1et5kDRWj9lH2KZrhoOrQU/PGQ4/wezPIAK3AUYfZ/XTFBQ613
	 FDTGcIuZsgdzIHVSSO6GeDr5pbKF3CT0mdKbVZvO+1/XJLYuBPPVu09OjubEmpwWh+6dN
	 xl8wBliadNPYmM9JUu2M+3CaSk3XXygtXi6K2X/dHgGWNZ4SoNPyWYcouT1PCeTnNbraU
	 YYasWweUkyBYZeHpQ6b19YwvdGMtK0XAVWH7zP4Ak2F6E4jmqdpsouCKojLehkFS0bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=disroot.org;
	spf=pass smtp.mailfrom=disroot.org;
	dkim=pass header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=R2afbEYl;
	arc=none smtp.remote-ip=178.21.23.139
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB20606A326;
	Sat, 24 Oct 2026 16:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DB20606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=R2afbEYl
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D2A0082BC2;
	Sat, 24 Oct 2026 18:35:36 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sxS2UL0hXsZg; Sat, 24 Oct 2026 18:35:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792859736; bh=SCd/04PYql/qw6QgwWKBIV95h7u5KuGcvlMF62ROVGY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=R2afbEYlem58HGjzGaRLFp7VLsUqClDb+Whm6GOCT4CFMFiOO7Wzkq7dF+edSx1Z8
	 R6lzL/peXlbV/ZVAYxpPbikMm3bX1cBEg5S/T5g6Ji+EgyJEya/1LzKZRfBYQ7dqtp
	 0ohioEUKRQOOhlT2Nvitb9CXXqZFyINib54w1rRxGThDOISz8IoK2W61wqx63iS/fs
	 Vn+uRPcZQwXNBL4KbRmcFYIosz2pwZH9eQFdx8H8VgbyJ/zoYHjDB5pUAshcE8/vS+
	 m6GDSxbneHDWo21XGNCh3HX/dHh8O1x7lOA7p1OqHM3u5pvOeUCQ8TC+gSVpIRZP6V
	 vfk2XD/x+u75w==
From: agxr <agxr@disroot.org>
To: Jens Axboe <axboe@kernel.dk>,
	io-uring@vger.kernel.org
Cc: agxr <agxr@disroot.org>,
	linux-kernel@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH 2/2] io_uring/cancel: complete single futex or waitid cancel with 0
Date: Sat, 24 Oct 2026 21:31:25 +0500
Message-ID: <20261024163259.19372-3-agxr@disroot.org>
In-Reply-To: <20261024163259.19372-1-agxr@disroot.org>
References: <20261024163259.19372-1-agxr@disroot.org>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A cancel of one request completes with 0, as io_uring_prep_cancel(3)
documents and as poll, io-wq and timeouts do. For a futex wait or a
waitid it completes with 1. io_futex_cancel() and io_waitid_cancel()
return the number canceled, and __io_async_cancel() hands it on, for
IORING_OP_ASYNC_CANCEL and IORING_REGISTER_SYNC_CANCEL alike.

Turn that count into 0, as io_req_task_link_timeout() does since commit
c74193430feb ("io_uring/timeout: don't end a linked timeout with 1").

liburing's futex and waitid tests expect the 1, and a liburing change
makes them accept 0 as well.

Fixes: 194bb58c6090 ("io_uring: add support for futex wake and wait")
Fixes: f31ecf671ddc ("io_uring: add IORING_OP_WAITID support")
Signed-off-by: agxr <agxr@disroot.org>
---
 io_uring/cancel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/cancel.c b/io_uring/cancel.c
index e4b27b79b05c..20df4e3538f3 100644
--- a/io_uring/cancel.c
+++ b/io_uring/cancel.c
@@ -197,7 +197,7 @@ static int __io_async_cancel(struct io_cancel_data *cd,
 		if (ret == -ENOENT)
 			break;
 		if (!all)
-			return ret;
+			return ret > 0 ? 0 : ret;
 		nr += ret > 0 ? ret : 1;
 	} while (1);
 
-- 
2.56.0

