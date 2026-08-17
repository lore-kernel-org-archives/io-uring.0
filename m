Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E33F3C10B3
	for <io-uring@vger.kernel.org>; Mon, 17 Aug 2026 08:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786955326; cv=none; b=av1TPDSw7LPgR4dmnf0OjqgsVh3mYsJyUaCwQ7pp+IrU7t37zjCKzwzR5Bi5cZHnJNaev7wJpqZN59IVqxyJS7/V9w0HD7wSDHCy7lXgql2TKPyhXm7W0BpqL/GlJ6TerVGKlnUGFRqY6W+ACKCJlacRFN1wE/73ZsHiRIULNLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786955326; c=relaxed/simple;
	bh=+ZIC0vZuXY4WJI6yn5thLdYXZdodOx8LgMEuL4TQCVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BlHvWS/zg2gRwt1tiufYfurWY6fNGln71ZnEcZMEih5rne24veg5x40C9lWHy2edHfGJHvcyfkb0D34nacqBi9DDnvUOB5FikpJ9BG7Vm9k9WTDw9A3ZwkyiGyKQFwIjmLIrk1F8tuHpsrvogCn50ozQZbq0lHiO3LWg9H0yNYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=xOp/K3Md; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="xOp/K3Md"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=JtJ0BSvrVnUqK/EDj5EPk8LYdOQZY7LrKXGkCWdjAJU=; b=xOp/K3MdjW8pPKOq4hevE8JCrq
	7ZG/osfHSMYomrc7A9Kykcp5Fv4SjsYJlkVw+2JQ8Tgns86HhihfPwAKE2D2u6GvyPFuIjrAH1Ejs
	FLwm98JeC49Z7YCyUXIO0z+Qx1J1f2cvxaURxO/YJUFtB2AxLSZpt2YgpEzDXaXUt+Va2yVt9MNs4
	OuvJh7g83lQT70+D31Rwv+SXAH0+WFTkub7FMQ7wscgSlXEYNGop9tXaUbLnp4lJn6ZhVEvOCvTj2
	rPb3CPEYESpjkUYASHJ4mNSLhn3ZCqV1KxE32hChqIOb2rSCzodhgOnkqSV0zanB0NQ66Gl19H/LA
	lGlhOLZA==;
Received: from 2a02-8389-2301-9f00-d9b3-9099-237f-e1a3.cable.dynamic.v6.surfer.at ([2a02:8389:2301:9f00:d9b3:9099:237f:e1a3] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsi3-00000005h0Q-3TbO;
	Mon, 17 Aug 2026 08:28:44 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	io-uring@vger.kernel.org
Subject: [PATCH 1/5] configure: shorten the message for the discard command
Date: Mon, 17 Aug 2026 10:28:28 +0200
Message-ID: <20260817082837.762276-2-hch@lst.de>
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

The current message is pretty long, drop the redundant io_uring.
This aligns it with the soon to be added zone_reset_all message.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 39c377c9bf8b..b953eddd6ddc 100755
--- a/configure
+++ b/configure
@@ -467,7 +467,7 @@ EOF
 if compile_prog "" "" "discard command"; then
   discard_cmd="yes"
 fi
-print_config "io_uring discard command support" "$discard_cmd"
+print_config "discard command support" "$discard_cmd"
 
 ##########################################
 # Check idtype_t support
-- 
2.53.0

