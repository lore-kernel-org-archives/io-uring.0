Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.21.23.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792859779;
	b=xd9EjEbgmorwmEAys2dVgC9o7vG5jY2ci90yoqdeJsz+1M4xGmFvBVZB/mLkGqpC1XsB
	 uR1BavKz+0mEcx/Mtmvxvb+qs8IEmb2zSpXwMTiWwbLbgAGvuTJHHQMyVm42wIE/Pj8qn
	 pKFYnbi+akSnTf/QgFMz2DWmIzuHFOJLO5tDdSokT9E7OfuiE8eUA3wlLsFIpkdxlXXeb
	 Yv0CbGOpCQVg0K7Fo7RTb7MbjY/KjYn18LJ1aPfeRfs1kO0cGUTx2R6zHbJ4RvKBmIoIK
	 yyyTYYVqfzKvS6LCtkWeAmCVZagUnJnrsfgGFcDdJhMEJwMH8wj8xumhFJjAOpL7z/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792859779;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:From:
	 To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=rFi0OxjSEWn6Gc8/TfEfe1ENdYDWh1qRk8ALpdh9YRI=;
	b=BqpOpRfIDrnEbHpamhEeL1mUYL7ezznxhxEMqcwRzbb/I9+7rjrwdvukB74eYs4spChQ
	 yVUHXH9HHyFyTmm92s/vvUYhE/iqxmhAB0Wl8S/GmDOry7607wHs4SKi8LUQRSuDigdpD
	 ijFtAQRgU2BkgwhVzUmqAYbMFezc+iJPZm3LUYsaP5PW258ado/H9wvPyI7IakR6pIiaP
	 BmO0qr/zN5Tikfvj2TbxizPd6X2t3mZv+AdwSdWVIAl9fCZwnigbFG8GoqHnukftSX8ni
	 QYOOz8Ult02zizfmeuZEhz1t0OxT64CwjG7tPTr7Kw7CAJ4LG5ZygwmknEE4VoyeZhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=disroot.org;
	spf=pass smtp.mailfrom=disroot.org;
	dkim=pass header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=fTgxBCYg;
	arc=none smtp.remote-ip=178.21.23.139
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A00606A31D
	for <io-uring@vger.kernel.org>; Sat, 24 Oct 2026 16:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1A00606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=fTgxBCYg
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id DB3118833A;
	Sat, 24 Oct 2026 18:36:16 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OilAN1qyOFZt; Sat, 24 Oct 2026 18:36:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792859775; bh=bLvgS8z6Hlg0nmKeoNgHe8W9gt7RNdiR0AyyfqtoQrQ=;
	h=From:To:Cc:Subject:Date;
	b=fTgxBCYgLedPvPtFtoG+wvQNgIo7asOQsYeGxTj1OSNAf1dso2K44BHWw0jbz41tx
	 Jx6tFhoY+EGW5A+7nhakSwc3ezvd8YGmdF24LXd8E3JmuSwa2ZfV9I7dzbNXJ4Rv0+
	 cOxk6AsnLTpGRB7CWCJBVH+Pd1fikVaeUT0Y0M+la8uduaoHQKItyl1rjfUirUdHCH
	 MLXuH3ze4T3wC7GeMZ+5AfQkXgRKTRoZV6AYkxaag9FADB48HwJUMloMBqrRxVnWv/
	 Ct23TKnsGS57nhBnBzgaA07KuvyXb8yIiYZD3ZZfDeUGYataiaPl0LiJjn5XzoAjw5
	 UfMVvZGL16Iag==
From: agxr <agxr@disroot.org>
To: Jens Axboe <axboe@kernel.dk>,
	io-uring@vger.kernel.org
Cc: agxr <agxr@disroot.org>,
	Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH liburing 0/2] test/futex, test/waitid: futex and waitid cancel results
Date: Sat, 24 Oct 2026 21:33:56 +0500
Message-ID: <20261024163400.19976-1-agxr@disroot.org>
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

Tests to go with the kernel series "io_uring/cancel: futex and waitid
cancel results".

First patch checks that a CANCEL_ALL of three futex waits, and of three
waitids, completes with 3. Kernels without the kernel series' patch 1
complete it with 1 and fail it.

Second patch lets a single futex or waitid cancel complete with 0, as the
kernel series' patch 2 makes it, as well as with 1 as kernels so far
do.

agxr (2):
  test/futex, test/waitid: check the count of a CANCEL_ALL
  test/futex, test/waitid: accept 0 for a single futex or waitid cancel

 test/futex.c  | 47 ++++++++++++++++++++++++++++++++++++++++++++++-
 test/waitid.c | 28 +++++++++++++++++++---------
 2 files changed, 65 insertions(+), 10 deletions(-)


base-commit: 236c1525ff1b2ea5870ecada04951eb2d053275e
-- 
2.56.0

