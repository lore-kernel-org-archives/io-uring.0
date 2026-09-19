Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C403345EA3
	for <io-uring@vger.kernel.org>; Sat, 19 Sep 2026 22:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856249; cv=none; b=dudHXbOGaOYrXNyvQE7ZE1BktmFkwIMbNWU8kmpKonDz46N90g+u44aGISU/jPLIzK9qCb04C5ISVejp6cYOfqMlz7w0nB90mhF1WIiJhIIMcjZfZFnFj9yxLmVIc5rl7LWLU5ihA6IKLgR+iyybbdc0kzbrX5oh57hEL+x4j4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856249; c=relaxed/simple;
	bh=QyHI2b8vUjfsZshB7ZA4R+b8UOgMbtTR6vWVwk9K8Bw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jxl60+x59GEqrpnBZRHfxpLgD8wn2pbU3bRLdwfeR/oNeebIjQRvPp5dEk1ZtCkDPvi/7+QbrP5fzl+b2PYfdOO8uA6kiIocgVVNA/b+WGRkyOVsESqKDvJTwykdfUVl5A1hBkCzF58WplimwbtwTupNFIQtrhFtNjFJ5k5hrN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TrVWu2kK; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TrVWu2kK"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fdc579daso21129155ad.1
        for <io-uring@vger.kernel.org>; Sat, 19 Sep 2026 15:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789856247; x=1790461047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gTQzb9hcxrg8y0CPqmDSwjH9nAbj97Ik48As79CZ6M8=;
        b=TrVWu2kKo2NNhxx0yPNCs1SsW40TgKofnczlS4AvhnAuQ6XLY77/CsQmJjSrw2p7OB
         Yu/dVZPrTR5rInpogl9c/toHhuPXcQ5mqEtx4a4Tu/wa0YZH9NqZJ7XyW88Mo/i/31Sd
         tlhvkvNmBlRdyRskAlif0tbEl6BYqBnax8r6onBPsFRuqNZJ9hUURecbHQFFsUXELgbQ
         jCg4lJByxk1PzWK8CPzIHehQRCY1lsxdDoxUwaI/Y6+DCcbbIEWVY/Rr6tzmiKg1FeZ9
         Raki0blG7VQNbASkSY6NUTzuW1BYZHOgk/g/MpBWmfTNi062qc9gghmS/OzIYdjf9QuD
         d4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789856247; x=1790461047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gTQzb9hcxrg8y0CPqmDSwjH9nAbj97Ik48As79CZ6M8=;
        b=FX/H2cWHtw/9Q0uBBNTBqoNP26gxjHTYEDXKCq3cWRXfvpyCZl8oGa25sAkyYH07uH
         qvGmbgBNUw1lxMO6wZDN6abV+4c9H8+Cz/x/3T/KunfFa+0FjvMklM4YV6VlTKpP4v00
         TYL5NyIl5w5n8jHtpjJdMxCieKp2XvoWgRH3BwmQb3zNgX2YUl+1Rb6QoGtRWCHRJwOW
         LZSlpXiuFtPEr+Yq09vYMBMZgdvfFPf0t8e+8sHgtYAttxdv5vscHLVvU5/I48qoOYHc
         EF3UrD4in4iU4L5h7zvUnoz0N5qUbdLOcj2MVKfCKfaKOcpCptrXncVe5W2qqoTPDr8o
         5KaA==
X-Gm-Message-State: AFuF++n+ENGWQ60/G01M+kyKUmk00bLdEUEm1Ey7CTzaCs5qC/tdI87h
	8GpcZQPpoXz4LUyeDmEtZZZnnaJyqx9hjx9kpcuXGwlNUCWJpfa5mYCC
X-Gm-Gg: AYBFou0Ub29Tg73Z59dmvSF9g8DObfI2wZJN8VgmWRAoVZsXtiCuVLIC8TCn0rel4Yf
	tu6niPbv52AJyaSEmwqN0b/jlRfN1UpTqw4RPNpaZoQqOl0z7nNiaGaOo3Jj+l4pgwUI7/4hx3B
	iuaT0mpVNCM9zcf6WfzY1i9KGnQQTcmOT0gcANU1jE98n9jUhFXvOgfMKq0jS0Mf+N0rUIE2D8V
	1W3wJGeAyV5kyjPB+CdIQ0zqlV3CjYr094S2YbowslVxlDPo5jM3e+FMcqR3+uN5bhPfjNjEh/v
	MFtXv/NM6W7HAXLNAQGo9O4soYe5ka+yyVE+BwVUGBuJol/H6fgDGn+vaTV7YSRwtfS54KLeoka
	Cfn4VxITuZXD341N7s2jfM9J2P3VbGMTs9MtRl4u9+aTWfJLl8wR9VclgjCfILfZ74Xi7O7XCq8
	6a+qFLWKOkEQQtm+WEj47WikcnCn/aBhbAj4utFd+22eIToZs0iC2gMn2KUi2kCCN84wjOBe5S6
	ZnCHyormkcuA0pb/Mv/sAdjkCwgpO89vsFbrpE7q45JRRdyrrWjVPA3TTldFE1VKAJYYFzePaKL
	1ynFbAmaLQ==
X-Received: by 2002:a17:90a:6090:b0:39e:6d82:dca with SMTP id 98e67ed59e1d1-39e6d822139mr3123163a91.30.1789856247537;
        Sat, 19 Sep 2026 15:17:27 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c615f05sm6424373a91.15.2026.09.19.15.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:17:26 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] io_uring: fix cloned compound buffer accounting and R_DISABLED restriction bypass
Date: Sat, 19 Sep 2026 22:17:25 +0000
Message-ID: <20260919221725.3706704-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix two issues in io_uring buffer registration and restriction
enforcement:

1. In io_uring/rsrc.c, when registered compound buffers are cloned
   across rings via IORING_REGISTER_BUFFERS2 /
   IORING_RSRC_REGISTER_SPARSE, unaccounting on release can underflow
   mm->pinned_vm and user->locked_vm if head pages are unaccounted
   multiple times or against a different accounting context. Track per-
   imu accounting ownership cleanly.
2. In io_uring/register.c, enforce IO_RING_F_REG_RESTRICTED on rings
   created with IORING_SETUP_R_DISABLED so restricted opcodes cannot be
   invoked before restrictions are registered and enabled.

Fixes: 735729844819 ("io_uring: move rsrc related data, core, and commands")
Fixes: c43203154d8a ("io_uring/register: move io_uring_register(2) related code to register.c")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/io_uring/register.c b/io_uring/register.c
index 02bc103bcc9d..ad6f2a3c98a0 100644
--- a/io_uring/register.c
+++ b/io_uring/register.c
@@ -764,7 +764,7 @@ static int __io_uring_register(struct io_ring_ctx *ctx, unsigned opcode,
 	if (ctx->submitter_task && ctx->submitter_task != current)
 		return -EEXIST;
 
-	if ((ctx->int_flags & IO_RING_F_REG_RESTRICTED) && !(ctx->flags & IORING_SETUP_R_DISABLED)) {
+	if (ctx->int_flags & IO_RING_F_REG_RESTRICTED) {
 		opcode = array_index_nospec(opcode, IORING_REGISTER_LAST);
 		if (!test_bit(opcode, ctx->restrictions.register_op))
 			return -EACCES;
diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 51b46e624ddd..1efaf29514e8 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -174,8 +174,8 @@ static void io_free_imu(struct io_ring_ctx *ctx, struct io_mapped_ubuf *imu)
 		kvfree(imu);
 }
 
-static unsigned long io_buffer_unaccount_pages(struct io_ring_ctx *ctx,
-					       struct io_mapped_ubuf *imu)
+static unsigned long io_imu_unaccount_hpages(struct io_ring_ctx *ctx,
+					     struct io_mapped_ubuf *imu)
 {
 	struct page *seen = NULL;
 	unsigned long acct = 0;
@@ -188,17 +188,14 @@ static unsigned long io_buffer_unaccount_pages(struct io_ring_ctx *ctx,
 		struct page *page = imu->bvec[i].bv_page;
 		struct page *hpage;
 
-		if (!PageCompound(page)) {
-			acct++;
+		if (!PageCompound(page))
 			continue;
-		}
 
 		hpage = compound_head(page);
 		if (hpage == seen)
 			continue;
 		seen = hpage;
 
-		/* Unaccount on last reference */
 		if (hpage_acct_unref(ctx, hpage))
 			acct += page_size(hpage) >> PAGE_SHIFT;
 		cond_resched();
@@ -207,18 +204,38 @@ static unsigned long io_buffer_unaccount_pages(struct io_ring_ctx *ctx,
 	return acct;
 }
 
+static unsigned long io_imu_unaccount_reg_pages(struct io_ring_ctx *ctx,
+						struct io_mapped_ubuf *imu)
+{
+	unsigned long acct = 0;
+	int i;
+
+	if (imu->flags & IO_REGBUF_F_KBUF || !ctx->user)
+		return 0;
+
+	for (i = 0; i < imu->nr_bvecs; i++) {
+		if (!PageCompound(imu->bvec[i].bv_page))
+			acct++;
+	}
+	return acct;
+}
+
 static void io_buffer_unmap(struct io_ring_ctx *ctx, struct io_mapped_ubuf *imu)
 {
-	unsigned long acct_pages = 0;
+	unsigned long acct_pages;
 
-	/* Always decrement, so it works for cloned buffers too */
-	acct_pages = io_buffer_unaccount_pages(ctx, imu);
+	/* Compound hpages are accounted per-ring in ctx->hpage_acct */
+	acct_pages = io_imu_unaccount_hpages(ctx, imu);
 
 	if (unlikely(refcount_read(&imu->refs) > 1)) {
-		if (!refcount_dec_and_test(&imu->refs))
+		if (!refcount_dec_and_test(&imu->refs)) {
+			if (acct_pages)
+				io_unaccount_mem(ctx->user, ctx->mm_account, acct_pages);
 			return;
+		}
 	}
 
+	acct_pages += io_imu_unaccount_reg_pages(ctx, imu);
 	if (acct_pages)
 		io_unaccount_mem(ctx->user, ctx->mm_account, acct_pages);
 	imu->release(imu->priv);
@@ -1280,6 +1297,7 @@ static int io_buffer_acct_cloned_hpages(struct io_ring_ctx *ctx,
 					struct io_mapped_ubuf *imu)
 {
 	struct page *seen = NULL;
+	unsigned long acct = 0;
 	int i, ret = 0;
 
 	if (imu->flags & IO_REGBUF_F_KBUF || !ctx->user)
@@ -1302,10 +1320,14 @@ static int io_buffer_acct_cloned_hpages(struct io_ring_ctx *ctx,
 		ret = hpage_acct_ref(ctx, hpage, &acct_new);
 		if (ret)
 			break;
+		if (acct_new)
+			acct += page_size(hpage) >> PAGE_SHIFT;
 
 		cond_resched();
 	}
 
+	if (!ret && acct)
+		ret = io_account_mem(ctx->user, ctx->mm_account, acct);
 	if (!ret)
 		return 0;
 
