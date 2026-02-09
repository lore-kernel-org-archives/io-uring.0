Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CEF2288CB
	for <io-uring@vger.kernel.org>; Mon,  9 Feb 2026 06:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770617974; cv=none; b=LjcZkK1vCLdukm91QjaI7BuH/2pvlNAUnXYzVzZ0eGvOZpUYzA8AqIqBk3bRq2qlIYdwm47+5QI5MvfFuzTZHrvxBMf2q8vELxKlHLxaUWNYTu0c/LNjhtX32hq3XyP2SioLJB9e96GClr1Vzeex7z9r5hnyIYszYMnKKVhe4Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770617974; c=relaxed/simple;
	bh=xEgGdCPR38NYeWIVkY4v/m9SAZnDClLf0Mfhe80yws4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k7wN9KOd52vQ371fLTTFs93YnJUbo7/RWQYNhL1j4EeDHKhrcwsT8hvizNY3uRlaMlWUeYBmbS2WAhDnKn7c/YlZq4V0WLuQHteFPBRnb6j178pZo/HnVv5mvenBriaHhAOuIPvMrM+ei1I3LrUJO5H3evvcq/9xnsItXDEGjB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=lQ6LPwKO; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="lQ6LPwKO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=3r
	em51lKpQCetP6zJVHM4RQh7Y1csaDqp3cvsoPG0IU=; b=lQ6LPwKO8aq1bZmHbJ
	S3bUNAejv5q8gTx13/Lr+UBnVo7SiTFp7SoIq0GTYrr85BAi63wIZTaSzxnpryaM
	G0Et+ieGmSUSa25BSK01dfh3oDIh8/EV8/6zGdUqfVCm7pOjLdAX0Orc0Yu6SuMA
	m/ny6QawPTSUf32AvB2GiLOFY=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wA3qJRpfIlpouh2Kg--.2598S2;
	Mon, 09 Feb 2026 14:19:23 +0800 (CST)
From: Yang Xiuwei <yangxiuwei@kylinos.cn>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	Yang Xiuwei <yangxiuwei@kylinos.cn>
Subject: [PATCH] io_uring/tctx: prevent loop variable modification
Date: Mon,  9 Feb 2026 14:19:19 +0800
Message-Id: <20260209061919.425074-1-yangxiuwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wA3qJRpfIlpouh2Kg--.2598S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw4DJr1DZFy5Ar15Kr4Uurg_yoWDWrXEq3
	4vqFyDZwsxur48C34kCr1I939Fya1xCr4fWrWfAw1j9F1fJws2k3s7Zr9YyFyDJa17ur9x
	K3s0ga4fAF1UujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbwvKUUUUUU==
Sender: yangxiuwei2025@163.com
X-CM-SenderInfo: p1dqw55lxzvxisqskqqrwthudrp/xtbC6gv1hmmJfGsvWQAA3T

Modifying the loop variable with array_index_nospec() can skip indices
and cause an infinite loop when end > IO_RINGFD_REG_MAX and all slots
are occupied.

Use a separate 'idx' variable instead.

Signed-off-by: Yang Xiuwei <yangxiuwei@kylinos.cn>

diff --git a/io_uring/tctx.c b/io_uring/tctx.c
index 6d6f44215ec8..fcf79df923a0 100644
--- a/io_uring/tctx.c
+++ b/io_uring/tctx.c
@@ -221,14 +221,15 @@ void io_uring_unreg_ringfd(void)
 int io_ring_add_registered_file(struct io_uring_task *tctx, struct file *file,
 				     int start, int end)
 {
-	int offset;
+	int offset, idx;
+
 	for (offset = start; offset < end; offset++) {
-		offset = array_index_nospec(offset, IO_RINGFD_REG_MAX);
-		if (tctx->registered_rings[offset])
+		idx = array_index_nospec(offset, IO_RINGFD_REG_MAX);
+		if (tctx->registered_rings[idx])
 			continue;
 
-		tctx->registered_rings[offset] = file;
-		return offset;
+		tctx->registered_rings[idx] = file;
+		return idx;
 	}
 	return -EBUSY;
 }
-- 
2.25.1

