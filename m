Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBC444C64B
	for <io-uring@vger.kernel.org>; Wed, 12 Aug 2026 13:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786540382; cv=none; b=NqV8m3ros4IVuEuF5VDugjqdBP9/oUDgSkJV+jiEDCmwI1fFy24N/1zKE4I3Jxa1s4b5AF+UHbCftfWoD5hkMSflJXmHEsMJNzIsp4/HYfIORoRdFduIkolwGvmKsxqzq0SpNgUSzC1OmZxDuGiQdf6jHDFkSbi7oIwBM22xIoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786540382; c=relaxed/simple;
	bh=Kp4yXPaLqA1SpI9hKYCcfBVpz4fwCl1y8X0YmfiC2TM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VV77ASBOHxHYDRykK6jghyEDjR3UHUQN9VErzBTyBgY2wL4jjU/K1osLiUKGu/8c2nTFetOHIiNva7Jzwo7Q1S3fGyryKmBVJTn6epyNMK4aFFTBGVlurXWOyAX+epgrzDzbDZ42AHyPXm8ydSb5eA+dH9w/MpM3yi8koD8xlqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=d32czKLM; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="d32czKLM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=YxPfFZ1D1WVO9hvZ+3/PEPD3FwOsIm1hL/ovfbxq8+s=; b=d32czKLMN8GWRxCm9KBLU2xuOs
	d4sOkWQsm+jUhbwBt2j6Hc6Rc3CCLm3iGr+Un5PuJHmFfugzujAInhoKIIyyPwNH3oDA7pyAsDNjj
	CSQxc43aZLlK4NSOodQtj4Nlpvbhp+Jd2kXEWGF3oYDEVHlrVbLN3Me95m7+Kq6NllGxvKQHwecqH
	qHVP91dArtij4LGU824JMu9sZvfqRHf78BRySdlxBQ54vuawOnyU5llWdsSH3rVtg0JbCV52dssdP
	1iO/o/oxGx/Ly/2YBtp4RREFlRk7NO+stuMYjX6knA6SgyCkoGAYEV9CKszMxVCk8EDrCzHuWHI1P
	1bc2VO6A==;
Received: from [66.186.210.122] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu8lO-0000000GFnR-0Gas;
	Wed, 12 Aug 2026 13:12:58 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	io-uring@vger.kernel.org
Subject: support ZONE_RESET_ALL in liburing v2
Date: Wed, 12 Aug 2026 07:12:47 -0600
Message-ID: <20260812131255.258582-1-hch@lst.de>
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

Changes since v1:
 - misc spelling fixes
