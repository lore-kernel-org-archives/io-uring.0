Received: from out-utut-a192.jellyfish.systems (out-utut-a192.jellyfish.systems [198.177.127.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69D9445AFF
	for <io-uring@vger.kernel.org>; Sat, 19 Sep 2026 12:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.177.127.192
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789819231; cv=none; b=LtWNDkeXjjGV7EL0Hc5ncBidcgs5EMTZi/B5FE8OilTqziYqtN+s8P10xizEzJL81bhVxuWD5eZa9z2k+2xjLREDqEwuKZp+NgPVqTZtQITYEtUF/R44TDprC/cKh9AQLyUE1CADzahQNX4jZfIuhB25RFEUxFbaecPW+a+OVyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789819231; c=relaxed/simple;
	bh=f7+N5Mw41j1FixVmJ3MmZMbK4GIbQEHzQ88FfsA0TCk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OXsmGiKB39DAJPheQ0ZgY4NFvxct8EWO4Q2/F/BHa0aZi96jOnmgZ8G5pNgtHRsQYs9MFHrlugV6B+wX+H8PtK6El0dK2uKFAgXYGlKO1Trq7HDTWKEIVvnxlqnO0Un+2Uc3hU/qQ3R3q7//FykKCvqLwXYT3Qxv7Zljwdjs1ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=RACwx+kQ; arc=none smtp.client-ip=198.177.127.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="RACwx+kQ"
Received: from fedora (unknown [39.144.124.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hn7ND3tw5z8sX2;
	Sat, 19 Sep 2026 12:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1789819214;
	bh=KVsvi7SM4RdXJxPjujXwMMnGGEmu7MIi6djOHkP9z9k=;
	h=From:To:Cc:Subject:Date:From;
	b=RACwx+kQ3SvaWXqSabgSYizhQWJITYQ/9/oCpGQ6IxC1Wbf+CdU/Al403tXO+zu5f
	 5N8ZYzguVUJIowIM3vygW2UMwcVp4e+oz3h0iW63u2BAVC4kitFQs+vyD4iz5TedH0
	 x0C0L5ImVpPghAoXrYBe+UMbZ8VHvgRRcFQbbP7Fwl4vhsGKtgISHCQF5w2ovxAaGQ
	 7c+F9sA/z2t29GXasjGv1w0J11VHzROYk7xgYJ9wg61Nt0d8bgSE5QmsTMLdlCiQPQ
	 xlskg822VHKb6jFTaXrvUqtcaMKedznEntC/28q59rtZimIZ4F3DMANkGsKHtV1Ebb
	 ORqsB93OQ5k8A==
From: Tianyi Chen <hi@tychen.cc>
To: io-uring@vger.kernel.org
Cc: axboe@kernel.dk
Subject: [PATCH liburing] test: cover blocking tty I/O on poll-ready files
Date: Sat, 19 Sep 2026 19:59:48 +0800
Message-ID: <20260919115948.1269869-2-hi@tychen.cc>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: hi@tychen.cc

Exercise a packet-mode tty read with a competing reader, using normal
and registered descriptors, and a write larger than the available tty
buffer. Bound submission latency and release blocked I/O so a regression
fails without leaving the test stuck.

Also check that blocking tty multishot reads complete once, while
O_NONBLOCK tty reads retain multishot behavior.

Link: https://github.com/axboe/liburing/issues/1623

Assisted-by: LLM
Signed-off-by: Tianyi Chen <hi@tychen.cc>
---
 test/Makefile        |   1 +
 test/rw-poll-ready.c | 290 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 291 insertions(+)
 create mode 100644 test/rw-poll-ready.c

diff --git a/test/Makefile b/test/Makefile
index 8b27681..3bf197d 100644
--- a/test/Makefile
+++ b/test/Makefile
@@ -246,6 +246,7 @@ test_srcs := \
 	ring-query.c \
 	rsrc_tags.c \
 	rw_merge_test.c \
+	rw-poll-ready.c \
 	self.c \
 	recvsend_bundle.c \
 	recvsend_bundle-inc.c \
diff --git a/test/rw-poll-ready.c b/test/rw-poll-ready.c
new file mode 100644
index 0000000..da9601a
--- /dev/null
+++ b/test/rw-poll-ready.c
@@ -0,0 +1,290 @@
+/* SPDX-License-Identifier: MIT */
+/* Poll-ready blocking tty reads and writes must not block the submitter. */
+#include <fcntl.h>
+#include <pthread.h>
+#include <sched.h>
+#include <stdatomic.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/ioctl.h>
+#include <sys/resource.h>
+#include <termios.h>
+#include <time.h>
+#include <unistd.h>
+
+#include "liburing.h"
+#include "helpers.h"
+
+struct reader {
+	int fd;
+	atomic_int started;
+	int ret;
+};
+
+static void *consume(void *arg)
+{
+	struct reader *r = arg;
+	char byte;
+
+	setpriority(PRIO_PROCESS, 0, 19);
+	atomic_store(&r->started, 1);
+	r->ret = read(r->fd, &byte, 1);
+	return NULL;
+}
+
+static void *release_readers(void *arg)
+{
+	int fd = *(int *)arg;
+
+	usleep(1000000);
+	if (write(fd, "xx", 2) != 2)
+		perror("release readers");
+	return NULL;
+}
+
+static long elapsed_ms(struct timespec *start, struct timespec *end)
+{
+	return (end->tv_sec - start->tv_sec) * 1000 +
+		(end->tv_nsec - start->tv_nsec) / 1000000;
+}
+
+static int wait_completions(struct io_uring *ring, int len)
+{
+	unsigned int seen = 0;
+	int i;
+
+	for (i = 0; i < 2; i++) {
+		struct __kernel_timespec wait = { .tv_sec = 2 };
+		struct io_uring_cqe *cqe;
+		int ret = io_uring_wait_cqe_timeout(ring, &cqe, &wait);
+
+		if (ret)
+			return T_EXIT_FAIL;
+		if (cqe->user_data == 1) {
+			if (cqe->res > len || (cqe->res < 0 &&
+			    cqe->res != -ECANCELED && cqe->res != -EINTR))
+				return T_EXIT_FAIL;
+		} else if (cqe->user_data != 2 ||
+			   (cqe->res != -ETIME && cqe->res != -ECANCELED &&
+			    cqe->res != -ENOENT)) {
+			return T_EXIT_FAIL;
+		}
+		seen |= 1U << cqe->user_data;
+		io_uring_cqe_seen(ring, cqe);
+	}
+	return seen == 6 ? T_EXIT_PASS : T_EXIT_FAIL;
+}
+
+static int test(int fixed)
+{
+	struct __kernel_timespec timeout = { .tv_nsec = 100000000 };
+	struct io_uring ring;
+	struct io_uring_sqe *sqe;
+	struct timespec start, end;
+	struct reader reader = { .started = 0 };
+	pthread_t consumer, release;
+	char buf[8];
+	int master, slave, one = 1, ret, failed = 0;
+
+	master = posix_openpt(O_RDWR | O_NOCTTY);
+	if (master < 0 || grantpt(master) || unlockpt(master))
+		return T_EXIT_FAIL;
+	slave = open(ptsname(master), O_RDWR | O_NOCTTY);
+	if (slave < 0 || ioctl(master, TIOCPKT, &one))
+		return T_EXIT_FAIL;
+	ret = t_create_ring(8, &ring, 0);
+	if (ret == T_SETUP_SKIP)
+		return T_EXIT_SKIP;
+	if (ret != T_SETUP_OK)
+		return T_EXIT_FAIL;
+	if (fixed && io_uring_register_files(&ring, &master, 1))
+		return T_EXIT_FAIL;
+
+	reader.fd = master;
+	if (pthread_create(&consumer, NULL, consume, &reader))
+		return T_EXIT_FAIL;
+	while (!atomic_load(&reader.started))
+		usleep(1000);
+	/* Let the competing read acquire the tty read lock. */
+	usleep(20000);
+	if (pthread_create(&release, NULL, release_readers, &slave))
+		return T_EXIT_FAIL;
+	if (tcflush(slave, TCIFLUSH))
+		return T_EXIT_FAIL;
+
+	sqe = io_uring_get_sqe(&ring);
+	io_uring_prep_read(sqe, fixed ? 0 : master, buf, sizeof(buf), 0);
+	sqe->flags = IOSQE_IO_LINK | (fixed ? IOSQE_FIXED_FILE : 0);
+	sqe->user_data = 1;
+	sqe = io_uring_get_sqe(&ring);
+	io_uring_prep_link_timeout(sqe, &timeout, 0);
+	sqe->user_data = 2;
+	clock_gettime(CLOCK_MONOTONIC, &start);
+	ret = io_uring_submit(&ring);
+	clock_gettime(CLOCK_MONOTONIC, &end);
+	if (ret != 2 || elapsed_ms(&start, &end) > 500) {
+		fprintf(stderr, "fixed=%d: submit returned %d after %ld ms\n",
+			fixed, ret, elapsed_ms(&start, &end));
+		failed = 1;
+	}
+	failed |= wait_completions(&ring, sizeof(buf));
+	pthread_join(release, NULL);
+	pthread_join(consumer, NULL);
+	if (reader.ret != 1) {
+		fprintf(stderr, "consumer: %d\n", reader.ret);
+		failed = 1;
+	}
+	io_uring_queue_exit(&ring);
+	close(slave);
+	close(master);
+	return failed ? T_EXIT_FAIL : T_EXIT_PASS;
+}
+
+struct drain {
+	int fd;
+	atomic_int done;
+};
+
+static void *drain_output(void *arg)
+{
+	struct drain *d = arg;
+	char buf[4096];
+
+	usleep(1000000);
+	while (!atomic_load(&d->done)) {
+		if (read(d->fd, buf, sizeof(buf)) < 0 && errno != EAGAIN)
+			break;
+		usleep(1000);
+	}
+	return NULL;
+}
+
+static int test_write(void)
+{
+	struct __kernel_timespec timeout = { .tv_nsec = 100000000 };
+	struct io_uring ring;
+	struct io_uring_sqe *sqe;
+	struct timespec start, end;
+	struct drain drain = { .done = 0 };
+	pthread_t reader;
+	char buf[65536] = { 0 };
+	int master, slave, ret, failed = 0;
+
+	master = posix_openpt(O_RDWR | O_NOCTTY | O_NONBLOCK);
+	if (master < 0 || grantpt(master) || unlockpt(master))
+		return T_EXIT_FAIL;
+	slave = open(ptsname(master), O_RDWR | O_NOCTTY);
+	if (slave < 0 || io_uring_queue_init(8, &ring, 0))
+		return T_EXIT_FAIL;
+	drain.fd = master;
+	if (pthread_create(&reader, NULL, drain_output, &drain))
+		return T_EXIT_FAIL;
+	sqe = io_uring_get_sqe(&ring);
+	io_uring_prep_write(sqe, slave, buf, sizeof(buf), 0);
+	sqe->flags = IOSQE_IO_LINK;
+	sqe->user_data = 1;
+	sqe = io_uring_get_sqe(&ring);
+	io_uring_prep_link_timeout(sqe, &timeout, 0);
+	sqe->user_data = 2;
+	clock_gettime(CLOCK_MONOTONIC, &start);
+	ret = io_uring_submit(&ring);
+	clock_gettime(CLOCK_MONOTONIC, &end);
+	if (ret != 2 || elapsed_ms(&start, &end) > 500) {
+		fprintf(stderr, "write submit returned %d after %ld ms\n",
+			ret, elapsed_ms(&start, &end));
+		failed = 1;
+	}
+	failed |= wait_completions(&ring, sizeof(buf));
+	atomic_store(&drain.done, 1);
+	pthread_join(reader, NULL);
+	io_uring_queue_exit(&ring);
+	close(slave);
+	close(master);
+	return failed ? T_EXIT_FAIL : T_EXIT_PASS;
+}
+
+static int test_multishot(int nonblock)
+{
+	struct __kernel_timespec timeout = { .tv_sec = 2 };
+	struct io_uring_buf_ring *br;
+	struct io_uring ring;
+	struct io_uring_sqe *sqe;
+	struct io_uring_cqe *cqe;
+	char buf[2][8];
+	int master, slave, ret, failed;
+
+	master = posix_openpt(O_RDWR | O_NOCTTY | (nonblock ? O_NONBLOCK : 0));
+	if (master < 0 || grantpt(master) || unlockpt(master))
+		return T_EXIT_FAIL;
+	slave = open(ptsname(master), O_RDWR | O_NOCTTY);
+	if (slave < 0)
+		return T_EXIT_FAIL;
+	if (io_uring_queue_init(8, &ring, 0))
+		return T_EXIT_FAIL;
+	br = io_uring_setup_buf_ring(&ring, 2, 1, 0, &ret);
+	if (!br)
+		return ret == -EINVAL ? T_EXIT_SKIP : T_EXIT_FAIL;
+	io_uring_buf_ring_add(br, buf[0], sizeof(buf[0]), 0, 1, 0);
+	io_uring_buf_ring_add(br, buf[1], sizeof(buf[1]), 1, 1, 1);
+	io_uring_buf_ring_advance(br, 2);
+	if (write(slave, "a", 1) != 1)
+		return T_EXIT_FAIL;
+	sqe = io_uring_get_sqe(&ring);
+	io_uring_prep_read_multishot(sqe, master, 0, 0, 1);
+	sqe->user_data = 1;
+	if (io_uring_submit(&ring) != 1)
+		return T_EXIT_FAIL;
+	ret = io_uring_wait_cqe_timeout(&ring, &cqe, &timeout);
+	if (ret)
+		return T_EXIT_FAIL;
+	failed = cqe->res != 1 || !(cqe->flags & IORING_CQE_F_BUFFER) ||
+		 !!(cqe->flags & IORING_CQE_F_MORE) != nonblock;
+	if (failed)
+		fprintf(stderr, "multishot nonblock=%d: res=%d flags=%u\n",
+			nonblock, cqe->res, cqe->flags);
+	io_uring_cqe_seen(&ring, cqe);
+	if (nonblock) {
+		sqe = io_uring_get_sqe(&ring);
+		io_uring_prep_cancel64(sqe, 1, 0);
+		if (io_uring_submit_and_wait(&ring, 2) != 1)
+			failed = 1;
+	}
+	io_uring_free_buf_ring(&ring, br, 2, 1);
+	io_uring_queue_exit(&ring);
+	close(slave);
+	close(master);
+	return failed ? T_EXIT_FAIL : T_EXIT_PASS;
+}
+
+int main(int argc, char *argv[])
+{
+	cpu_set_t cpus;
+	int cpu, ret;
+
+	if (argc > 1)
+		return T_EXIT_SKIP;
+	alarm(15);
+	/* Keep the awakened reader behind the submitter until it sleeps. */
+	if (sched_getaffinity(0, sizeof(cpus), &cpus))
+		return T_EXIT_FAIL;
+	for (cpu = 0; cpu < CPU_SETSIZE; cpu++)
+		if (CPU_ISSET(cpu, &cpus))
+			break;
+	CPU_ZERO(&cpus);
+	CPU_SET(cpu, &cpus);
+	if (sched_setaffinity(0, sizeof(cpus), &cpus))
+		return T_EXIT_FAIL;
+	ret = test(0);
+	if (ret)
+		return ret;
+	ret = test(1);
+	if (ret)
+		return ret;
+	ret = test_multishot(0);
+	if (ret)
+		return ret;
+	ret = test_multishot(1);
+	if (ret)
+		return ret;
+	return test_write();
+}
-- 
2.55.0

