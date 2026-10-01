Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAED44F568
	for <io-uring@vger.kernel.org>; Thu,  1 Oct 2026 18:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790878685; cv=none; b=d8pz3yx6LBgbvALv0ffVoScyu9h1vB/cfuUudZpNy745bfw7YpeV38BB9APmTfDOMNZYr6CjGox35UIPB+B3OQx2ljEHB/Ci1rl47X0dcLdR8lKzARiIivpka6ErSEXGqN/jY3a6XqoAOP7YTFp57JUGZmCLENSELFToCQpCli8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790878685; c=relaxed/simple;
	bh=5AHMPmmEwdWU3+2RCfEqMVR/KW3uaMf08XqHdg9GDW4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MAlTeGj1YPLUpBH/iAJzpNcN4Vh6g6o2sjiw1y1f2vSpnYb6E4thC7vIfEkJGf3d11Q0pN2K/UVWF0/M2lMxSZuqO34l0vvhj6mPnRwN/mh/ESTrxNgzNZVXNmY5n0MN8Mpn+XEJ5ydp5J1kp8Bspq77Ebso25F8eGxlirNW/Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20251104.gappssmtp.com header.i=@davidwei-uk.20251104.gappssmtp.com header.b=b7kboPYd; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20251104.gappssmtp.com header.i=@davidwei-uk.20251104.gappssmtp.com header.b="b7kboPYd"
Received: by mail-oo2-f42.google.com with SMTP id 006d021491bc7-6d83e2833feso1848781eaf.0
        for <io-uring@vger.kernel.org>; Thu, 01 Oct 2026 11:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20251104.gappssmtp.com; s=20251104; t=1790878678; x=1791483478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YXDRIzgBcAzhSJXuyWaLo5SBGl040tKZEAQRjTlvouk=;
        b=b7kboPYdnkf0qjOswNkEulxJjQ61+gxaBR5Hxg3df5OSq/PUa6xUEBGMRjAEjsDc3F
         i732eJ75XabZfwjgtN35ypEi4G3ytjHXfLuvln0X97NN1H93uHhpvpyDOGbmdLetYWsf
         czhk2i7nZK2msyJ/8DIFYzrPxd0EM7GCQTSEYvzCJxnLwLifjFiPR7gAyo8J4NBs4yIh
         BSaqq+WvMU0Av5o1v6wgtn/6hmvsOuok62ii/AdYX3PkieW7tJq1BAVorzts92Qv4Dyj
         F3BHRdqS1u/MUamwFZdjDTVzvHniOhH1Rnnn93maonzDYQKtKkxMLyQoHkMNdt1bmrbB
         +mtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790878678; x=1791483478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YXDRIzgBcAzhSJXuyWaLo5SBGl040tKZEAQRjTlvouk=;
        b=2XYUrVymy13YkOazJ7lBEldkquQHee5R62bMpjzBEY18V6Zf3IVx/OyWVMRrIFciIV
         ur9KfbiNaVLVhhkRbH6EgvXwQhQ3xOUgv1kVO2YGM2OaBeRHeb7G8XGZylrOmXksL3TL
         Cd5ekVxUfU8B5pumBsydmeIfKBrEl/2VbjuGP6lPYpRpWJXhfjvoSdwhsFWNoKw4c71F
         bSNnkWhQBG+g41pYxwJ+1EiZKDDFf+enqLh5jYRjFw0n02Nui0jC1j2jJu244PEO6hk4
         S4o1Zp/bkwyklMA9Zi5vsbdlR2L5mSejosdQXeTwvjBrVmz8bs0/Z/RlvhGBcW6nxE++
         9+5g==
X-Gm-Message-State: AFuF++ncHCB+Nw/qcRHBnkCp/VBxLL0w7RiKmfu94uBd9PIbawEXBkVS
	yLT/KzNhxC2XqGQlYebnWbK1O5j+eeP+a3uZ6MGxysEj/ffUuDkvETHcz5quRc3kx7SgZE+WQrC
	AX/RF
X-Gm-Gg: AYBFou3tbFmyhIor/vf+Zz3PlxTRohuJX6UtawTv9AOO242ojitatR1YQ6tp0jZfNmF
	K3l72VFQg8qtL+ZGZnHFOjgL6TX0jWei5kay6/bncUFZqI6VdFRLEsAzFdxU1K9j+80gngfYii7
	yY2gSwiMD8yWocMDFMazzwiVrxSkt+/2tfazWxaCj6AC7mexK9JpjkAbzhfz6RsIyd5+YeuA/rr
	g5XJMblCzc8qSkWGX6/IK106sbqIFVkf1wn02v05y7KFnsqfAIRyoQqIaH+RXOgFhrzOeIWGH6C
	xTseTOgmFykuxKFTGsgtLIZVVKlrKa1C2jyBi4iBjIzWAcunI+o3UzEfS2iWnWEbDzi1HtW58IT
	0KhmjDm4xxnv2JCecYn8P4PzPmuliW1nDlYFR28sbhXzz/wNiEuFXOHm7Te955rDcy4LrjhsNCI
	BiJiwrgjq+h1RDp8hPaLRcAxTOiKavY1zrMCXhKRy71+j72vhl80krULbEhHjqgRUMU7DdREQwo
	R8LJslMLXuDm1ye
X-Received: by 2002:a05:6820:80c4:b0:6d7:3613:de8a with SMTP id 006d021491bc7-6df35751a14mr136110eaf.74.1790878678030;
        Thu, 01 Oct 2026 11:17:58 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:3::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6df3ada56ddsm106013eaf.8.2026.10.01.11.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 11:17:57 -0700 (PDT)
From: David Wei <dw@davidwei.uk>
To: io-uring@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>,
	Pavel Begunkov <asml.silence@gmail.com>
Subject: [PATCH] io_uring/memmap: fix non-compound alloc fallback with memcg accounting
Date: Thu,  1 Oct 2026 11:17:52 -0700
Message-ID: <20261001181752.537767-1-dw@davidwei.uk>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

io_region_allocate_pages() first tries io_mem_alloc_compound(). If that
fails, it uses alloc_pages_bulk_node() to allocate separate pages.

The bulk allocator does not support memcg accounting. __GFP_ACCOUNT is
unconditionally supplied, so when memcg_kmem_online() is true, it only
allocates one page. For a multi-page request, io_uring treats this short
result as failure and returns ENOMEM, even when the memcg has enough
space for all pages.

When this happens, fill the rest of the request with order 0 allocations
via alloc_page(), which support memcg accounting. This maintains the
existing fast path, while fixing the incorrect ENOMEM return when memcg
is used.

Signed-off-by: David Wei <dw@davidwei.uk>
---
 io_uring/memmap.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/io_uring/memmap.c b/io_uring/memmap.c
index cb3db32e8255..cc8ac129a0c7 100644
--- a/io_uring/memmap.c
+++ b/io_uring/memmap.c
@@ -183,6 +183,7 @@ static int io_region_allocate_pages(struct io_mapped_region *mr,
 	size_t size = io_region_size(mr);
 	unsigned long nr_allocated;
 	struct page **pages;
+	struct page *page;
 
 	pages = kvmalloc_objs(*pages, mr->nr_pages, gfp);
 	if (!pages)
@@ -195,6 +196,13 @@ static int io_region_allocate_pages(struct io_mapped_region *mr,
 
 	nr_allocated = alloc_pages_bulk_node(gfp, NUMA_NO_NODE,
 					     mr->nr_pages, pages);
+	while (nr_allocated < mr->nr_pages) {
+		page = alloc_page(gfp);
+		if (!page)
+			break;
+
+		pages[nr_allocated++] = page;
+	}
 	if (nr_allocated != mr->nr_pages) {
 		if (nr_allocated)
 			release_pages(pages, nr_allocated);
-- 
2.53.0-Meta

