Received: from sender-of-o58.zoho.eu (sender-of-o58.zoho.eu [136.143.169.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2A148A8C4;
	Thu,  6 Aug 2026 18:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786039280; cv=pass; b=fofDBrKSyQqsbDOIDhFD0wZ1wL/Bbvybytms02d6f6WCTZW5yAf/nx1bcsP1NtgtVaB2szhg4IOmrNQOnObRPu9v09+T33Vn1qhFF6w88j+Obe+AzItcU2I+6DuZ52cGB+Os5kUTgn0rgmsiimQ0uXR3whvvJSs/xzVuvPNItk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786039280; c=relaxed/simple;
	bh=w4TIQOMm/m2960zS/tgrb61w8lwN9Ja3mP6sJl+IAiw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gMHbYe3ipj3Vmrs47KCx533WIDor1eCYn9n4hFtfMuVPsQ1MaXMs0LrefWTiks0eJr5vTQ27KVWgodYV6xduT9Y91I2mpwgTJgtl7WSZo/rwCpCcSqq7Yv2o5ZPtg26Ma7pZ/ZGK+dkmucnTj0sRbn7rKoYYnu4dBcUCfkBQVsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com; spf=pass smtp.mailfrom=iusegentoo.com; dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b=PS0jq7fJ; arc=pass smtp.client-ip=136.143.169.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b="PS0jq7fJ"
ARC-Seal: i=1; a=rsa-sha256; t=1786039260; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=L2AxDPqTuIG3GpLwjvEq/vVg6YgsZ4mJzjqgdhTf1vDFeJ5fElobu6aFHXbuQSFFNRajlatwE4Oqwb3fXgxxJ845FaW0G5rJ+iOupuF706PmCA6ZCBxn7txEl5VaOs4XWRtaLhm+T+orojTaZh+v3TKb7YdAvKiqgu35edgLC3I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1786039260; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WBzwNTm9c1OpNICH1sUhixZBgvtgyNYM2g+UVaR4ULs=; 
	b=j01WJFBD3OAm7om7Wx1r+DdMLHvPSA015XmVgNI38RHEVfQeWENkIREsRWsK9W2dXWSpBP/OX9x5N3XyUXKJ4M11FFE+g8MpcNx8HsHUEmw7+icjnsB1GBXK2MnS4S6+rRncaFrOwf7mDMtF/MuQ6hgtiYzW2QSZM3CNMdVMgn4=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iusegentoo.com;
	spf=pass  smtp.mailfrom=ali@iusegentoo.com;
	dmarc=pass header.from=<ali@iusegentoo.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786039260;
	s=zmail; d=iusegentoo.com; i=ali@iusegentoo.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=WBzwNTm9c1OpNICH1sUhixZBgvtgyNYM2g+UVaR4ULs=;
	b=PS0jq7fJqz2MTWQiMqO2as0sVNDyH9XPLsI73aoWuFFVnwV47/0cH2AuxVSdwrKJ
	T969K7ym01ADh5Qo5yAwv1HNihEE3MpjVnE3EanBfPmUQ9cbXZMd+4EU1cIBps78kFa
	H75iV+vEfhgjYk+dAR/5BwKqiunM//PKcSw2DiQk=
Received: by mx.zoho.eu with SMTPS id 1786039259078571.1061716281904;
	Thu, 6 Aug 2026 20:00:59 +0200 (CEST)
From: Ali Ahmet Memis <ali@iusegentoo.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	Gabriel Krisman Bertazi <krisman@suse.de>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] io_uring/memmap: account the pages a compound region really uses
Date: Thu,  6 Aug 2026 18:00:44 +0000
Message-ID: <20260806180044.275543-1-ali@iusegentoo.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

io_mem_alloc_compound() allocates get_order(size) pages, which rounds a
region size that is not a power of two up to the next order. The pages
past the region are part of the same allocation and cannot be used for
anything else, but io_create_region() accounts reg->size >> PAGE_SHIFT,
so they are never charged against RLIMIT_MEMLOCK. For a ring with 4096
SQ entries and the default CQ size the region is 37 pages while the
allocation is 64.

Account the tail pages together with the region, and fall back to the
exact sized bulk allocation when they do not fit the limit, so a user
close to their limit still gets the region rather than an error.
io_free_region() gives the same amount back, the compound case being the
one that set IO_REGION_F_SINGLE_REF.

Counting how many 4096 entry rings an unprivileged user can create under
a given RLIMIT_MEMLOCK, before and after:

	limit (pages)	before	after
	256		2	2
	300		2	2
	350		3	2
	400		3	3
	512		5	4

Five rings under a 512 page limit really pin 640 pages.

Fixes: dfbbfbf19187 ("io_uring: introduce concept of memory regions")
Link: https://lore.kernel.org/all/87ik5ncj8d.fsf@mailhost.krisman.be/
Signed-off-by: Ali Ahmet Memis <ali@iusegentoo.com>
---
The numbers above come from a VM booting this kernel with and without the
patch, creating rings as an unprivileged uid, a fresh one per round so the
per user counter does not carry over. ctx->user is only taken when the
caller lacks CAP_IPC_LOCK, so a root only test would have measured nothing.

The fallback means a region can end up as a bulk allocation where it used
to be compound, once a user is close to their limit. That costs the single
folio and the page_address() shortcut in io_region_init_ptr() for that
region, which seemed better than failing the ring outright. Say the word if
you would rather have it fail.

 io_uring/memmap.c | 37 ++++++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/io_uring/memmap.c b/io_uring/memmap.c
index 23e8a85111bc..48c0eb012412 100644
--- a/io_uring/memmap.c
+++ b/io_uring/memmap.c
@@ -16,8 +16,10 @@
 #include "zcrx.h"
 
 static bool io_mem_alloc_compound(struct page **pages, int nr_pages,
-				  size_t size, gfp_t gfp)
+				  size_t size, gfp_t gfp,
+				  struct user_struct *user)
 {
+	unsigned long nr_compound, extra;
 	struct page *page;
 	int i, order;
 
@@ -27,9 +29,22 @@ static bool io_mem_alloc_compound(struct page **pages, int nr_pages,
 	else if (order)
 		gfp |= __GFP_COMP;
 
+	/*
+	 * get_order() rounds a non power of two size up, so the allocation
+	 * can hold more pages than the region exposes. Account those too,
+	 * and leave the compound allocation alone if they do not fit.
+	 */
+	nr_compound = 1UL << order;
+	extra = nr_compound - nr_pages;
+	if (extra && user && __io_account_mem(user, extra))
+		return false;
+
 	page = alloc_pages(gfp, order);
-	if (!page)
+	if (!page) {
+		if (extra && user)
+			__io_unaccount_mem(user, extra);
 		return false;
+	}
 
 	for (i = 0; i < nr_pages; i++)
 		pages[i] = page + i;
@@ -105,8 +120,15 @@ void io_free_region(struct user_struct *user, struct io_mapped_region *mr)
 	}
 	if ((mr->flags & IO_REGION_F_VMAP) && mr->ptr)
 		vunmap(mr->ptr);
-	if (mr->nr_pages && user)
-		__io_unaccount_mem(user, mr->nr_pages);
+	if (mr->nr_pages && user) {
+		unsigned long nr_accounted = mr->nr_pages;
+
+		/* a compound region was accounted for the whole allocation */
+		if (mr->flags & IO_REGION_F_SINGLE_REF)
+			nr_accounted = 1UL << get_order(io_region_size(mr));
+
+		__io_unaccount_mem(user, nr_accounted);
+	}
 
 	memset(mr, 0, sizeof(*mr));
 }
@@ -151,7 +173,8 @@ static int io_region_pin_pages(struct io_mapped_region *mr,
 
 static int io_region_allocate_pages(struct io_mapped_region *mr,
 				    struct io_uring_region_desc *reg,
-				    unsigned long mmap_offset)
+				    unsigned long mmap_offset,
+				    struct user_struct *user)
 {
 	gfp_t gfp = GFP_KERNEL_ACCOUNT | __GFP_ZERO | __GFP_NOWARN;
 	size_t size = io_region_size(mr);
@@ -162,7 +185,7 @@ static int io_region_allocate_pages(struct io_mapped_region *mr,
 	if (!pages)
 		return -ENOMEM;
 
-	if (io_mem_alloc_compound(pages, mr->nr_pages, size, gfp)) {
+	if (io_mem_alloc_compound(pages, mr->nr_pages, size, gfp, user)) {
 		mr->flags |= IO_REGION_F_SINGLE_REF;
 		goto done;
 	}
@@ -217,7 +240,7 @@ int io_create_region(struct io_ring_ctx *ctx, struct io_mapped_region *mr,
 	if (reg->flags & IORING_MEM_REGION_TYPE_USER)
 		ret = io_region_pin_pages(mr, reg);
 	else
-		ret = io_region_allocate_pages(mr, reg, mmap_offset);
+		ret = io_region_allocate_pages(mr, reg, mmap_offset, ctx->user);
 	if (ret)
 		goto out_free;
 

base-commit: 0d839570765118029aa8bf4a95444c6a11aacf85
-- 
2.55.0

