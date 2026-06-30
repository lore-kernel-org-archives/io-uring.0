Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6579B1548C;
	Tue, 30 Jun 2026 06:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782802647; cv=none; b=R52HNrCQbW/IVNBUDTb2cq9sLm5jLf84I+WG95TsE5lZEFD/oJekH7wdvlX2j+66fdHPHVvT5ohMKVU1pbkdxjBdAYnIPcN1s1uMZTMP69vAgKmBXVtGiqW7jQP9sgIsySh4bhEe/Bhm39jNCNoX9fWS0ZYW5rKy2cnYVk7vpxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782802647; c=relaxed/simple;
	bh=dIKX3znJOyFSbbwmkGNnW9hhZ6LoCHcoYgimeW6sBEk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nY02t/0Uxh/9HOrs4O+84hwJlJvLxliqRUzgza9tCt8xPKo415DaHqxouo2GoiLfMJ0+zOTTxvl31+k7lWLOQX6mC1yIcQxh6ynraEGOiTGrF/YkR8vz5OE0ZvvhgfeTHixV3BEPda8g/E6pXMxRzInKHJ4sDpQ0jWihJYMdxKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: ee331c96745011f1aa26b74ffac11d73-20260630
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:086f29bf-d893-4142-a72b-4d29c81c3672,IP:0,U
	RL:0,TC:0,Content:57,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:37
X-CID-META: VersionHash:e7bac3a,CLOUDID:c1adae7c5687f867d1292bb62987d799,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:3|15|50,E
	DM:1,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ee331c96745011f1aa26b74ffac11d73-20260630
X-User: xieyi@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xieyi@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1092236095; Tue, 30 Jun 2026 14:57:16 +0800
From: Yi Xie <xieyi@kylinos.cn>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yi Xie <xieyi@kylinos.cn>
Subject: [PATCH] io_uring/memmap: return PTR_ERR() from get_unmapped_area()
Date: Tue, 30 Jun 2026 14:57:00 +0800
Message-Id: <20260630065700.97360-1-xieyi@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use PTR_ERR() on validate failure, like io_uring_mmap().

Signed-off-by: Yi Xie <xieyi@kylinos.cn>
---
 io_uring/memmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/memmap.c b/io_uring/memmap.c
index da1f6c5d07f8..23e8a85111bc 100644
--- a/io_uring/memmap.c
+++ b/io_uring/memmap.c
@@ -337,7 +337,7 @@ unsigned long io_uring_get_unmapped_area(struct file *filp, unsigned long addr,
 
 	ptr = io_uring_validate_mmap_request(filp, pgoff);
 	if (IS_ERR(ptr))
-		return -ENOMEM;
+		return PTR_ERR(ptr);
 
 	/*
 	 * Some architectures have strong cache aliasing requirements.
-- 
2.25.1

