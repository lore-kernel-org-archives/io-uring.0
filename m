Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8C33B442B
	for <io-uring@vger.kernel.org>; Mon, 17 Aug 2026 08:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786955337; cv=none; b=WX40udnWlSc6F8Zav3YyXJp78dCf92F5lgWfkm+LRYcQOnHdhgmXxbxkYcNzgARddiOfiu3M5nqCnbV2R+uR4LSYy7LwT9EIbn7OkRNwzL1KS86d3vdo/1lGmFBUtNYLWCT2UiC3cWvtSl7DgaNFUL9iezTJl2+Fv3OFnAG9KbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786955337; c=relaxed/simple;
	bh=b3l8KIK5UNz4UAmgpBwB5g5BAxZXm5OFPNc3szoeSl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LVnrf1fiIop4xulGkkVFcx2IOYejfcTVoX9GdJHkhzg2rQB8OUaHDovbCkY3u+KG/q4g4/JmogwgbgmhUUX+zEBXQ4IJAsgRPvGH/Ec4irGbgz9b2cC/KLAuNsKThxQjwHSWRf36MlDVUaEPMiA+SXJXubRpPYBoqToe3mq15Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=fgsjSQFJ; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fgsjSQFJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=RtP5PQjEN9H2f1Heg1oF2HikcTJ0qrJD80RUCwZ8Tac=; b=fgsjSQFJvEe+F1SSsXtCorpTm1
	lyQQuIzm7BJd+WWe+StiqB+594UyTKkN7OD1W3MH5wp60//zhN8U4EX1i1tgfh68fGdpxs+7jLRMY
	L/r2q7oBgcy0BqO1IvpAhk1yQ2/cZFMMswMbd1WUVCmPpXKpqnBsecrjaRcDKOSSkvHOShi+LNfXZ
	5plr7eMTOA1tluMIrLeyH6RzQGKvHpYdRjCCceX608hC2z6yg+/x9TEJigffDUumwnwqjOKhm+AbL
	Tj7jFJ2QtceeUSu6zo0dvWhEmG/NEWc4bH0Q8D0kqooqAhCe4ce5nv2ZCwwnAl3Yz28SSVtdsmLqg
	U9UWAqGA==;
Received: from 2a02-8389-2301-9f00-d9b3-9099-237f-e1a3.cable.dynamic.v6.surfer.at ([2a02:8389:2301:9f00:d9b3:9099:237f:e1a3] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsiF-00000005h1W-18rX;
	Mon, 17 Aug 2026 08:28:55 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	io-uring@vger.kernel.org
Subject: [PATCH 5/5] test: add zone_reset_all command test
Date: Mon, 17 Aug 2026 10:28:32 +0200
Message-ID: <20260817082837.762276-6-hch@lst.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260817082837.762276-1-hch@lst.de>
References: <20260817082837.762276-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Basic sanity checking for the zone_reset_all command, mostly taken from
the discard test.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 test/Makefile             |   1 +
 test/cmd-zone-reset-all.c | 164 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 165 insertions(+)
 create mode 100644 test/cmd-zone-reset-all.c

diff --git a/test/Makefile b/test/Makefile
index d88a428774cc..8b276817d33c 100644
--- a/test/Makefile
+++ b/test/Makefile
@@ -90,6 +90,7 @@ test_srcs := \
 	connect-rep.c \
 	coredump.c \
 	cmd-discard.c \
+	cmd-zone-reset-all.c \
 	cq-full.c \
 	cq-overflow.c \
 	cq-peek-batch.c \
diff --git a/test/cmd-zone-reset-all.c b/test/cmd-zone-reset-all.c
new file mode 100644
index 000000000000..5d8fe4d5f380
--- /dev/null
+++ b/test/cmd-zone-reset-all.c
@@ -0,0 +1,164 @@
+/* SPDX-License-Identifier: MIT */
+
+#include <stdio.h>
+#include <assert.h>
+#include <string.h>
+#include <unistd.h>
+#include <stdlib.h>
+#include <sys/ioctl.h>
+#include <linux/fs.h>
+
+#include "liburing.h"
+#include "helpers.h"
+
+static const char *filename;
+
+static int queue_zone_reset_all(struct io_uring *ring, int bdev_fd)
+{
+	struct io_uring_sqe *sqe;
+	struct io_uring_cqe *cqe;
+	int err;
+
+	sqe = io_uring_get_sqe(ring);
+	assert(sqe != NULL);
+	io_uring_prep_cmd_zone_reset_all(sqe, bdev_fd);
+
+	err = io_uring_submit_and_wait(ring, 1);
+	if (err != 1) {
+		fprintf(stderr, "io_uring_submit_and_wait failed %d\n", err);
+		exit(1);
+	}
+
+	err = io_uring_wait_cqe(ring, &cqe);
+	if (err) {
+		fprintf(stderr, "io_uring_wait_cqe failed %d\n", err);
+		exit(1);
+	}
+
+	err = cqe->res;
+	io_uring_cqe_seen(ring, cqe);
+	return err;
+}
+
+
+static int basic_cmd_test(struct io_uring *ring)
+{
+	int ret, fd;
+
+	fd = open(filename, O_DIRECT | O_RDWR | O_EXCL);
+	if (fd < 0) {
+		if (errno == EINVAL || errno == EBUSY)
+			return T_EXIT_SKIP;
+		fprintf(stderr, "open failed %i\n", errno);
+		return T_EXIT_FAIL;
+	}
+
+	ret = queue_zone_reset_all(ring, fd);
+	if (ret) {
+		if (ret == -EINVAL || ret == -EOPNOTSUPP) {
+			printf("cmd not supported, skip\n");
+			ret = T_EXIT_SKIP;
+		} else {
+			fprintf(stderr, "cmd_issue_verify fail ret %i\n", ret);
+			fprintf(stderr, "cmd fail\n");
+			ret = T_EXIT_FAIL;
+		}
+	}
+
+	close(fd);
+	return ret;
+}
+
+static int test_rdonly(struct io_uring *ring)
+{
+	int ret, fd;
+	int ro;
+
+	fd = open(filename, O_DIRECT | O_RDONLY | O_EXCL);
+	if (fd < 0) {
+		if (errno == EINVAL || errno == EBUSY)
+			return T_EXIT_SKIP;
+		fprintf(stderr, "open failed %i\n", errno);
+		return T_EXIT_FAIL;
+	}
+
+	ret = queue_zone_reset_all(ring, fd);
+	if (ret >= 0) {
+		fprintf(stderr, "discarded with O_RDONLY %i\n", ret);
+		return 1;
+	}
+	close(fd);
+
+	fd = open(filename, O_DIRECT | O_RDWR | O_EXCL);
+	if (fd < 0) {
+		if (errno == EINVAL || errno == EBUSY)
+			return T_EXIT_SKIP;
+		fprintf(stderr, "open failed %i\n", errno);
+		return T_EXIT_FAIL;
+	}
+
+	ro = 1;
+	ret = ioctl(fd, BLKROSET, &ro);
+	if (ret) {
+		fprintf(stderr, "BLKROSET 1 failed %i\n", errno);
+		return T_EXIT_FAIL;
+	}
+
+	ret = queue_zone_reset_all(ring, fd);
+	if (ret >= 0) {
+		fprintf(stderr, "discarded with O_RDONLY %i\n", ret);
+		return 1;
+	}
+
+	ro = 0;
+	ret = ioctl(fd, BLKROSET, &ro);
+	if (ret) {
+		fprintf(stderr, "BLKROSET 0 failed %i\n", errno);
+		return T_EXIT_FAIL;
+	}
+	close(fd);
+	return 0;
+}
+
+int main(int argc, char *argv[])
+{
+	struct io_uring ring;
+	int fd, ret;
+
+	if (argc != 2)
+		return T_EXIT_SKIP;
+	filename = argv[1];
+
+	fd = open(filename, O_DIRECT | O_RDONLY | O_EXCL);
+	if (fd < 0) {
+		if (errno == EINVAL || errno == EBUSY)
+			return T_EXIT_SKIP;
+		fprintf(stderr, "open failed %i\n", errno);
+		return T_EXIT_FAIL;
+	}
+	close(fd);
+
+	ret = io_uring_queue_init(16, &ring, 0);
+	if (ret) {
+		fprintf(stderr, "queue init failed: %d\n", ret);
+		return T_EXIT_FAIL;
+	}
+
+	ret = basic_cmd_test(&ring);
+	if (ret == T_EXIT_FAIL) {
+		fprintf(stderr, "basic_cmd_test() failed\n");
+		return T_EXIT_FAIL;
+	}
+
+	ret = test_rdonly(&ring);
+	if (ret == T_EXIT_FAIL) {
+		fprintf(stderr, "test_rdonly() failed\n");
+		return T_EXIT_FAIL;
+	}
+
+	if (ret != T_EXIT_SKIP)
+		ret = T_EXIT_PASS;
+
+	io_uring_queue_exit(&ring);
+	return ret;
+}
-- 
2.53.0

