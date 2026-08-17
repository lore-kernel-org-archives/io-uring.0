Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E423C0A1A
	for <io-uring@vger.kernel.org>; Mon, 17 Aug 2026 08:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786955329; cv=none; b=JP1Arp7FR1PdPcpGVtHylYyL/1ZQJulkNvjkeK+6RdtL//gDUCQRGmMkRCGV28yYjIW9QQfsmtbRFr/6SbjWgA2t7tmifCRgMrz7grqO2lVIT4SyRB9rPaU5EuWhAoDTjG16FW4pDgu3BBTzs0LNn4U8m7V6LRX/z3SMb8+U6NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786955329; c=relaxed/simple;
	bh=IKfaipxf9v236A8Skdvnlsspt0Ufa95c9RI2QlJZ8T8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BU95KFLmM94rvjM0iWnHtF5XWagGd5vHovtcLSBpABKul7jyckBErZPliFHnZ3mZuLcHZ28FND72fiMfO2NvJfdGBi3RCMHJpqDuK8cSUBF3mcJesryTPw5ejTqlQhCVkD87WbwUDmCF+/hY00U82+0+1dZq5G+dRa4A/vLXmeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MHO34Xr3; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MHO34Xr3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=d/lUrqhBOud/25+lOIemgzD5E684x0pRTa5kFf4UMlU=; b=MHO34Xr3RWy0vReArDCbwuNXo0
	6ud0cVWXHGpe0pFI280nUMaonjS/aPmLCChXHOitG2zlPUKM3lLWDQE9N6U5VMxxLhOgaqOPMkRkB
	j8PKUPrL78NFcDVMLJjhfhJ7Zb/V26wS0owxUY43K3TKYSgG8UYpzt3xZo0yDWdxmCeYj+/ZlJwQv
	/3DaGLD7x4hwphaSnG17emLrDb7XdMqfaKyiviJ1Ip0xi/+ic/tnpSaK9b/ShAG0PxcJT3ADXkTdy
	LuzQ94ZWeK1PGof4tE31+jZom4QSUc1QVaGANU1inZutIL/1I57E/T5FaqfnaDoR2HbUMtrCCB1k9
	lLbihOQQ==;
Received: from 2a02-8389-2301-9f00-d9b3-9099-237f-e1a3.cable.dynamic.v6.surfer.at ([2a02:8389:2301:9f00:d9b3:9099:237f:e1a3] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsi6-00000005h0b-2xLJ;
	Mon, 17 Aug 2026 08:28:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	io-uring@vger.kernel.org
Subject: [PATCH 2/5] man: fixups for io_uring_prep_cmd_discard.3
Date: Mon, 17 Aug 2026 10:28:29 +0200
Message-ID: <20260817082837.762276-3-hch@lst.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260817082837.762276-1-hch@lst.de>
References: <20260817082837.762276-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Mention the ioctl this is modelled after instead of the io_uring
cmd used to implement io_uring_prep_cmd_discard.3, and drop an
incorrect plural for page cache.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 man/io_uring_prep_cmd_discard.3 | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/man/io_uring_prep_cmd_discard.3 b/man/io_uring_prep_cmd_discard.3
index 97786726f03b..349df86ff9c9 100644
--- a/man/io_uring_prep_cmd_discard.3
+++ b/man/io_uring_prep_cmd_discard.3
@@ -26,14 +26,14 @@ to start discarding
 at the specified
 .IR offset .
 
-The command is an asynchronous equivalent of
-.B BLOCK_URING_CMD_DISCARD
+The command is an asynchronous equivalent of the
+.B BLKDISCARD
 ioctl with a few differences. It allows multiple parallel discards, and it does
 not exclude concurrent writes and reads. As a result, it may lead to races for
 the data on the disk, if the application has IO inflight for the same ranges
 that the discard operates on. It's the user's responsibility to account for that.
-Furthermore, only best efforts are done to invalidate page caches. The user has
-to make sure that no other inflight requests are modifying or reading the
+Furthermore, only best efforts are done to invalidate the page cache. The user
+has to make sure that no other inflight requests are modifying or reading the
 range(s). If that is the case, it might result in stale page cache and data
 inconsistencies.
 
-- 
2.53.0

