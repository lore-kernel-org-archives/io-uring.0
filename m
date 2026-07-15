Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6233128C6
	for <io-uring@vger.kernel.org>; Wed, 15 Jul 2026 06:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784097593; cv=none; b=XL93hWk08cQEWF/cEuthhW9kY+lM2FLmChNVF1LmrFODiNPgkQxpkp4tffa0DvsPRz6j/+YuwKqlQCh9LTx6frk2gRHVbTJ/pmsvn84QCSgcNSfRLllWgKTbgiaySRACDkVxr2lhdEi8YkN2LPyBaHKQUTivuMgDDB3JBfgBGI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784097593; c=relaxed/simple;
	bh=UaPQ901qZDwrl9dswu+14LQQK7YgTB90O/ovxHTZtlw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uynLTRyFgr7M5YlthkE2fQ1AB7IocTgCAyTAbjGnzBXacVXWMxx4jM9Ck8zeT3lavVMl8Id+2dQKHt4bt68gwgGag/J4vVnnQs/zffxxdsjdxTFjKjNdZmC5rrCpHHRVFRyc919Tryd5jCKvSsR8JLUJySqOcZCRYjgscU6NDlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=iNbUpNS8; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="iNbUpNS8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=XN8KViqjWvAXhBUse0/7emkr00GEVht/KuFuiITFuPA=; b=iNbUpNS8P+PF7mISjjw/Jk/XpL
	JZUdpjjRKWtORM4SKlmhRGiQK7nCBCeFZNdq5UKKQj8EPEMCx/ohkI/o/eO5CCu7WZNXf3+0AakgP
	NOsPv7DMB2GiroOxij9V3U7oa0lT3JeeKEVZ+/e4xnuiYepxAy3TSBb3Cq60u03DY9bFqWL/O6VDQ
	6uBSXF/MjR66dK2oeEZK1HCHrA61HuM4wCXH7mXkmJebJJoXeqgz7+VYZr6+HPDXB2sG99ud2IInW
	Oknha4t7Uungb7Rp38yXC2CxZbBTeTSxxw06qyagdjQhxCNfTe2ahqqQlDOs8QmmpggTFdCjON8S/
	nFf4zViA==;
Received: from 2a02-8389-2301-9f00-3397-c9eb-6d8a-9179.cable.dynamic.v6.surfer.at ([2a02:8389:2301:9f00:3397:c9eb:6d8a:9179] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjtHa-0000000DvBf-1A3B;
	Wed, 15 Jul 2026 06:39:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	io-uring@vger.kernel.org
Subject: support ZONE_RESET_ALL in liburing
Date: Wed, 15 Jul 2026 08:39:27 +0200
Message-ID: <20260715063947.2933606-1-hch@lst.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Hi Jens,

this is the liburing support for the just submitted ZONE_RESET_ALL uring
cmd support.  Also a few fixup for the discard support that stood model.
