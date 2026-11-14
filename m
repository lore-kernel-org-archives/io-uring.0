Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640990;
	b=npLbfmJ8R9tkDDasZP++HZ0aKMcdfqBEDKcfCOjpAdNTzZmuMXr97DBe/y3Tr/oAkhmY
	 Y6E0dpFUOuOGNtseX6u1FmqPnlPl2Q3U31b/Q2QhQqO2z2vWasCRU86YN/0B6kqAzOMfJ
	 dfJY90k+LMSybnjZ4aV5AEWwiyJ+wRcdXLeb6173WaPTdtGc9RgQSrkrlLR099BBBfhoy
	 9zCZEtRUnjHhj4TcaNuQcdz/pd5FD4YTFj3CaBxbKn0r07wDTjZNTtt71VrxkEkh5Fx0k
	 nGb0pgFCA2QrPeMZlSZpQkjdiEYphV7cdF/852yBN4SLX4Omnbn9B89/+y5Va1fut/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640990;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:Sender:
	 X-CM-SenderInfo;
	bh=PE2vcSjA7Mv5Ct7BvZ2z2dKaKFdTVk5z2ceRmUHCD84=;
	b=177K8vKQwQmBGbnnbbX9YuGWI2Xwbpb7Uuj1Ye4gMl6ar+H/CEzi3XNcBB4/k/zxqcuG
	 tayehGWXv+lKAxQocQM2Pi9LOVMqkQVK9gRiMtd3nIo8Bfkz73RAiqyFsHK6DZTpDdn/I
	 srsO++OnftwEcVWOXbnpHlUmZ3Uha/aqCDVhomqIp3BW4j5I8YyLPEp00E/YB0nK8c5mO
	 FPRYAp1H5NuK3QWZ8ilQIXfUBUOZRIGTKB/UIidBRzBERvElyX7f2Rkk6i6ikNpEvHDjF
	 qsO++VZmu9/Mlhg/Wwqi/jBrt28D1F+fxcfGhLxQlD6fe7Txu+J2K9MI+joAaQggMQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="immGsIZ/";
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6941606A331
	for <io-uring@vger.kernel.org>; Sat, 14 Nov 2026 07:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6941606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=immGsIZ/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=PE
	2vcSjA7Mv5Ct7BvZ2z2dKaKFdTVk5z2ceRmUHCD84=; b=immGsIZ/NHyBDnpKd4
	Rtax6HXExuEK7lvBnnPeMAFPcHWiaAxWR2F1p6uyTvNK/VhlcUj1DFWbeOu8J/jX
	TUWaMFdugv3k0D1b5TFCxXvZtgBSDL173nuX/0wi31rTtyVcS0w7glxyk0RUfrlF
	L0r3VaGomX/MitNrxJ1VmEpFg=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3v9tIDPhqC2tdHA--.18420S4;
	Sat, 14 Nov 2026 15:22:51 +0800 (CST)
From: Yang Xiuwei <yangxiuwei@kylinos.cn>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	Yang Xiuwei <yangxiuwei@kylinos.cn>
Subject: [PATCH 2/2] io_uring/rw: fail soft links on IOPOLL short or error IO
Date: Sat, 14 Nov 2026 15:22:46 +0800
Message-Id: <20261114072246.741950-3-yangxiuwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261114072246.741950-1-yangxiuwei@kylinos.cn>
References: <20261114072246.741950-1-yangxiuwei@kylinos.cn>
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
X-CM-TRANSID:_____wD3v9tIDPhqC2tdHA--.18420S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFyDuw43Zr1UXFy8uFyfZwb_yoWDurc_GF
	Z7Zr1xZw1jvanFyF4UCr4jvF17Z3sI9F4j9F97JFWxGFWUXasxCrWkAF9F9F4DAw1DuFyD
	GF4kW3WftrnxZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8zT5PUUUUU==
Sender: yangxiuwei2025@163.com
X-CM-SenderInfo: p1dqw55lxzvxisqskqqrwthudrp/xtbC6Qvtfmr4DEt7jwAA3Q

io_complete_rw_iopoll() updates cqe.res when the transfer does not
match the requested length, but it does not call req_set_fail().
Soft linked requests then still run after a short or failed IOPOLL
read or write.

Fixes: b66ceaf324b3 ("io_uring: move iopoll reissue into regular IO path")
Signed-off-by: Yang Xiuwei <yangxiuwei@kylinos.cn>
---
 io_uring/rw.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/io_uring/rw.c b/io_uring/rw.c
index 3a8559ff4dc6..cf20597ba6a8 100644
--- a/io_uring/rw.c
+++ b/io_uring/rw.c
@@ -606,8 +606,10 @@ static void io_complete_rw_iopoll(struct kiocb *kiocb, long res)
 
 	if (res == -EAGAIN && io_rw_should_reissue(req))
 		req->flags |= REQ_F_REISSUE | REQ_F_BL_NO_RECYCLE;
-	else if (unlikely(final_res != req->cqe.res))
+	else if (unlikely(final_res != req->cqe.res)) {
+		req_set_fail(req);
 		req->cqe.res = final_res;
+	}
 
 	/* order with io_iopoll_complete() checking ->iopoll_completed */
 	smp_store_release(&req->iopoll_completed, 1);
-- 
2.25.1

