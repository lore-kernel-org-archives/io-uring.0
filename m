Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5114A207E
	for <io-uring@vger.kernel.org>; Mon,  5 Oct 2026 14:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210014; cv=none; b=tqFbOIGtxFvHbkSRa2c6FDbjPxgQDSqLMdbzdTXChtfRWOoqyDRXq+Dma0hupt6a8n49J7DzH+fmhoy0I1xSYQsaT3Gbu1cQjwcOhvKvgXLbJfBRnV287pie+gApCLSLjej4sMWW+598koaYiFAu6iBjjkjcIw5OHiOHZdrKrUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210014; c=relaxed/simple;
	bh=MLghEbycQlqqNZiQkMiHdhabp/U61Pc6ADCgzMGxoSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EbT6+3ssy9mHIzc5qPEIl1gW4AxXFANWqWTmRq9Dp4wBwdAl2jMMRQWeakrUoajGs0EP3nF1v2sx4ZDto7Yh8qU9/2m273PN+gUdrT3hiDYPe1E7BK+Jm7i5Ggqkw1Obeg4mfPx1o/vcyBizYc5U4ApsIUbQhBNX2OrkgfeVNQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=YpB8YH9e; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YpB8YH9e"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=9fv3l0a3zYEJ8VRnSYabofuSonew4FpL4r3iRNhDAtc=; b=YpB8YH9e8qpAd8v6hBvuCIyJ9b
	qr/aAjNxRPzwxfl87YawuVWaqQRL6Kx49sz0Z7soq4DeBnpR9l3lKsJ0Tm5w68JsGQL1JZH2jFc7W
	N3dXQ1mPdx7mFf0GMz3xKRAKsGKtqAhVYBVm5umZ57AZlNwF5H0jGR7amIiF9vzwW5Hexhyu+g+Cn
	k3HFF077h+l4uR9egvhy5XH9s5d35QPD/7BUG358lJH0zFx1y4PxbfjY99QceDKcxfD4tUUlUYeqE
	bgb4LGXVQD++EUTGmgSNU4N4KormdY8gelH7+T0gJHtFmIVo9tV2E3WKUdLWj7G3/kdg0/MsqLJIv
	VoFwMhOA==;
Received: from 2a02-8389-2301-9f00-88fd-fcdd-06aa-821c.cable.dynamic.v6.surfer.at ([2a02:8389:2301:9f00:88fd:fcdd:6aa:821c] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDjXv-0000000GceW-2R9n;
	Mon, 05 Oct 2026 14:20:03 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Anuj Gupta <anuj20.g@samsung.com>,
	io-uring@vger.kernel.org
Subject: [PATCH 2/2] io_uring: cleanup the io_uring_attr_pi definition
Date: Mon,  5 Oct 2026 16:19:44 +0200
Message-ID: <20261005141954.1353351-3-hch@lst.de>
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

Remove double-tabs for the members, and make the comment describing the
struct a bit more detailed.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/uapi/linux/io_uring.h | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/include/uapi/linux/io_uring.h b/include/uapi/linux/io_uring.h
index 909fb7aea638..b42b66b424a7 100644
--- a/include/uapi/linux/io_uring.h
+++ b/include/uapi/linux/io_uring.h
@@ -121,14 +121,15 @@ struct io_uring_sqe {
 
 /* sqe->attr_type_mask flags */
 #define IORING_RW_ATTR_FLAG_PI	(1U << 0)
-/* PI attribute information */
+
+/* PI attribute information in sqe->attr_ptr for IORING_RW_ATTR_FLAG_PI: */
 struct io_uring_attr_pi {
-		__u16	flags;
-		__u16	app_tag;
-		__u32	len;
-		__u64	addr;
-		__u64	seed;
-		__u64	rsvd;
+	__u16	flags;
+	__u16	app_tag;
+	__u32	len;
+	__u64	addr;
+	__u64	seed;
+	__u64	rsvd;
 };
 
 /*
-- 
2.53.0

