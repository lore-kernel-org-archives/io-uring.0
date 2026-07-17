Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EED4246784;
	Fri, 17 Jul 2026 02:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784254419; cv=none; b=aWD3b2mlNTrV/ikSCVs9V2ZJKSs5HKTrJkUH9lHXh3pWIsmavS8FbVKZMlgEoDP4jTbaN20vduB29oe3EsNcmcDy++2RrEJJitZw9vcVbtQfhK9H4ZW5VS78THXKGMz9onGE/L04KOtfT20jlf0IysR3IB+Ak0X9FlTYA5CRiFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784254419; c=relaxed/simple;
	bh=m4C3UZun47yAdX1FJKVXjqb1DFaTcWMBfrVoNBoXITA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T+l7DNb7Rs4m80Q84RserJOHyCapdOY5t92y6kHyVBdTb+FAz0NmVHSkJEKYd0R9dTy+ZTy13v2mamXJ0zqnSi8ROBQVMdxEpmjK5B22MlAlwkRKHc5ccmoX2ZdcXJeNSnjQhAQ1XbyOo00/njMYoPFDNRIncTrUbvpNfyG+lk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 198bbe20818511f1aa26b74ffac11d73-20260717
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:cdbb3f8c-5683-4a84-8be2-16caa9839a3e,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:e217b7ad9f0d58f4f2c5ba28cbee24e1,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 198bbe20818511f1aa26b74ffac11d73-20260717
X-User: xieyi@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xieyi@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 553857385; Fri, 17 Jul 2026 10:13:28 +0800
From: Yi Xie <xieyi@kylinos.cn>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yi Xie <xieyi@kylinos.cn>
Subject: [PATCH] io_uring/sync: check unused sqe fields for fallocate
Date: Fri, 17 Jul 2026 10:13:12 +0800
Message-Id: <20260717021312.50558-1-xieyi@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Zero check unused SQE fields addr3 and pad2 for fallocate. They're
not needed now, but could be used sometime in the future.

Signed-off-by: Yi Xie <xieyi@kylinos.cn>
---
 io_uring/sync.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/io_uring/sync.c b/io_uring/sync.c
index c850cbc40606..03fde759deaf 100644
--- a/io_uring/sync.c
+++ b/io_uring/sync.c
@@ -89,7 +89,8 @@ int io_fallocate_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 {
 	struct io_sync *sync = io_kiocb_to_cmd(req, struct io_sync);
 
-	if (sqe->buf_index || sqe->rw_flags || sqe->splice_fd_in)
+	if (sqe->buf_index || sqe->rw_flags || sqe->splice_fd_in ||
+	    sqe->addr3 || sqe->__pad2[0])
 		return -EINVAL;
 
 	sync->off = READ_ONCE(sqe->off);
-- 
2.25.1

