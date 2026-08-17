Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359B33A9628
	for <io-uring@vger.kernel.org>; Mon, 17 Aug 2026 08:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786955323; cv=none; b=N9HC7PPaX6x2kdPVaiagGzO2atLtASzdavmWErNJ0XPq/eWe9ElHlADbdOk7hZHCNcQnjRtVrbdejjgTc8ANIOmTBmm1z9udSGQmA2MUaqjIH8UcDOIbQqmdGHoYsVIGiJaAhDg4CEpg3Ju+gahHEmI9HSJhKy+XQxsCmy+SR4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786955323; c=relaxed/simple;
	bh=FQNFErR+txJw5xssLGW7x/YcsyUwfZDtGOOxMqlhbaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YKy7/mRby3O8xIcyYcJMqTbSTGkr2eJW7fUb18gFeD/vThQpAk2MzusFcf+/UEt4Y13soGOAg+M01SRe9zYjRD6WHEhjHwPmjyCfpKzEv/k9bNAHmsCpJzC0hKLNir1fxC9HQLJDFQnQcdOdQNp90B4OIstl5slI6GeRTB70/NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=x9oFDSPz; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="x9oFDSPz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=j7614uadggDG1XDY5uOvn/8LD5YSjLbRDdgGoSA2j3w=; b=x9oFDSPzlNMIRf094313gJ/ccs
	F0WrAAoORWLTHDMQmxi25FGTqEvmQhQhHzF+mxliq9junQjPn4kNcg8NIdMByfcNczvhpWmFMqa+W
	D80+DtTwhE6RRHlj9pkmZCnO77TFL10PJ68c2gECzHk+XlqLxZcVdT3I2RZZtAbhBn4IcvN/CHuV+
	9ppCXmtvbH2HJJ+8HKxMXFKbsdNnP82XuN5lV5bHbIL8LPmFtOhg0/2gsVv2knqrp2ovxDVmcyV0b
	1fQrol5QF9XmEKz9gBxOulVdk2yt6J+1942zkNzeLW3DE6wijjuKMROkcFPhN9cJu6TqxgcMW9lCf
	PGQWcAxw==;
Received: from 2a02-8389-2301-9f00-d9b3-9099-237f-e1a3.cable.dynamic.v6.surfer.at ([2a02:8389:2301:9f00:d9b3:9099:237f:e1a3] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsi0-00000005gzs-40bc;
	Mon, 17 Aug 2026 08:28:41 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	io-uring@vger.kernel.org
Subject: support ZONE_RESET_ALL in liburing v3
Date: Mon, 17 Aug 2026 10:28:27 +0200
Message-ID: <20260817082837.762276-1-hch@lst.de>
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

Changes since v2:
 - fix inheritance in the shared library map file

Changes since v1:
 - misc spelling fixes
