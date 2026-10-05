Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6154A3D4D
	for <io-uring@vger.kernel.org>; Mon,  5 Oct 2026 14:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210014; cv=none; b=gwEk7zktl/Ie9dYhZY12kIf3pwEuI9Srk4K+dQMIB45G7K8YJVw68sjdg9PlFM9J248BCrldWNeTglozf/p+JoaTJFnadIAguW0NmbnmDwT6+IuBSY2ulYZwlbtm1t8GPe1lMyREoeEwo89xvuH+k8q11D9/Pa8o7PyIPAb+3So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210014; c=relaxed/simple;
	bh=TKY+tLlfwY+OcI1abqAwxFi4pj034hXczKSHeuxk9zw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ewOCasj9AwM/d+CrqrkllTo7OlOU2GHTe5D0m3JEYhPf6KK98GtWFbVT2f2wF00VDwKgQBB+sBZv3Jf/cQwuzz0iFT7gdz2Nsipx0WkYXxEswqP4qIu61zV0MZ7zAdPY/M/cvvCNpCwDuBYUqM2YXQ32bdRBVxGM86eX2LWa19Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=PrsicY4j; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="PrsicY4j"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=E6/cPoyUONai/Ghk1BW7keIPZVoGa263QjNjaStil1c=; b=PrsicY4jy3wTt0glD6vyS/zXaI
	9Lvs0nMDpN070ERf5NbE1zjjpX1kUzpuv6CFrlojqIuKm5OqnHPHUKyQ/KV84zIwSsZ+jwjlvvDd3
	v9CiRs5+g1dc0YDyQXW/iX4zOm0tA9CUiYF9aFxjRXsm6ptaCMzeFfAP/h3FBYJMgQqizpcvt1eto
	/zpgXWms+a2nJwBjnV0VqIppcAPhW0LeNhobMgZiSdEwFscPgLMzGaWO3t4Fl+sRRTbpo+uzvbvu2
	590hWJ5otPIBPiF+roqy0lBp/KjC1XxAiKxVGU7RQ+9ZlSg/wK/4wcHC3Oh2RHQ5xACgIRwQl90y9
	mw2soN5Q==;
Received: from 2a02-8389-2301-9f00-88fd-fcdd-06aa-821c.cable.dynamic.v6.surfer.at ([2a02:8389:2301:9f00:88fd:fcdd:6aa:821c] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDjXq-0000000Gcdt-03gc;
	Mon, 05 Oct 2026 14:19:58 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Anuj Gupta <anuj20.g@samsung.com>,
	io-uring@vger.kernel.org
Subject: minor cleanups around IORING_RW_ATTR_FLAG_PI
Date: Mon,  5 Oct 2026 16:19:42 +0200
Message-ID: <20261005141954.1353351-1-hch@lst.de>
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

this series has two little cleanups around IORING_RW_ATTR_FLAG_PI
handling.

Diffstat:
 include/uapi/linux/io_uring.h |   15 ++++++++-------
 io_uring/rw.c                 |   20 +++++++-------------
 2 files changed, 15 insertions(+), 20 deletions(-)
