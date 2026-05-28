Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90ED61C5D7D
	for <io-uring@vger.kernel.org>; Thu, 28 May 2026 02:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779936615; cv=none; b=XX/o53/2pUvBEfx4NaiN5XEYVq1W/AOdwAmCi74DyYw0Ow1QnQh5lpGp7hjgiTRupKl6Zxcr8PslPCbZMadbcR63VPVI3UEy24lo5Za42ppWFyfLpNMo01zyAMgVZZK5aVybh+ZvmuTovxBZdFhya44PmV7/q7g0h15TcyN6lg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779936615; c=relaxed/simple;
	bh=tApAn1aUOsMAi08LcAWr9lb/1VjWBsRrIUXqqnjGA4g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZiIwLUhg1DIjtzyB0jCG/1Y4jNmHCb/yJupSO9b0WrMffhTuHS4h9C7ng48qOVbqCHTUlEnvpR+1AKaGU1qUa9KgP04p6vib3ayQS6TH5O6WMmWMVy1TZ1oEWK3mLxMmTTbWQPs+GksjabGIP6rR+cfTzNvpwRxRgi5Nghjg0Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=fxKFfvFN; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="fxKFfvFN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=n0
	VFV6+8BS6YC7tvI3qiiIv7WZCl/gmMuuEbkPAYPis=; b=fxKFfvFNPBFK7Ys9t7
	0nn5h0Eam1BUbfeiEb1WjORdGZ5/EllNO6AzCxz3WYtjvHRFX6Al9Vh5xHSuE3yf
	lQmsjmspP3v6HZY897sZQ+zmhrIFkUT2LFa8PBhVlYvq+bBH4HUf8jBtamcNrYNi
	/SC49jETGs0WUGVlo/uU+8c+o=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wBXwflCrRdqOqMKAA--.1484S2;
	Thu, 28 May 2026 10:49:40 +0800 (CST)
From: dayou5941@163.com
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	liyouhong@kylinos.cn
Subject: [PATCH] io_uring/kbuf: align legacy buffer add limit with MAX_BIDS_PER_BGID
Date: Thu, 28 May 2026 10:49:36 +0800
Message-Id: <20260528024936.3672659-1-dayou5941@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBXwflCrRdqOqMKAA--.1484S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKr4fWrWDArWUGFW8AFyDtrb_yoWkuFb_uF
	Z7ArykXanFqr4Svw1jg348ZryxZw43JF10g3WYywnFqFW8AwnYgFWDAF9Fy3Z8ZFWDCFWU
	Ganxu3sFyr1I9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbkwIPUUUUU==
X-CM-SenderInfo: 5gd103ivzuiqqrwthudrp/xtbC+gTci2oXrUS98QAA3x

From: liyouhong <liyouhong@kylinos.cn>

io_provide_buffers_prep() accepts nbufs up to MAX_BIDS_PER_BGID, but
io_add_buffers() stops when bl->nbufs reaches USHRT_MAX. This makes the
effective add limit one lower than the validated limit.

Use MAX_BIDS_PER_BGID in the add-side boundary check so validation and
execution use the same limit, and update the comment to refer to the
actual limit constant.

Signed-off-by: liyouhong <liyouhong@kylinos.cn>
---
 io_uring/kbuf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/io_uring/kbuf.c b/io_uring/kbuf.c
index 63061aa1cab9..6a619dee21c1 100644
--- a/io_uring/kbuf.c
+++ b/io_uring/kbuf.c
@@ -541,11 +541,11 @@ static int io_add_buffers(struct io_ring_ctx *ctx, struct io_provide_buf *pbuf,
 
 	for (i = 0; i < pbuf->nbufs; i++) {
 		/*
-		 * Nonsensical to have more than sizeof(bid) buffers in a
+		 * Nonsensical to have more than MAX_BIDS_PER_BGID buffers in a
 		 * buffer list, as the application then has no way of knowing
 		 * which duplicate bid refers to what buffer.
 		 */
-		if (bl->nbufs == USHRT_MAX) {
+		if (bl->nbufs == MAX_BIDS_PER_BGID) {
 			ret = -EOVERFLOW;
 			break;
 		}
-- 
2.25.1

