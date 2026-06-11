Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7341BBBFC
	for <io-uring@vger.kernel.org>; Thu, 11 Jun 2026 01:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781141355; cv=none; b=kNpk4ml195WQ61TGAsgTS/1RrjDRQ6nEyznOV2Q/Bah5c6H7aA//Dz93CPzLBh33kPlKc2U7bwZxfVyMbLimx3Jw1X1JkF52GqHasom67DU35vn3d2Fc80FOC/ivatNo4KTJ62W8gAKmVXJQP8UEPct9NbkZM0Se/PtfxFFm0OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781141355; c=relaxed/simple;
	bh=C0vCpGOm7ebYpx7k++gsHozpcOhsZpUIG7TqezHULog=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aYmSw4/Lp1N1jaRc1LO4WUuBxO4d0SHcN/0cioObQTGgXkl9wh+2R9XOYa4NtQj2GPgVcP4otGEvs59Igbj5bimF6Gz4F+zEvly79Pc/gUrAQyQjRBIjhuZO4ZVf34z8oZMjB12dUBTpCC2X6T+g66/3E8A2ecSY5ootrxFTJic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=kyiSBNUS; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="kyiSBNUS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=wa
	EvaZAaMR2EcpDuKO1IfuREb9jUL8FAfNQ+D0FIaFQ=; b=kyiSBNUScscgVXvJ7e
	EgAeDh/kvN+yPOxtn7IH7PVtkb87BEikpcQsZGBB2mvCCNNYDesHPAZT5uYZPJ41
	ZoVG7tKp9SGObQEa7x34BjQdCbD+4pdQyOFfyN0Bbm9+GlS/77Pc87nw7ZQltvnC
	Y9uZqr+C2ZR94QeTDnRsZQZAY=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgCHMwNIDypqb8GyBg--.27485S3;
	Thu, 11 Jun 2026 09:28:41 +0800 (CST)
From: Yang Xiuwei <yangxiuwei@kylinos.cn>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	Yang Xiuwei <yangxiuwei@kylinos.cn>
Subject: [PATCH 1/2] test/link-timeout: add natural disarm chain with short pipe read
Date: Thu, 11 Jun 2026 09:28:36 +0800
Message-Id: <20260611012837.3032351-2-yangxiuwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260611012837.3032351-1-yangxiuwei@kylinos.cn>
References: <20260611012837.3032351-1-yangxiuwei@kylinos.cn>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgCHMwNIDypqb8GyBg--.27485S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw1ruryDXw43GF4UCryUWrg_yoW5Wr15pr
	4a9398GrW8AF12ga43trWDZr9Yvw4Iya17GF97Can5ArsrAF9xWrW0gFy8KanxJrZ7t34a
	qFs3tF4j9r1DJ3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UuSoXUUUUU=
Sender: yangxiuwei2025@163.com
X-CM-SenderInfo: p1dqw55lxzvxisqskqqrwthudrp/xtbC6Qn6i2oqD0nNxQAA3f

Add a test for read -> link timeout -> nop where the read completes
with a short pipe read, the link timeout is naturally disarmed with
-ECANCELED, and the linked nop still completes successfully.

Requires the kernel fix for short pipe read completion.

Signed-off-by: Yang Xiuwei <yangxiuwei@kylinos.cn>
---
 test/link-timeout.c | 102 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/test/link-timeout.c b/test/link-timeout.c
index 0e91604f..07856ff3 100644
--- a/test/link-timeout.c
+++ b/test/link-timeout.c
@@ -671,6 +671,103 @@ err:
 	return 1;
 }
 
+/*
+ * Test short pipe read that naturally disarms a link timeout
+ */
+static int test_link_timeout_natural_disarm_chain(struct io_uring *ring)
+{
+	struct __kernel_timespec ts;
+	struct io_uring_cqe *cqe;
+	struct io_uring_sqe *sqe;
+	int fds[2], ret, i;
+	struct iovec iov;
+	char buffer[128];
+	char byte = 'x';
+
+	if (pipe(fds)) {
+		perror("pipe");
+		return 1;
+	}
+
+	sqe = io_uring_get_sqe(ring);
+	if (!sqe) {
+		printf("get sqe failed\n");
+		goto err;
+	}
+
+	iov.iov_base = buffer;
+	iov.iov_len = sizeof(buffer);
+	io_uring_prep_readv(sqe, fds[0], &iov, 1, 0);
+	sqe->flags |= IOSQE_IO_LINK;
+	sqe->user_data = 1;
+
+	sqe = io_uring_get_sqe(ring);
+	if (!sqe) {
+		printf("get sqe failed\n");
+		goto err;
+	}
+
+	ts.tv_sec = 3600;
+	ts.tv_nsec = 0;
+	io_uring_prep_link_timeout(sqe, &ts, 0);
+	sqe->flags |= IOSQE_IO_LINK;
+	sqe->user_data = 2;
+
+	sqe = io_uring_get_sqe(ring);
+	if (!sqe) {
+		printf("get sqe failed\n");
+		goto err;
+	}
+	io_uring_prep_nop(sqe);
+	sqe->user_data = 3;
+
+	ret = io_uring_submit(ring);
+	if (ret != 3) {
+		printf("sqe submit failed: %d\n", ret);
+		goto err;
+	}
+
+	if (write(fds[1], &byte, 1) != 1) {
+		perror("write");
+		goto err;
+	}
+
+	for (i = 0; i < 3; i++) {
+		ret = io_uring_wait_cqe(ring, &cqe);
+		if (ret < 0) {
+			printf("wait completion %d\n", ret);
+			goto err;
+		}
+		switch (cqe->user_data) {
+		case 1:
+			if (cqe->res != 1) {
+				fprintf(stderr, "Read got %d, wanted 1\n", cqe->res);
+				goto err;
+			}
+			break;
+		case 2:
+			if (cqe->res != -ECANCELED) {
+				fprintf(stderr, "Link timeout got %d, wanted -ECANCELED\n",
+					cqe->res);
+				goto err;
+			}
+			break;
+		case 3:
+			if (cqe->res) {
+				fprintf(stderr, "Req %" PRIu64 " got %d\n",
+					(uint64_t) cqe->user_data, cqe->res);
+				goto err;
+			}
+			break;
+		}
+		io_uring_cqe_seen(ring, cqe);
+	}
+
+	return 0;
+err:
+	return 1;
+}
+
 static int test_timeout_link_chain1(struct io_uring *ring)
 {
 	struct __kernel_timespec ts;
@@ -1262,6 +1359,11 @@ int main(int argc, char *argv[])
 		return ret;
 	}
 
+	ret = test_link_timeout_natural_disarm_chain(&ring);
+	if (ret) {
+		printf("test_link_timeout_natural_disarm_chain failed\n");
+		return ret;
+	}
 
 	return T_EXIT_PASS;
 }
-- 
2.25.1

