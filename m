Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEED44C664
	for <io-uring@vger.kernel.org>; Wed, 12 Aug 2026 13:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786540382; cv=none; b=dIHVTfwsDYAEqVbF5Z6petkUwmTsHEwz3JB6RhSvDamIt79FqBJWis92LL6IxrGPx3/0bjzUS/Bi6TmQqX2krJNRg7FZs4mkGZWzwGw2s9pHKKSSnwm6IdPXM6YsEkVQqItk4GubIlPEzjK7sq1bcKnS8lkJ7UBVHs95EypoBis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786540382; c=relaxed/simple;
	bh=IKfaipxf9v236A8Skdvnlsspt0Ufa95c9RI2QlJZ8T8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YFtKiRcK+GWuqBjwV/HnKoevfHsVOzPOzHqmnmoLoIJlpyfyU4Fgyl0HrOQNC/rKYAYgGEZPJo+U9y8cJAj0DqIfrxdOBPmrLgyt2nGB59lnujcUX/eRVKSromKd/od2YqAOH9elDCII2QKXCGy9Ncbdzj+jErwriODEC1GEhbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Z09EVVC8; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Z09EVVC8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=d/lUrqhBOud/25+lOIemgzD5E684x0pRTa5kFf4UMlU=; b=Z09EVVC8shGqOnBK0YQzpsY+QP
	LzHOsr/BfoeCLmTYzmvGlQvY2+j5x/OtB+3G2CDTyGjj3cbeOedXRs2JCdlGxbpx6AHeoviVXOZJx
	Y5KC2DjCIGOj8XwdmbyDjtk0YrZi/Wf8LKeXj9SihFIoKDZBmqFuGJl6dx4+CraXT3OdeWoTVL8/G
	2ezhc3etmx73W95K17pWRize3eh8f8cJ2Ywn80DBQX5MnX6Mslz2yKiKfZ7762bpkwOLkNDK5WrJF
	1Ac9TGvx6wpvXs+YffxBYwFwN5TGMgJh5XQVILITM1p6N2xW/3GwQaAhwXTDdZxgDDHoa2mdiFbSR
	ARih93Sg==;
Received: from [66.186.210.122] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu8lP-0000000GFo3-1uBQ;
	Wed, 12 Aug 2026 13:12:59 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	io-uring@vger.kernel.org
Subject: [PATCH 2/5] man: fixups for io_uring_prep_cmd_discard.3
Date: Wed, 12 Aug 2026 07:12:49 -0600
Message-ID: <20260812131255.258582-3-hch@lst.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812131255.258582-1-hch@lst.de>
References: <20260812131255.258582-1-hch@lst.de>
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

