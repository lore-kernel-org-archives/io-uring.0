Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44714A261C
	for <io-uring@vger.kernel.org>; Mon,  5 Oct 2026 14:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210014; cv=none; b=gRsU+Y8Les9n7Pu2tuNYR0y0n2XN72jltn5NfVsmv0Xvg4731kFO1V5rsvYfXeew+7nMT/1GTiUZB2u/LIgl+RUgp72tJUOzxu3AlcrdfYuXd6ESkVjvE67UFyKSL3huebeKBr8dbcJI4uGAk8ykH2PwrCkdlTiHfrzCKZ9pDKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210014; c=relaxed/simple;
	bh=hqPCO8CNUXXNav4lb+uFHMizA6fyG5Azb1ZRtgogUMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h8HxIjwkIVECnc757eX1apsjqa1lBaCXcGIjhwinC+wJbAmufC/uZJIWWwTQz7AT824IReclR6STpgQpibabaLeJnb885SWdh1TvpUntUH6PGUvQ1V8HzgRHfo2tgKkTrnWZqY8bmj2cjjJxN9oT7Ez33v3FxXuVfL5pBtDY6AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jS5oPksA; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jS5oPksA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=x4HRbrc9sy9dLVgS7GxQf/Q5J1ocSb2Br6O1GE27A+g=; b=jS5oPksAzKT4lOtc516633QmWr
	pW7D86XGifiH2UzC4W3GoZSGN9AavYrX61Al7ZXphY8n7PJ3sgUSo3QR53vfLxNAbFl/uKvFBjbrO
	/JzjwcKjXPkQZawxO9L0vKE7TxKTsJ3dRM36v86ZH+kYmGJpkgm62UisvfU4Ob+XG28u3Z6NRhZdj
	qfgbYD4aVRv13+S5H50YJ6IAk1NXb8faejnUM/kzqw+oPRuDLq+IOc5iQLCE0qM11ICsFHC+E+EZk
	k59ghBpkhjA4lut+GDdyxEevpIa0xIcAaouKokWmCQK4YPgT4XjN2Nk0MFwH3T/eJI3QLv+Z0p9XT
	Vnm5wqAg==;
Received: from 2a02-8389-2301-9f00-88fd-fcdd-06aa-821c.cable.dynamic.v6.surfer.at ([2a02:8389:2301:9f00:88fd:fcdd:6aa:821c] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDjXs-0000000Gce1-3FiU;
	Mon, 05 Oct 2026 14:20:01 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Anuj Gupta <anuj20.g@samsung.com>,
	io-uring@vger.kernel.org
Subject: [PATCH 1/2] io_uring: cleanup __io_prep_rw
Date: Mon,  5 Oct 2026 16:19:43 +0200
Message-ID: <20261005141954.1353351-2-hch@lst.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005141954.1353351-1-hch@lst.de>
References: <20261005141954.1353351-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Switch on attr_type_mask once, and also do away with the local variable
for attr_ptr.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 io_uring/rw.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/io_uring/rw.c b/io_uring/rw.c
index 95106dd1d7eb..9fb4844c79ab 100644
--- a/io_uring/rw.c
+++ b/io_uring/rw.c
@@ -248,7 +248,6 @@ static int __io_prep_rw(struct io_kiocb *req, const struct io_uring_sqe *sqe,
 	struct io_rw *rw = io_kiocb_to_cmd(req, struct io_rw);
 	struct io_async_rw *io;
 	unsigned ioprio;
-	u64 attr_type_mask;
 	int ret;
 
 	if (io_rw_alloc_async(req))
@@ -281,19 +280,14 @@ static int __io_prep_rw(struct io_kiocb *req, const struct io_uring_sqe *sqe,
 	rw->addr = READ_ONCE(sqe->addr);
 	rw->len = READ_ONCE(sqe->len);
 	rw->flags = (__force rwf_t) READ_ONCE(sqe->rw_flags);
-
-	attr_type_mask = READ_ONCE(sqe->attr_type_mask);
-	if (attr_type_mask) {
-		u64 attr_ptr;
-
-		/* only PI attribute is supported currently */
-		if (attr_type_mask != IORING_RW_ATTR_FLAG_PI)
-			return -EINVAL;
-
-		attr_ptr = READ_ONCE(sqe->attr_ptr);
-		return io_prep_rw_pi(req, rw, ddir, attr_ptr);
+	switch (READ_ONCE(sqe->attr_type_mask)) {
+	case 0:
+		return 0;
+	case IORING_RW_ATTR_FLAG_PI:
+		return io_prep_rw_pi(req, rw, ddir, READ_ONCE(sqe->attr_ptr));
+	default:
+		return -EINVAL;
 	}
-	return 0;
 }
 
 static int io_rw_do_import(struct io_kiocb *req, int ddir)
-- 
2.53.0

