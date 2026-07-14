Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D0438A733;
	Tue, 14 Jul 2026 03:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783998217; cv=none; b=b5Kv54iWBTTfrimzXkRqT51VYNmK3eiw98zyhOka20U/FZxTPI07MPwWDKKRdhSpNNtZSP5SyrDFozGIfXAj5LWYXvPiABs02VXj9KN3GF+sCmdcSgEcVup939ycRNfg+ch30b1dl3m70KO2Z2CBFe6yRJ9+VM/a4vIQW2MqGMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783998217; c=relaxed/simple;
	bh=H1qi4xDYu6aZ4SFG2AQm4X0IU0pFHlRWGS3azI1kiBk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AkSBgb2VDoXbjIX5EBjwY2jIJQFjIdPJARwftLdYmYqaLEvXc3Y+Qw0UypAwtqn0t2jtdkKDc4rj0BlDWxcC0vzP9wpsa5JrYMBb65168SmL8oPW+qx4j5Z5/xk08WrhCXJCYZAkJindRDP6Sqj23AL3h1JlS/3+ucCbZEyAQx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 94aff3207f3011f1aa26b74ffac11d73-20260714
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:14165b17-f75b-4358-ad47-1e07aef114be,IP:0,U
	RL:0,TC:0,Content:-5,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:569651aee9488dc3ba6054e8b61dd914,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:1,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 94aff3207f3011f1aa26b74ffac11d73-20260714
X-User: xieyi@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xieyi@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 824532912; Tue, 14 Jul 2026 11:03:25 +0800
From: Yi Xie <xieyi@kylinos.cn>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yi Xie <xieyi@kylinos.cn>
Subject: [PATCH 1/5] io_uring/fs: check unused sqe fields for unlinkat
Date: Tue, 14 Jul 2026 11:03:06 +0800
Message-Id: <20260714030306.64820-1-xieyi@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Zero check unused SQE fields addr3 and pad2 for unlinkat. They're
not needed now, but could be used sometime in the future.

Signed-off-by: Yi Xie <xieyi@kylinos.cn>
---
 io_uring/fs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/io_uring/fs.c b/io_uring/fs.c
index d0580c754bf8..26ea841a22e7 100644
--- a/io_uring/fs.c
+++ b/io_uring/fs.c
@@ -110,7 +110,8 @@ int io_unlinkat_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	const char __user *fname;
 	int err;
 
-	if (sqe->off || sqe->len || sqe->buf_index || sqe->splice_fd_in)
+	if (sqe->off || sqe->len || sqe->buf_index || sqe->splice_fd_in ||
+	    sqe->addr3 || sqe->__pad2[0])
 		return -EINVAL;
 	if (unlikely(req->flags & REQ_F_FIXED_FILE))
 		return -EBADF;
-- 
2.25.1

