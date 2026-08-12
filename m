Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC8B44C652
	for <io-uring@vger.kernel.org>; Wed, 12 Aug 2026 13:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786540384; cv=none; b=Ml61IAofnpPjf4wu6KumaAl2WHa+d8p9lV3BW1iNLPv/FkfQrBOZVeqUQnx/dmMVS7k1LA5y1RmuwlCkE4bkVs7xSErQ3cKs8kCQGudG10yDmXl+83MY2NpTW63gSBhZLsl4GPyP5HWTyp0OD5bn4j+XIe6TGqihCGlwF//OYEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786540384; c=relaxed/simple;
	bh=+ZIC0vZuXY4WJI6yn5thLdYXZdodOx8LgMEuL4TQCVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Flawa2pd1dehAEFnQUSouDerhxSVnIOOZyM718W/lVU7Nb7qPxBcnbr7lF83DXZhEFPw9yU6vzyvhcuAo2IgCw5ZJb+sVPsN8xnvDjtrMSLdhkqy7w5gKBNsvqgzMwIpEioLFAY7P4NL1ZQmSrnUc3N2Jd/fghBLebJP/oOrIQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BNV38n8T; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BNV38n8T"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=JtJ0BSvrVnUqK/EDj5EPk8LYdOQZY7LrKXGkCWdjAJU=; b=BNV38n8TYbrEPBA+PhQunkjD1+
	HUQt1KieJuo7tdmQcdlwCWffGV8t5jx7jHPpZsOIv/1DM3TFT6FzCRRgiE45xgD6/WZzsDXdNXOu2
	k376dQn4tPCGh55dT1vZjah0uxjVPCuEdh15kc9qFrJn8mNW7sAnHWBKI5DauYdqK3XCWF8wtnSGP
	w+aVZsPRjnXopDAn/a3cMUgpug4cYpbh4UJFp8fHtFUyceyNcmC5FOcqEDU1wN75nC7jJh2iMPKfV
	CmyiQ2cX6FdGcUZo26oJkRpRTuqPU+GhnG4Aq9pe6Y4aP94PFWEt3s00pUaLe4YdWUD+nKM88BwHo
	wwQtr2Dw==;
Received: from [66.186.210.122] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu8lO-0000000GFny-3bPh;
	Wed, 12 Aug 2026 13:12:58 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	io-uring@vger.kernel.org
Subject: [PATCH 1/5] configure: shorten the message for the discard command
Date: Wed, 12 Aug 2026 07:12:48 -0600
Message-ID: <20260812131255.258582-2-hch@lst.de>
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

