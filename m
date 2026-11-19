Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088967;
	b=RbG8rNPDiVfSxcIXyOSsslaEktvWQnvQLfrC7OVy1Kmz8MWwmblE3pmtlHNrwH+JoyU8
	 2TB4Ug0OT4RNISFRiHP6XTcrcq11ybZO1MByBJvZS6D7SrsKx+uQ5YNh+14NbODS7mYDw
	 70aMhuAa0KN5mCZwlQz3Vy5tG7KbsEVmwrN6OwsadPmqlYLaK6NjIViK5YERIJQQZk/aN
	 e9MFaIsjU4DEywWIH9sn8Jky5HQbk/JWRGtLdSxQfbGY/iqTnfDgwpaIOWg927uK1+NKe
	 0dFehnQnBpFdu8idBexSxuHPdZF4HaZ+Y3+K9/4hOm9RmMNMuaD3vHc/yO6ZS0vSBfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088967;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:
	 X-Msg-Generator:Content-Type:X-Sendblock-Type:CMS-TYPE:cpgsPolicy:
	 X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=s3gTUBSKHbEfKVIWdTL7aoQee4hjar3Z0u47LY7+snY=;
	b=Yi+cisNSE0pMiVdg/jku7xlmUp9B6A5j73QI8nHku6lgEHwguy+gFWAWZJMWbfVtD0xh
	 p6UQGPJCeAqSqJAP0JjqktbmCKKqu4vKsz7cPZxykZOhV7twnXqeBw//woPhbMLvz1sjg
	 Rs7CDgesG2rKHRpzL5CIBfuxxgIEaYFoxPCbj7yTo7/tyAOcPQ0o1PC0O09jBELwe093s
	 R9imsK7tuRTu1iUuL91U4RkkRjF2gluIEJux/aeYshrLP+eflYrUvwUtzuUsssC8bz/To
	 wmjM6tErVSkwlsAmCFji+LRrNREbi145pvL87sCG/700ENsszi+lPdv17srBUTsMGaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=dqQxzuxe;
	arc=none smtp.remote-ip=203.254.224.33
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3C0606A326
	for <io-uring@vger.kernel.org>; Thu, 19 Nov 2026 11:49:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C3C0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=dqQxzuxe
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261119114919epoutp03baa5e874a33cdc597c6d3eb283e37a62~pb_Xwmxhw2166221662epoutp03F
	for <io-uring@vger.kernel.org>; Thu, 19 Nov 2026 11:49:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261119114919epoutp03baa5e874a33cdc597c6d3eb283e37a62~pb_Xwmxhw2166221662epoutp03F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795088959;
	bh=s3gTUBSKHbEfKVIWdTL7aoQee4hjar3Z0u47LY7+snY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dqQxzuxeRRmh1EFAmYTtlnDzHNy7szmV2NX64ahPOy54B26M25Xz30VI04bYOSF9u
	 Rc5GSlJ1M6YFK2iHf6Sp9rnXXbgVSPbljvzbwmT2AqKQChT6mEQdWCkZnWLwf42PXm
	 48NpZ632c3Yi5bLhjokddHWbtTriJA9f1DimvsLI=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20261119114919epcas5p35d531a748785348673944fddcd54006d~pb_XN5G2m1102911029epcas5p3C;
	Thu, 19 Nov 2026 11:49:19 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.91]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4jVcFV1xFDz2SSKb; Thu, 19 Nov
	2026 11:49:18 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20261119095725epcas5p3a8e14a90891afe16faded4fb78484b49~pacqyFUJp0437304373epcas5p33;
	Thu, 19 Nov 2026 09:57:25 +0000 (GMT)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261119095723epsmtip17c51681d284e723f2550c9ff004cea68~pacotAQBp2192721927epsmtip1a;
	Thu, 19 Nov 2026 09:57:23 +0000 (GMT)
From: Anuj Gupta <anuj20.g@samsung.com>
To: axboe@kernel.dk, asml.silence@gmail.com, kbusch@kernel.org, hch@lst.de,
	sagi@grimberg.me, James.Bottomley@HansenPartnership.com, mkp@kernel.org,
	bernd@bsbernd.com, joannelkoong@gmail.com, miklos@szeredi.hu
Cc: io-uring@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
	fuse-devel@lists.linux.dev, joshi.k@samsung.com, anuj20.g@samsung.com
Subject: [PATCH v4 4/5] block: map dma-buf iterators in
 blk_rq_map_user_iov()
Date: Thu, 19 Nov 2026 15:26:14 +0530
Message-Id: <20261119095615.1840522-5-anuj20.g@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261119095615.1840522-1-anuj20.g@samsung.com>
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
X-CMS-MailID: 20261119095725epcas5p3a8e14a90891afe16faded4fb78484b49
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261119095725epcas5p3a8e14a90891afe16faded4fb78484b49
References: <20261119095615.1840522-1-anuj20.g@samsung.com>
	<CGME20261119095725epcas5p3a8e14a90891afe16faded4fb78484b49@epcas5p3.samsung.com>

A dma-buf iterator can't fall back to a bounce copy, so map it directly
with blk_rq_map_user_bvec(), which already handles it through
bio_iov_iter_set(). Fail with -EINVAL where a copy would otherwise be
needed, and update the blk_rq_map_user_bvec() comment to match.

Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-map.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/block/blk-map.c b/block/blk-map.c
index 7369aba74771..a65b255b229c 100644
--- a/block/blk-map.c
+++ b/block/blk-map.c
@@ -459,7 +459,7 @@ int blk_rq_append_bio(struct request *rq, struct bio *bio)
 }
 EXPORT_SYMBOL(blk_rq_append_bio);
 
-/* Prepare bio for passthrough IO given ITER_BVEC iter */
+/* Prepare a bio for passthrough I/O from a directly mapped iterator. */
 static int blk_rq_map_user_bvec(struct request *rq, const struct iov_iter *iter)
 {
 	unsigned int max_bytes = rq->q->limits.max_hw_sectors << SECTOR_SHIFT;
@@ -506,6 +506,19 @@ int blk_rq_map_user_iov(struct request_queue *q, struct request *rq,
 	struct iov_iter i;
 	int ret = -EINVAL;
 
+	if (iov_iter_is_dmabuf_map(iter)) {
+		if (map_data || (iov_iter_alignment(iter) & align))
+			return -EINVAL;
+		ret = blk_rq_map_user_bvec(rq, iter);
+		/*
+		 * -EREMOTEIO asks the caller to fall back to a bounce copy,
+		 * which a dma-buf can't do.
+		 */
+		if (ret == -EREMOTEIO)
+			ret = -EINVAL;
+		return ret;
+	}
+
 	if (map_data)
 		copy = true;
 	else if (iov_iter_alignment(iter) & align)
-- 
2.25.1

