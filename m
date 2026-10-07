Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C800C3CE4B1
	for <io-uring@vger.kernel.org>; Wed,  7 Oct 2026 21:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791409150; cv=none; b=T5wogNg+Ui9QrCo6FdPFKb6MricNbUQb6x+qcaKpBom1EYy2DgnrFB9u46KTuW9R8z2/tmsa8hiTXEcosBcDHA261ZeEqtk3R1xdo15g4vHZT1WMetEt4a9tRXo5jqiXHCjjsUI5+1HlsalSYrVfAD6v3b6boOLZrMX+2fqevMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791409150; c=relaxed/simple;
	bh=PGxj3PcXRTC6PKZObU1N0HHRBEeb+XMGZQcgzZ3Cm/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KjLRRRZXY4tQhlfBzjY5Y+75+Nhy12/ZVq0tJNNDYgP+wJO07YH/ZHNgeKYLXnQ81SiOU+rdhXa08RonvbyjZRCaoCpPJLv8KxL3P8oWN+55DcKHXQODGX7TcAlvO9RGCbROryg/wVXuyNAPJUV/dOi6fih/qwtHpTdm2UtxbtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=Vu0R9wE6; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="Vu0R9wE6"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33c2520ad38so5466891eec.1
        for <io-uring@vger.kernel.org>; Wed, 07 Oct 2026 14:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1791409148; x=1792013948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f4xb41+M06iKdIhJO3ThF+5rJy6ZHkIjUhqFx6lzvJc=;
        b=Vu0R9wE6P4370pNp254bQqQqaEVsnoNVzwFhEVk9il11ZP0l75EqQxHZQc8wvzHbEM
         ewZalcWQzdCiUYvBG+WwT6R0yWVUPKyt1DfVwL4LmcxMkdo3Jt1XrLZBPdxF4Ffio2Y5
         0aJJOHZKxLNUCOjDsw9pFPrWvDkkecsSE5LhFQbVkPOz8+8owgmJlTDDqiP1AggP3S1/
         awKsq5thjwb+uEZ0JcNMSJRG0BXCESznDalOkjTYOStA1Sqj/ftN9fLZb1hVgs/J0TgZ
         Njq/ZdJwH0Yinso/CwfNRI941eP181CKdCeOAD8drOdnkkLGXYxcpPDSUOfz/m3lrK00
         Nkwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791409148; x=1792013948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f4xb41+M06iKdIhJO3ThF+5rJy6ZHkIjUhqFx6lzvJc=;
        b=YYDZrfX2k1Vr4md+oZ8bJFFsT7sgoeTK8ng/h195OOhb8AwCvogynl5+INFyPOiELu
         jAI9cY+7gBSgiN2y4Gx0a0grviAonFW2d7AkmZgkJFiuM8X2uZ2zcfNRbbAZFqIFkTPT
         RV09MRNUgzSg0S3U9A8+Ynv1mZCLOnKgIZ9FHbGQ5CbtxkFzwnspCjcTmKJUcKLH3KWs
         hnhO6wLreSqgf4MX9Y6Ayea9STqR1Bt3a77wfq8G6MdX+XToW39//sz4h9puEykBrWCL
         U2unG05Vic2PPCHambbWNRdAhgvko/ATSF3Y//Uhw2iVlz3nE5e3tbYo1fzqzW1X8Zmd
         tUWQ==
X-Gm-Message-State: AFuF++nlcsnkdr3PBiujWClmhAnFB6UDlkcETs27B7bFUsULQhEXbMrn
	C7hWZPMN8am+3ts+8AYmyNVloeeoBEhMfEs4lEUvHemrQoVElhFox1sJVDCOAdTB61FhCcNs6Od
	8536TN1Q=
X-Gm-Gg: AYBFou1+2QKDgzSXs9tyUN8u/s3E695UzaLQr8BgrcpiSM9xVBTpkvBW1Aju1IpS2Rb
	E270m8M62o4b5z4gNCCbNn2oIYkI/6T9254JQI9hgOnPAJd3rIRZM3bLDiMzk0Z5r21y0d5Qpht
	fE++zsJAn1ssY8qjoYQsAr+bebQblCelhCGmTVTTAK2FH361SUWjGWOGDz5NqYK/9DAcLUnOl0b
	/QINmAbwpuCvbYPk+I3QKvQA7JTylE6V+vCwxR9ST8exxztU+5ukrdz/2DtxR+q7Nw1qT9Issfg
	vYOzh7MA5z1PebScCedixierF/O0IYyRZdXZwDtXco1qDST6JWcJMSxVRVUdOsdxhCU6LdIWZ1O
	RD+yQnxSDPF7GkUJd3pfUn4FYDwzoPLCqcb8KfzradkXQW/v6zx3ynzlmfUE4Rvg4TO1FtbxIzP
	nSYM0YgEoDgzHvi4ylO7dIBkAsjj4dgVZ2Pp4YcO4Qjm1UlAeoFy6qeAykVfES5sG6hl+bY0/IU
	RFqP9svn7qXliOPx9YbZoReNM2QPrJ0NYVj60/SJKrP
X-Received: by 2002:a05:7022:c88:b0:15b:7f7a:730d with SMTP id a92af1059eb24-1620665f5e0mr3282712c88.28.1791409147307;
        Wed, 07 Oct 2026 14:39:07 -0700 (PDT)
Received: from xps16 ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1616602b33asm8788217c88.3.2026.10.07.14.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 14:39:06 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: dw@davidwei.uk,
	hengyul@cs.unc.edu,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 1/2] Revert "io_uring/memmap: account the pages a compound region really uses"
Date: Wed,  7 Oct 2026 15:38:56 -0600
Message-ID: <20261007213903.445430-2-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007213903.445430-1-axboe@kernel.dk>
References: <20261007213903.445430-1-axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit f12f0234cc14886bcfd53ffb7c8df4216dad51f1.

The next patch stops charging kernel allocated regions to RLIMIT_MEMLOCK
altogether, which leaves nothing for this to account. Revert it first so
that fix applies cleanly to the stable trees that need it, none of which
have this commit.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/memmap.c | 37 +++++++------------------------------
 1 file changed, 7 insertions(+), 30 deletions(-)

diff --git a/io_uring/memmap.c b/io_uring/memmap.c
index 48c0eb012412..23e8a85111bc 100644
--- a/io_uring/memmap.c
+++ b/io_uring/memmap.c
@@ -16,10 +16,8 @@
 #include "zcrx.h"
 
 static bool io_mem_alloc_compound(struct page **pages, int nr_pages,
-				  size_t size, gfp_t gfp,
-				  struct user_struct *user)
+				  size_t size, gfp_t gfp)
 {
-	unsigned long nr_compound, extra;
 	struct page *page;
 	int i, order;
 
@@ -29,22 +27,9 @@ static bool io_mem_alloc_compound(struct page **pages, int nr_pages,
 	else if (order)
 		gfp |= __GFP_COMP;
 
-	/*
-	 * get_order() rounds a non power of two size up, so the allocation
-	 * can hold more pages than the region exposes. Account those too,
-	 * and leave the compound allocation alone if they do not fit.
-	 */
-	nr_compound = 1UL << order;
-	extra = nr_compound - nr_pages;
-	if (extra && user && __io_account_mem(user, extra))
-		return false;
-
 	page = alloc_pages(gfp, order);
-	if (!page) {
-		if (extra && user)
-			__io_unaccount_mem(user, extra);
+	if (!page)
 		return false;
-	}
 
 	for (i = 0; i < nr_pages; i++)
 		pages[i] = page + i;
@@ -120,15 +105,8 @@ void io_free_region(struct user_struct *user, struct io_mapped_region *mr)
 	}
 	if ((mr->flags & IO_REGION_F_VMAP) && mr->ptr)
 		vunmap(mr->ptr);
-	if (mr->nr_pages && user) {
-		unsigned long nr_accounted = mr->nr_pages;
-
-		/* a compound region was accounted for the whole allocation */
-		if (mr->flags & IO_REGION_F_SINGLE_REF)
-			nr_accounted = 1UL << get_order(io_region_size(mr));
-
-		__io_unaccount_mem(user, nr_accounted);
-	}
+	if (mr->nr_pages && user)
+		__io_unaccount_mem(user, mr->nr_pages);
 
 	memset(mr, 0, sizeof(*mr));
 }
@@ -173,8 +151,7 @@ static int io_region_pin_pages(struct io_mapped_region *mr,
 
 static int io_region_allocate_pages(struct io_mapped_region *mr,
 				    struct io_uring_region_desc *reg,
-				    unsigned long mmap_offset,
-				    struct user_struct *user)
+				    unsigned long mmap_offset)
 {
 	gfp_t gfp = GFP_KERNEL_ACCOUNT | __GFP_ZERO | __GFP_NOWARN;
 	size_t size = io_region_size(mr);
@@ -185,7 +162,7 @@ static int io_region_allocate_pages(struct io_mapped_region *mr,
 	if (!pages)
 		return -ENOMEM;
 
-	if (io_mem_alloc_compound(pages, mr->nr_pages, size, gfp, user)) {
+	if (io_mem_alloc_compound(pages, mr->nr_pages, size, gfp)) {
 		mr->flags |= IO_REGION_F_SINGLE_REF;
 		goto done;
 	}
@@ -240,7 +217,7 @@ int io_create_region(struct io_ring_ctx *ctx, struct io_mapped_region *mr,
 	if (reg->flags & IORING_MEM_REGION_TYPE_USER)
 		ret = io_region_pin_pages(mr, reg);
 	else
-		ret = io_region_allocate_pages(mr, reg, mmap_offset, ctx->user);
+		ret = io_region_allocate_pages(mr, reg, mmap_offset);
 	if (ret)
 		goto out_free;
 
-- 
2.55.0

