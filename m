Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC6D42E8C6
	for <io-uring@vger.kernel.org>; Thu,  2 Jul 2026 08:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782981024; cv=none; b=rqEB0l8IieOY1dnZBC/kfLuVu5B98J/ozkGOCbAGjBPpSpBy9Ny08uHbb9RwWunhC/DEmAd33Kq1AiwtLanZX8hAX/zJGTMhrv23SJH1e6AwFTJ3woS8mQs+hO475pvAA9bfFQGRbCiMGdp5GjNTTi2/N0/T8a94eaFmCbrk5qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782981024; c=relaxed/simple;
	bh=qU7JJNowmE4a/6g2mr5x1OlJRPHXeQFxjm3O/sOquxs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GT9PM4l3oi0Nrlmu0UoIsACqE7igJnR4NERevPKqgDSZsuZCM/teFqkZeu7myZzBNsh5ltDLNqsjorbSlemNKiql7Seb2A7SwGOIevDL74CxIbogRBcXfnwgbVI0KQGOxSF3BCBHriVynxo3tPiNwKe+/Euz5QErr8XVDMZUNgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=WTh9Qtwo; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="WTh9Qtwo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=9n
	Ut1mkCSIQxa8hbS4yDLq4pxlNweeINSOSmAbxh0ts=; b=WTh9Qtwod/XqayS+Ep
	+2JyCZVbxIPLDLjZkt3Gjf7q0cP47/Esdp43uLuR2PPco74GZM6XaTI6GrtIwBN0
	UWtj2FFWyBP4AahdsO0HpArlwy0mu892H9MN2+U/qjDCUE0RcVsQjuE0G0yhE937
	miX8aoXjOSTWKUe8Sangja31I=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDnH0R0IUZqmPUCHA--.22854S3;
	Thu, 02 Jul 2026 16:29:44 +0800 (CST)
From: Yang Xiuwei <yangxiuwei@kylinos.cn>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	Yang Xiuwei <yangxiuwei@kylinos.cn>
Subject: [PATCH 1/2] io_uring/uring_cmd: copy SQE before issue_blocking punt
Date: Thu,  2 Jul 2026 16:29:36 +0800
Message-Id: <20260702082937.3707134-2-yangxiuwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260702082937.3707134-1-yangxiuwei@kylinos.cn>
References: <20260702082937.3707134-1-yangxiuwei@kylinos.cn>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnH0R0IUZqmPUCHA--.22854S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrtw13Kry8XrWfZrykXFW8JFb_yoW3Crb_Cr
	Z8J348uFWfJrWUZr9rG340qr4Fkw47AFWjvrn3GryUGFy7Ca4kG3yDZr45tFnIg3ZrtFy5
	JFZ8Ww13GrnxtjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjOzV5UUUUU==
Sender: yangxiuwei2025@163.com
X-CM-SenderInfo: p1dqw55lxzvxisqskqqrwthudrp/xtbCwRiSI2pGIXgS8gAA39

io_uring_cmd_issue_blocking() punts to io-wq without copying the SQE
off the submission queue, unlike the -EAGAIN and fallback paths. Copy
the SQE into async data before queuing the work.

Signed-off-by: Yang Xiuwei <yangxiuwei@kylinos.cn>
---
 io_uring/uring_cmd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
index 7b25dcd9d05f..fe32311b2e51 100644
--- a/io_uring/uring_cmd.c
+++ b/io_uring/uring_cmd.c
@@ -326,6 +326,10 @@ void io_uring_cmd_issue_blocking(struct io_uring_cmd *ioucmd)
 {
 	struct io_kiocb *req = cmd_to_io_kiocb(ioucmd);
 
+	if (!(req->flags & REQ_F_SQE_COPIED)) {
+		io_uring_cmd_sqe_copy(req);
+		req->flags |= REQ_F_SQE_COPIED;
+	}
 	io_req_queue_iowq(req);
 }
 
-- 
2.25.1

