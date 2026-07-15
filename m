Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1DF25B088
	for <io-uring@vger.kernel.org>; Wed, 15 Jul 2026 06:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784097596; cv=none; b=LQpuQH6TFVXdN6a9+jQL7B0NL3jMcM/DePYYA1qgMiuLmlLGwK9EjeGIWnyD+efNvM6DVxXDiYwdD5QgGEAnPanNGW3KrSTbs3Ln+ftKZN8A2+8It53nnEl+yajUB1c0zzQ00hZCybBMyjGm1Se4KH8dK/+EA15CgwZ42E6/BUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784097596; c=relaxed/simple;
	bh=4Zsj6rVFMYvJcdo5FhcqWcZZh28mxeUwetObO0S3U48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tP2e/VclfGdZ3PSNiA3Da99bft0JCLGv8dFR14C0p55PCMzDcn8SYig0eQ0qwHwqTtL2JlUytPk4YwhSD86llozxqYm5dw5pDJZMECMTFqUofrndGmXUyQ5HVE15S38EKO8FsOclsanCVUz8+2U3g+3Y3+GiFQgfgEXC6ZZNQRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jhdJwX6a; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jhdJwX6a"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=vRTe6KJxhduNBmI2UdsISwBQZITrj6CyFFUpuxhRkb4=; b=jhdJwX6aJjSytXnSOklWhk+b0L
	9YPDimoCZnuc/T6Ge/C/kF//qRHXlEnVL8+qNcNf5qWA8HyHf7ZpjZ6Uz5BGM1RbgxvhV4jWqvDXb
	E6LXyK0qvxl7dshtqvqppigHcTpVo3ZMXXJnnDSuYga3Air8NgeDqCEmUQzo2VH0O5sRK5/fPgduG
	McUx+j9JxYVEfqRGNMR1KWF13vB87MBRRKy7dxE3Q04g+bb3XIiSfe2AGzBQ90AjSsCfMWPhXLXhY
	F6PkKcjnYz+61dDut4mrVU9AvLHAKJrYg8BTP87TH12X5G646LJMz4/kd+Q/Er9q6rPHWyKX8TaN7
	dIhYydyg==;
Received: from 2a02-8389-2301-9f00-3397-c9eb-6d8a-9179.cable.dynamic.v6.surfer.at ([2a02:8389:2301:9f00:3397:c9eb:6d8a:9179] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjtHd-0000000DvC9-0MIe;
	Wed, 15 Jul 2026 06:39:53 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	io-uring@vger.kernel.org
Subject: [PATCH 1/5] configure: shorten the message for the discard command
Date: Wed, 15 Jul 2026 08:39:28 +0200
Message-ID: <20260715063947.2933606-2-hch@lst.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260715063947.2933606-1-hch@lst.de>
References: <20260715063947.2933606-1-hch@lst.de>
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

