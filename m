Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5B31F09AD
	for <io-uring@vger.kernel.org>; Tue, 10 Feb 2026 02:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770690895; cv=none; b=Pg8XUhH9CL4OwCXL6oHp3X28Rn+BvRYFrIcVhswOnTpwcfOjZ2jiPvzkRLpMR/xjGgZjFYln+qw6fsR+e8dEj6KJ7Q58lWMCf+Hsl85gKaC0eFP441Ydr84YQY9JxICz8tvvhXiH64+HrIHwXKmrlgPImDrI6IRadMXzq4msP1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770690895; c=relaxed/simple;
	bh=7TSB/rnPAWIN3Sh7VeXKzsDWiezMSUMr9LBFBZ1MbcA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dpbwcO7MEDKvcWJExvurK+QBXPN66d67xjB/6ZIt8uZMNNKRWKNDLi1au3bsr39EHu2DbyEVs6OZP0KG2F9liXGUsxqgx08VIpUINN/HNcjaz/Qp/Hl63htGeQ265g4PYz33SNUdcEq2mvxnLslAEtKuHhS+fKNrUIg+owbNa/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=KixmGp9P; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="KixmGp9P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=yp
	qZlR38IH7KqfLP0fnH/nzCs4xCkgYZE3qWbq6i53o=; b=KixmGp9PlxZr9WR3nK
	Xb0RbrCsJLk5A6j/0mVWyzUovTwJjs3KOF50B5YsvOIBgL7LU2yPqInAYkLr4vVG
	42CxUfE0lsRJSrFdfAX6VtKzyy0ibfEzmW4q1RnlRCxg57UT1pCoIoIQXgKti3Su
	UVC2j0yE481wcd5iuwb3cl8nM=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wCnu1k5mYpp_G36Kg--.1801S2;
	Tue, 10 Feb 2026 10:34:35 +0800 (CST)
From: Yang Xiuwei <yangxiuwei@kylinos.cn>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	Yang Xiuwei <yangxiuwei@kylinos.cn>
Subject: [PATCH v2 1/1] io_uring/tctx: avoid modifying loop variable in io_ring_add_registered_file
Date: Tue, 10 Feb 2026 10:34:32 +0800
Message-Id: <20260210023432.1874130-1-yangxiuwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCnu1k5mYpp_G36Kg--.1801S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ur4xZw13CFyfKw1DCw1fCrg_yoW8Gr47pF
	ykK345try0vry8WFs5GF4Uua4vqa1kGF48Z3yUuw1DAa47ur1UtFs0kFyFg3WjqrZ7AFya
	vws0q39xZF1UAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uymh7UUUUU=
Sender: yangxiuwei2025@163.com
X-CM-SenderInfo: p1dqw55lxzvxisqskqqrwthudrp/xtbCwhtxAmmKmTuAIgAA3J

Use a separate 'idx' variable to store the result of array_index_nospec()
instead of modifying the loop variable 'offset' directly. This improves
code clarity by separating the logical index from the sanitized index
used for array access.

No functional change intended.

Signed-off-by: Yang Xiuwei <yangxiuwei@kylinos.cn>

---

Changes in v2:
  - Updated commit message to code cleanup instead of bug fix
  - Link to v1: https://lore.kernel.org/all/20260209061919.425074-1-yangxiuwei@kylinos.cn/
  
 io_uring/tctx.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/io_uring/tctx.c b/io_uring/tctx.c
index 6d6f44215ec8..fae99cc63961 100644
--- a/io_uring/tctx.c
+++ b/io_uring/tctx.c
@@ -221,14 +221,14 @@ void io_uring_unreg_ringfd(void)
 int io_ring_add_registered_file(struct io_uring_task *tctx, struct file *file,
 				     int start, int end)
 {
-	int offset;
+	int offset, idx;
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

